Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42687550D72
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 00:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2AC112EB5;
	Sun, 19 Jun 2022 22:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2066112EAF;
 Sun, 19 Jun 2022 22:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AKCkWR1rJc7yBcTBCZvEPWBlgtap3fgWfhr76qMwAME=; b=Cju2fhs0snvQRc8ACWrsB+GhLJ
 RDxKHquCSFL1JewgVMS+JXlcnPOJQc4mpqH4hBoBuMEYm8FukF9PeJ8Vvhz1kWtv7KbNZXENyMBE7
 dMe4eB3K97o0wG/TU0KylCH7PfYvPh7eBJDKOWp9OctHdm1sD4Qay7yY/2Z15R7Ax5T1tFMvHyTHS
 2YwxuDApPOHE0INkc3wOr3IUbbsfApSLQuTjshiEhnZiwqbgoAykfCzmGBBdnt36N5fdN7Slq8/+/
 9IANsqXg5LG4ji1ClE23w2cnPGys43gOS8rxDLzps2rAvxWboBBlwNsVLITdKhDE6OridgEW1m9WR
 YddoD5Qg==;
Received: from [195.77.82.244] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o33Sh-005lHy-63; Mon, 20 Jun 2022 00:32:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [RFC PATCH 1/5] Documentation/amdgpu_dm: Add DM color correction
 documentation
Date: Sun, 19 Jun 2022 21:31:00 -0100
Message-Id: <20220619223104.667413-2-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619223104.667413-1-mwen@igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alex.hung@amd.com, amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
to DC color correction entities. Part of this mapping is already
documented as code comments and can be converted as kernel docs.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/amdgpu/display/display-manager.rst    |   9 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++-----
 3 files changed, 101 insertions(+), 32 deletions(-)

diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
index 7ce31f89d9a0..b1b0f11aed83 100644
--- a/Documentation/gpu/amdgpu/display/display-manager.rst
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -40,3 +40,12 @@ Atomic Implementation
 
 .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
    :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
+
+Color Management Properties
+===========================
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+   :internal:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 3cc5c15303e6..8fd1be7f2583 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -242,6 +242,8 @@ struct hpd_rx_irq_offload_work {
  * @force_timing_sync: set via debugfs. When set, indicates that all connected
  *		       displays will be forced to synchronize.
  * @dmcub_trace_event_en: enable dmcub trace events
+ * @num_of_edps: dumber of embedded Display Ports
+ * @disable_hpd_irq: disable Hot Plug Detect handling
  */
 struct amdgpu_display_manager {
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a71177305bcd..1f4a7c908587 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -29,7 +29,9 @@
 #include "modules/color/color_gamma.h"
 #include "basics/conversion.h"
 
-/*
+/**
+ * DOC: overview
+ *
  * The DC interface to HW gives us the following color management blocks
  * per pipe (surface):
  *
@@ -71,8 +73,8 @@
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
 
-/*
- * Initialize the color module.
+/**
+ * amdgpu_dm_init_color_mod - Initialize the color module.
  *
  * We're not using the full color module, only certain components.
  * Only call setup functions for components that we need.
@@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
 	setup_x_points_distribution();
 }
 
-/* Extracts the DRM lut and lut size from a blob. */
+/**
+ * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
+ * @blob: DRM color mgmt property blob
+ * @size: lut size
+ *
+ * Returns:
+ * DRM LUT or NULL
+ */
 static const struct drm_color_lut *
 __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 {
@@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 	return blob ? (struct drm_color_lut *)blob->data : NULL;
 }
 
-/*
- * Return true if the given lut is a linear mapping of values, i.e. it acts
- * like a bypass LUT.
+/**
+ * __is_lut_linear - check if the given lut is a linear mapping of values
+ * @lut: given lut to check values
+ * @size: lut size
  *
  * It is considered linear if the lut represents:
- * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
- *                                           [0, MAX_COLOR_LUT_ENTRIES)
+ * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
+ * MAX_COLOR_LUT_ENTRIES)
+ *
+ * Returns:
+ * True if the given lut is a linear mapping of values, i.e. it acts like a
+ * bypass LUT. Otherwise, false.
  */
 static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
 {
@@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
 	return true;
 }
 
-/*
- * Convert the drm_color_lut to dc_gamma. The conversion depends on the size
- * of the lut - whether or not it's legacy.
+/**
+ * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
+ * @lut: DRM lookup table for color conversion
+ * @gamma: DC gamma to set entries
+ * @is_legacy: legacy or atomic gamma
+ *
+ * The conversion depends on the size of the lut - whether or not it's legacy.
  */
 static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 				  struct dc_gamma *gamma, bool is_legacy)
@@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 	}
 }
 
