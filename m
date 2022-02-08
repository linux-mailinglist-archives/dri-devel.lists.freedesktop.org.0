Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78244AE2DE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C43610E50F;
	Tue,  8 Feb 2022 21:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F410E4ED
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso156075wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3tTnMr0uLBBq314Z85FYSlmwFIYVNy3yQwXAflpqNU=;
 b=TFb2QU3rtSHoVZdJiHVZvumnVkhInsk+wCMJg8P7UFjC0BxdSuwwm1lmgr39cTAQp0
 ngMKu/F9v33MtAhNOOOaKSPVmb78N+5R1zMkbeg4XzZGw4nJ7Nwz4v8lcTDFwb8agLrw
 cdqX2t7ho1/lyYNo/mt86IWdCJimXrZ9E3cxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3tTnMr0uLBBq314Z85FYSlmwFIYVNy3yQwXAflpqNU=;
 b=oqqWM9Lt9xwjD4mv51BZqnVEJeqg/Hs6VaQtkmazSzbwy0b/0TSXcnDqJz5YLgt1ae
 MOluAhIfhT65QrefjL6BDEAPJIQTBPw+lXLLES1ot2vnA/828YOWOuiwybexMBB9rldT
 N6OfnjIx6pV8JINm69ssFb+7s1ry2/QicHfwP05+2oOfhROTAz6W2L1KUFqMdhDfpO8R
 Cg5Ok22yVYYlkNgwV53XZj2VWrz+V8rF5YMziayZi3GlIeG5TLPD8J+xQfLBLVe0/2bK
 nvszCt0QbtT8aqrgUtpNvOSq52qYiIcrMcwaAEX74VIbhwe+EBPEsHGuShnerQgYNmYJ
 8WqQ==
X-Gm-Message-State: AOAM533yoApmCm9SjzmAeqFSiCUGCOaoWXz8H3gzC8KlO3vO+SiHt3qh
 V7Q8vA9huRWtnVOl2RuQEnh3sDTjVHmv8w==
X-Google-Smtp-Source: ABdhPJy/MmzhXYLKsb7mnJJh9l95U3zWtlVma5KcWAwg0BTYSsMlJdIwPyk/OUMiHsCuauRvtiTE7Q==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr2625406wmq.186.1644354522253; 
 Tue, 08 Feb 2022 13:08:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:40 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 06/19] fbcon: Use delayed work for cursor
Date: Tue,  8 Feb 2022 22:08:11 +0100
Message-Id: <20220208210824.2238981-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows us to delete a bunch of hand-rolled stuff. Also to simplify the
code we initialize the cursor_work completely when we allocate the
fbcon_ops structure, instead of trying to cope with console
re-initialization.

The motiviation here is that fbcon code stops using the fb_info.queue,
which helps with locking issues around cleanup and all that in a later
patch.

Also note that this allows us to ditch the hand-rolled work cleanup in
fbcon_exit - we already call fbcon_del_cursor_timer, which takes care
of everything. Plus this was racy anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/video/fbdev/core/fbcon.c | 85 +++++++++++++-------------------
 drivers/video/fbdev/core/fbcon.h |  4 +-
 2 files changed, 35 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 83f0223f5333..a368ed602e2e 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -350,8 +350,8 @@ static int get_color(struct vc_data *vc, struct fb_info *info,
 
 static void fb_flashcursor(struct work_struct *work)
 {
-	struct fb_info *info = container_of(work, struct fb_info, queue);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon_ops *ops = container_of(work, struct fbcon_ops, cursor_work.work);
+	struct fb_info *info;
 	struct vc_data *vc = NULL;
 	int c;
 	int mode;
@@ -364,7 +364,10 @@ static void fb_flashcursor(struct work_struct *work)
 	if (ret == 0)
 		return;
 
-	if (ops && ops->currcon != -1)
+	/* protected by console_lock */
+	info = ops->info;
+
+	if (ops->currcon != -1)
 		vc = vc_cons[ops->currcon].d;
 
 	if (!vc || !con_is_visible(vc) ||
@@ -380,42 +383,25 @@ static void fb_flashcursor(struct work_struct *work)
 	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
 		    get_color(vc, info, c, 0));
 	console_unlock();
-}
 
-static void cursor_timer_handler(struct timer_list *t)
-{
-	struct fbcon_ops *ops = from_timer(ops, t, cursor_timer);
-	struct fb_info *info = ops->info;
-
-	queue_work(system_power_efficient_wq, &info->queue);
-	mod_timer(&ops->cursor_timer, jiffies + ops->cur_blink_jiffies);
+	queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
+			   ops->cur_blink_jiffies);
 }
 
-static void fbcon_add_cursor_timer(struct fb_info *info)
+static void fbcon_add_cursor_work(struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if ((!info->queue.func || info->queue.func == fb_flashcursor) &&
-	    !(ops->flags & FBCON_FLAGS_CURSOR_TIMER) &&
-	    !fbcon_cursor_noblink) {
-		if (!info->queue.func)
-			INIT_WORK(&info->queue, fb_flashcursor);
-
-		timer_setup(&ops->cursor_timer, cursor_timer_handler, 0);
-		mod_timer(&ops->cursor_timer, jiffies + ops->cur_blink_jiffies);
-		ops->flags |= FBCON_FLAGS_CURSOR_TIMER;
-	}
+	if (!fbcon_cursor_noblink)
+		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
+				   ops->cur_blink_jiffies);
 }
 
