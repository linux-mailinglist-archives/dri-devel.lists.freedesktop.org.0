Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FF615642
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 00:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9B810E43D;
	Tue,  1 Nov 2022 23:49:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713B10E04C;
 Tue,  1 Nov 2022 23:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667346568; x=1698882568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MCCYMNmHEfTTYDSqekS6SBdFsNB5DXRoOkEp9VE3BxA=;
 b=cquOkHhkAqziVBKOe6mku2jQ5zpwG3tA8KmSnfhw2nSBohEK49S6BgZW
 Ik+P8zi9lyfTgSMoJF5gaze8hbny3dhCJVsJapre0kzaXpva9lxE534Kl
 7YHF173s08igO51LnGRLIJM0TC8k2xKhuPxob5VXeXUfWIixqqJePdnhp
 E6P9EvPEYmHUJAXO5lDafsaN6oURaojPZXb5Q+C98rftqpzxll5RicVEc
 738hXzyq+Bs8soAe3GxOKHHa70SfmkFjVdAWPaltZY1d//reNRdQq3uUH
 9C/6TDBv7ahfZFY2Y2Q887Dw/P4eb87D13oZ4hpfuky1d0xnEVl7PlJI7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310372372"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="310372372"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 16:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="634049676"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="634049676"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by orsmga002.jf.intel.com with ESMTP; 01 Nov 2022 16:49:07 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915: Don't wait forever in drop_caches
Date: Tue,  1 Nov 2022 16:50:53 -0700
Message-Id: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

At the end of each test, IGT does a drop caches call via sysfs with
special flags set. One of the possible paths waits for idle with an
infinite timeout. That causes problems for debugging issues when CI
catches a "can't go idle" test failure. Best case, the CI system times
out (after 90s), attempts a bunch of state dump actions and then
reboots the system to recover it. Worst case, the CI system can't do
anything at all and then times out (after 1000s) and simply reboots.
Sometimes a serial port log of dmesg might be available, sometimes not.

So rather than making life hard for ourselves, change the timeout to
be 10s rather than infinite. Also, trigger the standard
wedge/reset/recover sequence so that testing can continue with a
working system (if possible).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index ae987e92251dd..9d916fbbfc27c 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
 		  DROP_RESET_ACTIVE | \
 		  DROP_RESET_SEQNO | \
 		  DROP_RCU)
+
+#define DROP_IDLE_TIMEOUT	(HZ * 10)
+
 static int
 i915_drop_caches_get(void *data, u64 *val)
 {
@@ -661,7 +664,9 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
 		intel_gt_retire_requests(gt);
 
 	if (val & (DROP_IDLE | DROP_ACTIVE)) {
-		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
+		ret = intel_gt_wait_for_idle(gt, DROP_IDLE_TIMEOUT);
+		if (ret == -ETIME)
+			intel_gt_set_wedged(gt);
 		if (ret)
 			return ret;
 	}
-- 
2.37.3

