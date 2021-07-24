Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215C3D43D0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71DF6FD52;
	Sat, 24 Jul 2021 00:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352226FD2C;
 Sat, 24 Jul 2021 00:11:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563469"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563469"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270051"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 26/30] drm/i915: finish removal of CNL
Date: Fri, 23 Jul 2021 17:11:10 -0700
Message-Id: <20210724001114.249295-27-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With all the users removed, finish removing the CNL platform definitions.
We will leave the PCI IDs around as those are exposed to userspace.
Even if mesa doesn't support CNL anymore, let's avoid build breakages
due to changing the headers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          |  7 +------
 drivers/gpu/drm/i915/i915_pci.c          | 23 +++++------------------
 drivers/gpu/drm/i915/i915_perf.c         |  1 -
 drivers/gpu/drm/i915/intel_device_info.c |  2 --
 drivers/gpu/drm/i915/intel_device_info.h |  2 --
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index dd2d196050d4..e3c8283d770c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1437,7 +1437,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_GEMINILAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_GEMINILAKE)
 #define IS_COFFEELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COFFEELAKE)
 #define IS_COMETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
-#define IS_CANNONLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_CANNONLAKE)
 #define IS_ICELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ICELAKE)
 #define IS_JSL_EHL(dev_priv)	(IS_PLATFORM(dev_priv, INTEL_JASPERLAKE) || \
 				IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
@@ -1503,8 +1502,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_CML_GT2(dev_priv)	(IS_COMETLAKE(dev_priv) && \
 				 INTEL_INFO(dev_priv)->gt == 2)
 
-#define IS_CNL_WITH_PORT_F(dev_priv) \
-	IS_SUBPLATFORM(dev_priv, INTEL_CANNONLAKE, INTEL_SUBPLATFORM_PORTF)
 #define IS_ICL_WITH_PORT_F(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_ICELAKE, INTEL_SUBPLATFORM_PORTF)
 
@@ -1649,9 +1646,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 /* WaRsDisableCoarsePowerGating:skl,cnl */
 #define NEEDS_WaRsDisableCoarsePowerGating(dev_priv)			\
-	(IS_CANNONLAKE(dev_priv) ||					\
-	 IS_SKL_GT3(dev_priv) ||					\
-	 IS_SKL_GT4(dev_priv))
+	(IS_SKL_GT3(dev_priv) || IS_SKL_GT4(dev_priv))
 
 #define HAS_GMBUS_IRQ(dev_priv) (GRAPHICS_VER(dev_priv) >= 4)
 #define HAS_GMBUS_BURST_READ(dev_priv) (GRAPHICS_VER(dev_priv) >= 10 || \
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 48ea23dd3b5b..aea2c2d82fbf 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -787,27 +787,13 @@ static const struct intel_device_info cml_gt2_info = {
 	.gt = 2,
 };
 
-#define GEN10_FEATURES \
-	GEN9_FEATURES, \
-	GEN(10), \
-	.dbuf.size = 1024 - 4, /* 4 blocks for bypass path allocation */ \
-	.display.has_dsc = 1, \
-	.has_coherent_ggtt = false, \
-	GLK_COLORS
-
-static const struct intel_device_info cnl_info = {
-	GEN10_FEATURES,
-	PLATFORM(INTEL_CANNONLAKE),
-	.gt = 2,
-};
-
 #define GEN11_DEFAULT_PAGE_SIZES \
 	.page_sizes = I915_GTT_PAGE_SIZE_4K | \
 		      I915_GTT_PAGE_SIZE_64K | \
 		      I915_GTT_PAGE_SIZE_2M
 
 #define GEN11_FEATURES \
-	GEN10_FEATURES, \
+	GEN9_FEATURES, \
 	GEN11_DEFAULT_PAGE_SIZES, \
 	.abox_mask = BIT(0), \
 	.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
@@ -830,10 +816,12 @@ static const struct intel_device_info cnl_info = {
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
 	}, \
 	GEN(11), \
+	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }, \
 	.dbuf.size = 2048, \
 	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2), \
-	.has_logical_ring_elsq = 1, \
-	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
+	.display.has_dsc = 1, \
+	.has_coherent_ggtt = false, \
+	.has_logical_ring_elsq = 1
 
 static const struct intel_device_info icl_info = {
 	GEN11_FEATURES,
@@ -1123,7 +1111,6 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_CML_GT2_IDS(&cml_gt2_info),
 	INTEL_CML_U_GT1_IDS(&cml_gt1_info),
 	INTEL_CML_U_GT2_IDS(&cml_gt2_info),
-	INTEL_CNL_IDS(&cnl_info),
 	INTEL_ICL_11_IDS(&icl_info),
 	INTEL_EHL_IDS(&ehl_info),
 	INTEL_JSL_IDS(&jsl_info),
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 838cc14c2f24..108774d651d9 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4319,7 +4319,6 @@ static void oa_init_supported_formats(struct i915_perf *perf)
 	case INTEL_GEMINILAKE:
 	case INTEL_COFFEELAKE:
 	case INTEL_COMETLAKE:
-	case INTEL_CANNONLAKE:
 	case INTEL_ICELAKE:
 	case INTEL_ELKHARTLAKE:
 	case INTEL_JASPERLAKE:
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 99b51c292942..2893a8659a8b 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -59,7 +59,6 @@ static const char * const platform_names[] = {
 	PLATFORM_NAME(GEMINILAKE),
 	PLATFORM_NAME(COFFEELAKE),
 	PLATFORM_NAME(COMETLAKE),
-	PLATFORM_NAME(CANNONLAKE),
 	PLATFORM_NAME(ICELAKE),
 	PLATFORM_NAME(ELKHARTLAKE),
 	PLATFORM_NAME(JASPERLAKE),
@@ -175,7 +174,6 @@ static const u16 subplatform_ulx_ids[] = {
 };
 
 static const u16 subplatform_portf_ids[] = {
-	INTEL_CNL_PORT_F_IDS(0),
 	INTEL_ICL_PORT_F_IDS(0),
 };
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 616ccec41d76..057c9aa6f9c6 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -76,8 +76,6 @@ enum intel_platform {
 	INTEL_GEMINILAKE,
 	INTEL_COFFEELAKE,
 	INTEL_COMETLAKE,
-	/* gen10 */
-	INTEL_CANNONLAKE,
 	/* gen11 */
 	INTEL_ICELAKE,
 	INTEL_ELKHARTLAKE,
-- 
2.31.1

