Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4407AFCEE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E19810E483;
	Wed, 27 Sep 2023 07:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD9510E477
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DEEE1F8AE;
 Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxBcd+igdUhtckrFZURNbcjN7GUux7BiTjx9FHmuYUo=;
 b=ZYCyX7r0cwcVJuy0LbAIc3dfYn16daA1zWaYMDf/G4t2CitbNzwZSjg2O+E7Jk1gxr2qzF
 j61FmDEDjHFlZteTtvA2GdD9T6mLWq3CDooI0sCXqRnEQ8qp8/mfaUc5jAWRpIo1VupUyg
 CFQ41Hg7cBT2+rn9hywtOmYNPxoWVIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxBcd+igdUhtckrFZURNbcjN7GUux7BiTjx9FHmuYUo=;
 b=GI97PDQXS1zxO7wDoQc0aZYPvGqpDwWWGJJGuAdaFAqpCGTlpvL0D9hPs6KhFpTL9jD0Ty
 LWd4okG9vbbYHgCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62AB213A74;
 Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0BtDFxHeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 19/46] fbdev/i810fb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:52 +0200
Message-ID: <20230927074722.6197-20-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-parisc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Cc: Antonino Daplas <adaplas@gmail.com>
---
 drivers/video/fbdev/Kconfig          | 4 +---
 drivers/video/fbdev/i810/i810_main.c | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 3c28bff8a0770..e42439cfb1a1d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -793,10 +793,8 @@ config FB_I740
 config FB_I810
 	tristate "Intel 810/815 support"
 	depends on FB && PCI && X86_32 && AGP_INTEL
+	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select VGASTATE
 	select VIDEO_NOMODESET
 	help
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index f5511bb4fadca..d73a795fe1bef 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1547,6 +1547,7 @@ static const struct fb_ops i810fb_ops = {
 	.owner =             THIS_MODULE,
 	.fb_open =           i810fb_open,
 	.fb_release =        i810fb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =      i810fb_check_var,
 	.fb_set_par =        i810fb_set_par,
 	.fb_setcolreg =      i810fb_setcolreg,
@@ -1557,6 +1558,7 @@ static const struct fb_ops i810fb_ops = {
 	.fb_imageblit =      i810fb_imageblit,
 	.fb_cursor =         i810fb_cursor,
 	.fb_sync =           i810fb_sync,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /***********************************************************************
-- 
2.42.0

