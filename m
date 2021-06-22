Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879873B0572
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0B6E4E6;
	Tue, 22 Jun 2021 13:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1166E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:05:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1530168wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNIYPlX0JytgdeyqZXi1yT6+E8lLWEw0wxSNK6BuU1g=;
 b=UxQqZyzkch1fWz9RRvyaWlaWi0psndX+DtNlXvwOWmv345Qi7rL2UmLpxLhoWRYLbn
 BSNZNE00DhpLBakxgnO88v3gdjrWXGkOwgczFCi1OH103prAJOkdTsxt0cjGtJAj88ja
 dODOsSUZkllMQzgxJitmEmDA6lf5iIRq0tglbMGV3fCmTCXRgxiQOP7DSkROiC6uyD7x
 oWqg+WafrEshGk1jQqQ1CNy3O+rwsOgt5RH/cQA0bCrDwOv/EcgxFQQJsJANW3aqOeya
 N4PrpIPmXa578iGVwq1wAOucixNLCGV2wcM8h+wpoO3SEazhMIl1TpjEtTuuLIwT4/8E
 uIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNIYPlX0JytgdeyqZXi1yT6+E8lLWEw0wxSNK6BuU1g=;
 b=lDJqAGX2gr+MqaE+iiY1BtZR5G7L2NTzZvoI40DH7J6Dc9RHtWMEWRwvqci5TaKW83
 2q8aXX4y0MkuLeEaDDro08s0gwRZeHAL7HjSYxKnFDHBbRu+l9CGIE+BEPXgAkICN3l3
 PAzh0/a16XFXjtlLUMDEFIioC9xowIM76CD9Lb4DKvTTEwkS5oSObEZ3zF3jFJAqrvcw
 1MGeCJmIcKe2IYwG3wnjWNXu1kIX79yGvE/RFZJDglG6A5JovxISYjheZliwZw050bo/
 oKrFKHVQlN8tzeLGE3nxE5sY4/n9lpqg++LPzPpRGROUOa8MXRLeKzT1AUCWTkCm2Ttj
 Onvg==
X-Gm-Message-State: AOAM532XGsmVLVrp7RgYP0gzLxQtwmP5/q1aKk2Sm/49ikNSPbNA5xNB
 g0C8H44Jrgf790hMEFJ+SDA=
X-Google-Smtp-Source: ABdhPJyOXbRgFXWomfeejyHYW4o8ee6yuYY4TqhPH/6KBuZNwuv1iVxV7LeteJt0RowP16EaDdq98w==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr4270602wmq.9.1624367101233; 
 Tue, 22 Jun 2021 06:05:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:19f5:e310:467b:783d])
 by smtp.gmail.com with ESMTPSA id f5sm24440853wrf.22.2021.06.22.06.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:05:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix and rework dma_buf_poll v3
Date: Tue, 22 Jun 2021 15:04:59 +0200
Message-Id: <20210622130459.122723-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Daniel pointed me towards this function and there are multiple obvious problems
in the implementation.

First of all the retry loop is not working as intended. In general the retry
makes only sense if you grab the reference first and then check the sequence
values.

It's also good practice to keep the reference around when installing callbacks
to fences you don't own.

And last the whole implementation was unnecessary complex and rather hard to
understand which could lead to probably unexpected behavior of the IOCTL.

Fix all this by reworking the implementation from scratch.

Only mildly tested and needs a thoughtful review of the code.

v2: fix the reference counting as well
v3: keep the excl fence handling as is for stable

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/dma-buf/dma-buf.c | 133 ++++++++++++++++----------------------
 include/linux/dma-buf.h   |   2 +-
 2 files changed, 55 insertions(+), 80 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index eadd1eaa2fb5..e97c3a9d98d5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
 	 * If you hit this BUG() it means someone dropped their ref to the
 	 * dma-buf while still having pending operation to the buffer.
 	 */
-	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
+	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
 	dmabuf->ops->release(dmabuf);
 
@@ -202,16 +202,20 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	wake_up_locked_poll(dcb->poll, dcb->active);
 	dcb->active = 0;
 	spin_unlock_irqrestore(&dcb->poll->lock, flags);
+	dma_fence_put(fence);
 }
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
+	struct dma_buf_poll_cb_t *dcb;
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
 	struct dma_resv_list *fobj;
 	struct dma_fence *fence_excl;
-	__poll_t events;
 	unsigned shared_count, seq;
+	struct dma_fence *fence;
+	__poll_t events;
+	int r, i;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -225,99 +229,70 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	if (!events)
 		return 0;
 
