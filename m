Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAAE9CDC73
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4991A10E83D;
	Fri, 15 Nov 2024 10:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QML/eYUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0902210E835
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=haEsapmNWnqpWWLObyxx1NShh+D3I8+2RUxr+TIQDDA=; b=QML/eYUapBRh8s5xWaV2/Pf+3X
 /PvC72qIYjxAOcrjKTlau3hV3gakSgP/m7ZiXOV3VSDhbQYqD4/+zLq08bV0KY3paWb8aZTJhp2BJ
 5xpYl2g2gQcSrAHBImGwfB/2GHpcCvifEJLn85Tz71oSBZk8NrEOESvfd1FR1KzSU4xTDP4VlZw9y
 9AznezHjIAO9ybuuod9wIA2HOznevpac4DhSH/9VczbyrqkkVOzA1OIg/9XLICiElwgUfjpw9ckQL
 Wd8hX3pOjsKOJvd+/9PouXT5H0g150QeX1XROMxwxsu1kluy2CmDgrh6eHW+FMTOL/Hzd4SZCtJCm
 02Pz9OgA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tBtSh-007EAs-7E; Fri, 15 Nov 2024 11:21:59 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 5/5] dma-fence: Add some more fence-merge-unwrap tests
Date: Fri, 15 Nov 2024 10:21:53 +0000
Message-ID: <20241115102153.1980-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241115102153.1980-1-tursulin@igalia.com>
References: <20241115102153.1980-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

So far all tests use seqno one and only vary the context. Lets add some
tests which vary the seqno too.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 199 +++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 876eabddb08f..a3be888ae2e8 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -28,7 +28,7 @@ static const struct dma_fence_ops mock_ops = {
 	.get_timeline_name = mock_name,
 };
 
-static struct dma_fence *mock_fence(void)
+static struct dma_fence *__mock_fence(u64 context, u64 seqno)
 {
 	struct mock_fence *f;
 
@@ -37,12 +37,16 @@ static struct dma_fence *mock_fence(void)
 		return NULL;
 
 	spin_lock_init(&f->lock);
-	dma_fence_init(&f->base, &mock_ops, &f->lock,
-		       dma_fence_context_alloc(1), 1);
+	dma_fence_init(&f->base, &mock_ops, &f->lock, context, seqno);
 
 	return &f->base;
 }
 
+static struct dma_fence *mock_fence(void)
+{
+	return __mock_fence(dma_fence_context_alloc(1), 1);
+}
+
 static struct dma_fence *mock_array(unsigned int num_fences, ...)
 {
 	struct dma_fence_array *array;
@@ -304,6 +308,111 @@ static int unwrap_merge(void *arg)
 	return err;
 }
 
