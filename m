Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0D49D3AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3315610E959;
	Wed, 26 Jan 2022 20:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2024910E8FE;
 Wed, 26 Jan 2022 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229388; x=1674765388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LbTosOrCfB7wWrLdZDqMQP13uw25WBqYFqJiDa+F50Y=;
 b=bSRfmSnV7ryo5Thx+Ndb9v4+q2GN0mQAantTX+Jag4aYhl33WNTpBzM3
 HRfrX1pm4bX6LqbrkfwA8ZykdxFY6DwNUoS5+c74lBPRbNFI+XEx1H0rW
 Rs8bK30FaPlVLg+mPqQRcx8f2YEtuj8Rlzn7FiJUi38hyX+aK/l/nZAco
 OSV00anBCdatOo51XnTZ6wFYWBPg3MkD6kQuutYqGwZhovxrPzZnLhenq
 FiHm1K86Ih67zgQcoOcCzIWj2T27Yz0ci5K+/kvHwpE9/Xn/RjvfN2Aoz
 Pb+BWIMhVbTuR0dfEhgO+2LUw7lzpeVtUdCqm58GDsPOWOnWpodUYIz4K w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000516"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000516"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221537"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/19] drm/i915/guc: Prepare for error propagation
Date: Wed, 26 Jan 2022 12:36:58 -0800
Message-Id: <20220126203702.1784589-16-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently guc_mmio_reg_add() relies on having enough memory available in
the array to add a new slot. It uses
`GEM_BUG_ON(count >= regset->size);` to protect going above the
threshold.

In order to allow guc_mmio_reg_add() to handle the memory allocation by
itself, it must return an error in case of failures.  Adjust return code
so this error can be propagated to the callers of guc_mmio_reg_add() and
guc_mmio_regset_init().

No intended change in behavior.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 31 +++++++++++++---------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index cad1e325656e..73ca34de44f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -244,8 +244,8 @@ static int guc_mmio_reg_cmp(const void *a, const void *b)
 	return (int)ra->offset - (int)rb->offset;
 }
 
-static void guc_mmio_reg_add(struct temp_regset *regset,
-			     u32 offset, u32 flags)
+static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
+					  u32 offset, u32 flags)
 {
 	u32 count = regset->used;
 	struct guc_mmio_reg reg = {
@@ -264,7 +264,7 @@ static void guc_mmio_reg_add(struct temp_regset *regset,
 	 */
 	if (bsearch(&reg, regset->registers, count,
 		    sizeof(reg), guc_mmio_reg_cmp))
-		return;
+		return 0;
 
 	slot = &regset->registers[count];
 	regset->used++;
@@ -277,6 +277,8 @@ static void guc_mmio_reg_add(struct temp_regset *regset,
 
 		swap(slot[1], slot[0]);
 	}
+
+	return 0;
 }
 
 #define GUC_MMIO_REG_ADD(regset, reg, masked) \
@@ -284,32 +286,35 @@ static void guc_mmio_reg_add(struct temp_regset *regset,
 			 i915_mmio_reg_offset((reg)), \
 			 (masked) ? GUC_REGSET_MASKED : 0)
 
-static void guc_mmio_regset_init(struct temp_regset *regset,
-				 struct intel_engine_cs *engine)
+static int guc_mmio_regset_init(struct temp_regset *regset,
+				struct intel_engine_cs *engine)
 {
 	const u32 base = engine->mmio_base;
 	struct i915_wa_list *wal = &engine->wa_list;
 	struct i915_wa *wa;
 	unsigned int i;
+	int ret = 0;
 
 	regset->used = 0;
 
-	GUC_MMIO_REG_ADD(regset, RING_MODE_GEN7(base), true);
-	GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
-	GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
+	ret |= GUC_MMIO_REG_ADD(regset, RING_MODE_GEN7(base), true);
+	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
+	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
 
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
-		GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
+		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
 
 	/* Be extra paranoid and include all whitelist registers. */
 	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
-		GUC_MMIO_REG_ADD(regset,
-				 RING_FORCE_TO_NONPRIV(base, i),
-				 false);
+		ret |= GUC_MMIO_REG_ADD(regset,
+					RING_FORCE_TO_NONPRIV(base, i),
+					false);
 
 	/* add in local MOCS registers */
 	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
-		GUC_MMIO_REG_ADD(regset, GEN9_LNCFCMOCS(i), false);
+		ret |= GUC_MMIO_REG_ADD(regset, GEN9_LNCFCMOCS(i), false);
+
+	return ret ? -1 : 0;
 }
 
 static int guc_mmio_reg_state_query(struct intel_guc *guc)
-- 
2.35.0

