Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5E4C9917
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFE610E882;
	Tue,  1 Mar 2022 23:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3510E838;
 Tue,  1 Mar 2022 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176590; x=1677712590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UT0dVFQp22TPpnclmcizIysi5Ln0VzfknBtpOwM1jWk=;
 b=BkSGNrQZnfHdBHPwcLjk/axAwVrGPc8iFn9hVA2GdNxGi3Bq46Cl9x+E
 D7YOibFTWun4SjfBJNirISk6aceC3dHxfc5xu5DXN59a6M/R8fIqJWkke
 Ca6o69pgqwk9c9Z19W4BJCn++rkA1Y+Ct6AJm+NbapFss0bX/3BKuJK1D
 aLbzeRIc4yfZfJJeN92e+DI9kmbbgTsu0G5MZzzA0rNMmdineiZmITRPV
 MX1Na8kZgfWV/1nL70cd9YjCyoCglBvYxUiXIKvSwtoDt+jIS2PftYjUQ
 UgXzvT1NtcC8SUrulSs822C2KX1szqrTlfKLEv4fd1rN+rzvNtPLBLMsz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479069"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479069"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253496"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 11/13] drm/i915/xehp: handle fused off CCS engines
Date: Tue,  1 Mar 2022 15:15:47 -0800
Message-Id: <20220301231549.1817978-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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

v2 (José):
 - moved it to its own function
 - fixed definition of ccs_mask

v3 (Matt):
 - Replace fls() condition with a simple IP version test

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
index 92f4cf9833ee..809747c20bc4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -592,6 +592,29 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
 	return false;
 }
 
+static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_gt_info *info = &gt->info;
+	int ss_per_ccs = info->sseu.max_subslices / I915_MAX_CCS;
+	const unsigned long ccs_mask =
+		intel_slicemask_from_dssmask(intel_sseu_get_compute_subslices(&info->sseu),
+					     ss_per_ccs);
+	unsigned int i;
+
+	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+		return;
+
+	/*
+	 * If all DSS in a quadrant are fused off, the corresponding CCS
+	 * engine is not available for use.
+	 */
+	for_each_clear_bit(i, &ccs_mask, I915_MAX_CCS) {
+		info->engine_mask &= ~BIT(_CCS(i));
+		drm_dbg(&i915->drm, "ccs%u fused off\n", i);
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

