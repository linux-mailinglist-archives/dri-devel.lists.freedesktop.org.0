Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A04A50F2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315D810E4BF;
	Mon, 31 Jan 2022 21:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F98210E4BF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f17so27935466wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgnSdd2AvfoeNcByN2bDHp+PhpIRGYatmO8U9PanFuc=;
 b=S+8VBUNNneiGc1+bGPSnrLBcbuVFkgKSU1F9WHEKGEhoPtQNo9kYEWH32/VdEJ10IN
 +9JFlSujzOM4Bw11VzRyD+o6Ay/zYtaJDCVsEreNhW23/UsII4y11JSGXkMSZ5oO87vf
 awGxIE+pHd6B7RDP848NhmOIATd3HdslcGwVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgnSdd2AvfoeNcByN2bDHp+PhpIRGYatmO8U9PanFuc=;
 b=Kg1by7zcqNVo2plGpfMrJBWGPTSLiQFkwqfdBaCi8M8t5ZRrGQlEw0i5YtRxJiOkni
 EeqW7zmBaODHGd5y5OHW6ZRXdXJ/vkwBzd9jzTqXyg/ijfp3goGUw597chBJVwgqS60V
 ZcAnUcfNQ8yBsw0vcaZ5BhzQYzoJbvPMmum3REAKubw8jR7HHa2nDWBu5cmIgB/1liEK
 7y5daf4QmGZclN8GTiOlRoELlbtuQc3zda8fs91suIZfOHAYXZEy23DQerLKwO/iio9S
 K5YqkSGsE9RWDHbojaKrXqY11G9rlcC4sXTIO3iU7CkDQpCJsjkzSomYIyES+9DAclHi
 ZbTA==
X-Gm-Message-State: AOAM532tfEVhl4NVwDl8GQS1PZWpdHtJH7XmLGK4JnshSLeLKXhsDaFV
 DV1FTKT9Lk8Yz14jAlzJ5swjlXwYS7YAUg==
X-Google-Smtp-Source: ABdhPJzMRGhgP+Wd468RY30pZW2pKS4gWFtsBggDBPv5aBnxBsUkCxh6leO3bSHMlVVRxYvL1JzDCg==
X-Received: by 2002:a5d:4b4d:: with SMTP id w13mr19360147wrs.640.1643663206862; 
 Mon, 31 Jan 2022 13:06:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:46 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/21] fbcon: move more common code into fb_open()
Date: Mon, 31 Jan 2022 22:05:44 +0100
Message-Id: <20220131210552.482606-14-daniel.vetter@ffwll.ch>
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

No idea why con2fb_acquire_newinfo() initializes much less than
fbcon_startup(), but so be it. From a quick look most of the
un-initialized stuff should be fairly harmless, but who knows.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 74 +++++++++++++-------------------
 1 file changed, 31 insertions(+), 43 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b83a5a77d8a8..5a3391ff038d 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -680,8 +680,18 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
 
 #endif /* CONFIG_MISC_TILEBLITTING */
 
+static void fbcon_release(struct fb_info *info)
+{
+	if (info->fbops->fb_release)
+		info->fbops->fb_release(info, 0);
+
+	module_put(info->fbops->owner);
+}
+
 static int fbcon_open(struct fb_info *info)
 {
+	struct fbcon_ops *ops;
+
 	if (!try_module_get(info->fbops->owner))
 		return -ENODEV;
 
@@ -691,19 +701,22 @@ static int fbcon_open(struct fb_info *info)
 		return -ENODEV;
 	}
 
-	return 0;
-}
+	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
+	if (!ops) {
+		fbcon_release(info);
+		return -ENOMEM;
+	}
 
-static void fbcon_release(struct fb_info *info)
-{
-	if (info->fbops->fb_release)
-		info->fbops->fb_release(info, 0);
+	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
+	ops->info = info;
+	info->fbcon_par = ops;
+	ops->cur_blink_jiffies = HZ / 5;
 
-	module_put(info->fbops->owner);
+	return 0;
 }
 
 static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
-				  int unit, int oldidx)
+				  int unit)
 {
 	struct fbcon_ops *ops = NULL;
 	int err;
@@ -712,27 +725,10 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 	if (err)
 		return err;
 
-	if (!err) {
-		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
-		if (!ops)
-			err = -ENOMEM;
-
-		INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
-	}
-
-	if (!err) {
-		ops->cur_blink_jiffies = HZ / 5;
-		ops->info = info;
-		info->fbcon_par = ops;
-
-		if (vc)
-			set_blitting_type(vc, info);
-	}
+	ops = info->fbcon_par;
 
-	if (err) {
-		con2fb_map[unit] = oldidx;
-		fbcon_release(info);
-	}
+	if (vc)
+		set_blitting_type(vc, info);
 
 	return err;
 }
@@ -840,9 +836,11 @@ static int set_con2fb_map(int unit, int newidx, int user)
 
 	found = search_fb_in_map(newidx);
 
-	con2fb_map[unit] = newidx;
-	if (!err && !found)
-		err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
+	if (!err && !found) {
+		err = con2fb_acquire_newinfo(vc, info, unit);
+		if (!err)
+			con2fb_map[unit] = newidx;
+	}
 
 	/*
 	 * If old fb is not mapped to any of the consoles,
@@ -939,20 +937,10 @@ static const char *fbcon_startup(void)
 	if (fbcon_open(info))
 		return NULL;
 
-	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
-	if (!ops) {
-		fbcon_release(info);
-		return NULL;
-	}
-
-	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
-
+	ops = info->fbcon_par;
 	ops->currcon = -1;
 	ops->graphics = 1;
 	ops->cur_rotate = -1;
-	ops->cur_blink_jiffies = HZ / 5;
-	ops->info = info;
-	info->fbcon_par = ops;
 
 	p->con_rotate = initial_rotation;
 	if (p->con_rotate == -1)
@@ -1022,7 +1010,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 		return;
 
 	if (!info->fbcon_par)
-		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
+		con2fb_acquire_newinfo(vc, info, vc->vc_num);
 
 	/* If we are not the first console on this
 	   fb, copy the font from that console */
-- 
2.33.0

