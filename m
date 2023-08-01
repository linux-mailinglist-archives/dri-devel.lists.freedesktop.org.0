Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA376B0C5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3619F10E395;
	Tue,  1 Aug 2023 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8810E389
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:15:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A2CF81F8B2;
 Tue,  1 Aug 2023 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690884948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsHUYsqdYQwO/Jtx40JU3sYMmrQWbiIXorjGW0pkZGo=;
 b=kEUJF0RrWRTFK+hhCuqE4CLtJWHosp1dOCUVkTWJRGrz3Qz5kqfBSwjlJkFdYYpKPs1Els
 RrWDxhF6I0NA+LfXxCivwRKhBp5Wn3/lUbBkCrmewiwbRy1BZ19uZRBQ7Wy6EthHcj0FqI
 PulnfHmWpWmaYc31qtH74gPkfwSyb1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690884948;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsHUYsqdYQwO/Jtx40JU3sYMmrQWbiIXorjGW0pkZGo=;
 b=dIAR9Tu+H7rp+ieuYnYkbY4G7smlfBBD6IhnNoBDGonxwlZyOf7IJ9VFSyWf+Gobp3S5zY
 rNvwaedyUr6t4ACA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BBE7139C8;
 Tue,  1 Aug 2023 10:15:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ORhGVTbyGQBXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:15:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 06/47] fbdev/carminefb: Use fbdev I/O helpers
Date: Tue,  1 Aug 2023 12:13:11 +0200
Message-ID: <20230801101541.900-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801101541.900-1-tzimmermann@suse.de>
References: <20230801101541.900-1-tzimmermann@suse.de>
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

v2:
	* updated to use _IOMEM_ tokens

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/Kconfig     | 4 +---
 drivers/video/fbdev/carminefb.c | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ea24f8114ac7..1fa776cacb89 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1449,9 +1449,7 @@ config FB_PM3
 config FB_CARMINE
 	tristate "Fujitsu carmine frame buffer support"
 	depends on FB && PCI
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Fujitsu Carmine chip.
diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index 33a03f4ae025..e56065cdba97 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -530,10 +530,7 @@ static int init_hardware(struct carmine_hw *hw)
 
 static const struct fb_ops carminefb_ops = {
 	.owner		= THIS_MODULE,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
-
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var	= carmine_check_var,
 	.fb_set_par	= carmine_set_par,
 	.fb_setcolreg	= carmine_setcolreg,
-- 
2.41.0

