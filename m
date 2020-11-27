Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3292C6C40
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D02A6F3D0;
	Fri, 27 Nov 2020 19:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C5E6F3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y7so7111485lji.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/znDw06zFdh3Au85v8bQXn1l/SWiG3rqtYog18OgpP0=;
 b=Ko3vuo/CkINDtMby612nix2mMnEfnh1/yge7yOuFBmqaxTz4vqSVCRZfsDRQ2icjG9
 DMW/AY92frRlDN8st+P+UB8p1cOq7yx4/1vy67JClUGRQSi0Z42QttbRMIO8XAL7DLEj
 YeAc0Bijvcd2cna3RONHjpYkdRyZb+7xbxZMYcPD1628/DfTeaMwmDicQUkMQ9yzI3Q1
 VB5asklArK8o3s+R8dNYIVJko1jnksafX1OI2PSXgp1pXNgdw5bEt+q7ac25VhjnEYA9
 iEcWUDrH9cUe4lSCTfkfLYD000OMDCJ5rpPHF8lRZf1ihE85tIdvhLZE7h31TeCPQrhg
 0E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/znDw06zFdh3Au85v8bQXn1l/SWiG3rqtYog18OgpP0=;
 b=crMKPo+Y8LYM3HaxeE4MqL/VT6YoGAJdfc/Bf6hBia9hBpQvhqsmtcP+Fs41GqwEDN
 vo6N1GIP+ulDPLr9DtoN5aJrc6RyBG3E84ubp/X3wtdOHj8WXwuMR6nr8Tx2C5nZCrt2
 caXx0PtqHOpJqqT0gZhw26jbU0eBxkM0rBm3EGlsujtbaigAehSiINkANb7GR2u7TugH
 70eQo5GxXcRBnY9or/EgBE9T7jfixRbyuqTtJECk5xWRU0PNGWaz/h2z6x0bx7DmhilH
 ZHCSA9dz+Yx2dcEhoxGsdpx6tiLHbntCnE5YTT9f3i2h+KoLzSWSc/EOZsKMEBF96AQP
 LsuQ==
X-Gm-Message-State: AOAM530FGem+vvtvuhVKoQk49TMYzCAlEWPjR2bVGnWF/4+oBINeMA5q
 q9k6W7DXEX+5cNgyDq7lK8c=
X-Google-Smtp-Source: ABdhPJxJJrsSyrEycBj6HJRNco5cA49HBb6Xw5g+OEZnzHuIEFNhlHoXUIBL26kqzIT6LvYFOGW9zQ==
X-Received: by 2002:a2e:9118:: with SMTP id m24mr439285ljg.363.1606507129848; 
 Fri, 27 Nov 2020 11:58:49 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:49 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 06/28] video: fbdev: aty: Fix W=1 warnings in mach64_ct
Date: Fri, 27 Nov 2020 20:58:03 +0100
Message-Id: <20201127195825.858960-7-sam@ravnborg.org>
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

Fix W=1 about variables assigned but never used.
- One variable is only used when CONFIG_FB_ATY_GENERIC_LCD is defined
  Fix so variable is only defined with CONFIG_FB_ATY_GENERIC_LCD
- Several variables was only assigned by a call to aty_ld_le32().
  Drop the variables but keep the call to aty_ld_le32() as it may
  have unexpected side-effects.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/aty/mach64_ct.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/aty/mach64_ct.c b/drivers/video/fbdev/aty/mach64_ct.c
index f87cc81f4fa2..011b07e44e0d 100644
--- a/drivers/video/fbdev/aty/mach64_ct.c
+++ b/drivers/video/fbdev/aty/mach64_ct.c
@@ -281,10 +281,13 @@ static u32 aty_pll_to_var_ct(const struct fb_info *info, const union aty_pll *pl
 void aty_set_pll_ct(const struct fb_info *info, const union aty_pll *pll)
 {
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
-	u32 crtc_gen_cntl, lcd_gen_cntrl;
+	u32 crtc_gen_cntl;
 	u8 tmp, tmp2;
 
-	lcd_gen_cntrl = 0;
+#ifdef CONFIG_FB_ATY_GENERIC_LCD
+	u32 lcd_gen_cntrl = 0;
+#endif
+
 #ifdef DEBUG
 	printk("atyfb(%s): about to program:\n"
 		"pll_ext_cntl=0x%02x pll_gen_cntl=0x%02x pll_vclk_cntl=0x%02x\n",
@@ -402,7 +405,7 @@ static int aty_init_pll_ct(const struct fb_info *info, union aty_pll *pll)
 	struct atyfb_par *par = (struct atyfb_par *) info->par;
 	u8 mpost_div, xpost_div, sclk_post_div_real;
 	u32 q, memcntl, trp;
-	u32 dsp_config, dsp_on_off, vga_dsp_config, vga_dsp_on_off;
+	u32 dsp_config;
 #ifdef DEBUG
 	int pllmclk, pllsclk;
 #endif
@@ -488,9 +491,9 @@ static int aty_init_pll_ct(const struct fb_info *info, union aty_pll *pll)
 
 	/* Allow BIOS to override */
 	dsp_config = aty_ld_le32(DSP_CONFIG, par);
-	dsp_on_off = aty_ld_le32(DSP_ON_OFF, par);
-	vga_dsp_config = aty_ld_le32(VGA_DSP_CONFIG, par);
-	vga_dsp_on_off = aty_ld_le32(VGA_DSP_ON_OFF, par);
+	aty_ld_le32(DSP_ON_OFF, par);
+	aty_ld_le32(VGA_DSP_CONFIG, par);
+	aty_ld_le32(VGA_DSP_ON_OFF, par);
 
 	if (dsp_config)
 		pll->ct.dsp_loop_latency = (dsp_config & DSP_LOOP_LATENCY) >> 16;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
