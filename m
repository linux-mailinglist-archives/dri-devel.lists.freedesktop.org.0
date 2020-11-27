Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873C2C6C3A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAAF6F3C0;
	Fri, 27 Nov 2020 19:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F5F6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:40 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q13so7864205lfr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=da1A3vPp/gSfs8uQBFTqVywhFC5di/xPXEUcczCTk0g=;
 b=OwYLqsrQMpPVt+ChWeSPEvd1NbyN39kT9QgmMexvDbvKZzxVnAwlLyDVRQXb+G1rnL
 /ucb0C5ndckRbVUSYtwh/nUcnPVHej9oHsdAPqX7HZBrS2o4yFZuL8gqW0iO7Rnw+RGp
 BOdTXa9LoGy6KWFz+70GzDU88IzQGWHSzET0qaVaW8FqEE2uSANZi68YS6jMU77KEcEZ
 /dbrJTXqWAlYs8e0rRuNKw3lPCje5DbyzN/R0S/3n9oBVPW9QjmM4QGmCPp6c94I3ocJ
 nYbkmEAT7umptMLc2DtxqEh5D6JYGKqa3zu+D2BqmuhD7qMvaUefYUU4ZZQq58ZmRfKi
 MSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=da1A3vPp/gSfs8uQBFTqVywhFC5di/xPXEUcczCTk0g=;
 b=koSZ3ecPul6TKo81r3h04k+8Qmea4S0NlTDBdhjVBS9sxg1R4dF+2ZWtZnTjp20Bae
 GUdRk759zyYjGnQbuUeU/YJmUpIoaOtWIbRlNnEYVEPR9JWdiT3Ewun8u1WcJ9cjYPez
 XRVk9DjAi//+FaGw/yfDX1DHoWClY1XPmPUWCtx/S9W43Sal6a6U52CLoa5PHLi54bzD
 rgqpVgKVBbVyuJhFIqe/xq/TEwsque4ESS/yU/ThGwjAEhLAmOJOM8vw3GpE7GrlnAKO
 2dsmtoJRdUnNv0gvlbzX/kSYvKkDtw3dW9wu/B/nsDYltA12/wpPX6Elxc4klaZNgSlV
 Vdeg==
X-Gm-Message-State: AOAM532K05/m6c43+KFXLwFAQE//SEIV75ZXdcnpc0OMNChv3XMCRe4K
 rEp/3uGeUk1gMeiegEiVHVY=
X-Google-Smtp-Source: ABdhPJxeusx1caPeHdHB09plu8ypFBaVCpeZX2OYdt+vTNBu3WWgW/FB/EuDCLXCO8WH0av2bFYc7A==
X-Received: by 2002:a05:6512:15e:: with SMTP id
 m30mr3937440lfo.213.1606507119250; 
 Fri, 27 Nov 2020 11:58:39 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:38 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 02/28] video: fbcon: Use pr_debug() in fbcon
Date: Fri, 27 Nov 2020 20:57:59 +0100
Message-Id: <20201127195825.858960-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
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
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replacing DPRINTK() statements with pr_debug fixes
W=1 warnings.
And moves to a more standard logging setup at the same time.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
 drivers/video/fbdev/core/fbcon.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index bf61598bf1c3..2edf90f638f3 100644
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
@@ -1015,9 +1007,9 @@ static const char *fbcon_startup(void)
 	rows /= vc->vc_font.height;
 	vc_resize(vc, cols, rows);
 
-	DPRINTK("mode:   %s\n", info->fix.id);
-	DPRINTK("visual: %d\n", info->fix.visual);
-	DPRINTK("res:    %dx%d-%d\n", info->var.xres,
+	pr_debug("mode:   %s\n", info->fix.id);
+	pr_debug("visual: %d\n", info->fix.visual);
+	pr_debug("res:    %dx%d-%d\n", info->var.xres,
 		info->var.yres,
 		info->var.bits_per_pixel);
 
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
@@ -3299,7 +3291,7 @@ static void fbcon_exit(void)
 
 		if (info->queue.func)
 			pending = cancel_work_sync(&info->queue);
-		DPRINTK("fbcon: %s pending work\n", (pending ? "canceled" :
+		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" :
 			"no"));
 
 		for (j = first_fb_vc; j <= last_fb_vc; j++) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
