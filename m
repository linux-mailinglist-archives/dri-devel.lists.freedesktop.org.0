Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637D737ACA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306A210E3C4;
	Wed, 21 Jun 2023 05:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A7B10E3CE;
 Wed, 21 Jun 2023 05:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bvte7awAs9FxKmbYE+g+Pb+fygdbW03OVsQLvdJNAOARyzYgMGjcO00BNIRMpkn0IDgxJztmbKLzpw2acqS4rhAJ1vcSJeL1/rkOyoQkwcWkxv6rVFshb3PjV1x6ygtIT/cyS8kKtvJRK3497EFReKdYuFRD/OxYRcUTs5tEFqxNEM3yDWz8N8FN4AsoMgXsjvyol+EWwcyvGoghUbBw3930SbRtZVAz/0cYR5RJSxKQbnEiStK3cG+qH6i1nRw+WoNz7KihKe7IjsnIZ+saE74TvUDtZ8GpqOkX2ksQqUR0vCnuvcukj1AQdWn60RAQCwxFDbC3fq30jFHpZFq/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsI6VaYpP62y6kkaUAPmJ7wVYQgNVT499l60/J6MfyA=;
 b=UcZOn6pNBwQyci+tUhYwzMXCSVlpGi6BXiQoVGwVdJKOz9k/GQmD/qxi1mTxYDGJJfelPvUQ3Xxk/y8Rn53xFAdfGfnqiuqySAUGIBqJAoOtyzZBZA+I5NuYg92CAKsC6YyvReKbiN6RYN4YtoAqWmC2hqNvN6Y09dTEWbLIdWrzzziCOxiEGHBh1KU0uqSTByRroO07uVoMFzPcegDSXr2Mw7NE3d5UmBB3Maf7i9ceJI6fPJbj7+/c5fZsB0/lRUV6MtkRbFNc3wb+EANw9ptpod19sXt29/dN+jUbxJAtsnNU/GTNqqqQbaOfEJ70o3fPTyrlXldDwi+7EuNIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsI6VaYpP62y6kkaUAPmJ7wVYQgNVT499l60/J6MfyA=;
 b=tjAzY8hdDC+yxG5Qsiu2Z901+vDl0V0Kk3TOy6Ny6wk9Xn378zUxsuDelCyhmkzbkYs0+4sXIFoH5yqIl9h5w7D1xJgk8rmbYBCwhqrGiBI8+4W+0dJx59Ls1KWy85F8z1eUKT8DFGFT81yp8PBWQ6t57SxXj05nkTM2Mz3rOJo=
Received: from BY5PR17CA0035.namprd17.prod.outlook.com (2603:10b6:a03:1b8::48)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 05:49:35 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::2e) by BY5PR17CA0035.outlook.office365.com
 (2603:10b6:a03:1b8::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Wed, 21 Jun 2023 05:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 05:49:34 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:48:41 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <mario.limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <lijo.lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V4 6/8] drm/amd/pm: add flood detection for wbrf events