-static void fbcon_del_cursor_timer(struct fb_info *info)
+static void fbcon_del_cursor_work(struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (info->queue.func == fb_flashcursor &&
-	    ops->flags & FBCON_FLAGS_CURSOR_TIMER) {
-		del_timer_sync(&ops->cursor_timer);
-		ops->flags &= ~FBCON_FLAGS_CURSOR_TIMER;
-	}
+	cancel_delayed_work_sync(&ops->cursor_work);
 }
 
 #ifndef MODULE
@@ -714,6 +700,8 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
 		if (!ops)
 			err = -ENOMEM;
+
+		INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
 	}
 
 	if (!err) {
@@ -751,7 +739,7 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 	}
 
 	if (!err) {
-		fbcon_del_cursor_timer(oldinfo);
+		fbcon_del_cursor_work(oldinfo);
 		kfree(ops->cursor_state.mask);
 		kfree(ops->cursor_data);
 		kfree(ops->cursor_src);
@@ -867,7 +855,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 				 logo_shown != FBCON_LOGO_DONTSHOW);
 
 		if (!found)
-			fbcon_add_cursor_timer(info);
+			fbcon_add_cursor_work(info);
 		con2fb_map_boot[unit] = newidx;
 		con2fb_init_display(vc, info, unit, show_logo);
 	}
@@ -964,6 +952,8 @@ static const char *fbcon_startup(void)
 		return NULL;
 	}
 
+	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
+
 	ops->currcon = -1;
 	ops->graphics = 1;
 	ops->cur_rotate = -1;
@@ -1006,7 +996,7 @@ static const char *fbcon_startup(void)
 		 info->var.yres,
 		 info->var.bits_per_pixel);
 
-	fbcon_add_cursor_timer(info);
+	fbcon_add_cursor_work(info);
 	return display_desc;
 }
 
@@ -1194,7 +1184,7 @@ static void fbcon_deinit(struct vc_data *vc)
 		goto finished;
 
 	if (con_is_visible(vc))
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 
 	ops->flags &= ~FBCON_FLAGS_INIT;
 finished:
@@ -1320,9 +1310,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
 		return;
 
 	if (vc->vc_cursor_type & CUR_SW)
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	else
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 
 	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
 
@@ -2132,14 +2122,14 @@ static int fbcon_switch(struct vc_data *vc)
 		}
 
 		if (old_info != info)
-			fbcon_del_cursor_timer(old_info);
+			fbcon_del_cursor_work(old_info);
 	}
 
 	if (fbcon_is_inactive(vc, info) ||
 	    ops->blank_state != FB_BLANK_UNBLANK)
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	else
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 
 	set_blitting_type(vc, info);
 	ops->cursor_reset = 1;
@@ -2247,9 +2237,9 @@ static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 
 	if (mode_switch || fbcon_is_inactive(vc, info) ||
 	    ops->blank_state != FB_BLANK_UNBLANK)
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	else
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 
 	return 0;
 }
@@ -3181,7 +3171,7 @@ static ssize_t show_cursor_blink(struct device *device,
 	if (!ops)
 		goto err;
 
-	blink = (ops->flags & FBCON_FLAGS_CURSOR_TIMER) ? 1 : 0;
+	blink = delayed_work_pending(&ops->cursor_work);
 err:
 	console_unlock();
 	return snprintf(buf, PAGE_SIZE, "%d\n", blink);
@@ -3210,10 +3200,10 @@ static ssize_t store_cursor_blink(struct device *device,
 
 	if (blink) {
 		fbcon_cursor_noblink = 0;
-		fbcon_add_cursor_timer(info);
+		fbcon_add_cursor_work(info);
 	} else {
 		fbcon_cursor_noblink = 1;
-		fbcon_del_cursor_timer(info);
+		fbcon_del_cursor_work(info);
 	}
 
 err:
@@ -3314,15 +3304,9 @@ static void fbcon_exit(void)
 #endif
 
 	for_each_registered_fb(i) {
-		int pending = 0;
-
 		mapped = 0;
 		info = registered_fb[i];
 
-		if (info->queue.func)
-			pending = cancel_work_sync(&info->queue);
-		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" : "no"));
-
 		for (j = first_fb_vc; j <= last_fb_vc; j++) {
 			if (con2fb_map[j] == i) {
 				mapped = 1;
@@ -3338,15 +3322,12 @@ static void fbcon_exit(void)
 			if (info->fbcon_par) {
 				struct fbcon_ops *ops = info->fbcon_par;
 
-				fbcon_del_cursor_timer(info);
+				fbcon_del_cursor_work(info);
 				kfree(ops->cursor_src);
 				kfree(ops->cursor_state.mask);
 				kfree(info->fbcon_par);
 				info->fbcon_par = NULL;
 			}
-
-			if (info->queue.func == fb_flashcursor)
-				info->queue.func = NULL;
 		}
 	}
 }
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 969d41ecede5..6708ca0048aa 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -14,11 +14,11 @@
 #include <linux/types.h>
 #include <linux/vt_buffer.h>
 #include <linux/vt_kern.h>
+#include <linux/workqueue.h>
 
 #include <asm/io.h>
 
 #define FBCON_FLAGS_INIT         1
-#define FBCON_FLAGS_CURSOR_TIMER 2
 
    /*
     *    This is the interface between the low-level console driver and the
@@ -68,7 +68,7 @@ struct fbcon_ops {
 	int  (*update_start)(struct fb_info *info);
 	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
 	struct fb_var_screeninfo var;  /* copy of the current fb_var_screeninfo */
-	struct timer_list cursor_timer; /* Cursor timer */
+	struct delayed_work cursor_work; /* Cursor timer */
 	struct fb_cursor cursor_state;
 	struct fbcon_display *p;
 	struct fb_info *info;
-- 
2.34.1

