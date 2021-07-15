Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDA3CAF41
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8546E49A;
	Thu, 15 Jul 2021 22:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891F16E455
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:39:11 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id p36so6975656pfw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jcwphcKJO9pLpY070tV+qaBYrvw17p6gFbN9lGJR2I=;
 b=RObuNOMMSoQKIBLvLDzC0l+1NS3oX5NrJCVtFApipg7dBOrt9Cw6R9x4i2SZ2jB7j1
 JCtj+pApzgFPNKE0BteEXuVWAvomdLZwXqt2sYf5Vn8v0guOJ2mqXUXt51LXUVVdQf1B
 f9sP34FELkQU3RSNNuzKX5K5weeNxqE6O0RgDY+S9sTLa8Q4p4IzN+oNeyP6SLVdjqJp
 gG5lS83Ix71329RNcFH1RWiM2wqo/jS9ZroTXpN66CGTGjq1ydTk5b6FXabvNhyWlRqo
 hygF4b9gULs6Sn4dz3U5PloAPvmOlTolG1OUvitwyd5jbZfu144K8+h6UScsHV2Hz83U
 yZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jcwphcKJO9pLpY070tV+qaBYrvw17p6gFbN9lGJR2I=;
 b=JVai1PjxKvG6NnzD80qj9lSdQxR2xfDX6PTQYJ8BSUxO6ihtXj943jEzpyu2Fd5uhp
 qRfAaqybD/ByQP3O8dwJXbwhPLRZ7cTEq60cevBrzbhoyvjqG8l1lP25i7+yBaqlU7l5
 YWmDgiXpPucTvOkLxR/ZRX6Ocxp50VXmwzyzSzkGHjG4fnFSan+Rw+t1NDbMQctGQMAe
 hvbS+EzMXryb7ckQVO4m68LK8F2w+XO8t1tLSZafasyeAJihLR41LuPIYfd/zt1PxgIL
 pkCFXcGH9mfzLRTV8/YhWVzogQPlx5814yzKjBKWJgR5W9TOD/UNiY16MqzMttVR7b2p
 285g==
X-Gm-Message-State: AOAM531YmMFWn7W1O6u5+guAZgm5wUar3RtoTrBFXU6UPCn9V1shWJpZ
 +fChOoYHbZJq5UrRweyn5DUDbw==
X-Google-Smtp-Source: ABdhPJxtvb599Pb+jYg4WyJmpxc79u9lpzcDxUUL5z3sAf6yKhwwR80yXezC6JzoNShMt6nW/yfzgQ==
X-Received: by 2002:a05:6a00:21c6:b029:2ff:e9:94f0 with SMTP id
 t6-20020a056a0021c6b02902ff00e994f0mr7077057pfj.73.1626388750958; 
 Thu, 15 Jul 2021 15:39:10 -0700 (PDT)
Received: from omlet.com ([134.134.137.87])
 by smtp.gmail.com with ESMTPSA id ft7sm9959459pjb.32.2021.07.15.15.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:39:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/gem: Refactor placement setup for
 i915_gem_object_create*
Date: Thu, 15 Jul 2021 17:38:55 -0500
Message-Id: <20210715223900.1840576-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715223900.1840576-1-jason@jlekstrand.net>
References: <20210715223900.1840576-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we don't allow changing the set of regions after creation, we can
make ext_set_placements() build up the region set directly in the
create_ext and assign it to the object later.  This is similar to what
we did for contexts with the proto-context only simpler because there's
no funny object shuffling.  This will be used in the next patch to allow
us to de-duplicate a bunch of code.  Also, since we know the maximum
number of regions up-front, we can use a fixed-size temporary array for
the regions.  This simplifies memory management a bit for this new
delayed approach.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 75 +++++++++++++---------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 51f92e4b1a69d..391c8c4a12172 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -27,10 +27,13 @@ static u32 object_max_page_size(struct drm_i915_gem_object *obj)
 	return max_page_size;
 }
 
