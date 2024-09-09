Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD796972041
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7172910E5FE;
	Mon,  9 Sep 2024 17:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MKKSAhji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B29A10E5F2;
 Mon,  9 Sep 2024 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jp3RmbG8f3OBw4Pi+42YfmplFO0xM+uDEGmft2k+eKY=; b=MKKSAhjifHokCovUhbanwzF+lp
 oExHIW73Z1PQ7O3LTdZ9je0oZc3cfWPVa5VWj6Iq0c8gUOX3VAh9zen9zPF+AkL+v5DuMkq7FQ6rf
 T2lvlB9dPr0wU7Y/UmLQqaJ15W4myO6jDtOZC4a7QkSa5WnvVSdQvA9pbn6952oaeRBj4rOR9rNSh
 ChLWe8PrQX6AcXfDdjlctD8Bnl7ZYYXvntRoHyqDDZ1ppEsobrFoRVgOVHfALpFguQilCP9enUtrF
 iCB7CisSjFhZxJ4LNMrtDgN2BHDmlOiC3jVWVbi4TbSzAUNpaQq9QQm3+J16JvCoo5VFFvhhwLSyV
 fP3Ji2zQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sni3F-00Bg5Q-Dj; Mon, 09 Sep 2024 19:19:45 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
Date: Mon,  9 Sep 2024 18:19:35 +0100
Message-ID: <20240909171937.51550-7-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909171937.51550-1-tursulin@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
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

Lets re-order the members to make it clear which are protected by the lock
and at the same time document it via kerneldoc.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 include/drm/gpu_scheduler.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a06753987d93..d4a3ba333568 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -243,10 +243,10 @@ struct drm_sched_entity {
 /**
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
- * @lock: to modify the entities list.
  * @sched: the scheduler to which this rq belongs to.
- * @entities: list of the entities to be scheduled.
+ * @lock: protects the list, tree and current entity.
  * @current_entity: the entity which is to be scheduled.
+ * @entities: list of the entities to be scheduled.
  * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
  *
  * Run queue is a set of entities scheduling command submissions for
@@ -254,10 +254,12 @@ struct drm_sched_entity {
  * the next entity to emit commands from.
  */
 struct drm_sched_rq {
-	spinlock_t			lock;
 	struct drm_gpu_scheduler	*sched;
-	struct list_head		entities;
+
+	spinlock_t			lock;
+	/* Following members are protected by the @lock: */
 	struct drm_sched_entity		*current_entity;
+	struct list_head		entities;
 	struct rb_root_cached		rb_tree_root;
 };
 
-- 
2.46.0

