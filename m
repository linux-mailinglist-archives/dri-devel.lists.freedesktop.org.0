Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878556044AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8985710F20D;
	Wed, 19 Oct 2022 12:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042D310E084;
 Wed, 19 Oct 2022 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666181467; x=1697717467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ReoeNTJ25Yz7SM+ALQ7szFm68LVwr7DLRMTHKPnbomM=;
 b=aNOdqyBGWHnvwT52yUEIvuk9z2Wj77TkqoHqyVvX2+NX2765iUm9cA+7
 D2Ee26AF0kR7Rw82JkMEujSqxEZStsuvJqZ4DcechGGHrkHck7UZ8T7KC
 axnKttDVolh45ox3eP0roD8A0r0qLn/X396NjJzDuLQLcGdywZxAAk+2d
 lVTgtYfHIVh2sepb2/GcGkg8F+97k8C+0dun61hypJlIDp3h1MiXQrKeC
 Ef6nwbsEwelsU74HsynxtTcqIbdvWZYFB6QDiHlXhC6FXxFwvhIglqoty
 yC0an+mAfVExwKEJd/wWC19iJAK69O2xyb9k8FMGAEVzV/xI8Gwv6SYP3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392692167"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392692167"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:10:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874405254"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="874405254"
Received: from mjmcener-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:10:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/selftests: Fix selftests for 6.1 kthread_stop
 semantics
Date: Wed, 19 Oct 2022 13:10:07 +0100
Message-Id: <20221019121007.3229024-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
References: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Since a7c01fa93aeb ("signal: break out of wait loops on kthread_stop()")
kthread_stop will mark a pending signal which breaks __igt_timeout when
used from selftests threads. Result of this is overly short test execution
time which renders some tests useless.

Add a new __igt_thread_timeout helper and use it from selftest threads.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_context.c  |  4 ++--
 drivers/gpu/drm/i915/gt/selftest_execlists.c   |  3 ++-
 drivers/gpu/drm/i915/i915_selftest.h           |  2 ++
 drivers/gpu/drm/i915/selftests/i915_request.c  | 10 +++++-----
 drivers/gpu/drm/i915/selftests/i915_selftest.c | 18 ++++++++++++++++++
 5 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index f5dc7ba2cdd7..1172d0d6e07a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -221,7 +221,7 @@ static int __live_parallel_switch1(void *data)
 			return err;
 
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 
 	pr_info("%s: %lu switches (sync)\n", arg->ce[0]->engine->name, count);
 	return 0;
@@ -262,7 +262,7 @@ static int __live_parallel_switchN(void *data)
 		}
 
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 	i915_request_put(rq);
 
 	pr_info("%s: %lu switches (many)\n", arg->ce[0]->engine->name, count);
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 07f572ee9923..e63c0ac3d861 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3558,7 +3558,8 @@ static int smoke_crescendo_thread(void *arg)
 			return err;
 
 		count++;
-	} while (count < smoke->ncontext && !__igt_timeout(end_time, NULL));
+	} while (count < smoke->ncontext &&
+		 !__igt_thread_timeout(end_time, NULL));
 
 	smoke->count = count;
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index e4fcb71fb0ee..a233f167ec44 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -131,6 +131,8 @@ static inline int i915_perf_selftests(struct pci_dev *pdev) { return 0; }
 
 __printf(2, 3)
 bool __igt_timeout(unsigned long timeout, const char *fmt, ...);
+__printf(2, 3)
+bool __igt_thread_timeout(unsigned long timeout, const char *fmt, ...);
 
 #define igt_timeout(t, fmt, ...) \
 	__igt_timeout((t), KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 9c313e9a771b..5c576ee94e5d 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1467,7 +1467,7 @@ static int __live_parallel_engine1(void *arg)
 			break;
 
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 	intel_engine_pm_put(engine);
 
 	pr_info("%s: %lu request + sync\n", engine->name, count);
@@ -1496,7 +1496,7 @@ static int __live_parallel_engineN(void *arg)
 
 		i915_request_add(rq);
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 	intel_engine_pm_put(engine);
 
 	pr_info("%s: %lu requests\n", engine->name, count);
@@ -2978,7 +2978,7 @@ static int p_sync0(void *arg)
 			break;
 
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 
 	if (busy) {
 		ktime_t now;
@@ -3053,7 +3053,7 @@ static int p_sync1(void *arg)
 			break;
 
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 	i915_request_put(prev);
 
 	if (busy) {
@@ -3118,7 +3118,7 @@ static int p_many(void *arg)
 
 		i915_request_add(rq);
 		count++;
-	} while (!__igt_timeout(end_time, NULL));
+	} while (!__igt_thread_timeout(end_time, NULL));
 
 	if (busy) {
 		ktime_t now;
diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..afba2c3db1a9 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -397,6 +397,24 @@ bool __igt_timeout(unsigned long timeout, const char *fmt, ...)
 	return true;
 }
 
+
+bool __igt_thread_timeout(unsigned long timeout, const char *fmt, ...)
+{
+	va_list va;
+
+	cond_resched();
+	if (time_before(jiffies, timeout))
+		return false;
+
+	if (fmt) {
+		va_start(va, fmt);
+		vprintk(fmt, va);
+		va_end(va);
+	}
+
+	return true;
+}
+
 void igt_hexdump(const void *buf, size_t len)
 {
 	const size_t rowsize = 8 * sizeof(u32);
-- 
2.34.1

