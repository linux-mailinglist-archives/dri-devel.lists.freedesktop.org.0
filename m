Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D179729105
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993D10E642;
	Fri,  9 Jun 2023 07:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3B610E649;
 Fri,  9 Jun 2023 07:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHFg8UYLaILZtkPi/+xWHWqrjW/j0vgJmt21dghpPiM41FzbberavDoDZk3flsDKqcm4LRSDmkU0knSrRRojg8+kZNnpzHwb2SeNBUwBTUu0Vs0Tjie2uguI2Yp35LpkQqlvxkY8H9KWuVmo7ryDfrTKPg09R6Lh5O0DotJtCrcsKhry8zIVrHskfW8au1RWfAOl+mS3J0MFc1OtntVZVQnukVuqpNdcR77nqnBHgPvKosLhdJvrN/q8kuTnZuXQuB0aw610M98IQjFvAbQQ/2SJaf1nSYOHswRITvASm4beuu0Ney9f/PNg7K33Dls26V0ZuKDkmUzs4exkOheW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cxmbpsm/4sUmxmXjFAyn1x8zoUJQHaEi9+50JKULWM=;
 b=YYpHxAocHzzoQibwPoLv2Qg9UqmNaZrkZ6FjHDSSeEknOeVS7Jiz7dibLRO1+JRJhpTPvRMwgUGHPTWZ4xb779FT4Vh/Qm1zUpwrYukCrg9qACPwpaTcGIxE9ViH2FuOz686TyU4VAzEQkFpRuGbqD1AyKvxZ1MDkC8KGUaNJdyWOPbXfcBmYmGkZTxYUJGGdDv7qv/AkBSrekMiXOpm/Ka2MqGVJ9TzKUcuCx8cRgH0DRbpUH1/y2DaaYM6peY43QPFYIyA0p42Vku2uXeeUwd6AeSndyeP7EYLSNSXY191s49/zJ5o53m+RMnf9fOwBp522PEmG6ZPtV+/iu4yYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cxmbpsm/4sUmxmXjFAyn1x8zoUJQHaEi9+50JKULWM=;
 b=rnMyYQ1SaNvb5uTgd5VisqpzCFngD/flHDBqIeiWuqbXpdEu0gGmUF6SJzabJ8VgUdYWBtgTSNhp4QffCCKRqOQ7w7u3jaF0fdOt9yozHRXvqImPndoaS5komvdADX4P8a07PvKAs7JQyAgcW9Z56Zknxb3pw1THoYcyl5Ex05E=
Received: from DM6PR05CA0050.namprd05.prod.outlook.com (2603:10b6:5:335::19)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 07:29:43 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::a7) by DM6PR05CA0050.outlook.office365.com
 (2603:10b6:5:335::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.25 via Frontend
 Transport; Fri, 9 Jun 2023 07:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Fri, 9 Jun 2023 07:29:43 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 02:29:37 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V2 4/7] drm/amd/pm: setup the framework to support Wifi RFI
 mitigation feature
