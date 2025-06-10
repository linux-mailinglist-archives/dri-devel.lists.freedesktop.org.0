Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C2AD3455
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4550710E504;
	Tue, 10 Jun 2025 11:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Id45VbVW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="38jnTGb+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Id45VbVW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="38jnTGb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4521110E4FD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:03:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10C00211FF;
 Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABUl2ffpoBBeIt12BGpH0faSlBsBW5joo2PQQAIdpaM=;
 b=Id45VbVWroWjWP0Zr6bAil2yCrVwmBQMTbGVAWtleGaVjXA/yiTiy2sWVZ8rcEIknhRYU9
 KYcE7J5CxIFpUMSYpwpR0QMBK/MirOmFKt1bCpXLBzX2hxar2Ty9UEYbzQUydmMFsWrcWp
 fL3KvCw4llJjfgF4UduSGe+6bg4pU6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABUl2ffpoBBeIt12BGpH0faSlBsBW5joo2PQQAIdpaM=;
 b=38jnTGb+kFNN4cAUFJzSqW0kPn2SwCkuwEJDhDnXd2rFwnOVgIFRr7+639Tc0NW+4xSaDX
 PH7wCFHxGIpUfOCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Id45VbVW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=38jnTGb+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABUl2ffpoBBeIt12BGpH0faSlBsBW5joo2PQQAIdpaM=;
 b=Id45VbVWroWjWP0Zr6bAil2yCrVwmBQMTbGVAWtleGaVjXA/yiTiy2sWVZ8rcEIknhRYU9
 KYcE7J5CxIFpUMSYpwpR0QMBK/MirOmFKt1bCpXLBzX2hxar2Ty9UEYbzQUydmMFsWrcWp
 fL3KvCw4llJjfgF4UduSGe+6bg4pU6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABUl2ffpoBBeIt12BGpH0faSlBsBW5joo2PQQAIdpaM=;
 b=38jnTGb+kFNN4cAUFJzSqW0kPn2SwCkuwEJDhDnXd2rFwnOVgIFRr7+639Tc0NW+4xSaDX
 PH7wCFHxGIpUfOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5EA813A17;
 Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MEg+K/wQSGgOTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, jayalk@intworks.biz,
 linux@armlinux.org.uk, FlorianSchandinat@gmx.de, alchark@gmail.com,
 krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/14] fbdev/matroxfb: Remove trailing whitespaces
Date: Tue, 10 Jun 2025 12:56:38 +0200
Message-ID: <20250610105948.384540-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 10C00211FF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/matrox/g450_pll.c         | 24 ++++----
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 46 +++++++-------
 drivers/video/fbdev/matrox/matroxfb_g450.c    | 60 +++++++++----------
 drivers/video/fbdev/matrox/matroxfb_misc.c    | 20 +++----
 4 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
