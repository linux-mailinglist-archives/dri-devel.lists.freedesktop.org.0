Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819797EEA1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 17:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B2810E1A6;
	Mon, 23 Sep 2024 15:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a07yZR44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7610E1A6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727107077; x=1758643077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ChCCXGNH1zxxn2L3QK91w02IPOcPOTRwh6I5wvNjZj4=;
 b=a07yZR44RfglUbdTvIpFFsqeE0WXhKUj93skaCdvGQNpR1sDwMi/XnLX
 3EGfGbXnWBJjsDGlWNY6jXypSRuhat6rlxizn55uyS3EeUaf7YfY4p3Qx
 z1k3Vn7zLJHiGLQre58vfajunaZ2u0MqSzUmAttRzYyhaCweZiJR3nckM
 Je0lcYVPPdo//ZBXVWrRqxrSsDJohKXZjeS0kArVchzGjJ0c4LBthq4B7
 0P1vYoZxKpK/d6ULo7Igoqqak7JUX+sAAGMosRkrT+EufnbkMVcqdIYRC
 XkcM0xw2N3y5ynFk7rVLC/4CokvMq6l5OzeTdY5243TVt9EuPgLn4qWx/ Q==;
X-CSE-ConnectionGUID: QK5Y0/OZQIyAU/4/FrDwTg==
X-CSE-MsgGUID: nGqg/YquRqSCJ93VX+c8oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28957220"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="28957220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 08:57:57 -0700
X-CSE-ConnectionGUID: QQqXf+AhTnSDQxapkdb7Gg==
X-CSE-MsgGUID: OM0jbFf4SJGBZDYpi8tYfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71250766"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 08:57:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 18:57:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured before fb
 devices appear
Date: Mon, 23 Sep 2024 18:57:44 +0300
Message-ID: <20240923155749.30846-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently setting cursor_blink attribute to 0 before any fb
devices are around does absolutely nothing. When fb devices appear
and fbcon becomes active the cursor starts blinking. Fix the problem
by recoding the desired state of the attribute even if no fb devices
are present at the time.

Also adjust the show() method such that it shows the current
state of the attribute even when no fb devices are in use.

Note that store_cursor_blink() is still a bit dodgy:
- seems to be missing some of the other checks that we do
  elsewhere when deciding whether the cursor should be
  blinking or not
- when set to 0 when the cursor is currently invisible due
  to blinking, the cursor will remains invisible. We should
  either explicitly make it visible here, or wait until the
  full blink cycle has finished.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 34 +++++++-------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2e093535884b..8936fa79b9e0 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3217,26 +3217,7 @@ static ssize_t show_rotate(struct device *device,
 static ssize_t show_cursor_blink(struct device *device,
 				 struct device_attribute *attr, char *buf)
 {
-	struct fb_info *info;
-	struct fbcon_ops *ops;
-	int idx, blink = -1;
-
-	console_lock();
-	idx = con2fb_map[fg_console];
-
-	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
-		goto err;
-
-	info = fbcon_registered_fb[idx];
-	ops = info->fbcon_par;
-
-	if (!ops)
-		goto err;
-
-	blink = delayed_work_pending(&ops->cursor_work);
-err:
-	console_unlock();
-	return sysfs_emit(buf, "%d\n", blink);
+	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
 }
 
 static ssize_t store_cursor_blink(struct device *device,
@@ -3247,9 +3228,13 @@ static ssize_t store_cursor_blink(struct device *device,
 	int blink, idx;
 	char **last = NULL;
 
+	blink = simple_strtoul(buf, last, 0);
+
 	console_lock();
 	idx = con2fb_map[fg_console];
 
+	fbcon_cursor_noblink = !blink;
+
 	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
@@ -3258,15 +3243,10 @@ static ssize_t store_cursor_blink(struct device *device,
 	if (!info->fbcon_par)
 		goto err;
 
-	blink = simple_strtoul(buf, last, 0);
-
-	if (blink) {
-		fbcon_cursor_noblink = 0;
+	if (blink)
 		fbcon_add_cursor_work(info);
-	} else {
-		fbcon_cursor_noblink = 1;
+	else
 		fbcon_del_cursor_work(info);
-	}
 
 err:
 	console_unlock();
-- 
2.44.2

