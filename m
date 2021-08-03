Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6343DF630
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 22:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AFF6E8C6;
	Tue,  3 Aug 2021 20:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461D6E12B;
 Tue,  3 Aug 2021 20:13:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="213499169"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="213499169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 13:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="568776536"
Received: from unerlige-ril-10.jf.intel.com ([10.165.21.208])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 13:13:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/gt: Refactor _wa_add to reuse wa_index and
 wa_list_grow
Date: Tue,  3 Aug 2021 13:13:43 -0700
Message-Id: <20210803201349.31031-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803201349.31031-1-umesh.nerlige.ramappa@intel.com>
References: <20210803201349.31031-1-umesh.nerlige.ramappa@intel.com>
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

From: Chris Wilson <chris.p.wilson@intel.com>

Switch the search and grow code of the _wa_add to use _wa_index and
_wa_list_grow.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 124 +++++++++++---------
 1 file changed, 71 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 011cde0bc38d..94540cdb90c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -60,20 +60,19 @@ static void wa_init_start(struct i915_wa_list *wal, const char *name, const char
 
 #define WA_LIST_CHUNK (1 << 4)
 
-static void wa_init_finish(struct i915_wa_list *wal)
+static void wa_trim(struct i915_wa_list *wal, gfp_t gfp)
 {
+	struct i915_wa *list;
+
 	/* Trim unused entries. */
-	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
-		struct i915_wa *list = kmemdup(wal->list,
-					       wal->count * sizeof(*list),
-					       GFP_KERNEL);
-
-		if (list) {
-			kfree(wal->list);
-			wal->list = list;
-		}
-	}
+	list = krealloc(wal->list, wal->count * sizeof(*list), gfp);
+	if (list)
+		wal->list = list;
+}
 
+static void wa_init_finish(struct i915_wa_list *wal)
+{
+	wa_trim(wal, GFP_KERNEL);
 	if (!wal->count)
 		return;
 
@@ -81,57 +80,60 @@ static void wa_init_finish(struct i915_wa_list *wal)
 			 wal->wa_count, wal->name, wal->engine_name);
 }
 
-static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
+static int wa_index(struct i915_wa_list *wal, i915_reg_t reg)
 {
-	unsigned int addr = i915_mmio_reg_offset(wa->reg);
-	unsigned int start = 0, end = wal->count;
-	const unsigned int grow = WA_LIST_CHUNK;
-	struct i915_wa *wa_;
+	unsigned int addr = i915_mmio_reg_offset(reg);
+	int start = 0, end = wal->count;
 
-	GEM_BUG_ON(!is_power_of_2(grow));
+	/* addr and wal->list[].reg, both include the R/W flags */
+	while (start < end) {
+		unsigned int mid = start + (end - start) / 2;
 
-	if (IS_ALIGNED(wal->count, grow)) { /* Either uninitialized or full. */
-		struct i915_wa *list;
+		if (i915_mmio_reg_offset(wal->list[mid].reg) < addr)
+			start = mid + 1;
+		else if (i915_mmio_reg_offset(wal->list[mid].reg) > addr)
+			end = mid;
+		else
+			return mid;
+	}
 
-		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
-				     GFP_KERNEL);
-		if (!list) {
-			DRM_ERROR("No space for workaround init!\n");
-			return;
-		}
+	return -ENOENT;
+}
 
-		if (wal->list) {
-			memcpy(list, wal->list, sizeof(*wa) * wal->count);
-			kfree(wal->list);
-		}
+static int wa_list_grow(struct i915_wa_list *wal, size_t count, gfp_t gfp)
+{
+	struct i915_wa *list;
 
-		wal->list = list;
-	}
+	list = krealloc(wal->list, count * sizeof(*list), gfp);
+	if (!list)
+		return -ENOMEM;
 
-	while (start < end) {
-		unsigned int mid = start + (end - start) / 2;
+	wal->list = list;
+	return 0;
+}
 
-		if (i915_mmio_reg_offset(wal->list[mid].reg) < addr) {
-			start = mid + 1;
-		} else if (i915_mmio_reg_offset(wal->list[mid].reg) > addr) {
-			end = mid;
-		} else {
-			wa_ = &wal->list[mid];
-
-			if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
-				DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
-					  i915_mmio_reg_offset(wa_->reg),
-					  wa_->clr, wa_->set);
-
-				wa_->set &= ~wa->clr;
-			}
-
-			wal->wa_count++;
-			wa_->set |= wa->set;
-			wa_->clr |= wa->clr;
-			wa_->read |= wa->read;
-			return;
+static void __wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
+{
+	struct i915_wa *wa_;
+	int index;
+
+	index = wa_index(wal, wa->reg);
+	if (index >= 0) {
+		wa_ = &wal->list[index];
+
+		if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
+			DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
+				  i915_mmio_reg_offset(wa_->reg),
+				  wa_->clr, wa_->set);
+
+			wa_->set &= ~wa->clr;
 		}
+
+		wal->wa_count++;
+		wa_->set |= wa->set;
+		wa_->clr |= wa->clr;
+		wa_->read |= wa->read;
+		return;
 	}
 
 	wal->wa_count++;
@@ -149,6 +151,22 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	}
 }
 
+static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
+{
+	const unsigned int grow = WA_LIST_CHUNK;
+
+	GEM_BUG_ON(!is_power_of_2(grow));
+
+	if (IS_ALIGNED(wal->count, grow) && /* Either uninitialized or full. */
+	    wa_list_grow(wal, ALIGN(wal->count + 1, grow), GFP_KERNEL)) {
+		DRM_ERROR("Unable to store w/a for reg %04x\n",
+			  i915_mmio_reg_offset(wa->reg));
+		return;
+	}
+
+	__wa_add(wal, wa);
+}
+
 static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
 		   u32 clear, u32 set, u32 read_mask, bool masked_reg)
 {
-- 
2.20.1