-/*
- * Converts a DRM CTM to a DC CSC float matrix.
+/**
+ * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
+ * @ctm: DRM color transformation matrix
+ * @matrix: DC CSC float matrix
+ *
  * The matrix needs to be a 3x4 (12 entry) matrix.
  */
 static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
@@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 	}
 }
 
-/* Calculates the legacy transfer function - only for sRGB input space. */
+/**
+ * __set_legacy_tf - Calculates the legacy transfer function
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut
+ * @has_rom: if ROM can be used for hardcoded curve
+ *
+ * Only for sRGB input space
+ *
+ * Returns:
+ * 0 in case of sucess, -ENOMEM if fails
+ */
 static int __set_legacy_tf(struct dc_transfer_func *func,
 			   const struct drm_color_lut *lut, uint32_t lut_size,
 			   bool has_rom)
@@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
-/* Calculates the output transfer function based on expected input space. */
+/**
+ * __set_output_tf - calculates the output transfer function based on expected input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut
+ * @has_rom: if ROM can be used for hardcoded curve
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
 static int __set_output_tf(struct dc_transfer_func *func,
 			   const struct drm_color_lut *lut, uint32_t lut_size,
 			   bool has_rom)
@@ -239,7 +280,7 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	__drm_lut_to_dc_gamma(lut, gamma, false);
 
 	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
-		/*
+		/**
 		 * Color module doesn't like calculating regamma params
 		 * on top of a linear input. But degamma params can be used
 		 * instead to simulate this.
@@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
-/* Caculates the input transfer function based on expected input space. */
+/**
+ * __set_input_tf - calculates the input transfer function based on expected
+ * input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut.
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
 static int __set_input_tf(struct dc_transfer_func *func,
 			  const struct drm_color_lut *lut, uint32_t lut_size)
 {
@@ -285,13 +335,16 @@ static int __set_input_tf(struct dc_transfer_func *func,
 }
 
 /**
- * amdgpu_dm_verify_lut_sizes
+ * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
  * @crtc_state: the DRM CRTC state
+ * @adev: amdgpu device
  *
- * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
- * the expected size.
+ * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
+ * are of the expected size.
  *
- * Returns 0 on success.
+ * Returns:
+ * 0 on success.
+ * -EINVAL if any lut sizes are invalid.
  */
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 {
@@ -327,9 +380,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
  * of the HW blocks as long as the CRTC CTM always comes before the
  * CRTC RGM and after the CRTC DGM.
  *
- * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
- * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
- * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
+ * * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
+ * * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
+ * * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
  *
  * The RGM block is typically more fully featured and accurate across
  * all ASICs - DCE can't support a custom non-linear CRTC DGM.
@@ -338,7 +391,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
  * management at once we have to either restrict the usage of CRTC properties
  * or blend adjustments together.
  *
- * Returns 0 on success.
+ * Returns:
+ * 0 on success.
+ * Error code if setup fails.
  */
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 {
@@ -373,7 +428,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 
 	/* Setup regamma and degamma. */
 	if (is_legacy) {
-		/*
+		/**
 		 * Legacy regamma forces us to use the sRGB RGM as a base.
 		 * This also means we can't use linear DGM since DGM needs
 		 * to use sRGB as a base as well, resulting in incorrect CRTC
@@ -393,7 +448,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		if (r)
 			return r;
 	} else if (has_regamma) {
-		/* CRTC RGM goes into RGM LUT. */
+		/**
+		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
 		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
 		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 
@@ -402,7 +458,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		if (r)
 			return r;
 	} else {
-		/*
+		/**
 		 * No CRTC RGM means we can just put the block into bypass
 		 * since we don't have any plane level adjustments using it.
 		 */
@@ -410,7 +466,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 	}
 
-	/*
+	/**
 	 * CRTC DGM goes into DGM LUT. It would be nice to place it
 	 * into the RGM since it's a more featured block but we'd
 	 * have to place the CTM in the OCSC in that case.
@@ -421,7 +477,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	if (crtc->base.ctm) {
 		ctm = (struct drm_color_ctm *)crtc->base.ctm->data;
 
-		/*
+		/**
 		 * Gamut remapping must be used for gamma correction
 		 * since it comes before the regamma correction.
 		 *
@@ -452,7 +508,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
  * preparation for hardware commit. The transfer function used depends on
  * the prepartion done on the stream for color management.
  *
- * Returns 0 on success.
+ * Returns:
+ * 0 on success.
+ * ENOMEM if mem allocation fails.
  */
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state)
-- 
2.35.1

