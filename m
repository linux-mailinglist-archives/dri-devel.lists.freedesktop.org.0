Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C0AD1C26
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 13:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF78810E1CD;
	Mon,  9 Jun 2025 11:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kRrDrh1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3110E047;
 Mon,  9 Jun 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IYsJEgMaqHnkj9zogcLK1cRSEP1fqVxPH3eFOlMY9Uk=; b=kRrDrh1tMmdqyWkbSQSHclW/7K
 3T+btSYQQ3cNe3fdzmH9kgZ+fGg/oYCCExymLcgIiiRFvEuvoyEb4LTOrkRaUYg/nnopb3WtmTomQ
 BDfAjRnlNAVvvPHq060zY9iI0OwgNfetC6eKDGul1zkeg8pY+m5nNzXnokDYTwX4XPK8oLPpljTlJ
 lExbliA7K2nLMcWeGmO5YI6cVjFcxWRZbeHk7lm/mvDcc4jT5kBVW2VtYPu+cvgNUgLjxigRf6DSr
 Z5te4jZZSxtYA7wky6SEmtr3ltP+zg/vpyTRnVQ78UNEFYNHpvLgA/O0NCjK1sd7+dnjiyTzEwHfn
 vqYizp/A==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOaI7-001NxT-VY; Mon, 09 Jun 2025 13:03:48 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 4/4] drm/xe: Make dma-fences compliant with the safe access
 rules
Date: Mon,  9 Jun 2025 12:03:30 +0100
Message-ID: <20250609110330.74705-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
References: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
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

Xe can free some of the data pointed to by the dma-fences it exports. Most
notably the timeline name can get freed if userspace closes the associated
submit queue. At the same time the fence could have been exported to a
third party (for example a sync_fence fd) which will then cause an use-
after-free on subsequent access.

To make this safe we need to make the driver compliant with the newly
documented dma-fence rules. Driver has to ensure a RCU grace period
between signalling a fence and freeing any data pointed to by said fence.

For the timeline name we simply make the queue be freed via kfree_rcu and
for the shared lock associated with multiple queues we add a RCU grace
period before freeing the per GT structure holding the lock.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 7 ++++++-
 drivers/gpu/drm/xe/xe_hw_fence.c             | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 4c39f01e4f52..a3f421e2adc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -20,6 +20,8 @@ struct xe_exec_queue;
 struct xe_guc_exec_queue {
 	/** @q: Backpointer to parent xe_exec_queue */
 	struct xe_exec_queue *q;
+	/** @rcu: For safe freeing of exported dma fences */
+	struct rcu_head rcu;
 	/** @sched: GPU scheduler for this xe_exec_queue */
 	struct xe_gpu_scheduler sched;
 	/** @entity: Scheduler entity for this xe_exec_queue */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b61d017eeca..c7f45800ec6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1299,7 +1299,11 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
 
-	kfree(ge);
+	/*
+	 * RCU free due sched being exported via DRM scheduler fences
+	 * (timeline name).
+	 */
+	kfree_rcu(ge, rcu);
 	xe_exec_queue_fini(q);
 	xe_pm_runtime_put(guc_to_xe(guc));
 }
@@ -1482,6 +1486,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->guc = ge;
 	ge->q = q;
+	init_rcu_head(&ge->rcu);
 	init_waitqueue_head(&ge->suspend_wait);
 
 	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 03eb8c6d1616..b2a0c46dfcd4 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -100,6 +100,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 		spin_unlock_irqrestore(&irq->lock, flags);
 		dma_fence_end_signalling(tmp);
 	}
+
+	/* Safe release of the irq->lock used in dma_fence_init. */
+	synchronize_rcu();
 }
 
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
-- 
2.48.0

