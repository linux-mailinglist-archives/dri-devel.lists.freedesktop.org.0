Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA734BF976
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526B510E60D;
	Tue, 22 Feb 2022 13:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05F10E60D;
 Tue, 22 Feb 2022 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645536743; x=1677072743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4IqvqolAxjeFFgFTKqXmXPzXbdUkY9IDyNwR8EyOqBI=;
 b=Bj4iZeD4Yi8LvMcvXlvDZAvOxhIwQsKEtYbBJMbVAJXFjSlpKW9fkTjX
 Xl8WS4Bjt8o5xWacgzqEVCBWJkQe5DD9jGYcUEl2pnvjiktYmA6L4b/oc
 Ae+RjIGVeq2krHeS+PJQFqWjwgBaAQD7dtxYNc9608c59WzBhvnYtc5AJ
 JYovARBBngDEfB3OyL4nTit5xQQFeOKUGR2FZS0R1Hg8XLC3q8qDBr7Li
 6osvkT9ZijVV5yh5A2+YgcHHYYMDEG7qDi3WZn9kexqZmrHD1LZTo0AEz
 E5FZRfigp02Gnq/pdiO/zDF27nfZ+nw3lRzQJ4lkgHR7z6Qt0MaZtsVqm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314943295"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="314943295"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:32:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="532226841"
Received: from tnguyen8-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:32:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Clarify vma lifetime
Date: Tue, 22 Feb 2022 14:32:09 +0100
Message-Id: <20220222133209.587978-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's unclear what reference the initial vma kref reference refers to.
A vma can have multiple weak references, the object vma list,
the vm's bound list and the GT's closed_list, and the initial vma
reference can be put from lookups of all these lists.

With the current implementation this means
that any holder of yet another vma refcount (currently only
i915_gem_object_unbind()) needs to be holding two of either
*) An object refcount,
*) A vm open count
*) A vma open count

in order for us to not risk leaking a reference by having the
initial vma reference being put twice.

Address this by re-introducing i915_vma_destroy() which removes all
weak references of the vma and *then* puts the initial vma refcount.
This makes a strong vma reference hold on to the vma unconditionally.

Perhaps a better name would be i915_vma_revoke() or i915_vma_zombify(),
since other callers may still hold a refcount, but with the prospect of
being able to replace the vma refcount with the object lock in the near
future, let's stick with i915_vma_destroy().

Finally this commit fixes a race in that previously i915_vma_release() and
now i915_vma_destroy() could destroy a vma without taking the vm->mutex
after an advisory check that the vma mm_node was not allocated.
This would race with the ungrab_vma() function creating a trace similar
to the below one. This was fixed in one of the __i915_vma_put() callsites
in
commit bc1922e5d349 ("drm/i915: Fix a race between vma / object destruction and unbinding")
but although not seemingly triggered by CI, that
is not sufficient. This patch is needed to fix that properly.

