Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A89767562
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A7A10E770;
	Fri, 28 Jul 2023 18:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A21C10E224
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:22:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A1E6219A8;
 Fri, 28 Jul 2023 18:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690568567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70e/V4xaBnQMBiXrB89HU20F9VMA18n+jV6f696DTZk=;
 b=XgW/VSkzfslr+ic7twI62N3hFjHiDWY68YKvVQ7ydkFX3pmohe9qKnLN8LHsPByz+znSW3
 M3xHR6RRJkN73fipixSph6I5D7TJoI8/ILzfkWRsyxw6V0oUVHmA5POTY3MjUjkoy94e7P
 LcC0mbU6aqeuoaDkh4+RRG3xpe0G7hU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690568567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70e/V4xaBnQMBiXrB89HU20F9VMA18n+jV6f696DTZk=;
 b=XVSp+1DVXLMfErk59H3s5DeLAgBdjR3qrnNfDlAvLki9P6BJNnn4s0czuYe3V8bAWRtdRG
 bZz3/79EMZRNzaAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E86D013276;
 Fri, 28 Jul 2023 18:22:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WFvJN3YHxGQ3CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jul 2023 18:22:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH 46/47] fbdev/xilinxfb: Use fbdev I/O helpers
Date: Fri, 28 Jul 2023 18:40:29 +0200
Message-ID: <20230728182234.10680-47-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728182234.10680-1-tzimmermann@suse.de>
References: <20230728182234.10680-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set struct fb_ops and with FB_DEFAULT_IO_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IO_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Simek <michal.simek@amd.com>
---
 drivers/video/fbdev/Kconfig    | 4 +---
 drivers/video/fbdev/xilinxfb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index b0cb2d38415c..47568e6e264e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1742,9 +1742,7 @@ config FB_PS3_DEFAULT_SIZE_M
 config FB_XILINX
 	tristate "Xilinx frame buffer support"
 	depends on FB && (MICROBLAZE || ARCH_ZYNQ || ARCH_ZYNQMP)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IO_HELPERS
 	help
 	  Include support for the Xilinx ML300/ML403 reference design
 	  framebuffer. ML300 carries a 640*480 LCD display on the board,
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index ee6c65902694..dcf8ebda4aac 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -250,11 +250,9 @@ xilinx_fb_blank(int blank_mode, struct fb_info *fbi)
 
 static const struct fb_ops xilinxfb_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_IO_OPS,
 	.fb_setcolreg		= xilinx_fb_setcolreg,
 	.fb_blank		= xilinx_fb_blank,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
 };
 
 /* ---------------------------------------------------------------------
-- 
2.41.0

