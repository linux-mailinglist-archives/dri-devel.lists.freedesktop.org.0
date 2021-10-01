Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB1B41EA76
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2294A6EDA6;
	Fri,  1 Oct 2021 10:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B7B6EDC5;
 Fri,  1 Oct 2021 10:06:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso6381866wme.0; 
 Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oUqNlwRJHuQB2mIRsKmTeRaOwkcWmdtZ6villVsEcY=;
 b=Czbm+9usHUFKPdcRQ2WYOrvJ0RF3b5jz4tkhBVrUnY2ybN33X6b1Z4nJz/DRThDH73
 zHa1Nl9QIRSpHLCYzmRlX+4bO5htIukCw9FoCdKjJhsfNHSQNNscizt7USHQqJHzGS+9
 HCx/+vA8WPC+IwhVRd0tNfZ3Ah7mWuZwjFn7V3UMrVPOJxQ8ZTuGIBw1jZNUxOvDjlqC
 CCLOnn88N5PZSNwYlWYoHfHiJwJJoSOSGHBlCViLCGwdQHSBll26BgvmwyZLMDI03nQl
 gOqnG3BlTFz2rN1HyBGMan85SRQhjRX2BRi3NN83iwEEr7kej+4o56DCBhas/5W2RTJf
 zRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oUqNlwRJHuQB2mIRsKmTeRaOwkcWmdtZ6villVsEcY=;
 b=JgORKF/zPcGA4I+J9LSSei1ZxiUozX/e/lzw3F80QwJqdpr/w+FsJwBw+TeFIaMi+/
 KKTgb3ijohSk3Qrz/fLqLiHAVKX/L0m4blxDht6orpEKxCUXMF21D7Otkr0pW5j0s+Pn
 t3rWueAumOrf0TL2oFwx2b42BkgstQ7b0sy1BalyPYMaCjqjzWcTkM0crPfLGQrWsIUb
 yrRwRBId1bJYQs02SUQleWu9y+A00Uw1grTobDUZAN6fPnWFIcq5ZxDk0N19Zncnvcj9
 XItWPOnzQhl/R+WUHqYmNPoKLJFs4u47LA7pllQ3I0UCvHFB92YrgyTX/zkz1tQXhxfq
 57dg==
X-Gm-Message-State: AOAM533BnqkQIV47EPm4M7HF89eoxPM5vEQAYQ46nc9wZIQ2cAUs5tn0
 DhpmRF8QnHHEYZ6BmmwPKH8=
X-Google-Smtp-Source: ABdhPJyJ9+sUT94cagH8ST7a3wE9TSF5SLVIKCTHVtTtHAGvOEn+x/WN9d8Ez2+gly8HzfXpfBGnTw==
X-Received: by 2002:a05:600c:4e93:: with SMTP id
 f19mr3535149wmq.185.1633082781519; 
 Fri, 01 Oct 2021 03:06:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/28] dma-buf: use the new iterator in dma_resv_poll
Date: Fri,  1 Oct 2021 12:05:51 +0200
Message-Id: <20211001100610.2899-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

