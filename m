Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC125B106F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 01:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D850A10E54B;
	Wed,  7 Sep 2022 23:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44BB10E22D;
 Wed,  7 Sep 2022 23:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662593627; x=1694129627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qKd+l6UBRJa0+GTjguk5p+CviZBh8gBgWHo8LB7Bjmc=;
 b=Qtl0/YJfw4unN5/cWc1JR96VHK558qpoaTXSKxNBmhHKyScIHitgTDM4
 ttBn3KMTyv3mdICAdFPQ81nTHBQCzN4P/0gar64RfwJ7gj/d6PTdkLTix
 +Ob+zxyKxWkvfqw1uVpHVKW7hwuv0L9kGm+03+KA25aLh5B3MfaK6QT4X
 cyJVr8gshoK3gw3p36sDBW/NSTUJHeHSpU5gXHYeqmWo5R5WnhJBqlGHj
 CwZugl0mS/lKCzPXGXRIDh59s/MQZ7Pksfh/4ud/etglHNLTGpyuXOOHF
 hhpaTLTlMzLuKS+qMDGJHWnFPHNx8FUOLOOIAezrnKjtRn/or1oJrrrjY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="298358425"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="298358425"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:33:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="943105942"
Received: from invictus.jf.intel.com ([10.165.21.188])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:33:46 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4.1] drm/i915/mtl: Define engine context layouts
Date: Wed,  7 Sep 2022 16:33:17 -0700
Message-Id: <20220907233317.357721-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902060342.151824-5-radhakrishna.sripada@intel.com>
References: <20220902060342.151824-5-radhakrishna.sripada@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

The part of the media and blitter engine contexts that we care about for
setting up an initial state are the same on MTL as they were on DG2
(and PVC), so we need to update the driver conditions to re-use the DG2
context table.

For render/compute engines, the part of the context images are nearly
the same, although the layout had a very slight change --- one POSH
register was removed and the placement of some LRI/noops adjusted
slightly to compensate.

v2:
 - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
 - Drop unused registers in mtl rcs offsets.(Bala)
 - Add missing nop in xcs offsets(Bala)

Bspec: 46261, 46260, 45585
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 82 ++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 070cec4ff8a4..a2247d39bdb7 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -264,6 +264,39 @@ static const u8 dg2_xcs_offsets[] = {
 	END
 };
 
+static const u8 mtl_xcs_offsets[] = {
+	NOP(1),
+	LRI(13, POSTED),
+	REG16(0x244),
+	REG(0x034),
+	REG(0x030),
+	REG(0x038),
+	REG(0x03c),
+	REG(0x168),
+	REG(0x140),
+	REG(0x110),
+	REG(0x1c0),
+	REG(0x1c4),
+	REG(0x1c8),
+	REG(0x180),
+	REG16(0x2b4),
+	NOP(1),
+
+	NOP(1),
+	LRI(9, POSTED),
+	REG16(0x3a8),
+	REG16(0x28c),
+	REG16(0x288),
+	REG16(0x284),
+	REG16(0x280),
+	REG16(0x27c),
+	REG16(0x278),
+	REG16(0x274),
+	REG16(0x270),
+
+	END
+};
+
 static const u8 gen8_rcs_offsets[] = {
 	NOP(1),
 	LRI(14, POSTED),
@@ -606,6 +639,47 @@ static const u8 dg2_rcs_offsets[] = {
 	END
 };
 
+static const u8 mtl_rcs_offsets[] = {
+       NOP(1),
+       LRI(13, POSTED),
+       REG16(0x244),
+       REG(0x034),
+       REG(0x030),
+       REG(0x038),
+       REG(0x03c),
+       REG(0x168),
+       REG(0x140),
+       REG(0x110),
+       REG(0x1c0),
+       REG(0x1c4),
+       REG(0x1c8),
+       REG(0x180),
+       REG16(0x2b4),
+
+       NOP(1),
+       LRI(9, POSTED),
+       REG16(0x3a8),
+       REG16(0x28c),
+       REG16(0x288),
+       REG16(0x284),
+       REG16(0x280),
+       REG16(0x27c),
+       REG16(0x278),
+       REG16(0x274),
+       REG16(0x270),
+
+       NOP(2),
+       LRI(2, POSTED),
+       REG16(0x5a8),
+       REG16(0x5ac),
+
+       NOP(6),
+       LRI(1, 0),
+       REG(0x0c8),
+
+       END
+};
+
 #undef END
 #undef REG16
 #undef REG
@@ -624,7 +698,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
 		   !intel_engine_has_relative_mmio(engine));
 
 	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
-		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
+			return mtl_rcs_offsets;
+		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
 			return dg2_rcs_offsets;
 		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
 			return xehp_rcs_offsets;
@@ -637,7 +713,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
 		else
 			return gen8_rcs_offsets;
 	} else {
-		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
+			return mtl_xcs_offsets;
+		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
 			return dg2_xcs_offsets;
 		else if (GRAPHICS_VER(engine->i915) >= 12)
 			return gen12_xcs_offsets;
-- 
2.34.1

