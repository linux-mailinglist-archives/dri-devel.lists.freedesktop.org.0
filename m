Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B92C7636
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267956E0D8;
	Sat, 28 Nov 2020 22:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534816E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:28 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t22so10622701ljk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zz+KNh/9JyMd3kn8YmCOwv7AijkhcR05hHUDJe6/qKc=;
 b=lpRWLtnUZVJogSjTFPoLRElm3AFWwS8Z1SXL/LOx65VzchjutIU1KBAJynonSnuboN
 u1/s24DjJCkNITKEr+uaKsF62sRBiotsOhskJShgB6NXB+aixblONp2CQI6jcXJniY2L
 vII4wT8soxgCpyDAWnhL0yc1yWPa/w+VaH84kNXJJLg+OZE2c7JnVeia9fb/fgxwvS+D
 RjX85tPOCEQtqUFws97IRBx5V2gqbkIWOsMQ+7QLgCu5Qxge/TfcNSTCo5aipa3n2U3S
 LnvjUTgQ0XJISHDe6OrmqU6lJpnTsiaP8e5IL14ra71dor8RoukacGJ+QVmd/ZDv1UPy
 GiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zz+KNh/9JyMd3kn8YmCOwv7AijkhcR05hHUDJe6/qKc=;
 b=AOEx0pmiywvnBDUMJSNaSsqRz1wh9L6J6ZKNYTu1n7eOrBri/x5HwxiY2nkkwEn0Fp
 rBXIt7BqHRzk6ZElHgjyvHbpI5qPbs/mfG3lTMvPYC7ZLFjRHI6+F5oobqezc+j4p+Qj
 MnX+LCJ8MIxMhFPBMOPnQ+PDJJnZDrGW2D8IRCtEbRIuaDSVlsZMS5BhQS0fAllKJCrY
 B6haqihS9R1ug6j0e16VQ18dRhNQmlh+ytm43I8ar5ykPAS3bqek88MQENwt6ZRjQSQ1
 RqvAMSxI5Y+dKFbGKQGB5GWc6Ofhxuo8jErGu3kmIirm4sFS41SPcwCy5vepcanmZ2En
 1kWQ==
X-Gm-Message-State: AOAM532X5LKXPHMN5GqbDGAaZ+ULNCmHjKwSQlNxCXEEotuDxiKPzQE8
 KekGu0UNce7vwnB+6mSgbMM=
X-Google-Smtp-Source: ABdhPJz8UR5SyutdhYJr8/GasxQH3JX/eBxv59llfsuusbiLxoWjCHxswDvuGDD4yr+pCne/+Kytkg==
X-Received: by 2002:a2e:9915:: with SMTP id v21mr6287385lji.460.1606603286769; 
 Sat, 28 Nov 2020 14:41:26 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:26 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug() in
 fbcon
Date: Sat, 28 Nov 2020 23:40:48 +0100
Message-Id: <20201128224114.1033617-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replacing DPRINTK() statements with pr_debug fixes set but not used
warnings.  And moves to a more standard logging setup at the same time.

v2:
  - Fix indent (Joe)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: George Kennedy <george.kennedy@oracle.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Peter Rosin <peda@axentia.se>
---
 drivers/video/fbdev/core/fbcon.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index bf61598bf1c3..44a5cd2f54cc 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -56,8 +56,6 @@
  *  more details.
  */
 
-#undef FBCONDEBUG
-
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/fs.h>
@@ -82,12 +80,6 @@
 
 #include "fbcon.h"
 
-#ifdef FBCONDEBUG
-#  define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __func__ , ## args)
-#else
-#  define DPRINTK(fmt, args...)
-#endif
-
 /*
  * FIXME: Locking
  *
@@ -1015,11 +1007,11 @@ static const char *fbcon_startup(void)
 	rows /= vc->vc_font.height;
 	vc_resize(vc, cols, rows);
 
-	DPRINTK("mode:   %s\n", info->fix.id);
-	DPRINTK("visual: %d\n", info->fix.visual);
-	DPRINTK("res:    %dx%d-%d\n", info->var.xres,
-		info->var.yres,
-		info->var.bits_per_pixel);
+	pr_debug("mode:   %s\n", info->fix.id);
+	pr_debug("visual: %d\n", info->fix.visual);
+	pr_debug("res:    %dx%d-%d\n", info->var.xres,
+		 info->var.yres,
+		 info->var.bits_per_pixel);
 
 	fbcon_add_cursor_timer(info);
 	return display_desc;
@@ -2013,7 +2005,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 	    y_diff < 0 || y_diff > virt_fh) {
 		const struct fb_videomode *mode;
 
-		DPRINTK("attempting resize %ix%i\n", var.xres, var.yres);
+		pr_debug("attempting resize %ix%i\n", var.xres, var.yres);
 		mode = fb_find_best_mode(&var, &info->modelist);
 		if (mode == NULL)
 			return -EINVAL;
@@ -2023,7 +2015,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 		if (virt_w > var.xres/virt_fw || virt_h > var.yres/virt_fh)
 			return -EINVAL;
 
-		DPRINTK("resize now %ix%i\n", var.xres, var.yres);
+		pr_debug("resize now %ix%i\n", var.xres, var.yres);
 		if (con_is_visible(vc)) {
 			var.activate = FB_ACTIVATE_NOW |
 				FB_ACTIVATE_FORCE;
@@ -3299,8 +3291,7 @@ static void fbcon_exit(void)
 
 		if (info->queue.func)
 			pending = cancel_work_sync(&info->queue);
-		DPRINTK("fbcon: %s pending work\n", (pending ? "canceled" :
-			"no"));
+		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" : "no"));
 
 		for (j = first_fb_vc; j <= last_fb_vc; j++) {
 			if (con2fb_map[j] == i) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
