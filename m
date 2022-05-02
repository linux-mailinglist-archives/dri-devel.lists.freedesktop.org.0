Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D151745C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A3F10F06C;
	Mon,  2 May 2022 16:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8DB10F061;
 Mon,  2 May 2022 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509263; x=1683045263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ejxDqASMUHAnbN8YjXXxikuMnH9wFldJYbdxcOM3GRA=;
 b=Ab+zt/mmuuOCtQniqVqwWr6AgBVeofvOqqQZgjjtZHvHGzItP0GOKSOk
 jAGPeegmh47cDoBVP3FxT+LfK9LCulJ60Cm/+kyZ9JzRBpwy7H3vmMvfl
 Jhp/zfeLoXBEIl1e+FaQ/mMQQnSNNXHWhA9GEVLXL0oWlY2vVCzq7W43Y
 YF9o4yiGzVPmC5XB+/CrDlxE5CuiF42fvDiA2Fk3FFnaQa4GUEuZ6DGh/
 lZLYIaGlKKTXE4BUq1H+8ZcfngoUULpso+jN35EiEA2fMbfkwKuE0C5qQ
 CsbSaNatppIRnc0BzrfHU8tEtJMLOTviDaWzOEqKcUtU7DjO3DkUDpekc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266105008"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266105008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781861"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/11] drm/i915/pvc: read fuses for link copy engines
Date: Mon,  2 May 2022 09:34:17 -0700
Message-Id: <20220502163417.2635462-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

The new Link Copy engines in PVC may be fused off according to the
mslice_mask. Each bit of the MEML3_EN_MASK we read from the
GEN10_MIRROR_FUSE3 register disables a pair of link copy engines.

Bspec: 44483
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c6e93db134b1..d10cdeff5072 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -686,6 +686,33 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	}
 }
 
+static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_gt_info *info = &gt->info;
+	unsigned long meml3_mask;
+	u8 quad;
+
+	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
+	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
+
+	/*
+	 * Link Copy engines may be fused off according to meml3_mask. Each
+	 * bit is a quad that houses 2 Link Copy and two Sub Copy engines.
+	 */
+	for_each_clear_bit(quad, &meml3_mask, GEN12_MAX_MSLICES) {
+		intel_engine_mask_t mask = GENMASK(BCS1 + quad * 2 + 1,
+						   BCS1 + quad * 2);
+
+		if (mask & info->engine_mask) {
+			drm_dbg(&i915->drm, "bcs%u fused off\n", quad * 2 + 1);
+			drm_dbg(&i915->drm, "bcs%u fused off\n", quad * 2 + 2);
+
+			info->engine_mask &= ~mask;
+		}
+	}
+}
+
 /*
  * Determine which engines are fused off in our particular hardware.
  * Note that we have a catch-22 situation where we need to be able to access
@@ -768,6 +795,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
 
 	engine_mask_apply_compute_fuses(gt);
+	engine_mask_apply_copy_fuses(gt);
 
 	return info->engine_mask;
 }
-- 
2.35.1

