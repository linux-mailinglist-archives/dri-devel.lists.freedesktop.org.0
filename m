Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC87B42532
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AEC10E905;
	Wed,  3 Sep 2025 15:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fVXvrGwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46E10E8FA;
 Wed,  3 Sep 2025 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R8wHnZN0XSQQ0muZ+YaQFqtsUeukHKUmzGjXNNub0bs=; b=fVXvrGwRAcb1e7LlhXEgGeYM+m
 HGHl8E8YjlAyzDKPBkOy8MXUYOKzmdkcod0ftiaxuZ1WMA59o4R3mwAW/A5ncGJku0X4Noa8TLMUr
 MNuVMruin4Szw41PWynE2XAxHWMpt648wl2HWUiCmXqOrdJeU7hp8eiU8AAgRtZtS312pzmNeYODx
 NbDolqXXUbVgy2B6wZwGHoyf8NajFm/9DosDeVkdXWhQvNPW5zVUal8OYEpUrSZitYqM1+1BKd1Ag
 D6nFC1CXWDcdg9x9tIdvN++iqwxV085Jrn2xUu/AfOMtEOleOVuG0qLJxVFzCKdnj54xvs3BjDiN0
 DAIBvM6A==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKq-006GbL-BY; Wed, 03 Sep 2025 17:23:44 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 18/21] drm/sched: Add helper for DRM cgroup controller weight
 notifications
Date: Wed,  3 Sep 2025 16:23:24 +0100
Message-ID: <20250903152327.66002-19-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
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

To enable drivers which use the scheduler to easily connect with the DRM
cgroup controller we a add a helper to be used for registering for
scheduling weight notifications.

The scheduler itself straightforwardly "connects" with the concept of
scheduling weights, courtesy of the vruntime based design, where we can
trivially scale the runtime to vruntime factor by the scheduling weight on
top of the existing priority scaling.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 16 ++++++++++++++++
 drivers/gpu/drm/scheduler/sched_internal.h |  1 +
 drivers/gpu/drm/scheduler/sched_rq.c       | 11 ++++++++---
 include/drm/gpu_scheduler.h                |  7 +++++++
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index e0c748c4c10f..d2c02c871e48 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -630,4 +630,20 @@ void drm_sched_cgroup_untrack_sched_entity(struct drm_file *file_priv,
 	spin_unlock(&file_priv->sched_entities.lock);
 }
 EXPORT_SYMBOL(drm_sched_cgroup_untrack_sched_entity);
+
+void drm_sched_cgroup_notify_weight(struct drm_file *file_priv,
+				    unsigned int weight)
+{
+	struct drm_sched_entity *entity;
+
+	spin_lock(&file_priv->sched_entities.lock);
+	list_for_each_entry(entity, &file_priv->sched_entities.list,
+			    drm_file_link) {
+		spin_lock(&entity->lock);
+		entity->cgroup_weight = weight;
+		spin_unlock(&entity->lock);
+	}
+	spin_unlock(&file_priv->sched_entities.lock);
+}
+EXPORT_SYMBOL(drm_sched_cgroup_notify_weight);
 #endif
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 409c9ab7ce8f..d19e692e6f5b 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -3,6 +3,7 @@
 #ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
+#include <linux/cgroup_drm.h>
 #include <linux/ktime.h>
 #include <linux/kref.h>
 #include <linux/spinlock.h>
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 6088434a4ea4..39ac20440058 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -183,14 +183,19 @@ static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
 	};
 	struct drm_sched_entity_stats *stats = entity->stats;
 	ktime_t runtime, prev;
+	u64 runtime_ns;
 
 	spin_lock(&stats->lock);
 	prev = stats->prev_runtime;
 	runtime = stats->runtime;
 	stats->prev_runtime = runtime;
-	runtime = ktime_add_ns(stats->vruntime,
-			       ktime_to_ns(ktime_sub(runtime, prev)) <<
-			       shift[entity->priority]);
+	runtime_ns = ktime_to_ns(ktime_sub(runtime, prev)) <<
+		     shift[entity->priority];
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	runtime_ns *= ((1 << DRM_CGROUP_WEIGHT_SHIFT) - entity->cgroup_weight);
+	runtime_ns >>= DRM_CGROUP_WEIGHT_SHIFT;
+#endif
+	runtime = ktime_add_ns(stats->vruntime, runtime_ns);
 	stats->vruntime = runtime;
 	spin_unlock(&stats->lock);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 003b5904927f..453d3a7c835e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -149,6 +149,10 @@ struct drm_sched_entity {
 	 */
 	enum drm_sched_priority         priority;
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	unsigned int			cgroup_weight;
+#endif
+
 	/**
 	 * @job_queue: the list of jobs of this entity.
 	 */
@@ -720,6 +724,9 @@ void drm_sched_cgroup_track_sched_entity(struct drm_file *file_priv,
 				  struct drm_sched_entity *entity);
 void drm_sched_cgroup_untrack_sched_entity(struct drm_file *file_priv,
 				    struct drm_sched_entity *entity);
+
+void drm_sched_cgroup_notify_weight(struct drm_file *file_priv,
+				    unsigned int weight);
 #else
 static inline void drm_sched_cgroup_init_drm_file(struct drm_file *file_priv)
 {
-- 
2.48.0

