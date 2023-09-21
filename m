Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBF7A93F1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1210E5D5;
	Thu, 21 Sep 2023 11:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00C910E5BF;
 Thu, 21 Sep 2023 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296938; x=1726832938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yikGkSN8s1V0c9Zm3g1sA2aggisnLgdn8txT5CGITFc=;
 b=TiuZijl+6CUcxHJ8sA2a2Zhh7u+nZLsg4ECzT+FaMJWZu1WT6yls680Y
 /XWzR4jPyc8r50NO/es3La0UlEwIp3paM613XN+U/QdBjpRQAwha9sSCM
 0J0BqSJs2kNz82/61apz1FutVr5F2+ULr+mj+Cop6ZVC3Wx+BHQ8JdMYa
 R9aToDQJgkoJgz7I6iwWI4gSiIJ50GTB0d6fcOIFbcGYeUCHI2FZR0Qkq
 uNljvG44dfkbaXMJ9z6FDWX7paxNW3r3aB1xv45X8rS0rtijCECyMoAm1
 BRRtI/SsmqMgfjzVa2uplf9+Pl18aV4m42D1B9IMBh/yiLvqCWAQzTzn6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384336787"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="384336787"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920700880"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="920700880"
Received: from asilke-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:48:56 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915: Add ability for tracking buffer objects per
 client
Date: Thu, 21 Sep 2023 12:48:48 +0100
Message-Id: <20230921114852.192862-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
References: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In order to show per client memory usage lets add some infrastructure
which enables tracking buffer objects owned by clients.

We add a per client list protected by a new per client lock and to support
delayed destruction (post client exit) we make tracked objects hold
references to the owning client.

Also, object memory region teardown is moved to the existing RCU free
callback to allow safe dereference from the fdinfo RCU read section.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 13 +++++--
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 +++++++
 drivers/gpu/drm/i915/i915_drm_client.c        | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        | 32 +++++++++++++++++
 4 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c26d87555825..25eeeb863209 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -106,6 +106,10 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&obj->mm.link);
 
+#ifdef CONFIG_PROC_FS
+	INIT_LIST_HEAD(&obj->client_link);
+#endif
+
 	INIT_LIST_HEAD(&obj->lut_list);
 	spin_lock_init(&obj->lut_lock);
 
@@ -293,6 +297,10 @@ void __i915_gem_free_object_rcu(struct rcu_head *head)
 		container_of(head, typeof(*obj), rcu);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
+	/* We need to keep this alive for RCU read access from fdinfo. */
+	if (obj->mm.n_placements > 1)
+		kfree(obj->mm.placements);
+
 	i915_gem_object_free(obj);
 
 	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
@@ -389,9 +397,6 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
 	if (obj->ops->release)
 		obj->ops->release(obj);
 
-	if (obj->mm.n_placements > 1)
-		kfree(obj->mm.placements);
-
 	if (obj->shares_resv_from)
 		i915_vm_resv_put(obj->shares_resv_from);
 
@@ -442,6 +447,8 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 
 	GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
 
+	i915_drm_client_remove_object(obj);
+
 	/*
 	 * Before we free the object, make sure any pure RCU-only
 	 * read-side critical sections are complete, e.g.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 2292404007c8..0c5cdab278b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -302,6 +302,18 @@ struct drm_i915_gem_object {
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
index 2a44b3876cb5..2e5e69edc0f9 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -28,6 +28,10 @@ struct i915_drm_client *i915_drm_client_alloc(void)
 	kref_init(&client->kref);
 	spin_lock_init(&client->ctx_lock);
 	INIT_LIST_HEAD(&client->ctx_list);
+#ifdef CONFIG_PROC_FS
+	spin_lock_init(&client->objects_lock);
+	INIT_LIST_HEAD(&client->objects_list);
+#endif
 
 	return client;
 }
@@ -108,4 +112,36 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
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
+	list_add_tail_rcu(&obj->client_link, &client->objects_list);
+	spin_unlock_irqrestore(&client->objects_lock, flags);
+}
+
+bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+{
+	struct i915_drm_client *client = fetch_and_zero(&obj->client);
+	unsigned long flags;
+
+	/* Object may not be associated with a client. */
+	if (!client)
+		return false;
+
+	spin_lock_irqsave(&client->objects_lock, flags);
+	list_del_rcu(&obj->client_link);
+	spin_unlock_irqrestore(&client->objects_lock, flags);
+
+	i915_drm_client_put(client);
+
+	return true;
+}
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 67816c912bca..5f58fdf7dcb8 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -12,6 +12,9 @@
 
 #include <uapi/drm/i915_drm.h>
 
+#include "i915_file_private.h"
+#include "gem/i915_gem_object_types.h"
+
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
 struct drm_file;
@@ -25,6 +28,20 @@ struct i915_drm_client {
 	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
 	struct list_head ctx_list; /* List of contexts belonging to client. */
 
+#ifdef CONFIG_PROC_FS
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
@@ -49,4 +66,19 @@ struct i915_drm_client *i915_drm_client_alloc(void);
 
 void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 
+#ifdef CONFIG_PROC_FS
+void i915_drm_client_add_object(struct i915_drm_client *client,
+				struct drm_i915_gem_object *obj);
+bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
+#else
+static inline void i915_drm_client_add_object(struct i915_drm_client *client,
+					      struct drm_i915_gem_object *obj)
+{
+}
+
+static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+{
+}
+#endif
+
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.39.2

