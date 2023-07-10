Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA474D03E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303A888867;
	Mon, 10 Jul 2023 08:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A5410E235;
 Mon, 10 Jul 2023 08:40:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDY11wFmYV2zCAb27pmkGgs7baTaJBrQbUDJNneS6xJLbMMBtH/znbbsrZW68ecE5SoQ+kUESbGp5ud2UB3E+4vG55iOsilYhHLXf5Dc+krndk0H3pTL8D7yz7gHZUnCJnzKBRV62ONXH66+IwnibGKGA7sMIFqaPuqBOqifENtjBt6lmnyDFHxZAGVlSf7O/VdV6rKp+5A/iERkXBP+PQ23XoX9OlSsdlBGdwjaXuDTB7rcq3jYaxrN7agrip+f1+qQYD/0drXbG6LcE1nTNA5gU4Ay1c3mYgF0FHtcn7NSaBe+5Nct3gwi9mzcmG3qeDdJTJSJ6nJ1aQ6LFFKOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOfMtK9uPCRjoqE44RI9oSOYI5o7ys3RsMEi8r5i9TA=;
 b=kk48iuUOKbgyeDpLFPHLpG9SP8NkjTbdR9rxHcmg5tAYOLiNW4LGaJJ/dFTr0ZEtUkHTkNpdMJ+AycDX/1AHDDHKHs95Rzxi15naHOWlGS/6cB4LMAeu+jiXrDTjxbiWQv5SGBNXFSa9a6JckIidD4O3VeKcxEHHuOmSldGWRfs0cRdbWMA54eM6iKnmbokZP9otv9bhvVe0cfjPmlxDSRzECNhOcheiAs86h8GgVpfmo+GYTs15MKmXuWDj+LZKYSCFRcgcn1UPNySQaDPGnwItNqP0SSKO9qclEi4a84wws/ZTMYyAsc6H2u7E8lsJXkueIrRnpFXbp3SLsPQTnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOfMtK9uPCRjoqE44RI9oSOYI5o7ys3RsMEi8r5i9TA=;
 b=PjO1G/lhLvdwp7Uhz7/yn0KQQltr+jIarAcUFmu2eIWTA3WsP9bj+tSy5vjaNt+IgJ7ahQ7zDWN8SgVH336Izl7JkIzt9zQO5dL1f6c88gp1c91mpCyXnPOmt9OAZO5aVI/k8+RVAVq/I0YcKCkKjOyDzV3PyhpdGHxj5tO50AY=
Received: from MW4PR03CA0279.namprd03.prod.outlook.com (2603:10b6:303:b5::14)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:39:56 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::b6) by MW4PR03CA0279.outlook.office365.com
 (2603:10b6:303:b5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Mon, 10 Jul 2023 08:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:39:56 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:39:40 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V6 7/9] drm/amd/pm: add flood detection for wbrf events
Date: Mon, 10 Jul 2023 16:36:39 +0800
Message-ID: <20230710083641.2132264-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710083641.2132264-1-evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT030:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4a24ca-74b1-430c-fbe8-08db81213d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aovI53qDsRjfPqIwVmaXjH7pFmB+DGqeXhcXfxjsnl2wCAwIcahw+/0cfPHTjHZTLYG/23JS+b552XnzbxzPUOwMDjnGl89nHRQ5UxHAPpRU0bmC0m+iTJvqPyM0zYoLwdaga3jlh+Tq+XrU5xZhMlCQ66NRJIF4Q6b6JoLrFavcfvjIhrmt1E8eT5I0eNrOirL4sUPMIwwLuxK+dWi8HvyM3yXIF5c52YTKpv+2BjZ16tgH3kcFoHUgsGGmkIHO3Mcwib5HOtnzNk12Tx1xmpjtvhpxkTXoNnrq19e5lpO6wU4lx1bvzXwNRWNfKfWBAN1ymn9tsu9dsBjDs2vUN8JSM9iPkONoK4KqN07MmsJyIkLvNyfUcyRKai6yg2nWQiQ3+HFVOzXDJz4wsY0hPZl2sYSu6ONgBh1vZpMoXJKlnlSjAmXQos11U1wDzWvOzU75EkLtyI8bu+kUDFFI9rCczOwULHELCI8s3Z/fVhm4qhh9C2RhIXzD6PBQZIyK3SiRSrnbsGaFKw5TalnavjVw/WBNHS1Gzp2W9Camu2de1fol05HxCgAvoCmXbHdoI04fwU6ahl5KCAS6IVfnzdfwLtUYVCEwyfeYtEMkfWq2wwiQDulHLFSVVkwLmagpceYUV4Nm9LimRguwcrYB9Mpb7QgeKbQnBh0ll1OtRkm7oXFKCSVA92DdiRv7C/lD/3excMFG+mSQMZI7vDAR0edL6/Hg+3zotZ31h9dqcAPGdIh3fq0l6yMFKdA8rvHsUFWl5dO/9BpuhflQu6OzzPoqz5Wyyli+XPvlEEihnMjJPmxWAtyEjzc0LnoF4/IwKsEAABVZJAMK09ZYf/irHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(186003)(16526019)(26005)(2616005)(1076003)(36860700001)(336012)(426003)(83380400001)(47076005)(41300700001)(4326008)(2906002)(316002)(44832011)(7416002)(5660300002)(8676002)(8936002)(478600001)(7696005)(70586007)(70206006)(110136005)(54906003)(40480700001)(36756003)(921005)(81166007)(356005)(82740400003)(86362001)(82310400005)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:39:56.1126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4a24ca-74b1-430c-fbe8-08db81213d20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089
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
 Evan Quan <evan.quan@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To protect PMFW from being overloaded.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 31 +++++++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 83d428e890df..aa7faeafc86b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1278,7 +1278,8 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 
 	switch (action) {
 	case WBRF_CHANGED:
-		smu_wbrf_handle_exclusion_ranges(smu);
+		schedule_delayed_work(&smu->wbrf_delayed_work,
+				      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 		break;
 	default:
 		return NOTIFY_DONE;
@@ -1287,6 +1288,21 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
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
+	smu_wbrf_handle_exclusion_ranges(smu);
+}
+
 /**
  * smu_wbrf_support_check - check wbrf support
  *
@@ -1317,12 +1333,14 @@ static void smu_wbrf_support_check(struct smu_context *smu)
  */
 static int smu_wbrf_init(struct smu_context *smu)
 {
-	struct amdgpu_device *adev = smu->adev;
 	int ret;
 
 	if (!smu->wbrf_supported)
 		return 0;
 
+	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
+			  smu_wbrf_delayed_work_handler);
+
 	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
 	ret = wbrf_register_notifier(&smu->wbrf_notifier);
 	if (ret)
@@ -1333,11 +1351,10 @@ static int smu_wbrf_init(struct smu_context *smu)
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
@@ -1353,6 +1370,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	wbrf_unregister_notifier(&smu->wbrf_notifier);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 5b2343cfc69b..5df28d4a8c30 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -480,6 +480,12 @@ struct stb_context {
 
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
@@ -579,6 +585,7 @@ struct smu_context
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
 	struct notifier_block		wbrf_notifier;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

