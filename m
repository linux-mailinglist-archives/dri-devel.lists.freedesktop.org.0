Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B55F57ED
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 18:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E010910E6BD;
	Wed,  5 Oct 2022 16:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636FA10E6BD;
 Wed,  5 Oct 2022 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664985607; x=1696521607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PI/E6G5dWpl6LN6/Okh1XI7p4hW8NHlqsPstDgGpikw=;
 b=HEqRDK5czGMFJs15jCzb9ZC3m9N5Yr1JFVlP8bwn9/wWZmvoR6voDopV
 Z9QIxEFoiBFEiz0ChrlfhxFp5LVNRRhhiRFMFwP72FAz/OfnT+eA7gDTF
 HPLtjU6TOwemq0Y6hHd67K5LD7agAxrZfqszDuxI+sq0RrqOQuQLZdtx9
 1R/XltHM48x96/6b793EBWq1qZl0rlmFeM10geN3nbspMDD64IVWGYIYv
 IysP7iM4Hr57v9j/ZwemoJ77DDDg7TMXljuDLEKi0Qwxmgax5N7o2gQ22
 REdqD53Ylj+Go1zbRX3cwMI53GkZeteZx9S5QopfDUn+z6w7a3sQJkZHH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="329610502"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="329610502"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 09:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="657550041"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="657550041"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 05 Oct 2022 09:00:05 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/slpc: Update the frequency debugfs
Date: Wed,  5 Oct 2022 08:59:43 -0700
Message-Id: <20221005155943.34747-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221005155943.34747-1-vinay.belgaumkar@intel.com>
References: <20221005155943.34747-1-vinay.belgaumkar@intel.com>
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
v3: Fix compile warning and if condition (Jani)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 46 ++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 737db780db00..fc23c562d9b2 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2219,7 +2219,7 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
 		return intel_gpu_freq(rps, rps->min_freq);
 }
 
-void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
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
+	if (rps_uses_slpc(rps))
+		return slpc_frequency_dump(rps, p);
+	else
+		return rps_frequency_dump(rps, p);
+}
+
 static int set_max_freq(struct intel_rps *rps, u32 val)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
-- 
2.35.1

