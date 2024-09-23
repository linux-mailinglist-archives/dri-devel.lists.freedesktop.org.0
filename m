Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34797F1CA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 22:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6F210E499;
	Mon, 23 Sep 2024 20:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijgRoOXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4193410E499
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124620; x=1758660620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kt/KXAallPVM1ghmveHm8ecsjMB8ehscwjeKe7Y6WFU=;
 b=ijgRoOXMZzX5jNDdJ6BcmHuhgYAQGdNPmwPJ/EJE+NBoOolM91Scs3le
 v50u9wbjCn2KxDV/pNe5j6WamtyvepqakLRrzKJjjDfFq8rh+syeFYnpj
 PAuHNv7eRA+yBRPdZ39868o2h8CwLlvD3O1WZCFVwjxuj70qOfMWoDq0Q
 wpgy97eBBevergxHWYRtsuMCyQOc/yoallUgLyoee7XI+Pc8Hxafp4WIp
 k2ni7ixIcaaAc24BvoCMdX4RlQBMfduftXeaKW/oSUakgC1uJeyLQhqpQ
 1g3Hn7SVLARpwQmSLsaCGiYX5pShJKT8I4qRMz/2UOa6Qm/JJ7gczDuh8 g==;
X-CSE-ConnectionGUID: Nd0L0oiXT0yC81IipwLeog==
X-CSE-MsgGUID: HhULd2pdSKGUwgu0pwGNXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25956355"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25956355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:50:20 -0700
X-CSE-ConnectionGUID: pinvUd2bTA2kp6cx0idPoQ==
X-CSE-MsgGUID: ArJIMxahQQSHMsfc3ul2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71328238"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:50:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:50:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] fbcon: Use 'bool' where appopriate
Date: Mon, 23 Sep 2024 23:50:16 +0300
Message-ID: <20240923205016.8791-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923155749.30846-7-ville.syrjala@linux.intel.com>
References: <20240923155749.30846-7-ville.syrjala@linux.intel.com>
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

Use 'bool' type where it makes more sense than 'int'.

v2: Rebase due to corrected 'fbcon_cursor_blink' initial value

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b905996c3588..b3c83a43fe48 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -129,9 +129,9 @@ static int logo_shown = FBCON_LOGO_CANSHOW;
 /* console mappings */
 static unsigned int first_fb_vc;
 static unsigned int last_fb_vc = MAX_NR_CONSOLES - 1;
-static int fbcon_is_default = 1;
+static bool fbcon_is_default = true;
 static int primary_device = -1;
-static int fbcon_has_console_bind;
+static bool fbcon_has_console_bind;
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
 static int map_override;
@@ -166,7 +166,7 @@ static const struct consw fb_con;
 
 #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + (delta) * vc->vc_size_row)
 
-static int fbcon_cursor_blink = 1;
+static bool fbcon_cursor_blink = true;
 
 #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
 
@@ -281,7 +281,7 @@ static bool fbcon_skip_panic(struct fb_info *info)
 #endif
 }
 
-static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *info)
+static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
@@ -290,7 +290,7 @@ static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *info)
 }
 
 static int get_color(struct vc_data *vc, struct fb_info *info,
-	      u16 c, int is_fg)
+		     u16 c, bool is_fg)
 {
 	int depth = fb_get_color_depth(&info->var, &info->fix);
 	int color = 0;
@@ -358,12 +358,12 @@ static int get_color(struct vc_data *vc, struct fb_info *info,
 
 static int get_fg_color(struct vc_data *vc, struct fb_info *info, u16 c)
 {
-	return get_color(vc, info, c, 1);
+	return get_color(vc, info, c, true);
 }
 
 static int get_bg_color(struct vc_data *vc, struct fb_info *info, u16 c)
 {
-	return get_color(vc, info, c, 0);
+	return get_color(vc, info, c, false);
 }
 
 static void fb_flashcursor(struct work_struct *work)
@@ -467,7 +467,7 @@ static int __init fb_console_setup(char *this_opt)
 				last_fb_vc = simple_strtoul(options, &options, 10) - 1;
 			if (last_fb_vc < first_fb_vc || last_fb_vc >= MAX_NR_CONSOLES)
 				last_fb_vc = MAX_NR_CONSOLES - 1;
-			fbcon_is_default = 0;
+			fbcon_is_default = false;
 			continue;
 		}
 
@@ -558,7 +558,7 @@ static int do_fbcon_takeover(int show_logo)
 			con2fb_map[i] = -1;
 		info_idx = -1;
 	} else {
-		fbcon_has_console_bind = 1;
+		fbcon_has_console_bind = true;
 	}
 
 	return err;
@@ -2802,7 +2802,7 @@ static void fbcon_unbind(void)
 				fbcon_is_default);
 
 	if (!ret)
-		fbcon_has_console_bind = 0;
+		fbcon_has_console_bind = false;
 }
 #else
 static inline void fbcon_unbind(void) {}
@@ -3234,8 +3234,9 @@ static ssize_t cursor_blink_store(struct device *device,
 				  const char *buf, size_t count)
 {
 	struct fb_info *info;
-	int blink, idx;
 	char **last = NULL;
+	bool blink;
+	int idx;
 
 	blink = simple_strtoul(buf, last, 0);
 
-- 
2.44.2

