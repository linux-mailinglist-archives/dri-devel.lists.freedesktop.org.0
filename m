Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA963D40C4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2F16FCFB;
	Fri, 23 Jul 2021 19:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE38F6FCF2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 19:29:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so4127579wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWKvBn6hx4FJHzP+vonYkUYUtZ42D/olJze4GOWuugk=;
 b=g8JDVZYuipie1fzRRKsRCeCWSxTFQpWMAGaS5lle9JF63eG5aQLleQ71eho+Cv6Wiy
 NfwIGt67shgy84gX/otXTw3Nap7B9FtO6QystZiknC307gabppbWCcaqmvet40izY4p6
 c1HoOkAEsKeenJlEB4/by4FPjRYjIn9TUKpXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWKvBn6hx4FJHzP+vonYkUYUtZ42D/olJze4GOWuugk=;
 b=rUVy62weAVqyEj/X0tJFllP05hjkfIiXAA7YJeGHmMpDapXVp1FqUwy1odYKVeeEH+
 9O892tH7nGBBX4zaoXtC5a/XCNBgbpcXbmKZ37TnnHUzzVrV864KOKYy8m9afnGxcclo
 J92mFLV2Gldf9GXHXq3o1FYEwkwgD+QxEVt3UHTOGqsv6EeN6rrIm5sm6TL/YIj8aN67
 l5r0uUSlgYA+EyB9OKC2R9e+CyhPPtTFen8UGBYqkVw4nGLWuAM6nP5uLNgpVgcNJ547
 ykUVwb1djupicNNOrUsdxXGCWjVKe3gk3kKA6fm9nSaNJxnDxRCx6T+A+KhzxT/30Owt
 n2VA==
X-Gm-Message-State: AOAM532iow5d0qQv2jIOLtnOf1CIrCUL7uJKkbgy4qTfQuFcdkbKWMt5
 9FYrH2djPEZZSgYzTBlU/xFX9aGiQ+9uQA==
X-Google-Smtp-Source: ABdhPJydqpKTQwbdQEUSjtlEthxVS88lu+E03T5MoHuhjcT86jZLp5zSMPOqzI1wVYwM32I15o8MxA==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr13756990wma.109.1627068582599; 
 Fri, 23 Jul 2021 12:29:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s14sm17609870wmc.25.2021.07.23.12.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:29:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/i915: move intel_context slab to direct module
 init/exit
Date: Fri, 23 Jul 2021 21:29:28 +0200
Message-Id: <20210723192934.1004427-4-daniel.vetter@ffwll.ch>
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
noise with removing the static global.slab_ce to just a
slab_ce.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c | 25 ++++++++-----------------
 drivers/gpu/drm/i915/gt/intel_context.h |  3 +++
 drivers/gpu/drm/i915/i915_globals.c     |  2 --
 drivers/gpu/drm/i915/i915_globals.h     |  1 -
 drivers/gpu/drm/i915/i915_pci.c         |  2 ++
 5 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index baa05fddd690..283382549a6f 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -7,7 +7,6 @@
 #include "gem/i915_gem_pm.h"
 
 #include "i915_drv.h"
-#include "i915_globals.h"
 #include "i915_trace.h"
 
 #include "intel_context.h"
@@ -15,14 +14,11 @@
 #include "intel_engine_pm.h"
 #include "intel_ring.h"
 
-static struct i915_global_context {
-	struct i915_global base;
-	struct kmem_cache *slab_ce;
-} global;
+struct kmem_cache *slab_ce;
 
 static struct intel_context *intel_context_alloc(void)
 {
-	return kmem_cache_zalloc(global.slab_ce, GFP_KERNEL);
+	return kmem_cache_zalloc(slab_ce, GFP_KERNEL);
 }
 
 static void rcu_context_free(struct rcu_head *rcu)
@@ -30,7 +26,7 @@ static void rcu_context_free(struct rcu_head *rcu)
 	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
 
 	trace_intel_context_free(ce);
-	kmem_cache_free(global.slab_ce, ce);
+	kmem_cache_free(slab_ce, ce);
 }
 
 void intel_context_free(struct intel_context *ce)
@@ -410,22 +406,17 @@ void intel_context_fini(struct intel_context *ce)
 	i915_active_fini(&ce->active);
 }
 
-static void i915_global_context_exit(void)
+void i915_context_module_exit(void)
 {
-	kmem_cache_destroy(global.slab_ce);
+	kmem_cache_destroy(slab_ce);
 }
 
-static struct i915_global_context global = { {
-	.exit = i915_global_context_exit,
-} };
-
-int __init i915_global_context_init(void)
+int __init i915_context_module_init(void)
 {
-	global.slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
-	if (!global.slab_ce)
+	slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
+	if (!slab_ce)
 		return -ENOMEM;
 
-	i915_global_register(&global.base);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 974ef85320c2..a0ca82e3c40d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -30,6 +30,9 @@ void intel_context_init(struct intel_context *ce,
 			struct intel_engine_cs *engine);
 void intel_context_fini(struct intel_context *ce);
 
+void i915_context_module_exit(void);
+int i915_context_module_init(void);
+
 struct intel_context *
 intel_context_create(struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index 3de7cf22ec76..d36eb7dc40aa 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
 #include "i915_globals.h"
 #include "i915_request.h"
@@ -32,7 +31,6 @@ static void __i915_globals_cleanup(void)
 }
 
 static __initconst int (* const initfn[])(void) = {
-	i915_global_context_init,
 	i915_global_gem_context_init,
 	i915_global_objects_init,
 	i915_global_request_init,
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
index d80901ba75e3..60daa738a188 100644
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ b/drivers/gpu/drm/i915/i915_globals.h
@@ -23,7 +23,6 @@ int i915_globals_init(void);
 void i915_globals_exit(void);
 
 /* constructors */
-int i915_global_context_init(void);
 int i915_global_gem_context_init(void);
 int i915_global_objects_init(void);
 int i915_global_request_init(void);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index f9527269e30a..266618157775 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -33,6 +33,7 @@
 #include "i915_active.h"
 #include "i915_buddy.h"
 #include "i915_drv.h"
+#include "gem/i915_gem_context.h"
 #include "i915_perf.h"
 #include "i915_globals.h"
 #include "i915_selftest.h"
@@ -1297,6 +1298,7 @@ static const struct {
 	{ i915_check_nomodeset, NULL },
 	{ i915_active_module_init, i915_active_module_exit },
 	{ i915_buddy_module_init, i915_buddy_module_exit },
+	{ i915_context_module_init, i915_context_module_exit },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
-- 
2.32.0

