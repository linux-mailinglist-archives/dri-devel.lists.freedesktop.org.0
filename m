Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEBC4C7436
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6158110E86E;
	Mon, 28 Feb 2022 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567CD10E85B;
 Mon, 28 Feb 2022 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070187; x=1677606187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KocxYY6MP+QL9+6gjgPTTBOATFcsbuNL34GklCrNTQo=;
 b=b7vG+0ohhrpB227MLzK6Ww3pHXklo1u9kmDTqF+HcD3nJrf3SI77Af/O
 3UGezP4kh9rK59DHYOSKWYgSOKjnkxy0z5RjcBwj95El56uC1h6q6vvtX
 XC30GwpCutzX+bXJ9MMshPo5/cbMEx+CgSsQlGPCGToMYvFSyYXosWH/J
 e3hoOM/1tkr6EeDIM3pm/7RAHup0Re7T5wU7s4EGCAU/yjbdeR6b88jkh
 hJsewQa1F36VFNl1a5dww7xWHLMR3/lJ30++gjUH6Dd4z3tbGDxUd34B2
 /XojsoQw1dnpUXESe8jm9Dd7eFpP8fvT4GAitoGXDeIE6zcV46l+mJDbg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="252866893"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="252866893"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392854"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/i915/xehp: handle fused off CCS engines
Date: Mon, 28 Feb 2022 09:42:43 -0800
Message-Id: <20220228174245.1569581-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, dri-devel@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

HW resources are divided across the active CCS engines at the compute
slice level, with each CCS having priority on one of the cslices.
If a compute slice has no enabled DSS, its paired compute engine is not
usable in full parallel execution because the other ones already fully
saturate the HW, so consider it fused off.

v2(José):
- moved it to its own function
- fixed definition of ccs_mask

Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 25 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_sseu.c      | 17 ++++++++++++---
 drivers/gpu/drm/i915/gt/intel_sseu.h      |  4 +++-
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 92f4cf9833ee..4fa3adc15b08 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -592,6 +592,29 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
 	return false;
 }
 
+static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_gt_info *info = &gt->info;
+	unsigned int i;
+
+	/*
+	 * If all DSS in a quadrant are fused off, the corresponding CCS
+	 * engine is not available for use.
+	 */
+	if (fls(CCS_MASK(gt)) > 1) {
+		int ss_per_ccs = info->sseu.max_subslices / I915_MAX_CCS;
+		const unsigned long ccs_mask = intel_slicemask_from_dssmask(
+			intel_sseu_get_compute_subslices(&info->sseu),
+			ss_per_ccs);
+
+		for_each_clear_bit(i, &ccs_mask, I915_MAX_CCS) {
+			info->engine_mask &= ~BIT(_CCS(i));
+			drm_dbg(&i915->drm, "ccs%u fused off\n", i);
+		}
+	}
+}
+
 /*
  * Determine which engines are fused off in our particular hardware.
  * Note that we have a catch-22 situation where we need to be able to access
@@ -673,6 +696,8 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 		vebox_mask, VEBOX_MASK(gt));
 	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
 
+	engine_mask_apply_compute_fuses(gt);
+
 	return info->engine_mask;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 29118c652811..4ac0bbaf0c31 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -32,7 +32,9 @@ intel_sseu_subslice_total(const struct sseu_dev_info *sseu)
 	return total;
 }
 
-u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
+static u32
+_intel_sseu_get_subslices(const struct sseu_dev_info *sseu,
+			  const u8 *subslice_mask, u8 slice)
 {
 	int i, offset = slice * sseu->ss_stride;
 	u32 mask = 0;
@@ -40,12 +42,21 @@ u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
 	GEM_BUG_ON(slice >= sseu->max_slices);
 
 	for (i = 0; i < sseu->ss_stride; i++)
-		mask |= (u32)sseu->subslice_mask[offset + i] <<
-			i * BITS_PER_BYTE;
+		mask |= (u32)subslice_mask[offset + i] << i * BITS_PER_BYTE;
 
 	return mask;
 }
 
+u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
+{
+	return _intel_sseu_get_subslices(sseu, sseu->subslice_mask, slice);
+}
+
+u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu)
+{
+	return _intel_sseu_get_subslices(sseu, sseu->compute_subslice_mask, 0);
+}
+
 void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
 			      u8 *subslice_mask, u32 ss_mask)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 60882a74741e..8a79cd8eaab4 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -103,7 +103,9 @@ intel_sseu_subslice_total(const struct sseu_dev_info *sseu);
 unsigned int
 intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice);
 
-u32  intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
+u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
+
+u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu);
 
 void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
 			      u8 *subslice_mask, u32 ss_mask);
-- 
2.34.1

