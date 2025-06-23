Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518FCAE400E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FF510E13E;
	Mon, 23 Jun 2025 12:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JEcHXkuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075CF10E387;
 Mon, 23 Jun 2025 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bkpcLo+Ff+sYASpd1HzfNqS/oJx8AQFFplMFsTZyx5Q=; b=JEcHXkujUc2v1/EttULLm4lZNE
 t2LFdzFBt03tBba1cIroUKGaDV/BupvMMEmHCtdRIHR9ec/0QRXvXhgzFIvfZpRxVaFkrmPZxhZog
 EIfQtdoLZ2AlSg32B7OwT1duuhDMdpxzxe/S+nFbg8Glfy0ZLGTkYNX9IqYjlidtCYd8Ln+Y/l999
 9lDK4x0Sq/g9SHIXIKZ6rnQeIRBUClPV8r1S/4egzYlshtJeA3Hc1x5+MjUH+ePfr7Zj/VRSKKedy
 T/y+84rqzirV1AjTC3nIoaZ3DZyZwQgmQ+ikawtVwzkZRgHANZdFpnFkXoFdbDVJSkE1Dt/FVkFN+
 MeSSYt7g==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uTgHF-007U2v-8J; Mon, 23 Jun 2025 14:27:57 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 06/16] drm/sched: Consolidate drm_sched_rq_select_entity_rr
Date: Mon, 23 Jun 2025 13:27:36 +0100
Message-ID: <20250623122746.46478-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
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

Extract out two copies of the identical code to function epilogue to make
it smaller and more readable.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++---------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0627a82c02dc..436d58073823 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -263,38 +263,14 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
 	entity = rq->current_entity;
 	if (entity) {
 		list_for_each_entry_continue(entity, &rq->entities, list) {
-			if (drm_sched_entity_is_ready(entity)) {
-				/* If we can't queue yet, preserve the current
-				 * entity in terms of fairness.
-				 */
-				if (!drm_sched_can_queue(sched, entity)) {
-					spin_unlock(&rq->lock);
-					return ERR_PTR(-ENOSPC);
-				}
-
-				rq->current_entity = entity;
-				reinit_completion(&entity->entity_idle);
-				spin_unlock(&rq->lock);
-				return entity;
-			}
+			if (drm_sched_entity_is_ready(entity))
+				goto found;
 		}
 	}
 
 	list_for_each_entry(entity, &rq->entities, list) {
-		if (drm_sched_entity_is_ready(entity)) {
-			/* If we can't queue yet, preserve the current entity in
-			 * terms of fairness.
-			 */
-			if (!drm_sched_can_queue(sched, entity)) {
-				spin_unlock(&rq->lock);
-				return ERR_PTR(-ENOSPC);
-			}
-
-			rq->current_entity = entity;
-			reinit_completion(&entity->entity_idle);
-			spin_unlock(&rq->lock);
-			return entity;
-		}
+		if (drm_sched_entity_is_ready(entity))
+			goto found;
 
 		if (entity == rq->current_entity)
 			break;
@@ -303,6 +279,22 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
 	spin_unlock(&rq->lock);
 
 	return NULL;
+
+found:
+	if (!drm_sched_can_queue(sched, entity)) {
+		/*
+		 * If scheduler cannot take more jobs signal the caller to not
+		 * consider lower priority queues.
+		 */
+		entity = ERR_PTR(-ENOSPC);
+	} else {
+		rq->current_entity = entity;
+		reinit_completion(&entity->entity_idle);
+	}
+
+	spin_unlock(&rq->lock);
+
+	return entity;
 }
 
 /**
-- 
2.48.0