index ff8e321a22ce..96996efc9288 100644
--- a/drivers/video/fbdev/matrox/g450_pll.c
+++ b/drivers/video/fbdev/matrox/g450_pll.c
@@ -258,13 +258,13 @@ static inline unsigned int g450_findworkingpll(struct matrox_fb_info *minfo,
 	unsigned int found = 0;
 	unsigned int idx;
 	unsigned int mnpfound = mnparray[0];
-		
+
 	for (idx = 0; idx < mnpcount; idx++) {
 		unsigned int sarray[3];
 		unsigned int *sptr;
 		{
 			unsigned int mnp;
-		
+
 			sptr = sarray;
 			mnp = mnparray[idx];
 			if (mnp & 0x38) {
@@ -277,7 +277,7 @@ static inline unsigned int g450_findworkingpll(struct matrox_fb_info *minfo,
 		}
 		while (sptr >= sarray) {
 			unsigned int mnp = *sptr--;
-		
+
 			if (g450_testpll(minfo, mnp - 0x0300, pll) &&
 			    g450_testpll(minfo, mnp + 0x0300, pll) &&
 			    g450_testpll(minfo, mnp - 0x0200, pll) &&
@@ -310,12 +310,12 @@ static int g450_checkcache(struct matrox_fb_info *minfo,
 			   struct matrox_pll_cache *ci, unsigned int mnp_key)
 {
 	unsigned int i;
-	
+
 	mnp_key &= G450_MNP_FREQBITS;
 	for (i = 0; i < ci->valid; i++) {
 		if (ci->data[i].mnp_key == mnp_key) {
 			unsigned int mnp;
-			
+
 			mnp = ci->data[i].mnp_value;
 			if (i) {
 				memmove(ci->data + 1, ci->data, i * sizeof(*ci->data));
@@ -343,7 +343,7 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 			{
 				u_int8_t tmp, xpwrctrl;
 				unsigned long flags;
-				
+
 				matroxfb_DAC_lock_irqsave(flags);
 
 				xpwrctrl = matroxfb_DAC_in(minfo, M1064_XPWRCTRL);
@@ -375,7 +375,7 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 			}
 			{
 				u_int8_t misc;
-		
+
 				misc = mga_inb(M_MISC_REG_READ) & ~0x0C;
 				switch (pll) {
 					case M_PIXEL_PLL_A:
@@ -409,13 +409,13 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 				u_int8_t tmp;
 				unsigned int mnp;
 				unsigned long flags;
-				
+
 				matroxfb_DAC_lock_irqsave(flags);
 				tmp = matroxfb_DAC_in(minfo, M1064_XPWRCTRL);
 				if (!(tmp & 2)) {
 					matroxfb_DAC_out(minfo, M1064_XPWRCTRL, tmp | 2);
 				}
-				
+
 				mnp = matroxfb_DAC_in(minfo, M1064_XPIXPLLCM) << 16;
 				mnp |= matroxfb_DAC_in(minfo, M1064_XPIXPLLCN) << 8;
 				matroxfb_DAC_unlock_irqrestore(flags);
@@ -441,7 +441,7 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 			delta = pll_freq_delta(fout, g450_vco2f(mnp, vco));
 			for (idx = mnpcount; idx > 0; idx--) {
 				/* == is important; due to nextpll algorithm we get
-				   sorted equally good frequencies from lower VCO 
+				   sorted equally good frequencies from lower VCO
 				   frequency to higher - with <= lowest wins, while
 				   with < highest one wins */
 				if (delta <= deltaarray[idx-1]) {
@@ -472,7 +472,7 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 	{
 		unsigned long flags;
 		unsigned int mnp;
-		
+
 		matroxfb_DAC_lock_irqsave(flags);
 		mnp = g450_checkcache(minfo, ci, mnparray[0]);
 		if (mnp != NO_MORE_MNP) {
@@ -495,7 +495,7 @@ int matroxfb_g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 			 unsigned int pll)
 {
 	unsigned int* arr;
-	
+
 	arr = kmalloc(sizeof(*arr) * MNP_TABLE_SIZE * 2, GFP_KERNEL);
 	if (arr) {
 		int r;
diff --git a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
index 398b7035f5a9..99bdcb52ef4b 100644
--- a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
+++ b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
@@ -43,11 +43,11 @@ static void DAC1064_calcclock(const struct matrox_fb_info *minfo,
 	unsigned int p;
 
 	DBG(__func__)
-	
+
 	/* only for devices older than G450 */
 
 	fvco = PLL_calcclock(minfo, freq, fmax, in, feed, &p);
-	
+
 	p = (1 << p) - 1;
 	if (fvco <= 100000)
 		;
@@ -169,7 +169,7 @@ static void g450_set_plls(struct matrox_fb_info *minfo)
 	struct matrox_hw_state *hw = &minfo->hw;
 	int pixelmnp;
 	int videomnp;
-	
+
 	c2_ctl = hw->crtc2.ctl & ~0x4007;	/* Clear PLL + enable for CRTC2 */
 	c2_ctl |= 0x0001;			/* Enable CRTC2 */
 	hw->DACreg[POS1064_XPWRCTRL] &= ~0x02;	/* Stop VIDEO PLL */
@@ -192,7 +192,7 @@ static void g450_set_plls(struct matrox_fb_info *minfo)
 		}
 		c2_ctl |=  0x0006;	/* Use video PLL */
 		hw->DACreg[POS1064_XPWRCTRL] |= 0x02;
-		
+
 		outDAC1064(minfo, M1064_XPWRCTRL, hw->DACreg[POS1064_XPWRCTRL]);
 		matroxfb_g450_setpll_cond(minfo, videomnp, M_VIDEO_PLL);
 	}
@@ -200,7 +200,7 @@ static void g450_set_plls(struct matrox_fb_info *minfo)
 	hw->DACreg[POS1064_XPIXCLKCTRL] &= ~M1064_XPIXCLKCTRL_PLL_UP;
 	if (pixelmnp >= 0) {
 		hw->DACreg[POS1064_XPIXCLKCTRL] |= M1064_XPIXCLKCTRL_PLL_UP;
-		
+
 		outDAC1064(minfo, M1064_XPIXCLKCTRL, hw->DACreg[POS1064_XPIXCLKCTRL]);
 		matroxfb_g450_setpll_cond(minfo, pixelmnp, M_PIXEL_PLL_C);
 	}
@@ -303,9 +303,9 @@ void DAC1064_global_init(struct matrox_fb_info *minfo)
 				   poweroff TMDS. But if we boot with DFP connected,
 				   TMDS generated clocks are used instead of ALL pixclocks
 				   available... If someone knows which register
-				   handles it, please reveal this secret to me... */			
+				   handles it, please reveal this secret to me... */
 				hw->DACreg[POS1064_XPWRCTRL] &= ~0x04;		/* Poweroff TMDS */
-#endif				
+#endif
 				break;
 		}
 		/* Now set timming related variables... */
@@ -728,14 +728,14 @@ static void g450_mclk_init(struct matrox_fb_info *minfo)
 	} else {
 		unsigned long flags;
 		unsigned int pwr;
-		
+
 		matroxfb_DAC_lock_irqsave(flags);
 		pwr = inDAC1064(minfo, M1064_XPWRCTRL) & ~0x02;
 		outDAC1064(minfo, M1064_XPWRCTRL, pwr);
 		matroxfb_DAC_unlock_irqrestore(flags);
 	}
 	matroxfb_g450_setclk(minfo, minfo->values.pll.system, M_SYSTEM_PLL);
-	
+
 	/* switch clocks to their real PLL source(s) */
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION_REG, minfo->hw.MXoptionReg | 4);
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION3_REG, minfo->values.reg.opt3);
@@ -748,15 +748,15 @@ static void g450_memory_init(struct matrox_fb_info *minfo)
 	/* disable memory refresh */
 	minfo->hw.MXoptionReg &= ~0x001F8000;
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION_REG, minfo->hw.MXoptionReg);
-	
+
 	/* set memory interface parameters */
 	minfo->hw.MXoptionReg &= ~0x00207E00;
 	minfo->hw.MXoptionReg |= 0x00207E00 & minfo->values.reg.opt;
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION_REG, minfo->hw.MXoptionReg);
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION2_REG, minfo->values.reg.opt2);
-	
+
 	mga_outl(M_CTLWTST, minfo->values.reg.mctlwtst);
-	
+
 	/* first set up memory interface with disabled memory interface clocks */
 	pci_write_config_dword(minfo->pcidev, PCI_MEMMISC_REG, minfo->values.reg.memmisc & ~0x80000000U);
 	mga_outl(M_MEMRDBK, minfo->values.reg.memrdbk);
@@ -765,25 +765,25 @@ static void g450_memory_init(struct matrox_fb_info *minfo)
 	pci_write_config_dword(minfo->pcidev, PCI_MEMMISC_REG, minfo->values.reg.memmisc | 0x80000000U);
 
 	udelay(200);
-	
+
 	if (minfo->values.memory.ddr && (!minfo->values.memory.emrswen || !minfo->values.memory.dll)) {
 		mga_outl(M_MEMRDBK, minfo->values.reg.memrdbk & ~0x1000);
 	}
 	mga_outl(M_MACCESS, minfo->values.reg.maccess | 0x8000);
-	
+
 	udelay(200);
-	
+
 	minfo->hw.MXoptionReg |= 0x001F8000 & minfo->values.reg.opt;
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION_REG, minfo->hw.MXoptionReg);
-	
+
 	/* value is written to memory chips only if old != new */
 	mga_outl(M_PLNWT, 0);
 	mga_outl(M_PLNWT, ~0);
-	
+
 	if (minfo->values.reg.mctlwtst != minfo->values.reg.mctlwtst_core) {
 		mga_outl(M_CTLWTST, minfo->values.reg.mctlwtst_core);
 	}
-	
+
 }
 
 static void g450_preinit(struct matrox_fb_info *minfo)
@@ -791,7 +791,7 @@ static void g450_preinit(struct matrox_fb_info *minfo)
 	u_int32_t c2ctl;
 	u_int8_t curctl;
 	u_int8_t c1ctl;
-	
+
 	/* minfo->hw.MXoptionReg = minfo->values.reg.opt; */
 	minfo->hw.MXoptionReg &= 0xC0000100;
 	minfo->hw.MXoptionReg |= 0x00000020;
@@ -805,7 +805,7 @@ static void g450_preinit(struct matrox_fb_info *minfo)
 	pci_write_config_dword(minfo->pcidev, PCI_OPTION_REG, minfo->hw.MXoptionReg);
 
 	/* Init system clocks */
-		
+
 	/* stop crtc2 */
 	c2ctl = mga_inl(M_C2CTL);
 	mga_outl(M_C2CTL, c2ctl & ~1);
@@ -818,20 +818,20 @@ static void g450_preinit(struct matrox_fb_info *minfo)
 
 	g450_mclk_init(minfo);
 	g450_memory_init(minfo);
-	
+
 	/* set legacy VGA clock sources for DOSEmu or VMware... */
 	matroxfb_g450_setclk(minfo, 25175, M_PIXEL_PLL_A);
 	matroxfb_g450_setclk(minfo, 28322, M_PIXEL_PLL_B);
 
 	/* restore crtc1 */
 	mga_setr(M_SEQ_INDEX, 1, c1ctl);
-	
+
 	/* restore cursor */
 	outDAC1064(minfo, M1064_XCURCTRL, curctl);
 
 	/* restore crtc2 */
 	mga_outl(M_C2CTL, c2ctl);
-	
+
 	return;
 }
 
diff --git a/drivers/video/fbdev/matrox/matroxfb_g450.c b/drivers/video/fbdev/matrox/matroxfb_g450.c
index df3309fd14f3..86fe757d7761 100644
--- a/drivers/video/fbdev/matrox/matroxfb_g450.c
+++ b/drivers/video/fbdev/matrox/matroxfb_g450.c
@@ -32,29 +32,29 @@ struct mctl {
 #define WLMAX	0x3FF
 
 static const struct mctl g450_controls[] =
-{	{ { V4L2_CID_BRIGHTNESS, V4L2_CTRL_TYPE_INTEGER, 
+{	{ { V4L2_CID_BRIGHTNESS, V4L2_CTRL_TYPE_INTEGER,
 	  "brightness",
-	  0, WLMAX-BLMIN, 1, 370-BLMIN, 
+	  0, WLMAX-BLMIN, 1, 370-BLMIN,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.brightness) },
-	{ { V4L2_CID_CONTRAST, V4L2_CTRL_TYPE_INTEGER, 
+	{ { V4L2_CID_CONTRAST, V4L2_CTRL_TYPE_INTEGER,
 	  "contrast",
-	  0, 1023, 1, 127, 
+	  0, 1023, 1, 127,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.contrast) },
 	{ { V4L2_CID_SATURATION, V4L2_CTRL_TYPE_INTEGER,
 	  "saturation",
-	  0, 255, 1, 165, 
+	  0, 255, 1, 165,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.saturation) },
 	{ { V4L2_CID_HUE, V4L2_CTRL_TYPE_INTEGER,
 	  "hue",
-	  0, 255, 1, 0, 
+	  0, 255, 1, 0,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.hue) },
 	{ { MATROXFB_CID_TESTOUT, V4L2_CTRL_TYPE_BOOLEAN,
 	  "test output",
-	  0, 1, 1, 0, 
+	  0, 1, 1, 0,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.testout) },
 };
@@ -89,7 +89,7 @@ static inline int *get_ctrl_ptr(struct matrox_fb_info *minfo, unsigned int idx)
 static void tvo_fill_defaults(struct matrox_fb_info *minfo)
 {
 	unsigned int i;
-	
+
 	for (i = 0; i < G450CTRLS; i++) {
 		*get_ctrl_ptr(minfo, i) = g450_controls[i].desc.default_value;
 	}
@@ -99,7 +99,7 @@ static int cve2_get_reg(struct matrox_fb_info *minfo, int reg)
 {
 	unsigned long flags;
 	int val;
-	
+
 	matroxfb_DAC_lock_irqsave(flags);
 	matroxfb_DAC_out(minfo, 0x87, reg);
 	val = matroxfb_DAC_in(minfo, 0x88);
@@ -141,16 +141,16 @@ static void g450_compute_bwlevel(const struct matrox_fb_info *minfo, int *bl,
 
 static int g450_query_ctrl(void* md, struct v4l2_queryctrl *p) {
 	int i;
-	
+
 	i = get_ctrl_id(p->id);
 	if (i >= 0) {
 		*p = g450_controls[i].desc;
 		return 0;
 	}
 	if (i == -ENOENT) {
-		static const struct v4l2_queryctrl disctrl = 
+		static const struct v4l2_queryctrl disctrl =
 			{ .flags = V4L2_CTRL_FLAG_DISABLED };
-			
+
 		i = p->id;
 		*p = disctrl;
 		p->id = i;
@@ -163,7 +163,7 @@ static int g450_query_ctrl(void* md, struct v4l2_queryctrl *p) {
 static int g450_set_ctrl(void* md, struct v4l2_control *p) {
 	int i;
 	struct matrox_fb_info *minfo = md;
-	
+
 	i = get_ctrl_id(p->id);
 	if (i < 0) return -EINVAL;
 
@@ -209,7 +209,7 @@ static int g450_set_ctrl(void* md, struct v4l2_control *p) {
 			}
 			break;
 	}
-	
+
 
 	return 0;
 }
@@ -217,7 +217,7 @@ static int g450_set_ctrl(void* md, struct v4l2_control *p) {
 static int g450_get_ctrl(void* md, struct v4l2_control *p) {
 	int i;
 	struct matrox_fb_info *minfo = md;
-	
+
 	i = get_ctrl_id(p->id);
 	if (i < 0) return -EINVAL;
 	p->value = *get_ctrl_ptr(minfo, i);
@@ -247,22 +247,22 @@ static void computeRegs(struct matrox_fb_info *minfo, struct mavenregs *r,
 	unsigned long long piic;
 	int mnp;
 	int over;
-	
+
 	r->regs[0x80] = 0x03;	/* | 0x40 for SCART */
 
 	hvis = ((mt->HDisplay << 1) + 3) & ~3;
-	
+
 	if (hvis >= 2048) {
 		hvis = 2044;
 	}
-	
+
 	piic = 1000000000ULL * hvis;
 	do_div(piic, outd->h_vis);
 
 	dprintk(KERN_DEBUG "Want %u kHz pixclock\n", (unsigned int)piic);
-	
+
 	mnp = matroxfb_g450_setclk(minfo, piic, M_VIDEO_PLL);
-	
+
 	mt->mnp = mnp;
 	mt->pixclock = g450_mnp2f(minfo, mnp);
 
@@ -275,7 +275,7 @@ static void computeRegs(struct matrox_fb_info *minfo, struct mavenregs *r,
 	piic = outd->chromasc;
 	do_div(piic, mt->pixclock);
 	chromasc = piic;
-	
+
 	dprintk(KERN_DEBUG "Chroma is %08X\n", chromasc);
 
 	r->regs[0] = piic >> 24;
@@ -287,7 +287,7 @@ static void computeRegs(struct matrox_fb_info *minfo, struct mavenregs *r,
 	hsl = (((outd->h_sync + pixclock) / pixclock)) & ~1;
 	hlen = hvis + hfp + hsl + hbp;
 	over = hlen & 0x0F;
-	
+
 	dprintk(KERN_DEBUG "WL: vis=%u, hf=%u, hs=%u, hb=%u, total=%u\n", hvis, hfp, hsl, hbp, hlen);
 
 	if (over) {
@@ -310,14 +310,14 @@ static void computeRegs(struct matrox_fb_info *minfo, struct mavenregs *r,
 	r->regs[0x2C] = hfp;
 	r->regs[0x31] = hvis / 8;
 	r->regs[0x32] = hvis & 7;
-	
+
 	dprintk(KERN_DEBUG "PG: vis=%04X, hf=%02X, hs=%02X, hb=%02X, total=%04X\n", hvis, hfp, hsl, hbp, hlen);
 
 	r->regs[0x84] = 1;	/* x sync point */
 	r->regs[0x85] = 0;
 	hvis = hvis >> 1;
 	hlen = hlen >> 1;
-	
+
 	dprintk(KERN_DEBUG "hlen=%u hvis=%u\n", hlen, hvis);
 
 	mt->interlaced = 1;
@@ -332,13 +332,13 @@ static void computeRegs(struct matrox_fb_info *minfo, struct mavenregs *r,
 		unsigned int vtotal;
 		unsigned int vsyncend;
 		unsigned int vdisplay;
-		
+
 		vtotal = mt->VTotal;
 		vsyncend = mt->VSyncEnd;
 		vdisplay = mt->VDisplay;
 		if (vtotal < outd->v_total) {
 			unsigned int yovr = outd->v_total - vtotal;
-			
+
 			vsyncend += yovr >> 1;
 		} else if (vtotal > outd->v_total) {
 			vdisplay = outd->v_total - 4;
@@ -350,7 +350,7 @@ static void computeRegs(struct matrox_fb_info *minfo, struct mavenregs *r,
 		r->regs[0x33] = upper - 1;	/* upper blanking */
 		r->regs[0x82] = upper;		/* y sync point */
 		r->regs[0x83] = upper >> 8;
-		
+
 		mt->VDisplay = vdisplay;
 		mt->VSyncStart = outd->v_total - 2;
 		mt->VSyncEnd = outd->v_total;
@@ -509,9 +509,9 @@ static void cve2_init_TV(struct matrox_fb_info *minfo,
 	LR(0x80);
 	LR(0x82); LR(0x83);
 	LR(0x84); LR(0x85);
-	
+
 	cve2_set_reg(minfo, 0x3E, 0x01);
-	
+
 	for (i = 0; i < 0x3E; i++) {
 		LR(i);
 	}
@@ -558,7 +558,7 @@ static int matroxfb_g450_compute(void* md, struct my_timming* mt) {
 
 static int matroxfb_g450_program(void* md) {
 	struct matrox_fb_info *minfo = md;
-	
+
 	if (minfo->outputs[1].mode != MATROXFB_OUTPUT_MODE_MONITOR) {
 		cve2_init_TV(minfo, &minfo->hw.maven);
 	}
diff --git a/drivers/video/fbdev/matrox/matroxfb_misc.c b/drivers/video/fbdev/matrox/matroxfb_misc.c
index 8f159a2ad8d0..3fe99214c116 100644
--- a/drivers/video/fbdev/matrox/matroxfb_misc.c
+++ b/drivers/video/fbdev/matrox/matroxfb_misc.c
@@ -390,7 +390,7 @@ void matroxfb_vgaHWrestore(struct matrox_fb_info *minfo)
 
 static void get_pins(unsigned char __iomem* pins, struct matrox_bios* bd) {
 	unsigned int b0 = readb(pins);
-	
+
 	if (b0 == 0x2E && readb(pins+1) == 0x41) {
 		unsigned int pins_len = readb(pins+2);
 		unsigned int i;
@@ -426,7 +426,7 @@ static void get_pins(unsigned char __iomem* pins, struct matrox_bios* bd) {
 
 static void get_bios_version(unsigned char __iomem * vbios, struct matrox_bios* bd) {
 	unsigned int pcir_offset;
-	
+
 	pcir_offset = readb(vbios + 24) | (readb(vbios + 25) << 8);
 	if (pcir_offset >= 26 && pcir_offset < 0xFFE0 &&
 	    readb(vbios + pcir_offset    ) == 'P' &&
@@ -451,7 +451,7 @@ static void get_bios_version(unsigned char __iomem * vbios, struct matrox_bios*
 
 static void get_bios_output(unsigned char __iomem* vbios, struct matrox_bios* bd) {
 	unsigned char b;
-	
+
 	b = readb(vbios + 0x7FF1);
 	if (b == 0xFF) {
 		b = 0;
@@ -461,7 +461,7 @@ static void get_bios_output(unsigned char __iomem* vbios, struct matrox_bios* bd
 
 static void get_bios_tvout(unsigned char __iomem* vbios, struct matrox_bios* bd) {
 	unsigned int i;
-	
+
 	/* Check for 'IBM .*(V....TVO' string - it means TVO BIOS */
 	bd->output.tvout = 0;
 	if (readb(vbios + 0x1D) != 'I' ||
@@ -472,7 +472,7 @@ static void get_bios_tvout(unsigned char __iomem* vbios, struct matrox_bios* bd)
 	}
 	for (i = 0x2D; i < 0x2D + 128; i++) {
 		unsigned char b = readb(vbios + i);
-		
+
 		if (b == '(' && readb(vbios + i + 1) == 'V') {
 			if (readb(vbios + i + 6) == 'T' &&
 			    readb(vbios + i + 7) == 'V' &&
@@ -488,7 +488,7 @@ static void get_bios_tvout(unsigned char __iomem* vbios, struct matrox_bios* bd)
 
 static void parse_bios(unsigned char __iomem* vbios, struct matrox_bios* bd) {
 	unsigned int pins_offset;
-	
+
 	if (readb(vbios) != 0x55 || readb(vbios + 1) != 0xAA) {
 		return;
 	}
@@ -648,9 +648,9 @@ static int parse_pins5(struct matrox_fb_info *minfo,
 		       const struct matrox_bios *bd)
 {
 	unsigned int mult;
-	
+
 	mult = bd->pins[4]?8000:6000;
-	
+
 	minfo->limits.pixel.vcomax	= (bd->pins[ 38] == 0xFF) ? 600000			: bd->pins[ 38] * mult;
 	minfo->limits.system.vcomax	= (bd->pins[ 36] == 0xFF) ? minfo->limits.pixel.vcomax	: bd->pins[ 36] * mult;
 	minfo->limits.video.vcomax	= (bd->pins[ 37] == 0xFF) ? minfo->limits.system.vcomax	: bd->pins[ 37] * mult;
@@ -770,7 +770,7 @@ void matroxfb_read_pins(struct matrox_fb_info *minfo)
 	u32 biosbase;
 	u32 fbbase;
 	struct pci_dev *pdev = minfo->pcidev;
-	
+
 	memset(&minfo->bios, 0, sizeof(minfo->bios));
 	pci_read_config_dword(pdev, PCI_OPTION_REG, &opt);
 	pci_write_config_dword(pdev, PCI_OPTION_REG, opt | PCI_OPTION_ENABLE_ROM);
@@ -790,7 +790,7 @@ void matroxfb_read_pins(struct matrox_fb_info *minfo)
 		} else {
 			unsigned int ven = readb(b+0x64+0) | (readb(b+0x64+1) << 8);
 			unsigned int dev = readb(b+0x64+2) | (readb(b+0x64+3) << 8);
-			
+
 			if (ven != pdev->vendor || dev != pdev->device) {
 				printk(KERN_INFO "matroxfb: Legacy BIOS is for %04X:%04X, while this device is %04X:%04X\n",
 					ven, dev, pdev->vendor, pdev->device);
-- 
2.49.0

