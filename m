Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4ED3DBFF3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176EA6F4A9;
	Fri, 30 Jul 2021 20:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09DE6F4A4;
 Fri, 30 Jul 2021 20:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNkzOpG/VT8I8Tjk9L1zQbS69GFFFbisb0PkpBu//l1lC6NxZAlQh61ioxy7szyQlp7ip82K4C9srfMeKpXcF0ttqh/KZcl6nkKAvczbIy3av1R+7zcCMGNu8KwrIAL7EsQ/ucaN+FwFCRGFjvyuR9afu8PDXoTi77LvK6kKuD1pg5yLstArVAUum47SF4gqz3KIOzUPDdPq/sMEPD/xsY5deTbVhQelk+LslZ87LaKU0zd+9wUGLqH7pcfXe+GhVYDFdfZIxbclcD0lKaSfUOHjnVn5WChA8ndLCEh6sB5HRA6kt1KR+5uHkOBcOLuT/72eO/dWIz2C8atR3dALlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyNhiQoqljMS2fK8S+yp+gBEGYhDC+fBYBVIsPNLfe4=;
 b=OevNciEPKE6AdbLmmPk075jN1HkESgOd7Mj4SMAr5ZPo6PX1nnRT3s5+s8JPioDGdiX6kA+Bs6lpJkzUiqfsSgNDV+oaFkMjkybq3VipmBA9aR2TST5xqj0/Lg6wg4ObSQGtc4Wi+/ZE5ld1vyhQjIuE569Y/z8Omg2gOjLgOVY9norGqQOz1VISqDRFqg9NNj0JakAAosBwUm8qYiAPFCv5IwBiI1p5xKo880nDJyCRcydaw69fcipUwnTglCLJYlwCxyT9EwUTu+EDDv40QG3Ads5jhC9wFcvTohHIM/S7+FHRejM79PSPYOD6EJLi3s2F5lK5XsJbYd25HZtkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyNhiQoqljMS2fK8S+yp+gBEGYhDC+fBYBVIsPNLfe4=;
 b=tr09kYfdkb4UCLOfxgycstRJ3n49Cu4OBEEBtGJCopDgfE3uD1L1jOuLRBiXMJ+gitXeGrwUn+DSxV0lndkjQ2HGQh3iXQclSpb3Uzn03Tl4d6iZdjsotEEloLAj7f+k3zW4OmUsreBmoDQGT0RAwRz69dJc7Plgv2mpKljEjVs=
Received: from DM5PR21CA0023.namprd21.prod.outlook.com (2603:10b6:3:ac::33) by
 MN2PR12MB4567.namprd12.prod.outlook.com (2603:10b6:208:263::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 20:41:48 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::a6) by DM5PR21CA0023.outlook.office365.com
 (2603:10b6:3:ac::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.1 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:41 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:40 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 3/6] drm/color: Add output transfer function to crtc
Date: Fri, 30 Jul 2021 16:41:31 -0400
Message-ID: <20210730204134.21769-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730204134.21769-1-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9502cc0-2de0-4f2f-9b98-08d9539a73cb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4567:
X-Microsoft-Antispam-PRVS: <MN2PR12MB456705F58BD5D845278D0C3F8CEC9@MN2PR12MB4567.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJlPypesbJmD41xUsFJdVc+dEYXOTlsygIMVSlqcXhzWrKclSnjlTEaHGr11S1SXKj8h8H6wzbd2/eLOPT88DXXweHJJ3k5Qr4CCBYLxeUfuh0lPgELAwIIyreoj9J7Q94ZEy6se9QXHh8W9b+IPc0rVyWW37+fAqARt64iCpkdSprSglV6ZLejacNJYNLyWd/gSTr0G4gi7haTjeI490DkVfEI1hy/xNh8oBkp+lKLRnlIl/V1gtJUeIm593uzp9DiCQAu5E3yuJwNacnY+tYQDIceVFPITqqAu3XOVGgcDx2ko0mbKyk/30jR7V/uRbvnGsgqWeyG3eZ/z54eIDFOOWlrxlcr4Nv19lLG6HJSIWaGT1VBo+Vu3KzIU1klkz0F7kzqxYrqzt8GTcvlPqvWZ57aMPHzY1ZaKWF1VV3UrPA51fL/FsefO7HLzaFEGMacq9KOS48YHjJo0WlxKeNHXM6AHJ9iQS/3xWTcLul1Ac7JYgZ9NZGvTZSmpZ/SfLn1ick/SXgEGLv2+j7NadYcmfs/1oWcEhjXPeI76bxr2piiH4Vcz6lfcFv+SwLZ3OeMOPPoLqMgeFq+OWO0AcgUXEGy3lqChWOF4JJZ1eYMwRc5MzN5mytwM1zcds6jdYxJgm3bTaHEeZCdYfAbMf5epGRNioDzkuLKkMHAfEW3xfhZXqXpK9XYnZbWaTadEpLnMuypp7CHMO/JfoH6yoGNGU6Da91oG77vzziD14fg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(46966006)(36840700001)(426003)(6666004)(26005)(30864003)(8676002)(36756003)(186003)(356005)(4326008)(82310400003)(47076005)(44832011)(70586007)(336012)(70206006)(7696005)(316002)(86362001)(5660300002)(478600001)(82740400003)(83380400001)(1076003)(81166007)(8936002)(2906002)(6636002)(36860700001)(2616005)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:48.1428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9502cc0-2de0-4f2f-9b98-08d9539a73cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4567
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have 1D LUTs to define output transfer function but using a
1D LUT is not always the best way to define a transfer function for HW
that has ROMs for certain transfer functions, or for HW that has complex
PWL definition for accurate LUT definitions.

