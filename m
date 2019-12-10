Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B118B119F13
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 00:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A376E9AD;
	Tue, 10 Dec 2019 23:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEB66E9AD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 23:08:47 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i4so17135965otr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 15:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dGXuRElCNZHcM4mgmNVXm0l4pQ+kat+Y6XfiaWWTbCQ=;
 b=nAB/WE/QHc0YbpMsgvgPv9RQSth0sdg2vQZv6nVsIOa9t+XqNeB+6Sq5+40s1PIZk0
 lAuL0SOxazVb1tBAi5jl9cpibAbcd/z7mzicTO0dMFTwoapLd6wld/Bon7LHOFXHcJ3W
 OLY3PMatT1NJhs4n8cPKT4cjnjghrSoW28hro+Xf1V8yzBrjjT94W0sfELffsaW/IUyz
 3NB3Z3IxnJAdwpr8RnCA2TCHqzqdHJ7OoGtifRTnqHlbW136L5t+7kPLGtkrK4Irw12G
 4iBd9pc4viBObwBXfejx7BIn7ygRv1ciq5AoYkCRyrAYYf8o1Yy44xZlUGlmkjoU5k/f
 XClQ==
X-Gm-Message-State: APjAAAXdOgaYlL4qwxWm4/6Sd2F4xQ/D+ejRsiZiAY4jhGqufqZK4uz8
 qsLcj64WPVRsg3kWaFZ/SNzzLUU=
X-Google-Smtp-Source: APXvYqyuvLa1bpKvgTW2sbjXECkJ907FI/QRLjrgKEP+a8OjtpQtltk/QLvj0mFu3tzKH2iGN8irog==
X-Received: by 2002:a05:6830:1e2d:: with SMTP id
 t13mr230296otr.128.1576019325970; 
 Tue, 10 Dec 2019 15:08:45 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id a16sm108057otd.64.2019.12.10.15.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 15:08:45 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panfrost: Add the panfrost_gem_mapping concept
Date: Tue, 10 Dec 2019 17:08:44 -0600
Message-Id: <20191210230844.794-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Boris Brezillon <boris.brezillon@collabora.com>

With the introduction of per-FD address space, the same BO can be mapped
in different address space if the BO is globally visible (GEM_FLINK)
and opened in different context or if the dmabuf is self-imported. The
current implementation does not take that case into account, and 
attaches the mapping directly to the panfrost_gem_object.

Let's create a panfrost_gem_mapping struct and allow multiple mappings
per BO.

The mappings are refcounted which helps solve another problem where
mappings were torn down (GEM handle closed by userspace) while GPU
jobs accessing those BOs were still in-flight. Jobs now keep a
reference on the mappings they use.

v2 (robh):
- Minor review comment clean-ups from Steven
- Use list_is_singular helper
- Just WARN if we add a mapping when madvise state is not WILLNEED.
  With that, drop the use of object_name_lock.

Fixes: a5efb4c9a562 ("drm/panfrost: Restructure the GEM object creation")
Fixes: 7282f7645d06 ("drm/panfrost: Implement per FD address spaces")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
I've hacked up IGT prime_self_import test to run on panfrost other than 
the 2 test which depend on i915 debugfs files (export-vs-gem_close-race, 
reimport-vs-gem_close-race). With this patch, they now pass.

I'm not adding the test to IGT which is just a copy-n-paste of the 
original except for different wrappers for BO alloc and mmap. That 
should be fixed first IMO.

Rob

 drivers/gpu/drm/panfrost/panfrost_drv.c       |  91 +++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c       | 123 +++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_gem.h       |  41 +++++-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  13 +-
 drivers/gpu/drm/panfrost/panfrost_job.h       |   1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  61 +++++----
 drivers/gpu/drm/panfrost/panfrost_mmu.h       |   6 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  34 +++--
 9 files changed, 299 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index f61364f7c471..88b431a267af 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -78,8 +78,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
+	struct panfrost_file_priv *priv = file->driver_priv;
 	struct panfrost_gem_object *bo;
 	struct drm_panfrost_create_bo *args = data;
