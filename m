Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC772E0AD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0810410E397;
	Tue, 13 Jun 2023 11:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BEA10E373
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8137A2240D;
 Tue, 13 Jun 2023 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP5XPQ+B+tBgODPORD3Z9zsr7bRrI+Ip0rV0x56IK2w=;
 b=pTSICEX1c8Qsm19zd8eQCOJmYryvMjO4aaOSHlOwtXah5fzubr34ywOkPBk4udx7Cd8n99
 Qogm1Tg5gQANMUt14YBudjAK4+V0BX1XBy+bxA2fQQDpo10af0cqtvdgcZbgBS0ghOnZiJ
 JCTCiP5206NMjTAyMPMCilRo+t0oVgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP5XPQ+B+tBgODPORD3Z9zsr7bRrI+Ip0rV0x56IK2w=;
 b=9Ocgsrqyr17hP8X9xHsC/t7ebR3q+Nbnf3ogJQ3SjTVVLWEjLKHtw3tY3i4JoL3nQy+/SE
 YEXpcN8c7ALLfPCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CF8A13483;
 Tue, 13 Jun 2023 11:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mAscDolOiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 16/38] fbdev/mb862xxfb: Output messages with fb_dbg()
Date: Tue, 13 Jun 2023 13:06:51 +0200
Message-ID: <20230613110953.24176-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cases were output helpers are called with struct fb_info.dev.
Use fb_dbg() instead. Prepares fbdev for making struct fb_info.dev
optional.

v2:
	* fix another reference to struct fb_info.dev (kernel test reobot)
	* remove fb_err() from commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index b5c8fcab9940d..119c2a582ecbd 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -112,8 +112,7 @@ static int mb862xxfb_check_var(struct fb_var_screeninfo *var,
 {
 	unsigned long tmp;
 
-	if (fbi->dev)
-		dev_dbg(fbi->dev, "%s\n", __func__);
+	fb_dbg(fbi, "%s\n", __func__);
 
 	/* check if these values fit into the registers */
 	if (var->hsync_len > 255 || var->vsync_len > 255)
@@ -290,7 +289,7 @@ static int mb862xxfb_blank(int mode, struct fb_info *fbi)
 	struct mb862xxfb_par  *par = fbi->par;
 	unsigned long reg;
 
-	dev_dbg(fbi->dev, "blank mode=%d\n", mode);
+	fb_dbg(fbi, "blank mode=%d\n", mode);
 
 	switch (mode) {
 	case FB_BLANK_POWERDOWN:
@@ -791,7 +790,7 @@ static void of_platform_mb862xx_remove(struct platform_device *ofdev)
 	resource_size_t res_size = resource_size(par->res);
 	unsigned long reg;
 
-	dev_dbg(fbi->dev, "%s release\n", fbi->fix.id);
+	fb_dbg(fbi, "%s release\n", fbi->fix.id);
 
 	/* display off */
 	reg = inreg(disp, GC_DCM1);
@@ -1138,7 +1137,7 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
 	struct mb862xxfb_par *par = fbi->par;
 	unsigned long reg;
 
-	dev_dbg(fbi->dev, "%s release\n", fbi->fix.id);
+	fb_dbg(fbi, "%s release\n", fbi->fix.id);
 
 	/* display off */
 	reg = inreg(disp, GC_DCM1);
-- 
2.41.0

