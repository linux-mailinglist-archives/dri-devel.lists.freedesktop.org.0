Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBA7AFD10
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF57710E49D;
	Wed, 27 Sep 2023 07:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392C10E475
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BEC41F8B4;
 Wed, 27 Sep 2023 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvZmFQreEHzgacqRp6EHUJQFf9HvPfPJwF6jgCKniW4=;
 b=iyGJOYghcFxIGBUfMBEqQCXVv/qAsWUWovApVlbA6BtMHFVJHF+u1Ev+X/TvIraeEJmFRi
 n1C4S0Jl+eAA+KBRNutmkN50IVMH591JG8cJ8bQmMjFpTG0YQOHPMaaMGaFUzVKVq139Xo
 cEjsG4SNABaNX0CT5S1FTGDXWzM7b4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvZmFQreEHzgacqRp6EHUJQFf9HvPfPJwF6jgCKniW4=;
 b=7tRsFvif02hZUJMaOjGik00TTFhVZs9orPt67z/8alQ0vM6QiHiR+IRRLdjFQxlAQoPcc8
 qL4RuArv3HzujBDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5385613A74;
 Wed, 27 Sep 2023 07:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uHF3ExXeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 33/46] fbdev/sa1100fb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:27:06 +0200
Message-ID: <20230927074722.6197-34-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig    | 4 +---
 drivers/video/fbdev/sa1100fb.c | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4f9dab566c28c..061af94837f99 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -159,9 +159,7 @@ config FB_CLPS711X
 config FB_SA1100
 	bool "SA-1100 LCD support"
 	depends on (FB = y) && ARM && ARCH_SA1100
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	help
 	  This is a framebuffer device for the SA-1100 LCD Controller.
 	  See <http://www.linux-fbdev.org/> for information on framebuffer
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index 3d76ce1114882..446b44e172e15 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -575,14 +575,13 @@ static int sa1100fb_mmap(struct fb_info *info,
 
 static const struct fb_ops sa1100fb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= sa1100fb_check_var,
 	.fb_set_par	= sa1100fb_set_par,
 //	.fb_set_cmap	= sa1100fb_set_cmap,
 	.fb_setcolreg	= sa1100fb_setcolreg,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 	.fb_blank	= sa1100fb_blank,
+	__FB_DEFAULT_IOMEM_OPS_DRAW,
 	.fb_mmap	= sa1100fb_mmap,
 };
 
-- 
2.42.0

