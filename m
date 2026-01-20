Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D6D3C651
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4E10E5BC;
	Tue, 20 Jan 2026 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jvBq+O6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D90810E5B7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so34265535e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906624; x=1769511424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqVToHPilGc3rB1IlznFCmAYG7fAdkPbx5gcjGdkNEw=;
 b=jvBq+O6eo3QkO4asOAab+8BrRJMUfyMXQi/3LCEcCvAj+wV9NGwp88tIxOkxrRFEVw
 w2xNUiLY3/tIxzcaKO4S3tyjeycslnDgzKAqJhdA6wU39op+fE6wg6mfUvYOFYJR9ZYh
 2xf2CHKNku5N17ZADEpKZ/K5/6OTH7iy3/3pXxrIJeD/LBt4hQQ/XtHeO1dU8HDl2+3x
 jlpPGiHj5Xca9npCfXwHhdUFOl52EpH+Qp0SbVqe27w06+NB1sF7QXYpxFyNb+kBRVGA
 kCXXIoxWC3Q5E4F2C/dbpgtVJ/6ZVIJsmZs0MTj/epz5GUDXPTzl2VQcxnjgpP0BL9mz
 v0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906624; x=1769511424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XqVToHPilGc3rB1IlznFCmAYG7fAdkPbx5gcjGdkNEw=;
 b=jhR3LxJmr4CIz4fZMKEVLatCAJY/dWhU0oi0t6tFeCSbz3JPBjd5D/KPCZi+YbLEHo
 inxnkAwGdcCx5JcSuk58JIqbnW3WOcU5Fpnchp8eh0fKWOZe4hz2VCnI4PGLJF45roy6
 pH2c9u2KWD0po+s4cC6wK3ZGxzGcEj+dB5cH7k3svAN2E/0nW1v/29tblQL6zbZ6N4RU
 qoGS0W/cAfySrg5SmY4BT+VjFLcVwOZJXz2TyJgUWTXzc833m186NBaRA320eOLw7Omi
 kmP9l9OdVjufVGeqD/3eEVFNDGTNbTj9HnRx0fmsDBjdXpjQviT49InO6mDORC2Svz5H
 eelA==
X-Gm-Message-State: AOJu0YzbZvSBi9eBz8pWngTLdVC5QxR6y7bCCSzq5f0AgE22QREYsjtr
 iR9s8vEXnFcfqxDMHuaBRIMrGs65DkDNKZ+Nvj2WjXBiB2y1vCOqExwg
X-Gm-Gg: AY/fxX4yUkcv58z9BeaNSxVNAsVd6etC8wLzecPbyZ327Ew1tLEZ4l8hUwPerzyXd2o
 4S+No+NpU3Wiul0VCYY7UYUIlyVcb1sfqLtKy9TW69f9udnthTffgD5Kwc/UqZvCX9/3r/npLZh
 wKYDmOBQTY6QdLgSS3H0JLFfP16tE2RuXLEOc+b1bIvSx3SQbWigJyDiH/Bxdjed+cJfCu2miam
 KOW0GGf5moW8CcOrlguoi+GCFVJI1IiXARERfVSMnSGQynSp6kvP14DdWKEywzfuXeUn2d5sMLe
 l/2jxuNrQlE31DTwjFL023CLA96S/jIQEE6N4DoUH/xPFwE2YrH+cIzhr2tUIK9UVRn4RqNB/9y
 mnXyvoaHRcGqdElj05RN5mbKPhQfAzhK1Va3NPmQxJU1jIMGIbWEb/v8zi8hejga8/w1NJpd+wd
 YiAMNF4+H279soEOroGBUTu7Os
X-Received: by 2002:a05:600c:4692:b0:47d:3ead:7439 with SMTP id
 5b1f17b1804b1-4803f44a19amr13651685e9.37.1768906623487; 
 Tue, 20 Jan 2026 02:57:03 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:57:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/9] dma-buf/selftests: test RCU ops and inline lock v2
Date: Tue, 20 Jan 2026 11:54:45 +0100
Message-ID: <20260120105655.7134-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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

Drop the mock_fence and the kmem_cache, instead use the inline lock and
test if the ops are properly dropped after signaling.

v2: move the RCU check to the end of the test

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/st-dma-fence.c | 44 ++++++++--------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 5d0d9abc6e21..0d9d524d79b6 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -14,43 +14,26 @@
 
 #include "selftest.h"
 
-static struct kmem_cache *slab_fences;
-
-static struct mock_fence {
-	struct dma_fence base;
-	struct spinlock lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
-
 static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
 
-static void mock_fence_release(struct dma_fence *f)
-{
-	kmem_cache_free(slab_fences, to_mock_fence(f));
-}
-
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
-	.release = mock_fence_release,
 };
 
 static struct dma_fence *mock_fence(void)
 {
-	struct mock_fence *f;
+	struct dma_fence *f;
 
-	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
 	if (!f)
 		return NULL;
 
-	spin_lock_init(&f->lock);
-	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
-
-	return &f->base;
+	dma_fence_init(f, &mock_ops, NULL, 0, 0);
+	return f;
 }
 
 static int sanitycheck(void *arg)
@@ -100,6 +83,11 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
+	if (rcu_dereference_protected(f->ops, true)) {
+		pr_err("Fence ops not cleared on signal\n");
+		goto err_free;
+	}
+
 	err = 0;
 err_free:
 	dma_fence_put(f);
@@ -540,19 +528,7 @@ int dma_fence(void)
 		SUBTEST(test_stub),
 		SUBTEST(race_signal_callback),
 	};
-	int ret;
 
 	pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
-
-	slab_fences = KMEM_CACHE(mock_fence,
-				 SLAB_TYPESAFE_BY_RCU |
-				 SLAB_HWCACHE_ALIGN);
-	if (!slab_fences)
-		return -ENOMEM;
-
-	ret = subtests(tests, NULL);
-
-	kmem_cache_destroy(slab_fences);
-
-	return ret;
+	return subtests(tests, NULL);
 }
-- 
2.43.0