+	struct panfrost_gem_mapping *mapping;
 
 	if (!args->size || args->pad ||
 	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
@@ -95,7 +97,14 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	args->offset = bo->node.start << PAGE_SHIFT;
+	mapping = panfrost_gem_mapping_get(bo, priv);
+	if (!mapping) {
+		drm_gem_object_put_unlocked(&bo->base.base);
+		return -EINVAL;
+	}
+
+	args->offset = mapping->mmnode.start << PAGE_SHIFT;
+	panfrost_gem_mapping_put(mapping);
 
 	return 0;
 }
@@ -119,6 +128,11 @@ panfrost_lookup_bos(struct drm_device *dev,
 		  struct drm_panfrost_submit *args,
 		  struct panfrost_job *job)
 {
+	struct panfrost_file_priv *priv = file_priv->driver_priv;
+	struct panfrost_gem_object *bo;
+	unsigned int i;
+	int ret;
+
 	job->bo_count = args->bo_handle_count;
 
 	if (!job->bo_count)
@@ -130,9 +144,32 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->implicit_fences)
 		return -ENOMEM;
 
-	return drm_gem_objects_lookup(file_priv,
-				      (void __user *)(uintptr_t)args->bo_handles,
-				      job->bo_count, &job->bos);
+	ret = drm_gem_objects_lookup(file_priv,
+				     (void __user *)(uintptr_t)args->bo_handles,
+				     job->bo_count, &job->bos);
+	if (ret)
+		return ret;
+
+	job->mappings = kvmalloc_array(job->bo_count,
+				       sizeof(struct panfrost_gem_mapping *),
+				       GFP_KERNEL | __GFP_ZERO);
+	if (!job->mappings)
+		return -ENOMEM;
+
+	for (i = 0; i < job->bo_count; i++) {
+		struct panfrost_gem_mapping *mapping;
+
+		bo = to_panfrost_bo(job->bos[i]);
+		mapping = panfrost_gem_mapping_get(bo, priv);
+		if (!mapping) {
+			ret = -EINVAL;
+			break;
+		}
+
+		job->mappings[i] = mapping;
+	}
+
+	return ret;
 }
 
 /**
@@ -320,7 +357,9 @@ static int panfrost_ioctl_mmap_bo(struct drm_device *dev, void *data,
 static int panfrost_ioctl_get_bo_offset(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv)
 {
+	struct panfrost_file_priv *priv = file_priv->driver_priv;
 	struct drm_panfrost_get_bo_offset *args = data;
+	struct panfrost_gem_mapping *mapping;
 	struct drm_gem_object *gem_obj;
 	struct panfrost_gem_object *bo;
 
@@ -331,18 +370,26 @@ static int panfrost_ioctl_get_bo_offset(struct drm_device *dev, void *data,
 	}
 	bo = to_panfrost_bo(gem_obj);
 
-	args->offset = bo->node.start << PAGE_SHIFT;
-
+	mapping = panfrost_gem_mapping_get(bo, priv);
 	drm_gem_object_put_unlocked(gem_obj);
+
+	if (!mapping)
+		return -EINVAL;
+
+	args->offset = mapping->mmnode.start << PAGE_SHIFT;
+	panfrost_gem_mapping_put(mapping);
 	return 0;
 }
 
 static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv)
 {
+	struct panfrost_file_priv *priv = file_priv->driver_priv;
 	struct drm_panfrost_madvise *args = data;
 	struct panfrost_device *pfdev = dev->dev_private;
 	struct drm_gem_object *gem_obj;
+	struct panfrost_gem_object *bo;
+	int ret = 0;
 
 	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
 	if (!gem_obj) {
@@ -350,22 +397,48 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 		return -ENOENT;
 	}
 
+	bo = to_panfrost_bo(gem_obj);
+
 	mutex_lock(&pfdev->shrinker_lock);
+	mutex_lock(&bo->mappings.lock);
+	if (args->madv == PANFROST_MADV_DONTNEED) {
+		struct panfrost_gem_mapping *first;
+
+		first = list_first_entry(&bo->mappings.list,
+					 struct panfrost_gem_mapping,
+					 node);
+
+		/*
+		 * If we want to mark the BO purgeable, there must be only one
+		 * user: the caller FD.
+		 * We could do something smarter and mark the BO purgeable only
+		 * when all its users have marked it purgeable, but globally
+		 * visible/shared BOs are likely to never be marked purgeable
+		 * anyway, so let's not bother.
+		 */
+		if (!list_is_singular(&bo->mappings.list) ||
+		    WARN_ON_ONCE(first->mmu != &priv->mmu)) {
+			ret = -EINVAL;
+			goto out_unlock_mappings;
+		}
+	}
+
 	args->retained = drm_gem_shmem_madvise(gem_obj, args->madv);
 
 	if (args->retained) {
-		struct panfrost_gem_object *bo = to_panfrost_bo(gem_obj);
-
 		if (args->madv == PANFROST_MADV_DONTNEED)
 			list_add_tail(&bo->base.madv_list,
 				      &pfdev->shrinker_list);
 		else if (args->madv == PANFROST_MADV_WILLNEED)
 			list_del_init(&bo->base.madv_list);
 	}