Date: Wed, 21 Jun 2023 13:46:01 +0800
Message-ID: <20230621054603.1262299-7-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621054603.1262299-1-evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3789f2-9ff4-4124-0e7c-08db721b4af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUzpRWQEWYmWrPk9zlElZDn7RQpXsmYO97SCxgsFJEkW7vj4/18JGdWGvVKP32qmY4ZSHIrJ4BhsPLTD5M8UbHkiuH577YzqsM0xTvO0TcfDA9fQr82FO5hJ9CR3/nGFuLwW0SZCYRmraNQhw7zjhfJXj1HLk8LGBbkUoi6dH6skVJaSOt2ogVDufAjHlkePb002RpZ8YNZ4AFdlGjh7XsdAw4Zj3lTaKEeu7wGdJ0GwYigJhGa8g6AZSoojBtlQo7QQhNoqOnej1SnnINKfGw+EnWVl8cBTlIFmRM7cRJ9sHzYbPT6GqngnDY+Nt+Ni1IL/kl2o8T7PW6TmZFL6tio0dUwN7aVl6gIAl6m0zINaQRbpx63v24TC+N3UYkT4wMX2faGGciFRQ52YN9sqIfAdaxaQdgd+Iz2Xg8qeJ5vGQhxQNrGdscG2wwryvH8sxqycJX86NNq8J1zruXTmv8uu/nnyBKy3zcI8V61/M531WQYOQnCkUOZ0XBNubLBO9rsT3m1bEWpanfgHBvrmoS08rLDW9YAAMZ8vegz+GAJ+kX6y1o7RnEFthhUmi7lUY7tKKXjrQy4MUgRja0v+QTjdkPkrRoQTmz33fXcE9koi84xRsccSmSLLzmg03Nu7UoBw7gGyYQvDRi1OWi4kKXhdlBr6kAiKbcRBpHA9F2eO2/wRfoLMZYIIYPp/C0Oc8V6aWGPA2HVZHT/EtT3vsGYSPtJkV5yoNfT+gntXJIMpel4NZ72uS1ozwFHJ/q18y02dgVRLZxzquAbWq96eUEw+hXrLo+Hb0O/Gyx9lKtTNLSXXWYHeeB2Etno4ftkEAeqzVcb3LbxbmDyY+Ho5LQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(82740400003)(40480700001)(8936002)(40460700003)(41300700001)(8676002)(82310400005)(921005)(2616005)(6666004)(356005)(426003)(336012)(83380400001)(81166007)(186003)(16526019)(26005)(478600001)(7696005)(47076005)(54906003)(86362001)(110136005)(316002)(36756003)(4326008)(70206006)(1076003)(44832011)(70586007)(36860700001)(5660300002)(7416002)(2906002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:49:34.6614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3789f2-9ff4-4124-0e7c-08db721b4af1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To protect PMFW from being overloaded.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 28 ++++++++++++++++---
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index a8efdce4607c..75d6e654b2a6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1272,6 +1272,22 @@ static void smu_wbrf_event_handler(struct amdgpu_device *adev)
 {
 	struct smu_context *smu = adev->powerplay.pp_handle;
 
+	schedule_delayed_work(&smu->wbrf_delayed_work,
+			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
+}
+
+/**
+ * smu_wbrf_delayed_work_handler - callback on delayed work timer expired
+ *
+ * @work: struct work_struct pointer
+ *
+ * Flood is over and driver will consume the latest exclusion ranges.
+ */
+static void smu_wbrf_delayed_work_handler(struct work_struct *work)
+{
+	struct smu_context *smu =
+		container_of(work, struct smu_context, wbrf_delayed_work.work);
+
 	smu_wbrf_handle_exclusion_ranges(smu);
 }
 
@@ -1311,6 +1327,9 @@ static int smu_wbrf_init(struct smu_context *smu)
 	if (!smu->wbrf_supported)
 		return 0;
 
+	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
+			  smu_wbrf_delayed_work_handler);
+
 	ret = amdgpu_acpi_register_wbrf_notify_handler(adev,
 						       smu_wbrf_event_handler);
 	if (ret)
@@ -1321,11 +1340,10 @@ static int smu_wbrf_init(struct smu_context *smu)
 	 * before our driver loaded. To make sure our driver
 	 * is awared of those exclusion ranges.
 	 */
-	ret = smu_wbrf_handle_exclusion_ranges(smu);
-	if (ret)
-		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
+	schedule_delayed_work(&smu->wbrf_delayed_work,
+			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1343,6 +1361,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	amdgpu_acpi_unregister_wbrf_notify_handler(adev);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index ff0af3da0be2..aa63cc43d41c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -478,6 +478,12 @@ struct stb_context {
 
 #define WORKLOAD_POLICY_MAX 7
 
+/*
+ * Configure wbrf event handling pace as there can be only one
+ * event processed every SMU_WBRF_EVENT_HANDLING_PACE ms.
+ */
+#define SMU_WBRF_EVENT_HANDLING_PACE	10
+
 struct smu_context
 {
 	struct amdgpu_device            *adev;
@@ -576,6 +582,7 @@ struct smu_context
 
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

