Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9542254D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114D6EB60;
	Tue,  5 Oct 2021 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2796EB53;
 Tue,  5 Oct 2021 11:37:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j8so6359158wro.7;
 Tue, 05 Oct 2021 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+zjjRS+8SmWmuiEHBZ1EQ1Juvwdnv29UPzLRK7KSTng=;
 b=ohTGmGBM0A8SAi0X4KFX3NT6pQ/30b41WhOGkrrL+7B8UvTjLrJWvZAntXY8girHBR
 ajYj7yCpVysGzaqRBmDutEmLCHMS7paIiTg6+SKdfssvVWh//unH0GJ2eHZxgtZq6nq/
 0P9ySyi6lyyaa0EiPFEYHsWPN0D7lbQXESG/t4UK6B+EXG73QnqMBUopGqhPNb82A3jY
 BojXM0m+pQfac26WOf/Gp5+ZvEAxLGzKhE9LcoTMPLpS+wJShMnmiLwQj5xUcctM1os6
 JuKHFmDaRSFj2ebuepKHQKXc6jCYGzEh8eCZLpId4NIvD9pf8MxjqIBDA/GRKph1jLkm
 l9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+zjjRS+8SmWmuiEHBZ1EQ1Juvwdnv29UPzLRK7KSTng=;
 b=QRytmz5Rd5QkWSCwdpoEp9AGib6hll5tJ+TaDgZ8rEReuDLAn10DSRg34ByDhL/8ZB
 1yG6VbVmVSpGkMVnFn5wB2qj2BQERejZuezTmwq2e7ffTQSYWzwlf7KtSlJadmxHPI8I
 nKgzrk4d6zK7hFfWnwNGzZhFpjAn/vy8QKl3Az1Chtssy4ek+1lvXTdkaxPsWpCbW0VC
 1JeEWOf7eoidYnomWjvkJaVCOedFiUoOJJXyuOWzzi4gbSlNUVRLufqV2kVjpfYBKFDL
 u06COgGmT8LtlMaSc0zJ61ITj8iCFQkTSz08xdvBVfiz0c4XgdKyEMbzyhmI5dSVw/Ug
 ABag==
X-Gm-Message-State: AOAM533K0TPpRhMlqobVLXCaxi4OLRhCJG7/ja0/34P7+1tjGU4jayeh
 mEmMfDP0ExHHPQn6swq6J9Q=
X-Google-Smtp-Source: ABdhPJy2pixIZqFIovlFcXsQYTpIiaXY4KfMYzOgWwdofof5tdX29oAHfep9AQ0wksJU1J4oI5B7QQ==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr21115749wrz.264.1633433873170; 
 Tue, 05 Oct 2021 04:37:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/28] dma-buf: use the new iterator in dma_resv_poll
Date: Tue,  5 Oct 2021 13:37:23 +0200
Message-Id: <20211005113742.1101-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

Simplify the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-buf.c | 36 ++++++------------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8242b5d9baeb..beb504a92d60 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -209,19 +209,14 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	dma_fence_put(fence);
 }
 
-static bool dma_buf_poll_shared(struct dma_resv *resv,
+static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 				struct dma_buf_poll_cb_t *dcb)
 {
-	struct dma_resv_list *fobj = dma_resv_shared_list(resv);
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i, r;
-
-	if (!fobj)
-		return false;
+	int r;
 
-	for (i = 0; i < fobj->shared_count; ++i) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-						  dma_resv_held(resv));
+	dma_resv_for_each_fence(&cursor, resv, write, fence) {
 		dma_fence_get(fence);
 		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
 		if (!r)
@@ -232,24 +227,6 @@ static bool dma_buf_poll_shared(struct dma_resv *resv,
 	return false;
 }
 
-static bool dma_buf_poll_excl(struct dma_resv *resv,
-			      struct dma_buf_poll_cb_t *dcb)
-{
-	struct dma_fence *fence = dma_resv_excl_fence(resv);
-	int r;
-
-	if (!fence)
-		return false;
-
-	dma_fence_get(fence);
-	r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
-	if (!r)
-		return true;
-	dma_fence_put(fence);
-
-	return false;
-}
-
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
 	struct dma_buf *dmabuf;
@@ -282,8 +259,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLOUT) {
-			if (!dma_buf_poll_shared(resv, dcb) &&
-			    !dma_buf_poll_excl(resv, dcb))
+			if (!dma_buf_poll_add_cb(resv, true, dcb))
 				/* No callback queued, wake up any other waiters */
 				dma_buf_poll_cb(NULL, &dcb->cb);
 			else
@@ -303,7 +279,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLIN) {
-			if (!dma_buf_poll_excl(resv, dcb))
+			if (!dma_buf_poll_add_cb(resv, false, dcb))
 				/* No callback queued, wake up any other waiters */
 				dma_buf_poll_cb(NULL, &dcb->cb);
 			else
-- 
2.25.1

