Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F476B0DE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3F710E39A;
	Tue,  1 Aug 2023 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F610E395
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:15:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E60DE21E2D;
 Tue,  1 Aug 2023 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690884949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kPVFB/FWCYmgOzFJO0/9icFAJgmXM6i+x0H1dAm3OY=;
 b=CFTq+68z9hB2H8rnMrs9KkeV1hVtKLWmYi3JOQlj8QmDg2HcHq+B/0XUzSE4ZLQI1xYMoQ
 +EHfTzukdT6VidVHQObf+6Qb5iqvkkDZH+MaWhcBSn0ylz/5g3ilwaRrH1oNCDAtA1J/TA
 fmBcITOjtyV7CB4vpiFZgo5SEhfOv4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690884949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kPVFB/FWCYmgOzFJO0/9icFAJgmXM6i+x0H1dAm3OY=;
 b=Hs6BwvnOK3ekASev7S2vxeqVFZ41mfCN1LeFxVvqNqBBJg+6/1xxv8jdlqlaFPCq6skEDc
 9yH00yLVA/y84SDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB52E139BD;
 Tue,  1 Aug 2023 10:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oJntKFXbyGQBXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:15:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 11/47] fbdev/fsl-diu-fb: Use fbdev I/O helpers
Date: Tue,  1 Aug 2023 12:13:16 +0200
Message-ID: <20230801101541.900-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801101541.900-1-tzimmermann@suse.de>
References: <20230801101541.900-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 kvm@vger.kernel.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set struct fb_ops and with FB_DEFAULT_IO_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IO_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

v2:
	* updated to use _IOMEM_ tokens

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Helge Deller <deller@gmx.de>
Cc: Timur Tabi <timur@kernel.org>
---
 drivers/video/fbdev/Kconfig      | 4 +---
 drivers/video/fbdev/fsl-diu-fb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index fe62de330326..d225bd2d47a9 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1661,10 +1661,8 @@ config PXA3XX_GCU
 config FB_FSL_DIU
 	tristate "Freescale DIU framebuffer support"
 	depends on FB && FSL_SOC
+	select FB_IOMEM_HELPERS
 	select FB_MODE_HELPERS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select PPC_LIB_RHEAP
 	help
 	  Framebuffer driver for the Freescale SoC DIU
diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index c62b48f27ba9..7fbd9f069ac2 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1451,13 +1451,11 @@ static int fsl_diu_release(struct fb_info *info, int user)
 
 static const struct fb_ops fsl_diu_ops = {
 	.owner = THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var = fsl_diu_check_var,
 	.fb_set_par = fsl_diu_set_par,
 	.fb_setcolreg = fsl_diu_setcolreg,
 	.fb_pan_display = fsl_diu_pan_display,
-	.fb_fillrect = cfb_fillrect,
-	.fb_copyarea = cfb_copyarea,
-	.fb_imageblit = cfb_imageblit,
 	.fb_ioctl = fsl_diu_ioctl,
 	.fb_open = fsl_diu_open,
 	.fb_release = fsl_diu_release,
-- 
2.41.0

