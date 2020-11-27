Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC12C6C3E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731836F3C9;
	Fri, 27 Nov 2020 19:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89306F3BE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:48 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z21so8528797lfe.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n7AUSPOHxh+ROspnXmAGmt29lw2/92P6Xx7q8Q73sVQ=;
 b=rtFG8lhgrSILnbwb3Lrt+6OpeHbZNZZZ0Hk1Pq3EWdYR4I2S5LnrPrBzUfYZdnhLbD
 NvK9RUJ9xGorG4tNxoKdBJ82XL2i8RQ04daPP5LdoFpZ5lZhxqs6KOh1eSj0w9JDaEWs
 kxhsYH47ImmndKEPH6OoKLEcPH0Ei1WHeekziKNNKCbiBTWrB4dPDNM659FywgbWkLjL
 syfH61UpKOOV4ilWc+dl+pdPB9hiUwUvphw+JRZZbGoS1fet27fx8K5LZezyUNZWqGpH
 oKkfek3UuGGeZo3m4GxX3ZegpL4xG8XJIvJLoC53LI2iYHIw0aLB76MnGLTcyklWZdf6
 Ig2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n7AUSPOHxh+ROspnXmAGmt29lw2/92P6Xx7q8Q73sVQ=;
 b=EN2PgcH6Foeny/8h0p574ZnECdwL72RDsZWJdu4Ng0SCYIdZr+SGs+COEAGlr2QGPl
 II1sLhKVx0ytBLII9iSa+jM0RR9vkbo8Eh84Ss/hWgxPee2hiMiCujiTsoXyAfp4tNz6
 PmgxjaPw5t8bFvHyocEIpkLQI5oy2drUvTgu0UpAEu+lLhERKGKqKY/rf4d1N+EKCSwj
 Wytja8U0wNeTTqvibOwCPaJAK3trvj3igkanhPGXwKUDICiSoMYfz0TxfH2/LIhi3gRx
 6+t3IV1mW/h6IYoasR0Usxxb9FYogZCwNFbYwbKaa+i/G/oi89e9Nhp90EDcvQU5vqGK
 Ba1g==
X-Gm-Message-State: AOAM532z6mokIiyzJXbFdKhzD3GBptgbVAmDJ+6lvlqLG3eTIc7EUPzJ
 Y0DsPBIfbuEBhmhVPJHX2eg=
X-Google-Smtp-Source: ABdhPJwT6Vp8ufL83Vnm7rhaXWMBXozvqUMkmLlmRs0l1JHZOollRcQVcjhC7wW8zOiKw6exXOpPFA==
X-Received: by 2002:a05:6512:358d:: with SMTP id
 m13mr4193587lfr.435.1606507127242; 
 Fri, 27 Nov 2020 11:58:47 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:46 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 05/28] video: fbdev: aty: Fix W=1 warnings in atyfb_base
Date: Fri, 27 Nov 2020 20:58:02 +0100
Message-Id: <20201127195825.858960-6-sam@ravnborg.org>
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

Fix W=1 warnings about variables assigned but never used.

- Drop variables that was never used
- Avoid using a local variable by moving the expression to an if
  condition

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joe Perches <joe@perches.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index c8feff0ee8da..d1eb9218debb 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2360,22 +2360,20 @@ static int aty_init(struct fb_info *info)
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
+		aty_ld_le32(DAC_CNTL, par);
 #ifdef CONFIG_ATARI
 		clk_type = CLK_ATI18818_1;
-		dac_type = (stat0 >> 9) & 0x07;
-		if (dac_type == 0x07)
+		if (((stat0 >> 9) & 0x07) == 0x07)
 			dac_subtype = DAC_ATT20C408;
 		else
 			dac_subtype = (aty_ld_8(SCRATCH_REG1 + 1, par) & 0xF0) | dac_type;
 #else
-		dac_type = DAC_IBMRGB514;
 		dac_subtype = DAC_IBMRGB514;
 		clk_type = CLK_IBMRGB514;
 #endif
@@ -3062,7 +3060,6 @@ static int atyfb_setup_sparc(struct pci_dev *pdev, struct fb_info *info,
 	if (dp == of_console_device) {
 		struct fb_var_screeninfo *var = &default_var;
 		unsigned int N, P, Q, M, T, R;
-		u32 v_total, h_total;
 		struct crtc crtc;
 		u8 pll_regs[16];
 		u8 clock_cntl;
@@ -3078,9 +3075,6 @@ static int atyfb_setup_sparc(struct pci_dev *pdev, struct fb_info *info,
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
