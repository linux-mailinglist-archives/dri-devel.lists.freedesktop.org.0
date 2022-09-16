Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A35BB35E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 22:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B110ED9F;
	Fri, 16 Sep 2022 20:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC410ED9D;
 Fri, 16 Sep 2022 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663359603; x=1694895603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajdfXaZQN7PYXtZ54jx1rGLM8MJGB1KxPW+9Pm5Fb3U=;
 b=I9wJrahKiasZJ+St+2H1RC4CeA/Xr7hgfUP79+234gpRv6PRl3xjIIeW
 XI199jFYqa02eFnMwjOPoVmU5/GOuIpCQ0fiSAPaOxTrVi/sQDngg1vN3
 fJ6Gi4g0Z1Y/3PNrsHkkXeTiWk184tbRcabctZWOSQFbwh/h5rhG8kB9t
 yLw8ZILBuIHhQtG1lu33+DgaKVDZytgvoIGYkY7vVqSMAlxG2LvPH+BUF
 K0YSLd0rCZ4k/X+7EN2jLqbY8UtW9QFN+uWOVFbi2aa7R6HLvDACONVJa
 14N0WgisT/Uvw+Dvpw4X0qDY+UyYg1mLLPweSMOCMfaKVf8Q1d0COp5ZE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278800997"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="278800997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 13:20:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="650983984"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 13:20:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Bump the reset-failure timeout to 60s
Date: Fri, 16 Sep 2022 13:19:58 -0700
Message-Id: <20220916201958.1896545-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

If attempting to perform a GT reset takes long than 5 seconds (including
resetting the display for gen3/4), then we declare all hope lost and
discard all user work and wedge the device to prevent further
misbehaviour. 5 seconds is too short a time for such drastic action, as
we may be stuck on other timeouts and watchdogs. If we allow a little
bit longer before hitting the big red button, we should at the very
least capture other hung task indicators pointing towards the reason why
the reset was hanging; and allow more marginal cases the extra headroom
to complete the reset without further collateral damage.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index b36674356986..3159df6cdd49 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1278,7 +1278,7 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 	kobject_uevent_env(kobj, KOBJ_CHANGE, reset_event);
 
 	/* Use a watchdog to ensure that our reset completes */
-	intel_wedge_on_timeout(&w, gt, 5 * HZ) {
+	intel_wedge_on_timeout(&w, gt, 60 * HZ) {
 		intel_display_prepare_reset(gt->i915);
 
 		intel_gt_reset(gt, engine_mask, reason);
-- 
2.34.1