+
+out_unlock_mappings:
+	mutex_unlock(&bo->mappings.lock);
 	mutex_unlock(&pfdev->shrinker_lock);
 
 	drm_gem_object_put_unlocked(gem_obj);
-	return 0;
+	return ret;
 }
 
 int panfrost_unstable_ioctl_check(void)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index fd766b1395fb..3a7862e3e775 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -29,6 +29,12 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	list_del_init(&bo->base.madv_list);
 	mutex_unlock(&pfdev->shrinker_lock);
 
+	/*
+	 * If we still have mappings attached to the BO, there's a problem in
+	 * our refcounting.
+	 */
+	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
+
 	if (bo->sgts) {
 		int i;
 		int n_sgt = bo->base.base.size / SZ_2M;
@@ -46,6 +52,68 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	drm_gem_shmem_free_object(obj);
 }
 
+struct panfrost_gem_mapping *
+panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
+			 struct panfrost_file_priv *priv)
+{
+	struct panfrost_gem_mapping *iter;
+
+	mutex_lock(&bo->mappings.lock);
+	list_for_each_entry(iter, &bo->mappings.list, node) {
+		if (iter->mmu == &priv->mmu) {
+			kref_get(&iter->refcount);
+			break;
+		}
+	}
+	mutex_unlock(&bo->mappings.lock);
+
+	return iter;
+}
+
+static void
+panfrost_gem_teardown_mapping(struct panfrost_gem_mapping *mapping)
+{
+	struct panfrost_file_priv *priv;
+
+	if (mapping->active)
+		panfrost_mmu_unmap(mapping);
+
+	priv = container_of(mapping->mmu, struct panfrost_file_priv, mmu);
+	spin_lock(&priv->mm_lock);
+	if (drm_mm_node_allocated(&mapping->mmnode))
+		drm_mm_remove_node(&mapping->mmnode);
+	spin_unlock(&priv->mm_lock);
+}
+
+static void panfrost_gem_mapping_release(struct kref *kref)
+{
+	struct panfrost_gem_mapping *mapping;
+
+	mapping = container_of(kref, struct panfrost_gem_mapping, refcount);
+
+	panfrost_gem_teardown_mapping(mapping);
+	drm_gem_object_put_unlocked(&mapping->obj->base.base);
+	kfree(mapping);
+}
+
+void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping)
+{
+	if (!mapping)
+		return;
+
+	kref_put(&mapping->refcount, panfrost_gem_mapping_release);
+}
+
+void panfrost_gem_teardown_mappings(struct panfrost_gem_object *bo)
+{
+	struct panfrost_gem_mapping *mapping;
+
+	mutex_lock(&bo->mappings.lock);
+	list_for_each_entry(mapping, &bo->mappings.list, node)
+		panfrost_gem_teardown_mapping(mapping);
+	mutex_unlock(&bo->mappings.lock);
+}
+
 int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv)
 {
 	int ret;
@@ -54,6 +122,16 @@ int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv)
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	unsigned long color = bo->noexec ? PANFROST_BO_NOEXEC : 0;
 	struct panfrost_file_priv *priv = file_priv->driver_priv;
