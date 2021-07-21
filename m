Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78633D17B2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBB46ECC0;
	Wed, 21 Jul 2021 20:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983406EB85
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:13:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so2020137pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zI0rqrMZ28s7JubDsYVLJPN6iG996UpQZ7JHu+2Zfos=;
 b=CKUWp//N51Ar2W5xrrBgIFeQ2iuLFeDeyytAVWHh8DnpC+vXrrENxI1/nGqbDhMyjH
 NNkw4MJ+Fn1W9E3NPaVtq3M/BgbMqu661zqTqVuU0+FfUy7RXU2QMcr9hr/3X0UQOAtm
 bZvx75xp0PV5Y+jzYdcD1KqafCxivimlPKExNY6XoHigqmDZO0ER52wUZz1Iev+7jYiS
 Q2j66xtF77xpsddmh5FrM1QzEBFoKimR403WuZ+FnbpelGU/sWWAxN80bSZtE7i8HyXY
 FiUjBcS27T133lVPnpdtraGBrHquMXDDYQwd9+xXFUWIR1ibpwSrJNOvUPEURvMvLzw4
 LMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zI0rqrMZ28s7JubDsYVLJPN6iG996UpQZ7JHu+2Zfos=;
 b=udo7rNH4Zmy32HRXOxHZqHeeHxqg2kwp6pMCtnUAUUk/tcUhvDr40MWzIAazzo14Rq
 iaeLRpd6zCHstBDOYyIPVT6mMjyGfCD0v44pX+NAot/of8e0XtrP8fEj7GoCROf4Ir0b
 2G6vT+wDx+KgzfWk0xN/qn/mJZ+vgMSyod73a63sunqTswgbTABeFY1xhpN1jYopKwQv
 sTD7uXG/Hh/3kFAZzWq5l8H403C8UOgUiYX/+cQF/bbm3UrsfiLXXSGg0pG/sXmtSM/N
 fs29JIiVbOqPgH+5bEXL21YlBvl+9u+wHrCLnm5rNrPzjxQhu0+zHU/2qEOcFaNSL46m
 pzVA==
X-Gm-Message-State: AOAM530ceInmnyrJjyRnDIY6DijRy/dfWFnZZcWIj9zcfJLvWsp1P6O/
 mnCnJYDhiqmlveHMhifLrxfvBw==
X-Google-Smtp-Source: ABdhPJxDY48EapZ54ahjgel7pMLSRlUpsnlW+ZlbN4yVa7i8uMSJCW28fwqGY5F8NeSDMWn+rPMWvQ==
X-Received: by 2002:a63:580a:: with SMTP id m10mr37741763pgb.254.1626898436168; 
 Wed, 21 Jul 2021 13:13:56 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id h24sm28777439pfn.180.2021.07.21.13.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:13:55 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/gem: Unify user object creation (v3)
Date: Wed, 21 Jul 2021 15:13:40 -0500
Message-Id: <20210721201343.2962674-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721201343.2962674-1-jason@jlekstrand.net>
References: <20210721201343.2962674-1-jason@jlekstrand.net>
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
v3 (Matthew Auld):
 - Add __ to i915_gem_object_create_user and kerneldoc which warns the
   caller that it's not validating anything.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 119 ++++++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_object.h |   4 +
 2 files changed, 58 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index adcce37c04b8d..23fee13a33844 100644
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
@@ -81,22 +82,46 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
 	return 0;
 }
 
-static int
-i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
+/**
+ * Creates a new object using the same path as DRM_I915_GEM_CREATE_EXT
+ * @i915: i915 private
+ * @size: size of the buffer, in bytes
+ * @placements: possible placement regions, in priority order
+ * @n_placements: number of possible placement regions
+ *
+ * This function is exposed primarily for selftests and does very little
+ * error checking.  It is assumed that the set of placement regions has
+ * already been verified to be valid.
+ */
+struct drm_i915_gem_object *
+__i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
+			      struct intel_memory_region **placements,
+			      unsigned int n_placements)
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
@@ -106,12 +131,18 @@ i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 
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
@@ -124,7 +155,6 @@ i915_gem_dumb_create(struct drm_file *file,
 	enum intel_memory_type mem_type;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	u32 format;
-	int ret;
 
 	switch (cpp) {
 	case 1:
@@ -151,32 +181,19 @@ i915_gem_dumb_create(struct drm_file *file,
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
+	obj = __i915_gem_object_create_user(to_i915(dev), args->size, &mr, 1);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
-
-object_free:
-	i915_gem_object_free(obj);
-	return ret;
 }
 
 /**
@@ -193,28 +210,14 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
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
+	obj = __i915_gem_object_create_user(i915, args->size, &mr, 1);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
-
-object_free:
-	i915_gem_object_free(obj);
-	return ret;
 }
 
 struct create_ext {
@@ -376,38 +379,24 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
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
+	obj = __i915_gem_object_create_user(i915, args->size,
+					    ext_data.placements,
+					    ext_data.n_placements);
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index f3ede43282dc6..0896ac532f5e5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -61,6 +61,10 @@ i915_gem_object_create_shmem(struct drm_i915_private *i915,
 struct drm_i915_gem_object *
 i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
 				       const void *data, resource_size_t size);
+struct drm_i915_gem_object *
+__i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
+			      struct intel_memory_region **placements,
+			      unsigned int n_placements);
 
 extern const struct drm_i915_gem_object_ops i915_gem_shmem_ops;
 
-- 
2.31.1

