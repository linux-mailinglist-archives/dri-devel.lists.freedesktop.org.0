Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A106D3D74CF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24E86E9A2;
	Tue, 27 Jul 2021 12:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2126E947
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k4so7420714wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOT6n5enISaqbbzPzh90YpaXBz2nUaqPSDT6nSriNZQ=;
 b=llDXKtPZFMJPjtlJDKGkOrDXzJJYO0utdwP4yhk0cPcSq/oViOnsn4kLGcRfC6p0BE
 keS7t2abRfNxUXFObvej8UGJ71UuCnMfl7PtPxssu4kjLszZS9pHiLBwkClXmuW4utWt
 GbY/0r2XUpVXw5ocn63wbLHFDZHjOgc7u++HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOT6n5enISaqbbzPzh90YpaXBz2nUaqPSDT6nSriNZQ=;
 b=cEZB17wADFuDmrB3i+nesshkBrZB2Ez0Smab6x0oP3PU5HRvNCk78JLt4ND+AFtBPz
 P8b1ofTUfyEcKC9oPeXxa1uNMcCkSTx7ixEuJIyDFpqODr38czduWtfUpGW6iUNTlCre
 9AjAmI65FNlZqmKeEBd5+oHquLpnmy9jGDds4TvJEuC8i+3nqJqcd0cYb+K2SX1HJT1m
 sYLd2xAsPnrQ4eS4MSxXzTa56SROtfvLehgR+z4QVWXQmN/Jh2KnyK/u6/kamXkOIIPK
 USzysBd+6D/J/5CNcvKIWvQrwSN971Gwd3sybUoTAfH41t9wYeet3IFr+s4rR3iHmVci
 nAKA==
X-Gm-Message-State: AOAM532COeJ/P5rTQYoAOWrTI9adhdctV+WKj0q4EKwiSKAfosjjLaS5
 V9OlE5cmoTG6lJg8tELV3gEIOqWQ2jWFnQ==
X-Google-Smtp-Source: ABdhPJwZW+54kWL16D/cepDJGXBbOXQ3PB0pVzTEL9JH5U3qYUGDnB0nAW23HgoqK9r3vuHvsKrcYw==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id
 k31mr3885852wms.47.1627387846803; 
 Tue, 27 Jul 2021 05:10:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 05/11] drm/i915: move gem_context slab to direct module
 init/exit
Date: Tue, 27 Jul 2021 14:10:31 +0200
Message-Id: <20210727121037.2041102-5-daniel.vetter@ffwll.ch>
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
noise with removing the static global.slab_luts to just a
slab_luts.

v2: Make slab static (Jason, 0day)

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 25 +++++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +++
 drivers/gpu/drm/i915/i915_globals.c         |  2 --
 drivers/gpu/drm/i915/i915_globals.h         |  1 -
 drivers/gpu/drm/i915/i915_pci.c             |  2 ++
 5 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 89ca401bf9ae..087e1ede6c43 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -79,25 +79,21 @@
 #include "gt/intel_ring.h"
 
 #include "i915_gem_context.h"
-#include "i915_globals.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
 #define ALL_L3_SLICES(dev) (1 << NUM_L3_SLICES(dev)) - 1
 
-static struct i915_global_gem_context {
-	struct i915_global base;
-	struct kmem_cache *slab_luts;
-} global;
+static struct kmem_cache *slab_luts;
 
 struct i915_lut_handle *i915_lut_handle_alloc(void)
 {
-	return kmem_cache_alloc(global.slab_luts, GFP_KERNEL);
+	return kmem_cache_alloc(slab_luts, GFP_KERNEL);
 }
 
 void i915_lut_handle_free(struct i915_lut_handle *lut)
 {
-	return kmem_cache_free(global.slab_luts, lut);
+	return kmem_cache_free(slab_luts, lut);
 }
 
 static void lut_close(struct i915_gem_context *ctx)
@@ -2282,21 +2278,16 @@ i915_gem_engines_iter_next(struct i915_gem_engines_iter *it)
 #include "selftests/i915_gem_context.c"
 #endif
 
-static void i915_global_gem_context_exit(void)
+void i915_gem_context_module_exit(void)
 {
-	kmem_cache_destroy(global.slab_luts);
+	kmem_cache_destroy(slab_luts);
 }
 
-static struct i915_global_gem_context global = { {
-	.exit = i915_global_gem_context_exit,
-} };
-
-int __init i915_global_gem_context_init(void)
+int __init i915_gem_context_module_init(void)
 {
-	global.slab_luts = KMEM_CACHE(i915_lut_handle, 0);
-	if (!global.slab_luts)
+	slab_luts = KMEM_CACHE(i915_lut_handle, 0);
+	if (!slab_luts)
 		return -ENOMEM;
 
-	i915_global_register(&global.base);
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index 20411db84914..18060536b0c2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -224,6 +224,9 @@ i915_gem_engines_iter_next(struct i915_gem_engines_iter *it);
 	for (i915_gem_engines_iter_init(&(it), (engines)); \
 	     ((ce) = i915_gem_engines_iter_next(&(it)));)
 
+void i915_gem_context_module_exit(void);
+int i915_gem_context_module_init(void);
+
 struct i915_lut_handle *i915_lut_handle_alloc(void);
 void i915_lut_handle_free(struct i915_lut_handle *lut);
 
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index d36eb7dc40aa..dbb3d81eeea7 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "gem/i915_gem_object.h"
 #include "i915_globals.h"
 #include "i915_request.h"
 #include "i915_scheduler.h"
@@ -31,7 +30,6 @@ static void __i915_globals_cleanup(void)
 }
 
 static __initconst int (* const initfn[])(void) = {
-	i915_global_gem_context_init,
 	i915_global_objects_init,
 	i915_global_request_init,
 	i915_global_scheduler_init,
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
index 60daa738a188..f16752dbbdbf 100644
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ b/drivers/gpu/drm/i915/i915_globals.h
@@ -23,7 +23,6 @@ int i915_globals_init(void);
 void i915_globals_exit(void);
 
 /* constructors */
-int i915_global_gem_context_init(void);
 int i915_global_objects_init(void);
 int i915_global_request_init(void);
 int i915_global_scheduler_init(void);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 8a9b0daef029..410a85a1cbab 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -34,6 +34,7 @@
 #include "i915_buddy.h"
 #include "i915_drv.h"
 #include "gem/i915_gem_context.h"
+#include "gem/i915_gem_object.h"
 #include "i915_perf.h"
 #include "i915_globals.h"
 #include "i915_selftest.h"
@@ -1300,6 +1301,7 @@ static const struct {
 	{ i915_active_module_init, i915_active_module_exit },
 	{ i915_buddy_module_init, i915_buddy_module_exit },
 	{ i915_context_module_init, i915_context_module_exit },
+	{ i915_gem_context_module_init, i915_gem_context_module_exit },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
-- 
2.32.0

