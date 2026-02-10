Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLUHDfgGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFA119979
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B62110E546;
	Tue, 10 Feb 2026 10:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5HMITL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8654010E544
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4834826e555so15715635e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718960; x=1771323760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqVToHPilGc3rB1IlznFCmAYG7fAdkPbx5gcjGdkNEw=;
 b=T5HMITL296SzI94Itg5jNPlHp/ybbGg/VGaEtT02RAFr33M3P9TKHN4SCbQsmBYKHY
 TBM0jzIhM7eGQR6Ete9xyMesYYSR3uSz/OsTUWx//Uh1AEZraBhm2HzeX7vCD6XvpDsf
 G8QxSjvd4Dsy+PdOb836UyOHMJsA7030QsUPzHCnIMuyWDmQwR1VRAYf0de//1yAf/zR
 MxeIVMVMDfBOomqjSJZ9nLBGxOo5g4AsmbHR67CcevfLSwHwUcVYIY2auWZCEPPo0i6E
 6vDuvVjQEQdE4Z+k8rpcfYAnY3Lh5kgHvb56xkf640IIFUoX+NMT2ZuIIwmSDw7o5bTH
 b9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718960; x=1771323760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XqVToHPilGc3rB1IlznFCmAYG7fAdkPbx5gcjGdkNEw=;
 b=GBGg//OYUHa3cm4mXpbJzxAYmD9ndG5nWGP24YMnkN/YYawFm3WnZrdapfuojLC5e5
 E4QUxRUxb/lMYhTMPfc0tkHA8G9hVY7lxlPFlbvA5Tu7N1enJEe+3ndgoARlPuQIkSPN
 PcmKOfyQNWlXKXlaAOdHQHgzhU9QO9a75jy2GlK/RIbQEmrzYbNbfS8D8gkCOQRKdGEC
 blG2aBlnLyqt5fpNofqc21w8aXpAl6RkMrYrviXPLjW9Pzge2KRaM8bfP81WLZQ06tU5
 gaUVcJHic0oqQd+cE55aIUSaQ/avT5xu+r260zXdWnjIGlS25jtyez9iRceFwHp4IC5C
 vdEw==
X-Gm-Message-State: AOJu0YxwtA+a6S2YKCtI/R7RAlCoeSrQZICX78Sz9iUfjmu+Ed3vvY3b
 kkaehrN07920FVMEML6aTvJPD4aCAgM7URVot+f275drDPWEXDpuI3rv
X-Gm-Gg: AZuq6aIq62uNFX1BWiUpNtqIGwUpu29xe4irWHLx6xbpTTQUhWiSeH+zLuQfBKe5Jd/
 iRU3QCTiH1SKq13BRqSOr2ayecW0XKuFhVLhkn7s3Fn93/fJgl+xNDQs143U7ztN3+cdm9OMy7N
 2QoB6I8y6gtJ1CXJWGGI5gdVSD5q9dgTiTrcfFYs+z+bW8HpVDvTqFHz9IMLijYp7Ai1hFQz5z7
 e9XRkKoheiVgbpFZ1PMloFJn+M+vTEgz5G2JcOAV4XXb4eAKWZlB44eOX1SwvCnsgdUAFgF5h0n
 nUM4GRoxfaqOIwNRmUXMNT6SpL5lz30jc19swDjJwMOsrtqZNgr0lpcLng6Q7hHVCoegO0oBqLm
 CbJLKNJazgRs75dKaaMZBBPHLpE6cGw4ut1dfKR0fAvFqr3OQc+AO13JtFoczVuCx9AIoRnOV8U
 +wPSSb7qu5IlLrW8TyeQo+qfils3gYntF+l0e6
X-Received: by 2002:a05:600c:4748:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-483201e46c9mr190064615e9.11.1770718959551; 
 Tue, 10 Feb 2026 02:22:39 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/8] dma-buf/selftests: test RCU ops and inline lock v2
Date: Tue, 10 Feb 2026 11:02:00 +0100
Message-ID: <20260210102232.1642-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210102232.1642-1-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: D6AFA119979
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

