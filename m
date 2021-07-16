Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFD3CB895
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF44E6E9AC;
	Fri, 16 Jul 2021 14:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FCB6E99E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:14:33 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 75-20020a9d08510000b02904acfe6bcccaso9950799oty.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQUnq73rmSFnzedAhDM56LscWFXGHB24kdWyQtbMJqU=;
 b=L6xGdvdAxJqNB97TZXxj0U463DKe3um7FWiW4VscAbo21dFuUk98+gNUjpVLMUg5Nb
 /7NonQilG5Wno9WdElfzZEfy0jkvAZIsE8DtV102QenQAbXKm9p9YXcSlpfmBCjLx5zn
 K4ItXPXO7uBlH9Fs+31dbbsZRlJc6FrspXHe/zc6LeDQozO8pcyV/DvB4KxrhpkD3+Ad
 p+4zdCL7wyz7Qj4wDJ4izE8ddDCxE6s2pH/Pof82l0SdHWTQt2o3U/SJKKUvPthQbGGH
 sFcNhgRS5ei9CTwIlKHAet1rq6TmPr3j4gOWWuRFhQhj7eetReyNfb+GzYXT9DYPkgv/
 keqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQUnq73rmSFnzedAhDM56LscWFXGHB24kdWyQtbMJqU=;
 b=cLRSOXTmbmzlqtfDrUOhg2UslOgC5iZrITd0DQ0AZyM1v0Xr0N2Xvh498Hdp6w9nRr
 K9BOsA+ksSKbDhu7Hv5nEzH55ar6cJuSHK1ZJ4ay/fC4RzEuZMVZm4+tVQiZectMVe80
 0Lzn4d3tPUXiMTVEAZWYTDqbghxrnChFfsce2YD3tavafWErfVkcfiPPrRdkiU0wfGHp
 vULvUHHSYHq2nB2r7XDH52MTT3qPQUeSEyAs0ykUfLeiCAFK+AlHVVrlUIyELf/7y56j
 gGvtKqN95qLY+/8kzpxgxyOUXltAHQcBEvnZTA3zzcM3+LMwwaYhZkrpYWQXELikNG/z
 X2lQ==
X-Gm-Message-State: AOAM53100qR/nL19OXsntqPpUIIq3ZuoR4MxJUNcTfVd3G8idFHA6ZZC
 FXVRZe7FwWi6Ftq8WKnUOdSHEA==
X-Google-Smtp-Source: ABdhPJzY4AGpL3vqgR1+t7onsRh7XfIUST93w0D/cMYnqrWcw9z0BrP6+d6GVG0D4niq2AcEITQD4A==
X-Received: by 2002:a9d:4b0e:: with SMTP id q14mr8609610otf.217.1626444872318; 
 Fri, 16 Jul 2021 07:14:32 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id v42sm1852266ott.70.2021.07.16.07.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:14:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/gem: Unify user object creation (v2)
Date: Fri, 16 Jul 2021 09:14:23 -0500
Message-Id: <20210716141426.1904528-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716141426.1904528-1-jason@jlekstrand.net>
References: <20210716141426.1904528-1-jason@jlekstrand.net>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of hand-rolling the same three calls in each function, pull them
into an i915_gem_object_create_user helper.  Apart from re-ordering of
the placements array ENOMEM check, there should be no functional change.

