Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF113B885
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 04:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA2B6E84B;
	Wed, 15 Jan 2020 03:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1039A6E844;
 Wed, 15 Jan 2020 03:59:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; 
 d="scan'208,217";a="242720346"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 19:52:23 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@intel.com, daniel@ffwll.ch, sam@ravnborg.org,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Imre Deak <imre.deak@intel.com>,
 CQ Tang <cq.tang@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [[Intel-gfx] [PATCH v2 06/10] drm/i915/gt: Make WARN* drm specific
 where drm_priv ptr is available
Date: Wed, 15 Jan 2020 09:14:50 +0530
Message-Id: <20200115034455.17658-7-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

command: spatch --sp-file <script> --dir drivers/gpu/drm/i915/gt \
					--linux-spacing --in-place

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  3 ++-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  6 +++---
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  4 ++--
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_rps.c           | 20 ++++++++++---------
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
 8 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index f451ef376548..1d40cba90c1b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -432,9 +432,9 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	unsigned int i;
 	int err;
 
-	WARN_ON(engine_mask == 0);
-	WARN_ON(engine_mask &
-		GENMASK(BITS_PER_TYPE(mask) - 1, I915_NUM_ENGINES));
+	drm_WARN_ON(&i915->drm, engine_mask == 0);
+	drm_WARN_ON(&i915->drm, engine_mask &
+		    GENMASK(BITS_PER_TYPE(mask) - 1, I915_NUM_ENGINES));
 
 	if (i915_inject_probe_failure(i915))
 		return -ENODEV;
@@ -455,7 +455,7 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	 * are added to the driver by a warning and disabling the forgotten
 	 * engines.
 	 */
-	if (WARN_ON(mask != engine_mask))
+	if (drm_WARN_ON(&i915->drm, mask != engine_mask))
 		device_info->engine_mask = mask;
 
 	RUNTIME_INFO(i915)->num_engines = hweight32(mask);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 9e7f12bef828..848decee9066 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -278,7 +278,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 			}
 		}
 
-		if (WARN(errors, "Invalid UABI engine mapping found"))
+		if (drm_WARN(&i915->drm, errors,
+			     "Invalid UABI engine mapping found"))
 			i915->uabi_engines = RB_ROOT;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 16acdc5d6734..45d8e0019a8e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -448,9 +448,9 @@ void gtt_write_workarounds(struct intel_gt *gt)
 		intel_uncore_write(uncore,
 				   HSW_GTT_CACHE_EN,
 				   can_use_gtt_cache ? GTT_CACHE_EN_ALL : 0);
