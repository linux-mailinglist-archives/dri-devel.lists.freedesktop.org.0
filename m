Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18495400140
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 16:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112E6E8A0;
	Fri,  3 Sep 2021 14:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944BF6E89F;
 Fri,  3 Sep 2021 14:29:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="198978570"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="198978570"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 07:29:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="462402216"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.6.44])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 07:29:03 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH RESEND] drm/i915: Mark GPU wedging on driver unregister
 unrecoverable
Date: Fri,  3 Sep 2021 16:28:37 +0200
Message-Id: <20210903142837.216978-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

GPU wedged flag now set on driver unregister to prevent from further
using the GPU can be then cleared unintentionally when calling
__intel_gt_unset_wedged() still before the flag is finally marked
unrecoverable.  We need to have it marked unrecoverable earlier.
Implement that by replacing a call to intel_gt_set_wedged() in
intel_gt_driver_unregister() with intel_gt_set_wedged_on_fini().

With the above in place, intel_gt_set_wedged_on_fini() is now called
twice on driver remove, second time from __intel_gt_disable().  This
seems harmless, while dropping intel_gt_set_wedged_on_fini() from
__intel_gt_disable() proved to break some driver probe error unwind
paths as well as mock selftest exit path.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
Resending with Cc: dri-devel@lists.freedesktop.org as requested.

Thanks,
Janusz

 drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 62d40c986642..173b53cb2b47 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -750,7 +750,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 	 * all in-flight requests so that we can quickly unbind the active
 	 * resources.
 	 */
-	intel_gt_set_wedged(gt);
+	intel_gt_set_wedged_on_fini(gt);
 
 	/* Scrub all HW state upon release */
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-- 
2.25.1

