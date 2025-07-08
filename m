Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41BAFCA49
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CBC10E616;
	Tue,  8 Jul 2025 12:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lgIyl2Tf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C77D10E610;
 Tue,  8 Jul 2025 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8bQtEuMRUigy0j+y0P+UgKEcBYWWReGSyZkAPX3/x4M=; b=lgIyl2Tfpoa3x0Bses8y1yhlLL
 jBaPxk6r3ijxhcv8pY95EyTU68IiS+M8epj3vMd2NrSAarYb8/cWZUooZhFmdxEAosmk3tmUTX070
 ui9WlAwUEZ0VZNug3opE95e8DppiiaPYPaIH7v7FkkZ0Unh3IcmWMNbnJ6S65Hz/02u2gMDEJFhVW
 3Dlh69iscfL7K/kq4PeQTXVA34LO5FEZN5vyrPFq0FDGa1X/cw6ffNYKenJzmFQbAzt3unJgSv+KZ
 /dkiXrWduNRqgHPx0cQNVCTejy+jnpWBpswO6Ala1DN4U8t2TlFTfKYkJIcyqCm7LTLMXeM4ZTX78
 r1AuZMpA==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ7K7-00E054-2p; Tue, 08 Jul 2025 14:21:23 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: Consolidate drm_sched_rq_select_entity_rr
Date: Tue,  8 Jul 2025 13:21:21 +0100
Message-ID: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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
index 2335df4de2b8..9212ebae7476 100644
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

