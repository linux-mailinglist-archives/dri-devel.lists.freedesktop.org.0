Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FF8984F1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D26811B369;
	Thu,  4 Apr 2024 10:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="A5IOqBDQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="an4KobqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A311B369
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:25:38 +0000 (UTC)
Date: Thu, 4 Apr 2024 12:25:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1712226336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dEh1n11dTageq/8ewPi8o7mCyo3vL0piOaXle4WO7tE=;
 b=A5IOqBDQ7H+CzP6AA58DuCJJpHLygRtD8WUSq8N6xX+6xdr0olQdGClsJf+nSJ1dT+KKK+
 ciBQVNN0J85pudJuBAPr52Lql5OGlcfG82mvndtEIHqiwzWl59o/gfBG+N8sCdCZPkEtkn
 MsbGQn3SAxw09cAyh3axTnwteFB4FRxe+eqdZn09/9qg7ZuDqNe3pRSf8mIKWU6nzvGXxi
 SliwX1oqi3r0VtuGzUmFJo6RIPgMJ1/9LTKXt+owbMe6Je7w3oz8StznQ0dygZGi6rMp6G
 iidTOedobuAxwWDSpg0UEjJr4OGlPW1Crt+A4/79d6QjxS1uNAuFSl3/mGHqCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1712226336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dEh1n11dTageq/8ewPi8o7mCyo3vL0piOaXle4WO7tE=;
 b=an4KobqCB5UFT/FiaMHUtu+yZLx8QreJFSH+dYGLf7mDDaD6xoO68Q2kFmklAeHJSzFck/
 UeVi1LgEdagurvCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ttm/tests: Let ttm_bo_test consider different ww_mutex
 implementation.
Message-ID: <20240404102534.QTa80QPY@linutronix.de>
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

For the record, testing led to
| WARNING: CPU: 5 PID: 2089 at include/drm/ttm/ttm_bo.h:247 ttm_bo_reserve_no_wait_ticket+0xe8/0x150 [ttm_bo_test]

but this occurred with and without RT on v6.9-rc2.

 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc929..9cc367a795341 100644
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
@@ -142,7 +148,7 @@ static void ttm_bo_reserve_deadlock(struct kunit *test)
 	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 
 	ww_acquire_init(&ctx1, &reservation_ww_class);
-	mutex_lock(&bo2->base.resv->lock.base);
+	ww_mutex_base_lock(&bo2->base.resv->lock.base);
 
 	/* The deadlock will be caught by WW mutex, don't warn about it */
 	lock_release(&bo2->base.resv->lock.base.dep_map, 1);
-- 
2.43.0

