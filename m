Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06E7AFCCF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3328C10E46D;
	Wed, 27 Sep 2023 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE210E481
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19E64218A0;
 Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1cq3c/ruH7vpeaGLX2GQTQpwjLjGI8CdqEohsvmpzQ=;
 b=eQZp9EKEeBcw2piskzwn/PKIA+8HFg221d7xem7srB/fHpesXl78CfNhvIe/8bEx+TTJQS
 8AqmKkMVLVSyV5eHZyOzF48OyD++AIT5eBJwAjCvM1vLjgbZZ1sIPr6XkbjNhnkc3FKrrC
 OEjQLXPWpuADLckK/B6YiT9PGUnHHdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1cq3c/ruH7vpeaGLX2GQTQpwjLjGI8CdqEohsvmpzQ=;
 b=GzVUm9VcDLtSfmlMhD8lP0iqa7KhWqrUwJOQ1K57t2Ihr033n13EyRH6vLSQGYbvtEfrBV
 4iTmaGiKN46rRlDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC7B913A74;
 Wed, 27 Sep 2023 07:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SOz+MBDeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 17/46] fbdev/hitfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:50 +0200
Message-ID: <20230927074722.6197-18-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig | 2 +-
 drivers/video/fbdev/hitfb.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 0e0591fb32cae..6a5437ab3df30 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1490,8 +1490,8 @@ config FB_HIT
 	tristate "HD64461 Frame Buffer support"
 	depends on FB && HD64461
 	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the Hitachi HD64461 LCD
 	  frame buffer card.
diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index 17715eaf06732..b64b74b76c71f 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -328,8 +328,9 @@ static int hitfb_set_par(struct fb_info *info)
 
 static const struct fb_ops hitfb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= hitfb_check_var,
-	.fb_set_par		= hitfb_set_par,
+	.fb_set_par	= hitfb_set_par,
 	.fb_setcolreg	= hitfb_setcolreg,
 	.fb_blank	= hitfb_blank,
 	.fb_sync	= hitfb_sync,
@@ -337,6 +338,7 @@ static const struct fb_ops hitfb_ops = {
 	.fb_fillrect	= hitfb_fillrect,
 	.fb_copyarea	= hitfb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static int hitfb_probe(struct platform_device *dev)
-- 
2.42.0

