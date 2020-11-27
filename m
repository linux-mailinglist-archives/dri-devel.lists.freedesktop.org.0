Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE92C6C4D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D5E6EEB9;
	Fri, 27 Nov 2020 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD936F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r18so7136552ljc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCWN7JDF/GtG5ZT98j8MKTwxgU6VMyLEQn0BdCwiEZg=;
 b=jbH3C6iDq7RWgytVy0NqJ9b8P5K30Cm7OdBwf8Ji9IkOVEjaGTEXkzXn/jjyXzr7kY
 sjLBjzNEg9oFpHLY24Tn7gC2A8ZCORXoCpF9YpsgdLCokn6acUS/J3u73rJxgj6AbLzU
 h8WHUVdRQHAjkyXkxkZ9lkE7tICAm32EGZ/EjMKh5YvrGhcx226zT2Utcb5FqPbogvRY
 4nQynzKQAQk1J30F6wuA2tl7s+4Odrj08KY7ptk0YZ0WgZaJ8bV2yEAxaFmrlwu3ROhJ
 7mIgPTjRQ94jK57rwZOIOYml+tAcX2ezQ9a7rIzmhCA7E1k1Cs4NCE8bzquqiB2US41P
 322g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xCWN7JDF/GtG5ZT98j8MKTwxgU6VMyLEQn0BdCwiEZg=;
 b=SRdLa3NZA58XmJ7yjy98XOBzVV+Urp/LM/yIGo0k0Bk50esLCjKpdm0ZDUmAmfTqFp
 wnlzXodSuRkMz+icmpU1tf8aiS5M9cod5RPV0sGdgdl+S3gKbDPtQy6ghDFk3UG2UNbD
 s6GSOZIN2RMSLKLh9vNgUBWZUMriETw5MMUNriS8pQ76MRHviVZysS3Nxbo7p7hwtwnv
 Cn0VSDdJIIC9W+qbdLUsAnpoy/1ViutLU/zVfcSdIJE6YcBakfn5yokbEl2f2H7TyYpw
 tfjDBNrUlH1a1Twb9vBLGF+7JQhaoYyMKfpDY78XnhlB9YD/5PHXjG0C0otcNxV9OZc0
 gVkQ==
X-Gm-Message-State: AOAM531kQU3GQLz8vVhmw/fcFFfW5xtjnRvK01xJ4n5vmysT8lqoQhyL
 Kc7CP3NbvvTQ75jK8PHVs0o=
X-Google-Smtp-Source: ABdhPJwfQQRY1xyFWQCeqxGmr8x+xQ8Y8oFVP5doJc1VCIcNMxQvxTGPTEVTuqS/GyeZgySJ4zyVnA==
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr1958143ljn.461.1606507158904; 
 Fri, 27 Nov 2020 11:59:18 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:18 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 17/28] video: fbdev: tgafb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:14 +0100
Message-Id: <20201127195825.858960-18-sam@ravnborg.org>
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
- Drop unused code

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Joe Perches <joe@perches.com>
---
 drivers/video/fbdev/tgafb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 666fbe2f671c..ae0cf5540636 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -555,7 +555,7 @@ tgafb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue,
 
 /**
  *      tgafb_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int
@@ -837,7 +837,7 @@ tgafb_clut_imageblit(struct fb_info *info, const struct fb_image *image)
 	u32 *palette = ((u32 *)info->pseudo_palette);
 	unsigned long pos, line_length, i, j;
 	const unsigned char *data;
-	void __iomem *regs_base, *fb_base;
+	void __iomem *fb_base;
 
 	dx = image->dx;
 	dy = image->dy;
@@ -855,7 +855,6 @@ tgafb_clut_imageblit(struct fb_info *info, const struct fb_image *image)
 	if (dy + height > vyres)
 		height = vyres - dy;
 
-	regs_base = par->tga_regs_base;
 	fb_base = par->tga_fb_base;
 
 	pos = dy * line_length + (dx * 4);
@@ -1034,7 +1033,7 @@ tgafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		     regs_base + TGA_MODE_REG);
 }
 
-/**
+/*
  *      tgafb_copyarea - REQUIRED function. Can use generic routines if
  *                       non acclerated hardware and packed pixel based.
  *                       Copies on area of the screen to another area.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
