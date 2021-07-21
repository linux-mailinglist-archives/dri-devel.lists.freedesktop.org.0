Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54123D124B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06BD6E98F;
	Wed, 21 Jul 2021 15:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CDD6E98F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:25:08 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id my10so1874989pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBe561iGBsYpzWCDlSpT4F5Gkt6tlNPBtKIWvJ9Ua7g=;
 b=FXOlZ8tV6zEZsiRlrhQacNvsM1IYuE4a0Tnmn5iRB4dx/mHVnxGvAGZ+WDjrX9RGCg
 0P9GBbCvuQ4k1WrIHF0Pjh1aJ5Pp5g2k0fe57YaIrYbXKCWulBt0Ea7l29dDTAduUX9B
 /1IXRGDkd8wGGQVC40azHWVfblAqEVuejypnL+s6wxrZQ1JZD9H6kv7XNo/Wvn1IGV7Y
 X1ynBxQ6Yv5aItRkldOKHL3ziLBt0A4ikc9lClZfOVDHoVYbpFuz2xKxrop+cG4zpsVg
 Ms/o7iJGwUC3APS5ywKemvj6JHE3rl0HC4jWkX4FOh/7I63xiwQuM+WT5GanQvmmAvDi
 mJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBe561iGBsYpzWCDlSpT4F5Gkt6tlNPBtKIWvJ9Ua7g=;
 b=BdeQcLpWgaW3tDTm00dwuHHoWfZvRz/LpUkX3q+dfsI0K1opva/mOV8S7IhCjHr5ZK
 9vZheDU98BildkcI777s7wG2nRWCsGAo0CRqWoM8hqofIIHGxxb+kMdKeAv68zp7UCsT
 hBOOghpsFracixPmNPUNvqFCO1/k19Ta43ZY0PDxrBMsjEzDrflyenmJ3KFCoPfYOS4H
 fDOwIsS7kxMw4zL7lkEFMnCl5DJnahVPHWz19aW3I+NK8VqGfXgkT8i67DY1N/G9xsYy
 plbQErG/BCxisYJidL8DcoKOJRbxQ2/HbpzbVqfT1VYcrCL/WPaUeXm68oy9LGBIuwpv
 vtIw==
X-Gm-Message-State: AOAM532T/617LRdg6GRGlzzrtGtx+R1d411emlBCGbiXeXQZaYqstApN
 lBml6upxWR+rbzOXCoJU6nNQkQ==
X-Google-Smtp-Source: ABdhPJziT2XJbK+YUOHZFP+uR6hYW3oMg3yGs4dGYRLRhEI/eJtnxuqjrRICQZ+OvUVbv4rYNLHpDg==
X-Received: by 2002:a17:90a:9484:: with SMTP id
 s4mr4380402pjo.231.1626881107992; 
 Wed, 21 Jul 2021 08:25:07 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id e4sm32451034pgi.94.2021.07.21.08.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:25:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915: Make the kmem slab for i915_buddy_block a global
Date: Wed, 21 Jul 2021 10:23:58 -0500
Message-Id: <20210721152358.2893314-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721152358.2893314-1-jason@jlekstrand.net>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no reason that I can tell why this should be per-i915_buddy_mm
and doing so causes KMEM_CACHE to throw dmesg warnings because it tries
to create a debugfs entry with the name i915_buddy_block multiple times.
We could handle this by carefully giving each slab its own name but that
brings its own pain because then we have to store that string somewhere
and manage the lifetimes of the different slabs.  The most likely
outcome would be a global atomic which we increment to get a new name or
something like that.

The much easier solution is to use the i915_globals system like we do
for every other slab in i915.  This ensures that we have exactly one of
them for each i915 driver load and it gets neatly created on module load
and destroyed on module unload.  Using the globals system also means
that its now tied into the shrink handler so we can properly respond to
low-memory situations.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 88be9a0a06b7 ("drm/i915/ttm: add ttm_buddy_man")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_buddy.c   | 44 ++++++++++++++++++++++-------
 drivers/gpu/drm/i915/i915_buddy.h   |  3 +-
 drivers/gpu/drm/i915/i915_globals.c |  2 ++
 3 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
