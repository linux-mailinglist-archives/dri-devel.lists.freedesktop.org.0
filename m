Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4215AA7A9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FFE10E74D;
	Fri,  2 Sep 2022 06:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856F010E74B;
 Fri,  2 Sep 2022 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662098665; x=1693634665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WJzz6ouL7jnK1J7IOkeNWGjSsZxMNRMspB17RcHxu8A=;
 b=GTiiQpfrfl5+mgyB1RVAM2BTyGriRReDFLm1r2tEE8uNgVQQkrmt8n9f
 +XeuK4YkIEXs/lUUFrwbo42ezwUmJWhLSNRTYiJ2kFUrrvEUYzcuFchvN
 lH9E1qjIzf/matLfWXZWf88EVQIaahhQOT6OOYRivRLIt7AUK5rPQWxXY
 9E7HGR0A2kAU/qLtFAFn7gh3wNOj+i3aRhvMh5jFKAdqfeNFsoXAJU+sP
 wVYhjDBIPa/7F02twVD00BJkQpkAYWSRKA0Q+/lqiBviZV5qjkgfFL3/Z
 Qfmb+Cu/FQOt/H2x2GxEduD13XzS2Rr6bey3nZKz5ii5McaHjY6aW22K5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282889125"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="282889125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="755144583"
Received: from invictus.jf.intel.com ([10.165.21.188])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:24 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 01/11] drm/i915: Move display and media IP version to
 runtime info
Date: Thu,  1 Sep 2022 23:03:32 -0700
Message-Id: <20220902060342.151824-2-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Future platforms can read the IP version from a register and the
IP version numbers need not be hard coded in device info. Move the
ip version for media and display to runtime info.

On platforms where hard coding of IP version is required, update
the IP version in __runtime under device_info.

v2:
 - Avoid name collision for ip versions(Jani)

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 14 ++++-----
 drivers/gpu/drm/i915/i915_pci.c          | 38 ++++++++++++------------
 drivers/gpu/drm/i915/intel_device_info.c | 28 ++++++++++-------
 drivers/gpu/drm/i915/intel_device_info.h | 15 ++++++----
 4 files changed, 53 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c9cca165bf5d..f85a470397a5 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -469,19 +469,19 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 
 #define IP_VER(ver, rel)		((ver) << 8 | (rel))
 
-#define GRAPHICS_VER(i915)		(RUNTIME_INFO(i915)->graphics.ver)
-#define GRAPHICS_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->graphics.ver, \
-					       RUNTIME_INFO(i915)->graphics.rel)
+#define GRAPHICS_VER(i915)		(RUNTIME_INFO(i915)->graphics.version.ver)
+#define GRAPHICS_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->graphics.version.ver, \
+					       RUNTIME_INFO(i915)->graphics.version.rel)
 #define IS_GRAPHICS_VER(i915, from, until) \
 	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
 
-#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
-#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
-					       INTEL_INFO(i915)->media.rel)
+#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.version.ver)
+#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.version.ver, \
+					       RUNTIME_INFO(i915)->media.version.rel)
 #define IS_MEDIA_VER(i915, from, until) \
 	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
 
