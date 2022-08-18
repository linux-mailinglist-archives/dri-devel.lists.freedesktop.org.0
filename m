Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AFB599159
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF510E665;
	Thu, 18 Aug 2022 23:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192110E3EE;
 Thu, 18 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866151; x=1692402151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tbEtRN6dHvsMKxZq3oAz70k5dFqtVETWUR2Hrdut4Ag=;
 b=WSl4NvQvLS3bub2HB2FVkivTPaZo4WPjWbQ8Gq5vh+pQp7rPSB7YvaXJ
 MwKDD2Xs7QJaIbSEAukxHZCwySB9Xb6Kl6X66+FnQsjZqtxs9tLUIz2qh
 zIhZ9B+BfYk6izJjTiY7yciYB5EoQB41Na/X+Gb1AUQmRVVWZSTDqYoVb
 h4W37JUHdOiT5dRE56Pkyfj9IVa9xaRQLg27C3Ufl0RHYfwgpsMXJ9GxM
 sDEiF903xhh2W1neNWZvdsl9t+nHZHJ+SY911Kj2NfS8N99x5vmsa751P
 IFcX2lPcB0oqJpkUp3TVyk0+BtDAoE8u1izkuWP5VmGhVig6QR3K8Q4Eu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938516"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938516"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953288"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/21] drm/i915/mtl: Define engine context layouts
Date: Thu, 18 Aug 2022 16:41:46 -0700
Message-Id: <20220818234202.451742-6-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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

Bspec: 46261, 46260, 45585
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 47 ++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index eec73c66406c..d3833cbaabcb 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -606,6 +606,49 @@ static const u8 dg2_rcs_offsets[] = {
 	END
 };
 
+static const u8 mtl_rcs_offsets[] = {
+       NOP(1),
+       LRI(15, POSTED),
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
+       REG(0x120),
+       REG(0x124),
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
@@ -624,7 +667,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
 		   !intel_engine_has_relative_mmio(engine));
 
 	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
-		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
+			return mtl_rcs_offsets;
+		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
 			return dg2_rcs_offsets;
 		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
 			return xehp_rcs_offsets;
-- 
2.25.1