+	struct panfrost_gem_mapping *mapping;
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&mapping->node);
+	kref_init(&mapping->refcount);
+	drm_gem_object_get(obj);
+	mapping->obj = bo;
 
 	/*
 	 * Executable buffers cannot cross a 16MB boundary as the program
@@ -66,37 +144,48 @@ int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv)
 	else
 		align = size >= SZ_2M ? SZ_2M >> PAGE_SHIFT : 0;
 
-	bo->mmu = &priv->mmu;
+	mapping->mmu = &priv->mmu;
 	spin_lock(&priv->mm_lock);
-	ret = drm_mm_insert_node_generic(&priv->mm, &bo->node,
+	ret = drm_mm_insert_node_generic(&priv->mm, &mapping->mmnode,
 					 size >> PAGE_SHIFT, align, color, 0);
 	spin_unlock(&priv->mm_lock);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (!bo->is_heap) {
-		ret = panfrost_mmu_map(bo);
-		if (ret) {
-			spin_lock(&priv->mm_lock);
-			drm_mm_remove_node(&bo->node);
-			spin_unlock(&priv->mm_lock);
-		}
+		ret = panfrost_mmu_map(mapping);
+		if (ret)
+			goto err;
 	}
+
+	mutex_lock(&bo->mappings.lock);
+	WARN_ON(bo->base.madv != PANFROST_MADV_WILLNEED);
+	list_add_tail(&mapping->node, &bo->mappings.list);
+	mutex_unlock(&bo->mappings.lock);
+
+err:
+	if (ret)
+		panfrost_gem_mapping_put(mapping);
 	return ret;
 }
 
 void panfrost_gem_close(struct drm_gem_object *obj, struct drm_file *file_priv)
 {
-	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	struct panfrost_file_priv *priv = file_priv->driver_priv;
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	struct panfrost_gem_mapping *mapping = NULL, *iter;
 
-	if (bo->is_mapped)
-		panfrost_mmu_unmap(bo);
+	mutex_lock(&bo->mappings.lock);
+	list_for_each_entry(iter, &bo->mappings.list, node) {
+		if (iter->mmu == &priv->mmu) {
+			mapping = iter;
+			list_del(&iter->node);
+			break;
+		}
+	}
+	mutex_unlock(&bo->mappings.lock);
 
-	spin_lock(&priv->mm_lock);
-	if (drm_mm_node_allocated(&bo->node))
-		drm_mm_remove_node(&bo->node);
-	spin_unlock(&priv->mm_lock);
+	panfrost_gem_mapping_put(mapping);
 }
 
 static int panfrost_gem_pin(struct drm_gem_object *obj)
@@ -136,6 +225,8 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	if (!obj)
 		return NULL;
 
+	INIT_LIST_HEAD(&obj->mappings.list);
+	mutex_init(&obj->mappings.lock);
 	obj->base.base.funcs = &panfrost_gem_funcs;
 
 	return &obj->base.base;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 4b17e7308764..ca1bc9019600 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -13,23 +13,46 @@ struct panfrost_gem_object {
 	struct drm_gem_shmem_object base;
 	struct sg_table *sgts;
 
-	struct panfrost_mmu *mmu;
-	struct drm_mm_node node;
-	bool is_mapped		:1;
+	/*
+	 * Use a list for now. If searching a mapping ever becomes the
+	 * bottleneck, we should consider using an RB-tree, or even better,
+	 * let the core store drm_gem_object_mapping entries (where we
+	 * could place driver specific data) instead of drm_gem_object ones
+	 * in its drm_file->object_idr table.
+	 *
+	 * struct drm_gem_object_mapping {
+	 *	struct drm_gem_object *obj;
+	 *	void *driver_priv;
+	 * };
+	 */
+	struct {
+		struct list_head list;
+		struct mutex lock;
+	} mappings;
+
 	bool noexec		:1;
 	bool is_heap		:1;
 };
 
+struct panfrost_gem_mapping {
+	struct list_head node;
+	struct kref refcount;
+	struct panfrost_gem_object *obj;
+	struct drm_mm_node mmnode;
+	struct panfrost_mmu *mmu;
+	bool active		:1;
+};
+
 static inline
 struct  panfrost_gem_object *to_panfrost_bo(struct drm_gem_object *obj)
 {
 	return container_of(to_drm_gem_shmem_obj(obj), struct panfrost_gem_object, base);
 }
 
