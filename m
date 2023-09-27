Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74D7AFCEA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D473F10E477;
	Wed, 27 Sep 2023 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A2710E47B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD4AE1F8AF;
 Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGBOmgCm4i8iNNFrQ7yI8VwSysTFgSUPvcyeUC+LxeA=;
 b=lDSxxqCye8ayxBHSNjJZnlkzXBWKs26KBTprb9/jIn4Y+JhfELBX9XX5y1jLCFWLpZyhEt
 occigyeQdaOZgubuz6u3fOmkNrDV7A2yYGr2zV1xeOBZoHVYprNU1Y1xCWoptjGnbyWDSi
 pwP6XC71eqK5A5e7Ur4CcQq5KzeZwOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGBOmgCm4i8iNNFrQ7yI8VwSysTFgSUPvcyeUC+LxeA=;
 b=AY8Vyi0VWvSJ3FCZJl7sHWE0blNllyYtMrE44IGN5YZ5rT2b0t84G5RLPouCwZnG9uO/O8
 Op6U4K2Z31d19HCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2D301338F;
 Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MFrWJhHeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 20/46] fbdev/imsttfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:53 +0200
Message-ID: <20230927074722.6197-21-tzimmermann@suse.de>
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
---
 drivers/video/fbdev/Kconfig   | 1 +
 drivers/video/fbdev/imsttfb.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index e42439cfb1a1d..46f761ffa13c9 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -356,6 +356,7 @@ config FB_IMSTT
 	bool "IMS Twin Turbo display support"
 	depends on (FB = y) && PCI
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC_PMAC
 	select VIDEO_NOMODESET
 	help
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index f4c8677488fb8..e7e03e920729d 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1336,6 +1336,7 @@ static struct pci_driver imsttfb_pci_driver = {
 
 static const struct fb_ops imsttfb_ops = {
 	.owner 		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= imsttfb_check_var,
 	.fb_set_par 	= imsttfb_set_par,
 	.fb_setcolreg 	= imsttfb_setcolreg,
@@ -1345,6 +1346,7 @@ static const struct fb_ops imsttfb_ops = {
 	.fb_copyarea	= imsttfb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
 	.fb_ioctl 	= imsttfb_ioctl,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static int init_imstt(struct fb_info *info)
-- 
2.42.0

