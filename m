Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD17742EA8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 22:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2922710E13F;
	Thu, 29 Jun 2023 20:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9910E13F;
 Thu, 29 Jun 2023 20:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688071370; x=1719607370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fR3YrfDxYw2j7wfDrGsIrF57r7zupID6rXLTQ3IJ0nA=;
 b=aK6HL1ya055G3ig2se4dZJN+bsvuXaV14QOqLjtHDkdxg4OGBSwl6Rb3
 qcK+gtMkddiShthyZf4xPVFiV40dSdB22oQa4i8cCYNjF2WXDlmNLAfgy
 Mrp1cTO8b3lzH4wAYxYjeti1ZS0m29Or4/d+PMBO5f6j+EEURp+hZqun9
 rXBFd2n0WUqUYZ8mZN5+biRrPGzdHBOw/jWl9fnCeD2giGk5vl7HSJoyQ
 RNXlXVjbTT25G7XVh1HS+eMAP577PpZdATNeXy2vSKqji5E6hFWskEark
 QPWhtuMmGLhZ7w6HQqcIE6IrIPlOn9ZNThO8cRVIXBUwxvNBSgRpTxE+e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364802116"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="364802116"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841592779"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="841592779"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 29 Jun 2023 13:42:48 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Date: Thu, 29 Jun 2023 13:42:48 -0700
Message-Id: <20230629204248.1283601-1-alan.previn.teres.alexis@intel.com>
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

Difference from prior versions:
   v3: Rebase to latest drm-tip.
   v2: Based on internal testing, increase the timeout for gsc-proxy
       specific case to 8 seconds.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

---
 .../gpu/drm/i915/selftests/i915_selftest.c    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..a74b7e264d92 100644
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
@@ -127,6 +129,63 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
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
+	/*
+	 * For gsc proxy component loading + init, we need a much longer timeout
+	 * than what CI selftest infrastrucutre currently uses. This longer wait
+	 * period depends on the kernel config and component driver load ordering
+	 */
+	if (timeout_ms < 8000)
+		timeout_ms = 8000;
+
+	if (need_to_wait &&
+	    (wait_for(intel_gsc_uc_fw_proxy_init_done(&i915->media_gt->uc.gsc, true),
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
@@ -134,6 +193,8 @@ static int __run_selftests(const char *name,
 {
 	int err = 0;
 
+	__wait_on_all_system_dependencies(data);
+
 	while (!i915_selftest.random_seed)
 		i915_selftest.random_seed = get_random_u32();
 

base-commit: 6f8963ce33be65c67e53b16fa18325e12ab76861
-- 
2.39.0