For this reason we're introducing named transfer functions. The original
LUT behavior is preserved with the default "1D LUT" transfer function.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 +++-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  7 ++-
 drivers/gpu/drm/arm/malidp_crtc.c             |  7 ++-
 drivers/gpu/drm/armada/armada_crtc.c          |  5 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  7 ++-
 drivers/gpu/drm/drm_color_mgmt.c              | 54 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_color.c    | 11 ++--
 drivers/gpu/drm/i915/display/intel_color.h    |  2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  9 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  8 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  9 +++-
 drivers/gpu/drm/nouveau/dispnv50/head.c       | 13 +++--
 drivers/gpu/drm/omapdrm/omap_crtc.c           | 10 +++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  7 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  5 +-
 drivers/gpu/drm/stm/ltdc.c                    |  8 ++-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  9 +++-
 drivers/gpu/drm/vc4/vc4_crtc.c                | 16 +++++-
 include/drm/drm_color_mgmt.h                  | 37 +++++++------
 include/drm/drm_crtc.h                        | 20 +++++++
 21 files changed, 208 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 63ddae9c5abe..b6d072211bf9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7343,8 +7343,15 @@ static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	acrtc->otg_inst = -1;
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
-	drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
-				   true, MAX_COLOR_LUT_ENTRIES);
+
+	res = drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
+					 true, MAX_COLOR_LUT_ENTRIES,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (res) {
+		drm_crtc_cleanup(&acrtc->base);
+		goto fail;
+	}
+
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
 	return 0;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 59172acb9738..f364d37232b5 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -626,7 +626,12 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 
 	crtc->port = kcrtc->master->of_output_port;
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);
+	err = drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (err) {
+		drm_crtc_cleanup(crtc);
+		return err;
+	}
 
 	return err;
 }
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 494075ddbef6..7af87002c375 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -552,7 +552,12 @@ int malidp_crtc_init(struct drm_device *drm)
 	drm_crtc_helper_add(&malidp->crtc, &malidp_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&malidp->crtc, MALIDP_GAMMA_LUT_SIZE);
 	/* No inverse-gamma: it is per-plane. */
-	drm_crtc_enable_color_mgmt(&malidp->crtc, 0, true, MALIDP_GAMMA_LUT_SIZE);
+	ret = drm_crtc_enable_color_mgmt(&malidp->crtc, 0, true, MALIDP_GAMMA_LUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(&malidp->crtc);
+		return ret;
+	}
 
 	malidp_se_set_enh_coeffs(malidp->dev);
 
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index b7bb90ae787f..d44a1d4fa475 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -992,7 +992,10 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 	if (ret)
 		return ret;
 
-	drm_crtc_enable_color_mgmt(&dcrtc->crtc, 0, false, 256);
+	ret = drm_crtc_enable_color_mgmt(&dcrtc->crtc, 0, false, ,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret)
+		return ret;
 
 	return armada_overlay_plane_create(drm, 1 << dcrtc->num);
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 05ad75d155e8..e5911826d002 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -528,8 +528,11 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
 
 	drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SIZE);
