Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43D5F4BE9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F247C10E29E;
	Tue,  4 Oct 2022 22:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EFC10E1FE;
 Tue,  4 Oct 2022 22:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664922568; x=1696458568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDaJJsdpJWtQvC3lU9/1CnEEgun0jikWSO8gQE62cA8=;
 b=PIL50oQPIFdYQVvDHfolKvrit7x87/tDMxvhFC90wxPMTX+nahNeC2hI
 R9g8M68LEfbWLMZGVGCZ4F6FPRghXhLCeN0Y724+ofa8+H8cvdmQQOYrj
 2rtUMOvd5JxiYBfIMH/Gu97xM26TjDD7RdL8tmG7y7YAOz0xosK4Ee5AN
 87Pelt0wxg1Ok2tLiQl5jOLKQ5WgkGyUUvJJeN7kikOuO7d+en/efGg5U
 2kt78YcNzF9BwdCW5CMfXBFaOB7syiyg9FkjBmVGywSdoig/YkHGQ8yVo
 8rUBS8NXoONNRKT7lHkNBfXeE7ubLC9XHaZy0YkVqNlifT5nh264c0pIm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="329452923"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="329452923"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 15:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="575217718"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="575217718"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 04 Oct 2022 15:29:28 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/slpc: Update the frequency debugfs
Date: Tue,  4 Oct 2022 15:29:03 -0700
Message-Id: <20221004222903.23898-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221004222903.23898-1-vinay.belgaumkar@intel.com>
References: <20221004222903.23898-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Read the values stored in the SLPC structures. Remove the
fields that are no longer valid (like RPS interrupts) as
well.

v2: Move all functionality changes to this patch (Jani)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 46 ++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 737db780db00..8181d85e89f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2219,7 +2219,7 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
 		return intel_gpu_freq(rps, rps->min_freq);
 }
 
-void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 	struct drm_i915_private *i915 = gt->i915;
@@ -2382,6 +2382,50 @@ void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 		   intel_gpu_freq(rps, rps->efficient_freq));
 }
 
+static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+	struct intel_uncore *uncore = gt->uncore;
+	struct intel_rps_freq_caps caps;
+	u32 pm_mask;
+
+	gen6_rps_get_freq_caps(rps, &caps);
+	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
+
+	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
+	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
+		   rps->pm_intrmsk_mbz);
+	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
+	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
+	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.min_freq));
+	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.rp1_freq));
+	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.rp0_freq));
+	drm_printf(p, "Current freq: %d MHz\n",
+		   intel_rps_get_requested_frequency(rps));
+	drm_printf(p, "Actual freq: %d MHz\n",
+		   intel_rps_read_actual_frequency(rps));
+	drm_printf(p, "Min freq: %d MHz\n",
+		   intel_rps_get_min_frequency(rps));
+	drm_printf(p, "Boost freq: %d MHz\n",
+		   intel_rps_get_boost_frequency(rps));
+	drm_printf(p, "Max freq: %d MHz\n",
+		   intel_rps_get_max_frequency(rps));
+	drm_printf(p,
+		   "efficient (RPe) frequency: %d MHz\n",
+		   intel_gpu_freq(rps, caps.rp1_freq));
+}
+
+void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+{
+	if (!rps_uses_slpc(rps))
+		return rps_frequency_dump(rps, p);
+	else
+		return slpc_frequency_dump(rps, p);
+}
+
 static int set_max_freq(struct intel_rps *rps, u32 val)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
-- 
2.35.1

