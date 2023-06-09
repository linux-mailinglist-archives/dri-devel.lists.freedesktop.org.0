Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C372993A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D9410E6A9;
	Fri,  9 Jun 2023 12:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA110E6A7;
 Fri,  9 Jun 2023 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312715; x=1717848715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4pCJCqaYKvPWaPUSKBkgJuqDWhvzWnRq4tE+feAalk=;
 b=MZ41+F38H/WUci/lO0iS0SF614l8bYrHh2jvKjUHht4lvqLXiVhRPGzV
 If9w4YI9hVGNeckdUhhXf4N08ftuzzTRINBPiooUiFmssKpd/r6/wAOBT
 +/JiOBl+OhX9KXFuAsJ/kwlciHjAo3sWo56FQij/V7X2KYsS7teA/lXHS
 lzBYoXvU3WwBh0vHEHNZ9N3sRAHC8O+BB4ZL3JiUQeKkGgcDc4V710SfD
 JtGOL3prBMcScPA6vltlCFX8scH+MT9RZlsBq5JZrYXnbigrTLHSITynH
 gjdN4aRSbh9W09DlrE8IbITUnRUsefnEsyQr/8njGKI228ayVgPIMNHvB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356474748"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356474748"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740150848"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="740150848"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.241])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:53 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915: Track buffer objects belonging to clients
Date: Fri,  9 Jun 2023 13:11:37 +0100
Message-Id: <20230609121143.1232420-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In order to show per client memory usage lets start tracking which
objects belong to which clients.

We start with objects explicitly created by object creation UAPI and
track it on a new per client lists, protected by a new per client lock.
In order for delayed destruction (post client exit), we make tracked
objects hold references to the owning client.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 32 +++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 ++++++
 drivers/gpu/drm/i915/i915_drm_client.c        | 39 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h        | 36 ++++++++++++++++-
 drivers/gpu/drm/i915/i915_gem.c               |  2 +-
 6 files changed, 121 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index d24c0ce8805c..4f1957638207 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -11,6 +11,7 @@
 #include "gem/i915_gem_region.h"
 #include "pxp/intel_pxp.h"
 
+#include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_gem_create.h"
 #include "i915_trace.h"
@@ -164,6 +165,14 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
 						 n_placements, 0);
 }
 
