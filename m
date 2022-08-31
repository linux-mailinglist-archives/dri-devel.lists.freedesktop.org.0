Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BADB5A887A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7661310E507;
	Wed, 31 Aug 2022 21:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFE110E3EB;
 Wed, 31 Aug 2022 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982632; x=1693518632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=625zSDgwHfHiQE0ukolV4XNuMWuZg+5nfNrjHSQTjco=;
 b=Um5wD85LxqeCUEaoLosBucS9WvTtoAgmTN8WmHkD20zfF81Bo5x/ZOOi
 M6G7pQlYWkkZ45hjAiLo439p64/vlhm5UzNhl0WkKnzWlSg2/c5kj7Stt
 GCEvRqDFSGWR9gu+y5O4Rg9iddEipSyvT6B42hMcTapYmBu0eVMQqmK+N
 Zwk+KG5MQM29zTjwhNn5MEcADyqHLdfcZ2UyZ3sU9uIzddAKQ46wW7Qyw
 YdykjaoHPZKN15+oD9+FQs8x17N7DcBVo5gClwg72Z7Qtw07DGPGzt6YP
 42IsjFwl8R+m6ASOyiQT/HkpMZe0rou5onb/4+L3V6cUkQEgF3W8736vR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296833059"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="296833059"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586205"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:30 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/11] drm/i915: Move display and media IP version to
 runtime info
Date: Wed, 31 Aug 2022 14:49:48 -0700
Message-Id: <20220831214958.109753-2-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
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

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          |  8 ++++----
 drivers/gpu/drm/i915/i915_pci.c          | 20 ++++++++++----------
 drivers/gpu/drm/i915/intel_device_info.c | 12 ++++++------
 drivers/gpu/drm/i915/intel_device_info.h | 15 ++++++++++-----
 4 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c9cca165bf5d..bf60593a4ce5 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -475,13 +475,13 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 #define IS_GRAPHICS_VER(i915, from, until) \
 	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
 
-#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
-#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
-					       INTEL_INFO(i915)->media.rel)
+#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.ver)
+#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.ver, \
+					       RUNTIME_INFO(i915)->media.rel)
 #define IS_MEDIA_VER(i915, from, until) \
 	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
 
-#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
+#define DISPLAY_VER(i915)	(RUNTIME_INFO(i915)->display.ver)
 #define IS_DISPLAY_VER(i915, from, until) \
 	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 26b25d9434d6..72577e327c71 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -35,8 +35,8 @@
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
 	.__runtime.graphics.ver = (x), \
