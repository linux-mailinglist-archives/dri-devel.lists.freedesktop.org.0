Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BFA76EF5
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE010E48E;
	Mon, 31 Mar 2025 20:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cIY4tklA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FFC10E47E;
 Mon, 31 Mar 2025 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+s24y53yv1Drh0qcWUBpAVVwkBUrPCnE/JQYBIlHJiU=; b=cIY4tklAmzY0BpDTG1H6UEzuGb
 GTWSWYio66AUk0dqzGojQk771Gj86LrC5MPikMcPTC1sQeC/V1q+ZKQuJvHtGiyavg+8WoBEFWI4q
 pqzIRnmgspWMNGWp+5KypS8ajTXvrnm+/Ewv7o0HxMXSMCoHS6/Qn7J6+X+vq5D+N/JX3TelcTqqS
 gtc4iQq/blR277cFAYG4gvuwGTO70gK+zBZiGivHemHe66AYg3E8eY6URjq4ar8Gw7ZBMZZbGkCVb
 X9ts2JjtIOP8JN06Jg/8SqTxN43eLOXIrEBoxWxJG3jUS5C9I0PEIzNsXLoVIL448Bit4tZlKeQWI
 t05B59cw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZY-009M30-Tf; Mon, 31 Mar 2025 22:17:29 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 04/14] drm/sched: Clarify locked section in
 drm_sched_rq_select_entity_fifo
Date: Mon, 31 Mar 2025 21:16:55 +0100
Message-ID: <20250331201705.60663-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
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
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 31 ++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f593b88ab02c..357133e6d4d0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -326,29 +326,32 @@ static struct drm_sched_entity *
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
2.48.0

