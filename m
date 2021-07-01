Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283443B9763
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45256EC3F;
	Thu,  1 Jul 2021 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4869C6EBED;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998662"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998662"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564492"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 31/53] drm/i915/dg2: Report INSTDONE_GEOM values in error state
Date: Thu,  1 Jul 2021 13:24:05 -0700
Message-Id: <20210701202427.1547543-32-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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

Xe_HPG adds some additional INSTDONE_GEOM debug registers; the Mesa team
has indicated that having these reported in the error state would be
useful for debugging GPU hangs.  These registers are replicated per-DSS
with gslice steering.

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  7 +++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  3 +++
 drivers/gpu/drm/i915/i915_gpu_error.c        | 10 ++++++++--
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index e1302e9c168b..b3c002e4ae9f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1220,6 +1220,13 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
 							  GEN7_ROW_INSTDONE);
 			}
 		}
+
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
+			for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice)
+				instdone->geom_svg[slice][subslice] =
+					read_subslice_reg(engine, slice, subslice,
+							  XEHPG_INSTDONE_GEOM_SVG);
+		}
 	} else if (GRAPHICS_VER(i915) >= 7) {
 		instdone->instdone =
 			intel_uncore_read(uncore, RING_INSTDONE(mmio_base));
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index e917b7519f2b..93609d797ac2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -80,6 +80,9 @@ struct intel_instdone {
 	u32 slice_common_extra[2];
 	u32 sampler[GEN_MAX_GSLICES][I915_MAX_SUBSLICES];
 	u32 row[GEN_MAX_GSLICES][I915_MAX_SUBSLICES];
+
+	/* Added in XeHPG */
+	u32 geom_svg[GEN_MAX_GSLICES][I915_MAX_SUBSLICES];
 };
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index c1e744b5ab47..4de7edc451ef 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -431,6 +431,7 @@ static void error_print_instdone(struct drm_i915_error_state_buf *m,
 	const struct sseu_dev_info *sseu = &ee->engine->gt->info.sseu;
 	int slice;
 	int subslice;
+	int iter;
 
 	err_printf(m, "  INSTDONE: 0x%08x\n",
 		   ee->instdone.instdone);
@@ -445,8 +446,6 @@ static void error_print_instdone(struct drm_i915_error_state_buf *m,
 		return;
 
 	if (GRAPHICS_VER_FULL(m->i915) >= IP_VER(12, 50)) {
-		int iter;
-
 		for_each_instdone_gslice_dss_xehp(m->i915, sseu, iter, slice, subslice)
 			err_printf(m, "  SAMPLER_INSTDONE[%d][%d]: 0x%08x\n",
 				   slice, subslice,
@@ -471,6 +470,13 @@ static void error_print_instdone(struct drm_i915_error_state_buf *m,
 	if (GRAPHICS_VER(m->i915) < 12)
 		return;
 
+	if (GRAPHICS_VER_FULL(m->i915) >= IP_VER(12, 55)) {
+		for_each_instdone_gslice_dss_xehp(m->i915, sseu, iter, slice, subslice)
+			err_printf(m, "  GEOM_SVGUNIT_INSTDONE[%d][%d]: 0x%08x\n",
+				   slice, subslice,
+				   ee->instdone.geom_svg[slice][subslice]);
+	}
+
 	err_printf(m, "  SC_INSTDONE_EXTRA: 0x%08x\n",
 		   ee->instdone.slice_common_extra[0]);
 	err_printf(m, "  SC_INSTDONE_EXTRA2: 0x%08x\n",
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 35a42df1f2aa..d58864c7adc6 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2686,6 +2686,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define GEN12_SC_INSTDONE_EXTRA2	_MMIO(0x7108)
 #define GEN7_SAMPLER_INSTDONE	_MMIO(0xe160)
 #define GEN7_ROW_INSTDONE	_MMIO(0xe164)
+#define XEHPG_INSTDONE_GEOM_SVG		_MMIO(0x666c)
 #define MCFG_MCR_SELECTOR		_MMIO(0xfd0)
 #define SF_MCR_SELECTOR			_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR		_MMIO(0xfdc)
-- 
2.25.4

