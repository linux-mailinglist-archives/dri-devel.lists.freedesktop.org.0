Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CA722982
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0FF10E2BD;
	Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B8110E2B8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D27A121B67;
 Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrIaA11UECgCyVaDDJA6C7jjJWoM1qyXSRf/ZVI8E1o=;
 b=hw6QJQadbQZOGemm4GteztF6Euar62lrBraO0mQlB7yElafEmfxrBwzOtTqtK96wjDRLdU
 nZ5MNkQ5b+sr3wCfqVq8xYJEVHjRye/3t1i+FLmUb09/y3sqc9eEMy6gFkDIneVvLbWpae
 7sXmxmXX65l5tQmZ9B7spzDwY0NFMAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrIaA11UECgCyVaDDJA6C7jjJWoM1qyXSRf/ZVI8E1o=;
 b=S/j1toaPGx8XCaWcrE0gwpHomcbKM4IMiaPxV00jnzHqyARW+m6pKiRmY9hve+OUvRi/e5
 UCbdJPkE3UqNOKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8257713A3C;
 Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AC7lHq/1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 03/30] backlight/lv5207lp: Compare against struct
 fb_info.device
Date: Mon,  5 Jun 2023 16:47:45 +0200
Message-Id: <20230605144812.15241-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Struct lv5207lp_platform_data refers to a platform device within
the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
compares it against the fbdev device in struct fb_info.dev, which
is different. Fix the test by comparing to struct fb_info.device.

Fixes a bug in the backlight driver and prepares fbdev for making
struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-sh@vger.kernel.org
---
 arch/sh/boards/mach-kfr2r09/setup.c    | 2 +-
 drivers/video/backlight/lv5207lp.c     | 2 +-
 include/linux/platform_data/lv5207lp.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/sh/boards/mach-kfr2r09/setup.c b/arch/sh/boards/mach-kfr2r09/setup.c
index 20f4db778ed6..a18e80394aed 100644
--- a/arch/sh/boards/mach-kfr2r09/setup.c
+++ b/arch/sh/boards/mach-kfr2r09/setup.c
@@ -202,7 +202,7 @@ static struct platform_device kfr2r09_sh_lcdc_device = {
 };
 
 static struct lv5207lp_platform_data kfr2r09_backlight_data = {
-	.fbdev = &kfr2r09_sh_lcdc_device.dev,
+	.dev = &kfr2r09_sh_lcdc_device.dev,
 	.def_value = 13,
 	.max_value = 13,
 };
diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
index 00673c8b66ac..739f45cd2d38 100644
--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -67,7 +67,7 @@ static int lv5207lp_backlight_check_fb(struct backlight_device *backlight,
 {
 	struct lv5207lp *lv = bl_get_data(backlight);
 
-	return lv->pdata->fbdev == NULL || lv->pdata->fbdev == info->dev;
+	return !lv->pdata->dev || lv->pdata->dev == info->device;
 }
 
 static const struct backlight_ops lv5207lp_backlight_ops = {
diff --git a/include/linux/platform_data/lv5207lp.h b/include/linux/platform_data/lv5207lp.h
index c9da8d402750..95d85c1394bc 100644
--- a/include/linux/platform_data/lv5207lp.h
+++ b/include/linux/platform_data/lv5207lp.h
@@ -8,7 +8,7 @@
 struct device;
 
 struct lv5207lp_platform_data {
-	struct device *fbdev;
+	struct device *dev;
 	unsigned int max_value;
 	unsigned int def_value;
 };
-- 
2.40.1

