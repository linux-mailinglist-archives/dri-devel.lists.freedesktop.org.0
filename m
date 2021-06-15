Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F93A7D07
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 13:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550646E24E;
	Tue, 15 Jun 2021 11:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2116E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 11:21:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id nd37so14217600ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JcDQObrR2aDQY9/lhAYRTVQE38BhN0Q7yhHIsHaxeg=;
 b=aYuQaA3BRDKDgADO6KBS070wjCNOpZuUz83W0+HYodS7ZGN5KSMzaGjErg50mn0lKT
 EynNxWT4pvJbDxVcwpnEkw7Hl/A65iS7PCXcxMunw/bhXFc1KJBF4AFaAkSs4unG4neq
 tDsZkDu/JUKv5K6aRUmkLkA+kkJArSy2qV7jvUuBnZ+Vs2avQhn8rxZ7u79/n5qCRnWX
 Obxz/p62s1zbQHZ2U2C68NRjGKOEEQmIBInmqt2groyiu8NeiTi84hu1xocDxnzSR3BF
 q6G3M6s4k+lZ1xVqqld8uJO8xvONJwchDUabFALV6O7GzqjLmE/r7Pza7gTpKrNQDgHa
 Oopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JcDQObrR2aDQY9/lhAYRTVQE38BhN0Q7yhHIsHaxeg=;
 b=Eh1W0idgO5zGD1lSGXUcTgNZ3B3wTT1YtRx6E3A6/Ifei589qQOO5zJddueJvAXTOl
 1VbVqMj2YGXu0osQ+rOVWsskE2ld36tNpWB+rBtLnQ0tD5SRRL8AiasF3G59fpdmvxWa
 T3Pd8NWfXa8rpoQoV1KMZzFN0/KTFarXKodYdeyzpwTyEHLoPoTa15AsS6FQk0yct3jg
 DyN+EFOTJbXnLZxqi3LazfhlKN8ZN98AbgfxCeeom6XGEy0tnH4WIffzZzzNAsxYCaPi
 1FE6XUVMw8Ebpet0/eNkbciXbWbRsB11cfM6gulS33M8MIifUlt0/NWGzqenmNPNJ5Fy
 LVWQ==
X-Gm-Message-State: AOAM531rFYavVhbLrYqIdttmE0QOBwtCQVjG0MeJ8CdVaGVDWmFFJ/h+
 BU+Y01ePPangeLiPkMgjZ2k=
X-Google-Smtp-Source: ABdhPJwnlqPovo3XuDEQ1LvtyHC+wf17Av+cJ16rvJw4v46Eeo6L+x/DN5iBe/jNJl6D+hGbtLVSDA==
X-Received: by 2002:a17:906:8056:: with SMTP id
 x22mr19661783ejw.298.1623756079156; 
 Tue, 15 Jun 2021 04:21:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d7e:fd4a:935a:f8d4])
 by smtp.gmail.com with ESMTPSA id b1sm1121496ejz.54.2021.06.15.04.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 04:21:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 jason@jlekstrand.net
Subject: [PATCH] dma-buf: fix and rework dma_buf_poll
Date: Tue, 15 Jun 2021 13:21:17 +0200
Message-Id: <20210615112117.32838-1-christian.koenig@amd.com>
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
makes only sense if you grab the reference first and then check the retry. Then
we skipped checking the exclusive fence when shared fences were present. And
last the whole implementation was unnecessary complex and rather hard to
understand which could lead to probably unexpected behavior of the IOCTL.

Fix all this by reworking the implementation from scratch.

Only mildly tested and needs a thoughtful review of the code.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 132 +++++++++++++++-----------------------
 include/linux/dma-buf.h   |   2 +-
 2 files changed, 54 insertions(+), 80 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..1bd00e18291f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
 	 * If you hit this BUG() it means someone dropped their ref to the
 	 * dma-buf while still having pending operation to the buffer.
 	 */
-	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
+	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
 	dmabuf->ops->release(dmabuf);
 
@@ -206,12 +206,15 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
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
@@ -225,99 +228,70 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
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
-	fence_excl = dma_resv_excl_fence(resv);
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
+		dma_fence_put(fence);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
 			goto out;
+		}
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
+	fence = dma_resv_excl_fence(resv);
+	if (fence) {
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
+		dma_fence_put(fence_excl);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
+			goto out;
+		}
 	}
 
+	/* No callback queued, wake up any additional waiters. */
+	dma_buf_poll_cb(NULL, &dcb->cb);
+
 out:
 	rcu_read_unlock();
 	return events;
@@ -562,8 +536,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
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