+static void add_file_obj(struct drm_file *file,
+			 struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_file_private *fpriv = file->driver_priv;
+
+	i915_drm_client_add_object(fpriv->client, obj);
+}
+
 int
 i915_gem_dumb_create(struct drm_file *file,
 		     struct drm_device *dev,
@@ -174,6 +183,7 @@ i915_gem_dumb_create(struct drm_file *file,
 	enum intel_memory_type mem_type;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	u32 format;
+	int ret;
 
 	switch (cpp) {
 	case 1:
@@ -212,7 +222,12 @@ i915_gem_dumb_create(struct drm_file *file,
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	return i915_gem_publish(obj, file, &args->size, &args->handle);
+	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
+
+	if (!ret)
+		add_file_obj(file, obj);
+
+	return ret;
 }
 
 /**
@@ -229,6 +244,7 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_create *args = data;
 	struct drm_i915_gem_object *obj;
 	struct intel_memory_region *mr;
+	int ret;
 
 	mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
 
@@ -236,7 +252,12 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	return i915_gem_publish(obj, file, &args->size, &args->handle);
+	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
+
+	if (!ret)
+		add_file_obj(file, obj);
+
+	return ret;
 }
 
 struct create_ext {
@@ -494,5 +515,10 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 		obj->pat_set_by_user = true;
 	}
 
-	return i915_gem_publish(obj, file, &args->size, &args->handle);
+	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
+
+	if (!ret)
+		add_file_obj(file, obj);
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 97ac6fb37958..46de9b1b3f1d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -105,6 +105,10 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&obj->mm.link);
 
+#ifdef CONFIG_PROC_FS
+	INIT_LIST_HEAD(&obj->client_link);
+#endif
+
 	INIT_LIST_HEAD(&obj->lut_list);
 	spin_lock_init(&obj->lut_lock);
 
@@ -441,6 +445,8 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 
 	GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
 
+	i915_drm_client_remove_object(obj);
+
 	/*
 	 * Before we free the object, make sure any pure RCU-only
 	 * read-side critical sections are complete, e.g.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index e72c57716bee..8de2b91b3edf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -300,6 +300,18 @@ struct drm_i915_gem_object {
 	 */
 	struct i915_address_space *shares_resv_from;
 
+#ifdef CONFIG_PROC_FS
+	/**
+	 * @client: @i915_drm_client which created the object
+	 */
+	struct i915_drm_client *client;
+
+	/**
+	 * @client_link: Link into @i915_drm_client.objects_list
+	 */
+	struct list_head client_link;
+#endif
+
 	union {
 		struct rcu_head rcu;
 		struct llist_node freed;
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 2a44b3876cb5..b0b35bcdd2b3 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -17,7 +17,8 @@
 #include "i915_gem.h"
 #include "i915_utils.h"
 
-struct i915_drm_client *i915_drm_client_alloc(void)
+struct i915_drm_client *
+i915_drm_client_alloc(struct drm_i915_file_private *fpriv)
 {
 	struct i915_drm_client *client;
 
@@ -28,6 +29,12 @@ struct i915_drm_client *i915_drm_client_alloc(void)
 	kref_init(&client->kref);
 	spin_lock_init(&client->ctx_lock);
 	INIT_LIST_HEAD(&client->ctx_list);
+#ifdef CONFIG_PROC_FS
+	spin_lock_init(&client->objects_lock);
+	INIT_LIST_HEAD(&client->objects_list);
+
+	client->fpriv = fpriv;
+#endif
 
 	return client;
 }
@@ -108,4 +115,34 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
 		show_client_class(p, i915, file_priv->client, i);
 }
+
+void i915_drm_client_add_object(struct i915_drm_client *client,
+				struct drm_i915_gem_object *obj)
+{
+	unsigned long flags;
+
+	GEM_WARN_ON(obj->client);
+	GEM_WARN_ON(!list_empty(&obj->client_link));
+
+	spin_lock_irqsave(&client->objects_lock, flags);
+	obj->client = i915_drm_client_get(client);
+	list_add_tail(&obj->client_link, &client->objects_list);
+	spin_unlock_irqrestore(&client->objects_lock, flags);
+}
+
+void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+{
+	struct i915_drm_client *client = fetch_and_zero(&obj->client);
+	unsigned long flags;
+
+	/* Object may not be associated with a client. */
+	if (!client || list_empty(&obj->client_link))
+		return;
+
+	spin_lock_irqsave(&client->objects_lock, flags);
+	list_del(&obj->client_link);
+	spin_unlock_irqrestore(&client->objects_lock, flags);
+
+	i915_drm_client_put(client);
+}
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 4c18b99e10a4..dfeaaf204c00 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -12,6 +12,9 @@
 
 #include <uapi/drm/i915_drm.h>
 
+#include "i915_file_private.h"
+#include "gem/i915_gem_object_types.h"
+
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
 struct drm_file;
@@ -25,6 +28,22 @@ struct i915_drm_client {
 	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
 	struct list_head ctx_list; /* List of contexts belonging to client. */
 
+#ifdef CONFIG_PROC_FS
+	struct drm_i915_file_private *fpriv;
+
+	/**
+	 * @objects_lock: lock protecting @objects_list
+	 */
+	spinlock_t objects_lock;
+
+	/**
+	 * @objects_list: list of objects created by this client
+	 *
+	 * Protected by @objects_lock.
+	 */
+	struct list_head objects_list;
+#endif
+
 	/**
 	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
 	 */
@@ -45,10 +64,25 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
 	kref_put(&client->kref, __i915_drm_client_free);
 }
 
-struct i915_drm_client *i915_drm_client_alloc(void);
+struct i915_drm_client *i915_drm_client_alloc(struct drm_i915_file_private *fpriv);
 
 #ifdef CONFIG_PROC_FS
 void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+
+void i915_drm_client_add_object(struct i915_drm_client *client,
+				struct drm_i915_gem_object *obj);
+void i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
+#else
+static inline void i915_drm_client_add_object(struct i915_drm_client *client,
+					      struct drm_i915_gem_object *obj)
+{
+
+}
+
+static inline void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+{
+
+}
 #endif
 
 #endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 1f65bb33dd21..7ae42f746cc2 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1325,7 +1325,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
 	if (!file_priv)
 		goto err_alloc;
 
-	client = i915_drm_client_alloc();
+	client = i915_drm_client_alloc(file_priv);
 	if (!client)
 		goto err_client;
 
-- 
2.39.2

