Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326237AFCED
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E3310E47D;
	Wed, 27 Sep 2023 07:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D577810E471
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E2E8218B5;
 Wed, 27 Sep 2023 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6JSbltDjLPXQ2eNL88Xc2Dct+dyPq+VIIl/ONh2FGQ=;
 b=WYRYi4I41xR/RR3vWJSIMno+BLCFcG8OpaeIV6qnubqy7/VjexcJKEmHJuKscwNYzM8taa
 0ojLXDng2XQeawEvlr5+s71356IWcwJ/QUklOKhEZnpCp55KuXIhKkil3ndI0fvgciWa+E
 i77wJQ6MVa5Gou7UvAfLLzwGhoF2Eog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6JSbltDjLPXQ2eNL88Xc2Dct+dyPq+VIIl/ONh2FGQ=;
 b=/FFLOgG/I2XCbE0YJxl6a/j7aWKAjJN9/k/CcVgEr9fVwhUIH4tjXucfcHb1gELN51vT6c
 mE04VZsX6lM4iIAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4003A1338F;
 Wed, 27 Sep 2023 07:47:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aCSrDhTeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 29/46] fbdev/radeon: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:27:02 +0200
Message-ID: <20230927074722.6197-30-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary I/O helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default implementation to be invoked; hence requiring the I/O
helpers to be built in any case. Setting all callbacks in all
drivers explicitly will allow to make the I/O helpers optional.
This benefits systems that do not use these functions.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/video/fbdev/Kconfig           | 3 ++-
 drivers/video/fbdev/aty/radeon_base.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4d20c4523b83a..74c623f2751dd 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1025,11 +1025,12 @@ config FB_RADEON
 	tristate "ATI Radeon display support"
 	depends on FB && PCI
 	select FB_BACKLIGHT if FB_RADEON_BACKLIGHT
-	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC
+	select FB_MODE_HELPERS
 	select VIDEO_NOMODESET
 	help
 	  Choose this option if you want to use an ATI Radeon graphics card as
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 93fd1773402c5..36bfb6deb8abd 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -1952,6 +1952,7 @@ static int radeonfb_set_par(struct fb_info *info)
 
 static const struct fb_ops radeonfb_ops = {
 	.owner			= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var		= radeonfb_check_var,
 	.fb_set_par		= radeonfb_set_par,
 	.fb_setcolreg		= radeonfb_setcolreg,
@@ -1963,6 +1964,7 @@ static const struct fb_ops radeonfb_ops = {
 	.fb_fillrect		= radeonfb_fillrect,
 	.fb_copyarea		= radeonfb_copyarea,
 	.fb_imageblit		= radeonfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 
-- 
2.42.0

