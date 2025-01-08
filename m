Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E05A0649C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AB10EC6D;
	Wed,  8 Jan 2025 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AZ6nno1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DC910EC69
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4gIONoD4i1KGDwyMQdu+ZlWWvF0lE/b2yDIWehqogbQ=; b=AZ6nno1H5OMoEmsVMHYx7acnEX
 Ub7vV13mjQauiKljfJr1cIPTAFeZhDm+dK/ZukucxF2BKkvh9m0d5Yeq6DZYy6TXQHXRKf75SKPqP
 rptQByqEbgIcBMUdMig2PUQDh2xS+N/c9IksUWcIqxJHQul5+T/TNtRrRFqQ4GyY91YLKRgOAHl35
 B65Qnsppopw2br8gN/UFFHgXupFW8HtQIJXi6t0Zhcty64YuPg4qvY/TST53a9qZz+dT7iLCrsZFK
 PXpth4s9aGxliqxFBOrNt80p34LFDFA3RcMw9X0EoavjL6siWLrbinxuHJVex0zUVm1EU1Pgu1vSk
 M9M4JCvA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVau2-00DFFL-LD; Wed, 08 Jan 2025 19:35:38 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 08/18] drm/sched: Clarify locked section in
 drm_sched_rq_select_entity_fifo
Date: Wed,  8 Jan 2025 18:35:18 +0000
Message-ID: <20250108183528.41007-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
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

Rq->lock only protects the tree walk so lets move the rest out.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 31 ++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f07b19c97d0f..9a3d31c33fa9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -325,29 +325,32 @@ static struct drm_sched_entity *
 drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
 				struct drm_sched_rq *rq)
 {
+	struct drm_sched_entity *entity = NULL;
 	struct rb_node *rb;
 
 	spin_lock(&rq->lock);
 	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
-		struct drm_sched_entity *entity;
-
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
-		if (drm_sched_entity_is_ready(entity)) {
-			/* If we can't queue yet, preserve the current entity in
-			 * terms of fairness.
-			 */
-			if (!drm_sched_can_queue(sched, entity)) {
-				spin_unlock(&rq->lock);
-				return ERR_PTR(-ENOSPC);
-			}
-
-			reinit_completion(&entity->entity_idle);
+		if (drm_sched_entity_is_ready(entity))
 			break;
-		}
+		else
+			entity = NULL;
 	}
 	spin_unlock(&rq->lock);
 
-	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
+	if (!entity)
+		return NULL;
+
+	/*
+	 * If scheduler cannot take more jobs signal the caller to not consider
+	 * lower priority queues.
+	 */
+	if (!drm_sched_can_queue(sched, entity))
+		return ERR_PTR(-ENOSPC);
+
+	reinit_completion(&entity->entity_idle);
+
+	return entity;
 }
 
 /**
-- 
2.47.1

