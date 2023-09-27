Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F8D7AFD0C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE0210E494;
	Wed, 27 Sep 2023 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4510E47D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FC1A2189C;
 Wed, 27 Sep 2023 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvXHprRgPAGCGKZcfBZtbMRYiyKxfIyXrCTsLgtwxIQ=;
 b=gFR6sPzk+p46uOwtgljfGeFghx16MM2Ynoy2la8Q+jUtpGGBjEcNfECffJc8eZ6OBPlQvG
 gDFxqE+5ti9epGC4u+O7IMu0Ryb7g7g3aRlEaf20qFPy5Aw2yTaaBZcgcQuaYvGEYvB/Rg
 kgeUezaOYEYbQOjkGWHBhM5qp5gcDu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvXHprRgPAGCGKZcfBZtbMRYiyKxfIyXrCTsLgtwxIQ=;
 b=cB4D+RhxAvyNmtEUDiLftNj89ybbb7cZUlqOr6U1WVpq2eqt+OexGKOsfxo9NG7Y/j6MXY
 SlYm4zu4f2QBGyDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 573E313A74;
 Wed, 27 Sep 2023 07:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aIViFA7eE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 07/46] fbdev/atyfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:40 +0200
Message-ID: <20230927074722.6197-8-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig          | 1 +
 drivers/video/fbdev/aty/atyfb_base.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 3df86ae46ca77..9cd116f175160 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1086,6 +1086,7 @@ config FB_ATY
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_BACKLIGHT if FB_ATY_BACKLIGHT
+	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC
 	select FB_ATY_CT if SPARC64 && PCI
 	select VIDEO_NOMODESET
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 5c87817a4f4ce..aee96fa45857b 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -301,6 +301,7 @@ static struct fb_ops atyfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= atyfb_open,
 	.fb_release	= atyfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= atyfb_check_var,
 	.fb_set_par	= atyfb_set_par,
 	.fb_setcolreg	= atyfb_setcolreg,
@@ -315,6 +316,8 @@ static struct fb_ops atyfb_ops = {
 	.fb_imageblit	= atyfb_imageblit,
 #ifdef __sparc__
 	.fb_mmap	= atyfb_mmap,
+#else
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 #endif
 	.fb_sync	= atyfb_sync,
 };
-- 
2.42.0