+	dcb = events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
+
+	/* Only queue a new one if we are not still waiting for the old one */
+	spin_lock_irq(&dmabuf->poll.lock);
+	if (dcb->active)
+		events = 0;
+	else
+		dcb->active = events;
+	spin_unlock_irq(&dmabuf->poll.lock);
+	if (!events)
+		return 0;
+
 retry:
 	seq = read_seqcount_begin(&resv->seq);
 	rcu_read_lock();
 
 	fobj = rcu_dereference(resv->fence);
-	if (fobj)
+	if (fobj && events & EPOLLOUT)
 		shared_count = fobj->shared_count;
 	else
 		shared_count = 0;
-	fence_excl = rcu_dereference(resv->fence_excl);
-	if (read_seqcount_retry(&resv->seq, seq)) {
-		rcu_read_unlock();
-		goto retry;
-	}
 
-	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
-		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
-		__poll_t pevents = EPOLLIN;
-
-		if (shared_count == 0)
-			pevents |= EPOLLOUT;
-
-		spin_lock_irq(&dmabuf->poll.lock);
-		if (dcb->active) {
-			dcb->active |= pevents;
-			events &= ~pevents;
-		} else
-			dcb->active = pevents;
-		spin_unlock_irq(&dmabuf->poll.lock);
-
-		if (events & pevents) {
-			if (!dma_fence_get_rcu(fence_excl)) {
-				/* force a recheck */
-				events &= ~pevents;
-				dma_buf_poll_cb(NULL, &dcb->cb);
-			} else if (!dma_fence_add_callback(fence_excl, &dcb->cb,
-							   dma_buf_poll_cb)) {
-				events &= ~pevents;
-				dma_fence_put(fence_excl);
-			} else {
-				/*
-				 * No callback queued, wake up any additional
-				 * waiters.
-				 */
-				dma_fence_put(fence_excl);
-				dma_buf_poll_cb(NULL, &dcb->cb);
-			}
+	for (i = 0; i < shared_count; ++i) {
+		fence = rcu_dereference(fobj->shared[i]);
+		fence = dma_fence_get_rcu(fence);
+		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
+			/* Concurrent modify detected, force re-check */
+			dma_fence_put(fence);
+			rcu_read_unlock();
+			goto retry;
 		}
-	}
 
-	if ((events & EPOLLOUT) && shared_count > 0) {
-		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
-		int i;
-
-		/* Only queue a new callback if no event has fired yet */
-		spin_lock_irq(&dmabuf->poll.lock);
-		if (dcb->active)
-			events &= ~EPOLLOUT;
-		else
-			dcb->active = EPOLLOUT;
-		spin_unlock_irq(&dmabuf->poll.lock);
-
-		if (!(events & EPOLLOUT))
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
 			goto out;
+		}
+		dma_fence_put(fence);
+	}
 
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
-
-			if (!dma_fence_get_rcu(fence)) {
-				/*
-				 * fence refcount dropped to zero, this means
-				 * that fobj has been freed
-				 *
-				 * call dma_buf_poll_cb and force a recheck!
-				 */
-				events &= ~EPOLLOUT;
-				dma_buf_poll_cb(NULL, &dcb->cb);
-				break;
-			}
-			if (!dma_fence_add_callback(fence, &dcb->cb,
-						    dma_buf_poll_cb)) {
-				dma_fence_put(fence);
-				events &= ~EPOLLOUT;
-				break;
-			}
+	fence = dma_resv_get_excl(resv);
+	if (fence && shared_count == 0) {
+		fence = dma_fence_get_rcu(fence);
+		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
+			/* Concurrent modify detected, force re-check */
 			dma_fence_put(fence);
+			rcu_read_unlock();
+			goto retry;
+
 		}
 
-		/* No callback queued, wake up any additional waiters. */
-		if (i == shared_count)
-			dma_buf_poll_cb(NULL, &dcb->cb);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
+			goto out;
+		}
+		dma_fence_put(fence_excl);
 	}
 
+	/* No callback queued, wake up any additional waiters. */
+	dma_buf_poll_cb(NULL, &dcb->cb);
+
 out:
 	rcu_read_unlock();
 	return events;
@@ -562,8 +537,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	dmabuf->owner = exp_info->owner;
 	spin_lock_init(&dmabuf->name_lock);
 	init_waitqueue_head(&dmabuf->poll);
-	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
-	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
+	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
+	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
 
 	if (!resv) {
 		resv = (struct dma_resv *)&dmabuf[1];
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..7e747ad54c81 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -329,7 +329,7 @@ struct dma_buf {
 		wait_queue_head_t *poll;
 
 		__poll_t active;
-	} cb_excl, cb_shared;
+	} cb_in, cb_out;
 };
 
 /**
-- 
2.25.1

