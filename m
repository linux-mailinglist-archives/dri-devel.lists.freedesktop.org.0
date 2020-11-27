Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A12C6C49
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458966F3E2;
	Fri, 27 Nov 2020 19:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074B86F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f18so7112859ljg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ekXPc5E7Fh5wD/Vc411Zf73OtfZn7TTfUSuqDZSxDOI=;
 b=abL3wWcvsvIz2CzO/LLQDCf6XcLh3onTjaMFDbGE74/YxhdMd5qgru9TxPx1XN+iwj
 uvlGQppWRm4tryk0y+YoqhT1zyKdQHFNHWdbwFnhNiLbPBWzLDb2Q4lL5/fNiKgNuGK3
 qieT5nqi1qzBx9lSmNch74YLkmKW1LSxDX3omn3t33/G7J+bEEoNXDod3xPQOoffnTlC
 UOs2GrcWE2DMYOkzM6z5qM0FmTWCvRFzHnn/yP/XWrevQjm19rxNz5m5bh3rApNBsDTS
 UFW+++W0JdwSqoLqjua+cPbmHpauD1O2T5YtvRC7PECiKQkPylu3MlvlSjPYnA+FjUq2
 qUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ekXPc5E7Fh5wD/Vc411Zf73OtfZn7TTfUSuqDZSxDOI=;
 b=ZcJrSoThMcYfXI6N9Iaxn7DrYZd9vqmK188cKNEXiZA/LNrC0G82NeAp2wB2eJ7j+4
 EcXdvx2qMdI/VqYYInJ1U5I+HlqHn1DAAXa9L5Sl/N/2iuK0fx+Lvor2TdNRMJJLrHzP
 KDCiVUH0jdTHQqR4IGv3crZP/3h5IGN/c2AvkuuAnMKDw/RSWVbEpa1vKj/8e46pLY85
 Amb9oAADPNlm3/1aFcajp8qbrDqMqDIYVE+cj6Wv84Cdd94hrTj1A454eWRNafcw98Fg
 jwgCeLdrOF67LuofNsD6sN5GxYUDNaYmIum6Sp0TRY6t4zpaGKmJfnk42FuKx4Y5V4Pq
 /rsA==
X-Gm-Message-State: AOAM533lVizz0QSEIpTy+wpdJcva3iVFpidgM9LZScSKU3gzhqpDqHG9
 ymW0ZeHW95aO8QJ2ZPDq3qE=
X-Google-Smtp-Source: ABdhPJyOyRLSvkVpVR1HEUfAKSuZ5ePdfs+N0TGYeMdvRv4fmzf7VQ4BrA1YQM7s6/4t3ORr021/gQ==
X-Received: by 2002:a2e:80c4:: with SMTP id r4mr4469451ljg.284.1606507161441; 
 Fri, 27 Nov 2020 11:59:21 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:20 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 18/28] video: fbdev: mx3fb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:15 +0100
Message-Id: <20201127195825.858960-19-sam@ravnborg.org>
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

Fix W=1 warnings:
- Fix kernel-doc
- Drop unused code/variables

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Xiaofei Tan <tanxiaofei@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/mx3fb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index 894617ddabcb..fabb271337ed 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -445,7 +445,6 @@ static void sdc_enable_channel(struct mx3fb_info *mx3_fbi)
 static void sdc_disable_channel(struct mx3fb_info *mx3_fbi)
 {
 	struct mx3fb_data *mx3fb = mx3_fbi->mx3fb;
-	uint32_t enabled;
 	unsigned long flags;
 
 	if (mx3_fbi->txd == NULL)
@@ -453,7 +452,7 @@ static void sdc_disable_channel(struct mx3fb_info *mx3_fbi)
 
 	spin_lock_irqsave(&mx3fb->lock, flags);
 
-	enabled = sdc_fb_uninit(mx3_fbi);
+	sdc_fb_uninit(mx3_fbi);
 
 	spin_unlock_irqrestore(&mx3fb->lock, flags);
 
@@ -732,7 +731,7 @@ static int mx3fb_unmap_video_memory(struct fb_info *fbi);
 
 /**
  * mx3fb_set_fix() - set fixed framebuffer parameters from variable settings.
- * @info:	framebuffer information pointer
+ * @fbi:	framebuffer information pointer
  * @return:	0 on success or negative error code on failure.
  */
 static int mx3fb_set_fix(struct fb_info *fbi)
@@ -740,7 +739,7 @@ static int mx3fb_set_fix(struct fb_info *fbi)
 	struct fb_fix_screeninfo *fix = &fbi->fix;
 	struct fb_var_screeninfo *var = &fbi->var;
 
-	strncpy(fix->id, "DISP3 BG", 8);
+	memcpy(fix->id, "DISP3 BG", 8);
 
 	fix->line_length = var->xres_virtual * var->bits_per_pixel / 8;
 
@@ -1105,6 +1104,8 @@ static void __blank(int blank, struct fb_info *fbi)
 
 /**
  * mx3fb_blank() - blank the display.
+ * @blank:	blank value for the panel
+ * @fbi:	framebuffer information pointer
  */
 static int mx3fb_blank(int blank, struct fb_info *fbi)
 {
@@ -1126,7 +1127,7 @@ static int mx3fb_blank(int blank, struct fb_info *fbi)
 /**
  * mx3fb_pan_display() - pan or wrap the display
  * @var:	variable screen buffer information.
- * @info:	framebuffer information pointer.
+ * @fbi:	framebuffer information pointer.
  *
  * We look only at xoffset, yoffset and the FB_VMODE_YWRAP flag
  */
@@ -1387,6 +1388,8 @@ static int mx3fb_unmap_video_memory(struct fb_info *fbi)
 
 /**
  * mx3fb_init_fbinfo() - initialize framebuffer information object.
+ * @dev: the device
+ * @ops:	framebuffer device operations
  * @return:	initialized framebuffer structure.
  */
 static struct fb_info *mx3fb_init_fbinfo(struct device *dev,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
