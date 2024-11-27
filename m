Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D829DA44A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245310EA3E;
	Wed, 27 Nov 2024 09:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbpjAyuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2810EA3B;
 Wed, 27 Nov 2024 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732698105; x=1764234105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h3CMnL4eliTX9gzLSTV1y6gHQDFmYxmyCKxh3w3Jy2k=;
 b=RbpjAyuw3lYcFNu2ZxeO71Q5f6VsMdSTbvKYZAtpllbrjbvYwOXIDqki
 qeJNq3mR2TZo8Y/Yz2oKYEfaTj1T02KPQNWPuOfKdqJB5bJGmYky3SAHf
 dZydJjo/FqhcmhnzVM8NCksvu15SZ3dVBWLmAWy/sjT2je282uMcMS+zh
 laVGBX13h72XfvRJ3GoNbPllrqmmu8fdSMvoBo8Ze5SoBo5EvfrQGR6SO
 gqnjYDJ9cEKNZfYBVbCRzQZxlG0BDwDKiKr1YKOacrDdxE8pT6tsK1ATV
 9d2K4gjyN1NN0QPKWey8NOa/86uOnsEyx9pskXGvFRML4UXgqS8+z+9RI Q==;
X-CSE-ConnectionGUID: /pYye/4hRP6FipCQ9YIWNg==
X-CSE-MsgGUID: urUFDL6ITDejduE/58Js4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32642289"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32642289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:54:47 -0800
X-CSE-ConnectionGUID: gornYM1SR22nc/eA2n46mw==
X-CSE-MsgGUID: L7UM9o2cQUaYxolxdRcCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="91826973"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.103])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:54:44 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Maarten Lankhorst <maarten@lankhorst.se>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] locking/ww_mutex: Fix ww_mutex dummy lockdep map selftest
 warnings
Date: Wed, 27 Nov 2024 09:54:30 +0100
Message-ID: <20241127085430.3045-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

The below commit introduces a dummy lockdep map, but didn't get
the initialization quite right (it should mimic the initialization
of the real ww_mutex lockdep maps). It also introduced a separate
locking api selftest failure. Fix these.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Maarten Lankhorst <maarten@lankhorst.se>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Reported-by: Boqun Feng <boqun.feng@gmail.com>
Closes: https://lore.kernel.org/lkml/Zw19sMtnKdyOVQoh@boqun-archlinux/
Fixes: 823a566221a5 ("locking/ww_mutex: Adjust to lockdep nest_lock requirements")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/ww_mutex.h | 4 ++--
 lib/locking-selftest.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index a401a2f31a77..45ff6f7a872b 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -156,8 +156,8 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
 	debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
 	lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
 			 &ww_class->acquire_key, 0);
-	lockdep_init_map(&ctx->first_lock_dep_map, ww_class->mutex_name,
-			 &ww_class->mutex_key, 0);
+	lockdep_init_map_wait(&ctx->first_lock_dep_map, ww_class->mutex_name,
+			      &ww_class->mutex_key, 0, LD_WAIT_SLEEP);
 	mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
 	mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx->dep_map, _RET_IP_);
 #endif
diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index 6e0c019f71b6..ed99344317f5 100644
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
2.47.0

