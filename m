Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AE3C2349
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 14:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0536EA18;
	Fri,  9 Jul 2021 12:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AB26EA18
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 12:07:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i94so11834641wri.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 05:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VMdvgrIPFNbDBlULD0jM7TPybQR69W0x+WErSoHdvsM=;
 b=sCib+GuHrOVrELWEYgSHeIbLjnGZmwzJ6p7K3mKXrSAFm6Q8usiNonaNGfN4AOgeKv
 fEk8yPnnbGVzyyA1/glGBxHSnpJb9W2TlbXLhUW6Hr+wVLRuQ40X8foTimXYBk/7EO6/
 d3HX/StV8tHM+SWLmkDSXuqHs0tUibkF7BDQvzayBUo7tar8zxVU3dFbcxq6pTf57zbG
 mFKnFAhVuoLLdFWZBcelUivlMQqnLKpP21SebIjYRRwRBKr+wNRDELbMyvqfaCU6l6nK
 FKwXYDj5VXCBt/K7O5t2r/6opSdwgW84Rn8ipsndFlhZYQ3D13Y06saYCqCYEwnlKnsb
 T2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VMdvgrIPFNbDBlULD0jM7TPybQR69W0x+WErSoHdvsM=;
 b=JSjZ3VsFNSCYN4oYdc5bI0AUy0+0JuRKSxRKHzyFQqOm8wfUM0WLw/UHuqgkInxHht
 jug/sYr8SmyRphX0BTvycIUr1TotDguInWZAJ8HSD0+q82kUxbTyPLEb5Ab9o+4lV06O
 TCF1DywPNv5lxF2D1iSuZWrR5ZhtRtZFJHtHbEhZ56/ZF3S9m/dz7xI4c/KY5limq7GX
 SHA2Zm0vdsz6HTY1Bspg5RsZXuuCh8CV9pKtJVzSI8Z+71y20ErSqx6+r+HrxiJ26hb3
 TrfOBKC3f2WXYpuZQnE4Swbj9fCQpyNbY6eHFZ4XAKoy/Wppx7FJLjCV96qVY/Yp04qf
 1QZQ==
X-Gm-Message-State: AOAM530byDO71xiJT4Tt2g02Q98n20A9Zpw7+FEYUvfWUIp8z2wRvab0
 q3O8m0jZkMoOmLKHf+18JZKY4rWfoPg=
X-Google-Smtp-Source: ABdhPJybULhpYJTT2JNFzLfmsqdrdYkQjW5bGTtfnknfAE1Q54L75EJAbYsip9LcOmbflYaci6YKNA==
X-Received: by 2002:adf:f68c:: with SMTP id v12mr3189800wrp.360.1625832478025; 
 Fri, 09 Jul 2021 05:07:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b07a:406f:9a08:1838])
 by smtp.gmail.com with ESMTPSA id s17sm4944216wrt.58.2021.07.09.05.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 05:07:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH] dma-buf: fix and rework dma_buf_poll v6
Date: Fri,  9 Jul 2021 14:07:56 +0200
Message-Id: <20210709120756.205856-1-christian.koenig@amd.com>
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

Then we should always also wait for the exclusive fence.

It's also good practice to keep the reference around when installing callbacks
to fences you don't own.

And last the whole implementation was unnecessary complex and rather hard to
understand which could lead to probably unexpected behavior of the IOCTL.

Fix all this by reworking the implementation from scratch. Dropping the
whole RCU approach and taking the lock instead.

Only mildly tested and needs a thoughtful review of the code.

v2: fix the reference counting as well
v3: keep the excl fence handling as is for stable
v4: back to testing all fences, drop RCU
v5: handle in and out separately
v6: add missing clear of events

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/dma-buf/dma-buf.c | 156 +++++++++++++++++---------------------
 include/linux/dma-buf.h   |   2 +-
 2 files changed, 72 insertions(+), 86 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index eadd1eaa2fb5..39e1ef872829 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
 	 * If you hit this BUG() it means someone dropped their ref to the
 	 * dma-buf while still having pending operation to the buffer.
 	 */
-	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
+	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
 	dmabuf->ops->release(dmabuf);
 
