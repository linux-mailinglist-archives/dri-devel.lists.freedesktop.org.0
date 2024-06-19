Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106BF90F100
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1D410ECE4;
	Wed, 19 Jun 2024 14:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Ypr2aSs4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fd0HoWei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D810ECE4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:46:34 +0000 (UTC)
Date: Wed, 19 Jun 2024 16:46:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1718808391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=r4XHX4a0/67+odur9z9VK14lZfXxPBqqOWfxzRyf+X8=;
 b=Ypr2aSs4sNx4Or9Mx2JEM7hKSk8f8leYJPCjwyVcw6Vyu8nicdtsCIFafCmZ8nkVWNFYhp
 ClCPL/yp5mLegvbvWGrODJTGN7j9f0XlcuuoF3puKWTrWaLUs8uSi4PCUVhJw7CEvht/YX
 ku09MW33/V5eEM22ufDjw04eC2eag1HOliT9tk+eXjPAR4Wum5kt9WWV+CtjHu6ZbQSpid
 4JvQgnlmMWaM9r+Ic1cs1mqzMB1Smc3mH9nTNdliEJ7JTdAKXeC3YZAp4tMJ4fpbkQTOPq
 bfyQnCsZrGCMh5VWNycPOIvEKVt3TgW0ihkeSGras4DeoCnZiA4OIEX5A6J8IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1718808391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=r4XHX4a0/67+odur9z9VK14lZfXxPBqqOWfxzRyf+X8=;
 b=fd0HoWeiTJiK9ueel5BB9P7LbfdvT5S7fYC2q9ArQkio03BS1RSYE/DMObT+8gHYR83El4
 mqqryIXnOvmvboDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Huang Rui <ray.huang@amd.com>, Ingo Molnar <mingo@redhat.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Subject: [PATCH REPOST^2] drm/ttm/tests: Let ttm_bo_test consider different
 ww_mutex implementation.
Message-ID: <20240619144630.4DliKOmr@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

PREEMPT_RT has a different locking implementation for ww_mutex. The
base mutex of struct ww_mutex is declared as struct WW_MUTEX_BASE. The
latter is defined as `mutex' for non-PREEMPT_RT builds and `rt_mutex'
for PREEMPT_RT builds.

Using mutex_lock() directly on the base mutex in
ttm_bo_reserve_deadlock() leads to compile error on PREEMPT_RT.

The locking-selftest has its own defines to deal with this and it is
probably best to defines the needed one within the test program since
their usefulness is limited outside of well known selftests.

Provide ww_mutex_base_lock() which points to the correct function for
PREEMPT_RT and non-PREEMPT_RT builds.

Fixes: 995279d280d1e ("drm/ttm/tests: Add tests for ttm_bo functions")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

I posted this path https://lore.kernel.org/r/20240404102534.QTa80QPY@linutronix.de
Then I reposted it https://lore.kernel.org/r/20240613064716.WxAIvb9K@linutronix.de
and learned from Christian Koenig that can't review it.

Could someone please add it their tree (drm, locking, misc, akpm) so
that it gets merged upstream?

 drivers/gpu/drm/ttm/tests/ttm_bo_test.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -18,6 +18,12 @@
 
 #define BO_SIZE		SZ_8K
 
+#ifdef CONFIG_PREEMPT_RT
+#define ww_mutex_base_lock(b)			rt_mutex_lock(b)
+#else
+#define ww_mutex_base_lock(b)			mutex_lock(b)
+#endif
+
 struct ttm_bo_test_case {
 	const char *description;
 	bool interruptible;
@@ -142,7 +148,7 @@ static void ttm_bo_reserve_deadlock(stru
 	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 
 	ww_acquire_init(&ctx1, &reservation_ww_class);
-	mutex_lock(&bo2->base.resv->lock.base);
+	ww_mutex_base_lock(&bo2->base.resv->lock.base);
 
 	/* The deadlock will be caught by WW mutex, don't warn about it */
 	lock_release(&bo2->base.resv->lock.base.dep_map, 1);
