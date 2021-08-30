Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EDB3FBD0F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 21:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7807089C99;
	Mon, 30 Aug 2021 19:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BEB89C1B;
 Mon, 30 Aug 2021 19:38:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="198577488"
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="198577488"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 12:38:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="540706025"
Received: from unerlige-ril-10.jf.intel.com ([10.165.21.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 12:38:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, jason@jlekstrand.net
Subject: [PATCH 3/8] drm/i915/gt: Check for conflicting RING_NONPRIV
Date: Mon, 30 Aug 2021 12:38:46 -0700
Message-Id: <20210830193851.15607-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830193851.15607-1-umesh.nerlige.ramappa@intel.com>
References: <20210830193851.15607-1-umesh.nerlige.ramappa@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Strip the encoded bits from the register offset so that we only use the
address for looking up the RING_NONPRIV entry.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 66 +++++++++++++--------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 6928f250cafe..df452a718200 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -80,18 +80,44 @@ static void wa_init_finish(struct i915_wa_list *wal)
 			 wal->wa_count, wal->name, wal->engine_name);
 }
 
+static u32 reg_offset(i915_reg_t reg)
+{
+	return i915_mmio_reg_offset(reg) & RING_FORCE_TO_NONPRIV_ADDRESS_MASK;
+}
+
+static u32 reg_flags(i915_reg_t reg)
+{
+	return i915_mmio_reg_offset(reg) & ~RING_FORCE_TO_NONPRIV_ADDRESS_MASK;
+}
+
+__maybe_unused
+static bool is_nonpriv_flags_valid(u32 flags)
+{
+	/* Check only valid flag bits are set */
+	if (flags & ~RING_FORCE_TO_NONPRIV_MASK_VALID)
+		return false;
+
+	/* NB: Only 3 out of 4 enum values are valid for access field */
+	if ((flags & RING_FORCE_TO_NONPRIV_ACCESS_MASK) ==
+	    RING_FORCE_TO_NONPRIV_ACCESS_INVALID)
+		return false;
+
+	return true;
+}
+
 static int wa_index(struct i915_wa_list *wal, i915_reg_t reg)
 {
-	unsigned int addr = i915_mmio_reg_offset(reg);
 	int start = 0, end = wal->count;
+	u32 addr = reg_offset(reg);
 
 	/* addr and wal->list[].reg, both include the R/W flags */
 	while (start < end) {
 		unsigned int mid = start + (end - start) / 2;
+		u32 pos = reg_offset(wal->list[mid].reg);
 
-		if (i915_mmio_reg_offset(wal->list[mid].reg) < addr)
+		if (pos < addr)
 			start = mid + 1;
-		else if (i915_mmio_reg_offset(wal->list[mid].reg) > addr)
+		else if (pos > addr)
 			end = mid;
 		else
 			return mid;
@@ -117,13 +143,22 @@ static void __wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	struct i915_wa *wa_;
 	int index;
 
+	GEM_BUG_ON(!is_nonpriv_flags_valid(reg_flags(wa->reg)));
+
 	index = wa_index(wal, wa->reg);
 	if (index >= 0) {
 		wa_ = &wal->list[index];
 
+		if (i915_mmio_reg_offset(wa->reg) !=
+		    i915_mmio_reg_offset(wa_->reg)) {
+			DRM_ERROR("Discarding incompatible w/a for reg %04x\n",
+				  reg_offset(wa->reg));
+			return;
+		}
+
 		if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
 			DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
-				  i915_mmio_reg_offset(wa_->reg),
+				  reg_offset(wa_->reg),
 				  wa_->clr, wa_->set);
 
 			wa_->set &= ~wa->clr;
@@ -141,10 +176,8 @@ static void __wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	*wa_ = *wa;
 
 	while (wa_-- > wal->list) {
-		GEM_BUG_ON(i915_mmio_reg_offset(wa_[0].reg) ==
-			   i915_mmio_reg_offset(wa_[1].reg));
-		if (i915_mmio_reg_offset(wa_[1].reg) >
-		    i915_mmio_reg_offset(wa_[0].reg))
+		GEM_BUG_ON(reg_offset(wa_[0].reg) == reg_offset(wa_[1].reg));
+		if (reg_offset(wa_[1].reg) > reg_offset(wa_[0].reg))
 			break;
 
 		swap(wa_[1], wa_[0]);
@@ -160,7 +193,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	if (IS_ALIGNED(wal->count, grow) && /* Either uninitialized or full. */
 	    wa_list_grow(wal, ALIGN(wal->count + 1, grow), GFP_KERNEL)) {
 		DRM_ERROR("Unable to store w/a for reg %04x\n",
-			  i915_mmio_reg_offset(wa->reg));
+			  reg_offset(wa->reg));
 		return;
 	}
 
@@ -1367,21 +1400,6 @@ bool intel_gt_verify_workarounds(struct intel_gt *gt, const char *from)
 	return wa_list_verify(gt, &gt->i915->gt_wa_list, from);
 }
 
-__maybe_unused
-static bool is_nonpriv_flags_valid(u32 flags)
-{
-	/* Check only valid flag bits are set */
-	if (flags & ~RING_FORCE_TO_NONPRIV_MASK_VALID)
-		return false;
-
-	/* NB: Only 3 out of 4 enum values are valid for access field */
-	if ((flags & RING_FORCE_TO_NONPRIV_ACCESS_MASK) ==
-	    RING_FORCE_TO_NONPRIV_ACCESS_INVALID)
-		return false;
-
-	return true;
-}
-
 static void
 whitelist_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
 {
-- 
2.20.1