-static inline
-struct  panfrost_gem_object *drm_mm_node_to_panfrost_bo(struct drm_mm_node *node)
+static inline struct panfrost_gem_mapping *
+drm_mm_node_to_panfrost_mapping(struct drm_mm_node *node)
 {
-	return container_of(node, struct panfrost_gem_object, node);
+	return container_of(node, struct panfrost_gem_mapping, mmnode);
 }
 
 struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size);
@@ -49,6 +72,12 @@ int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv);
 void panfrost_gem_close(struct drm_gem_object *obj,
 			struct drm_file *file_priv);
 
+struct panfrost_gem_mapping *
+panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
+			 struct panfrost_file_priv *priv);
+void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
+void panfrost_gem_teardown_mappings(struct panfrost_gem_object *bo);
+
 void panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 458f0fa68111..f5dd7b29bc95 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -39,11 +39,12 @@ panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc
 static bool panfrost_gem_purge(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 
 	if (!mutex_trylock(&shmem->pages_lock))
 		return false;
 
-	panfrost_mmu_unmap(to_panfrost_bo(obj));
+	panfrost_gem_teardown_mappings(bo);
 	drm_gem_shmem_purge_locked(obj);
 
 	mutex_unlock(&shmem->pages_lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index d411eb6c8eb9..e364ee00f3d0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -268,9 +268,20 @@ static void panfrost_job_cleanup(struct kref *ref)
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->render_done_fence);
 
-	if (job->bos) {
+	if (job->mappings) {
 		for (i = 0; i < job->bo_count; i++)
+			panfrost_gem_mapping_put(job->mappings[i]);
+		kvfree(job->mappings);
+	}
+
+	if (job->bos) {
+		struct panfrost_gem_object *bo;
+
+		for (i = 0; i < job->bo_count; i++) {
+			bo = to_panfrost_bo(job->bos[i]);
 			drm_gem_object_put_unlocked(job->bos[i]);
+		}
+
 		kvfree(job->bos);
 	}
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 62454128a792..bbd3ba97ff67 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -32,6 +32,7 @@ struct panfrost_job {
 
 	/* Exclusive fences we have taken from the BOs to wait for */
 	struct dma_fence **implicit_fences;
+	struct panfrost_gem_mapping **mappings;
 	struct drm_gem_object **bos;
 	u32 bo_count;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index a3ed64a1f15e..763cfca886a7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -269,14 +269,15 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 	return 0;
 }
 
-int panfrost_mmu_map(struct panfrost_gem_object *bo)
+int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 {
+	struct panfrost_gem_object *bo = mapping->obj;
 	struct drm_gem_object *obj = &bo->base.base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE;
 
-	if (WARN_ON(bo->is_mapped))
+	if (WARN_ON(mapping->active))
 		return 0;
 
 	if (bo->noexec)
@@ -286,25 +287,28 @@ int panfrost_mmu_map(struct panfrost_gem_object *bo)
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
 
-	mmu_map_sg(pfdev, bo->mmu, bo->node.start << PAGE_SHIFT, prot, sgt);
-	bo->is_mapped = true;
+	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
+		   prot, sgt);
+	mapping->active = true;
 
 	return 0;
 }
 
-void panfrost_mmu_unmap(struct panfrost_gem_object *bo)
+void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 {
+	struct panfrost_gem_object *bo = mapping->obj;
 	struct drm_gem_object *obj = &bo->base.base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
-	struct io_pgtable_ops *ops = bo->mmu->pgtbl_ops;
-	u64 iova = bo->node.start << PAGE_SHIFT;
-	size_t len = bo->node.size << PAGE_SHIFT;
+	struct io_pgtable_ops *ops = mapping->mmu->pgtbl_ops;
+	u64 iova = mapping->mmnode.start << PAGE_SHIFT;
+	size_t len = mapping->mmnode.size << PAGE_SHIFT;
 	size_t unmapped_len = 0;
 
-	if (WARN_ON(!bo->is_mapped))
+	if (WARN_ON(!mapping->active))
 		return;
 
-	dev_dbg(pfdev->dev, "unmap: as=%d, iova=%llx, len=%zx", bo->mmu->as, iova, len);
+	dev_dbg(pfdev->dev, "unmap: as=%d, iova=%llx, len=%zx",
+		mapping->mmu->as, iova, len);
 
 	while (unmapped_len < len) {
 		size_t unmapped_page;
@@ -318,8 +322,9 @@ void panfrost_mmu_unmap(struct panfrost_gem_object *bo)
 		unmapped_len += pgsize;
 	}
 
-	panfrost_mmu_flush_range(pfdev, bo->mmu, bo->node.start << PAGE_SHIFT, len);
-	bo->is_mapped = false;
+	panfrost_mmu_flush_range(pfdev, mapping->mmu,
+				 mapping->mmnode.start << PAGE_SHIFT, len);
+	mapping->active = false;
 }
 
 static void mmu_tlb_inv_context_s1(void *cookie)
@@ -394,10 +399,10 @@ void panfrost_mmu_pgtable_free(struct panfrost_file_priv *priv)
 	free_io_pgtable_ops(mmu->pgtbl_ops);
 }
 
