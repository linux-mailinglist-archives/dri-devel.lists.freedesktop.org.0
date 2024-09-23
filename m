Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4687897EEA9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 17:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B12010E423;
	Mon, 23 Sep 2024 15:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnJUx3Cc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9F610E421
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727107087; x=1758643087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dhz4yoGnGvFhypQ5PyRJUXFCPK7llw2F8XmGuSmqvkw=;
 b=GnJUx3CcodTJTPNZW39kxJ1c2mCLstH08NXYnwvttOj3U3q/j/7wC/a2
 pM2czrF1YTVYgFdFayNzRHeLgfoDpXPteNr2eUXrzK3dnpWFieSlnb1ux
 QNWRRTIo/8WFPeQ0+OQ9haysFOHyci79BVYddr7Jajwb1SbP6UEW76Oq8
 y4WP3zSJFCK7lRDPMNi1KPeN5d4yOlvhtC2bxEdVV+JzuESA58cmR5ALW
 muGnNUR0R4rWE5Z/Yf7eiAuGwmbFB/vxVBKNJrkfFpGT0cy/nNYy5NIdL
 3aZA7GD0BMBdPJyqKAj2EU7wMeJYrEbhVQUaGmyKVuSwaylLTtRTU+tPV g==;
X-CSE-ConnectionGUID: asD+3Yh/RwSIE9y8Yd8/IA==
X-CSE-MsgGUID: S07uPtFwSvmtMdcAJfcyBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28957243"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="28957243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 08:58:07 -0700
X-CSE-ConnectionGUID: 2sUuxskQQwuC1pJck0EGog==
X-CSE-MsgGUID: bnMx7RZVTzOzWa+hp55oXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71250790"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 08:58:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 18:58:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] fbcon: fbcon_is_inactive() -> fbcon_is_active()
Date: Mon, 23 Sep 2024 18:57:47 +0300
Message-ID: <20240923155749.30846-5-ville.syrjala@linux.intel.com>
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

Invert fbcon_is_inactive() into fbcon_is_active(). Much easier
on the poor brain when you don't have to do dobule negations
all over the place.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index eb30aa872371..2a78cca3e9de 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -281,12 +281,12 @@ static bool fbcon_skip_panic(struct fb_info *info)
 #endif
 }
 
-static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
+static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	return (info->state != FBINFO_STATE_RUNNING ||
-		vc->vc_mode != KD_TEXT || ops->graphics || fbcon_skip_panic(info));
+	return info->state == FBINFO_STATE_RUNNING &&
+		vc->vc_mode == KD_TEXT && !ops->graphics && !fbcon_skip_panic(info);
 }
 
 static int get_color(struct vc_data *vc, struct fb_info *info,
@@ -1253,7 +1253,7 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	u_int y_break;
 
-	if (fbcon_is_inactive(vc, info))
+	if (!fbcon_is_active(vc, info))
 		return;
 
 	if (!height || !width)
@@ -1295,7 +1295,7 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (!fbcon_is_inactive(vc, info))
+	if (fbcon_is_active(vc, info))
 		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
 			   get_color(vc, info, scr_readw(s), 1),
 			   get_color(vc, info, scr_readw(s), 0));
@@ -1306,7 +1306,7 @@ static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (!fbcon_is_inactive(vc, info))
+	if (fbcon_is_active(vc, info))
 		ops->clear_margins(vc, info, margin_color, bottom_only);
 }
 
@@ -1318,7 +1318,7 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
 
 	ops->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
 
-	if (fbcon_is_inactive(vc, info) || vc->vc_deccm != 1)
+	if (!fbcon_is_active(vc, info) || vc->vc_deccm != 1)
 		return;
 
 	if (vc->vc_cursor_type & CUR_SW)
@@ -1724,7 +1724,7 @@ static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
-	if (fbcon_is_inactive(vc, info))
+	if (!fbcon_is_active(vc, info))
 		return;
 
 	if (!width || !height)
@@ -1748,7 +1748,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int scroll_partial = info->flags & FBINFO_PARTIAL_PAN_OK;
 
-	if (fbcon_is_inactive(vc, info))
+	if (!fbcon_is_active(vc, info))
 		return true;
 
 	fbcon_cursor(vc, false);
@@ -2132,7 +2132,7 @@ static bool fbcon_switch(struct vc_data *vc)
 			fbcon_del_cursor_work(old_info);
 	}
 
-	if (fbcon_is_inactive(vc, info) ||
+	if (!fbcon_is_active(vc, info) ||
 	    ops->blank_state != FB_BLANK_UNBLANK)
 		fbcon_del_cursor_work(info);
 	else
@@ -2172,7 +2172,7 @@ static bool fbcon_switch(struct vc_data *vc)
 	scrollback_max = 0;
 	scrollback_current = 0;
 
-	if (!fbcon_is_inactive(vc, info)) {
+	if (fbcon_is_active(vc, info)) {
 	    ops->var.xoffset = ops->var.yoffset = p->yscroll = 0;
 	    ops->update_start(info);
 	}
@@ -2228,7 +2228,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 		}
 	}
 
- 	if (!fbcon_is_inactive(vc, info)) {
+	if (fbcon_is_active(vc, info)) {
 		if (ops->blank_state != blank) {
 			ops->blank_state = blank;
 			fbcon_cursor(vc, !blank);
@@ -2242,7 +2242,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 			update_screen(vc);
 	}
 
-	if (mode_switch || fbcon_is_inactive(vc, info) ||
+	if (mode_switch || !fbcon_is_active(vc, info) ||
 	    ops->blank_state != FB_BLANK_UNBLANK)
 		fbcon_del_cursor_work(info);
 	else
@@ -2572,7 +2572,7 @@ static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table)
 	int i, j, k, depth;
 	u8 val;
 
-	if (fbcon_is_inactive(vc, info))
+	if (!fbcon_is_active(vc, info))
 		return;
 
 	if (!con_is_visible(vc))
@@ -2672,7 +2672,7 @@ static void fbcon_modechanged(struct fb_info *info)
 		scrollback_max = 0;
 		scrollback_current = 0;
 
-		if (!fbcon_is_inactive(vc, info)) {
+		if (fbcon_is_active(vc, info)) {
 		    ops->var.xoffset = ops->var.yoffset = p->yscroll = 0;
 		    ops->update_start(info);
 		}
-- 
2.44.2

