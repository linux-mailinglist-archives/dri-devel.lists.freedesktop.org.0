Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A0399C76B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 12:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8164610E41A;
	Mon, 14 Oct 2024 10:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MZPumN2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EAC10E411
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nenw26NJ7VEQjsItEZ5Y7ISfWpD8ORA/gFav6I9A1bk=; b=MZPumN2moHfv3dh/gK5YJUsqyA
 sWikCVZVsiZoa8kwoSn4njsQ80jEB359lBrncS2oDsDJBC2vZMuyD8HJPGp+wjCKUK0YfP6h/8sPA
 W9t2KSNETp7A17w2gkJ8tgEQO63UnllqqSCBYZwADNjlnpFpthwz/QTgqFoIcYqZgMElM7rjfvJsr
 LZgksHdp4lK5wtVpWr1gTr7M371OWas6fmHmpmBR7Y7qyeoVsbfWqQbVHmBO8L9UybsKRralD+w5Z
 p8aC7afXslgBY4g+JhU+NsxayGCe0CjUXoFAUu38b+1K7Mqk/CeqL4ktgN73tGd4teYovhLofhch2
 T3WZSfHA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t0Ib3-009J6o-NY; Mon, 14 Oct 2024 12:46:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 3/5] drm/sched: Re-order struct drm_sched_rq members for
 clarity
Date: Mon, 14 Oct 2024 11:46:35 +0100
Message-ID: <20241014104637.83209-4-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014104637.83209-1-tursulin@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
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

Current kerneldoc for struct drm_sched_rq incompletely documents what
fields are protected by the lock.

This is not good because it is misleading.

Lets fix it by listing all the elements which are protected by the lock.

While at it, lets also re-order the members so all protected by the lock
are in a single group.

v2:
 * Refer variables by kerneldoc syntax, more verbose commit text. (Philipp)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Philipp Stanner <pstanner@redhat.com>
---
 include/drm/gpu_scheduler.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3658a6cb048e..b6d095074c19 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -243,10 +243,10 @@ struct drm_sched_entity {
 /**
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
- * @lock: to modify the entities list.
  * @sched: the scheduler to which this rq belongs to.
- * @entities: list of the entities to be scheduled.
+ * @lock: protects @entities, @rb_tree_root and @current_entity.
  * @current_entity: the entity which is to be scheduled.
+ * @entities: list of the entities to be scheduled.
  * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
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

