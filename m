Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2974D038
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0162410E238;
	Mon, 10 Jul 2023 08:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23CC10E238;
 Mon, 10 Jul 2023 08:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMlBFXMkjT1t/gUKX1Hnymtz1KRfH9WfwmMD/MVTVny4W0TEs9n/CdhE8XNUOLs4+j40/Whs6V6QvBCr63sisOtpRwDAGrahuHPruMHekJ1/AqEHos61psxi+Moi7G5bqttxz5AoazxD6E4oITR766gqXZsAC28m6Y0zbUq8Lr6IllJ/vV+fbJ4FFVtBKCEZRRt0TBbpwvJ970kpWLZWQG482X01dW/Zntw3F2mvmuOdX7hRhrw/RTgal8YFQ5NaQbpGevGIBrFgQha0qHFEaACY3v1O2oWeo7QY23T/XJzmt68X2aZzQPBiasPMZkGe1hHLUmhI8pgWkpjO7pWaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sPe2V6z4UQD/GNd2ywlKWmEsAmMimRgeNITaxFFJck=;
 b=e0TolsP3gbsmBoJAP+c2b7rOk3gjLNfj3iN1ogATMgt/+2VeFUIUQaMx764gXTU7NAhYg3LzJmNpyFMB72rv5N6qEymLQQQUNsuuVCfESkXaPp0iFL43LdpC/7Hpiji6uNJ7PC1X/hHAgljd8rKdHhGAiCvjG9RislKosUQUq2Bx4AzsbHMEGHtpEHaT8fjhHNSLSkH8up09F5Ih/nwdt8PX2fNSJlIZPzGSmXXneFBZTzFKPHkqyH0G31WdL6wDhT7ek1jUQ5vOi/iYH9gERiR3O1KVkKm0yIgrKuQeTKvMpscyLdRYzuMAGr8gqMPjzttZ5aOdNxvVtDZOINg0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sPe2V6z4UQD/GNd2ywlKWmEsAmMimRgeNITaxFFJck=;
 b=s2EqpvHeCEMaPdKDBWmFcR/5PMUtj4r4v4XoX9CDg9QmFTett4WJto/TnEs13qtOWoOHNlP7pDuSCuC0iF9QQYZewiL/LwC03kkyYJX50wNhF3/3qOr5zQz4m3W2r6gw5AF0ek0QwLyw+GPhph8bLp4XlLO5nVSZW09s2kEfCIE=
