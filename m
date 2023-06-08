Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD12727BB3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA6010E59A;
	Thu,  8 Jun 2023 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EA110E40F;
 Thu,  8 Jun 2023 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686217444; x=1717753444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZC13/Z7K5UzCUa4RG+GFE2n/vlJjJ7uXtEfI6PO5ADM=;
 b=FQcTyNuPV155+0alShCDnVTeXUSYPSZ4+JChzu0ISE70LcPdm2q/rXZE
 j3zUzPvtVwvO0DxrxJ8hQ17mQsAMBfzGQHHbQNS8jP2nRI2YB2YFIZfTb
 17SRLkWnRfuxGLW33acgsvDI228wfe29QXQFsPzIEXYIujFcGkbxMyD6C
 sm9VmGtLP5HmUn7WRpB97XJ41kWKXdDCh7LmZ5b+w5WQbJK47ycvN3VIA
 iT7NvukmnytkdBqqOaJg7Ob7pOihym8kSTxFvRDtA6e280OknjjvPPP3f
 bfMi38UGOBoFktuqjgD8dU/vi1dFUV0WCzE69UlDP2iCGqwqiIWqveN70 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337619938"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="337619938"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799764057"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="799764057"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2023 02:44:02 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC] fbcon: Reschedule cursor worker if try lock fails
Date: Thu,  8 Jun 2023 15:12:47 +0530
Message-Id: <20230608094247.812488-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: chaitanya.kumar.borah@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the removal of timer implementation for cursor work[1],
the cursor delayed work does not get rescheduled if it fails
to acquire the console lock. This change pushes the cursor
work to the queue if we fail to acquire the lock.

This has been found to cause issue during the resume sequence
of the IGT test kms_fbcon_fbt@fbc-suspend[2]. The test expects
cursor blinking to start after the system resumes from suspend
state.

 fbcon_resumed()
	 redraw_screen()
		 set_cursor()
			 fb_flashcursor()

But the cursor work fails to acuire the lock and it never gets
rescheduled unless some other function comes in and invokes
fbcon_add_cursor_work() which adds the worker to the queue.
From empirical evidence this happens if we tweak the console
log level.

Re-scheduling the work heals the issue. I am not sure if this
is the best solution we can have, particularly with the "Fix me"
comment which indicates a bigger underlying problem. Hence, the
RFC.

[1] 3b0fb6ab25("fbcon: Use delayed work for cursor")
[2] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13243/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c6c9d040bdec..b98ea62836ae 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -357,8 +357,11 @@ static void fb_flashcursor(struct work_struct *work)
 	/* instead we just fail to flash the cursor if we can't get
 	 * the lock instead of blocking fbcon deinit */
 	ret = console_trylock();
-	if (ret == 0)
+	if (ret == 0) {
+		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
+						   ops->cur_blink_jiffies);
 		return;
+	}
 
 	/* protected by console_lock */
 	info = ops->info;
-- 
2.25.1

