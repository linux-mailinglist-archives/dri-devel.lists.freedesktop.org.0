Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AA7AFC9D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB1610E47E;
	Wed, 27 Sep 2023 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFB710E482
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30598218A2;
 Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoNkSP1xm6F8e8A1K7Rp8buTbSF05HOcVujnEuQjmXA=;
 b=g3uV31Zq5cu/s+j+N17iTRI7prQaoiU42/M3es/U5vfZm3J8r9YpB70qiDLWSKf7dyTcO7
 /gimMZzrguh2xuvMP5mIGJ6ZbgCj8DHYnZ1eU93p9+vCqbp2aGcnD9Q6luwSCa94zhuRI4
 XzCXphj7wkaTcJxOaSx9ErcZQSiZAmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoNkSP1xm6F8e8A1K7Rp8buTbSF05HOcVujnEuQjmXA=;
 b=G2sOpLRe/EVgCAJJjss/r3CZV4J6LvipbEO6PHnwKCjNY/svTjrN0PKOz172NvGAN2sfve
 ECQgYnvKZNNLsNCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2A711338F;
 Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2DJ4NhHeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 21/46] fbdev/intelfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:54 +0200
Message-ID: <20230927074722.6197-22-tzimmermann@suse.de>
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
 Maik Broemme <mbroemme@libmpq.org>, dri-devel@lists.freedesktop.org,
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
Cc: Maik Broemme <mbroemme@libmpq.org>
---
 drivers/video/fbdev/Kconfig              | 3 ++-
 drivers/video/fbdev/intelfb/intelfbdrv.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 46f761ffa13c9..c1bb885cee4c3 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -861,10 +861,11 @@ config FB_CARILLO_RANCH
 config FB_INTEL
 	tristate "Intel 830M/845G/852GM/855GM/865G/915G/945G/945GM/965G/965GM support"
 	depends on FB && PCI && X86 && AGP_INTEL && EXPERT
-	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
+	select FB_MODE_HELPERS
 	select BOOT_VESA_SUPPORT if FB_INTEL = y
 	select VIDEO_NOMODESET
 	depends on !DRM_I915
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 3d334f1719596..d29d80a16295e 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -198,6 +198,7 @@ static const struct fb_ops intel_fb_ops = {
 	.owner =		THIS_MODULE,
 	.fb_open =              intelfb_open,
 	.fb_release =           intelfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =         intelfb_check_var,
 	.fb_set_par =           intelfb_set_par,
 	.fb_setcolreg =		intelfb_setcolreg,
@@ -208,7 +209,8 @@ static const struct fb_ops intel_fb_ops = {
 	.fb_imageblit =         intelfb_imageblit,
 	.fb_cursor =            intelfb_cursor,
 	.fb_sync =              intelfb_sync,
-	.fb_ioctl =		intelfb_ioctl
+	.fb_ioctl =		intelfb_ioctl,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* PCI driver module table */
-- 
2.42.0

