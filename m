Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476083D74D6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2F86EA10;
	Tue, 27 Jul 2021 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FFB6E992
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r2so14985585wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5oMDHT2wrSLzYTbhFXSyQLwbCJIzbqZgGbPzHr2Fi4=;
 b=aLcZQCUnSTqZj47u+JHZxyg8ZbqMr63IXSEIeS29arwiXwGUxHFALPLsoOzOqpfOE3
 jk/Ldj2S57upykXKejpS/jE13bm6s/nju6s1/txxJyQeIjJB8bHZbO80aY3l+XcW0y3n
 /nIbGFQi1gXry7MOg2JgloJcZXa7W84drzHoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5oMDHT2wrSLzYTbhFXSyQLwbCJIzbqZgGbPzHr2Fi4=;
 b=O7gWHis1BLxp7g1PVc51IKrezLEhbsmFBcG+Ut2+2LRzslqxFgngA7hpazyt0MsrQ7
 HOTf1j3cwoP8IiaKd15+qJCRV4IhW2Nx2qlRAeZVA0wLUyCpUhub+V/Ui0qgb5vu5+GY
 58MgGO1dcV70FaH/S/ulNIxpMvVlZWN10UzFu8N8rOwLVcXch22LWVwcnfcKYMUe135e
 uNVI6LUVuZACLbaPF4TYVLYAyz+gmk54CMLvaGmRYAUmpX5NhryijTVgmUA8B8jkpx0Z
 +ScasW0QqCudKMUpQ0W1I3jc349tHuf010SUtAB978UGV4pEnhx5FTFXm3+N9Xdxja3U
 ADDA==
X-Gm-Message-State: AOAM5335JnZ5/KXoB1p6/k54vAtFGNIwIlRXLjlo1uNvf4zpnhAdOYFT
 ph36DNMLgcNs65vcQ8kmr70/wkJCwx8NKw==
X-Google-Smtp-Source: ABdhPJycA4OkeX9owremvsDDIE5t35Uo8NNwjSbZoRZ9BafC2GVgw+f0PfsvXAPxoFR8DNqmQTuLyw==
X-Received: by 2002:adf:de06:: with SMTP id b6mr15432850wrm.316.1627387849204; 
 Tue, 27 Jul 2021 05:10:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 08/11] drm/i915: move scheduler slabs to direct module
 init/exit
Date: Tue, 27 Jul 2021 14:10:34 +0200
Message-Id: <20210727121037.2041102-8-daniel.vetter@ffwll.ch>
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
noise with removing the static global.slab_dependencies|priorities to just a
slab_dependencies|priorities.

v2: Make slab static (Jason, 0day)

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_globals.c   |  2 --
 drivers/gpu/drm/i915/i915_globals.h   |  2 --
 drivers/gpu/drm/i915/i915_pci.c       |  2 ++
 drivers/gpu/drm/i915/i915_scheduler.c | 39 +++++++++++----------------
 drivers/gpu/drm/i915/i915_scheduler.h |  3 +++
 5 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index 8fffa8d93bc5..8923589057ab 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -8,7 +8,6 @@
 #include <linux/workqueue.h>
 
 #include "i915_globals.h"
-#include "i915_scheduler.h"
 #include "i915_vma.h"
 
 static LIST_HEAD(globals);
@@ -29,7 +28,6 @@ static void __i915_globals_cleanup(void)
 }
 
 static __initconst int (* const initfn[])(void) = {
-	i915_global_scheduler_init,
 	i915_global_vma_init,
 };
 
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
index 9734740708f4..7a57bce1da05 100644
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ b/drivers/gpu/drm/i915/i915_globals.h
@@ -23,8 +23,6 @@ int i915_globals_init(void);
 void i915_globals_exit(void);
 
 /* constructors */
-int i915_global_request_init(void);
-int i915_global_scheduler_init(void);
 int i915_global_vma_init(void);
 
 #endif /* _I915_GLOBALS_H_ */
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 3f1716a3d74f..500897d0d4b5 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -39,6 +39,7 @@
 #include "i915_perf.h"
 #include "i915_globals.h"
 #include "i915_selftest.h"
