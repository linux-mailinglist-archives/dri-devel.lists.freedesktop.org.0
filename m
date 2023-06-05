Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CA72298A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4A388EFE;
	Mon,  5 Jun 2023 14:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B5D10E2B9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5298021B6B;
 Mon,  5 Jun 2023 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnk0YOv/Eu2iF8Q5iRVynJgcEiWOa6yaAnOzMFuFse4=;
 b=NOEpBbmAlmRNU0paQCSRMj0x2y+NFYvstMHvgGFkTB2jUN2R0YsCXYltwDj/NgnPShorDL
 w6eqV1xY1oVuyLhEAJBvo4/rpotWedNJ+SZQXMzSdJivB11rA5jIQ278e+fZ3UgvKgma8V
 1JLEjzlx+AjFzJR+3vqOCarcDHn24jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnk0YOv/Eu2iF8Q5iRVynJgcEiWOa6yaAnOzMFuFse4=;
 b=nuHc/4FX/IVvL1qPWJOhjJs3mwBw5eb8LeY2oOTuU22v4r9iXbXfAP3uuWtcVVrCfaw6GO
 1/ae9UTfeCjfx2BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14F55139C8;
 Mon,  5 Jun 2023 14:48:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QANABLL1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 12/30] fbdev/mb862xxfb: Output messages with fb_dbg() and
 fb_err()
Date: Mon,  5 Jun 2023 16:47:54 +0200
Message-Id: <20230605144812.15241-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cases were output helpers are called with struct fb_info.dev.
Use fb_dbg() and fb_err() instead. Prepares fbdev for making struct
fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index b5c8fcab9940..99729611e04d 100644
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
@@ -1138,7 +1137,7 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
 	struct mb862xxfb_par *par = fbi->par;
 	unsigned long reg;
 
-	dev_dbg(fbi->dev, "%s release\n", fbi->fix.id);
+	fb_dbg(fbi, "%s release\n", fbi->fix.id);
 
 	/* display off */
 	reg = inreg(disp, GC_DCM1);
-- 
2.40.1

