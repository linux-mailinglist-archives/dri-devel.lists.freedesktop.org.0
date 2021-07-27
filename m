Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA9F3D74CC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCF06E97C;
	Tue, 27 Jul 2021 12:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184EB6E883
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so2173735wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dv6v6igQ1oKOZ1Eun+l9MhtnCwva3rhJyFEX4Pf2kQ0=;
 b=aFzCTrleOrI2z32bCgVx9p/g2hH1VRi9wHYhfCs0Pjoi+fEhqPeNFd4lUQijRIB3EQ
 Lu1j83gEtF9wXyJsGZgNFnneYPh/IRXjzWhxLYbJStSMwv8csawIH/e+5/iYqUM+/hIy
 lEcDDNFxhD8gYvzcf8tu4/xENb0Kqy1dRqGVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dv6v6igQ1oKOZ1Eun+l9MhtnCwva3rhJyFEX4Pf2kQ0=;
 b=LWxzIFlnre+zbuFAfIV0HEn72aCK226LjTJnLiMDtf0T59xx8v2Z94MuM3h272O9ak
 vyhsq4qkb18yAGzQN0m+D1pFCCEF3mzJAswvQdAxZSJDEUr6uh4FtrjY0GoxXsDcpp5r
 WoQvHPjtl6R43kM4LfxD6LgAaZwjRNEqwbVhZVrEfUGFwMTrJ7HWvCF3Gdc9tIKvN7fA
 V+fIn5i0rEL91bhpRaKM+g5wJGCtmv7Am84OUj7gfxCCJBTBBJA2e85Q6jS7EJl17vo+
 1Pc1mWpvZOjDaQ+CIQW0SdfD/TG4ZKsLHay/AGTzG9TRt3KFuDNHKM8RXYnNfFuFagcE
 QTOA==
X-Gm-Message-State: AOAM533ObUGULaqhGurLU1gdWwiuDyjGCQKzI4pW4vZ8oLCL5/Gq4MV0
 ggaHOHbY3AOAJqKU6m7f5gMGdvKmLXdE2A==
X-Google-Smtp-Source: ABdhPJw52+IyaRzEIS3K2HqWrpga4Pu1Of3wXi6MHgYRBZuFv0SIyY5taAASC3x4OBivQ/OLJ6JFPA==
X-Received: by 2002:a05:600c:5106:: with SMTP id
 o6mr3724746wms.18.1627387844472; 
 Tue, 27 Jul 2021 05:10:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 02/11] drm/i915: move i915_active slab to direct module
 init/exit
Date: Tue, 27 Jul 2021 14:10:28 +0200
Message-Id: <20210727121037.2041102-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the global kmem_cache shrink infrastructure gone there's nothing
special and we can convert them over.

I'm doing this split up into each patch because there's quite a bit of
noise with removing the static global.slab_cache to just a slab_cache.

v2: Make slab static (Jason, 0day)

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_active.c  | 31 ++++++++++-------------------
 drivers/gpu/drm/i915/i915_active.h  |  3 +++
 drivers/gpu/drm/i915/i915_globals.c |  2 --
 drivers/gpu/drm/i915/i915_globals.h |  1 -
 drivers/gpu/drm/i915/i915_pci.c     |  2 ++
 5 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 91723123ae9f..3103c1e1fd14 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -13,7 +13,6 @@
 
 #include "i915_drv.h"
 #include "i915_active.h"
-#include "i915_globals.h"
 
 /*
  * Active refs memory management
@@ -22,10 +21,7 @@
  * they idle (when we know the active requests are inactive) and allocate the
  * nodes from a local slab cache to hopefully reduce the fragmentation.
  */
-static struct i915_global_active {
-	struct i915_global base;
-	struct kmem_cache *slab_cache;
-} global;
+static struct kmem_cache *slab_cache;
 
 struct active_node {
 	struct rb_node node;
@@ -174,7 +170,7 @@ __active_retire(struct i915_active *ref)
 	/* Finally free the discarded timeline tree  */
 	rbtree_postorder_for_each_entry_safe(it, n, &root, node) {
 		GEM_BUG_ON(i915_active_fence_isset(&it->base));
-		kmem_cache_free(global.slab_cache, it);
+		kmem_cache_free(slab_cache, it);
 	}
 }
 