-static struct panfrost_gem_object *
-addr_to_drm_mm_node(struct panfrost_device *pfdev, int as, u64 addr)
+static struct panfrost_gem_mapping *
+addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 {
-	struct panfrost_gem_object *bo = NULL;
+	struct panfrost_gem_mapping *mapping = NULL;
 	struct panfrost_file_priv *priv;
 	struct drm_mm_node *node;
 	u64 offset = addr >> PAGE_SHIFT;
@@ -418,8 +423,9 @@ addr_to_drm_mm_node(struct panfrost_device *pfdev, int as, u64 addr)
 	drm_mm_for_each_node(node, &priv->mm) {
 		if (offset >= node->start &&
 		    offset < (node->start + node->size)) {
-			bo = drm_mm_node_to_panfrost_bo(node);
-			drm_gem_object_get(&bo->base.base);
+			mapping = drm_mm_node_to_panfrost_mapping(node);
+
+			kref_get(&mapping->refcount);
 			break;
 		}
 	}
@@ -427,7 +433,7 @@ addr_to_drm_mm_node(struct panfrost_device *pfdev, int as, u64 addr)
 	spin_unlock(&priv->mm_lock);
 out:
 	spin_unlock(&pfdev->as_lock);
-	return bo;
+	return mapping;
 }
 
 #define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
@@ -436,28 +442,30 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 				       u64 addr)
 {
 	int ret, i;
+	struct panfrost_gem_mapping *bomapping;
 	struct panfrost_gem_object *bo;
 	struct address_space *mapping;
 	pgoff_t page_offset;
 	struct sg_table *sgt;
 	struct page **pages;
 
-	bo = addr_to_drm_mm_node(pfdev, as, addr);
-	if (!bo)
+	bomapping = addr_to_mapping(pfdev, as, addr);
+	if (!bomapping)
 		return -ENOENT;
 
+	bo = bomapping->obj;
 	if (!bo->is_heap) {
 		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
-			 bo->node.start << PAGE_SHIFT);
+			 bomapping->mmnode.start << PAGE_SHIFT);
 		ret = -EINVAL;
 		goto err_bo;
 	}
-	WARN_ON(bo->mmu->as != as);
+	WARN_ON(bomapping->mmu->as != as);
 
 	/* Assume 2MB alignment and size multiple */
 	addr &= ~((u64)SZ_2M - 1);
 	page_offset = addr >> PAGE_SHIFT;
-	page_offset -= bo->node.start;
+	page_offset -= bomapping->mmnode.start;
 
 	mutex_lock(&bo->base.pages_lock);
 
@@ -509,13 +517,14 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		goto err_map;
 	}
 