Date: Fri, 9 Jun 2023 15:28:43 +0800
Message-ID: <20230609072846.1552238-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609072846.1552238-1-evan.quan@amd.com>
References: <20230609072846.1552238-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 504fb5be-e2ba-45b0-ff98-08db68bb4b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNZJ7DLMLsYbBR/JmFypW+bBaB7RkwzkPE0fTFILnNtY/W37u7kVYwwceddCpEVqie3eZm6aoPwy7UH9qC5AriYUVqq8Nz0PAe4VTjrrqaTwwIcbTWI0I4BGAFb7+G3UqfmNApJ9lVCmwrYsPVX7v85y3o/9h/yJDsc8ajdOSpZk8UZEB0TYAxz7tBkRw7qBqRoOuevliZ9rZR+wLepGqrSOtvALs6/depp14wKACXR6fipmPxbB8x3MsurSHq9Pu+RazRzJzr/BKwLQzCOUbqCTvifda6Tfnlwmk+1kfOG1ON6DhRAd3wmCUipzjbdJOdt0d++neD5yf5xEdyp59pUzRb2aMh+fPOmkuS6W21Wz5WmGa1DC1ID768n05bZfRbZMARNxnz4WFb6aS8cttRF5ndo5vC+m2Gvq3XP/bQGE00foPvraytdSudFt+vjBRXMPQuD6drjuKn9EdcmDlNryffnGJwcFUHgYjEw0A0wdgpZaEvG8BnBAtYeZ/CpkNtv9ZKGYE72zt5lawGixoG1Q9k/pF9rmt7L3osBzkV42QBZHtXp34iIluq7MTE6QSJZ27sH7wlQ0zkFN2atC1yiUvOE/gfNaqcWALm+NJ8u8iGqqkzG7WwOlEozTXbnD8qwdO8xVMdzQXI0hGkRTIXaEEHhqxiIUfnXdJ2285DFXpKbe3iE55dh2K3J7YpUyJwDlANBbRoDOPxmEvp/Q0zbOjwQJSIlRB/cyg+yhCLAVmasTnNVAo8KSIJ6YfKvjSSRHmZ9XPWZ8u+EnPR0fYJj+pj9HuYT4tq9aQMRsO+007VIxH1WwkbP9CeB21Pzp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(7696005)(316002)(40460700003)(41300700001)(336012)(426003)(2616005)(82310400005)(30864003)(86362001)(36860700001)(83380400001)(1076003)(186003)(7416002)(16526019)(47076005)(44832011)(26005)(2906002)(921005)(356005)(82740400003)(81166007)(40480700001)(5660300002)(36756003)(8936002)(8676002)(70586007)(70206006)(478600001)(110136005)(54906003)(6666004)(6636002)(4326008)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 07:29:43.2541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504fb5be-e2ba-45b0-ff98-08db68bb4b39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With WBRF feature supported, as a driver responding to the frequencies,
amdgpu driver is able to do shadow pstate switching to mitigate possible
interference(between its (G-)DDR memory clocks and local radio module
frequency bands used by Wifi 6/6e/7).

To make WBRF feature functional, the kernel needs to be configured with
CONFIG_ACPI_WBRF and the platform is equipped with necessary ACPI based
mechanism to get amdgpu driver notified.

Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  63 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 184 ++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  20 ++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 6 files changed, 315 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 02b827785e39..2f2ec64ed1b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -50,6 +50,7 @@
 #include <linux/hashtable.h>
 #include <linux/dma-fence.h>
 #include <linux/pci.h>
+#include <linux/wbrf.h>
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
@@ -241,6 +242,7 @@ extern int amdgpu_num_kcq;
 #define AMDGPU_VCNFW_LOG_SIZE (32 * 1024)
 extern int amdgpu_vcnfw_log;
 extern int amdgpu_sg_display;
+extern int amdgpu_wbrf;
 
 #define AMDGPU_VM_MAX_NUM_CTX			4096
 #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
@@ -741,6 +743,9 @@ struct amdgpu_reset_domain;
  */
 #define AMDGPU_HAS_VRAM(_adev) ((_adev)->gmc.real_vram_size)
 
+typedef
+void (*wbrf_notify_handler) (struct amdgpu_device *adev);
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
@@ -1050,6 +1055,8 @@ struct amdgpu_device {
 
 	bool                            job_hang;
 	bool                            dc_enabled;
+
+	wbrf_notify_handler		wbrf_event_handler;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
@@ -1381,6 +1388,25 @@ static inline int amdgpu_acpi_smart_shift_update(struct drm_device *dev,
 						 enum amdgpu_ss ss_state) { return 0; }
 #endif
 
+#if defined(CONFIG_ACPI_WBRF)
+bool amdgpu_acpi_is_wbrf_supported(struct amdgpu_device *adev);
+int amdgpu_acpi_wbrf_retrieve_exclusions(struct amdgpu_device *adev,
+					 struct wbrf_ranges_out *exclusions_out);
+int amdgpu_acpi_register_wbrf_notify_handler(struct amdgpu_device *adev,
+					     wbrf_notify_handler handler);
+int amdgpu_acpi_unregister_wbrf_notify_handler(struct amdgpu_device *adev);
+#else
+static inline bool amdgpu_acpi_is_wbrf_supported(struct amdgpu_device *adev) { return false; }
+static inline
+int amdgpu_acpi_wbrf_retrieve_exclusions(struct amdgpu_device *adev,
+					 struct wbrf_ranges_out *exclusions_out) { return 0; }
+static inline
+int amdgpu_acpi_register_wbrf_notify_handler(struct amdgpu_device *adev,
+					     wbrf_notify_handler handler) { return 0; }
+static inline
+int amdgpu_acpi_unregister_wbrf_notify_handler(struct amdgpu_device *adev) { return 0; }
+#endif
+
 #if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
 bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev);
 bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index aeeec211861c..efbe6dd91d1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1105,3 +1105,66 @@ bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
 }
 
 #endif /* CONFIG_SUSPEND */
