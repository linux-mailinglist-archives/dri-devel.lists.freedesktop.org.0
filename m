Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674576F2A0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 20:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9E10E672;
	Thu,  3 Aug 2023 18:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4E310E049
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 18:40:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62DC021976;
 Thu,  3 Aug 2023 18:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691088042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2E2v77hNXXj45ySO3R5LK5LIJ7zVwT9EOwn+KwMDGs=;
 b=pUsGqR9v9sQT/Ta4tBxAyD62c1T+bCCsd7bUANApsPSw1jg9BrvB9OuF8f+9ezt63XgMPa
 /qtcpIVYiTmG5La66Y9jDRPgG8+GuSODXIpZP176ngvert7t1FwN8DjMly0vFqZdn5pBHT
 SpXlEgkfLSJibh0HcEUls/3pxeWAe3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691088042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2E2v77hNXXj45ySO3R5LK5LIJ7zVwT9EOwn+KwMDGs=;
 b=UNrkZZNtjrzeBkiznnSSqv7GcDWvAxxp34EN04w5BUVVI02aLvOEIRzkIDtlGAOfXo9qwq
 pZ1mwPlTnTDyYVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D8681333C;
 Thu,  3 Aug 2023 18:40:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8EUaCqr0y2TLGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Aug 2023 18:40:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v3 17/47] fbdev/grvga: Use fbdev I/O helpers
Date: Thu,  3 Aug 2023 20:35:42 +0200
Message-ID: <20230803184034.6456-18-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig | 4 +---
 drivers/video/fbdev/grvga.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 7c1289a0c5fc..8b20e03f188b 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -64,9 +64,7 @@ config FB_MACMODES
 config FB_GRVGA
 	tristate "Aeroflex Gaisler framebuffer support"
 	depends on FB && SPARC
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	help
 	  This enables support for the SVGACTRL framebuffer in the GRLIB IP library from Aeroflex Gaisler.
 
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 5fa07e40950a..6d917e06e5f3 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -252,13 +252,11 @@ static int grvga_pan_display(struct fb_var_screeninfo *var,
 
 static const struct fb_ops grvga_ops = {
 	.owner          = THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var   = grvga_check_var,
 	.fb_set_par	= grvga_set_par,
 	.fb_setcolreg   = grvga_setcolreg,
 	.fb_pan_display = grvga_pan_display,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit
 };
 
 static int grvga_parse_custom(char *options,
-- 
2.41.0