-	mmu_map_sg(pfdev, bo->mmu, addr, IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
+	mmu_map_sg(pfdev, bomapping->mmu, addr,
+		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
 
-	bo->is_mapped = true;
+	bomapping->active = true;
 
 	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
 
-	drm_gem_object_put_unlocked(&bo->base.base);
+	panfrost_gem_mapping_put(bomapping);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index 7c5b6775ae23..44fc2edf63ce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -4,12 +4,12 @@
 #ifndef __PANFROST_MMU_H__
 #define __PANFROST_MMU_H__
 
-struct panfrost_gem_object;
+struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
 
-int panfrost_mmu_map(struct panfrost_gem_object *bo);
-void panfrost_mmu_unmap(struct panfrost_gem_object *bo);
+int panfrost_mmu_map(struct panfrost_gem_mapping *mapping);
+void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping);
 
 int panfrost_mmu_init(struct panfrost_device *pfdev);
 void panfrost_mmu_fini(struct panfrost_device *pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 2c04e858c50a..684820448be3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -25,7 +25,7 @@
 #define V4_SHADERS_PER_COREGROUP	4
 
 struct panfrost_perfcnt {
-	struct panfrost_gem_object *bo;
+	struct panfrost_gem_mapping *mapping;
 	size_t bosize;
 	void *buf;
 	struct panfrost_file_priv *user;
@@ -49,7 +49,7 @@ static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)
 	int ret;
 
 	reinit_completion(&pfdev->perfcnt->dump_comp);
-	gpuva = pfdev->perfcnt->bo->node.start << PAGE_SHIFT;
+	gpuva = pfdev->perfcnt->mapping->mmnode.start << PAGE_SHIFT;
 	gpu_write(pfdev, GPU_PERFCNT_BASE_LO, gpuva);
 	gpu_write(pfdev, GPU_PERFCNT_BASE_HI, gpuva >> 32);
 	gpu_write(pfdev, GPU_INT_CLEAR,
@@ -89,17 +89,22 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	perfcnt->bo = to_panfrost_bo(&bo->base);
-
 	/* Map the perfcnt buf in the address space attached to file_priv. */
-	ret = panfrost_gem_open(&perfcnt->bo->base.base, file_priv);
+	ret = panfrost_gem_open(&bo->base, file_priv);
 	if (ret)
 		goto err_put_bo;
 
+	perfcnt->mapping = panfrost_gem_mapping_get(to_panfrost_bo(&bo->base),
+						    user);
+	if (!perfcnt->mapping) {
+		ret = -EINVAL;
+		goto err_close_bo;
+	}
+
 	perfcnt->buf = drm_gem_shmem_vmap(&bo->base);
 	if (IS_ERR(perfcnt->buf)) {
 		ret = PTR_ERR(perfcnt->buf);
-		goto err_close_bo;
+		goto err_put_mapping;
 	}
 
 	/*
@@ -154,12 +159,17 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	if (panfrost_has_hw_issue(pfdev, HW_ISSUE_8186))
 		gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0xffffffff);
 
+	/* The BO ref is retained by the mapping. */
+	drm_gem_object_put_unlocked(&bo->base);
+
 	return 0;
 
 err_vunmap:
-	drm_gem_shmem_vunmap(&perfcnt->bo->base.base, perfcnt->buf);
+	drm_gem_shmem_vunmap(&bo->base, perfcnt->buf);
+err_put_mapping:
+	panfrost_gem_mapping_put(perfcnt->mapping);
 err_close_bo:
-	panfrost_gem_close(&perfcnt->bo->base.base, file_priv);
+	panfrost_gem_close(&bo->base, file_priv);
 err_put_bo:
 	drm_gem_object_put_unlocked(&bo->base);
 	return ret;
@@ -182,11 +192,11 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
 
 	perfcnt->user = NULL;
-	drm_gem_shmem_vunmap(&perfcnt->bo->base.base, perfcnt->buf);
+	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, perfcnt->buf);
 	perfcnt->buf = NULL;
-	panfrost_gem_close(&perfcnt->bo->base.base, file_priv);
-	drm_gem_object_put_unlocked(&perfcnt->bo->base.base);
-	perfcnt->bo = NULL;
+	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
+	panfrost_gem_mapping_put(perfcnt->mapping);
+	perfcnt->mapping = NULL;
 	pm_runtime_mark_last_busy(pfdev->dev);
 	pm_runtime_put_autosuspend(pfdev->dev);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