+
+#ifdef CONFIG_ACPI_WBRF
+bool amdgpu_acpi_is_wbrf_supported(struct amdgpu_device *adev)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(adev->dev);
+
+	if (!acpi_dev)
+		return false;
+
+	return wbrf_supported_consumer(acpi_dev);
+}
+
+int amdgpu_acpi_wbrf_retrieve_exclusions(struct amdgpu_device *adev,
+					 struct wbrf_ranges_out *exclusions_out)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(adev->dev);
+
+	if (!acpi_dev)
+		return -ENODEV;
+
+	return wbrf_retrieve_exclusions(acpi_dev, exclusions_out);
+}
+
+#define CPM_GPU_NOTIFY_COMMAND		0x55
+static void amdgpu_acpi_wbrf_event(acpi_handle handle, u32 event, void *data)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)data;
+
+	if (event == CPM_GPU_NOTIFY_COMMAND &&
+	    adev->wbrf_event_handler)
+		adev->wbrf_event_handler(adev);
+}
+
+int amdgpu_acpi_register_wbrf_notify_handler(struct amdgpu_device *adev,
+					     wbrf_notify_handler handler)
+{
+	struct acpi_handle *acpi_hdler = ACPI_HANDLE(adev->dev);
+
+	if (!acpi_hdler)
+		return -ENODEV;
+
+	adev->wbrf_event_handler = handler;
+
+	return acpi_install_notify_handler(acpi_hdler,
+					   ACPI_ALL_NOTIFY,
+					   amdgpu_acpi_wbrf_event,
+					   adev);
+}
+
+int amdgpu_acpi_unregister_wbrf_notify_handler(struct amdgpu_device *adev)
+{
+	struct acpi_handle *acpi_hdler = ACPI_HANDLE(adev->dev);
+
+	if (!acpi_hdler)
+		return -ENODEV;
+
+	adev->wbrf_event_handler = NULL;
+
+	return acpi_remove_notify_handler(acpi_hdler,
+					  ACPI_ALL_NOTIFY,
+					  amdgpu_acpi_wbrf_event);
+}
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b1ca1ab6d6ad..bf82cc192153 100644
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
 
+#ifdef CONFIG_ACPI_WBRF
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
index 2ddf5198e5c4..89f876cc60e6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1188,6 +1188,163 @@ static int smu_get_thermal_temperature_range(struct smu_context *smu)
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
+	ret = amdgpu_acpi_wbrf_retrieve_exclusions(adev, &wbrf_exclusion);
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
+ * @adev: struct amdgpu_device pointer
+ *
+ * Calls relevant amdgpu function in response to wbrf event
+ * notification from BIOS.
+ */
+static void smu_wbrf_event_handler(struct amdgpu_device *adev)
+{
+	struct smu_context *smu = adev->powerplay.pp_handle;
+
+	smu_wbrf_handle_exclusion_ranges(smu);
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
+			      amdgpu_acpi_is_wbrf_supported(adev);
+
+	if (smu->wbrf_supported)
+		dev_info(adev->dev, "Enabled RF interference mitigations\n");
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
+	ret = amdgpu_acpi_register_wbrf_notify_handler(adev,
+						       smu_wbrf_event_handler);
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
+	struct amdgpu_device *adev = smu->adev;
+
+	if (!smu->wbrf_supported)
+		return;
+
+	amdgpu_acpi_unregister_wbrf_notify_handler(adev);
+}
+
 static int smu_smc_hw_setup(struct smu_context *smu)
 {
 	struct smu_feature *feature = &smu->smu_feature;
@@ -1280,6 +1437,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
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
@@ -1376,6 +1542,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
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
@@ -1431,6 +1606,13 @@ static int smu_hw_init(void *handle)
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
@@ -1583,6 +1765,8 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
 
+	smu_wbrf_fini(smu);
+
 	cancel_work_sync(&smu->throttling_logging_work);
 	cancel_work_sync(&smu->interrupt_work);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 09469c750a96..ff0af3da0be2 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -573,6 +573,9 @@ struct smu_context
 	u32 debug_param_reg;
 	u32 debug_msg_reg;
 	u32 debug_resp_reg;
+
+	/* data structures for wbrf feature support */
+	bool				wbrf_supported;
 };
 
 struct i2c_adapter;
@@ -1354,6 +1357,23 @@ struct pptable_funcs {
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

