Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80B7590EE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722AF10E442;
	Wed, 19 Jul 2023 09:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4BF10E442;
 Wed, 19 Jul 2023 09:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGeDD8JoijW1rxCg7LcIidbV1GP+OsgDv5FaAW8o6BM1KJ6pNJbuiJJnFmlyvaYskoIqd2EFZKeU2j7p6viFrkjCgXrrFC1JmuAqfx/PvOcAn7Cp6tGhySQIYjI1uHEVyfAjnIwMdDOgoHe7Kajx9sDm3FYV0w35XNx/4fdjb208/fPZ0NKmj5C3fkXZ4OhsfGI2a779DYQSOy4TiZKsBladr3xg81hJ4gJkDgbGK0YUrZWcM9QH2MiTnEG/fvD0+VOxd5f81cmJTHmLfOV4928dj/hNgr4qdzr/Q7mucurtbgv4IZzjdsG6YRtet30f4tC3GYxULGWtGhIcBb+ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sPe2V6z4UQD/GNd2ywlKWmEsAmMimRgeNITaxFFJck=;
 b=cYIMYqoMr8KIUKViXsNzLL0WM4qDlrsbMspvL1/hN8j5yUM/3QE5R7gJ61x5MpPnwWDMp1p0cKLgFvh2nDDcjEUmQ+Fs0+wqsWQiU71imDbJAwtcnrXZKdF8ZRUk1+BttUS+X4kn1NOyPCOMQFtCW5RZyq8rgiUTaJIXCrExQJ+yY9bK66+1enLyiNaK4BNL4fxMSnztEAz+A2Fs8cehjnXQJznjgxABV7UtJn1/NWnrn8GCFmmOBYr4BDTRiZyCLZBcIcgPGV4z4PKl/EO7zgq9dnZvAcaMdA1LJfFAn0LM3Xy6ooZwB8xu+fMKUZO1+N6A7PR0Ju7uQPFXHuqBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sPe2V6z4UQD/GNd2ywlKWmEsAmMimRgeNITaxFFJck=;
 b=qh+jC0UCIPEntYAc8xKc94NSEgjloyzFl15rN8ZobZu5gUi87Aa1T8EsnzYCJDdrJy+S73r/j3fpkDCp81nJzjKhFc5oKyac1ErUC0aLkA3jxGUQ4Uyi0lhES2EMC2BeQ53f+kPe+JaAc+EfaXUVifn4AHZjb8A23ssKRw0igf4=
Received: from DM6PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:333::19)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 09:02:47 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::f1) by DM6PR03CA0086.outlook.office365.com
 (2603:10b6:5:333::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Wed, 19 Jul 2023 09:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.34 via Frontend Transport; Wed, 19 Jul 2023 09:02:46 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Jul
 2023 04:02:37 -0500
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
Subject: [PATCH V7 6/9] drm/amd/pm: setup the framework to support Wifi RFI
 mitigation feature
Date: Wed, 19 Jul 2023 17:00:17 +0800
Message-ID: <20230719090020.2716892-7-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719090020.2716892-1-evan.quan@amd.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|BY5PR12MB4163:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fcdac8-b502-47f1-9a21-08db8836ebc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGtvw8mXnztVuZYFMUSJLTYex62XFacfemAwWoYrrNJ6ft3xpdMsGWk8b8Lx835EMxcOpIj58C/zSQlOS9fL1QFYAUE25ihdnPGq+tIEV4HCYzeLPwkh5ZveVeUS7hZWwB7gErRMOEF1Tq5jeRQDIK68gZIEMw4wGedEqh+4DKLVCavSguAzpwejeDNGNpAbHGpsP5i4L5yv74hAyAjnH+JARFFKBpM890MnmyDEOYwyJp4yRYfK2gNnvJIne6HFy6yEJpmnsvX2tzNf5/xiM8idVlHzy+x5IYyzXnGqy9QFX4KbjscnnyET2RzXCowpCyVh/ANsya9V+dWF/aZJwNtQCvVhYnCLQA8VBea2pfOMwO2VhnevwDTXyvov85NCG4wx77Tl9TCNjzr6AasAL+X8QXS8DJsaIBukklWOMuGL9/uMU9VM8cq/EeqKYTCEDw+MZHkhgJCaJbK81MwVcHH+CMJEv64pJ64/nCf9bfNvpwT09Jil8uUjFFzn5aS5RHMsr0WmqFJL8P+36MAgn+BJScVTWDLqzqaihYtn805iSaBrL2t4gk/rcngipwlaXxtJLG0YH79Ho+0xvcDyG+IuZRljbO7o2Bb7E6ffdxNDYySWYX09TCGSj3N631sxeJMdKY/3A25Yz98K4RAkMGCGiJvtaIqnWpqz7nCwRsApd04Or9U6lzkWQniuX8v9rVBOSa7tB8Q7XfyItv8G7mnLLSWBfPTa5r2qc7cHXbRXdT00+zXZekyCkyS5UNSCb4DrktDuLJ2g5YV99zgJOmmY1VGLzUSmsqbxCR7uRpGcMF+RTEzoZ2jcrNuFaW/ASMqLg7y/pTB2PGo3eiHH5Q4lwoNxuRa+YQgDGht04k3X0xnBBe8mI84kacBBZNfq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(54906003)(81166007)(921005)(356005)(110136005)(82740400003)(6666004)(7696005)(70206006)(41300700001)(8676002)(8936002)(478600001)(316002)(5660300002)(70586007)(4326008)(36860700001)(16526019)(186003)(83380400001)(336012)(2616005)(26005)(1076003)(426003)(47076005)(86362001)(44832011)(30864003)(2906002)(36756003)(7416002)(83996005)(2101003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:02:46.7679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fcdac8-b502-47f1-9a21-08db8836ebc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
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