-#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
+#define DISPLAY_VER(i915)	(RUNTIME_INFO(i915)->display.version.ver)
 #define IS_DISPLAY_VER(i915, from, until) \
 	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 26b25d9434d6..f6aaf938c53c 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -34,9 +34,9 @@
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
-	.__runtime.graphics.ver = (x), \
-	.media.ver = (x), \
-	.display.ver = (x)
+	.__runtime.graphics.version.ver = (x), \
+	.__runtime.media.version.ver = (x), \
+	.__runtime.display.version.ver = (x)
 
 #define I845_PIPE_OFFSETS \
 	.display.pipe_offsets = { \
@@ -740,7 +740,7 @@ static const struct intel_device_info bxt_info = {
 static const struct intel_device_info glk_info = {
 	GEN9_LP_FEATURES,
 	PLATFORM(INTEL_GEMINILAKE),
-	.display.ver = 10,
+	.__runtime.display.version.ver = 10,
 	.display.dbuf.size = 1024 - 4, /* 4 blocks for bypass path allocation */
 	GLK_COLORS,
 };
@@ -919,7 +919,7 @@ static const struct intel_device_info rkl_info = {
 static const struct intel_device_info dg1_info = {
 	GEN12_FEATURES,
 	DGFX_FEATURES,
-	.__runtime.graphics.rel = 10,
+	.__runtime.graphics.version.rel = 10,
 	PLATFORM(INTEL_DG1),
 	.__runtime.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
 	.require_force_probe = 1,
@@ -962,7 +962,7 @@ static const struct intel_device_info adl_s_info = {
 	.display.has_hotplug = 1,						\
 	.display.has_ipc = 1,							\
 	.display.has_psr = 1,							\
-	.display.ver = 13,							\
+	.__runtime.display.version.ver = 13,							\
 	.__runtime.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),	\
 	.display.pipe_offsets = {						\
 		[TRANSCODER_A] = PIPE_A_OFFSET,					\
@@ -1006,8 +1006,8 @@ static const struct intel_device_info adl_p_info = {
 		I915_GTT_PAGE_SIZE_2M
 
 #define XE_HP_FEATURES \
-	.__runtime.graphics.ver = 12, \
-	.__runtime.graphics.rel = 50, \
+	.__runtime.graphics.version.ver = 12, \
+	.__runtime.graphics.version.rel = 50, \
 	XE_HP_PAGE_SIZES, \
 	.dma_mask_size = 46, \
 	.has_3d_pipeline = 1, \
@@ -1027,8 +1027,8 @@ static const struct intel_device_info adl_p_info = {
 	.__runtime.ppgtt_type = INTEL_PPGTT_FULL
 
 #define XE_HPM_FEATURES \
-	.media.ver = 12, \
-	.media.rel = 50
+	.__runtime.media.version.ver = 12, \
+	.__runtime.media.version.rel = 50
 
 __maybe_unused
 static const struct intel_device_info xehpsdv_info = {
@@ -1053,8 +1053,8 @@ static const struct intel_device_info xehpsdv_info = {
 	XE_HP_FEATURES, \
 	XE_HPM_FEATURES, \
 	DGFX_FEATURES, \
-	.__runtime.graphics.rel = 55, \
-	.media.rel = 55, \
+	.__runtime.graphics.version.rel = 55, \
+	.__runtime.media.version.rel = 55, \
 	PLATFORM(INTEL_DG2), \
 	.has_4tile = 1, \
 	.has_64k_pages = 1, \
@@ -1097,8 +1097,8 @@ static const struct intel_device_info pvc_info = {
 	XE_HPC_FEATURES,
 	XE_HPM_FEATURES,
 	DGFX_FEATURES,
-	.__runtime.graphics.rel = 60,
-	.media.rel = 60,
+	.__runtime.graphics.version.rel = 60,
+	.__runtime.media.version.rel = 60,
 	PLATFORM(INTEL_PONTEVECCHIO),
 	.display = { 0 },
 	.has_flat_ccs = 0,
@@ -1111,7 +1111,7 @@ static const struct intel_device_info pvc_info = {
 
 #define XE_LPDP_FEATURES	\
 	XE_LPD_FEATURES,	\
-	.display.ver = 14,	\
+	.__runtime.display.version.ver = 14,	\
 	.display.has_cdclk_crawl = 1, \
 	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
 
@@ -1123,9 +1123,9 @@ static const struct intel_device_info mtl_info = {
 	 * Real graphics IP version will be obtained from hardware GMD_ID
 	 * register.  Value provided here is just for sanity checking.
 	 */
-	.__runtime.graphics.ver = 12,
-	.__runtime.graphics.rel = 70,
-	.media.ver = 13,
+	.__runtime.graphics.version.ver = 12,
+	.__runtime.graphics.version.rel = 70,
+	.__runtime.media.version.ver = 13,
 	PLATFORM(INTEL_METEORLAKE),
 	.display.has_modular_fia = 1,
 	.has_flat_ccs = 0,
@@ -1281,7 +1281,7 @@ bool i915_pci_resource_valid(struct pci_dev *pdev, int bar)
 
 static bool intel_mmio_bar_valid(struct pci_dev *pdev, struct intel_device_info *intel_info)
 {
-	int gttmmaddr_bar = intel_info->__runtime.graphics.ver == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
+	int gttmmaddr_bar = intel_info->__runtime.graphics.version.ver == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
 
 	return i915_pci_resource_valid(pdev, gttmmaddr_bar);
 }
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 0a1f97b35f2b..56f19683dd55 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -92,21 +92,29 @@ void intel_device_info_print(const struct intel_device_info *info,
 			     const struct intel_runtime_info *runtime,
 			     struct drm_printer *p)
 {
-	if (runtime->graphics.rel)
-		drm_printf(p, "graphics version: %u.%02u\n", runtime->graphics.ver,
-			   runtime->graphics.rel);
+	if (runtime->graphics.version.rel)
+		drm_printf(p, "graphics version: %u.%02u\n",
+			   runtime->graphics.version.ver,
+			   runtime->graphics.version.rel);
 	else
-		drm_printf(p, "graphics version: %u\n", runtime->graphics.ver);
+		drm_printf(p, "graphics version: %u\n",
+			   runtime->graphics.version.ver);
 
-	if (info->media.rel)
-		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
+	if (runtime->media.version.rel)
+		drm_printf(p, "media version: %u.%02u\n",
+			   runtime->media.version.ver,
+			   runtime->media.version.rel);
 	else
-		drm_printf(p, "media version: %u\n", info->media.ver);
+		drm_printf(p, "media version: %u\n",
+			   runtime->media.version.ver);
 
-	if (info->display.rel)
-		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
+	if (runtime->display.version.rel)
+		drm_printf(p, "display version: %u.%02u\n",
+			   runtime->display.version.ver,
+			   runtime->display.version.rel);
 	else
-		drm_printf(p, "display version: %u\n", info->display.ver);
+		drm_printf(p, "display version: %u\n",
+			   runtime->display.version.ver);
 
 	drm_printf(p, "gt: %d\n", info->gt);
 	drm_printf(p, "memory-regions: %x\n", runtime->memory_regions);
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 6904ad03ca19..d36cf25f1d5f 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -200,7 +200,15 @@ struct ip_version {
 };
 
 struct intel_runtime_info {
-	struct ip_version graphics;
+	struct {
+		struct ip_version version;
+	} graphics;
+	struct {
+		struct ip_version version;
+	} media;
+	struct {
+		struct ip_version version;
+	} display;
 
 	/*
 	 * Platform mask is used for optimizing or-ed IS_PLATFORM calls into
@@ -246,8 +254,6 @@ struct intel_runtime_info {
 };
 
 struct intel_device_info {
-	struct ip_version media;
-
 	enum intel_platform platform;
 
 	unsigned int dma_mask_size; /* available DMA address bits */
@@ -259,9 +265,6 @@ struct intel_device_info {
 #undef DEFINE_FLAG
 
 	struct {
-		u8 ver;
-		u8 rel;
-
 		u8 abox_mask;
 
 		struct {
-- 
2.34.1

