Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC15E7D08
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5A810E730;
	Fri, 23 Sep 2022 14:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5D610E07B;
 Fri, 23 Sep 2022 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663943404; x=1695479404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Wtu+szlawnhlRrixJ/ofPJ7V1Ylsev0u/46OA9g0Sw=;
 b=duX22e7umChgnvuxNBKCy80R3cXcdO58R9qVYtflNSbB4JmDcL2WHyMV
 kwMn6vjkoa0444iDl4eC24m8RpmAm3xgMAyMVzAYt5ELrhltq6WTUdJWY
 Ib9RgJvkvxOHZqHVJCuSEYdxvQAKvhCXkwgQniDcBnxJ5SCkMpL8t3Ivp
 eyQg8+5lLbPgEikFxZnoM5q8wLPoBDdGJlD7/s7aDPqdvGElt+FKcelyz
 XtWLW9uoWpckYDv25tRhNrW/K4BRY/pY2OhbCsobHAeD5Pu4EE6C7X9ho
 WH5BXL9+44YfCJ5RFmLCFtLr73c28ShDZIJD64fujJdMcYEp628LHad12 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="280325504"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="280325504"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 07:29:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="682676915"
Received: from ccislaru-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.225.140])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 07:29:46 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Stop using flush_scheduled_work on driver remove
Date: Fri, 23 Sep 2022 15:29:34 +0100
Message-Id: <20220923142934.29528-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Kernel is trying to eliminate callers of flush_scheduled_work so lets
try to accommodate.

We currently call it from intel_modeset_driver_remove_noirq on the driver
remove path but the comment next to it does not tell me what exact work it
wants to flush.

I can spot three (or four) works using the system_wq:

  ..hotplug.reenable_work
  ..hotplug.hotplug_work
  ..psr.dc3co_work
  ..crtc->drrs.work

So if I replace it with intel_hpd_cancel_work() that appears would handle
the first two. What about the other two?

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
I am clueless about the display paths and only send this because Jani
convinced me to send a patch to kick off the discussion. No expectations
whatsoever this is correct or complete.
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2d0018ae34b1..0eb72530a003 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8980,7 +8980,7 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
 	intel_unregister_dsm_handler();
 
 	/* flush any delayed tasks or pending work */
-	flush_scheduled_work();
+	intel_hpd_cancel_work(i915);
 
 	intel_hdcp_component_fini(i915);
 
-- 
2.34.1

