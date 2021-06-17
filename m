Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D713AB23C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65326E8E8;
	Thu, 17 Jun 2021 11:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1A26E115
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id i13so3441639edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xl1Z5pt8CfNzK8P+30y9KR+Njohg46PKrHJ0MHxGVhM=;
 b=RUZspJerSlauoLqeCHoGlNOOWVujbPNfqudZ0ORdCINHOxId84sz9H/GQYZjYx2BGm
 WPSE5JXHXhbDHpYHVHjepznWbfKU8oGcM4eSCMXaSGCkbDJPAsFErqd0pYlkq2Fe3Fzs
 Ru1OLtoRZd8MB1u9zSj05A3jh0LMWZA6fqQcqJFncYN6r1iKZXJnHqInNp0giTqKcEW3
 eqvNuoSWp1fGRTZ/3qMHf+QnM57GGXIAg9ZTKcPVKycYCw8+srNVykEIwAhndZVjExFy
 QMFdivUzyagRrLAu3Ycis+/DvfLDJVApipfIF8o9l5AYEs18rpRpzIOZuL0nkw29oIj1
 VEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xl1Z5pt8CfNzK8P+30y9KR+Njohg46PKrHJ0MHxGVhM=;
 b=n9x9B37iV5mnlhPUB9j8DAdXg694vYFk8sUjzsN717r3FIA4mlBS/cfKzyVfpPFAih
 VxnMwpej1A3twv7COkkFf9hwELnRKmDxURrtVMoXai/lxyotWI+mrQZkyE3lLUzOqFd8
 cypX+iWf+zLpPYhf/fdqtt7XIMMmaFfGb9WvjPNKYEbHyimR6uUryFj7W4eM3FB4CWYD
 H93AGyisA/acPszjngRJ4Jca6/N6ePmhaSJc6OuPOTB/yyq2+GTtSB2FOMVyqC+yJo1i
 w1tW0MNS2QvagjGw3+g/jfRJFgNVwhNuJMjxs18aExCc9bZI2WLm9v4x1isv1C5v2UxT
 neVA==
X-Gm-Message-State: AOAM533JWcIabHyVzm7kMFQwOan4XRnwK05JVwPwcmhOdz2oE85MBdV4
 sIRQN1biA/2kr2i/mAsbFhc=
X-Google-Smtp-Source: ABdhPJzeDo2Tbf1vXUedAei37ItrPOvsfX320YeV5SkZ+q9uzU8nEo9TjkFZ62EcQZbfm+g0w5OyVw==
X-Received: by 2002:aa7:d892:: with SMTP id u18mr5878105edq.196.1623928566110; 
 Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 07/16] dma-buf: use new iterator in dma_buf_poll
Date: Thu, 17 Jun 2021 13:15:49 +0200
Message-Id: <20210617111558.28486-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 49 ++++-----------------------------------
 1 file changed, 4 insertions(+), 45 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b67fbf4e3705..4173f1f70ac1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -207,15 +207,13 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
+	struct dma_resv_cursor cursor;
 	struct dma_buf_poll_cb_t *dcb;
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence_excl;
-	unsigned shared_count, seq;
 	struct dma_fence *fence;
 	__poll_t events;
-	int r, i;
+	int r;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -241,53 +239,14 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	if (!events)
 		return 0;
 
-retry:
-	seq = read_seqcount_begin(&resv->seq);
-	rcu_read_lock();
-
-	fobj = rcu_dereference(resv->fence);
-	if (fobj && events & EPOLLOUT)
-		shared_count = fobj->shared_count;
-	else
-		shared_count = 0;
-
-	for (i = 0; i < shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-		fence = dma_fence_get_rcu(fence);
-		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
-			/* Concurrent modify detected, force re-check */
-			dma_fence_put(fence);
-			rcu_read_unlock();
-			goto retry;
-		}
-
-		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
-		if (!r) {
-			/* Callback queued */
-			events = 0;
-			goto out;
-		}
-		dma_fence_put(fence);
-	}
-
-	fence = dma_resv_excl_fence(resv);
-	if (fence) {
-		fence = dma_fence_get_rcu(fence);
-		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
-			/* Concurrent modify detected, force re-check */
-			dma_fence_put(fence);
-			rcu_read_unlock();
-			goto retry;
-
-		}
-
+	dma_resv_for_each_fence_unlocked(resv, &cursor, events & EPOLLOUT,
+					 fence) {
 		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
 		if (!r) {
 			/* Callback queued */
 			events = 0;
 			goto out;
 		}
-		dma_fence_put(fence_excl);
 	}
 
 	/* No callback queued, wake up any additional waiters. */
-- 
2.25.1

