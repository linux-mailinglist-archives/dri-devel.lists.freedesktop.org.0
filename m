Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EF67012D7
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 01:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3010E6ED;
	Fri, 12 May 2023 23:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A99A10E6ED;
 Fri, 12 May 2023 23:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683935906; x=1715471906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zHPBWJz1eGIQsXC3Gf39LI9GOKIRq1az8zqidSxLq2I=;
 b=bdITsMAgN9DTDPysm5yFROBSIa8d266pkTLB1nqCez5lY87cJQ8nB55b
 rrTNOc3S/bR+cE4S36aGWKkKbfJ1ZpISz8Wgd0vpPPRxEHpt3FHBTxgj7
 p5pgklGygTulix1hAUxq/Drw5ZFErknRyagvCgQwhjZha7Oif45e6x9sw
 9vSyI9naKzIFiYn2o0iCocOvKCF5x7AI/MszpPVSUCWesYJJ8Oevx71lh
 ZlUhb04dMYo7+IJ8f73g3OFZ+/BqoECcixej3PF8NuNz/DCjOwiQ/Dw5p
 xBm7q6YSXOis7ZlUZGx0WRnxmnYTzvg9I6Iuwn6NZ7zwBgVmxEmwrTg16 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354045119"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="354045119"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 16:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="765319889"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="765319889"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga008.fm.intel.com with ESMTP; 12 May 2023 16:58:25 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftest/gsc: Ensure GSC Proxy init completes before
 selftests
Date: Fri, 12 May 2023 16:58:24 -0700
Message-Id: <20230512235824.1399566-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL, if the GSC Proxy init flows haven't completed, submissions to the
GSC engine will fail. Those init flows are dependent on the mei's
gsc_proxy component that is loaded in parallel with i915 and a
worker that could potentially start after i915 driver init is done.

That said, all subsytems that access the GSC engine today does check
for such init flow completion before using the GSC engine. However,
selftests currently don't wait on anything before starting.

To fix this, add a waiter function at the start of __run_selftests
that waits for gsc-proxy init flows to complete. While implementing this,
use an table of function pointers so its scalable to add additional
waiter functions for future such "wait on dependency" cases that.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/i915/selftests/i915_selftest.c    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..a05effdbce94 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -24,6 +24,8 @@
 #include <linux/random.h>
 
 #include "gt/intel_gt_pm.h"
+#include "gt/uc/intel_gsc_fw.h"
+
 #include "i915_driver.h"
 #include "i915_drv.h"
 #include "i915_selftest.h"
@@ -127,6 +129,55 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
 		st[i].enabled = true;
 }
 
+static int
+__wait_gsc_proxy_completed(struct drm_i915_private *i915,
+			   unsigned long timeout_ms)
+{
+	bool need_to_wait = (IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY) &&
+			     i915->media_gt &&
+			     HAS_ENGINE(i915->media_gt, GSC0) &&
+			     intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw));
+
+	if (need_to_wait &&
+	    (wait_for(intel_gsc_uc_fw_proxy_init_done(&i915->media_gt->uc.gsc),
+	    timeout_ms)))
+		return -ETIME;
+
+	return 0;
+}
+
+struct __startup_waiter {
+	const char *name;
+	int (*wait_to_completed)(struct drm_i915_private *i915, unsigned long timeout_ms);
+};
+
+static struct __startup_waiter all_startup_waiters[] = { \
+	{"gsc_proxy", __wait_gsc_proxy_completed} \
+	};
+
+static int __wait_on_all_system_dependencies(struct drm_i915_private *i915)
+{
+	struct __startup_waiter *waiter = all_startup_waiters;
+	int count = ARRAY_SIZE(all_startup_waiters);
+	int ret;
+
+	if (!waiter || !count || !i915)
+		return 0;
+
+	for (; count--; waiter++) {
+		if (!waiter->wait_to_completed)
+			continue;
+		ret = waiter->wait_to_completed(i915, i915_selftest.timeout_ms);
+		if (ret) {
+			pr_info(DRIVER_NAME ": Pre-selftest waiter %s failed with %d\n",
+				waiter->name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int __run_selftests(const char *name,
 			   struct selftest *st,
 			   unsigned int count,
@@ -134,6 +185,8 @@ static int __run_selftests(const char *name,
 {
 	int err = 0;
 
+	__wait_on_all_system_dependencies(data);
+
 	while (!i915_selftest.random_seed)
 		i915_selftest.random_seed = get_random_u32();
 

base-commit: 222ff19f23b0bd6aca0b52001d69699f78f5a206
-- 
2.39.0

