Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54E96FA60
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 20:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C8910EACD;
	Fri,  6 Sep 2024 18:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KrESfBEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B60110EACC;
 Fri,  6 Sep 2024 18:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c985A/0YQujGDyLtw6vR6dXr2uB/A3wUTZvGD/0nxxg=; b=KrESfBEEy/Xkd7fBN/mO1d4AT8
 l4h74eYej54Rf5P8o9XGwZq9J0J83IwCdAzIZglQIex+sbIzwLj8r+RkOepAapsrKa/0g7eZXXdbA
 ZMdML5pTBfvpP6g3KbWk5+3ItrOcWNbc+qHlDD+NYhgJezbsap2rZOobq6UL+y2/nYld3rnwWoFNV
 ckguD+iQl1dgUB6LK7wjA0A43C2EDmSLNeUKfGjfMCKmZBWSJl07Tgv5dJZFECUtj7C7dO7KFHGSR
 JDJrqCbYKJ51MiZNOHSWTOc7Dc5NK70CwBCU2ZJvd1XwUYGcXR9tvN+WAECeXfNDtAMXg5ZXjCBRf
 mQrTQCCg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1smdM3-00AW7Y-Q5; Fri, 06 Sep 2024 20:06:43 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 2/2] drm/sched: Remove drm_sched_entity_set_priority
Date: Fri,  6 Sep 2024 19:06:39 +0100
Message-ID: <20240906180639.12218-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906180639.12218-1-tursulin@igalia.com>
References: <20240906180639.12218-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Now that no callers exist, lets remove the whole misleading helper.

Misleading because runtime changes do not reliably work due
drm_sched_entity_select_rq() only acting on idle entities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 22 ++--------------------
 include/drm/gpu_scheduler.h              |  2 --
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 8f40701bd801..8002755661ac 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -47,9 +47,8 @@
  *
  * Note that the &sched_list must have at least one element to schedule the entity.
  *
- * For changing @priority later on at runtime see
- * drm_sched_entity_set_priority(). For changing the set of schedulers
- * @sched_list at runtime see drm_sched_entity_modify_sched().
+ * For changing the set of schedulers @sched_list at runtime see
+ * drm_sched_entity_modify_sched().
  *
  * An entity is cleaned up by callind drm_sched_entity_fini(). See also
  * drm_sched_entity_destroy().
@@ -385,23 +384,6 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 	drm_sched_wakeup(entity->rq->sched, entity);
 }
 
-/**
- * drm_sched_entity_set_priority - Sets priority of the entity
- *
- * @entity: scheduler entity
- * @priority: scheduler priority
- *
- * Update the priority of runqueus used for the entity.
- */
-void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
-				   enum drm_sched_priority priority)
-{
-	spin_lock(&entity->rq_lock);
-	entity->priority = priority;
-	spin_unlock(&entity->rq_lock);
-}
-EXPORT_SYMBOL(drm_sched_entity_set_priority);
-
 /*
  * Add a callback to the current dependency of the entity to wake up the
  * scheduler when the entity becomes available.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a06753987d93..f078842423f4 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -607,8 +607,6 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
-void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
-				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
-- 
2.46.0

