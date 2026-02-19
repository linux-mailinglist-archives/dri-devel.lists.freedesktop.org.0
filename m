Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PnE+LoU1l2lBvwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73F160846
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC04E10E709;
	Thu, 19 Feb 2026 16:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KpgYRSPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E082B10E709
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:31 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so7391215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517310; x=1772122110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqVToHPilGc3rB1IlznFCmAYG7fAdkPbx5gcjGdkNEw=;
 b=KpgYRSPqjkxthoH5Xy8RtE1min1SgKLz0mAW6hDe5mYaNF/Eo2RxV1vr+TdTUjwHwy
 NtquCT+ZLTh5K6W+WzeoPC5e9VRm1NGu+WjeQsubt1U+tGXDzuZOU7YrwvWbpS3qzxDJ
 DOQiRdxNAjXp5Q+iJjfJp34bZ+Xubh5S1ccg8/9whifNL7s1WVNeeqJkgaZJ15N3X5j7
 oHy5IdnxeaG88rwP6E8inzsneLT2SX+5IkhjpfhNr08fyTPzeQFis9jqcbC0vhHY1mwz
 Lh/zIaR/SFDX7pMDaaR8qWGVCvgXm2mq84FC6ER04RuLmeQu3Gf5JmHPwxFjyISxRMnz
 w0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517310; x=1772122110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XqVToHPilGc3rB1IlznFCmAYG7fAdkPbx5gcjGdkNEw=;
 b=bWdwz9y3swoC5FkX5P/BFDwoMsUJfNZCDSPKI2eIV4kM0/LGyTgLa4K6qN25fbpEJk
 ci/bZKVyIxWo/AokN+Wa2kE4cTFo01jVG3PgK71aXn7zWftw+BcJiIl9dKQcVVdaQ53e
 8TGZyQrrSaYrvCPmvhLTwrkiyFHoPyB/iHV3HkAMcb9sbJtnh2sfnzIO8M4c7XrGFINW
 m9NOZr/TwLP1L8iv/3uCWUsEy63f6HTS47Wz45zSfeYVl/EW1orPlxB8jcJLGjQP+q78
 yWnLUuzJVkMQQAIA5uaU5HGtbn6PlxitHLJ0rgMWg17D+3gKyYSskmAye3UXBP1Mr+39
 rTLg==
X-Gm-Message-State: AOJu0YzsLWb13gCQme2Fn4YwDUKEQafsiORtTzesCG+WUVF/0RvAutId
 CaTwmoaRTgaZgDdZxJZISas98ntlhAxTmVI3NXQcuyTwIwrFj8rXrxDjc1Ung2kM+i0=
X-Gm-Gg: AZuq6aI2p2LN8/R7Kki2S6CKIR9rVhV8KZlKrtXtpz2pxq3XB3/AbY0CjbuqKkPiJx9
 l9JjOESUwgDrqOqRszLXbvDil7f8FmgBZwQ5uSsU+AGU0afJlKj7a0Z9DItY9g3OL021qWzEZW3
 nrbOh6eZm1AKUD3xv+mQZgeXzOxwYGGgEazaRUu/1deQLgElskN0ilCFPXG0MiW+TrFFLrtsVFZ
 Plm3G2NNuHs9N4L0f4Im+ULo5BUe672uFslQzdXPW3oEqV0HjyOShHGa0LIFiDxPf71fW5glgrt
 H/gcONGLYJO+FRO1xQTnaE7jmZE4suB2u/IUs30/pIbl+ieAw5/eO9POVYYmWX/TAMLoHUL12W/
 nk1jrJV+uO82RwNY1O39WU9Luj/BvVW9MRZKNhkdyS8Bkf0h1kklzKCeKMbGxHmBkhcHPscJ4ly
 EYWKMp8OW33Yup3Cgd29JvAx7YLBzDeKyQwJYw
X-Received: by 2002:a05:600c:548e:b0:480:6dff:e786 with SMTP id
 5b1f17b1804b1-48379bff816mr302613455e9.37.1771517310280; 
 Thu, 19 Feb 2026 08:08:30 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:29 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/8] dma-buf/selftests: test RCU ops and inline lock v2
Date: Thu, 19 Feb 2026 17:07:08 +0100
Message-ID: <20260219160822.1529-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219160822.1529-1-christian.koenig@amd.com>
References: <20260219160822.1529-1-christian.koenig@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CA73F160846
X-Rspamd-Action: no action

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

