Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745513D74CA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03F66E947;
	Tue, 27 Jul 2021 12:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B565E6E947
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id b128so7421721wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNVrIcj1pM8WYclTTCmxK+L8lzh0ZRJ/UCcPzQqMreA=;
 b=FrG/ZZXywf2MhdC82d4m8InqcyFYKEH8aeDCunxW8v7MG7QwwYuerM72gC2JNBi5Nq
 DAoNmFw9wmHO60siYyvKIBZl75BSqXDojRm4UTc5JHNUdHg5+N7Ei+Yvi2UcPuf/OCH+
 bIcLZoDA6UDwSlVQoBEYWXr/qFKKHYxezdrE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mNVrIcj1pM8WYclTTCmxK+L8lzh0ZRJ/UCcPzQqMreA=;
 b=SU+4YXmiV7ef5a7E9v1xE9dv7A1sh1MJFlenPZQsoJ/qQJP//XBy3qCuz+f2+KYpzR
 +EvopvuYGlMkDLmQ6CzwDJ32HBJF5q1z/cg7b72YOm8IhqatNK0ph64L6QopPc2AdtEa
 /v7eaxANlEz0OSJX3/3HI0NTrm0vCHL/DSr3h/94rDphuXJLhWu2AgbpnvLVfuX96od7
 +6ok0yyKefxm0adetlazUEPKrwWpu/75umfJp/9mhILxdmDkxt30sxqTABqgRH2CUMaW
 HA4zNIbn/1JyX760CYnnWTj7Nc+axkP++PDZpvvQINPmOfaLWC6+4rN+xRNyaaXkkry7
 4E2Q==
X-Gm-Message-State: AOAM5313G/B7X7PjRuBNNgtgiErht9NkNTlUrFIi89x2/XmEHU2KdUll
 5x81vUhdKyyGpxlGcv7YZu1XlWWhOb6QoA==
X-Google-Smtp-Source: ABdhPJzV3TxFIPbXnTnmpGNDfMJDllcxdMNyj9Zq0jBbVDEV14jOCtxlj52HyieU1Vslm/JtdThaOg==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr21762682wme.93.1627387845217; 
 Tue, 27 Jul 2021 05:10:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 03/11] drm/i915: move i915_buddy slab to direct module
 init/exit
Date: Tue, 27 Jul 2021 14:10:29 +0200
Message-Id: <20210727121037.2041102-3-daniel.vetter@ffwll.ch>
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
noise with removing the static global.slab_blocks to just a
slab_blocks.

v2: Make slab static (Jason, 0day)

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_buddy.c   | 25 ++++++++-----------------
 drivers/gpu/drm/i915/i915_buddy.h   |  3 ++-
 drivers/gpu/drm/i915/i915_globals.c |  2 --
 drivers/gpu/drm/i915/i915_pci.c     |  2 ++
 4 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
index caabcaea3be7..7b274c51cac0 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/i915/i915_buddy.c
@@ -8,13 +8,9 @@
 #include "i915_buddy.h"
 
 #include "i915_gem.h"
-#include "i915_globals.h"
 #include "i915_utils.h"
 
-static struct i915_global_buddy {
-	struct i915_global base;
-	struct kmem_cache *slab_blocks;
-} global;
+static struct kmem_cache *slab_blocks;
 
 static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 						 struct i915_buddy_block *parent,
@@ -25,7 +21,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 
 	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
 
-	block = kmem_cache_zalloc(global.slab_blocks, GFP_KERNEL);
+	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
 	if (!block)
 		return NULL;
 
@@ -40,7 +36,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 static void i915_block_free(struct i915_buddy_mm *mm,
 			    struct i915_buddy_block *block)
 {
-	kmem_cache_free(global.slab_blocks, block);
+	kmem_cache_free(slab_blocks, block);
 }
 
 static void mark_allocated(struct i915_buddy_block *block)
@@ -410,21 +406,16 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 #include "selftests/i915_buddy.c"
 #endif
 
-static void i915_global_buddy_exit(void)
+void i915_buddy_module_exit(void)
 {
-	kmem_cache_destroy(global.slab_blocks);
+	kmem_cache_destroy(slab_blocks);
 }
 
-static struct i915_global_buddy global = { {
-	.exit = i915_global_buddy_exit,
-} };
-
-int __init i915_global_buddy_init(void)
+int __init i915_buddy_module_init(void)
 {
-	global.slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
-	if (!global.slab_blocks)
+	slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
+	if (!slab_blocks)
 		return -ENOMEM;
 
-	i915_global_register(&global.base);
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
index d8f26706de52..3940d632f208 100644
--- a/drivers/gpu/drm/i915/i915_buddy.h
+++ b/drivers/gpu/drm/i915/i915_buddy.h
@@ -129,6 +129,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
 
 void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
 
-int i915_global_buddy_init(void);
+void i915_buddy_module_exit(void);
+int i915_buddy_module_init(void);
 
 #endif
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index a53135ee831d..3de7cf22ec76 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "i915_buddy.h"
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
 #include "i915_globals.h"
@@ -33,7 +32,6 @@ static void __i915_globals_cleanup(void)
 }
 
 static __initconst int (* const initfn[])(void) = {
-	i915_global_buddy_init,
 	i915_global_context_init,
 	i915_global_gem_context_init,
 	i915_global_objects_init,
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 2a1726e9ae7f..22d9e769ec74 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -31,6 +31,7 @@
 #include "display/intel_fbdev.h"
 
 #include "i915_active.h"
+#include "i915_buddy.h"
 #include "i915_drv.h"
 #include "i915_perf.h"
 #include "i915_globals.h"
@@ -1296,6 +1297,7 @@ static const struct {
 } init_funcs[] = {
 	{ i915_check_nomodeset, NULL },
 	{ i915_active_module_init, i915_active_module_exit },
+	{ i915_buddy_module_init, i915_buddy_module_exit },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
-- 
2.32.0