@@ -322,7 +318,7 @@ active_instance(struct i915_active *ref, u64 idx)
 	 * XXX: We should preallocate this before i915_active_ref() is ever
 	 *  called, but we cannot call into fs_reclaim() anyway, so use GFP_ATOMIC.
 	 */
-	node = kmem_cache_alloc(global.slab_cache, GFP_ATOMIC);
+	node = kmem_cache_alloc(slab_cache, GFP_ATOMIC);
 	if (!node)
 		goto out;
 
@@ -788,7 +784,7 @@ void i915_active_fini(struct i915_active *ref)
 	mutex_destroy(&ref->mutex);
 
 	if (ref->cache)
-		kmem_cache_free(global.slab_cache, ref->cache);
+		kmem_cache_free(slab_cache, ref->cache);
 }
 
 static inline bool is_idle_barrier(struct active_node *node, u64 idx)
@@ -908,7 +904,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 		node = reuse_idle_barrier(ref, idx);
 		rcu_read_unlock();
 		if (!node) {
-			node = kmem_cache_alloc(global.slab_cache, GFP_KERNEL);
+			node = kmem_cache_alloc(slab_cache, GFP_KERNEL);
 			if (!node)
 				goto unwind;
 
@@ -956,7 +952,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 		atomic_dec(&ref->count);
 		intel_engine_pm_put(barrier_to_engine(node));
 
-		kmem_cache_free(global.slab_cache, node);
+		kmem_cache_free(slab_cache, node);
 	}
 	return -ENOMEM;
 }
@@ -1176,21 +1172,16 @@ struct i915_active *i915_active_create(void)
 #include "selftests/i915_active.c"
 #endif
 
-static void i915_global_active_exit(void)
+void i915_active_module_exit(void)
 {
-	kmem_cache_destroy(global.slab_cache);
+	kmem_cache_destroy(slab_cache);
 }
 
-static struct i915_global_active global = { {
-	.exit = i915_global_active_exit,
-} };
-
-int __init i915_global_active_init(void)
+int __init i915_active_module_init(void)
 {
-	global.slab_cache = KMEM_CACHE(active_node, SLAB_HWCACHE_ALIGN);
-	if (!global.slab_cache)
+	slab_cache = KMEM_CACHE(active_node, SLAB_HWCACHE_ALIGN);
+	if (!slab_cache)
 		return -ENOMEM;
 
-	i915_global_register(&global.base);
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index d0feda68b874..5fcdb0e2bc9e 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -247,4 +247,7 @@ static inline int __i915_request_await_exclusive(struct i915_request *rq,
 	return err;
 }
 
+void i915_active_module_exit(void);
+int i915_active_module_init(void);
+
 #endif /* _I915_ACTIVE_H_ */
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index 91198f5b0a06..a53135ee831d 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "i915_active.h"
 #include "i915_buddy.h"
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
@@ -34,7 +33,6 @@ static void __i915_globals_cleanup(void)
 }
 
 static __initconst int (* const initfn[])(void) = {
-	i915_global_active_init,
 	i915_global_buddy_init,
 	i915_global_context_init,
 	i915_global_gem_context_init,
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
index 9e6b4fd07528..d80901ba75e3 100644
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ b/drivers/gpu/drm/i915/i915_globals.h
@@ -23,7 +23,6 @@ int i915_globals_init(void);
 void i915_globals_exit(void);
 
 /* constructors */
-int i915_global_active_init(void);
 int i915_global_context_init(void);
 int i915_global_gem_context_init(void);
 int i915_global_objects_init(void);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index eb520fcb32e4..2a1726e9ae7f 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -30,6 +30,7 @@
 
 #include "display/intel_fbdev.h"
 
+#include "i915_active.h"
 #include "i915_drv.h"
 #include "i915_perf.h"
 #include "i915_globals.h"
@@ -1294,6 +1295,7 @@ static const struct {
    void (*exit)(void);
 } init_funcs[] = {
 	{ i915_check_nomodeset, NULL },
+	{ i915_active_module_init, i915_active_module_exit },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
-- 
2.32.0