@@ -202,16 +202,57 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	wake_up_locked_poll(dcb->poll, dcb->active);
 	dcb->active = 0;
 	spin_unlock_irqrestore(&dcb->poll->lock, flags);
+	dma_fence_put(fence);
+}
+
+static bool dma_buf_poll_shared(struct dma_resv *resv,
+				struct dma_buf_poll_cb_t *dcb)
+{
+	struct dma_resv_list *fobj = dma_resv_get_list(resv);
+	struct dma_fence *fence;
+	int i, r;
+
+	if (!fobj)
+		return false;
+
+	for (i = 0; i < fobj->shared_count; ++i) {
+		fence = rcu_dereference_protected(fobj->shared[i],
+						  dma_resv_held(resv));
+		dma_fence_get(fence);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r)
+			return true;
+		dma_fence_put(fence);
+	}
+
+	return false;
+}
+
+static bool dma_buf_poll_excl(struct dma_resv *resv,
+			      struct dma_buf_poll_cb_t *dcb)
+{
+	struct dma_fence *fence = dma_resv_get_excl(resv);
+	int r;
+
+	if (!fence)
+		return false;
+
+	dma_fence_get(fence);
+	r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+	if (!r)
+		return true;
+	dma_fence_put(fence);
+
+	return false;
 }
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence_excl;
+	unsigned shared_count;
 	__poll_t events;
-	unsigned shared_count, seq;
+	int r, i;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -225,101 +266,46 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	if (!events)
 		return 0;
 
-retry:
-	seq = read_seqcount_begin(&resv->seq);
-	rcu_read_lock();
-
-	fobj = rcu_dereference(resv->fence);
-	if (fobj)
-		shared_count = fobj->shared_count;
-	else
-		shared_count = 0;
-	fence_excl = rcu_dereference(resv->fence_excl);
-	if (read_seqcount_retry(&resv->seq, seq)) {
-		rcu_read_unlock();
-		goto retry;
-	}
+	dma_resv_lock(resv, NULL);
 
-	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
-		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
-		__poll_t pevents = EPOLLIN;
-
-		if (shared_count == 0)
-			pevents |= EPOLLOUT;
+	if (events & EPOLLOUT) {
+		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_out;
 
+		/* Check that callback isn't busy */
 		spin_lock_irq(&dmabuf->poll.lock);
-		if (dcb->active) {
-			dcb->active |= pevents;
-			events &= ~pevents;
-		} else
-			dcb->active = pevents;
+		if (dcb->active)
+			events &= ~EPOLLOUT;
+		else
+			dcb->active = EPOLLOUT;
 		spin_unlock_irq(&dmabuf->poll.lock);
 
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
-		}
+		if (events & EPOLLOUT && !dma_buf_poll_shared(resv, dcb) &&
+		    !dma_buf_poll_excl(resv, dcb))
+			/* No callback queued, wake up any other waiters */
+			dma_buf_poll_cb(NULL, &dcb->cb);
+		else
+			events &= ~EPOLLOUT;
 	}
 
-	if ((events & EPOLLOUT) && shared_count > 0) {
-		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
-		int i;
+	if (events & EPOLLIN) {
+		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_in;
 
-		/* Only queue a new callback if no event has fired yet */
+		/* Check that callback isn't busy */
 		spin_lock_irq(&dmabuf->poll.lock);
 		if (dcb->active)
-			events &= ~EPOLLOUT;
+			events &= ~EPOLLIN;
 		else
-			dcb->active = EPOLLOUT;
+			dcb->active = EPOLLIN;
 		spin_unlock_irq(&dmabuf->poll.lock);
 
-		if (!(events & EPOLLOUT))
-			goto out;
-
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
-			dma_fence_put(fence);
-		}
-
-		/* No callback queued, wake up any additional waiters. */
-		if (i == shared_count)
+		if (events & EPOLLIN && !dma_buf_poll_excl(resv, dcb))
+			/* No callback queued, wake up any other waiters */
 			dma_buf_poll_cb(NULL, &dcb->cb);
+		else
+			events &= ~EPOLLIN;
 	}
 
-out:
-	rcu_read_unlock();
+	dma_resv_unlock(resv);
 	return events;
 }
 
@@ -562,8 +548,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
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

