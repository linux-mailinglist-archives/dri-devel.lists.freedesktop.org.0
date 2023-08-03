Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C776F27C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 20:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD84610E669;
	Thu,  3 Aug 2023 18:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D0F10E658
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 18:40:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CD381F86A;
 Thu,  3 Aug 2023 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691088048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLFIkl5dxEfXrQ7FdcpLO0MYhflgWSwXAVdoBUcuh/k=;
 b=iTzRLI6f1WjL3zDbymf4fVgvbORIs/NXbPAePE830xzPxIkFvbHlP2yPQXFUoIb82TOo2S
 Ouol48sG236cN8s4Q9vTg/Y3V934GUaku1oYDH3AXpJ2Q2IgVDe1h5OAmMZCNUxniakS8R
 WATwVimaU/P8sxMhQ+zurJ7FWKASBsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691088048;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLFIkl5dxEfXrQ7FdcpLO0MYhflgWSwXAVdoBUcuh/k=;
 b=tWEmUu1whnIrpI8iQrVCahUw+QtK8bmjP+VM7QC7fJ9I0k0hMghwmCEGvtogeOybOBSLo1
 Zz3UZBVA45B9piDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54174139BD;
 Thu,  3 Aug 2023 18:40:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aDueE7D0y2TLGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Aug 2023 18:40:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v3 42/47] fbdev/sunxvr2500: Use fbdev I/O helpers
Date: Thu,  3 Aug 2023 20:36:07 +0200
Message-ID: <20230803184034.6456-43-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803184034.6456-1-tzimmermann@suse.de>
References: <20230803184034.6456-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set struct fb_ops and with FB_DEFAULT_IOMEM_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IOMEM_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

v3:
	* use _IOMEM_ in commit message
v2:
	* updated to use _IOMEM_ tokens

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/Kconfig      | 4 +---
 drivers/video/fbdev/sunxvr2500.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 01f67b21df06..f5ce8d6d1247 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -617,9 +617,7 @@ config FB_XVR500
 config FB_XVR2500
 	bool "Sun XVR-2500 3DLABS Wildcat support"
 	depends on (FB = y) && PCI && SPARC64
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	select VIDEO_NOMODESET
 	help
 	  This is the framebuffer device for the Sun XVR-2500 and similar
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 07ebf6941708..42426d09b935 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -66,10 +66,8 @@ static int s3d_setcolreg(unsigned regno,
 
 static const struct fb_ops s3d_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_setcolreg		= s3d_setcolreg,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
 };
 
 static int s3d_set_fbinfo(struct s3d_info *sp)
-- 
2.41.0

