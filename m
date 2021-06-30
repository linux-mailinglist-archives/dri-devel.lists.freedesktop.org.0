Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D303F3B8245
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 14:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181566E9C2;
	Wed, 30 Jun 2021 12:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71336E9C2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 12:36:20 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l24so3904778ejq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 05:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ONPP3A7h1QzoKUEHb9ycxrhEc1spTHM+puvCaYqxhho=;
 b=WoHixG/P3n9BdGi+7I4ZXwXagVEF8as/wsR1zyzAEYnGdeuWR5l8+xPMEwh/KlnjQw
 DqPzjnoZLQCS8MqPpACLwCSX0v/uLF5suA0hum/r2c/Zpqp9dl6sK1rGhMiFwZTOogv4
 a+J9p7rXYFGW6Ls26C6+IcJFkjBV3htzrSRC4sJ1il7XEGlPS4hyrdYO2LbEuxCpqLN8
 ihZYs8GosLw83ZQ9KL0JdWt7lQQGruLC7IJsZSVmutWIcthcMYRU/0DMxm+nnK1ovPwW
 SPN/CNSXDjU0LI3p9PFhIAh5Nl0gvtkhz0mnqm2C9icj0H2mm+lEBAN4I6k0DwOnBqKG
 7dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ONPP3A7h1QzoKUEHb9ycxrhEc1spTHM+puvCaYqxhho=;
 b=ln8vWvTgr1xmmGVb3UNHXAD9TrJ5x0kyvDC0IHX2ppZaNCi3ySdh3Wd1jZVxYJ7oEX
 aV5jLLL/3rxo42zuZf0n80u6T6k0MYiKAob2yA86ldCjSx0i0jJYITyhiXK8cPoXzgov
 NysRMs2gbwSt9hgie2fp9OLtG2yGrmT1LRPinQHRVPVY2+pwcVB4Umyl2rnKgOWtvqgF
 jjghRvylkMLNp2SeGijm2AghsYFB7tLPLMwDGjwmHbbXcs39W1dcGBeIsJhSZxRA/FkO
 ToBHelUQ58DX9YySaTa6loTxoFAPmAPg1+6y1X8B70vs1P5L7qVdjxd91NQvx+IyfMCD
 02sA==
X-Gm-Message-State: AOAM5327LOWoI8uxE/RhirfMWemLatjuaHssVG5T09OvgCbz9GaYT4QH
 nhyJd23f7xJJoI+45e8HqsM3GGk2eL0=
X-Google-Smtp-Source: ABdhPJxKSqexHW2d4q6DWHjpj8FOJy2iaWa757lhciWmnWjRNwF2eFIL7S40sfpoSI3sC72RtcPEXA==
X-Received: by 2002:a17:907:9c9:: with SMTP id
 bx9mr35063706ejc.72.1625056579546; 
 Wed, 30 Jun 2021 05:36:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6bc9:f229:6d3c:d7ad])
 by smtp.gmail.com with ESMTPSA id e13sm7883952ejl.98.2021.06.30.05.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 05:36:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH] dma-buf: fix and rework dma_buf_poll v4
Date: Wed, 30 Jun 2021 14:36:18 +0200
Message-Id: <20210630123618.97534-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/dma-buf/dma-buf.c | 132 +++++++++++++-------------------------
 include/linux/dma-buf.h   |   2 +-
 2 files changed, 46 insertions(+), 88 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index eadd1eaa2fb5..192c4d34704b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
 	 * If you hit this BUG() it means someone dropped their ref to the
 	 * dma-buf while still having pending operation to the buffer.
 	 */
-	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
+	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
 	dmabuf->ops->release(dmabuf);
 
@@ -202,16 +202,19 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
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
-	struct dma_fence *fence_excl;
+	struct dma_fence *fence;
+	unsigned shared_count;
 	__poll_t events;
-	unsigned shared_count, seq;
+	int r, i;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -225,101 +228,56 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	if (!events)
 		return 0;
 
-retry:
-	seq = read_seqcount_begin(&resv->seq);
-	rcu_read_lock();
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
+	dma_resv_lock(resv, NULL);
 
-	fobj = rcu_dereference(resv->fence);
-	if (fobj)
+	fobj = dma_resv_get_list(resv);
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
+		fence = rcu_dereference_protected(fobj->shared[i],
+						  dma_resv_held(resv));
+		dma_fence_get(fence);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
+			goto out;
 		}
+		dma_fence_put(fence);
 	}
 
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
+	fence = dma_resv_get_excl(resv);
+	if (fence) {
+		dma_fence_get(fence);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
 			goto out;
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
 		}
-
-		/* No callback queued, wake up any additional waiters. */
-		if (i == shared_count)
-			dma_buf_poll_cb(NULL, &dcb->cb);
+		dma_fence_put(fence);
 	}
 
+	/* No callback queued, wake up any additional waiters. */
+	dma_buf_poll_cb(NULL, &dcb->cb);
+
 out:
-	rcu_read_unlock();
+	dma_resv_unlock(resv);
 	return events;
 }
 
@@ -562,8 +520,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
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