-static void object_set_placements(struct drm_i915_gem_object *obj,
-				  struct intel_memory_region **placements,
-				  unsigned int n_placements)
+static int object_set_placements(struct drm_i915_gem_object *obj,
+				 struct intel_memory_region **placements,
+				 unsigned int n_placements)
 {
+	struct intel_memory_region **arr;
+	unsigned int i;
+
 	GEM_BUG_ON(!n_placements);
 
 	/*
@@ -44,9 +47,20 @@ static void object_set_placements(struct drm_i915_gem_object *obj,
 		obj->mm.placements = &i915->mm.regions[mr->id];
 		obj->mm.n_placements = 1;
 	} else {
-		obj->mm.placements = placements;
+		arr = kmalloc_array(n_placements,
+				    sizeof(struct intel_memory_region *),
+				    GFP_KERNEL);
+		if (!arr)
+			return -ENOMEM;
+
+		for (i = 0; i < n_placements; i++)
+			arr[i] = placements[i];
+
+		obj->mm.placements = arr;
 		obj->mm.n_placements = n_placements;
 	}
+
+	return 0;
 }
 
 static int i915_gem_publish(struct drm_i915_gem_object *obj,
@@ -148,7 +162,9 @@ i915_gem_dumb_create(struct drm_file *file,
 		return -ENOMEM;
 
 	mr = intel_memory_region_by_type(to_i915(dev), mem_type);
-	object_set_placements(obj, &mr, 1);
+	ret = object_set_placements(obj, &mr, 1);
+	if (ret)
+		goto object_free;
 
 	ret = i915_gem_setup(obj, args->size);
 	if (ret)
@@ -184,7 +200,9 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
-	object_set_placements(obj, &mr, 1);
+	ret = object_set_placements(obj, &mr, 1);
+	if (ret)
+		goto object_free;
 
 	ret = i915_gem_setup(obj, args->size);
 	if (ret)
@@ -197,9 +215,12 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+#define MAX_N_PLACEMENTS = (INTEL_REGION_UNKNOWN + 1)
+
 struct create_ext {
 	struct drm_i915_private *i915;
-	struct drm_i915_gem_object *vanilla_object;
+	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
+	unsigned int n_placements;
 };
 
 static void repr_placements(char *buf, size_t size,
@@ -230,8 +251,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 	struct drm_i915_private *i915 = ext_data->i915;
 	struct drm_i915_gem_memory_class_instance __user *uregions =
 		u64_to_user_ptr(args->regions);
-	struct drm_i915_gem_object *obj = ext_data->vanilla_object;
-	struct intel_memory_region **placements;
+	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
 	u32 mask;
 	int i, ret = 0;
 
@@ -245,6 +265,8 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 		ret = -EINVAL;
 	}
 
+	BUILD_BUG_ON(ARRAY_SIZE(i915->mm.regions) != ARRAY_SIZE(placements));
+	BUILD_BUG_ON(ARRAY_SIZE(ext_data->placements) != ARRAY_SIZE(placements));
 	if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
 		drm_dbg(&i915->drm, "num_regions is too large\n");
 		ret = -EINVAL;
@@ -253,12 +275,6 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 	if (ret)
 		return ret;
 
-	placements = kmalloc_array(args->num_regions,
-				   sizeof(struct intel_memory_region *),
-				   GFP_KERNEL);
-	if (!placements)
-		return -ENOMEM;
-
 	mask = 0;
 	for (i = 0; i < args->num_regions; i++) {
 		struct drm_i915_gem_memory_class_instance region;
@@ -293,14 +309,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 		++uregions;
 	}
 
-	if (obj->mm.placements) {
+	if (ext_data->n_placements) {
 		ret = -EINVAL;
 		goto out_dump;
 	}
 
-	object_set_placements(obj, placements, args->num_regions);
-	if (args->num_regions == 1)
-		kfree(placements);
+	for (i = 0; i < args->num_regions; i++)
+		ext_data->placements[i] = placements[i];
 
 	return 0;
 
@@ -308,11 +323,11 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 	if (1) {
 		char buf[256];
 
-		if (obj->mm.placements) {
+		if (ext_data->n_placements) {
 			repr_placements(buf,
 					sizeof(buf),
-					obj->mm.placements,
-					obj->mm.n_placements);
+					ext_data->placements,
+					ext_data->n_placements);
 			drm_dbg(&i915->drm,
 				"Placements were already set in previous EXT. Existing placements: %s\n",
 				buf);
@@ -358,7 +373,6 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_create_ext *args = data;
 	struct create_ext ext_data = { .i915 = i915 };
-	struct intel_memory_region **placements_ext;
 	struct drm_i915_gem_object *obj;
 	int ret;
 
@@ -371,21 +385,22 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	if (!obj)
 		return -ENOMEM;
 
-	ext_data.vanilla_object = obj;
 	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
 				   create_extensions,
 				   ARRAY_SIZE(create_extensions),
 				   &ext_data);
-	placements_ext = obj->mm.placements;
 	if (ret)
 		goto object_free;
 
-	if (!placements_ext) {
-		struct intel_memory_region *mr =
+	if (!ext_data.n_placements) {
+		ext_data.placements[0] =
 			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
-
-		object_set_placements(obj, &mr, 1);
+		ext_data.n_placements = 1;
 	}
+	ret = object_set_placements(obj, ext_data.placements,
+				    ext_data.n_placements);
+	if (ret)
+		goto object_free;
 
 	ret = i915_gem_setup(obj, args->size);
 	if (ret)
@@ -395,7 +410,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 
 object_free:
 	if (obj->mm.n_placements > 1)
-		kfree(placements_ext);
+		kfree(obj->mm.placements);
 	i915_gem_object_free(obj);
 	return ret;
 }
-- 
2.31.1

