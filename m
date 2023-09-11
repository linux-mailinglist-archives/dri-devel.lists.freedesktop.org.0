Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7879A691
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C271F10E1A2;
	Mon, 11 Sep 2023 09:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188E210E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694423264; x=1725959264;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pEfd2WdFALj7J5gv13xort2+lXOY+FYQR4DouPlIBvk=;
 b=VE7+TER7KH7WymyO6q3qODzV0b+PI8YVX3fAPXzZxxDobj3ChVpQUrwU
 IvRUU/uu1hITNK+/sN0DUiaw+OtSZtjJ/4x4GuWBbteN+01NIPoJMFzu4
 xhjIgcqMuIcq7+pElQO+oEaNiaY7+3fYIxiHyo8OU0g75fGSpozR1qt3l
 dNHCCsd8StpP5SlBQYOLXUKHbGdrconA1oLEa4TSRe0FHzERqgGjNj+o3
 o/1HtZ0ROy6A8iecvGhz82E5tkTXRrRP8sU9FUDX510qC+yfwF96qQjag
 w4pC/k0VvJGyXmwwWkxlH4WfvuGdBLSbXfe5gv91NomKFd6zoCO00t2Oe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="380733197"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="380733197"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 02:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="833434079"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="833434079"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.185])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 02:07:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] locking/ww_mutex: Adjust to lockdep nest_lock requirements
Date: Mon, 11 Sep 2023 11:07:29 +0200
Message-ID: <20230911090729.5287-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/ww_mutex.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index bb763085479a..a401a2f31a77 100644
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
+	lockdep_init_map(&ctx->first_lock_dep_map, ww_class->mutex_name,
+			 &ww_class->mutex_key, 0);
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
-- 
2.41.0

