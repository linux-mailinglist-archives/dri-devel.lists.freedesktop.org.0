Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1BAA7228
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CC910E93E;
	Fri,  2 May 2025 12:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TlWpvHBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71E610E92A;
 Fri,  2 May 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=upLKmIYqFuCWrPW+YCcONB1QZijy2wIuX3Dvyk8Nf3U=; b=TlWpvHBuGaIKf+7bgRri8NQ9L1
 3mkESssHf01u4P1+vbQ57GwAbG+uyPC75lLRU+fn8dT8asbH4tc/hpa7JJsxr7seZStVjeurMOXwe
 BvzPKb69MQ5WnkmFho5k0HMqGV7ZZ5RCBNYTl8Ch4NKv0Wizs9/lvHPGOTFUVzSVPWhPhRpbz976F
 GmdHaIPEdg5WFnl6OSPHUSUQizftgOdrs2mCJdFT5LzE5HJLPcs14XimzVUkhFh8tfNnm2NS1VuYT
 sobn26/G40BxFLMjPA/qKTuso5qNvP0kKBYCeRmeVl7x9L+zHeV2B3WXMnK6Tez8WM2rCCfUuyh6z
 CevOLedg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uApZ2-0025Iy-FN; Fri, 02 May 2025 14:34:15 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 22/23] drm/sched: Add helper for DRM cgroup controller weight
 notifications
Date: Fri,  2 May 2025 13:32:55 +0100
Message-ID: <20250502123256.50540-23-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/scheduler/sched_internal.h | 12 +++++++++---
 include/drm/gpu_scheduler.h                |  7 +++++++
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 8729d3068449..4caf8c17090e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -627,4 +627,20 @@ void drm_sched_cgroup_untrack_sched_entity(struct drm_file *file_priv,
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
index 8d4bfe499b84..0310df87cb3c 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -3,6 +3,7 @@
 #ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
+#include <linux/cgroup_drm.h>
 #include <linux/ktime.h>
 #include <linux/kref.h>
 #include <linux/spinlock.h>
@@ -168,14 +169,19 @@ drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
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
index efd00059a814..292d9e03f055 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -146,6 +146,10 @@ struct drm_sched_entity {
 	 */
 	enum drm_sched_priority         priority;
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	unsigned int			cgroup_weight;
+#endif
+
 	/**
 	 * @job_queue: the list of jobs of this entity.
 	 */
@@ -685,6 +689,9 @@ void drm_sched_cgroup_track_sched_entity(struct drm_file *file_priv,
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

