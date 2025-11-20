Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C39C739C9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 12:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A0410E1E7;
	Thu, 20 Nov 2025 11:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cz/YSM+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42E810E1E7;
 Thu, 20 Nov 2025 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763636682; x=1795172682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJ9+AHKcuOWPh52l0sFwdJo0i/z7RcPFiHsIZr076JA=;
 b=Cz/YSM+G2SYBY2/tabAXjsp7GoYWHIHy1QA8iLns0eD/r61dl1CYsLMY
 RPfvaRWeIOZNOu11U1WIuoJBE+MdnPPwgzcC73BKdbhfvLzUo/hrgsiX2
 QHRtZBhn495T2txTOzWLDkOBdrNRcTQwO/wXMk5VPmhtdYjakiRffMFT+
 N3LWNlGHZMX7dDr1MAKSWUlhbkI/xNZh4ccyvabQT5lB+IhDRfONTLseS
 6//sTXP0KkZ1YHPNe9xoKBXPEcSmk4L3qKoZzFcpLcF78U3J6iE0T2jzc
 t+RCnmeTIsJwU+OG4px40mQW6tW3SvtK0Kwme4ejT3TcNZKvA9eHwUamP g==;
X-CSE-ConnectionGUID: oc94kC3rS4uUx+z/AlBGQQ==
X-CSE-MsgGUID: JejVr4WUR5mI+i0Kcce0fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68308014"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="68308014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 03:04:41 -0800
X-CSE-ConnectionGUID: +0IbbpFWSYGhstTHsbJhsQ==
X-CSE-MsgGUID: Zv9oplZMR/ml0fWkFf0Mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="228643711"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 03:04:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 1/2] kernel/locking/ww_mutex: Add per-lock lock-check
 helpers
Date: Thu, 20 Nov 2025 12:03:40 +0100
Message-ID: <20251120110341.2425-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
References: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
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

Code using ww_mutexes typically by design have a number of
such mutexes sharing the same ww_class, and within a ww transaction
they are all lockdep annotated using a nest_lock which means
that multiple ww_mutexes of the same lockdep class may be locked at
the same time. That means that lock_is_held() returns true and
lockdep_assert_held() doesn't fire as long as there is a *single*
ww_mutex held of the same class. IOW within a WW transaction.

Code using these mutexes typically want to assert that individual
ww_mutexes are held. Not that any ww_mutex of the same class is
held.

Introduce functions that can be used for that.

RFC: Placement of the functions? lockdep.c? Are the #ifdefs testing for
the correct config?

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/ww_mutex.h | 18 ++++++++++++++++++
 kernel/locking/mutex.c   | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 45ff6f7a872b..7bc0f533dea6 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -380,4 +380,22 @@ static inline bool ww_mutex_is_locked(struct ww_mutex *lock)
 	return ww_mutex_base_is_locked(&lock->base);
 }
 
+#ifdef CONFIG_PROVE_LOCKING
+
+bool ww_mutex_held(struct ww_mutex *lock);
+
+#else /* CONFIG_PROVE_LOCKING */
+
+static inline bool ww_mutex_held(struct ww_mutex *lock)
+{
+	return true;
+}
+
+#endif /* CONFIG_PROVE_LOCKING */
+
+static inline void ww_mutex_assert_held(struct ww_mutex *lock)
+{
+	lockdep_assert(ww_mutex_held(lock));
+}
+
 #endif
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index de7d6702cd96..37868b739efd 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1174,3 +1174,13 @@ int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock)
 	return 1;
 }
 EXPORT_SYMBOL(atomic_dec_and_mutex_lock);
+
+#ifdef CONFIG_PROVE_LOCKING
+
+bool ww_mutex_held(struct ww_mutex *lock)
+{
+	return __ww_mutex_owner(&lock->base) == current;
+}
+EXPORT_SYMBOL(ww_mutex_held);
+
+#endif /* CONFIG_PROVE_LOCKING */
-- 
2.51.1

