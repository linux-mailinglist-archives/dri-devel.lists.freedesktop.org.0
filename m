Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9BF767531
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8149410E765;
	Fri, 28 Jul 2023 18:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C643610E224
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:22:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 743AC21992;
 Fri, 28 Jul 2023 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690568559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lo1HgTa2ZktQnYRCONWYm2ClvK/McjDZ62CHhnFYLk0=;
 b=FqhKQDaTITRynY9qMrpfLIyaZ6Fcx2YowyKMLjprahqubeBWvxGhlRedDn1NUyrU5yVZbT
 b1ZK+wkuiG2mERs7cejrKTxgef64uUPwPJ7bKXSD1SYDkeewLP453uGwJ41FG9PZCD0qkZ
 W0ZYt0+3Lrrqw7h6kDZCZkDoX/J/4No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690568559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lo1HgTa2ZktQnYRCONWYm2ClvK/McjDZ62CHhnFYLk0=;
 b=h4sKYKFPKdyTGXq0m7+UJu8jXKstFCISJGgcU+IZQ98PkPOagvbwtwjd21fj+N7w+8Mp7Q
 A3gVWbDCW6CMYJAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 395AA139BD;
 Fri, 28 Jul 2023 18:22:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CNAaDW8HxGQ3CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jul 2023 18:22:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH 12/47] fbdev/g364fb: Use fbdev I/O helpers
Date: Fri, 28 Jul 2023 18:39:55 +0200
Message-ID: <20230728182234.10680-13-tzimmermann@suse.de>
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set struct fb_ops and with FB_DEFAULT_IO_OPS, fbdev's initializer
for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
Select the correct modules with Kconfig's FB_IO_HELPERS token.

The macro and token set the currently selected values, so there is
no functional change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig  | 4 +---
 drivers/video/fbdev/g364fb.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index aa92a9c6a801..b08e632586a9 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1577,9 +1577,7 @@ config FB_MAXINE
 config FB_G364
 	bool "G364 frame buffer support"
 	depends on (FB = y) && (MIPS_MAGNUM_4000 || OLIVETTI_M700)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IO_HELPERS
 	help
 	  The G364 driver is the framebuffer used in MIPS Magnum 4000 and
 	  Olivetti M700-10 systems.
diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 0825cbde116e..08a37e7139e8 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -112,12 +112,10 @@ static int g364fb_blank(int blank, struct fb_info *info);
 
 static const struct fb_ops g364fb_ops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IO_HELPERS,
 	.fb_setcolreg	= g364fb_setcolreg,
 	.fb_pan_display	= g364fb_pan_display,
 	.fb_blank	= g364fb_blank,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 /*
-- 
2.41.0

