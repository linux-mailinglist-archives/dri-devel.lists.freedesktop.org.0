Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B1AA7224
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5E910E939;
	Fri,  2 May 2025 12:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HDITIkNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054AE10E92D;
 Fri,  2 May 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E2ZQQxD7iGG2Z6u9HRRPjRmI+ot+CQeoIbdNcqHk5Ac=; b=HDITIkNusOoKwqQSYN9pgfNqx9
 TKfTcQBcsWTrMEqN3km1ct5EKxGWFUbqWeCr/2GsoJ2JOQ112fXNSBTCSqrI9dY5wYKQVzBPgsgwf
 0SiDUeC2pYZW3h6/JhlQEWRchrLvekZxk8fXJnOVoflFNHQnpE607EsegS8HOSuHgTbIQMweKioAh
 VvFfiaTrSOF/OLoYwzX/i400KA4SmGj3KUfJz2v+FBPqV++5C0UKbPwzXzGJpSLzq/xpluSP+xGns
 Fb1RZ4GfIFrrbDLGVwbrDh4nMz+x8li9YP9KCmH7bd2jKKCYoX0VsTVP65Oes9KvRmOkSJbfkhLY1
 Ln69f37w==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uApZ1-0025Io-OW; Fri, 02 May 2025 14:34:14 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 21/23] drm/sched: Add helper for tracking entities per client
Date: Fri,  2 May 2025 13:32:54 +0100
Message-ID: <20250502123256.50540-22-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To enable adding DRM cgroup support to the DRM scheduler we need a way for
updating the relative scheduling weights per entity at the point the
controller invokes a call-back notifying the driver of a new relative
scheduling weight for a client.

We add two helpers which will allow drivers to opt-in into the tracking
and they are responsible to call them at the correct times respective to
the entity lifetime.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_file.c               |  3 ++
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++
 include/drm/drm_file.h                   |  5 ++++
 include/drm/gpu_scheduler.h              | 38 ++++++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7500b2b14fd5..9d6ec64e58ad 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -46,6 +46,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -160,6 +161,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	mutex_init(&file->event_read_lock);
 	mutex_init(&file->client_name_lock);
 
+	drm_sched_cgroup_init_drm_file(file);
+
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_open(dev, file);
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bc890f735552..8729d3068449 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/completion.h>
 
+#include <drm/drm_file.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 
@@ -121,6 +122,10 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	atomic_set(&entity->fence_seq, 0);
 	entity->fence_context = dma_fence_context_alloc(2);
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	INIT_LIST_HEAD(&entity->drm_file_link);
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_sched_entity_init);
@@ -603,3 +608,23 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
+
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+void drm_sched_cgroup_track_sched_entity(struct drm_file *file_priv,
+					 struct drm_sched_entity *entity)
+{
+	spin_lock(&file_priv->sched_entities.lock);
+	list_add_tail(&entity->drm_file_link, &file_priv->sched_entities.list);
+	spin_unlock(&file_priv->sched_entities.lock);
+}
+EXPORT_SYMBOL(drm_sched_cgroup_track_sched_entity);
+
+void drm_sched_cgroup_untrack_sched_entity(struct drm_file *file_priv,
+					   struct drm_sched_entity *entity)
+{
+	spin_lock(&file_priv->sched_entities.lock);
+	list_del(&entity->drm_file_link);
+	spin_unlock(&file_priv->sched_entities.lock);
+}
+EXPORT_SYMBOL(drm_sched_cgroup_untrack_sched_entity);
+#endif
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 76b194c0fc52..cb6775af337b 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -299,6 +299,11 @@ struct drm_file {
 #if IS_ENABLED(CONFIG_CGROUP_DRM)
 	struct cgroup_subsys_state *__css;
 	struct list_head clink;
+
+	struct {
+		spinlock_t		lock;
+		struct list_head	list;
+	} sched_entities;
 #endif
 
 	/**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fd488ccece9a..efd00059a814 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -237,6 +237,9 @@ struct drm_sched_entity {
 	 */
 	struct rb_node			rb_tree_node;
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	struct list_head	drm_file_link;
+#endif
 };
 
 /**
@@ -665,4 +668,39 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+#include <linux/list.h>
+#include <linux/spinlock.h>
+
+#include <drm/drm_file.h>
+
+/* Static inline to allow drm.ko and gpu-sched.ko as modules. */
+static inline void drm_sched_cgroup_init_drm_file(struct drm_file *file_priv)
+{
+	spin_lock_init(&file_priv->sched_entities.lock);
+	INIT_LIST_HEAD(&file_priv->sched_entities.list);
+}
+
+void drm_sched_cgroup_track_sched_entity(struct drm_file *file_priv,
+				  struct drm_sched_entity *entity);
+void drm_sched_cgroup_untrack_sched_entity(struct drm_file *file_priv,
+				    struct drm_sched_entity *entity);
+#else
+static inline void drm_sched_cgroup_init_drm_file(struct drm_file *file_priv)
+{
+}
+
+static inline void
+drm_sched_cgroup_track_sched_entity(struct drm_file *file_priv,
+				    struct drm_sched_entity *entity)
+{
+}
+
+static inline void
+drm_sched_cgroup_untrack_sched_entity(struct drm_file *file_priv,
+				      struct drm_sched_entity *entity)
+{
+}
+#endif
+
 #endif
-- 
2.48.0

