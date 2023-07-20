Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C520775B9AF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F5610E19A;
	Thu, 20 Jul 2023 21:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBD410E19A;
 Thu, 20 Jul 2023 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689889246; x=1721425246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jeNR0xVHNMslt6dhHUehu3eBsemYEfHL8Wn334DEsIY=;
 b=Vju7PD/XTxW/WYy097yLzRlZMEG0h9td6Y7eMPvhB97GT4FE3Jarcsdv
 v14J2+HyHRLGCpaXgPthpbQJKIO7ASld5Q6wtQO188o+cLsjypGnozvKL
 uyMe4k8bn9W6ICX7XMQ+E3YP4dY0VBHlFNWLvO1bcbJ0lNLPxbR7gmXU2
 ettGOMHbx1gK94X77fhcfgZhWjO6YBdI6KpZi7kZv5L0h+99RQWJjewDK
 HRq5rtnKSy7m+qT0z/Q2aVAHGlLOxg4w1uUy/jAZ0niU6oslIjaVKwUuH
 /gRBmkeosEmxc1Q83bOcl7A97pin3C5MEBue5/XO+qW4Bes8aHqz8f4QI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364333385"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="364333385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="867996797"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2023 14:40:46 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Date: Thu, 20 Jul 2023 14:40:44 -0700
Message-Id: <20230720214044.369277-1-alan.previn.teres.alexis@intel.com>
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
that waits for gsc-proxy init flows to complete. Selftests shouldn't
care if the proxy-init failed as that should be flagged elsewhere.

Difference from prior versions:
   v6: - Add a helper that returns something more than a boolean
         so we selftest can stop waiting if proxy-init hadn't
         completed but failed (Daniele).
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
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 14 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |  1 +
 .../gpu/drm/i915/selftests/i915_selftest.c    | 31 +++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index ab1a456f833d..163021705210 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -45,6 +45,20 @@ bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakere
 	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
 }
 
+int intel_gsc_uc_fw_proxy_get_status(struct intel_gsc_uc *gsc)
+{
+	if (!(IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)))
+		return -ENODEV;
+	if (!intel_uc_fw_is_loadable(&gsc->fw))
+		return -ENODEV;
+	if (__intel_uc_fw_status(&gsc->fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
+		return -ENOLINK;
+	if (!intel_gsc_uc_fw_proxy_init_done(gsc, true))
+		return -EAGAIN;
+
+	return 0;
+}
+
 bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
 {
 	return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore, false) &
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
index ad2167ce9137..bc9dd0de8aaf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
@@ -16,5 +16,6 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
 bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
 bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakeref);
+int intel_gsc_uc_fw_proxy_get_status(struct intel_gsc_uc *gsc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..ee79e0809a6d 100644
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
@@ -127,6 +129,31 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
 		st[i].enabled = true;
 }
 
+static bool
+__gsc_proxy_init_progressing(struct intel_gsc_uc *gsc)
+{
+	return intel_gsc_uc_fw_proxy_get_status(gsc) == -EAGAIN;
+}
+
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
+	if (need_to_wait && wait_for(!__gsc_proxy_init_progressing(&i915->media_gt->uc.gsc),
+				     timeout_ms))
+		pr_warn(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
+}
+
 static int __run_selftests(const char *name,
 			   struct selftest *st,
 			   unsigned int count,
@@ -206,6 +233,8 @@ int i915_live_selftests(struct pci_dev *pdev)
 	if (!i915_selftest.live)
 		return 0;
 
+	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
+
 	err = run_selftests(live, pdev_to_i915(pdev));
 	if (err) {
 		i915_selftest.live = err;
@@ -227,6 +256,8 @@ int i915_perf_selftests(struct pci_dev *pdev)
 	if (!i915_selftest.perf)
 		return 0;
 
+	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
+
 	err = run_selftests(perf, pdev_to_i915(pdev));
 	if (err) {
 		i915_selftest.perf = err;

base-commit: cc69df372f21eb3073c062132ee9eb3649605931
-- 
2.39.0

