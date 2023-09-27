Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3567AFCFF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C5A10E493;
	Wed, 27 Sep 2023 07:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4825F10E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCE4D2188F;
 Wed, 27 Sep 2023 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luVhBvWd8C9dVe65alLr3Pz6idPvBOHChRLL8shqd0A=;
 b=O3vkiX/rC+xMIgmauD9pHFkxf2COO6D3ucA5rz2gZa28prv/O+9i07T2OnKp7r4I3XtHJj
 TTWrm5ziR6wFQ5F/5ooWQ/CZXrqckG4fmfwlpJTT5emvtBJeQsaAcMuWheUVWXXy4Xgsoe
 ygoFHnkGW6PThWTFrM4Lh/vAG8inHRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800845;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luVhBvWd8C9dVe65alLr3Pz6idPvBOHChRLL8shqd0A=;
 b=zLES0alclb/4H/OVQTCgp2YfwQKEagjuYVBQCqq+9/87zaVy3x8fA8fg6xGWn4VGtjrzxg
 jd7CMXgTt2qVHWBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 915DB1338F;
 Wed, 27 Sep 2023 07:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wF2rIg3eE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 04/46] fbdev/amifb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:37 +0200
Message-ID: <20230927074722.6197-5-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig | 1 +
 drivers/video/fbdev/amifb.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index d7b6e9885fe54..e24653109dea8 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -225,6 +225,7 @@ config FB_Q40
 config FB_AMIGA
 	tristate "Amiga native chipset support"
 	depends on FB && AMIGA
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the builtin graphics
 	  chipset found in Amigas.
diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 441e7a8dbe584..b18c6b4f129a6 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3488,6 +3488,7 @@ static irqreturn_t amifb_interrupt(int irq, void *dev_id)
 
 static const struct fb_ops amifb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= amifb_check_var,
 	.fb_set_par	= amifb_set_par,
 	.fb_setcolreg	= amifb_setcolreg,
@@ -3497,6 +3498,7 @@ static const struct fb_ops amifb_ops = {
 	.fb_copyarea	= amifb_copyarea,
 	.fb_imageblit	= amifb_imageblit,
 	.fb_ioctl	= amifb_ioctl,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 
-- 
2.42.0