-	.media.ver = (x), \
-	.display.ver = (x)
+	.__runtime.media.ver = (x), \
+	.__runtime.display.ver = (x)
 
 #define I845_PIPE_OFFSETS \
 	.display.pipe_offsets = { \
@@ -740,7 +740,7 @@ static const struct intel_device_info bxt_info = {
 static const struct intel_device_info glk_info = {
 	GEN9_LP_FEATURES,
 	PLATFORM(INTEL_GEMINILAKE),
-	.display.ver = 10,
+	.__runtime.display.ver = 10,
 	.display.dbuf.size = 1024 - 4, /* 4 blocks for bypass path allocation */
 	GLK_COLORS,
 };
@@ -962,7 +962,7 @@ static const struct intel_device_info adl_s_info = {
 	.display.has_hotplug = 1,						\
 	.display.has_ipc = 1,							\
 	.display.has_psr = 1,							\
-	.display.ver = 13,							\
+	.__runtime.display.ver = 13,							\
 	.__runtime.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),	\
 	.display.pipe_offsets = {						\
 		[TRANSCODER_A] = PIPE_A_OFFSET,					\
@@ -1027,8 +1027,8 @@ static const struct intel_device_info adl_p_info = {
 	.__runtime.ppgtt_type = INTEL_PPGTT_FULL
 
 #define XE_HPM_FEATURES \
-	.media.ver = 12, \
-	.media.rel = 50
+	.__runtime.media.ver = 12, \
+	.__runtime.media.rel = 50
 
 __maybe_unused
 static const struct intel_device_info xehpsdv_info = {
@@ -1054,7 +1054,7 @@ static const struct intel_device_info xehpsdv_info = {
 	XE_HPM_FEATURES, \
 	DGFX_FEATURES, \
 	.__runtime.graphics.rel = 55, \
-	.media.rel = 55, \
+	.__runtime.media.rel = 55, \
 	PLATFORM(INTEL_DG2), \
 	.has_4tile = 1, \
 	.has_64k_pages = 1, \
@@ -1098,7 +1098,7 @@ static const struct intel_device_info pvc_info = {
 	XE_HPM_FEATURES,
 	DGFX_FEATURES,
 	.__runtime.graphics.rel = 60,
-	.media.rel = 60,
+	.__runtime.media.rel = 60,
 	PLATFORM(INTEL_PONTEVECCHIO),
 	.display = { 0 },
 	.has_flat_ccs = 0,
@@ -1111,7 +1111,7 @@ static const struct intel_device_info pvc_info = {
 
 #define XE_LPDP_FEATURES	\
 	XE_LPD_FEATURES,	\
-	.display.ver = 14,	\
+	.__runtime.display.ver = 14,	\
 	.display.has_cdclk_crawl = 1, \
 	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
 
@@ -1125,7 +1125,7 @@ static const struct intel_device_info mtl_info = {
 	 */
 	.__runtime.graphics.ver = 12,
 	.__runtime.graphics.rel = 70,
-	.media.ver = 13,
+	.__runtime.media.ver = 13,
 	PLATFORM(INTEL_METEORLAKE),
 	.display.has_modular_fia = 1,
 	.has_flat_ccs = 0,
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 0a1f97b35f2b..8ff66b4e11c1 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -98,15 +98,15 @@ void intel_device_info_print(const struct intel_device_info *info,
 	else
 		drm_printf(p, "graphics version: %u\n", runtime->graphics.ver);
 
-	if (info->media.rel)
-		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
+	if (runtime->media.rel)
+		drm_printf(p, "media version: %u.%02u\n", runtime->media.ver, runtime->media.rel);
 	else
-		drm_printf(p, "media version: %u\n", info->media.ver);
+		drm_printf(p, "media version: %u\n", runtime->media.ver);
 
-	if (info->display.rel)
-		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
+	if (runtime->display.rel)
+		drm_printf(p, "display version: %u.%02u\n", runtime->display.ver, runtime->display.rel);
 	else
-		drm_printf(p, "display version: %u\n", info->display.ver);
+		drm_printf(p, "display version: %u\n", runtime->display.ver);
 
 	drm_printf(p, "gt: %d\n", info->gt);
 	drm_printf(p, "memory-regions: %x\n", runtime->memory_regions);
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 6904ad03ca19..6511b25277dc 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -200,7 +200,17 @@ struct ip_version {
 };
 
 struct intel_runtime_info {
+	/*
+	 * On modern platforms, the architecture major.minor version numbers
+	 * and stepping are read directly from the hardware rather than derived
+	 * from the PCI device and revision ID's.
+	 *
+	 * Note that the hardware gives us a single "graphics" number that
+	 * should represent render, compute, and copy behavior.
+	 */
 	struct ip_version graphics;
+	struct ip_version media;
+	struct ip_version display;
 
 	/*
 	 * Platform mask is used for optimizing or-ed IS_PLATFORM calls into
@@ -246,8 +256,6 @@ struct intel_runtime_info {
 };
 
 struct intel_device_info {
-	struct ip_version media;
-
 	enum intel_platform platform;
 
 	unsigned int dma_mask_size; /* available DMA address bits */
@@ -259,9 +267,6 @@ struct intel_device_info {
 #undef DEFINE_FLAG
 
 	struct {
-		u8 ver;
-		u8 rel;
-
 		u8 abox_mask;
 
 		struct {
-- 
2.25.1

