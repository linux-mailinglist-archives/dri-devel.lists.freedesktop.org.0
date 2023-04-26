Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465A6EEB85
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 02:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B6B10E85C;
	Wed, 26 Apr 2023 00:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C3010E857;
 Wed, 26 Apr 2023 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682469607; x=1714005607;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o5Gm7heevRRIQed/77N3E9XhPmA90hlJ3PHKrQcEnoY=;
 b=U4wTgWVzazoTzRPuLxVYi000y6Yy1FR0vl4EM/9e7NwnEThRdn9aLDUi
 VMu7gvDipzx0kiOkuEjISvv+j8QgY38uYE/G/FK9JTYCYrt8o0fGNE/ZJ
 wJrzRL72M1fhWsg6AXPFx+0KZZQ8fNZPkXEa2HnD5sBlzRB5QNgtNzC4/
 UVLc4CecpEbPgClV9YpqEBH7FWEMO69j2Mo+K94GtYJoljKGJLlfVLdUy
 PIkyf2ZwwrLSESJW/cZIDtYRQw2MrvZ2Xjq4zlaqrB9+MGc7DkKPxYzGs
 RO7n6nhU5o+tk4wBB/BZcck1sQdWlLqGCN8R7gTdU2B/1QhvotkZiaJGW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="433220313"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; d="scan'208";a="433220313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 17:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="763083138"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; d="scan'208";a="763083138"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga004.fm.intel.com with ESMTP; 25 Apr 2023 17:40:06 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/2] drm/i915/selftest: Update the SLPC selftest
Date: Tue, 25 Apr 2023 17:39:42 -0700
Message-Id: <20230426003942.1924347-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230426003942.1924347-1-vinay.belgaumkar@intel.com>
References: <20230426003942.1924347-1-vinay.belgaumkar@intel.com>
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

Use the new efficient frequency toggling interface. Also
create a helper function to restore the frequencies after
the test is done.

v2: Restore max freq first and then min.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c | 42 ++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index bd44ce73a504..952c8d52d68a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -70,6 +70,31 @@ static int slpc_set_freq(struct intel_gt *gt, u32 freq)
 	return err;
 }
 
+static int slpc_restore_freq(struct intel_guc_slpc *slpc, u32 min, u32 max)
+{
+	int err;
+
+	err = slpc_set_max_freq(slpc, max);
+	if (err) {
+		pr_err("Unable to restore max freq");
+		return err;
+	}
+
+	err = slpc_set_min_freq(slpc, min);
+	if (err) {
+		pr_err("Unable to restore min freq");
+		return err;
+	}
+
+	err = intel_guc_slpc_set_ignore_eff_freq(slpc, false);
+	if (err) {
+		pr_err("Unable to restore efficient freq");
+		return err;
+	}
+
+	return 0;
+}
+
 static u64 measure_power_at_freq(struct intel_gt *gt, int *freq, u64 *power)
 {
 	int err = 0;
@@ -268,8 +293,7 @@ static int run_test(struct intel_gt *gt, int test_type)
 
 	/*
 	 * Set min frequency to RPn so that we can test the whole
-	 * range of RPn-RP0. This also turns off efficient freq
-	 * usage and makes results more predictable.
+	 * range of RPn-RP0.
 	 */
 	err = slpc_set_min_freq(slpc, slpc->min_freq);
 	if (err) {
@@ -277,6 +301,15 @@ static int run_test(struct intel_gt *gt, int test_type)
 		return err;
 	}
 
+	/*
+	 * Turn off efficient frequency so RPn/RP0 ranges are obeyed.
+	 */
+	err = intel_guc_slpc_set_ignore_eff_freq(slpc, true);
+	if (err) {
+		pr_err("Unable to turn off efficient freq!");
+		return err;
+	}
+
 	intel_gt_pm_wait_for_idle(gt);
 	intel_gt_pm_get(gt);
 	for_each_engine(engine, gt, id) {
@@ -358,9 +391,8 @@ static int run_test(struct intel_gt *gt, int test_type)
 			break;
 	}
 
-	/* Restore min/max frequencies */
-	slpc_set_max_freq(slpc, slpc_max_freq);
-	slpc_set_min_freq(slpc, slpc_min_freq);
+	/* Restore min/max/efficient frequencies */
+	err = slpc_restore_freq(slpc, slpc_min_freq, slpc_max_freq);
 
 	if (igt_flush_test(gt->i915))
 		err = -EIO;
-- 
2.38.1

