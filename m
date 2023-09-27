Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEEB7AFCFB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48D810E48F;
	Wed, 27 Sep 2023 07:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAF010E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F3991F8B6;
 Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQkKc/h6/3tCXG4Y1Fvgfmz/5VCV3YyJLn5dHo8ZkGo=;
 b=MNTtqbPGrx+rg3BKlXWt4r198KBkWzXWkKouDAaPIYNKira4aTQd3l8+uMVdTx45QWWZga
 ov6NgpYfO28ubXPS4E9VRn9BcY16m+3A34Em9sloMcXp+naE/umvoPRWPNHRMSVBISl07I
 xkcboScShx7O61rfEjS8meP85p57JEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQkKc/h6/3tCXG4Y1Fvgfmz/5VCV3YyJLn5dHo8ZkGo=;
 b=CD+aDLJKzhmfqGLnXxNhwCI7RNPhJwfXNOAvjgAGIOY8qnM6K+3k6lMv4Crxrctm1pKqoU
 zWqQQtCrYjA29EAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC21713A74;
 Wed, 27 Sep 2023 07:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sLH+MBXeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 35/46] fbdev/sisfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:27:08 +0200
Message-ID: <20230927074722.6197-36-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig        | 3 ++-
 drivers/video/fbdev/sis/sis_main.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 2d8b7fe502f74..bda5ed8a40b0a 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1203,10 +1203,11 @@ config FB_SAVAGE_ACCEL
 config FB_SIS
 	tristate "SiS/XGI display support"
 	depends on FB && PCI
+	select BOOT_VESA_SUPPORT if FB_SIS = y
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select BOOT_VESA_SUPPORT if FB_SIS = y
+	select FB_IOMEM_FOPS
 	select FB_SIS_300 if !FB_SIS_315
 	select VIDEO_NOMODESET
 	help
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 0f5374f6ef055..6ad47b6b60046 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -1911,6 +1911,7 @@ static const struct fb_ops sisfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= sisfb_open,
 	.fb_release	= sisfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= sisfb_check_var,
 	.fb_set_par	= sisfb_set_par,
 	.fb_setcolreg	= sisfb_setcolreg,
@@ -1923,7 +1924,8 @@ static const struct fb_ops sisfb_ops = {
 #ifdef SIS_NEW_CONFIG_COMPAT
 	.fb_compat_ioctl= sisfb_ioctl,
 #endif
-	.fb_ioctl	= sisfb_ioctl
+	.fb_ioctl	= sisfb_ioctl,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* ---------------- Chip generation dependent routines ---------------- */
-- 
2.42.0

