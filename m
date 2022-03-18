Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D74DD4D3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 07:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383EC10E979;
	Fri, 18 Mar 2022 06:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA57A10E939;
 Fri, 18 Mar 2022 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647585648; x=1679121648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KgWcYsYlGQk6YvhFJHcH25nJ14LjPS32Fp84DEu6XGw=;
 b=UZYIaF4WfX+x/cb6B6Oeau2JZG2WKPoDa48ss0KBHlsiowFURxNWB7Ek
 M9l9jHZ+u+p4bPdYiLWR7fDTRDlRWvyJzQUGkZukao/Gj0IEel8FvCto+
 aKpQAd2JtBIcxmJxjO70ahhQwoJmunGI+g4JpMdTFGjPs3tFmAoPaeZ9A
 hJfyJ2yZD13yT8AmzJl+UQRWAoL2zPxEkNg9DTlnNeo9RaG9RTVEZQZ9s
 BuHXHn0tnqiNH+0BPu6iUkhPyYSbyuOUPqdP3M/j7ou0W+qxppXo3pQaD
 OjqO+iRmbtpDAZ5VyUys/2uZdIeiSJnuYUlUcLL+BM2KwB+pdomN30ghD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="317787151"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="317787151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 23:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="691205016"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2022 23:40:29 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 04/13] drm/i915/guc: Add DG2 registers for GuC error state
 capture.
Date: Thu, 17 Mar 2022 23:42:51 -0700
Message-Id: <20220318064300.1831909-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318064300.1831909-1-alan.previn.teres.alexis@intel.com>
References: <20220318064300.1831909-1-alan.previn.teres.alexis@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add additional DG2 registers for GuC error state capture.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 80 ++++++++++++++++++-
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 0f2b47139140..15fc36203463 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -285,20 +285,94 @@ guc_capture_alloc_steered_lists_xe_lpd(struct intel_guc *guc,
 	guc->capture->extlists = extlists;
 }
 
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"XEHPG_INSTDONE_GEOM_SVG", XEHPG_INSTDONE_GEOM_SVG}
+};
+
+static bool __has_xehpg_extregs(u32 ipver)
+{
+	return (ipver >= IP_VER(12, 55));
+}
+
+static void
+guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
+				       const struct __guc_mmio_reg_descr_group *lists,
+				       u32 ipver)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct sseu_dev_info *sseu;
+	int slice, subslice, i, iter, num_steer_regs, num_tot_regs = 0;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_mmio_reg_descr_group *extlists;
+	struct __guc_mmio_reg_descr *extarray;
+
+	/* In XE_LP / HPG we only have render-class steering registers during error-capture */
+	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
+					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS, GUC_RENDER_CLASS);
+	/* skip if extlists was previously allocated */
+	if (!list || guc->capture->extlists)
+		return;
+
+	num_steer_regs = ARRAY_SIZE(xe_extregs);
+	if (__has_xehpg_extregs(ipver))
+		num_steer_regs += ARRAY_SIZE(xehpg_extregs);
+
+	sseu = &gt->info.sseu;
+	for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice) {
+		num_tot_regs += num_steer_regs;
+	}
+
+	if (!num_tot_regs)
+		return;
+
+	/* allocate an extra for an end marker */
+	extlists = kcalloc(2, sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
+	if (!extlists)
+		return;
+
+	if (__alloc_ext_regs(&extlists[0], list, num_tot_regs)) {
+		kfree(extlists);
+		return;
+	}
+
+	extarray = extlists[0].extlist;
+	for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice) {
+		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
+			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
+			++extarray;
+		}
+		if (__has_xehpg_extregs(ipver)) {
+			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
+				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
+				++extarray;
+			}
+		}
+	}
+
+	drm_dbg(&i915->drm, "GuC-capture found %d-ext-regs.\n", num_tot_regs);
+	guc->capture->extlists = extlists;
+}
+
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct intel_guc *guc)
 {
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 
-	if (IS_TIGERLAKE(i915) || IS_ROCKETLAKE(i915) ||
-	    IS_ALDERLAKE_S(i915) || IS_ALDERLAKE_P(i915)) {
+	if (GRAPHICS_VER(i915) > 11) {
 		/*
 		 * For certain engine classes, there are slice and subslice
 		 * level registers requiring steering. We allocate and populate
 		 * these at init time based on hw config add it as an extension
 		 * list at the end of the pre-populated render list.
 		 */
-		guc_capture_alloc_steered_lists_xe_lpd(guc, xe_lpd_lists);
+		if (IS_DG2(i915))
+			guc_capture_alloc_steered_lists_xe_hpg(guc, xe_lpd_lists, IP_VER(12, 55));
+		else if (IS_XEHPSDV(i915))
+			guc_capture_alloc_steered_lists_xe_hpg(guc, xe_lpd_lists, IP_VER(12, 50));
+		else
+			guc_capture_alloc_steered_lists_xe_lpd(guc, xe_lpd_lists);
+
 		return xe_lpd_lists;
 	}
 
-- 
2.25.1

