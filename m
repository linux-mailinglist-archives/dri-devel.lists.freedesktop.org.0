Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB373D17AE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567F6EB79;
	Wed, 21 Jul 2021 20:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BB76E8E6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:13:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 a17-20020a17090abe11b0290173ce472b8aso597452pjs.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L89y3utzctMMpUcRnr8ikndFxEbjuxLGLqXYi+OghUM=;
 b=Hi7ek76lB+3warkcBddULYdEpjPOUK2pJfZpy9iqK/yctmettYhRmXK1PogAP4I9Z4
 ph3KO1VglLOQWfrFIq1T2Pb8PCWOv959yJ0u4pGKZMZCB+f525MsKQpEROavp2O4oGK4
 zk4ZGRai656j29RN4RRK+YbHnmT82R9T1/tioLttFJeiT2T6qyC1qzonNmbdjqiCzqkC
 cQ1hcpT+sMztokKFTkwEVQUfqMUOcze0Z6J/36NebXoa2IW30jJADgHaq0xFew6loLdl
 8o4lnQ0TERD/2hTCa15kuHhktSwq/ZJ0kVDg72QKN84EF4G2q+CTKHkk7Kbd5r+4fY2R
 65XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L89y3utzctMMpUcRnr8ikndFxEbjuxLGLqXYi+OghUM=;
 b=l5+F7VfRH+zCDdaJ4/nbeudzDAaIBtvFW0d5JPE1mHEhxUdxdk9KvrG+QAdaIAk7hd
 H/OBTbE4uL6M7z5bIotrtQA1mmyaDOxh4J+FsQLfcB8cnr538FLHhKwm+0v4oqilGQgH
 +QGBUgosvndITtqT4u6yqihq4qDKo+L2cgtXBDoz+VG4DQBnKlRAjJg064GDCng4fJMx
 9J4mvuf+hpDhATQ5NT49ViE7GTiEmpC7N/9MuzXUy5kX+3DsgGsp/zO1IDG8ewdDHa2Y
 8aG0/vjA+qaExG13wEUT5bGSuJ6uI+pqPoUgoh/2VE3mQCO+U/5vacL1FjBIK6AD/L7F
 q4zQ==
X-Gm-Message-State: AOAM530b9OjKKGpBcZgu79EY2Ek9PPuFbG78k698PkG6H2e6urVagd+p
 hCDMJ4s6vPepUSmaCSSDb9dpMQ==
X-Google-Smtp-Source: ABdhPJyzvpjK3W7kObTGMxCvE8EuvyrU107AkhgjfOeRS/+fkWqATSwqAE7/DoRVbtOYvuSlu2iNSg==
X-Received: by 2002:a63:190b:: with SMTP id z11mr37217909pgl.320.1626898432882; 
 Wed, 21 Jul 2021 13:13:52 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id h24sm28777439pfn.180.2021.07.21.13.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:13:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/gem: Refactor placement setup for
 i915_gem_object_create* (v2)
Date: Wed, 21 Jul 2021 15:13:38 -0500
Message-Id: <20210721201343.2962674-3-jason@jlekstrand.net>
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

Since we don't allow changing the set of regions after creation, we can
make ext_set_placements() build up the region set directly in the
create_ext and assign it to the object later.  This is similar to what
we did for contexts with the proto-context only simpler because there's
no funny object shuffling.  This will be used in the next patch to allow
us to de-duplicate a bunch of code.  Also, since we know the maximum
number of regions up-front, we can use a fixed-size temporary array for
the regions.  This simplifies memory management a bit for this new
delayed approach.

v2 (Matthew Auld):
 - Get rid of MAX_N_PLACEMENTS
 - Drop kfree(placements) from set_placements()
v3 (Matthew Auld):
 - Properly set ext_data->n_placements

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 82 ++++++++++++----------
 1 file changed, 46 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 51f92e4b1a69d..aa687b10dcd45 100644
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
@@ -199,7 +217,8 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 
 struct create_ext {
 	struct drm_i915_private *i915;
-	struct drm_i915_gem_object *vanilla_object;
+	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
+	unsigned int n_placements;
 };
 
 static void repr_placements(char *buf, size_t size,
@@ -230,8 +249,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 	struct drm_i915_private *i915 = ext_data->i915;
 	struct drm_i915_gem_memory_class_instance __user *uregions =
 		u64_to_user_ptr(args->regions);
-	struct drm_i915_gem_object *obj = ext_data->vanilla_object;
-	struct intel_memory_region **placements;
+	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
 	u32 mask;
 	int i, ret = 0;
 
@@ -245,6 +263,8 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 		ret = -EINVAL;
 	}
 
+	BUILD_BUG_ON(ARRAY_SIZE(i915->mm.regions) != ARRAY_SIZE(placements));
+	BUILD_BUG_ON(ARRAY_SIZE(ext_data->placements) != ARRAY_SIZE(placements));
 	if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
 		drm_dbg(&i915->drm, "num_regions is too large\n");
 		ret = -EINVAL;
@@ -253,21 +273,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
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
 		struct intel_memory_region *mr;
 
-		if (copy_from_user(&region, uregions, sizeof(region))) {
-			ret = -EFAULT;
-			goto out_free;
-		}
+		if (copy_from_user(&region, uregions, sizeof(region)))
+			return -EFAULT;
 
 		mr = intel_memory_region_lookup(i915,
 						region.memory_class,
@@ -293,14 +305,14 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
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
+	ext_data->n_placements = args->num_regions;
+	for (i = 0; i < args->num_regions; i++)
+		ext_data->placements[i] = placements[i];
 
 	return 0;
 
@@ -308,11 +320,11 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
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
@@ -322,8 +334,6 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
 		drm_dbg(&i915->drm, "New placements(so far validated): %s\n", buf);
 	}
 
-out_free:
-	kfree(placements);
 	return ret;
 }
 
@@ -358,7 +368,6 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_create_ext *args = data;
 	struct create_ext ext_data = { .i915 = i915 };
-	struct intel_memory_region **placements_ext;
 	struct drm_i915_gem_object *obj;
 	int ret;
 
@@ -371,21 +380,22 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
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
@@ -395,7 +405,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 
 object_free:
 	if (obj->mm.n_placements > 1)
-		kfree(placements_ext);
+		kfree(obj->mm.placements);
 	i915_gem_object_free(obj);
 	return ret;
 }
-- 
2.31.1

