Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7274398A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783ED10E3A0;
	Fri, 30 Jun 2023 10:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD86410E333;
 Fri, 30 Jun 2023 10:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbgOrIXI8ce34sGQP38ucKRBeIDL8HzSdPIKyMjX06YisUYwabxSNUMjxcbhe5R/AzucXon28ybkUmsHltynVXuRAMYhL03iSVQ/Ol2zOQAOXXb4UxtDZiOxov4/VZtaGbGbEIiZfCH0rm4roWBKh+wuNbE2nZmGWOZrL3ehGPnt0yJgPkjboi9lQejrmXxt3Hdf9qhKNdLQnfes6pyhXIuEgc+Jw0K9bezDD8YRAdizOQjmoxgKXOe2r6aEY6KMujc7mNCwuPZ3JkWcWVj24pNkJRf6z7CS7zmBv7BrolC8iKfTMhggTAHXX2qaHehu/z8wa5BZtF0VigEoV94ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYAs4talKNZ8KMt4uQMnwm8y018gFWvj/kcPWZLZv28=;
 b=N9VjYEaF5mCe98oTL6HPj6Q05gBh8fyaH6Pet8ivvgWR5YrdyPRqY+KBZnBsqnDAxAjLYqW4eVzkQni1STJR73bX/21cinxPDGgpppQ3osa7elev53HX1onlIsm2bZoBm/CBEoKFBNZeuL5mdIc3XChg5dqBG0KZXB1wi1j9YgXyMHeN2Ds5Pm07GS4fxLtkHMyK7pQU7QsK3WLNCNI5CbMRz2sbMhBy2klS7oremEcHpvHrqBh16Rhrr7YgbrUZUmxV7g8mFB4sPRTMQeqPeTt0C452bkFaiSeQ8De/Yiawasu9qq35ddqMCMXrm2JhwwWGjf5t4WTjyrNZxeGt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYAs4talKNZ8KMt4uQMnwm8y018gFWvj/kcPWZLZv28=;
 b=nWTVicR/8ak7/QzJEVScFFpHrwEjT773w/5OgTESQkhk7BoxUWkel17LDsz5sEEF2IZPrsUrS2Bbp08d9wZ/S4WGAOGWrZEnwpAAjNscRWEqU6dK+7E+Uw3Bm9Uf70qZ0QKEjRG5aFSOwrQd7qa+PYB1UW7Q1VdrAJ6fglD9BCU=
Received: from DS7PR03CA0023.namprd03.prod.outlook.com (2603:10b6:5:3b8::28)
 by BL1PR12MB5029.namprd12.prod.outlook.com (2603:10b6:208:31d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 10:35:18 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::bd) by DS7PR03CA0023.outlook.office365.com
 (2603:10b6:5:3b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 10:35:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.43 via Frontend Transport; Fri, 30 Jun 2023 10:35:18 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 05:34:55 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V5 7/9] drm/amd/pm: add flood detection for wbrf events
Date: Fri, 30 Jun 2023 18:32:38 +0800
Message-ID: <20230630103240.1557100-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630103240.1557100-1-evan.quan@amd.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|BL1PR12MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: 7833bc9d-7ec2-4e39-b6eb-08db7955b2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmqtBbdDxgjAY8+0rUz9iR0FpuCUlXPND42+8BKBc/67V7c96nvySjn9xFmgW2TWea1/srCOXyI2670QVcV2jk2Aihu7/xx1zLC2/CWvPnz6mxRGfcv+mnQcBGhbmyfoWAFumtSsPNBy5sEcW1f1+IZbi5IsKYUqhum5NnCyIv2aChLX9hD/7PHZ8in/Cu9CJ03NMTcoT2riBRLrZ0E4ABmmpqqf3SANfjV5wfrTK31kJq0P+8HYAv8qYx6TQfDtdOcFlN23Y8lZUXuK04/8OJhpnUnjnKEmzrUBklCsAt8il0f3jhHii9lcpUUvhmL2Bj+COmHHN/9x0j/Zfa6Tzj2TUNH7zjlIfrRHaB/k/BdDmFfLJLRtUAf4p06RAn0vglVp1aB7V51T674xKFeGrWp7H1QKy8sBXDHO7fNDrKjIRmR2wXXOYAUFgfiaiuBQirQcefrg7uvNAvIMY9OCWB5qXgyOhMqoQxKfyz6cpGGIxw3TQuvbgsvC0faraV80XcnS/SRooFOTiiua97TX4TQVqZZ/8JUUfRJVNjy2meueI8T7hLTIn1zXClXW+rBqn92jCQz/TBH1FbWpVjGpfhPfn08JbnQrzUw18/fJIC+ncNBfT1p6/DrcPE/t2Wv8TSkf6eH/XmqXk+TsqCyycgpTe4Dko1MOCCdSiiyKifvKvJVmRZSIZ+d6B4PxyKBNeZdRiNaUxBC75i0FmhuESSP+q2gq/JqbdQN/yigQj9yuJflVDjSzSHPCTt7HFAwbATqkaNEp0MghGHW7VjwL7cVwYVq7r4WRKI+xAW36vrqarnWNDtapi466Vyps7c8L9obRIyVDw1/ZyAbwQGOREg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(86362001)(54906003)(8936002)(8676002)(5660300002)(82310400005)(110136005)(7416002)(26005)(1076003)(44832011)(7696005)(478600001)(4326008)(70206006)(70586007)(41300700001)(316002)(6666004)(16526019)(186003)(2616005)(2906002)(47076005)(40460700003)(83380400001)(336012)(426003)(36860700001)(40480700001)(36756003)(82740400003)(921005)(356005)(81166007)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:35:18.3249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7833bc9d-7ec2-4e39-b6eb-08db7955b2eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029
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
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 30 +++++++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 83d428e890df..a4cfaf8a6f59 100644
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
@@ -1323,6 +1339,9 @@ static int smu_wbrf_init(struct smu_context *smu)
 	if (!smu->wbrf_supported)
 		return 0;
 
+	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
+			  smu_wbrf_delayed_work_handler);
+
 	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
 	ret = wbrf_register_notifier(&smu->wbrf_notifier);
 	if (ret)
@@ -1333,11 +1352,10 @@ static int smu_wbrf_init(struct smu_context *smu)
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
@@ -1353,6 +1371,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
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

