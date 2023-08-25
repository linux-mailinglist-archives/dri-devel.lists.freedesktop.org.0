Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830F788262
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0850810E63F;
	Fri, 25 Aug 2023 08:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B880710E631;
 Fri, 25 Aug 2023 08:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiR/GFB1B/fDrUAPVlWx0kigW5sjAXV359Cm4nN8c0nXzXu8grsvUgkG2IQhKdrRkfxZpun3l9QCnZaW+rcw7gddcLFwvmzKMwKOWG85wKDQ+qxSkWyR+Rx3DfrSd9CZUXHVFz61qa0DAs46yCJ5laahsOA01IAi5zwEh8b0ARxgLA52igtyMVskhuCglcCBNnW/j2RIa/HwlFrqo6x8eoyGnpWX0Doknwcak+M1Xoz5mIoMZI5jVK1AA9T7JanDam/Sq88aagovj7SQp7aHzfNPCSJvEWR3ke1dEF/GgqZdz4+Zxt7zMsJsdGI7vansV/lg8ZMVikjk3YNzOEV1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6BMn9fvUWPK0phg5Zu79cLUHcH5IdCVYo7umLMeBeI=;
 b=SrGbSunYPdlpinT2u2Aj8aOhcBkAvLrK2W8vj5KBqbfT4B1xhr3mEa9kY24LVRfKhmKoNE9UyVG9niIr3/Z/qmCmHjV+gOyUyU+XrzOFqI6kmvWFhaP6SVH7aLebRp8Hivr8TZVfAXoOzFzB0cJWNz44R4i7GlP/TnKvstXdbetWc7Pw0JkLH2Hs9kHOh5IZeeecPUD1OZg+Sqc4b1A4RY8bHwz8qx81DIC7LAaXnsvbPx6CIPEktiW3b4ugqQkshW37vmHDu7RLvFVQvoBpGzTGl1pRxcfGG0z2k+59FNg72Fp1kfrXi1uRJJ27Emr+WeQQFkpyLm2vVbWVJTLupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6BMn9fvUWPK0phg5Zu79cLUHcH5IdCVYo7umLMeBeI=;
 b=yzHa9qTvhJflX7qhrzO01c1RGCjckdyUFl+kTdLyb6u/0vN3H0XF0DhtUMI3bUEhYisO/nB812VCg05TPvk/pwbasIzML2BZM+8fDNsQX1TJpG6i/8JB2rmehPwb3Zup9RE/pR6aOPlopdnhvOwSEwsfhuc+WHiLJ6UCQVe0Oms=
Received: from BYAPR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:40::25)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:41:07 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::71) by BYAPR04CA0012.outlook.office365.com
 (2603:10b6:a03:40::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.28 via Frontend
 Transport; Fri, 25 Aug 2023 08:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:41:06 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:41:00 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V10 6/8] drm/amd/pm: add flood detection for wbrf events
Date: Fri, 25 Aug 2023 16:38:44 +0800
Message-ID: <20230825083846.4001973-7-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825083846.4001973-1-evan.quan@amd.com>
References: <20230825083846.4001973-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 472362b4-eb92-435f-b6b1-08dba54705f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sGa/JDv7975rfgSDB7Iod5bQYdgIAm+0BALSWMS2zq3Y3+QEOvLcPz3bCmwwTPTcNxup7IJzwtP7IW3f9YYkfg9ANTQp9YVsJud65XGVknc4fidL4IkktenHrQDYDgutxTghQE57rLD6jDFdjSiF4CktH8g6tRimZv4GPtK4FLqdVhtFVq8s06b+mrTWpyfc/pR6YtPFsDHYn5lm3tHaHhwxzoKkBHZoKhFpfzBg7lp+2yb0Z+bVLGO9d2Ad6aVTDyOJt0/LmDYJMwBSIbbRlQqZiagANS1oG8hpw6hjH5TTDkxIMCh/btd+yz7OzCbwcVtHmboyF0TiYonxJy28TijWfbP2oRR42sTmMdnaogfDaIDjZoj7Tif5OuBwC99NJHz/62LJD0UEJqPM7+ARmytGN8hCJVBXbJL17F3THeBreFVh0UgmmjpgbVzhJr/j8UbOw4Dq48jupUHBMYiWP0qTH0ZzF3csyWmRw3tQJpH+Aifz4ooDfKTyP+KCglFgL9x9E4SNJ//itsNQ9OQhefWsGXBp+UOw6LcoGKpABqSSJW47lsPQUql0rzdG71OEK6+EhMdHupHd56vwM43c+wppe75zb7ObzxH+c8L/QWdCBfiFr3EVAlUCDhW4x4uoT7O61YB2xw5MdiNXrLFhK1/3UmnfP5IGC3Q/tVeA23EceiM3b1qZpUgbxGRFMrFdV4Kd7T8hgznj5sjSBzcBACQKAaSI9rmATTiHeu2CmwXhkYSiJZ16tFH+kw980JqnJqMemP0yIS74atSPFWHngOX4kZ3L3XJIv8q/gGxF8c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(1076003)(2616005)(5660300002)(8936002)(4326008)(8676002)(336012)(426003)(47076005)(36756003)(7416002)(83380400001)(36860700001)(44832011)(26005)(16526019)(82740400003)(356005)(921005)(6666004)(81166007)(40480700001)(70206006)(70586007)(54906003)(6636002)(316002)(110136005)(478600001)(41300700001)(2906002)(86362001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:41:06.1832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 472362b4-eb92-435f-b6b1-08dba54705f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723
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
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 31 +++++++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index bdfd234d1558..7519dc6b0f5d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1319,7 +1319,8 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 
 	switch (action) {
 	case WBRF_CHANGED:
-		smu_wbrf_handle_exclusion_ranges(smu);
+		schedule_delayed_work(&smu->wbrf_delayed_work,
+				      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 		break;
 	default:
 		return NOTIFY_DONE;
@@ -1328,6 +1329,21 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
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
@@ -1358,12 +1374,14 @@ static void smu_wbrf_support_check(struct smu_context *smu)
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
 	ret = acpi_amd_wbrf_register_notifier(&smu->wbrf_notifier);
 	if (ret)
@@ -1374,11 +1392,10 @@ static int smu_wbrf_init(struct smu_context *smu)
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
@@ -1394,6 +1411,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	acpi_amd_wbrf_unregister_notifier(&smu->wbrf_notifier);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 3eb1c72a76f1..60d595344c45 100644
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
@@ -581,6 +587,7 @@ struct smu_context
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
 	struct notifier_block		wbrf_notifier;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

