Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806477AFCFD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C6210E490;
	Wed, 27 Sep 2023 07:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1BE10E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 197CD218E0;
 Wed, 27 Sep 2023 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dY/gTtC8WBTH/uuqHuU7Vc/u6Lymzpn7XcCxtiCi8Is=;
 b=IU9/nllIJn09IbeHMAiJDgAbp3ViXUNtA6oFgbRwoTLZesxgbj32yskZBFNCla5H1Tw9YX
 nRiyLwyujXFH4Se0ikTwFN8DqaEeQyqIJSaCifnqagK+VvcrmjaT9WMdpBzarjhild+5jU
 rEHcnInQ0rTecptsinT1mVJCkqPI71U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dY/gTtC8WBTH/uuqHuU7Vc/u6Lymzpn7XcCxtiCi8Is=;
 b=w29YIOX7GWHwEOsAbNpgNatfJtgJNjlZO/xRaWdUjifH/xg1poBbW6c4BFwUbpHwsF5ycU
 BWV9RFViKv3A68AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2B4313A74;
 Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SAibMhbeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 39/46] fbdev/sunxvr500: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:27:12 +0200
Message-ID: <20230927074722.6197-40-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig     | 1 +
 drivers/video/fbdev/sunxvr500.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index a7587f680e3a2..1da6bf1eb6ff6 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -596,6 +596,7 @@ config FB_XVR500
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select VIDEO_NOMODESET
 	help
 	  This is the framebuffer device for the Sun XVR-500 and similar
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index 3b7dcdae9f83f..fef008b728dde 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -189,10 +189,12 @@ static void e3d_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 
 static const struct fb_ops e3d_ops = {
 	.owner			= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_setcolreg		= e3d_setcolreg,
 	.fb_fillrect		= e3d_fillrect,
 	.fb_copyarea		= e3d_copyarea,
 	.fb_imageblit		= e3d_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static int e3d_set_fbinfo(struct e3d_info *ep)
-- 
2.42.0