-	drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
-				   ATMEL_HLCDC_CLUT_SIZE);
+	ret = drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
+					 ATMEL_HLCDC_CLUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret)
+		goto fail;
 
 	dc->crtc = &crtc->base;
 
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index daf62fb090a6..196544951ab7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -147,12 +147,21 @@ u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n)
 }
 EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
 
+static const char * const tf_name[] = {
+	[DRM_TF_UNDEFINED] = "undefined",
+	[DRM_TF_SRGB] = "sRGB",
+	[DRM_TF_PQ2084] = "PQ2084",
+	[DRM_TF_1D_LUT] = "1D LUT",
+};
+
 /**
  * drm_crtc_enable_color_mgmt - enable color management properties
  * @crtc: DRM CRTC
  * @degamma_lut_size: the size of the degamma lut (before CSC)
  * @has_ctm: whether to attach ctm_property for CSC matrix
  * @gamma_lut_size: the size of the gamma lut (after CSC)
+ * @supported_tfs: bitfield indicating supported transfer functions
+ * @default_tf: default output transfer function
  *
  * This function lets the driver enable the color correction
  * properties on a CRTC. This includes 3 degamma, csc and gamma
@@ -162,13 +171,27 @@ EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
  * their size is not 0 and ctm_property is only attached if has_ctm is
  * true.
  */
-void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
+bool drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				uint degamma_lut_size,
 				bool has_ctm,
-				uint gamma_lut_size)
+				uint gamma_lut_size,
+				u32 supported_tfs,
+				enum drm_transfer_function default_tf)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	struct drm_prop_enum_list enum_list[DRM_TF_MAX];
+	int i, len;
+
+	if (WARN_ON(supported_tfs == 0 ||
+		    (supported_tfs & -BIT(DRM_TF_MAX)) != 0 ||
+		    (supported_tfs & BIT(default_tf)) == 0))
+		return -EINVAL;
+
+	if (!!(supported_tfs & BIT(DRM_TF_1D_LUT)) !=
+	    !!(degamma_lut_size || gamma_lut_size))
+		return -EINVAL;
 
 	if (degamma_lut_size) {
 		drm_object_attach_property(&crtc->base,
@@ -189,6 +212,28 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 					   config->gamma_lut_size_property,
 					   gamma_lut_size);
 	}
