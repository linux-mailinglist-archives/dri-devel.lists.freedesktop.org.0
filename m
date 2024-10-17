Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D39A2620
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 17:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B443810E861;
	Thu, 17 Oct 2024 15:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btN0CXLs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D710E85A;
 Thu, 17 Oct 2024 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177826; x=1760713826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6XP/LzTB3nvKYFWkVuM1f8jskS31WWEbgTeV8UCE0d8=;
 b=btN0CXLs4Z1lAqptz3w4tTk6D5lPC6XheemZUIbHhyxcsIGve9IRtCB9
 32cKmKYFUZ3y1XPecrnmSbuuHDK9lnxX0vtc8HGR8efPSXYc1R4C5CNni
 29/uuTQ33oRs6acovgzPRLn3nQUbPK1prYCi9DJ6lBeZjEvFkKxHLrhaN
 9ro7S38gjTcvBgra5bFYfAGR0teXEqgTYgtMgZ4ortlJumDNG7iZrV5uW
 k1H39DTtAIz9wpULEQrO9i+YgzJ7BJKFMAFDHLiqOs5KofEo0MRkDqTrn
 5kqefjRtmDy8jCPIqimtuZNvn7nAbV99oxy8TvaXJMvj8AwPbrzi7OCHB g==;
X-CSE-ConnectionGUID: faMBtudFRFK6zT93e8X4/g==
X-CSE-MsgGUID: 31UqqXWtQvK+iD5H/6KyGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32351257"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32351257"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:10:26 -0700
X-CSE-ConnectionGUID: VZBLmX2CTKqnKAJCN9HErw==
X-CSE-MsgGUID: BxKVCxrIRHe9gJtNIRMSzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="101885038"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.150])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:10:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Maarten Lankhorst <maarten@lankhorst.se>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3] locking/ww_mutex: Adjust to lockdep nest_lock requirements
Date: Thu, 17 Oct 2024 17:10:07 +0200
Message-ID: <20241017151007.92215-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

When using mutex_acquire_nest() with a nest_lock, lockdep refcounts the
number of acquired lockdep_maps of mutexes of the same class, and also
keeps a pointer to the first acquired lockdep_map of a class. That pointer
is then used for various comparison-, printing- and checking purposes,
but there is no mechanism to actively ensure that lockdep_map stays in
memory. Instead, a warning is printed if the lockdep_map is freed and
there are still held locks of the same lock class, even if the lockdep_map
itself has been released.

In the context of WW/WD transactions that means that if a user unlocks
and frees a ww_mutex from within an ongoing ww transaction, and that
mutex happens to be the first ww_mutex grabbed in the transaction,
such a warning is printed and there might be a risk of a UAF.

Note that this is only problem when lockdep is enabled and affects only
dereferences of struct lockdep_map.

Adjust to this by adding a fake lockdep_map to the acquired context and
make sure it is the first acquired lockdep map of the associated
ww_mutex class. Then hold it for the duration of the WW/WD transaction.

This has the side effect that trying to lock a ww mutex *without* a
ww_acquire_context but where a such context has been acquire, we'd see
a lockdep splat. The test-ww_mutex.c selftest attempts to do that, so
modify that particular test to not acquire a ww_acquire_context if it
is not going to be used.

v2:
- Lower the number of locks in the test-ww_mutex
  stress(STRESS_ALL) test to accommodate the dummy lock
  introduced in this patch without overflowing lockdep held lock
  references.

v3:
- Adjust the ww_test_normal locking-api selftest to avoid
  recursive locking (Boqun Feng)
- Initialize the dummy lock map with LD_WAIT_SLEEP to agree with
  how the corresponding ww_mutex lockmaps are initialized
  (Boqun Feng)

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Maarten Lankhorst <maarten@lankhorst.se>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: maarten.lankhorst@linux.intel.com #v1
---
 include/linux/ww_mutex.h       | 14 ++++++++++++++
 kernel/locking/test-ww_mutex.c |  8 +++++---
 lib/locking-selftest.c         |  4 ++--
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index bb763085479a..45ff6f7a872b 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -65,6 +65,16 @@ struct ww_acquire_ctx {
 #endif
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lockdep_map dep_map;
+	/**
+	 * @first_lock_dep_map: fake lockdep_map for first locked ww_mutex.
+	 *
+	 * lockdep requires the lockdep_map for the first locked ww_mutex
+	 * in a ww transaction to remain in memory until all ww_mutexes of
+	 * the transaction have been unlocked. Ensure this by keeping a
+	 * fake locked ww_mutex lockdep map between ww_acquire_init() and
+	 * ww_acquire_fini().
+	 */
+	struct lockdep_map first_lock_dep_map;
 #endif
 #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
 	unsigned int deadlock_inject_interval;
@@ -146,7 +156,10 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
 	debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
 	lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
 			 &ww_class->acquire_key, 0);
+	lockdep_init_map_wait(&ctx->first_lock_dep_map, ww_class->mutex_name,
+			      &ww_class->mutex_key, 0, LD_WAIT_SLEEP);
 	mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
+	mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx->dep_map, _RET_IP_);
 #endif
 #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
 	ctx->deadlock_inject_interval = 1;
@@ -185,6 +198,7 @@ static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)
 static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
 {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
+	mutex_release(&ctx->first_lock_dep_map, _THIS_IP_);
 	mutex_release(&ctx->dep_map, _THIS_IP_);
 #endif
 #ifdef DEBUG_WW_MUTEXES
diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 10a5736a21c2..5d58b2c0ef98 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -62,7 +62,8 @@ static int __test_mutex(unsigned int flags)
 	int ret;
 
 	ww_mutex_init(&mtx.mutex, &ww_class);
-	ww_acquire_init(&ctx, &ww_class);
+	if (flags & TEST_MTX_CTX)
+		ww_acquire_init(&ctx, &ww_class);
 
 	INIT_WORK_ONSTACK(&mtx.work, test_mutex_work);
 	init_completion(&mtx.ready);
@@ -90,7 +91,8 @@ static int __test_mutex(unsigned int flags)
 		ret = wait_for_completion_timeout(&mtx.done, TIMEOUT);
 	}
 	ww_mutex_unlock(&mtx.mutex);
-	ww_acquire_fini(&ctx);
+	if (flags & TEST_MTX_CTX)
+		ww_acquire_fini(&ctx);
 
 	if (ret) {
 		pr_err("%s(flags=%x): mutual exclusion failure\n",
@@ -679,7 +681,7 @@ static int __init test_ww_mutex_init(void)
 	if (ret)
 		return ret;
 
-	ret = stress(2047, hweight32(STRESS_ALL)*ncpus, STRESS_ALL);
+	ret = stress(2046, hweight32(STRESS_ALL)*ncpus, STRESS_ALL);
 	if (ret)
 		return ret;
 
diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index 6f6a5fc85b42..6750321e3e9a 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -1720,8 +1720,6 @@ static void ww_test_normal(void)
 {
 	int ret;
 
-	WWAI(&t);
-
 	/*
 	 * None of the ww_mutex codepaths should be taken in the 'normal'
 	 * mutex calls. The easiest way to verify this is by using the
@@ -1770,6 +1768,8 @@ static void ww_test_normal(void)
 	ww_mutex_base_unlock(&o.base);
 	WARN_ON(o.ctx != (void *)~0UL);
 
+	WWAI(&t);
+
 	/* nest_lock */
 	o.ctx = (void *)~0UL;
 	ww_mutex_base_lock_nest_lock(&o.base, &t);
-- 
2.46.0

