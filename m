Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D69CDC71
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3710E836;
	Fri, 15 Nov 2024 10:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PXaxHNCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77C910E835
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N1yj0jsAepEy9kVoLqQyfXKCQn4j4CPnFWv0BEBYmI0=; b=PXaxHNCVeg/poDKFKnWFEr1LL5
 T2rwBy4JiNi6wPG6xca/TP3PsRI7/AFflnXeplwRCUBei/ux03kIKLbV+WQo2yx6SXFdy1o7+Z62k
 J4Ko+FWkVNPkIQoh3FQ1QqkqrtfwTu0B16Hi6BlLf7owxOeTCaDZaC2Ywxk1NJ/f+C7emoWyXbinJ
 NrqYGRsFCwyYY9lCGuOIZOcVa1YCbgMpo87k7hBDYV+XQnhRj/TPeN0C7/mgH6eSEmODbQ3p8Ejzn
 0A4W6Rn80KofRKL2z0peg3uTMChdeQadu0junrMJJHyC6eVyL8VQQ84OQm+29yQcT/lRd0d3uYbYD
 Ubls1Kjg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tBtSg-007EAk-Gn; Fri, 15 Nov 2024 11:21:58 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 4/5] dma-buf: add selftest for fence order after merge
Date: Fri, 15 Nov 2024 10:21:52 +0000
Message-ID: <20241115102153.1980-5-tursulin@igalia.com>
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Add a test which double checks that fences are in the expected order
after a merge.

While at it also switch to using a mock array for the complex test
instead of a merge.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 69 ++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index f0cee984b6c7..876eabddb08f 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -304,6 +304,72 @@ static int unwrap_merge(void *arg)
 	return err;
 }
 
+static int unwrap_merge_order(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	dma_fence_enable_sw_signaling(f1);
+
+	f2 = mock_fence();
+	if (!f2) {
+		dma_fence_put(f1);
+		return -ENOMEM;
+	}
+
+	dma_fence_enable_sw_signaling(f2);
+
+	a1 = mock_array(2, f1, f2);
+	if (!a1)
+		return -ENOMEM;
+
+	c1 = mock_chain(NULL, dma_fence_get(f1));
+	if (!c1)
+		goto error_put_a1;
+
+	c2 = mock_chain(c1, dma_fence_get(f2));
+	if (!c2)
+		goto error_put_a1;
+
+	/*
+	 * The fences in the chain are the same as in a1 but in oposite order,
+	 * the dma_fence_merge() function should be able to handle that.
+	 */
+	a2 = dma_fence_unwrap_merge(a1, c2);
+
+	dma_fence_unwrap_for_each(fence, &iter, a2) {
+		if (fence == f1) {
+			f1 = NULL;
+			if (!f2)
+				pr_err("Unexpected order!\n");
+		} else if (fence == f2) {
+			f2 = NULL;
+			if (f1)
+				pr_err("Unexpected order!\n");
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f2) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_put(a2);
+	return err;
+
+error_put_a1:
+	dma_fence_put(a1);
+	return -ENOMEM;
+}
+
 static int unwrap_merge_complex(void *arg)
 {
 	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
@@ -327,7 +393,7 @@ static int unwrap_merge_complex(void *arg)
 		goto error_put_f2;
 
 	/* The resulting array has the fences in reverse */
-	f4 = dma_fence_unwrap_merge(f2, f1);
+	f4 = mock_array(2, dma_fence_get(f2), dma_fence_get(f1));
 	if (!f4)
 		goto error_put_f3;
 
@@ -375,6 +441,7 @@ int dma_fence_unwrap(void)
 		SUBTEST(unwrap_chain),
 		SUBTEST(unwrap_chain_array),
 		SUBTEST(unwrap_merge),
+		SUBTEST(unwrap_merge_order),
 		SUBTEST(unwrap_merge_complex),
 	};
 
-- 
2.46.0

