Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B49461728
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675736EB1A;
	Mon, 29 Nov 2021 13:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Mon, 29 Nov 2021 13:57:17 UTC
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8986EB1A;
 Mon, 29 Nov 2021 13:57:17 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/16] drm/i915: Ensure gem_contexts selftests work with
 unbind changes.
Date: Mon, 29 Nov 2021 14:47:25 +0100
Message-Id: <20211129134735.628712-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
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

In the next commit, we don't evict when refcount = 0.

igt_vm_isolation() continuously tries to pin/unpin at same address,
but also calls put() on the object, which means the object may not
be unpinned in time.

Instead of this, re-use the same object over and over, so they can
be unbound as required.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_context.c | 54 +++++++++++--------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index b32f7fed2d9c..3fc595b57cf4 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1481,10 +1481,10 @@ static int check_scratch(struct i915_address_space *vm, u64 offset)
 
 static int write_to_scratch(struct i915_gem_context *ctx,
 			    struct intel_engine_cs *engine,
+			    struct drm_i915_gem_object *obj,
 			    u64 offset, u32 value)
 {
 	struct drm_i915_private *i915 = ctx->i915;
-	struct drm_i915_gem_object *obj;
 	struct i915_address_space *vm;
 	struct i915_request *rq;
 	struct i915_vma *vma;
@@ -1497,15 +1497,9 @@ static int write_to_scratch(struct i915_gem_context *ctx,
 	if (err)
 		return err;
 
-	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
-
 	cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
-	if (IS_ERR(cmd)) {
-		err = PTR_ERR(cmd);
-		goto out;
-	}
+	if (IS_ERR(cmd))
+		return PTR_ERR(cmd);
 
 	*cmd++ = MI_STORE_DWORD_IMM_GEN4;
 	if (GRAPHICS_VER(i915) >= 8) {
@@ -1569,17 +1563,19 @@ static int write_to_scratch(struct i915_gem_context *ctx,
 	i915_vma_unpin(vma);
 out_vm:
 	i915_vm_put(vm);
-out:
-	i915_gem_object_put(obj);
+
+	if (!err)
+		err = i915_gem_object_wait(obj, 0, MAX_SCHEDULE_TIMEOUT);
+
 	return err;
 }
 
 static int read_from_scratch(struct i915_gem_context *ctx,
 			     struct intel_engine_cs *engine,
+			     struct drm_i915_gem_object *obj,
 			     u64 offset, u32 *value)
 {
 	struct drm_i915_private *i915 = ctx->i915;
-	struct drm_i915_gem_object *obj;
 	struct i915_address_space *vm;
 	const u32 result = 0x100;
 	struct i915_request *rq;
@@ -1594,10 +1590,6 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 	if (err)
 		return err;
 
-	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
-
 	if (GRAPHICS_VER(i915) >= 8) {
 		const u32 GPR0 = engine->mmio_base + 0x600;
 
@@ -1615,7 +1607,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
 		if (IS_ERR(cmd)) {
 			err = PTR_ERR(cmd);
-			goto out;
+			goto err_unpin;
 		}
 
 		memset(cmd, POISON_INUSE, PAGE_SIZE);
@@ -1651,7 +1643,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
 		if (IS_ERR(cmd)) {
 			err = PTR_ERR(cmd);
-			goto out;
+			goto err_unpin;
 		}
 
 		memset(cmd, POISON_INUSE, PAGE_SIZE);
@@ -1722,8 +1714,10 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 	i915_vma_unpin(vma);
 out_vm:
 	i915_vm_put(vm);
-out:
-	i915_gem_object_put(obj);
+
+	if (!err)
+		err = i915_gem_object_wait(obj, 0, MAX_SCHEDULE_TIMEOUT);
+
 	return err;
 }
 
@@ -1765,6 +1759,7 @@ static int igt_vm_isolation(void *arg)
 	u64 vm_total;
 	u32 expected;
 	int err;
+	struct drm_i915_gem_object *obj_a, *obj_b;
 
 	if (GRAPHICS_VER(i915) < 7)
 		return 0;
@@ -1810,6 +1805,18 @@ static int igt_vm_isolation(void *arg)
 	vm_total = ctx_a->vm->total;
 	GEM_BUG_ON(ctx_b->vm->total != vm_total);
 
+	obj_a = i915_gem_object_create_internal(i915, PAGE_SIZE);
+	if (IS_ERR(obj_a)) {
+		err = PTR_ERR(obj_a);
+		goto out_file;
+	}
+
+	obj_b = i915_gem_object_create_internal(i915, PAGE_SIZE);
+	if (IS_ERR(obj_b)) {
+		err = PTR_ERR(obj_b);
+		goto put_a;
+	}
+
 	count = 0;
 	num_engines = 0;
 	for_each_uabi_engine(engine, i915) {
@@ -1832,10 +1839,10 @@ static int igt_vm_isolation(void *arg)
 						   I915_GTT_PAGE_SIZE, vm_total,
 						   sizeof(u32), alignof_dword);
 
-			err = write_to_scratch(ctx_a, engine,
+			err = write_to_scratch(ctx_a, engine, obj_a,
 					       offset, 0xdeadbeef);
 			if (err == 0)
-				err = read_from_scratch(ctx_b, engine,
+				err = read_from_scratch(ctx_b, engine, obj_b,
 							offset, &value);
 			if (err)
 				goto out_file;
@@ -1858,6 +1865,9 @@ static int igt_vm_isolation(void *arg)
 	pr_info("Checked %lu scratch offsets across %lu engines\n",
 		count, num_engines);
 
+	i915_gem_object_put(obj_b);
+put_a:
+	i915_gem_object_put(obj_a);
 out_file:
 	if (igt_live_test_end(&t))
 		err = -EIO;
-- 
2.34.0