+static int unwrap_merge_duplicate(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	dma_fence_enable_sw_signaling(f1);
+
+	f2 = dma_fence_unwrap_merge(f1, f1);
+	if (!f2) {
+		err = -ENOMEM;
+		goto error_put_f1;
+	}
+
+	dma_fence_unwrap_for_each(fence, &iter, f2) {
+		if (fence == f1) {
+			dma_fence_put(f1);
+			f1 = NULL;
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_put(f2);
+error_put_f1:
+	dma_fence_put(f1);
+	return err;
+}
+
+static int unwrap_merge_seqno(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *f3, *f4;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+	u64 ctx[2];
+
+	ctx[0] = dma_fence_context_alloc(1);
+	ctx[1] = dma_fence_context_alloc(1);
+
+	f1 = __mock_fence(ctx[1], 1);
+	if (!f1)
+		return -ENOMEM;
+
+	dma_fence_enable_sw_signaling(f1);
+
+	f2 = __mock_fence(ctx[1], 2);
+	if (!f2) {
+		err = -ENOMEM;
+		goto error_put_f1;
+	}
+
+	dma_fence_enable_sw_signaling(f2);
+
+	f3 = __mock_fence(ctx[0], 1);
+	if (!f3) {
+		err = -ENOMEM;
+		goto error_put_f2;
+	}
+
+	dma_fence_enable_sw_signaling(f3);
+
+	f4 = dma_fence_unwrap_merge(f1, f2, f3);
+	if (!f4) {
+		err = -ENOMEM;
+		goto error_put_f3;
+	}
+
+	dma_fence_unwrap_for_each(fence, &iter, f4) {
+		if (fence == f3 && f2) {
+			dma_fence_put(f3);
+			f3 = NULL;
+		} else if (fence == f2 && !f3) {
+			dma_fence_put(f2);
+			f2 = NULL;
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f2 || f3) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_put(f4);
+error_put_f3:
+	dma_fence_put(f3);
+error_put_f2:
+	dma_fence_put(f2);
+error_put_f1:
+	dma_fence_put(f1);
+	return err;
+}
+
 static int unwrap_merge_order(void *arg)
 {
 	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
@@ -433,6 +542,87 @@ static int unwrap_merge_complex(void *arg)
 	return err;
 }
 
+static int unwrap_merge_complex_seqno(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5, *f6, *f7;
+	struct dma_fence_unwrap iter;
+	int err = -ENOMEM;
+	u64 ctx[2];
+
+	ctx[0] = dma_fence_context_alloc(1);
+	ctx[1] = dma_fence_context_alloc(1);
+
+	f1 = __mock_fence(ctx[0], 2);
+	if (!f1)
+		return -ENOMEM;
+
+	dma_fence_enable_sw_signaling(f1);
+
+	f2 = __mock_fence(ctx[1], 1);
+	if (!f2)
+		goto error_put_f1;
+
+	dma_fence_enable_sw_signaling(f2);
+
+	f3 = __mock_fence(ctx[0], 1);
+	if (!f3)
+		goto error_put_f2;
+
+	dma_fence_enable_sw_signaling(f3);
+
+	f4 = __mock_fence(ctx[1], 2);
+	if (!f4)
+		goto error_put_f3;
+
+	dma_fence_enable_sw_signaling(f4);
+
+	f5 = mock_array(2, dma_fence_get(f1), dma_fence_get(f2));
+	if (!f5)
+		goto error_put_f4;
+
+	f6 = mock_array(2, dma_fence_get(f3), dma_fence_get(f4));
+	if (!f6)
+		goto error_put_f5;
+
+	f7 = dma_fence_unwrap_merge(f5, f6);
+	if (!f7)
+		goto error_put_f6;
+
+	err = 0;
+	dma_fence_unwrap_for_each(fence, &iter, f7) {
+		if (fence == f1 && f4) {
+			dma_fence_put(f1);
+			f1 = NULL;
+		} else if (fence == f4 && !f1) {
+			dma_fence_put(f4);
+			f4 = NULL;
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f4) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_put(f7);
+error_put_f6:
+	dma_fence_put(f6);
+error_put_f5:
+	dma_fence_put(f5);
+error_put_f4:
+	dma_fence_put(f4);
+error_put_f3:
+	dma_fence_put(f3);
+error_put_f2:
+	dma_fence_put(f2);
+error_put_f1:
+	dma_fence_put(f1);
+	return err;
+}
+
 int dma_fence_unwrap(void)
 {
 	static const struct subtest tests[] = {
@@ -441,8 +631,11 @@ int dma_fence_unwrap(void)
 		SUBTEST(unwrap_chain),
 		SUBTEST(unwrap_chain_array),
 		SUBTEST(unwrap_merge),
+		SUBTEST(unwrap_merge_duplicate),
+		SUBTEST(unwrap_merge_seqno),
 		SUBTEST(unwrap_merge_order),
 		SUBTEST(unwrap_merge_complex),
+		SUBTEST(unwrap_merge_complex_seqno),
 	};
 
 	return subtests(tests, NULL);
-- 
2.46.0