+
+	len = 0;
+	for (i = 0; i < DRM_TF_MAX; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = tf_name[i];
+		len++;
+	}
+
+	prop = drm_property_create_enum(dev, 0, "OUT TRANSFER_FUNCTION",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+	crtc->out_transfer_function_property = prop;
+	drm_object_attach_property(&crtc->base, prop, default_tf);
+	if (crtc->state)
+		crtc->state->out_transfer_function = default_tf;
+	
+	return 0;
+
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
@@ -481,11 +526,6 @@ static const char * const color_range_name[] = {
 	[DRM_COLOR_YCBCR_LIMITED_RANGE] = "YCbCr limited range",
 };
 
-static const char * const tf_name[] = {
-	[DRM_TF_UNDEFINED] = "undefined",
-	[DRM_TF_SRGB] = "sRGB",
-	[DRM_TF_PQ2084] = "PQ2084",
-};
 /**
  * drm_get_color_encoding_name - return a string for color encoding
  * @encoding: color encoding to compute name of
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dab892d2251b..a9332080efe5 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2093,7 +2093,7 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
-void intel_color_init(struct intel_crtc *crtc)
+bool intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	bool has_ctm = INTEL_INFO(dev_priv)->color.degamma_lut_size != 0;
@@ -2150,8 +2150,9 @@ void intel_color_init(struct intel_crtc *crtc)
 		}
 	}
 
-	drm_crtc_enable_color_mgmt(&crtc->base,
-				   INTEL_INFO(dev_priv)->color.degamma_lut_size,
-				   has_ctm,
-				   INTEL_INFO(dev_priv)->color.gamma_lut_size);
+	return drm_crtc_enable_color_mgmt(&crtc->base,
+					  INTEL_INFO(dev_priv)->color.degamma_lut_size,
+					  has_ctm,
+					  INTEL_INFO(dev_priv)->color.gamma_lut_size,
+					  BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 173727aaa24d..a8e015acc60c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -12,7 +12,7 @@ struct intel_crtc_state;
 struct intel_crtc;
 struct drm_property_blob;
 
-void intel_color_init(struct intel_crtc *crtc);
+bool intel_color_init(struct intel_crtc *crtc);
 int intel_color_check(struct intel_crtc_state *crtc_state);
 void intel_color_commit(const struct intel_crtc_state *crtc_state);
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 95ff1707b4bd..0846fb4ef14e 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -340,7 +340,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
-	intel_color_init(crtc);
+	ret = intel_color_init(crtc);
+	if (ret)
+		goto fail;
 
 	intel_crtc_crc_init(crtc);
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5244f4763477..f21fdd7e5f2a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1017,8 +1017,13 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return ret;
 	}
 
-	drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
-				   ARRAY_SIZE(priv->dma_hwdescs->palette));
+	ret = drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
+					 ARRAY_SIZE(priv->dma_hwdescs->palette),
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		dev_err(dev, "Failed to init color management: %i\n", ret);
+		return ret;
+	}
 
 	if (soc_info->has_osd) {
 		drm_plane_helper_add(&priv->f0,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..d2496ad16931 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -827,7 +827,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	if (gamma_lut_size)
 		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
-	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
+	ret = drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size,
+					BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(mtk_crtc->base);
+		kfree(mtk_crtc);
+		return ret;
+
 	priv->num_pipes++;
 	mutex_init(&mtk_crtc->hw_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a5c70c87cc8..9b7e947e8c8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1337,6 +1337,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i;
+	int ret = 0;
 
 	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
 	if (!dpu_crtc)
@@ -1365,7 +1366,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	ret = drm_crtc_enable_color_mgmt(crtc, 0, true, 0,
+					 BIT(DRM_TF_UNDEFINED), DRM_TF_UNDEFINED);
+	if (ret) {
+		drm_crtc_cleanup(crtc);
+		kfree(dpu_crtc);
+		return ERR_PTR(ret);
+	}
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index ec361d17e900..f97b3f70152b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -589,9 +589,16 @@ nv50_head_create(struct drm_device *dev, int index)
 	drm_crtc_helper_add(crtc, &nv50_head_help);
 	/* Keep the legacy gamma size at 256 to avoid compatibility issues */
 	drm_mode_crtc_set_gamma_size(crtc, 256);
-	drm_crtc_enable_color_mgmt(crtc, base->func->ilut_size,
-				   disp->disp->object.oclass >= GF110_DISP,
-				   head->func->olut_size);
+	ret = drm_crtc_enable_color_mgmt(crtc, base->func->ilut_size,
+					 disp->disp->object.oclass >= GF110_DISP,
+					 head->func->olut_size,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(crtc);
+		kfree(head);
+		return ERR_PTR(ret);
+	}
+
 
 	if (head->func->olut_set) {
 		ret = nv50_lut_init(disp, &drm->client.mmu, &head->olut);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 06a719c104f4..a618b3338c38 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -839,7 +839,15 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	if (dispc_mgr_gamma_size(priv->dispc, channel)) {
 		unsigned int gamma_lut_size = 256;
 
-		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, true, 0);
+		ret = drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, true, 0,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			dev_err(dev->dev, "$s(): could not init color management for: %s\n",
+				__func__, pipe->output->name);
+			drm_crtc_cleanup(crtc);
+			kfree(omap_crtc);
+			return ERR_PTR(ret);
+		}
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..02d8737e6603 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1263,7 +1263,12 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		rgrp->cmms_mask |= BIT(hwindex % 2);
 
 		drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
-		drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			drm_crtc_cleanup(crtc);
+			return ret;
+		}
 	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index f5b9028a16a3..68d3a7b1f041 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1817,7 +1817,10 @@ static int vop_create_crtc(struct vop *vop)
 	drm_crtc_helper_add(crtc, &vop_crtc_helper_funcs);
 	if (vop->lut_regs) {
 		drm_mode_crtc_set_gamma_size(crtc, vop_data->lut_size);
-		drm_crtc_enable_color_mgmt(crtc, 0, false, vop_data->lut_size);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, false, vop_data->lut_size,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret)
+			goto err_cleanup_crtc;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 08b71248044d..ffdf7114f50a 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1035,7 +1035,13 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 	drm_crtc_helper_add(crtc, &ltdc_crtc_helper_funcs);
 
 	drm_mode_crtc_set_gamma_size(crtc, CLUT_SIZE);
