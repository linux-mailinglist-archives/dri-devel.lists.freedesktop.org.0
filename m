Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFC978570
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A8210EBC6;
	Fri, 13 Sep 2024 16:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ric6chdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7A410E0EE;
 Fri, 13 Sep 2024 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hH18VOQQKdHYQ4QsO8/Po71saLsLqHmrZ2rXpiX+guA=; b=ric6chdVjTrY4T5wsVARUi7D8L
 FLV1fwSzcGN6bueADBIwAh97MXEN59f1SbNNd2I5JQmrGQNIYhhA3ehfMGs33Rfd73BJK8gpz46nv
 xp8gHC1Xc8pXgnPAOS9GYLxBLu2z7x87YCxQzfuPKQ82R4zeIPjk9NZ1EzMKXRXNGGM1QrUQ6lDG/
 oD8RSuwo6bbsR7lNzyNak4cxsf5NnWGulgLY+ZCCZrF5efbU00jrSnrn6EMMCpF29mr1w5J5YMqps
 NbScQ1cfsO8BPQ9TplCVFbtiqKQ2giqz5Ei1mE4RfjfLPvRiUe0QfbdNBAPp2MvzsspvCD6jfzBjS
 jFpBY1Cw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sp8o9-00DOev-RO; Fri, 13 Sep 2024 18:06:05 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
Date: Fri, 13 Sep 2024 17:05:57 +0100
Message-ID: <20240913160559.49054-7-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913160559.49054-1-tursulin@igalia.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
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
---
 include/drm/gpu_scheduler.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 38465b78c7d5..2f58af00f792 100644
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