[823.012188] Console: switching to colour dummy device 80x25
[823.012422] [IGT] gem_ppgtt: executing
[823.016667] [IGT] gem_ppgtt: starting subtest blt-vs-render-ctx0
[852.436465] stack segment: 0000 [#1] PREEMPT SMP NOPTI
[852.436480] CPU: 0 PID: 3200 Comm: gem_ppgtt Not tainted 5.16.0-CI-CI_DRM_11115+ #1
[852.436489] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2422.A00.2110131104 10/13/2021
[852.436499] RIP: 0010:ungrab_vma+0x9/0x80 [i915]
[852.436711] Code: ef e8 4b 85 cf e0 e8 36 a3 d6 e0 8b 83 f8 9c 00 00 85 c0 75 e1 5b 5d 41 5c 41 5d c3 e9 d6 fd 14 00 55 53 48 8b af c0 00 00 00 <8b> 45 00 85 c0 75 03 5b 5d c3 48 8b 85 a0 02 00 00 48 89 fb 48 8b
[852.436727] RSP: 0018:ffffc90006db7880 EFLAGS: 00010246
[852.436734] RAX: 0000000000000000 RBX: ffffc90006db7598 RCX: 0000000000000000
[852.436742] RDX: ffff88815349e898 RSI: ffff88815349e858 RDI: ffff88810a284140
[852.436748] RBP: 6b6b6b6b6b6b6b6b R08: ffff88815349e898 R09: ffff88815349e8e8
[852.436754] R10: 0000000000000001 R11: 0000000051ef1141 R12: ffff88810a284140
[852.436762] R13: 0000000000000000 R14: ffff88815349e868 R15: ffff88810a284458
[852.436770] FS:  00007f5c04b04e40(0000) GS:ffff88849f000000(0000) knlGS:0000000000000000
[852.436781] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[852.436788] CR2: 00007f5c04b38fe0 CR3: 000000010a6e8001 CR4: 0000000000770ef0
[852.436797] PKRU: 55555554
[852.436801] Call Trace:
[852.436806]  <TASK>
[852.436811]  i915_gem_evict_for_node+0x33c/0x3c0 [i915]
[852.437014]  i915_gem_gtt_reserve+0x106/0x130 [i915]
[852.437211]  i915_vma_pin_ww+0x8f4/0xb60 [i915]
[852.437412]  eb_validate_vmas+0x688/0x860 [i915]
[852.437596]  i915_gem_do_execbuffer+0xc0e/0x25b0 [i915]
[852.437770]  ? deactivate_slab+0x5f2/0x7d0
[852.437778]  ? _raw_spin_unlock_irqrestore+0x50/0x60
[852.437789]  ? i915_gem_execbuffer2_ioctl+0xc6/0x2c0 [i915]
[852.437944]  ? init_object+0x49/0x80
[852.437950]  ? __lock_acquire+0x5e6/0x2580
[852.437963]  i915_gem_execbuffer2_ioctl+0x116/0x2c0 [i915]
[852.438129]  ? i915_gem_do_execbuffer+0x25b0/0x25b0 [i915]
[852.438300]  drm_ioctl_kernel+0xac/0x140
[852.438310]  drm_ioctl+0x201/0x3d0
[852.438316]  ? i915_gem_do_execbuffer+0x25b0/0x25b0 [i915]
[852.438490]  __x64_sys_ioctl+0x6a/0xa0
[852.438498]  do_syscall_64+0x37/0xb0
[852.438507]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[852.438515] RIP: 0033:0x7f5c0415b317
[852.438523] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
[852.438542] RSP: 002b:00007ffd765039a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[852.438553] RAX: ffffffffffffffda RBX: 000055e4d7829dd0 RCX: 00007f5c0415b317
[852.438562] RDX: 00007ffd76503a00 RSI: 00000000c0406469 RDI: 0000000000000017
[852.438571] RBP: 00007ffd76503a00 R08: 0000000000000000 R09: 0000000000000081
[852.438579] R10: 00000000ffffff7f R11: 0000000000000246 R12: 00000000c0406469
[852.438587] R13: 0000000000000017 R14: 00007ffd76503a00 R15: 0000000000000000
[852.438598]  </TASK>
[852.438602] Modules linked in: snd_hda_codec_hdmi i915 mei_hdcp x86_pkg_temp_thermal snd_hda_intel snd_intel_dspcfg drm_buddy coretemp crct10dif_pclmul crc32_pclmul snd_hda_codec ttm ghash_clmulni_intel snd_hwdep snd_hda_core e1000e drm_dp_helper ptp snd_pcm mei_me drm_kms_helper pps_core mei syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers intel_lpss_pci smsc75xx usbnet mii
[852.440310] ---[ end trace e52cdd2fe4fd911c ]---

v2: Fix typos in the commit message.

Fixes: 7e00897be8bf ("drm/i915: Add object locking to i915_gem_evict_for_node and i915_gem_evict_something, v2.")
Fixes: bc1922e5d349 ("drm/i915: Fix a race between vma / object destruction and unbinding")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 14 +---
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 17 +++--
 drivers/gpu/drm/i915/i915_vma.c               | 74 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h               |  3 +
 5 files changed, 79 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index e03e362d320b..78c4cbe82031 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -267,12 +267,6 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 	if (!list_empty(&obj->vma.list)) {
 		struct i915_vma *vma;
 
-		/*
-		 * Note that the vma keeps an object reference while
-		 * it is active, so it *should* not sleep while we
-		 * destroy it. Our debug code errs insits it *might*.
-		 * For the moment, play along.
-		 */
 		spin_lock(&obj->vma.lock);
 		while ((vma = list_first_entry_or_null(&obj->vma.list,
 						       struct i915_vma,
@@ -280,13 +274,7 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 			GEM_BUG_ON(vma->obj != obj);
 			spin_unlock(&obj->vma.lock);
 
-			/* Verify that the vma is unbound under the vm mutex. */
-			mutex_lock(&vma->vm->mutex);
-			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-			__i915_vma_unbind(vma);
-			mutex_unlock(&vma->vm->mutex);
-
-			__i915_vma_put(vma);
+			i915_vma_destroy(vma);
 
 			spin_lock(&obj->vma.lock);
 		}
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index ba29767348be..af36bffd064b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -167,7 +167,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 
 out:
 	i915_gem_object_lock(obj, NULL);
-	__i915_vma_put(vma);
+	i915_vma_destroy(vma);
 	i915_gem_object_unlock(obj);
 	return err;
 }
@@ -264,7 +264,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 			return err;
 
 		i915_gem_object_lock(obj, NULL);
-		__i915_vma_put(vma);
+		i915_vma_destroy(vma);
 		i915_gem_object_unlock(obj);
 
 		if (igt_timeout(end_time,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index df23ebdfc994..4363848f7411 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -105,14 +105,19 @@ void __i915_vm_close(struct i915_address_space *vm)
 	list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
 		struct drm_i915_gem_object *obj = vma->obj;
 
-		/* Keep the obj (and hence the vma) alive as _we_ destroy it */
-		if (!kref_get_unless_zero(&obj->base.refcount))
+		if (!kref_get_unless_zero(&obj->base.refcount)) {
+			/*
+			 * Unbind the dying vma to ensure the bound_list
+			 * is completely drained. We leave the destruction to
+			 * the object destructor.
+			 */
+			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+			WARN_ON(__i915_vma_unbind(vma));
 			continue;
+		}
 
-		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-		WARN_ON(__i915_vma_unbind(vma));
-		__i915_vma_put(vma);
-
+		/* Keep the obj (and hence the vma) alive as _we_ destroy it */
+		i915_vma_destroy_locked(vma);
 		i915_gem_object_put(obj);
 	}
 	GEM_BUG_ON(!list_empty(&vm->bound_list));
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 52f43a465440..9c1582a473c6 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1562,15 +1562,27 @@ void i915_vma_reopen(struct i915_vma *vma)
 void i915_vma_release(struct kref *ref)
 {
 	struct i915_vma *vma = container_of(ref, typeof(*vma), ref);
+
+	i915_vm_put(vma->vm);
+	i915_active_fini(&vma->active);
+	GEM_WARN_ON(vma->resource);
+	i915_vma_free(vma);
+}
+
+static void force_unbind(struct i915_vma *vma)
+{
+	if (!drm_mm_node_allocated(&vma->node))
+		return;
+
+	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+	WARN_ON(__i915_vma_unbind(vma));
+	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
+}
+
+static void release_references(struct i915_vma *vma)
+{
 	struct drm_i915_gem_object *obj = vma->obj;
 
-	if (drm_mm_node_allocated(&vma->node)) {
-		mutex_lock(&vma->vm->mutex);
-		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-		WARN_ON(__i915_vma_unbind(vma));
-		mutex_unlock(&vma->vm->mutex);
-		GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
-	}
 	GEM_BUG_ON(i915_vma_is_active(vma));
 
 	spin_lock(&obj->vma.lock);
@@ -1580,11 +1592,49 @@ void i915_vma_release(struct kref *ref)
 	spin_unlock(&obj->vma.lock);
 
 	__i915_vma_remove_closed(vma);
-	i915_vm_put(vma->vm);
 
-	i915_active_fini(&vma->active);
-	GEM_WARN_ON(vma->resource);
-	i915_vma_free(vma);
+	__i915_vma_put(vma);
+}
+
+/**
+ * i915_vma_destroy_locked - Remove all weak reference to the vma and put
+ * the initial reference.
+ *
+ * This function should be called when it's decided the vma isn't needed
+ * anymore. The caller must assure that it doesn't race with another lookup
+ * plus destroy, typically by taking an appropriate reference.
+ *
+ * Current callsites are
+ * - __i915_gem_object_pages_fini()
+ * - __i915_vm_close() - Blocks the above function by taking a reference on
+ * the object.
+ * - __i915_vma_parked() - Blocks the above functions by taking an open-count on
+ * the vm and a reference on the object.
+ *
+ * Because of locks taken during destruction, a vma is also guaranteed to
+ * stay alive while the following locks are held if it was looked up while
+ * holding one of the locks:
+ * - vm->mutex
+ * - obj->vma.lock
+ * - gt->closed_lock
+ *
+ * A vma user can also temporarily keep the vma alive while holding a vma
+ * reference.
+ */
+void i915_vma_destroy_locked(struct i915_vma *vma)
+{
+	lockdep_assert_held(&vma->vm->mutex);
+
+	force_unbind(vma);
+	release_references(vma);
+}
+
+void i915_vma_destroy(struct i915_vma *vma)
+{
+	mutex_lock(&vma->vm->mutex);
+	force_unbind(vma);
+	mutex_unlock(&vma->vm->mutex);
+	release_references(vma);
 }
 
 void i915_vma_parked(struct intel_gt *gt)
@@ -1618,7 +1668,7 @@ void i915_vma_parked(struct intel_gt *gt)
 
 		if (i915_gem_object_trylock(obj, NULL)) {
 			INIT_LIST_HEAD(&vma->closed_link);
-			__i915_vma_put(vma);
+			i915_vma_destroy(vma);
 			i915_gem_object_unlock(obj);
 		} else {
 			/* back you go.. */
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 011af044ad4f..67ae7341c7e0 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -236,6 +236,9 @@ static inline void __i915_vma_put(struct i915_vma *vma)
 	kref_put(&vma->ref, i915_vma_release);
 }
 
+void i915_vma_destroy_locked(struct i915_vma *vma);
+void i915_vma_destroy(struct i915_vma *vma);
+
 #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
 
 static inline void i915_vma_lock(struct i915_vma *vma)
-- 
2.34.1

