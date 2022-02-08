Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E404AD5A8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7410E68A;
	Tue,  8 Feb 2022 10:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A2C10E666;
 Tue,  8 Feb 2022 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317114; x=1675853114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/OoRPDXX62riH3Q2+wOmv/AJ58yGC4ThJd5eiZHi2I=;
 b=MzN6GZ+rx97ZxsMHqXY0r7npsLGj3ravKEAUdtZeC1LBD6TzuwTYS2Mf
 ctmICCI2nNOG/RyEU2dKAIzb6sjcmZxyOZFLlxeI/ABBCH5PQazLbfE1K
 ib5BHHrkvy0Ku7gdrLLPH/84onX9Ukyjz39SuHSz3YVAdOxsrx6Xte3pf
 duV8h1VoTiedVZ9LBd4Fw8if8YI3bYzl9mlOivI1ciucNKoAdnLh89AHY
 a4IRnKzgMO6p/YFj6+jHOOSEkh8gi/PzI8uRsm2eZuQp+XFfBU/p/aq2E
 Y1GFdX1TMfOCydr2iULEgjQP7F+N/zYMrT0QQOLl/TfrnPcSrH1J4Y1za w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="246511559"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="246511559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804149"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/18] drm/i915/guc: Prepare for error propagation
Date: Tue,  8 Feb 2022 02:45:20 -0800
Message-Id: <20220208104524.2516209-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208104524.2516209-1-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 31 +++++++++++++---------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 1f6a3d4d9431..21e975d371e6 100644
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
2.35.1