-		WARN_ON_ONCE(can_use_gtt_cache &&
-			     intel_uncore_read(uncore,
-					       HSW_GTT_CACHE_EN) == 0);
+		drm_WARN_ON_ONCE(&i915->drm, can_use_gtt_cache &&
+				 intel_uncore_read(uncore,
+						   HSW_GTT_CACHE_EN) == 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index eeef90b55c64..0afc1eb3c20f 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -300,8 +300,8 @@ static bool get_mocs_settings(const struct drm_i915_private *i915,
 		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
 		table->table = broxton_mocs_table;
 	} else {
-		WARN_ONCE(INTEL_GEN(i915) >= 9,
-			  "Platform that should have a MOCS table does not.\n");
+		drm_WARN_ONCE(&i915->drm, INTEL_GEN(i915) >= 9,
+			      "Platform that should have a MOCS table does not.\n");
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 9e303c29d6e3..46e48c5b1b58 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -713,7 +713,7 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 	 */
 	i = (i915_mmio_reg_offset(reg) -
 	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
-	if (WARN_ON_ONCE(i >= ARRAY_SIZE(rc6->cur_residency)))
+	if (drm_WARN_ON_ONCE(&i915->drm, i >= ARRAY_SIZE(rc6->cur_residency)))
 		return 0;
 
 	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index bc44fe8e5ffa..7e2c6ac7d6b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -568,7 +568,8 @@ static void flush_cs_tlb(struct intel_engine_cs *engine)
 		return;
 
 	/* ring should be idle before issuing a sync flush*/
-	WARN_ON((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	drm_WARN_ON(&dev_priv->drm,
+		    (ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
 
 	ENGINE_WRITE(engine, RING_INSTPM,
 		     _MASKED_BIT_ENABLE(INSTPM_TLB_INVALIDATE |
@@ -1787,8 +1788,8 @@ static void ring_release(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *dev_priv = engine->i915;
 
-	WARN_ON(INTEL_GEN(dev_priv) > 2 &&
-		(ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	drm_WARN_ON(&dev_priv->drm, INTEL_GEN(dev_priv) > 2 &&
+		    (ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
 
 	intel_engine_cleanup_common(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index d2a3d935d186..30ae29b30f11 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1026,7 +1026,8 @@ static bool chv_rps_enable(struct intel_rps *rps)
 	vlv_punit_put(i915);
 
 	/* RPS code assumes GPLL is used */
-	WARN_ONCE((val & GPLLENABLE) == 0, "GPLL not enabled\n");
+	drm_WARN_ONCE(&i915->drm, (val & GPLLENABLE) == 0,
+		      "GPLL not enabled\n");
 
 	DRM_DEBUG_DRIVER("GPLL enabled? %s\n", yesno(val & GPLLENABLE));
 	DRM_DEBUG_DRIVER("GPU status: 0x%08x\n", val);
@@ -1123,7 +1124,8 @@ static bool vlv_rps_enable(struct intel_rps *rps)
 	vlv_punit_put(i915);
 
 	/* RPS code assumes GPLL is used */
-	WARN_ONCE((val & GPLLENABLE) == 0, "GPLL not enabled\n");
+	drm_WARN_ONCE(&i915->drm, (val & GPLLENABLE) == 0,
+		      "GPLL not enabled\n");
 
 	DRM_DEBUG_DRIVER("GPLL enabled? %s\n", yesno(val & GPLLENABLE));
 	DRM_DEBUG_DRIVER("GPU status: 0x%08x\n", val);
@@ -1191,11 +1193,11 @@ void intel_rps_enable(struct intel_rps *rps)
 	if (!rps->enabled)
 		return;
 
-	WARN_ON(rps->max_freq < rps->min_freq);
-	WARN_ON(rps->idle_freq > rps->max_freq);
+	drm_WARN_ON(&i915->drm, rps->max_freq < rps->min_freq);
+	drm_WARN_ON(&i915->drm, rps->idle_freq > rps->max_freq);
 
-	WARN_ON(rps->efficient_freq < rps->min_freq);
-	WARN_ON(rps->efficient_freq > rps->max_freq);
+	drm_WARN_ON(&i915->drm, rps->efficient_freq < rps->min_freq);
+	drm_WARN_ON(&i915->drm, rps->efficient_freq > rps->max_freq);
 }
 
 static void gen6_rps_disable(struct intel_rps *rps)
@@ -1390,9 +1392,9 @@ static void chv_rps_init(struct intel_rps *rps)
 			BIT(VLV_IOSF_SB_NC) |
 			BIT(VLV_IOSF_SB_CCK));
 
-	WARN_ONCE((rps->max_freq | rps->efficient_freq | rps->rp1_freq |
-		   rps->min_freq) & 1,
-		  "Odd GPU freq values\n");
+	drm_WARN_ONCE(&i915->drm, (rps->max_freq | rps->efficient_freq |
+				   rps->rp1_freq | rps->min_freq) & 1,
+		      "Odd GPU freq values\n");
 }
 
 static void vlv_c0_read(struct intel_uncore *uncore, struct intel_rps_ei *ei)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4e292d4bf7b9..5a7db279f702 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -827,7 +827,7 @@ wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 		DRM_WARN("No common index found between subslice mask %x and L3 bank mask %x!\n",
 			 intel_sseu_get_subslices(sseu, slice), l3_en);
 		subslice = fls(l3_en);
-		WARN_ON(!subslice);
+		drm_WARN_ON(&i915->drm, !subslice);
 	}
 	subslice--;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
