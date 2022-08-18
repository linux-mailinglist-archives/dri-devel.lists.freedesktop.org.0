Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306B598E46
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035EC10E48A;
	Thu, 18 Aug 2022 20:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B176610E48A;
 Thu, 18 Aug 2022 20:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660855398; x=1692391398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PD/S2Zg0O6+m6qqsX/1JLWLJL8R60hxAcWbT2Zi8MvQ=;
 b=HYASeiyB3P23qFRKyp0Ix6/IzXWMsIqkCtvDekFss8H95tJUK2WD/H1F
 eoEUdd0KHYkBidOrHI1/cXaEColD3fULsize/M6aEt9ZuwbVZfvvKlxJF
 OI9sTeCA4O+cFAHdp9njP2sGqN0JKETB13j3Q6QEEd6NCGGXPnh2B1zUs
 IDV2Da5RNidUVE2xneXiH8ymdOq+gYqcG9WhS9KPrL/EhDC02OCoAmx85
 t82xkpRdqg9RsNA58ltNtrybpObA5MPc0a5UK+ulFLlnteNeRGWxrRb5D
 elCB2N0CAa/6He81XyXaipKPlahHtdW3xfl92LnhJuxpre6mKW+sGNPI0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="318889782"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="318889782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 13:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="697330548"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2022 13:43:18 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t] i915/guc: Disable i915_pm_rps when SLPC is enabled
Date: Thu, 18 Aug 2022 13:42:55 -0700
Message-Id: <20220818204255.20974-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These tests were specifically designed for host Turbo. Skip
them when SLPC is enabled as they fail frequently. We will look
to keep adding to SLPC test coverage with these scenarios.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/3963
Bug: https://gitlab.freedesktop.org/drm/intel/issues/4016
Bug: https://gitlab.freedesktop.org/drm/intel/issues/5468
Bug: https://gitlab.freedesktop.org/drm/intel/issues/5831

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 lib/igt_pm.c             | 15 +++++++++++++++
 lib/igt_pm.h             |  1 +
 tests/i915/i915_pm_rps.c | 29 ++++++++++++++++++++++++-----
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 6ebbad33..79bd6e2a 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1202,3 +1202,18 @@ void igt_pm_print_pci_card_runtime_status(void)
 		igt_pm_print_pci_dev_runtime_status(__pci_dev_pwrattr[i].pci_dev);
 	}
 }
+
+bool i915_is_slpc_enabled(int fd)
+{
+	int debugfs_fd = igt_debugfs_dir(fd);
+	char buf[4096];
+	int len;
+
+	igt_require(debugfs_fd != -1);
+
+	len = igt_debugfs_simple_read(debugfs_fd, "gt/uc/guc_slpc_info", buf, sizeof(buf));
+	if (len < 0)
+		return false;
+	else
+		return strstr(buf, "SLPC state: running");
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index f28b6ebf..cbbde12b 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -79,5 +79,6 @@ void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
 void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
 void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
+bool i915_is_slpc_enabled(int fd);
 
 #endif /* IGT_PM_H */
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index d06ade27..cce07009 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -914,35 +914,54 @@ igt_main
 		igt_install_exit_handler(pm_rps_exit_handler);
 	}
 
-	igt_subtest("basic-api")
+	igt_subtest("basic-api") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		min_max_config(basic_check, false);
+	}
 
 	/* Verify the constraints, check if we can reach idle */
-	igt_subtest("min-max-config-idle")
+	igt_subtest("min-max-config-idle") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		min_max_config(idle_check, true);
+	}
 
 	/* Verify the constraints with high load, check if we can reach max */
 	igt_subtest("min-max-config-loaded") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		load_helper_run(HIGH);
 		min_max_config(loaded_check, false);
 		load_helper_stop();
 	}
 
 	/* Checks if we achieve boost using gem_wait */
-	igt_subtest("waitboost")
+	igt_subtest("waitboost") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		waitboost(drm_fd, false);
+	}
 
 	igt_describe("Check if the order of fences does not affect waitboosting");
-	igt_subtest("fence-order")
+	igt_subtest("fence-order") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		fence_order(drm_fd);
+	}
 
 	igt_describe("Check if context reuse does not affect waitboosting");
-	igt_subtest("engine-order")
+	igt_subtest("engine-order") {
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		engine_order(drm_fd);
+	}
 
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang = igt_allow_hang(drm_fd, 0, 0);
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled");
 		waitboost(drm_fd, true);
 		igt_disallow_hang(drm_fd, hang);
 	}
-- 
2.35.1

