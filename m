Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABAE939521
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD4410E332;
	Mon, 22 Jul 2024 21:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYPgNEhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A227310E323;
 Mon, 22 Jul 2024 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682421; x=1753218421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAfU6gzUiAe44BSUbXq2+RC8Fp/CWug4QPOlPPDUjyo=;
 b=GYPgNEhTehvaB4pxDwQbHkYNTD7eNk/nhi6omOOR5YCQ9rzlOv5FHC/d
 b9+u6UxwFzsBjvEiaLBtONz2gamo58NTil5Ks5YjJDXFa4piXs6TTnZWs
 zq3vnAh+60m0fbp3q7AfN6jY/qI0x304vKRtmc32YMaQ2Bz9Hl3/DdkOZ
 bVPCuYp6DL6/a3A0IUxL6iU6X5F8rYXkPXuPeU3H87awxUADqUgJR8sll
 tYtnEFvLfCWq1gE0IzvefX+MdtIDgR7rq33OgHeEFqhyifOtaRrnLersL
 R2on/6EMdCIBy8MvXnkGm4UnEBCrA8j1ylKXgHdW0/loY2WuCh1VYV4in A==;
X-CSE-ConnectionGUID: hp/vpUBuQUKy/eC99uvMvg==
X-CSE-MsgGUID: 8yCRV6TsQ6W7SU96p7FBZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428297"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:01 -0700
X-CSE-ConnectionGUID: DkVx8NGRRuOCzUS/0sNtzQ==
X-CSE-MsgGUID: gWSi5Rj6T3m97o+tGcOgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653288"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/7] drm/i915/pmu: Fix crash due to use-after-free
Date: Mon, 22 Jul 2024 14:06:43 -0700
Message-ID: <20240722210648.80892-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722210648.80892-1-lucas.demarchi@intel.com>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When an i915 PMU counter is enabled and the driver is then unbound, the
PMU will be unregistered via perf_pmu_unregister(), however the event
will still be alive. i915 currently tries to deal with this situation
by:

	a) Marking the pmu as "closed" and shortcut the calls from perf
	b) Taking a reference from i915, that is put back when the event
	   is destroyed.
	c) Setting event_init to NULL to avoid any further event

(a) is ugly, but may be left as is since it protects not trying to
access the HW that is now gone. Unless a pmu driver can call
perf_pmu_unregister() and not receive any more calls, it's a necessary
ugliness.

(b) doesn't really work: when the event is destroyed and the i915 ref is
put it may free the i915 object, that contains the pmu, not only the
event. After event->destroy() callback, perf still expects the pmu
object to be alive.

Instead of pigging back on the event->destroy() to take and put the
device reference, implement the new get()/put() on the pmu object for
that purpose.

(c) is not entirely correct as from the perf POV it's not an optional
call: perf would just dereference the NULL pointer. However this also
protects other entrypoints in i915_pmu. A new event creation from perf
after the pmu has been unregistered should not be possible anyway:
perf_init_event() bails out when not finding the pmu. This may be
cleaned up later.

Cc: <stable@vger.kernel.org> # 5.11+
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 34 +++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 21eb0c5b320d..cb5f6471ec6e 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -514,15 +514,6 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }
 
-static void i915_pmu_event_destroy(struct perf_event *event)
-{
-	struct i915_pmu *pmu = event_to_pmu(event);
-	struct drm_i915_private *i915 = pmu_to_i915(pmu);
-
-	drm_WARN_ON(&i915->drm, event->parent);
-
-	drm_dev_put(&i915->drm);
-}
 
 static int
 engine_event_status(struct intel_engine_cs *engine,
@@ -628,11 +619,6 @@ static int i915_pmu_event_init(struct perf_event *event)
 	if (ret)
 		return ret;
 
-	if (!event->parent) {
-		drm_dev_get(&i915->drm);
-		event->destroy = i915_pmu_event_destroy;
-	}
-
 	return 0;
 }
 
@@ -872,6 +858,24 @@ static int i915_pmu_event_event_idx(struct perf_event *event)
 	return 0;
 }
 
+static struct pmu *i915_pmu_get(struct pmu *base)
+{
+	struct i915_pmu *pmu = container_of(base, struct i915_pmu, base);
+	struct drm_i915_private *i915 = pmu_to_i915(pmu);
+
+	drm_dev_get(&i915->drm);
+
+	return base;
+}
+
+static void i915_pmu_put(struct pmu *base)
+{
+	struct i915_pmu *pmu = container_of(base, struct i915_pmu, base);
+	struct drm_i915_private *i915 = pmu_to_i915(pmu);
+
+	drm_dev_put(&i915->drm);
+}
+
 struct i915_str_attribute {
 	struct device_attribute attr;
 	const char *str;
@@ -1299,6 +1303,8 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	pmu->base.stop		= i915_pmu_event_stop;
 	pmu->base.read		= i915_pmu_event_read;
 	pmu->base.event_idx	= i915_pmu_event_event_idx;
+	pmu->base.get		= i915_pmu_get;
+	pmu->base.put		= i915_pmu_put;
 
 	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
 	if (ret)
-- 
2.43.0

