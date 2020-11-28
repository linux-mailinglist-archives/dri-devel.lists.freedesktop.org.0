Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111D2C763A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765C36E0DC;
	Sat, 28 Nov 2020 22:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE466E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a9so12760218lfh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQt8Zy/RcRTV8RI+7xEG7mp4eH+bacz1GI81AvTRW6U=;
 b=nBaZDIVAfz80bCWu0yx2DfH3RI13Bv/U6WR5FSXtmNgxDUZXMLAKS8UEUBUWMDvuhH
 iSuHokAerrLo55ZyCEFz3mrNq97Efiej0UmE67ApNz9XOJhfmNvYS2iYP83fqoBPLROX
 BbHu6iprRb37DY6gDWPwEWKmzHulr1TV1D0BYXqNKnDt8u3DJFz/TytLcCZaol9EHDKK
 G3FYHO04RHFffxaqvqP24nuo6UMz2pKoXf5cvdLdbFdFRJLTFa92Yq2jg4aCfbX6v+YK
 /Mt7VGyqhY/26NVWBp0nAtKCVQ3YWvgLxqtlRAYSoa//bjwPkRu4sRtQb74AEgtPmqIl
 gJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FQt8Zy/RcRTV8RI+7xEG7mp4eH+bacz1GI81AvTRW6U=;
 b=hQRUNgW3G63SJHXS/QQ7x1eIEgn8P998A11ijcO4bbKyPP6NMOa9dWxHo2R30L4IKa
 pPU15gVicIoS3OO9Op8glZsjjHzR37mQ2KR7wVoqjJfgx7T2xVwsF1TSoYuceUcNykWz
 u2C3uwYFZExyt4wseZmiGfgJug/C895d3AHnJYabTedDBhZhi0tGGXeNwZ2L47zjM5Ix
 Hi7AV81gM6Npn46oX8Dd0eYoxbExb6CLiojQ0BrL0KiHQS3GWf/ls12wG+6aGyHH/hEl
 Xeib8gVKy232mMaVvTZ70fLhA4UlWPypyLGnrRBURPWdJZ3PFPczUkxbXjG2pS7uRvE5
 nSTQ==
X-Gm-Message-State: AOAM531BwVE7doONthXXfvmbDkd5wiPW0alhEyK3YfY/R8UVF6jkMaLg
 mezLoJ6kcEm4zH3selTGBGc=
X-Google-Smtp-Source: ABdhPJzlQNjBNn705RJBUCQ/M55lwEEf/6mv51LCAvjVISvV38KZWfSsU8ScP0w3xaBDZ7N217vjFA==
X-Received: by 2002:ac2:5b88:: with SMTP id o8mr6729659lfn.265.1606603294085; 
 Sat, 28 Nov 2020 14:41:34 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:33 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 06/28] video: fbdev: aty: Fix set but not used warnings in
 mach64_ct
Date: Sat, 28 Nov 2020 23:40:52 +0100
Message-Id: <20201128224114.1033617-7-sam@ravnborg.org>
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

Fix W=1 warnings about variables assigned but never used.
- One variable is only used when CONFIG_FB_ATY_GENERIC_LCD is defined
  Fix so variable is only defined with CONFIG_FB_ATY_GENERIC_LCD
- Several variables was only assigned by a call to aty_ld_le32().
  Drop the variables but keep the call to aty_ld_le32() as it may
  have unexpected side-effects.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
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