Received: from MW4PR03CA0130.namprd03.prod.outlook.com (2603:10b6:303:8c::15)
 by BL0PR12MB4882.namprd12.prod.outlook.com (2603:10b6:208:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 08:39:41 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::ba) by MW4PR03CA0130.outlook.office365.com
 (2603:10b6:303:8c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 08:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:39:40 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:39:31 -0500
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
Subject: [PATCH V6 6/9] drm/amd/pm: setup the framework to support Wifi RFI
 mitigation feature
Date: Mon, 10 Jul 2023 16:36:38 +0800
Message-ID: <20230710083641.2132264-7-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710083641.2132264-1-evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT060:EE_|BL0PR12MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 2befd1fe-2676-41e6-41e3-08db812133fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G7EGCZ/imY53AwY2ywa/j0nerh2c85shY1+dW72h3lBekm8dybt391GJR7hNo29qOxwXH9dYLEKmvJlYHAFYF3UXYt6FcavdlMPC7DaI+6bZUPo4Z4AkQXXX6sIV+5Eg+zOPeD/mxiyikBhfbndPc51EKfoS6U1PdrWJjqibrOjMSurIx3XBZ16Mzbupzb/UqxeJoBoJVBpbfhaP9lqP45bT0qFs03SZ7utAtmkXWCe/R+IdQrqv4YLor5nLruNppr9ueCSC0PR+ynripPg9b4ETPpKs/pS6rsKgiShE4Xe3LsjOCPXxdNACZWVT2/Y/bLqAy03NIZzqXTryy3pmAesCD5rSjVW9aRDFlXk9mKfdZf890SdkjK0PHewbq7lUWLb4KA0vKff7kxr2/E91/4tYhFpKlwRahVGgJUZ+D+XpymZENC8Cvzqx6b98VPhF4RrXyoPLIqJXHqyYEietxgdzLYSXnQoHQfppy8zcmpoHj6LbCwgG60fFpTOchP5+LcjspRMVHiNsSABppP8Fwc7HM7dc2FFsafXOnEhak5Q6RqgDXGEd3Bw01ilT37pJFJ1crWjEsGBqtU/VUXKpWDVmurYfOUmNbLLr5D3LbSQbTKZXdnoii4tZNEeDH5fv8jq0tyydAxv29t46vFcyZo1prF4xRLqmnjRMBFwP18hWLt60GfaibibnOBCKEwl5sYcPSItQl45giCAkfvY9oE4ZkTDmNXfeUpwerS8XtAY25aoJFW3Gy3uhbkVzOCSAqLxQ7ia61PfaEK7XYNPqkdbDOd5/B6IXg48EqNmeTtPVjX9OMEbUYEbKH9SbFyDWPgAGLw3Us9BLufP2Sq2f+HsF6uP+r2aTwJPg8icMC9RPBjekNePb3LNQqjKY9Jga
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(396003)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(7696005)(4326008)(54906003)(110136005)(26005)(1076003)(186003)(16526019)(30864003)(2906002)(82310400005)(41300700001)(8676002)(8936002)(44832011)(70586007)(70206006)(316002)(5660300002)(7416002)(356005)(81166007)(921005)(82740400003)(40460700003)(86362001)(47076005)(2616005)(426003)(83380400001)(336012)(40480700001)(36860700001)(36756003)(2101003)(83996005)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:39:40.7412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2befd1fe-2676-41e6-41e3-08db812133fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4882
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

With WBRF feature supported, as a driver responding to the frequencies,
amdgpu driver is able to do shadow pstate switching to mitigate possible
interference(between its (G-)DDR memory clocks and local radio module
frequency bands used by Wifi 6/6e/7).

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
--
v1->v2:
  - update the prompt for feature support(Lijo)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 194 ++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  23 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 5 files changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 02b827785e39..785d9b43f0c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -241,6 +241,7 @@ extern int amdgpu_num_kcq;
 #define AMDGPU_VCNFW_LOG_SIZE (32 * 1024)
 extern int amdgpu_vcnfw_log;
 extern int amdgpu_sg_display;
+extern int amdgpu_wbrf;
 
 #define AMDGPU_VM_MAX_NUM_CTX			4096
 #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 393b6fb7a71d..d4f3921509a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -191,6 +191,7 @@ int amdgpu_smartshift_bias;
 int amdgpu_use_xgmi_p2p = 1;
 int amdgpu_vcnfw_log;
 int amdgpu_sg_display = -1; /* auto */
+int amdgpu_wbrf = -1;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
@@ -948,6 +949,24 @@ MODULE_PARM_DESC(smu_pptable_id,
 	"specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
 module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
 
+#if IS_ENABLED(CONFIG_WBRF)
+/**
+ * DOC: wbrf (int)
+ * Enable Wifi RFI interference mitigation feature.
+ * Due to electrical and mechanical constraints there may be likely interference of
+ * relatively high-powered harmonics of the (G-)DDR memory clocks with local radio
+ * module frequency bands used by Wifi 6/6e/7. To mitigate the possible RFI interference,
+ * with this feature enabled, PMFW will use either “shadowed P-State” or “P-State” based
+ * on active list of frequencies in-use (to be avoided) as part of initial setting or
+ * P-state transition. However, there may be potential performance impact with this
+ * feature enabled.
+ * (0 = disabled, 1 = enabled, -1 = auto (default setting, will be enabled if supported))
+ */
+MODULE_PARM_DESC(wbrf,
+	"Enable Wifi RFI interference mitigation (0 = disabled, 1 = enabled, -1 = auto(default)");
+module_param_named(wbrf, amdgpu_wbrf, int, 0444);
+#endif
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 2ddf5198e5c4..83d428e890df 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1188,6 +1188,173 @@ static int smu_get_thermal_temperature_range(struct smu_context *smu)
 	return ret;
 }
 
+/**
+ * smu_wbrf_handle_exclusion_ranges - consume the wbrf exclusion ranges
+ *
+ * @smu: smu_context pointer
+ *
+ * Retrieve the wbrf exclusion ranges and send them to PMFW for proper handling.
+ * Returns 0 on success, error on failure.
+ */
+static int smu_wbrf_handle_exclusion_ranges(struct smu_context *smu)
+{
+	struct wbrf_ranges_out wbrf_exclusion = {0};
+	struct exclusion_range *wifi_bands = wbrf_exclusion.band_list;
+	struct amdgpu_device *adev = smu->adev;
+	uint64_t start, end;
+	int ret, i, j;
+
+	ret = wbrf_retrieve_exclusions(adev->dev, &wbrf_exclusion);
+	if (ret) {
+		dev_err(adev->dev, "Failed to retrieve exclusion ranges!\n");
+		return ret;
+	}
+
+	/*
+	 * The exclusion ranges array we got might be filled with holes and duplicate
+	 * entries. For example:
+	 * {(2400, 2500), (0, 0), (6882, 6962), (2400, 2500), (0, 0), (6117, 6189), (0, 0)...}
+	 * We need to do some sortups to eliminate those holes and duplicate entries.
+	 * Expected output: {(2400, 2500), (6117, 6189), (6882, 6962), (0, 0)...}
+	 */
+	for (i = 0; i < MAX_NUM_OF_WBRF_RANGES; i++) {
+		start = wifi_bands[i].start;
+		end = wifi_bands[i].end;
+
+		/* get the last valid entry to fill the intermediate hole */
+		if (!start && !end) {
+			for (j = MAX_NUM_OF_WBRF_RANGES - 1; j > i; j--)
+				if (wifi_bands[j].start &&
+				    wifi_bands[j].end)
+					break;
+
+			if (j > i) {
+				wifi_bands[i].start = wifi_bands[j].start;
+				wifi_bands[i].end = wifi_bands[j].end;
+				wifi_bands[j].start = 0;
+				wifi_bands[j].end = 0;
+			}
+
+			continue;
+		}
+
+		/* eliminate duplicate entries */
+		for (j = i + 1; j < MAX_NUM_OF_WBRF_RANGES; j++) {
+			if ((wifi_bands[j].start == start) &&
+			     (wifi_bands[j].end == end)) {
+				wifi_bands[j].start = 0;
+				wifi_bands[j].end = 0;
+				continue;
+			}
+		}
+	}
+
+	/* Send the sorted wifi_bands to PMFW */
+	ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
+	/* Give it another chance */
+	if (unlikely(ret == -EBUSY)) {
+		mdelay(5);
+		ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
+	}
+
+	return ret;
+}
+
+/**
+ * smu_wbrf_event_handler - handle notify events
+ *
+ * @nb: notifier block
+ * @action: event type
+ * @data: event data
+ *
+ * Calls relevant amdgpu function in response to wbrf event
+ * notification from kernel.
+ */
+static int smu_wbrf_event_handler(struct notifier_block *nb,
+				  unsigned long action, void *_arg)
+{
+	struct smu_context *smu = container_of(nb, struct smu_context,
+					       wbrf_notifier);
+
+	switch (action) {
+	case WBRF_CHANGED:
+		smu_wbrf_handle_exclusion_ranges(smu);
+		break;
+	default:
+		return NOTIFY_DONE;
+	};
+
+	return NOTIFY_OK;
+}
+
+/**
+ * smu_wbrf_support_check - check wbrf support
+ *
+ * @smu: smu_context pointer
+ *
+ * Verifies the ACPI interface whether wbrf is supported.
+ */
+static void smu_wbrf_support_check(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	smu->wbrf_supported = smu_is_asic_wbrf_supported(smu) &&
+			      !!amdgpu_wbrf &&
+			      wbrf_supported_consumer(adev->dev);
+
+	if (smu->wbrf_supported)
+		dev_info(adev->dev, "RF interference mitigation is supported\n");
+}
+
+/**
+ * smu_wbrf_init - init driver wbrf support
+ *
+ * @smu: smu_context pointer
+ *
+ * Verifies the AMD ACPI interfaces and registers with the wbrf
+ * notifier chain if wbrf feature is supported.
+ * Returns 0 on success, error on failure.
+ */
+static int smu_wbrf_init(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret;
+
+	if (!smu->wbrf_supported)
+		return 0;
+
+	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
+	ret = wbrf_register_notifier(&smu->wbrf_notifier);
+	if (ret)
+		return ret;
+
+	/*
+	 * Some wifiband exclusion ranges may be already there
+	 * before our driver loaded. To make sure our driver
+	 * is awared of those exclusion ranges.
+	 */
+	ret = smu_wbrf_handle_exclusion_ranges(smu);
+	if (ret)
+		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
+
+	return ret;
+}
+
+/**
+ * smu_wbrf_fini - tear down driver wbrf support
+ *
+ * @smu: smu_context pointer
+ *
+ * Unregisters with the wbrf notifier chain.
+ */
+static void smu_wbrf_fini(struct smu_context *smu)
+{
+	if (!smu->wbrf_supported)
+		return;
+
+	wbrf_unregister_notifier(&smu->wbrf_notifier);
+}
+
 static int smu_smc_hw_setup(struct smu_context *smu)
 {
 	struct smu_feature *feature = &smu->smu_feature;
@@ -1280,6 +1447,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 	if (ret)
 		return ret;
 
+	/* Enable UclkShadow on wbrf supported */
+	if (smu->wbrf_supported) {
+		ret = smu_enable_uclk_shadow(smu, true);
+		if (ret) {
+			dev_err(adev->dev, "Failed to enable UclkShadow feature to support wbrf!\n");
+			return ret;
+		}
+	}
+
 	/*
 	 * With SCPM enabled, these actions(and relevant messages) are
 	 * not needed and permitted.
@@ -1376,6 +1552,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 	 */
 	ret = smu_set_min_dcef_deep_sleep(smu,
 					  smu->smu_table.boot_values.dcefclk / 100);
+	if (ret) {
+		dev_err(adev->dev, "Error setting min deepsleep dcefclk\n");
+		return ret;
+	}
+
+	/* Init wbrf support. Properly setup the notifier */
+	ret = smu_wbrf_init(smu);
+	if (ret)
+		dev_err(adev->dev, "Error during wbrf init call\n");
 
 	return ret;
 }
@@ -1431,6 +1616,13 @@ static int smu_hw_init(void *handle)
 		return ret;
 	}
 