index 29dd7d0310c1f..911feedad4513 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/i915/i915_buddy.c
@@ -8,8 +8,14 @@
 #include "i915_buddy.h"
 
 #include "i915_gem.h"
+#include "i915_globals.h"
 #include "i915_utils.h"
 
+static struct i915_global_buddy {
+	struct i915_global base;
+	struct kmem_cache *slab_blocks;
+} global;
+
 static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 						 struct i915_buddy_block *parent,
 						 unsigned int order,
@@ -19,7 +25,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 
 	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
 
-	block = kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
+	block = kmem_cache_zalloc(global.slab_blocks, GFP_KERNEL);
 	if (!block)
 		return NULL;
 
@@ -34,7 +40,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 static void i915_block_free(struct i915_buddy_mm *mm,
 			    struct i915_buddy_block *block)
 {
-	kmem_cache_free(mm->slab_blocks, block);
+	kmem_cache_free(global.slab_blocks, block);
 }
 
 static void mark_allocated(struct i915_buddy_block *block)
@@ -85,15 +91,11 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 
 	GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
 
-	mm->slab_blocks = KMEM_CACHE(i915_buddy_block, SLAB_HWCACHE_ALIGN);
-	if (!mm->slab_blocks)
-		return -ENOMEM;
-
 	mm->free_list = kmalloc_array(mm->max_order + 1,
 				      sizeof(struct list_head),
 				      GFP_KERNEL);
 	if (!mm->free_list)
-		goto out_destroy_slab;
+		return -ENOMEM;
 
 	for (i = 0; i <= mm->max_order; ++i)
 		INIT_LIST_HEAD(&mm->free_list[i]);
@@ -145,8 +147,6 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 	kfree(mm->roots);
 out_free_list:
 	kfree(mm->free_list);
-out_destroy_slab:
-	kmem_cache_destroy(mm->slab_blocks);
 	return -ENOMEM;
 }
 
@@ -161,7 +161,6 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
 
 	kfree(mm->roots);
 	kfree(mm->free_list);
-	kmem_cache_destroy(mm->slab_blocks);
 }
 
 static int split_block(struct i915_buddy_mm *mm,
@@ -410,3 +409,28 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_buddy.c"
 #endif
+
+static void i915_global_buddy_shrink(void)
+{
+	kmem_cache_shrink(global.slab_blocks);
+}
+
+static void i915_global_buddy_exit(void)
+{
+	kmem_cache_destroy(global.slab_blocks);
+}
+
+static struct i915_global_buddy global = { {
+	.shrink = i915_global_buddy_shrink,
+	.exit = i915_global_buddy_exit,
+} };
+
+int __init i915_global_buddy_init(void)
+{
+	global.slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
+	if (!global.slab_blocks)
+		return -ENOMEM;
+
+	i915_global_register(&global.base);
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
index 37f8c42071d12..d8f26706de52f 100644
--- a/drivers/gpu/drm/i915/i915_buddy.h
+++ b/drivers/gpu/drm/i915/i915_buddy.h
@@ -47,7 +47,6 @@ struct i915_buddy_block {
  * i915_buddy_alloc* and i915_buddy_free* should suffice.
  */
 struct i915_buddy_mm {
-	struct kmem_cache *slab_blocks;
 	/* Maintain a free list for each order. */
 	struct list_head *free_list;
 
@@ -130,4 +129,6 @@ void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
 
 void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
 
+int i915_global_buddy_init(void);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index 87267e1d2ad92..e57102a4c8d16 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -8,6 +8,7 @@
 #include <linux/workqueue.h>
 
 #include "i915_active.h"
+#include "i915_buddy.h"
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
 #include "i915_globals.h"
@@ -87,6 +88,7 @@ static void __i915_globals_cleanup(void)
 
 static __initconst int (* const initfn[])(void) = {
 	i915_global_active_init,
+	i915_global_buddy_init,
 	i915_global_context_init,
 	i915_global_gem_context_init,
 	i915_global_objects_init,
-- 
2.31.1

