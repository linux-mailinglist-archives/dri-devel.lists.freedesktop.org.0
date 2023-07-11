Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555B74FA83
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 00:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA9410E43C;
	Tue, 11 Jul 2023 22:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E310E42B;
 Tue, 11 Jul 2023 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689112937; x=1720648937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jrtm70eEwVz19PDUr5ZsjF+kSdG7vXasvKGvwx0kMUk=;
 b=lWXGCVoGQ+w+Nvvl6nv9LNb1AfGU60d37I5szeE11xZsirHlEP4jY6uq
 9G2WzfYottncCC6yCV6FGpf6FBb5of5VgX51jcmkMeILYns1b5nBruAL0
 o+4qMOFY1QyNKt4x2I7GnRqEewRynwhh8YYQQ1bqODBD9UKu4fzOvWbad
 /EmiEu+AyJeM4S5WIi+3BRfsWkIjBT9uUd5dxVWdtyJKRj5O+q3WUBKFR
 2qqqnmuAenf7wDBiX+sRHhD6dq7n0a/PJTBjqhsA8Q9y1S13WWIHAzbbZ
 iJqem0yvu+E44NAG4WmvA3g87xpuem6/TM6p9OZzFujBVuWaG2wpt3j+l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451109289"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="451109289"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 15:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1051953355"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="1051953355"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 15:02:06 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Date: Tue, 11 Jul 2023 15:02:04 -0700
Message-Id: <20230711220204.2085513-1-alan.previn.teres.alexis@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
that waits for gsc-proxy init flows to complete.

Difference from prior versions:
   v4: - Remove generalized waiters function table framework (Tvrtko).
       - Remove mention of CI-framework-timeout from comments (Tvrtko).
   v3: - Rebase to latest drm-tip.
   v2: - Based on internal testing, increase the timeout for gsc-proxy
         specific case to 8 seconds.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/i915/selftests/i915_selftest.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..bbfaaaeef505 100644
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
@@ -127,6 +129,26 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
 		st[i].enabled = true;
 }
 
+static void
+__wait_gsc_proxy_completed(struct drm_i915_private *i915)
+{
+	bool need_to_wait = (IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY) &&
+			     i915->media_gt &&
+			     HAS_ENGINE(i915->media_gt, GSC0) &&
+			     intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw));
+	/*
+	 * The gsc proxy component depends on the kernel component driver load ordering
+	 * and in corner cases (the first time after an IFWI flash), init-completion
+	 * firmware flows take longer.
+	 */
+	unsigned long timeout_ms = 8000;
+
+	if (need_to_wait &&
+	    (wait_for(intel_gsc_uc_fw_proxy_init_done(&i915->media_gt->uc.gsc, true),
+	    timeout_ms)))
+		pr_info(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
+}
+
 static int __run_selftests(const char *name,
 			   struct selftest *st,
 			   unsigned int count,
@@ -134,6 +156,9 @@ static int __run_selftests(const char *name,
 {
 	int err = 0;
 
+	if (data)
+		__wait_gsc_proxy_completed(data);
+
 	while (!i915_selftest.random_seed)
 		i915_selftest.random_seed = get_random_u32();
 

base-commit: 01c4678ab6c623c621a1dea438133e39711291d4
-- 
2.39.0

