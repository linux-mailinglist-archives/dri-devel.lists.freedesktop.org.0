Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB14C7437
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE23A10E85B;
	Mon, 28 Feb 2022 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96AD10E84D;
 Mon, 28 Feb 2022 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070187; x=1677606187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QGDXn03pKxuoHCkepAW9TZp4QhjDHX+SqpliJpI0ubE=;
 b=T/hLwf1Fp14mOCDlUAfTPadOOZ6q/YLda8bzE20sHsQsmmbCqrXJjVy8
 GWvGWF2/zLvTiMOIc7+eJoLDBHgDAtP+oWFNH9/RdA7mNknTlY3HRCEh+
 DCoMAmoAj4WgZrdANEddpcp8yJL12ddFbaCsWbDOvxGEpaIy0YnhD3ku6
 ciHB4py6kNbpSh10JLVTrSo9jtHGb2antU5Z8E+y+Nno52ke5mcYKqwCT
 1/xY7qIoh7kRYUcjb5qhI3W44xU+eoowNgnwXDqCHobYBqc8L6wxnyZsx
 QAJB5dM0nrIisWoiYYLFHuap0FL6PgXbUVKQ6BFwBH9I5crnxKkGdn/zu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232913190"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232913190"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392842"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/13] drm/i915/xehp/guc: enable compute engine inside GuC
Date: Mon, 28 Feb 2022 09:42:40 -0800
Message-Id: <20220228174245.1569581-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Tell GuC that CCS is enabled by setting a bit in its ADS.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Original-author: Michel Thierry
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h    | 3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 84f189738a68..e629443e07ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1327,6 +1327,9 @@
 #define   ECOBITS_PPGTT_CACHE64B		(3 << 8)
 #define   ECOBITS_PPGTT_CACHE4B			(0 << 8)
 
+#define GEN12_RCU_MODE				_MMIO(0x14800)
+#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
+
 #define CHV_FUSE_GT				_MMIO(VLV_DISPLAY_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
 #define   CHV_FGT_DISABLE_SS1			(1 << 11)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 847e00390b00..9bb551b83e7a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -335,6 +335,10 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
 	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
 
+	if (engine->class == RENDER_CLASS &&
+	    CCS_MASK(engine->gt))
+		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
+
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
 		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
 
@@ -430,6 +434,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
 				     struct iosys_map *info_map)
 {
 	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
+	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
-- 
2.34.1