+	/*
+	 * Check whether wbrf is supported. This needs to be done
+	 * before SMU setup starts since part of SMU configuration
+	 * relies on this.
+	 */
+	smu_wbrf_support_check(smu);
+
 	if (smu->is_apu) {
 		ret = smu_set_gfx_imu_enable(smu);
 		if (ret)
@@ -1583,6 +1775,8 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
 
+	smu_wbrf_fini(smu);
+
 	cancel_work_sync(&smu->throttling_logging_work);
 	cancel_work_sync(&smu->interrupt_work);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 09469c750a96..5b2343cfc69b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -22,6 +22,8 @@
 #ifndef __AMDGPU_SMU_H__
 #define __AMDGPU_SMU_H__
 
+#include <linux/wbrf.h>
+
 #include "amdgpu.h"
 #include "kgd_pp_interface.h"
 #include "dm_pp_interface.h"
@@ -573,6 +575,10 @@ struct smu_context
 	u32 debug_param_reg;
 	u32 debug_msg_reg;
 	u32 debug_resp_reg;
+
+	/* data structures for wbrf feature support */
+	bool				wbrf_supported;
+	struct notifier_block		wbrf_notifier;
 };
 
 struct i2c_adapter;
@@ -1354,6 +1360,23 @@ struct pptable_funcs {
 	 * @init_pptable_microcode: Prepare the pptable microcode to upload via PSP
 	 */
 	int (*init_pptable_microcode)(struct smu_context *smu);
+
+	/**
+	 * @is_asic_wbrf_supported: check whether PMFW supports the wbrf feature
+	 */
+	bool (*is_asic_wbrf_supported)(struct smu_context *smu);
+
+	/**
+	 * @enable_uclk_shadow: Enable the uclk shadow feature on wbrf supported
+	 */
+	int (*enable_uclk_shadow)(struct smu_context *smu,
+				  bool enablement);
+
+	/**
+	 * @set_wbrf_exclusion_ranges: notify SMU the wifi bands occupied
+	 */
+	int (*set_wbrf_exclusion_ranges)(struct smu_context *smu,
+					 struct exclusion_range *exclusion_ranges);
 };
 
 typedef enum {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
index ceb13c838067..67d7495ab49e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
@@ -97,6 +97,9 @@
 #define smu_get_default_config_table_settings(smu, config_table)	smu_ppt_funcs(get_default_config_table_settings, -EOPNOTSUPP, smu, config_table)
 #define smu_set_config_table(smu, config_table)				smu_ppt_funcs(set_config_table, -EOPNOTSUPP, smu, config_table)
 #define smu_init_pptable_microcode(smu)					smu_ppt_funcs(init_pptable_microcode, 0, smu)
+#define smu_is_asic_wbrf_supported(smu)					smu_ppt_funcs(is_asic_wbrf_supported, false, smu)
+#define smu_enable_uclk_shadow(smu, enablement)				smu_ppt_funcs(enable_uclk_shadow, 0, smu, enablement)
+#define smu_set_wbrf_exclusion_ranges(smu, exclusion_ranges)		smu_ppt_funcs(set_wbrf_exclusion_ranges, -EOPNOTSUPP, smu, exclusion_ranges)
 
 #endif
 #endif
-- 
2.34.1

