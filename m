Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D2751439
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CE310E5F0;
	Wed, 12 Jul 2023 23:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656010E5F0;
 Wed, 12 Jul 2023 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689203566; x=1720739566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+vYDPQLx+CkknF5HQ64Ltx5rPXIThIJ4Mq43yfs7mvE=;
 b=kv+QfTFEMeqXaQgSq5Kr5Jho5lip3xps/qRDtRsmHvtqUtOQ62x6UP6y
 ZAtCI9cqgJC5VjrZpFk8OBo5LNFQmxmOy/TWz58Rms1upAkYx7iYBq4UP
 hhASEjLommeN92nlVemhzDC8q/MyKz+xJqjbBMUxUEAIphmRSp0qhw5Ra
 8myQEs7Z0UJ830LGwwGv4HH7U/5Cls4Gp9PpidTtSZLKeqVwxG3KDGCXu
 XVuyP0DL12eH2VkhfByPqAJTQGJxFxnqvbVk3J2pE4CiaeAra7ZTRu+mj
 Gls60HF3enZGY6D5uDi12F52EbqZEnMgus7BqBq/FpZ+kyA+pqh7PezpR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428776436"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="428776436"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 16:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="787216470"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="787216470"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jul 2023 16:12:44 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Date: Wed, 12 Jul 2023 16:12:43 -0700
Message-Id: <20230712231243.2459135-1-alan.previn.teres.alexis@intel.com>
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
   v5: - Move the call to __wait_gsc_proxy_completed from common
         __run_selftests dispatcher to the group-level selftest
         function (Trvtko).
       - change the pr_info to pr_warn if we hit the timeout.
   v4: - Remove generalized waiters function table framework (Tvrtko).
       - Remove mention of CI-framework-timeout from comments (Tvrtko).
   v3: - Rebase to latest drm-tip.
   v2: - Based on internal testing, increase the timeout for gsc-proxy
         specific case to 8 seconds.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/i915/selftests/i915_selftest.c    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..b03d03eac3d6 100644
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
+		pr_warn(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
+}
+
 static int __run_selftests(const char *name,
 			   struct selftest *st,
 			   unsigned int count,
@@ -206,6 +228,8 @@ int i915_live_selftests(struct pci_dev *pdev)
 	if (!i915_selftest.live)
 		return 0;
 
+	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
+
 	err = run_selftests(live, pdev_to_i915(pdev));
 	if (err) {
 		i915_selftest.live = err;
@@ -227,6 +251,8 @@ int i915_perf_selftests(struct pci_dev *pdev)
 	if (!i915_selftest.perf)
 		return 0;
 
+	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
+
 	err = run_selftests(perf, pdev_to_i915(pdev));
 	if (err) {
 		i915_selftest.perf = err;

base-commit: 57ea1a97c50c63c77e3bfa46ee486e8a451be5e7
-- 
2.39.0

