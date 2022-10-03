Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C55F3987
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 01:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A5810E50A;
	Mon,  3 Oct 2022 23:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4DF10E4FD;
 Mon,  3 Oct 2022 23:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664838280; x=1696374280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ia028kMZc0PczMLFAN2nyH9PGmxzu7xZmPvZNzFCXs=;
 b=RgCy1GGYDgUHf7/BD7HmJfy0ouEkxwYZhScwYNvA6fEwO6Lem7C2ERCr
 CVkmyc6ICPrHr2T2kn9dc/6D9GRoAYzhB+2ZLvrL31yW1YFltFKMxeeOR
 2JKFWXGgwfemMM431kB3oYbj4vPEOM3Uf+03pFU9PHwiQ7W9WyDUhRq7/
 RoUFQsNkC2TZoHUQj8D/4Vi+sb06KM7MLJ/BmhJtYKCf9JNYQqzjJ0QEA
 Hn+56hWHNXXC2L+CDDJArsP5Y50RQ3EVEMKGa7P2lxCbihPTU8uUbS9ZI
 PXdAqPOMzIl090B/bFRZ9L8WbnFRObAfBUzsj9NYhOdAQ2C6mSZV0PAA5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="301500265"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="301500265"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 16:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="798917149"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="798917149"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga005.jf.intel.com with ESMTP; 03 Oct 2022 16:04:39 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/slpc: Update the frequency debugfs
Date: Mon,  3 Oct 2022 16:04:08 -0700
Message-Id: <20221003230408.7313-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003230408.7313-1-vinay.belgaumkar@intel.com>
References: <20221003230408.7313-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 7b0f6b4cfe78..92ab9c36a504 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2382,10 +2382,47 @@ static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
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
 void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 {
 	if (!rps_uses_slpc(rps))
 		return rps_frequency_dump(rps, p);
+	else
+		return slpc_frequency_dump(rps, p);
 }
 
 static int set_max_freq(struct intel_rps *rps, u32 val)
-- 
2.35.1

