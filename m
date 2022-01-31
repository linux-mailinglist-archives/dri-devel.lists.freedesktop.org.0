Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C94A50F3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F64A10E55F;
	Mon, 31 Jan 2022 21:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8630810E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v13so27843377wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktnbB1ojORyX7qViEKPREZJfUmPXv1LwX1hQ8oWjiis=;
 b=cdsZgRoYD88FU7+3gh6EQWI/SqTtDKrJZlCWkb+J41Gzoleb6NhfahNF9ou5PBoXp3
 UgdC/e3Vg3a93mPGk/8HyGNbb9IBbszmGJlf/DakHr8Qojd6/p70yisKMAs/P5Hbj3iz
 NL6+D3vPRuPvSQ3OxtoyOPOdL3xKjZZZXlKZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktnbB1ojORyX7qViEKPREZJfUmPXv1LwX1hQ8oWjiis=;
 b=EfpPaFVBJq4M5yPIjKR182mAlJR3aBz/99evDthqdLMTOXF9NCNdR+968KtEU1Rd/A
 /kTYZyDX54knBD0C9YMBWixQ52e/8jsFzQjbloSFviLw1AsOqSELbUV1pIjIQbZ7FHcB
 jQq/9A64gCFL/VeRTWwIpQ5Vribpx8Qb/rVzwgu/ZJADGeKkUKIclJo5Yf6vV+i/cyxn
 yCwki0xX2ec16A6mtBjq/hQm1xVZJ8DPBzlG7NX3teUtulOYOxYfhWCYJH0lBGsvb18W
 DdpEhif4+xSkmwujdXH468gViHDzlf4QeBeyYYYvXgr6s1jcGy7/o7c1LxNYoUI/HoTs
 Z4gQ==
X-Gm-Message-State: AOAM533mx+AShc5zj05efmIZEKNrPTsTefahvRVi53oB/JGAtotDzrig
 XxwC8ZjsRjt97VzGJ7oHVu8co1EHsVUlwg==
X-Google-Smtp-Source: ABdhPJyt52ljZXEkTAhCLoV1KTfkV9714hjj7Pee2NOp7IUyUzjNGEEiV+/NRnESSYx4YNVGxnxa2Q==
X-Received: by 2002:a5d:6686:: with SMTP id l6mr19103345wru.314.1643663203444; 
 Mon, 31 Jan 2022 13:06:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:43 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/21] fbcon: Replace FBCON_FLAGS_INIT with a boolean
Date: Mon, 31 Jan 2022 22:05:40 +0100
Message-Id: <20220131210552.482606-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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

It's only one flag and slightly tidier code.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Claudio Suarez <cssk@net-c.es>
---
 drivers/video/fbdev/core/fbcon.c | 11 +++++------
 drivers/video/fbdev/core/fbcon.h |  4 +---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index affb40658fee..fa30e1909164 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -773,7 +773,7 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 
 	ops->currcon = fg_console;
 
-	if (info->fbops->fb_set_par && !(ops->flags & FBCON_FLAGS_INIT)) {
+	if (info->fbops->fb_set_par && !ops->initialized) {
 		ret = info->fbops->fb_set_par(info);
 
 		if (ret)
@@ -782,7 +782,7 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 				"error code %d\n", ret);
 	}
 
-	ops->flags |= FBCON_FLAGS_INIT;
+	ops->initialized = true;
 	ops->graphics = 0;
 	fbcon_set_disp(info, &info->var, unit);
 
@@ -1101,8 +1101,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	 * We need to do it in fbcon_init() to prevent screen corruption.
 	 */
 	if (con_is_visible(vc) && vc->vc_mode == KD_TEXT) {
-		if (info->fbops->fb_set_par &&
-		    !(ops->flags & FBCON_FLAGS_INIT)) {
+		if (info->fbops->fb_set_par && !ops->initialized) {
 			ret = info->fbops->fb_set_par(info);
 
 			if (ret)
@@ -1111,7 +1110,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 					"error code %d\n", ret);
 		}
 
-		ops->flags |= FBCON_FLAGS_INIT;
+		ops->initialized = true;
 	}
 
 	ops->graphics = 0;
@@ -1186,7 +1185,7 @@ static void fbcon_deinit(struct vc_data *vc)
 	if (con_is_visible(vc))
 		fbcon_del_cursor_work(info);
 
-	ops->flags &= ~FBCON_FLAGS_INIT;
+	ops->initialized = false;
 finished:
 
 	fbcon_free_font(p, free_font);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index dce5ce41093e..b18d0cbf73b6 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -18,8 +18,6 @@
 
 #include <asm/io.h>
 
-#define FBCON_FLAGS_INIT         1
-
    /*
     *    This is the interface between the low-level console driver and the
     *    low-level frame buffer device
@@ -77,7 +75,7 @@ struct fbcon_ops {
 	int    blank_state;
 	int    graphics;
 	int    save_graphics; /* for debug enter/leave */
-	int    flags;
+	bool   initialized;
 	int    rotate;
 	int    cur_rotate;
 	char  *cursor_data;
-- 
2.33.0