-	drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE);
+	ret = drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		DRM_ERROR("Can not initialize color management\n");
+		drm_crtc_cleanup(crtc);
+		goto cleanup;
+	}
 
 	DRM_DEBUG_DRIVER("CRTC:%d created\n", crtc->base.id);
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 2218da3b3ca3..34ed098887bc 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -439,7 +439,14 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 	if (tidss->feat->vp_feat.color.gamma_size)
 		gamma_lut_size = 256;
 
-	drm_crtc_enable_color_mgmt(crtc, 0, has_ctm, gamma_lut_size);
+	ret = drm_crtc_enable_color_mgmt(crtc, 0, has_ctm, gamma_lut_size,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(crtc);
+		kfree(tcrtc);
+		return ERR_PTR(ret);
+	}
+
 	if (gamma_lut_size)
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 18f5009ce90e..3bb2c0dba09a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1118,12 +1118,24 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	if (!vc4->hvs->hvs5) {
 		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 
-		drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			dev_err(drm->dev, "failed to enable color management\n");
+			drm_crtc_cleanup(crtc);
+			return ret;
+		}
 
 		/* We support CTM, but only for one CRTC at a time. It's therefore
 		 * implemented as private driver state in vc4_kms, not here.
 		 */
-		drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			dev_err(drm->dev, "failed to enable color management\n");
+			drm_crtc_cleanup(crtc);
+			return ret;
+		}
 	}
 
 	for (i = 0; i < crtc->gamma_size; i++) {
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 370bbc55b744..408561acdb3d 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -54,10 +54,29 @@ static inline u32 drm_color_lut_extract(u32 user_input, int bit_precision)
 
 u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
 
-void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
+/**
+ * enum drm_transfer_function - common transfer function used for sdr/hdr formats
+ *
+ * DRM_TF_UNDEFINED - The legacy case where a TF in and out of the blending
+ *                    space is undefined
+ * DRM_TF_SRGB - Based on gamma curve and is used for printer/monitors/web
+ * DRM_TF_PQ2084 - Used for HDR and allows for up to 10,000 nit support.
+ * DRM_TF_1D_LUT - Use 1D gamma/degamma LUTs (currently only defined on crtc)
+*/
+enum drm_transfer_function {
+	DRM_TF_UNDEFINED,
+	DRM_TF_SRGB,
+	DRM_TF_PQ2084,
+	DRM_TF_1D_LUT,
+	DRM_TF_MAX,
+};
+
+bool drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				uint degamma_lut_size,
 				bool has_ctm,
-				uint gamma_lut_size);
+				uint gamma_lut_size,
+				u32 supported_tfs,
+				enum drm_transfer_function default_tf);
 
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
@@ -87,20 +106,6 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
-/**
- * enum drm_transfer_function - common transfer function used for sdr/hdr formats
- *
- * DRM_TF_UNDEFINED - The legacy case where a TF in and out of the blending
- *                    space is undefined
- * DRM_TF_SRGB - Based on gamma curve and is used for printer/monitors/web
- * DRM_TF_PQ2084 - Used for HDR and allows for up to 10,000 nit support.
-*/
-enum drm_transfer_function {
-	DRM_TF_UNDEFINED,
-	DRM_TF_SRGB,
-	DRM_TF_PQ2084,
-	DRM_TF_MAX,
-};
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750a..35580dd36294 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -288,6 +288,15 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @out_transfer_function:
+	 *
+	 * Transfer function for conversion from blending space to
+	 * display space. DRM_TF_1D_LUT can be specified to use the
+	 * gamma/degamma LUTs from mode_config instead.
+	 */
+	enum drm_transfer_function out_transfer_function;
+
 	/**
 	 * @target_vblank:
 	 *
@@ -1096,6 +1105,17 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @out_transfer_function_property:
+	 *
+	 * Optional "OUT TRANSFER FUNCTION" enum property for specifying
+	 * an output transfer function, i.e. a TF to convert from
+	 * blending space to luminance space. Use DRM_TF_1D_LUT to
+	 * indicate using the 1D gamma/degamma LUTs instead of a
+	 * named transfer function.
+	 */
+	struct drm_property *out_transfer_function_property;
+
 	/**
 	 * @state:
 	 *
-- 
2.32.0