+#include "i915_scheduler.h"
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
@@ -1305,6 +1306,7 @@ static const struct {
 	{ i915_gem_context_module_init, i915_gem_context_module_exit },
 	{ i915_objects_module_init, i915_objects_module_exit },
 	{ i915_request_module_init, i915_request_module_exit },
+	{ i915_scheduler_module_init, i915_scheduler_module_exit },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 561c649e59f7..c7ea5a1f3b94 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -7,15 +7,11 @@
 #include <linux/mutex.h>
 
 #include "i915_drv.h"
-#include "i915_globals.h"
 #include "i915_request.h"
 #include "i915_scheduler.h"
 
-static struct i915_global_scheduler {
-	struct i915_global base;
-	struct kmem_cache *slab_dependencies;
-	struct kmem_cache *slab_priorities;
-} global;
+static struct kmem_cache *slab_dependencies;
+static struct kmem_cache *slab_priorities;
 
 static DEFINE_SPINLOCK(schedule_lock);
 
@@ -93,7 +89,7 @@ i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio)
 	if (prio == I915_PRIORITY_NORMAL) {
 		p = &sched_engine->default_priolist;
 	} else {
-		p = kmem_cache_alloc(global.slab_priorities, GFP_ATOMIC);
+		p = kmem_cache_alloc(slab_priorities, GFP_ATOMIC);
 		/* Convert an allocation failure to a priority bump */
 		if (unlikely(!p)) {
 			prio = I915_PRIORITY_NORMAL; /* recurses just once */
@@ -122,7 +118,7 @@ i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio)
 
 void __i915_priolist_free(struct i915_priolist *p)
 {
-	kmem_cache_free(global.slab_priorities, p);
+	kmem_cache_free(slab_priorities, p);
 }
 
 struct sched_cache {
@@ -313,13 +309,13 @@ void i915_sched_node_reinit(struct i915_sched_node *node)
 static struct i915_dependency *
 i915_dependency_alloc(void)
 {
-	return kmem_cache_alloc(global.slab_dependencies, GFP_KERNEL);
+	return kmem_cache_alloc(slab_dependencies, GFP_KERNEL);
 }
 
 static void
 i915_dependency_free(struct i915_dependency *dep)
 {
-	kmem_cache_free(global.slab_dependencies, dep);
+	kmem_cache_free(slab_dependencies, dep);
 }
 
 bool __i915_sched_node_add_dependency(struct i915_sched_node *node,
@@ -475,32 +471,27 @@ i915_sched_engine_create(unsigned int subclass)
 	return sched_engine;
 }
 
-static void i915_global_scheduler_exit(void)
+void i915_scheduler_module_exit(void)
 {
-	kmem_cache_destroy(global.slab_dependencies);
-	kmem_cache_destroy(global.slab_priorities);
+	kmem_cache_destroy(slab_dependencies);
+	kmem_cache_destroy(slab_priorities);
 }
 
-static struct i915_global_scheduler global = { {
-	.exit = i915_global_scheduler_exit,
-} };
-
-int __init i915_global_scheduler_init(void)
+int __init i915_scheduler_module_init(void)
 {
-	global.slab_dependencies = KMEM_CACHE(i915_dependency,
+	slab_dependencies = KMEM_CACHE(i915_dependency,
 					      SLAB_HWCACHE_ALIGN |
 					      SLAB_TYPESAFE_BY_RCU);
-	if (!global.slab_dependencies)
+	if (!slab_dependencies)
 		return -ENOMEM;
 
-	global.slab_priorities = KMEM_CACHE(i915_priolist, 0);
-	if (!global.slab_priorities)
+	slab_priorities = KMEM_CACHE(i915_priolist, 0);
+	if (!slab_priorities)
 		goto err_priorities;
 
-	i915_global_register(&global.base);
 	return 0;
 
 err_priorities:
-	kmem_cache_destroy(global.slab_priorities);
+	kmem_cache_destroy(slab_priorities);
 	return -ENOMEM;
 }
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 650ab8e0db9f..0a4f61fd0be0 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -98,4 +98,7 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 				     const char *prefix,
 				     int indent);
 
+void i915_scheduler_module_exit(void);
+int i915_scheduler_module_init(void);
+
 #endif /* _I915_SCHEDULER_H_ */
-- 
2.32.0

