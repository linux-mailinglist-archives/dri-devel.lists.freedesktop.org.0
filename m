Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00474AC5B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0673B10E524;
	Fri,  7 Jul 2023 07:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01D10E524;
 Fri,  7 Jul 2023 07:57:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A0326606FC2;
 Fri,  7 Jul 2023 08:57:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688716677;
 bh=wpCN2MraqfrjwJNiynUV8KannPzTI4X03gyxmC+JkbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bln0ofoSbwYZi76ZLY/bi4m1Bkkzy6uV7ZhtDIUIdW2k9uufm+y6h1EL3aR4tIAnP
 b6GiA+LpLHHcig2xie60TXlwPFdAVbTOujWjaLdpgqcDhpmksI9aAGLjWAFXnG64i6
 ZrQwM8aDpMKX8/pBfcQ4gYKzUcJcs5D/hRls41mnOIPqygGF/gkS6Z0pizbTQYIFhu
 2Ay3jTeJP1UIfJFJWs/Ue8rfV8sC3U1ZA8/PrqWvuJMqzRdmqajtb5emwIbxJVpxhb
 lyivE4xprOkWk3r7sUAvd60nManAiGZTRGPnuD8KFP38A0YdIKVh3+7/UBYbASRRDe
 zI+gYJRGHcaUQ==
Date: Fri, 7 Jul 2023 09:57:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230707095754.5d365f8e@collabora.com>
In-Reply-To: <20230706202642.4cbc7227@collabora.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230706202642.4cbc7227@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Jul 2023 20:26:42 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 30 Jun 2023 00:25:18 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > +#ifdef CONFIG_LOCKDEP
> > +typedef struct lockdep_map *lockdep_map_p;
> > +#define drm_gpuva_manager_ext_assert_held(mgr)		\
> > +	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
> > +/**
> > + * drm_gpuva_manager_set_ext_lock - set the external lock according to
> > + * @DRM_GPUVA_MANAGER_LOCK_EXTERN
> > + * @mgr: the &drm_gpuva_manager to set the lock for
> > + * @lock: the lock to set
> > + *
> > + * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
> > + * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
> > + * &drm_gem_objects GPUVA list.
> > + */
> > +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
> > +	(mgr)->ext_lock = &(lock)->dep_map  
> 
> Okay, so, IIUC, this is the lock protecting the GEM's active mappings
> list, meaning the lock is likely to be attached to the GEM object. Are
> we expected to call drm_gpuva_manager_set_ext_lock() every time we call
> drm_gpuva_[un]link(), or are we supposed to have some lock at the
> device level serializing all drm_gpuva_[un]link() calls across VMs? The
> later doesn't sound like a good option to me, and the former feels a bit
> weird. I'm wondering if we shouldn't just drop this assert_held() check
> when DRM_GPUVA_MANAGER_LOCK_EXTERN is set. Alternatively, we could say
> that any driver wanting to use a custom lock (which is basically all
> drivers modifying the VA space asynchronously in the ::run_job() path)
> has to provide its own variant of drm_gpuva_[un]link() (maybe with its
> own VA list too), which doesn't sound like a good idea either.

Or we could just attach the dep_map to drm_gem_object::gpuva::lock, and
let drivers overload the default lock in their GEM creation function if
they want to use a custom lock (see the following diff).

---

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index e47747f22126..6427c88c22ba 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -675,8 +675,7 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
 		       const char *name,
 		       u64 start_offset, u64 range,
 		       u64 reserve_offset, u64 reserve_range,
-		       const struct drm_gpuva_fn_ops *ops,
-		       enum drm_gpuva_manager_flags flags)
+		       const struct drm_gpuva_fn_ops *ops)
 {
 	mgr->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&mgr->rb.list);
@@ -686,7 +685,6 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
 	mgr->mm_range = range;
 
 	mgr->name = name ? name : "unknown";
-	mgr->flags = flags;
 	mgr->ops = ops;
 
 	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
@@ -822,16 +820,12 @@ EXPORT_SYMBOL(drm_gpuva_remove);
 void
 drm_gpuva_link(struct drm_gpuva *va)
 {
-	struct drm_gpuva_manager *mgr = va->mgr;
 	struct drm_gem_object *obj = va->gem.obj;
 
 	if (unlikely(!obj))
 		return;
 
-	if (drm_gpuva_manager_external_lock(mgr))
-		drm_gpuva_manager_ext_assert_held(mgr);
-	else
-		dma_resv_assert_held(obj->resv);
+	drm_gem_gpuva_assert_lock_held(obj);
 
 	list_add_tail(&va->gem.entry, &obj->gpuva.list);
 }
@@ -850,16 +844,12 @@ EXPORT_SYMBOL(drm_gpuva_link);
 void
 drm_gpuva_unlink(struct drm_gpuva *va)
 {
-	struct drm_gpuva_manager *mgr = va->mgr;
 	struct drm_gem_object *obj = va->gem.obj;
 
 	if (unlikely(!obj))
 		return;
 
-	if (drm_gpuva_manager_external_lock(mgr))
-		drm_gpuva_manager_ext_assert_held(mgr);
-	else
-		dma_resv_assert_held(obj->resv);
+	drm_gem_gpuva_assert_lock_held(obj);
 
 	list_del_init(&va->gem.entry);
 }
@@ -1680,10 +1670,7 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
 	struct drm_gpuva *va;
 	int ret;
 
