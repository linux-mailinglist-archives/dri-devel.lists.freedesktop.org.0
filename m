Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28E3D40CB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844816FD02;
	Fri, 23 Jul 2021 19:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E7B6FCF7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 19:29:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so4127638wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 12:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KPQdAtfUuAEZXdl1+FPSraE1XmWL2Gl8s1TvYt3hu8=;
 b=VsrD4GDEw74GSkXPag1dvThxvoaPzCMfrjjWKTcm1hvG6k/sH0f+tjKWi64+N7CmRH
 NMQ5voU1duzEoRBYPGBJq+r49nLTf9eKFVwG+cevhnIDvqIJjuYRTuIFC+9WtwFDDHdX
 ObJ+IEELOblcyuM9pWOTiC1y6aVuPXQvrsVj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KPQdAtfUuAEZXdl1+FPSraE1XmWL2Gl8s1TvYt3hu8=;
 b=UJbsLIu1qXzfO9zejw/EFZ+t5na5r+xrpG+yQT+k193+XqBtLF0PZ1Ya5OF68aOJcA
 0EoYYAuvVLGCtG3q/g5rou3CrX9PnD4/mwf4/xj2hHrmkUBPkku620pHeh1C1JzX12I7
 KQspOBRU939VTpjA6yWz8WNku0n+n778d6s5M05bAYXTUTGu4CJX14c9iG0RCtP+iGFF
 SGiDuuAS5YJbH02pQg7qIjFM0w6os6bU96vroh4Oz5+R8nbBbrZfOimjDkPEUzM/IUa4
 roRVJIFKF78aA9QLPRa2xcEgtMIjcQdedbEYh2Iit1g3vHXEeqdyMhP7YT9JgCzPohJt
 +V/g==
X-Gm-Message-State: AOAM5316TngwZSierVbjXrXSdIMwOIZtmVs5vwmOxw0O5KURlgxC0ua/
 5vki3Ye0TrGoWZspgchY4WffyEoZSfRS9Q==
X-Google-Smtp-Source: ABdhPJxvHFhJF5sgcIePbTk3e9dTjZ5PM01QGTfOOEeTW5s8eVHlwdl3QlIHhJNHSAZGkZM6jS3hFQ==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr6085109wmj.144.1627068586288; 
 Fri, 23 Jul 2021 12:29:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s14sm17609870wmc.25.2021.07.23.12.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:29:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/10] drm/i915: move vma slab to direct module init/exit
Date: Fri, 23 Jul 2021 21:29:33 +0200
Message-Id: <20210723192934.1004427-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
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
noise with removing the static global.slab_vmas to just a
slab_vmas.

We have to keep i915_drv.h include in i915_globals otherwise there's
nothing anymore that pulls in GEM_BUG_ON.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_globals.c |  3 +--
 drivers/gpu/drm/i915/i915_globals.h |  3 ---
 drivers/gpu/drm/i915/i915_pci.c     |  2 ++
 drivers/gpu/drm/i915/i915_vma.c     | 25 ++++++++-----------------
 drivers/gpu/drm/i915/i915_vma.h     |  3 +++
 5 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index 8923589057ab..04979789e7be 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -8,7 +8,7 @@
 #include <linux/workqueue.h>
 
 #include "i915_globals.h"
-#include "i915_vma.h"
+#include "i915_drv.h"
 
 static LIST_HEAD(globals);
 
@@ -28,7 +28,6 @@ static void __i915_globals_cleanup(void)
 }
 
 static __initconst int (* const initfn[])(void) = {
-	i915_global_vma_init,
 };
 
 int __init i915_globals_init(void)
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
index 7a57bce1da05..57d2998bba45 100644
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ b/drivers/gpu/drm/i915/i915_globals.h
@@ -22,7 +22,4 @@ void i915_global_register(struct i915_global *global);
 int i915_globals_init(void);
 void i915_globals_exit(void);
 
-/* constructors */
-int i915_global_vma_init(void);
-
 #endif /* _I915_GLOBALS_H_ */
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index a44318519977..0affcf33a211 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -40,6 +40,7 @@
 #include "i915_globals.h"
 #include "i915_selftest.h"
 #include "i915_scheduler.h"
+#include "i915_vma.h"
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
@@ -1306,6 +1307,7 @@ static const struct {
 	{ i915_objects_module_init, i915_objects_module_exit },
 	{ i915_request_module_init, i915_request_module_exit },
 	{ i915_scheduler_module_init, i915_scheduler_module_exit },
+	{ i915_vma_module_init, i915_vma_module_exit },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 09a7c47926f7..d094e2016b93 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -34,24 +34,20 @@
 #include "gt/intel_gt_requests.h"
 
 #include "i915_drv.h"
-#include "i915_globals.h"
 #include "i915_sw_fence_work.h"
 #include "i915_trace.h"
 #include "i915_vma.h"
 
-static struct i915_global_vma {
-	struct i915_global base;
-	struct kmem_cache *slab_vmas;
-} global;
+struct kmem_cache *slab_vmas;
 
 struct i915_vma *i915_vma_alloc(void)
 {
-	return kmem_cache_zalloc(global.slab_vmas, GFP_KERNEL);
+	return kmem_cache_zalloc(slab_vmas, GFP_KERNEL);
 }
 
 void i915_vma_free(struct i915_vma *vma)
 {
-	return kmem_cache_free(global.slab_vmas, vma);
+	return kmem_cache_free(slab_vmas, vma);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_ERRLOG_GEM) && IS_ENABLED(CONFIG_DRM_DEBUG_MM)
@@ -1414,21 +1410,16 @@ void i915_vma_make_purgeable(struct i915_vma *vma)
 #include "selftests/i915_vma.c"
 #endif
 
-static void i915_global_vma_exit(void)
+void i915_vma_module_exit(void)
 {
-	kmem_cache_destroy(global.slab_vmas);
+	kmem_cache_destroy(slab_vmas);
 }
 
-static struct i915_global_vma global = { {
-	.exit = i915_global_vma_exit,
-} };
-
-int __init i915_global_vma_init(void)
+int __init i915_vma_module_init(void)
 {
-	global.slab_vmas = KMEM_CACHE(i915_vma, SLAB_HWCACHE_ALIGN);
-	if (!global.slab_vmas)
+	slab_vmas = KMEM_CACHE(i915_vma, SLAB_HWCACHE_ALIGN);
+	if (!slab_vmas)
 		return -ENOMEM;
 
-	i915_global_register(&global.base);
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index eca452a9851f..ed69f66c7ab0 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -426,4 +426,7 @@ static inline int i915_vma_sync(struct i915_vma *vma)
 	return i915_active_wait(&vma->active);
 }
 
+void i915_vma_module_exit(void);
+int i915_vma_module_init(void);
+
 #endif
-- 
2.32.0

