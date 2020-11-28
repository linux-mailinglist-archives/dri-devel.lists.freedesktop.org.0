Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6593E2C7637
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA26E0D9;
	Sat, 28 Nov 2020 22:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278C6ECBE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:33 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r24so12736846lfm.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pEqxbCWX9q9yDbDvSbn0kwCSjD77LNJ8Br1S/hGjS4Y=;
 b=Rv/zkpFM80luzwk9qz8tKKHWMQ6AMMsclRVZq8PzkJM18cISEnSccV7Z8NIypZ1jW/
 UpJkema7xmGdArdEUTxR3gSPeu/62Fr6qy4keamZ0qJNqIQD4YRj1StMsnasqAFSSZ2i
 nF68Z1WHShiUim0pi8VvWJKFAcfN8Jfhke8fy9mYSrj/rvKau8xzj8LEJo+jBhVJUZeD
 Clfkv1bN3MyIy9fOm7S9V8Pc+2ayjfrjqSUkchx1EursTN5wqxO9Bb4YCYAyII3W9mYP
 nwn5OYVYnhEOLz4R7WWkyxFs8r+3ZzFCNbcB4d4Y9Fjkmr9TXb3rUL4DXvKhIu65S/qb
 vfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pEqxbCWX9q9yDbDvSbn0kwCSjD77LNJ8Br1S/hGjS4Y=;
 b=FdwwgG6VujmTlqiosBr7Zns6KqqJGkHo9c/QnIRGL6q5BBiZl80hCsl2du0A+2ApAG
 X2oDlqYibXZR8tHDKzl8Z2WW8wpoBuQ2ZdsNYIhZ7ZAKmWKz9rAaekVYzck+wMRJDTEa
 JkZzGEbGozUfHY98I8ryMkEuvHgQXKLcfNUkhHcILIv6/2iahP53dacStFb58H92AoOs
 0oSZ+WIQGL/lfPEJFsYfN9g5bH622F5DzfDh2jQfNJDJ32ABvEjnv/SGMEScvOiFEnc+
 3IO8T9w+5sCYVaJA1wUtHScAGakU6LHEOhAVYijmt0+g/0ETBdC/WoY8UfeRwa9wbD9f
 XRFw==
X-Gm-Message-State: AOAM533oVR6ZVb5Xw+Qs6Sg8uAi/hVQscP194QzfMoZGQAxP1OtZhiUL
 QPTmaqO6NlLoxbVC7sJtfX0=
X-Google-Smtp-Source: ABdhPJxCfP77M8/2JZ9sjq/1cfSJg2rs/6jPaUmktbALDcsy2SGRemB6E1qPPqvUpiL7ISv6YIEbXA==
X-Received: by 2002:a19:3817:: with SMTP id f23mr6381269lfa.587.1606603292296; 
 Sat, 28 Nov 2020 14:41:32 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:31 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 05/28] video: fbdev: aty: Fix set but not used warnings
Date: Sat, 28 Nov 2020 23:40:51 +0100
Message-Id: <20201128224114.1033617-6-sam@ravnborg.org>
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
 Alex Dewar <alex.dewar90@gmail.com>, kernel test robot <lkp@intel.com>,
 Jason Yan <yanaijie@huawei.com>,
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

Fix W=1 warnings about variables assigned but never used.

- Drop variables that was set but never used
- Make variable definition conditional om ATARI

v2:
  - Fix m68k build error (kernel test robot)
  - Improve subject (Lee Jones)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: kernel test robot <lkp@intel.com> # m68k build fix
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joe Perches <joe@perches.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index c8feff0ee8da..83c8e809955a 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2353,6 +2353,9 @@ static int aty_init(struct fb_info *info)
 	int gtb_memsize, has_var = 0;
 	struct fb_var_screeninfo var;
 	int ret;
+#ifdef CONFIG_ATARI
+	u8 dac_type;
+#endif
 
 	init_waitqueue_head(&par->vblank.wait);
 	spin_lock_init(&par->int_lock);
@@ -2360,13 +2363,12 @@ static int aty_init(struct fb_info *info)
 #ifdef CONFIG_FB_ATY_GX
 	if (!M64_HAS(INTEGRATED)) {
 		u32 stat0;
-		u8 dac_type, dac_subtype, clk_type;
+		u8 dac_subtype, clk_type;
 		stat0 = aty_ld_le32(CNFG_STAT0, par);
 		par->bus_type = (stat0 >> 0) & 0x07;
 		par->ram_type = (stat0 >> 3) & 0x07;
 		ramname = aty_gx_ram[par->ram_type];
 		/* FIXME: clockchip/RAMDAC probing? */
-		dac_type = (aty_ld_le32(DAC_CNTL, par) >> 16) & 0x07;
 #ifdef CONFIG_ATARI
 		clk_type = CLK_ATI18818_1;
 		dac_type = (stat0 >> 9) & 0x07;
@@ -2375,7 +2377,6 @@ static int aty_init(struct fb_info *info)
 		else
 			dac_subtype = (aty_ld_8(SCRATCH_REG1 + 1, par) & 0xF0) | dac_type;
 #else
-		dac_type = DAC_IBMRGB514;
 		dac_subtype = DAC_IBMRGB514;
 		clk_type = CLK_IBMRGB514;
 #endif
@@ -3062,7 +3063,6 @@ static int atyfb_setup_sparc(struct pci_dev *pdev, struct fb_info *info,
 	if (dp == of_console_device) {
 		struct fb_var_screeninfo *var = &default_var;
 		unsigned int N, P, Q, M, T, R;
-		u32 v_total, h_total;
 		struct crtc crtc;
 		u8 pll_regs[16];
 		u8 clock_cntl;
@@ -3078,9 +3078,6 @@ static int atyfb_setup_sparc(struct pci_dev *pdev, struct fb_info *info,
 		crtc.gen_cntl = aty_ld_le32(CRTC_GEN_CNTL, par);
 		aty_crtc_to_var(&crtc, var);
 
-		h_total = var->xres + var->right_margin + var->hsync_len + var->left_margin;
-		v_total = var->yres + var->lower_margin + var->vsync_len + var->upper_margin;
-
 		/*
 		 * Read the PLL to figure actual Refresh Rate.
 		 */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
