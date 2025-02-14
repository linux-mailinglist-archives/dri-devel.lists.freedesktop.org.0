Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84CA35B5C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D847710EC3E;
	Fri, 14 Feb 2025 10:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q5NJWmkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F70210EC37;
 Fri, 14 Feb 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JcgCpWAeYs7b3kK61rGwZBTFvrKYDCoVOAwmTrM6ejQ=; b=q5NJWmkz1w3ZRTafRvtVsqnMhZ
 qaVDLA06d4cObMtE4tMTPlj3ro/WHfMlhG/KzUT9uwR1GyTvULzDIuApU7jImz0F51LUFaAIguQ0r
 eUIPH96nEkhAeiK/J+Q5jZ2SLNzorjDSGHs4gUlY0thMyyOKDeBJsce/JBwBnYhdO1U0ltXccmeqT
 rwvO6j+L/LleuRxSk/2P80BmeAwXs7efbzr68pD0HydycL45dZ/3ZVgvbPknqs5vntxA1PJDhJyg3
 LvblrY1/JofKDjgfq8RQWmvhiqYaaCSBTQrEwc2wFMdSfjIDYj6FpMyBiyzk+yoXB2+10VSpTkSOn
 0haXptmw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tisnT-00HYmX-UZ; Fri, 14 Feb 2025 11:19:53 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 4/6] drm/sched: Move drm_sched_entity_is_ready to internal
 header
Date: Fri, 14 Feb 2025 10:19:42 +0000
Message-ID: <20250214101944.19390-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
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

Helper is for scheduler internal use so lets hide it from DRM drivers
completely.

At the same time we change the method of checking whethere there is
anything in the queue from peeking to looking at the node count.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 12 ------------
 drivers/gpu/drm/scheduler/sched_internal.h | 13 +++++++++++++
 include/drm/gpu_scheduler.h                |  1 -
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a171f05ad761..87f88259ddf6 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -151,18 +151,6 @@ static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
 	return false;
 }
 
-/* Return true if entity could provide a job. */
-bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
-{
-	if (spsc_queue_peek(&entity->job_queue) == NULL)
-		return false;
-
-	if (READ_ONCE(entity->dependency))
-		return false;
-
-	return true;
-}
-
 /**
  * drm_sched_entity_error - return error of last scheduled job
  * @entity: scheduler entity to check
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 815d384845a3..2fdf9dbd632e 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -43,4 +43,17 @@ drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
 	return container_of(node, struct drm_sched_job, queue_node);
 }
 
+/* Return true if entity could provide a job. */
+static inline bool
+drm_sched_entity_is_ready(struct drm_sched_entity *entity)
+{
+	if (!spsc_queue_count(&entity->job_queue))
+		return false;
+
+	if (READ_ONCE(entity->dependency))
+		return false;
+
+	return true;
+}
+
 #endif
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1c1138308e66..6cd0f288f6ed 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -632,7 +632,6 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
-bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
 struct drm_sched_fence *drm_sched_fence_alloc(
-- 
2.48.0

