Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D572216C316
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D094D6EADC;
	Tue, 25 Feb 2020 13:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96D36EADE;
 Tue, 25 Feb 2020 13:58:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153154"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:58:52 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [Intel-gfx][PATCH 10/10] drm/i915: Make MISSING_CASE backtrace i915
 specific
Date: Tue, 25 Feb 2020 19:17:09 +0530
Message-Id: <20200225134709.6153-11-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_MISSING_CASE macro includes the device information in the
backtrace, so we know what device the warnings originate from.

Covert MISSING_CASE calls with i915 specific i915_MISSING_CASE variant
in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c       |  3 ++-
 drivers/gpu/drm/i915/i915_drv.c           |  2 +-
 drivers/gpu/drm/i915/i915_gem_fence_reg.c |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c     |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c  | 13 +++++++------
 drivers/gpu/drm/i915/intel_pm.c           | 10 +++++-----
 6 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 8f2525e4ce0f..fa2cbee62a3b 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -192,7 +192,8 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 				break;
 
 			default:
-				MISSING_CASE(vma->ggtt_view.type);
+				i915_MISSING_CASE(dev_priv,
+						  vma->ggtt_view.type);
 				break;
 			}
 		}
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index dba5fe1391e8..fe328fcc4267 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -784,7 +784,7 @@ skl_get_dram_type(struct drm_i915_private *dev_priv)
 	case SKL_DRAM_DDR_TYPE_LPDDR4:
 		return INTEL_DRAM_LPDDR4;
 	default:
-		MISSING_CASE(val);
+		i915_MISSING_CASE(dev_priv, val);
 		return INTEL_DRAM_UNKNOWN;
 	}
 }
diff --git a/drivers/gpu/drm/i915/i915_gem_fence_reg.c b/drivers/gpu/drm/i915/i915_gem_fence_reg.c
index 049cd3785347..8a417085265d 100644
--- a/drivers/gpu/drm/i915/i915_gem_fence_reg.c
+++ b/drivers/gpu/drm/i915/i915_gem_fence_reg.c
@@ -908,5 +908,5 @@ void intel_gt_init_swizzling(struct intel_gt *gt)
 				   GAMTARBMODE,
 				   _MASKED_BIT_ENABLE(ARB_MODE_SWIZZLE_BDW));
 	else
-		MISSING_CASE(INTEL_GEN(i915));
+		i915_MISSING_CASE(i915, INTEL_GEN(i915));
 }
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2a4cd0ba5464..9bdc9835a318 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1150,7 +1150,7 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
 		if (IS_GEN(i915, 7)) {
 			switch (engine->id) {
 			default:
-				MISSING_CASE(engine->id);
+				i915_MISSING_CASE(i915, engine->id);
 				/* fall through */
 			case RCS0:
 				mmio = RENDER_HWS_PGA_GEN7;
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 8e99ad097830..5e2f32d6643a 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -615,7 +615,7 @@ static void hsw_sseu_info_init(struct drm_i915_private *dev_priv)
 	 */
 	switch (INTEL_INFO(dev_priv)->gt) {
 	default:
-		MISSING_CASE(INTEL_INFO(dev_priv)->gt);
+		i915_MISSING_CASE(dev_priv, INTEL_INFO(dev_priv)->gt);
 		/* fall through */
 	case 1:
 		sseu->slice_mask = BIT(0);
@@ -634,8 +634,8 @@ static void hsw_sseu_info_init(struct drm_i915_private *dev_priv)
 	fuse1 = I915_READ(HSW_PAVP_FUSE1);
 	switch ((fuse1 & HSW_F1_EU_DIS_MASK) >> HSW_F1_EU_DIS_SHIFT) {
 	default:
-		MISSING_CASE((fuse1 & HSW_F1_EU_DIS_MASK) >>
-			     HSW_F1_EU_DIS_SHIFT);
+		i915_MISSING_CASE(dev_priv, (fuse1 & HSW_F1_EU_DIS_MASK) >>
+				  HSW_F1_EU_DIS_SHIFT);
 		/* fall through */
 	case HSW_F1_EU_DIS_10EUS:
 		sseu->eu_per_subslice = 10;
@@ -701,7 +701,7 @@ static u32 gen10_get_crystal_clock_freq(struct drm_i915_private *dev_priv,
 	case GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
 		return f24_mhz;
 	default:
-		MISSING_CASE(crystal_clock);
+		i915_MISSING_CASE(dev_priv, crystal_clock);
 		return 0;
 	}
 }
@@ -727,7 +727,7 @@ static u32 gen11_get_crystal_clock_freq(struct drm_i915_private *dev_priv,
 	case GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
 		return f25_mhz;
 	default:
-		MISSING_CASE(crystal_clock);
+		i915_MISSING_CASE(dev_priv, crystal_clock);
 		return 0;
 	}
 }
@@ -805,7 +805,8 @@ static u32 read_timestamp_frequency(struct drm_i915_private *dev_priv)
 		return freq;
 	}
 
-	MISSING_CASE("Unknown gen, unable to read command streamer timestamp frequency\n");
+	i915_MISSING_CASE(dev_priv,
+			  "Unknown gen, unable to read command streamer timestamp frequency\n");
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 22aa205793e5..f3fa012ef98a 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -491,7 +491,7 @@ static void vlv_get_fifo_size(struct intel_crtc_state *crtc_state)
 		sprite1_start = VLV_FIFO_START(dsparb3, dsparb2, 8, 20);
 		break;
 	default:
-		MISSING_CASE(pipe);
+		i915_MISSING_CASE(dev_priv, pipe);
 		return;
 	}
 
@@ -2922,7 +2922,7 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
 		wm[1] = (mltr >> MLTR_WM1_SHIFT) & ILK_SRLT_MASK;
 		wm[2] = (mltr >> MLTR_WM2_SHIFT) & ILK_SRLT_MASK;
 	} else {
-		MISSING_CASE(INTEL_DEVID(dev_priv));
+		i915_MISSING_CASE(dev_priv, INTEL_DEVID(dev_priv));
 	}
 }
 
@@ -3657,7 +3657,7 @@ skl_setup_sagv_block_time(struct drm_i915_private *dev_priv)
 		dev_priv->sagv_block_time_us = 30;
 		return;
 	} else {
-		MISSING_CASE(INTEL_GEN(dev_priv));
+		i915_MISSING_CASE(dev_priv, INTEL_GEN(dev_priv));
 	}
 
 	/* Default to an unusable block time */
@@ -4905,7 +4905,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 			wp->y_min_scanlines = 4;
 			break;
 		default:
-			MISSING_CASE(wp->cpp);
+			i915_MISSING_CASE(dev_priv, wp->cpp);
 			return -EINVAL;
 		}
 	} else {
@@ -7420,7 +7420,7 @@ void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv)
 	else if (IS_GEN(dev_priv, 2))
 		dev_priv->display.init_clock_gating = i830_init_clock_gating;
 	else {
-		MISSING_CASE(INTEL_DEVID(dev_priv));
+		i915_MISSING_CASE(dev_priv, INTEL_DEVID(dev_priv));
 		dev_priv->display.init_clock_gating = nop_init_clock_gating;
 	}
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
