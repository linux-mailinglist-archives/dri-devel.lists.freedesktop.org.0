Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE372BFC9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1F310E1FA;
	Mon, 12 Jun 2023 10:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E21610E1F7;
 Mon, 12 Jun 2023 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686566829; x=1718102829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ELLOifTz+MEi4/R/5Xvp2vBiIpuLupHahGrlLCgCbY=;
 b=dK19mgn41jY+9ClC5nbvHlLshiqEJZYqVy58Rjum3tFJ+lkf1NVrVKLa
 rx3hDTdBWZwhsH/UtPZqKFFphGFFxaaZSOnO87+1RC2jSwY5cPXDks+VT
 00kO2Kd7gHaUhTsTFRhslYIyz+lbBNxbceemO0XR0FJXzOfSSnyWGeF1j
 +eCamhIy1MFGApD4t0xlru96BNsXx6pLv5en1JL0PkJ7njR1ANbyOMsrf
 a6o6TkYIt6rLwsMFwxuVKmHQuMSqrpV1t2RGYNAX4DZCevy2vrrq36aEt
 RRoojM1fzePpovk+3lmz50p6wf/AmBr6vjWUrEmMs8OPqKJwRBipU4Ghy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="342693234"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342693234"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="835439470"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="835439470"
Received: from mcantwex-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.224.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:47:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915: Add ability for tracking buffer objects per
 client
Date: Mon, 12 Jun 2023 11:46:54 +0100
Message-Id: <20230612104658.1386996-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612104658.1386996-1-tvrtko.ursulin@linux.intel.com>
References: <20230612104658.1386996-1-tvrtko.ursulin@linux.intel.com>
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

In order to show per client memory usage lets add some infrastructure
which enables tracking buffer objects owned by clients.

We add a per client list protected by a new per client lock and to support
delayed destruction (post client exit) we make tracked objects hold
references to the owning client.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  5 +++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 +++++++
 drivers/gpu/drm/i915/i915_drm_client.c        | 36 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h        | 34 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_gem.c               |  2 +-
 5 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 97ac6fb37958..d6961f6818f1 100644
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
 
@@ -410,6 +414,7 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 		}
 
 		__i915_gem_object_pages_fini(obj);
+		i915_drm_client_remove_object(obj);
 		__i915_gem_free_object(obj);
 
 		/* But keep the pointer alive for RCU-protected lookups */
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
index 2a44b3876cb5..3c8d6a46a801 100644
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
@@ -108,4 +115,31 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
 		show_client_class(p, i915, file_priv->client, i);
 }
+
+void i915_drm_client_add_object(struct i915_drm_client *client,
+				struct drm_i915_gem_object *obj)
+{
+	GEM_WARN_ON(obj->client);
+	GEM_WARN_ON(!list_empty(&obj->client_link));
+
+	spin_lock(&client->objects_lock);
+	obj->client = i915_drm_client_get(client);
+	list_add_tail(&obj->client_link, &client->objects_list);
+	spin_unlock(&client->objects_lock);
+}
+
+void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+{
+	struct i915_drm_client *client = fetch_and_zero(&obj->client);
+
+	/* Object may not be associated with a client. */
+	if (!client || list_empty(&obj->client_link))
+		return;
+
+	spin_lock(&client->objects_lock);
+	list_del(&obj->client_link);
+	spin_unlock(&client->objects_lock);
+
+	i915_drm_client_put(client);
+}
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 4c18b99e10a4..5fc897ab1a6b 100644
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
@@ -45,10 +64,23 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
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
+}
+
+static inline void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+{
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