v2 (Matthew Auld):
 - Add the call to i915_gem_flush_free_objects() from
   i915_gem_dumb_create() in a separate patch
 - Move i915_gem_object_alloc() below the simple error checks

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 108 ++++++++-------------
 1 file changed, 43 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 1b370914587c0..039e4f3b39c79 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -11,13 +11,14 @@
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
-static u32 object_max_page_size(struct drm_i915_gem_object *obj)
+static u32 object_max_page_size(struct intel_memory_region **placements,
+				unsigned int n_placements)
 {
 	u32 max_page_size = 0;
 	int i;
 
-	for (i = 0; i < obj->mm.n_placements; i++) {
-		struct intel_memory_region *mr = obj->mm.placements[i];
+	for (i = 0; i < n_placements; i++) {
+		struct intel_memory_region *mr = placements[i];
 
 		GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
 		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
@@ -81,22 +82,35 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
 	return 0;
 }
 
-static int
-i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
+static struct drm_i915_gem_object *
+i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
+			    struct intel_memory_region **placements,
+			    unsigned int n_placements)
 {
-	struct intel_memory_region *mr = obj->mm.placements[0];
+	struct intel_memory_region *mr = placements[0];
+	struct drm_i915_gem_object *obj;
 	unsigned int flags;
 	int ret;
 
-	size = round_up(size, object_max_page_size(obj));
+	i915_gem_flush_free_objects(i915);
+
+	size = round_up(size, object_max_page_size(placements, n_placements));
 	if (size == 0)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	/* For most of the ABI (e.g. mmap) we think in system pages */
 	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
 
 	if (i915_gem_object_size_2big(size))
-		return -E2BIG;
+		return ERR_PTR(-E2BIG);
+
+	obj = i915_gem_object_alloc();
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	ret = object_set_placements(obj, placements, n_placements);
+	if (ret)
+		goto object_free;
 
 	/*
 	 * I915_BO_ALLOC_USER will make sure the object is cleared before
@@ -106,12 +120,18 @@ i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 
 	ret = mr->ops->init_object(mr, obj, size, 0, flags);
 	if (ret)
-		return ret;
+		goto object_free;
 
 	GEM_BUG_ON(size != obj->base.size);
 
 	trace_i915_gem_object_create(obj);
-	return 0;
+	return obj;
+
+object_free:
+	if (obj->mm.n_placements > 1)
+		kfree(obj->mm.placements);
+	i915_gem_object_free(obj);
+	return ERR_PTR(ret);
 }
 
 int
@@ -124,7 +144,6 @@ i915_gem_dumb_create(struct drm_file *file,
 	enum intel_memory_type mem_type;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	u32 format;
-	int ret;
 
 	switch (cpp) {
 	case 1:
@@ -151,32 +170,19 @@ i915_gem_dumb_create(struct drm_file *file,
 	if (args->pitch < args->width)
 		return -EINVAL;
 
-	i915_gem_flush_free_objects(i915);
-
 	args->size = mul_u32_u32(args->pitch, args->height);
 
 	mem_type = INTEL_MEMORY_SYSTEM;
 	if (HAS_LMEM(to_i915(dev)))
 		mem_type = INTEL_MEMORY_LOCAL;
 
-	obj = i915_gem_object_alloc();
-	if (!obj)
-		return -ENOMEM;
-
 	mr = intel_memory_region_by_type(to_i915(dev), mem_type);
-	ret = object_set_placements(obj, &mr, 1);
-	if (ret)
-		goto object_free;
 
-	ret = i915_gem_setup(obj, args->size);
-	if (ret)
-		goto object_free;
+	obj = i915_gem_object_create_user(to_i915(dev), args->size, &mr, 1);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
-
-object_free:
-	i915_gem_object_free(obj);
-	return ret;
 }
 
 /**
@@ -193,28 +199,14 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_create *args = data;
 	struct drm_i915_gem_object *obj;
 	struct intel_memory_region *mr;
-	int ret;
-
-	i915_gem_flush_free_objects(i915);
-
-	obj = i915_gem_object_alloc();
-	if (!obj)
-		return -ENOMEM;
 
 	mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
-	ret = object_set_placements(obj, &mr, 1);
-	if (ret)
-		goto object_free;
 
-	ret = i915_gem_setup(obj, args->size);
-	if (ret)
-		goto object_free;
+	obj = i915_gem_object_create_user(i915, args->size, &mr, 1);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
-
-object_free:
-	i915_gem_object_free(obj);
-	return ret;
 }
 
 struct create_ext {
@@ -375,38 +367,24 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	if (args->flags)
 		return -EINVAL;
 
-	i915_gem_flush_free_objects(i915);
-
-	obj = i915_gem_object_alloc();
-	if (!obj)
-		return -ENOMEM;
-
 	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
 				   create_extensions,
 				   ARRAY_SIZE(create_extensions),
 				   &ext_data);
 	if (ret)
-		goto object_free;
+		return ret;
 
 	if (!ext_data.n_placements) {
 		ext_data.placements[0] =
 			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
 		ext_data.n_placements = 1;
 	}
-	ret = object_set_placements(obj, ext_data.placements,
-				    ext_data.n_placements);
-	if (ret)
-		goto object_free;
 
-	ret = i915_gem_setup(obj, args->size);
-	if (ret)
-		goto object_free;
+	obj = i915_gem_object_create_user(i915, args->size,
+					  ext_data.placements,
+					  ext_data.n_placements);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
-
-object_free:
-	if (obj->mm.n_placements > 1)
-		kfree(obj->mm.placements);
-	i915_gem_object_free(obj);
-	return ret;
 }
-- 
2.31.1

