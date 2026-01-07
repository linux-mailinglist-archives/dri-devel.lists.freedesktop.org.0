Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E54CFE073
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E5B10E5A6;
	Wed,  7 Jan 2026 13:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PNW8XeJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2679A10E5A6;
 Wed,  7 Jan 2026 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=udkDoFrp7pSEzJKiRVTWVJpcEp96ajAbI4aCeeFAoOQ=; b=PNW8XeJ5H/1DBRmMNv6bLo9yoX
 YeJJFw9DhViJ2yCJsbOBORpwA8CMkcbfYIFQkDQ1hIcQW9cU1bjlwWRa+6+xc9vebH+wUz7mNuzBt
 xGkIl1rRcQ67KybLvHnJMzsSfeT+gBBHOQ+nL2W7WsbH/0kitiwdLfhLeyDrsK+/pcwqOmRkYtDk1
 9azLcY3B5HdWmJ6GP0LZHEX9D8fsyMiQdILvLToekCskuVekhlW9DIeQXC8Oe1Un/hFLfNzkWCkfS
 cTLxGlp0lGXVlCv/eZS3FnaL1wwHZD8ypAgnwZggWb7FZSWsDrKcjR+p44mTaul44SQtb0q2hsOIl
 aBBNHVKw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vdTpb-002ZrY-QO; Wed, 07 Jan 2026 14:44:11 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: Simplify idle entity check
Date: Wed,  7 Jan 2026 13:44:05 +0000
Message-ID: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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

drm_sched_entity_is_idle() is called when flushing the entity before
destroying it and currently decides on the idle status based either on
number of jobs in its queue being zero, or whether the entity is not part
of any run-queue.

If entity is not part of a run-queue it is implied it can have no jobs in
its queue, from which it follows it is redundant to look at the both and
we can simplify to only look at the queue.

The list_empty() check was added in
a875f58e237a ("drm/scheduler: stop setting rq to NULL")
where it replaced the entity->rq check which was added in
741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)").

Since for the submit race involving exiting entities, explicit handling
via entity->stopped was added soon after in
62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")
it indeed looks we are safe to remove the list_empty() check.

This mean we can remove the memory barrier as well and fewer memory
barriers the better.

While at it, we add READ_ONCE annotation on the entity->stopped check to
mark the unlocked read.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bb7e5fc47f99..2ed84504cfd6 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -137,14 +137,8 @@ EXPORT_SYMBOL(drm_sched_entity_modify_sched);
 
 static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
 {
-	rmb(); /* for list_empty to work without lock */
-
-	if (list_empty(&entity->list) ||
-	    spsc_queue_count(&entity->job_queue) == 0 ||
-	    entity->stopped)
-		return true;
-
-	return false;
+	return spsc_queue_count(&entity->job_queue) == 0 ||
+	       READ_ONCE(entity->stopped);
 }
 
 /**
-- 
2.52.0

