Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNAkNUcCq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE322517A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489CE10EDB0;
	Fri,  6 Mar 2026 16:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eE8fM7iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF51B10ED94;
 Fri,  6 Mar 2026 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9sFkpjHf1ZCt2doKc1pxhxnP1Hc7ZPP/chhzecr/hfM=; b=eE8fM7ivHW1418p5zJZpVkXlKQ
 B8Vh/+gyDzRYUJTiaIE/41FCJFP2Nfw43VcyFDVt4VdFOOVq1obp8HzC3RuBUlzWF3FVYwXKZABKK
 mXrfrDbhnkF96BLexVdw/7Eq9q8W4EipkE91CJqAN6RSVXA3zwO73eMoASNI2Hjdv3GwdDXOWMwkp
 5nU9sJQZPV1YL7ddPfIBgsPP2/DoNUPIVaG++U8EORZAXD9bBLtOjkkBzfOfhK0ZJ/micODcEnzSX
 wS/t7vkeBN6GBgCD89kjkYQvsagdu1gBEiM5YaI720zKQmOton6huYhfKgsa+ztj1DCN32aotD/hy
 Ia47K7dg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyY8f-00APSr-1p; Fri, 06 Mar 2026 17:34:57 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 09/29] drm/sched: Remove idle entity from tree
Date: Fri,  6 Mar 2026 16:34:25 +0000
Message-ID: <20260306163445.97243-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
References: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: 97FE322517A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.774];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,igalia.com:mid,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Action: no action

There is no need to keep entities with no jobs in the tree so lets remove
it once the last job is consumed. This keeps the tree smaller which is
nicer and more efficient as entities are removed and re-added on every
popped job.

Apart from that, the upcoming fair scheduling algorithm will rely on the
tree only containing runnable entities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_rq.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index cf03b38c4eb5..2d1f579d8352 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -19,6 +19,9 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
 static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq)
 {
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
 		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
 		RB_CLEAR_NODE(&entity->rb_tree_node);
@@ -155,27 +158,30 @@ drm_sched_rq_next_rr_ts(struct drm_sched_rq *rq,
 void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *next_job;
+	struct drm_sched_rq *rq;
 
 	/*
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_lock(&rq->lock);
 	next_job = drm_sched_entity_queue_peek(entity);
 	if (next_job) {
-		struct drm_sched_rq *rq;
 		ktime_t ts;
 
-		spin_lock(&entity->lock);
-		rq = entity->rq;
-		spin_lock(&rq->lock);
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			ts = next_job->submit_ts;
 		else
 			ts = drm_sched_rq_next_rr_ts(rq, entity);
+
 		drm_sched_rq_update_fifo_locked(entity, rq, ts);
-		spin_unlock(&rq->lock);
-		spin_unlock(&entity->lock);
+	} else {
+		drm_sched_rq_remove_fifo_locked(entity, rq);
 	}
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
 }
 
 /**
-- 
2.52.0

