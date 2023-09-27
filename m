Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F147AFCFA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7783E10E48D;
	Wed, 27 Sep 2023 07:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA04510E477
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 718461F8B0;
 Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h92Cu0T0RlZflzHgcawkGCio2NpMhXHxxurgHdpog5I=;
 b=DayUKSGy56Gb+Qn/WJpEv3oC/TgW61JXeTBF0x40yHiD7YR5qgOzFX/jNIkGEGmPuoYbiB
 cYealw8oKu6PKfa+AgJRWcsY4s7vnw+RYiCNwqs1QSZQ7/UWCEx/KsOXUjRO4l6vIoKplO
 M51Taj/CcghFu4vgnUdh/I7z/s8D+sQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h92Cu0T0RlZflzHgcawkGCio2NpMhXHxxurgHdpog5I=;
 b=LFDte3MO/cosS32fVUJhb1ezVH4WPymlHBK5D3BV89hZ0XfJExXv4ZoCWBE70gaQaO03y7
 OWyNOiqwwKgyzQBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3365B13A74;
 Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MGqlCxLeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 22/46] fbdev/matroxfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:55 +0200
Message-ID: <20230927074722.6197-23-tzimmermann@suse.de>
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

Initialize each instance of struct fb_ops with fbdev initializer
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
 drivers/video/fbdev/Kconfig                 | 2 ++
 drivers/video/fbdev/matrox/matroxfb_base.c  | 2 ++
 drivers/video/fbdev/matrox/matroxfb_crtc2.c | 4 +---
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c1bb885cee4c3..aa3d2e3930e91 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -903,6 +903,7 @@ config FB_MATROX
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select FB_TILEBLITTING
 	select FB_MACMODES if PPC_PMAC
 	select VIDEO_NOMODESET
@@ -989,6 +990,7 @@ config FB_MATROX_I2C
 config FB_MATROX_MAVEN
 	tristate "G400 second head support"
 	depends on FB_MATROX_G && FB_MATROX_I2C
+	select FB_IOMEM_HELPERS
 	help
 	  WARNING !!! This support does not work with G450 !!!
 
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index a043a737ea9f7..81603ce05a229 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -1204,6 +1204,7 @@ static const struct fb_ops matroxfb_ops = {
 	.owner =	THIS_MODULE,
 	.fb_open =	matroxfb_open,
 	.fb_release =	matroxfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =	matroxfb_check_var,
 	.fb_set_par =	matroxfb_set_par,
 	.fb_setcolreg =	matroxfb_setcolreg,
@@ -1214,6 +1215,7 @@ static const struct fb_ops matroxfb_ops = {
 /*	.fb_copyarea =	<set by matrox_cfbX_init>, */
 /*	.fb_imageblit =	<set by matrox_cfbX_init>, */
 /*	.fb_cursor =	<set by matrox_cfbX_init>, */
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 #define RSDepth(X)	(((X) >> 8) & 0x0F)
diff --git a/drivers/video/fbdev/matrox/matroxfb_crtc2.c b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
index 372197c124dec..417fc692468da 100644
--- a/drivers/video/fbdev/matrox/matroxfb_crtc2.c
+++ b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
@@ -567,15 +567,13 @@ static const struct fb_ops matroxfb_dh_ops = {
 	.owner =	THIS_MODULE,
 	.fb_open =	matroxfb_dh_open,
 	.fb_release =	matroxfb_dh_release,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var =	matroxfb_dh_check_var,
 	.fb_set_par =	matroxfb_dh_set_par,
 	.fb_setcolreg =	matroxfb_dh_setcolreg,
 	.fb_pan_display =matroxfb_dh_pan_display,
 	.fb_blank =	matroxfb_dh_blank,
 	.fb_ioctl =	matroxfb_dh_ioctl,
-	.fb_fillrect =	cfb_fillrect,
-	.fb_copyarea =	cfb_copyarea,
-	.fb_imageblit =	cfb_imageblit,
 };
 
 static struct fb_var_screeninfo matroxfb_dh_defined = {
-- 
2.42.0