-	if (drm_gpuva_manager_external_lock(mgr))
-		drm_gpuva_manager_ext_assert_held(mgr);
-	else
-		dma_resv_assert_held(obj->resv);
+	drm_gem_gpuva_assert_lock_held(obj);
 
 	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
 	if (!ops)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5ec8148a30ee..572d7a538324 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -387,10 +387,14 @@ struct drm_gem_object {
 	 * Provides the list of GPU VAs attached to this GEM object.
 	 *
 	 * Drivers should lock list accesses with the GEMs &dma_resv lock
-	 * (&drm_gem_object.resv).
+	 * (&drm_gem_object.resv) or a custom lock if one is provided.
 	 */
 	struct {
 		struct list_head list;
+
+#ifdef CONFIG_LOCKDEP
+		struct lockdep_map *lock_dep_map;
+#endif
 	} gpuva;
 
 	/**
@@ -540,6 +544,26 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
+#ifdef CONFIG_LOCKDEP
+/*
+ * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
+ * @obj: the &drm_gem_object
+ * @lock: the lock used to protect the gpuva list. The locking primitive
+ * must contain a dep_map field.
+ *
+ * Call this if you're not proctecting access to the gpuva list
+ * with the resv lock, otherwise, drm_gem_gpuva_init() takes case
+ * of initializing the lock_dep_map for you.
+ */
+#define drm_gem_gpuva_set_lock(obj, lock) \
+	obj->gpuva.lock_dep_map = &(lock)->dep_map
+#define drm_gem_gpuva_assert_lock_held(obj) \
+	lockdep_assert(lock_is_held(obj->gpuva.lock_dep_map))
+#else
+#define drm_gem_gpuva_set_lock(obj, lock) do {} while(0)
+#define drm_gem_gpuva_assert_lock_held(obj) do {} while(0)
+#endif
+
 /**
  * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
  * @obj: the &drm_gem_object
@@ -552,6 +576,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
 static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 {
 	INIT_LIST_HEAD(&obj->gpuva.list);
+	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
 }
 
 /**
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index 4f23aaf726dd..4ad56b67e244 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -185,44 +185,6 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
-#ifdef CONFIG_LOCKDEP
-typedef struct lockdep_map *lockdep_map_p;
-#define drm_gpuva_manager_ext_assert_held(mgr)		\
-	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
-/**
- * drm_gpuva_manager_set_ext_lock - set the external lock according to
- * @DRM_GPUVA_MANAGER_LOCK_EXTERN
- * @mgr: the &drm_gpuva_manager to set the lock for
- * @lock: the lock to set
- *
- * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
- * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
- * &drm_gem_objects GPUVA list.
- */
-#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
-	(mgr)->ext_lock = &(lock)->dep_map
-#else
-typedef struct { /* nothing */ } lockdep_map_p;
-#define drm_gpuva_manager_ext_assert_held(mgr)		do { (void)(mgr); } while (0)
-#define drm_gpuva_manager_set_ext_lock(mgr, lock)	do { } while (0)
-#endif
-
-/**
- * enum drm_gpuva_manager_flags - the feature flags for the &drm_gpuva_manager
- */
-enum drm_gpuva_manager_flags {
-	/**
-	 * @DRM_GPUVA_MANAGER_LOCK_EXTERN:
-	 *
-	 * Indicates the driver has it's own external lock for linking and
-	 * unlinking &drm_gpuvas to the &drm_gem_objects GPUVA list.
-	 *
-	 * When setting this flag it is rquired to set a lock via
-	 * drm_gpuva_set_ext_lock().
-	 */
-	DRM_GPUVA_MANAGER_LOCK_EXTERN = (1 << 0),
-};
-
 /**
  * struct drm_gpuva_manager - DRM GPU VA Manager
  *
@@ -241,11 +203,6 @@ struct drm_gpuva_manager {
 	 */
 	const char *name;
 
-	/**
-	 * @flags: the feature flags of the &drm_gpuva_manager
-	 */
-	enum drm_gpuva_manager_flags flags;
-
 	/**
 	 * @mm_start: start of the VA space
 	 */
@@ -283,31 +240,15 @@ struct drm_gpuva_manager {
 	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
 	 */
 	const struct drm_gpuva_fn_ops *ops;
-
-	/**
-	 * @ext_lock: &lockdep_map according to @DRM_GPUVA_MANAGER_LOCK_EXTERN
-	 */
-	lockdep_map_p ext_lock;
 };
 
 void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
 			    const char *name,
 			    u64 start_offset, u64 range,
 			    u64 reserve_offset, u64 reserve_range,
-			    const struct drm_gpuva_fn_ops *ops,
-			    enum drm_gpuva_manager_flags flags);
+			    const struct drm_gpuva_fn_ops *ops);
 void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
 
-/**
- * drm_gpuva_manager_external_lock - indicates whether the
- * @DRM_GPUVA_MANAGER_LOCK_EXTERN flag is set
- * @mgr: the &drm_gpuva_manager to check the flag for
- */
-static inline bool drm_gpuva_manager_external_lock(struct drm_gpuva_manager *mgr)
-{
-	return mgr->flags & DRM_GPUVA_MANAGER_LOCK_EXTERN;
-}
-
 /**
  * drm_gpuva_for_each_va_range - iternator to walk over a range of &drm_gpuvas
  * @va__: &drm_gpuva structure to assign to in each iteration step
