Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250479FA767
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 18:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D7C10E27E;
	Sun, 22 Dec 2024 17:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="NsggMqOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 62829 seconds by postgrey-1.36 at gabe;
 Sun, 22 Dec 2024 17:48:01 UTC
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DD910E1F8;
 Sun, 22 Dec 2024 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=AduVVJrA9lIbWg9SIe2KOiwZ3LPQuI2PP5us5oPkxeg=; b=NsggMqOcN6NIe+x4
 +uFRSM/xJts6o2pzvGm+NotZdHMhrF9xvw+NP32GsU+geADPLc2J9kfkDDBYAtNOhaxvrqk338xeH
 EfgR2kG3BPfX45eumbxUz5HNU1xsjeLCah6td6ENlFYSFmNbWFBALySchNpXMy4AyyaqCfSRohIyT
 YjvnKdPifU3p94xyt3caiDkkvt4SU0B/3ogyMWciLchQXIXWn+D/pe4gfn4H/W32rkK+tvhMp2T4W
 O54Qwtpo41VK5tGCFnJsD5WdvTm2TKEILxeJ14pIxSpTLaBnADJ7mqymYi/GGBxIt+2jmx+o3hHh0
 hlkf7haFxqV/kj2/Bg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tPQ3V-006mY1-0S;
 Sun, 22 Dec 2024 17:47:53 +0000
From: linux@treblig.org
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/i915: Remove deadcode
Date: Sun, 22 Dec 2024 17:47:51 +0000
Message-ID: <20241222174751.222975-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

i915_active_acquire_for_context() was added in 2020 by
commit 5d9341370f57 ("drm/i915: Export a preallocate variant of
i915_active_acquire()") but has never been used.

The last use of __i915_gem_object_is_lmem() was removed in 2021 by
commit ff20afc4cee7 ("drm/i915: Update error capture code to avoid using
the current vma state")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 23 -----------------------
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h |  2 --
 drivers/gpu/drm/i915/i915_active.c       | 18 ------------------
 drivers/gpu/drm/i915/i915_active.h       |  1 -
 4 files changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 3198b64ad7db..388f90784d8a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -52,29 +52,6 @@ bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
 }
 
-/**
- * __i915_gem_object_is_lmem - Whether the object is resident in
- * lmem while in the fence signaling critical path.
- * @obj: The object to check.
- *
- * This function is intended to be called from within the fence signaling
- * path where the fence, or a pin, keeps the object from being migrated. For
- * example during gpu reset or similar.
- *
- * Return: Whether the object is resident in lmem.
- */
-bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
-{
-	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
-
-#ifdef CONFIG_LOCKDEP
-	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP) &&
-		    i915_gem_object_evictable(obj));
-#endif
-	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
-		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
-}
-
 /**
  * __i915_gem_object_create_lmem_with_ps - Create lmem object and force the
  * minimum page size for the backing pages.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
index 5a7a14e85c3f..ecd8f1a633a1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
@@ -19,8 +19,6 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
 
 bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
 
-bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
-
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
 				      const void *data, size_t size);
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 35319228bc51..0dbc4e289300 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -527,24 +527,6 @@ int i915_active_acquire(struct i915_active *ref)
 	return err;
 }
 
-int i915_active_acquire_for_context(struct i915_active *ref, u64 idx)
-{
-	struct i915_active_fence *active;
-	int err;
-
-	err = i915_active_acquire(ref);
-	if (err)
-		return err;
-
-	active = active_instance(ref, idx);
-	if (!active) {
-		i915_active_release(ref);
-		return -ENOMEM;
-	}
-
-	return 0; /* return with active ref */
-}
-
 void i915_active_release(struct i915_active *ref)
 {
 	debug_active_assert(ref);
diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index 77c676ecc263..821f7c21ea9b 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -186,7 +186,6 @@ int i915_request_await_active(struct i915_request *rq,
 #define I915_ACTIVE_AWAIT_BARRIER BIT(2)
 
 int i915_active_acquire(struct i915_active *ref);
-int i915_active_acquire_for_context(struct i915_active *ref, u64 idx);
 bool i915_active_acquire_if_busy(struct i915_active *ref);
 
 void i915_active_release(struct i915_active *ref);
-- 
2.47.1

