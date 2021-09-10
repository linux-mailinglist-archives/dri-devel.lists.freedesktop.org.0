Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D66406864
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5DA6E990;
	Fri, 10 Sep 2021 08:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34926E98F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x6so1426811wrv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qW+9yeXWdgQdV+++wShEfX/2r8PdvtzgR8RKF6D1Slo=;
 b=VzzUsjk0AEIRSeBRpV5cyDCOrSGL9w5QUkSlFheWQB/c9xHxQsZAqclnL/JGB+y3f3
 zNlWhIVVhqLTN9AavwmJJX6ADnNHQSgb7fRU7qce20FAYUwXFWg0UAU9jTWQY+Cl4CYO
 2YLJ1N16KKzW9x3EX/jZdoz7MuR6qttw2RAIuhNpqu6AbZYJUxJaE95SsgrG33RETAGY
 50fLxqhx462/l/nQ1eTKo9DdOkrYojZQ6Omp67DNoMlrD5WYtdLwypEiewKYWCoHRkp9
 BL5mr0+r4s1KMlm9PN5WAeBPWk8+Pg4lURDG/3QSNbTXDmHeiqct6Y5bU4BGVhYEQCNF
 XOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qW+9yeXWdgQdV+++wShEfX/2r8PdvtzgR8RKF6D1Slo=;
 b=n9CTw1GxAUdl0dd0zuZLwR+u9rN3BsLVfYfEvSaCsPojSFfuoUEuLBN9NB3gRi9gQu
 /V8Im61jdx8EyPgOyQBZjpoIEX9FQv75nfiR/bzm/vUZAg+duvxErpg3s5OpFgYcIzRe
 kfthhuBLlrPDUAT44/ZskC6KJ0NjIn9abGv2lh9FmKzfrTI4gIEYP9ywUzwAcMumBVOT
 tW/shkCAQV1zm3hgFir6pg7nWlg+Bw3B7m3qwqbXG+POSE5LuuNrxljzbLGKrk9HFcNX
 qx5wSKXbY9mYmbU0iPmvXEJALL7vPlPcoHGwnICwIL0IOraHoaTneFh02GjGJyTDIyre
 psUg==
X-Gm-Message-State: AOAM531hwx42wrEDHPrREipknmsFNB4Rv3D8rdNYGiEvK24b7ZxLJgxP
 2/9hq8gwp70cSnFqAKpT/6KGU+tmtcb9pI6C
X-Google-Smtp-Source: ABdhPJzEW++4UtO+2/WEXjNR4ZrvyQisPxmWGmjCsRmLMya0Yo65UWWhGodkfXL8zjWWriaK+QFhFw==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr8111801wrr.93.1631262422437;
 Fri, 10 Sep 2021 01:27:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 06/14] dma-buf: use new iterator in dma_resv_test_signaled
Date: Fri, 10 Sep 2021 10:26:47 +0200
Message-Id: <20210910082655.82168-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 54 +++++---------------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 645cf52a6a6c..cde5d448d029 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -593,22 +593,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -625,43 +609,19 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
 
 	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, test_all, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			rcu_read_unlock();
+			dma_fence_put(fence);
+			return false;
 		}
 	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
-
-	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

