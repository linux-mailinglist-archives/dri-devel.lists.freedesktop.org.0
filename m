Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306C650FDB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE5B10E2BC;
	Mon, 19 Dec 2022 16:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4E10E2BC;
 Mon, 19 Dec 2022 16:05:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E58076106A;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AvP4+yrQ3bqo6F1yy3Vq9Bwx8SPA/+CqvfnX9hA8B0=;
 b=M/XBwN5UhKeDbKvr5oX4umQ0oHUhZterr0ZR0WuuMHRxAqyUbyaPouEQ3nNOpM6lIFsBkV
 xL3V8ZvSN6VD+r9nr+QWea8Bkvg88x0UV6Q6hRMeAIfDGTnV1Xx1vrBRSSvdGzVg2Rb2IW
 uTRijUmIYmENMgW2/6TSCqV9MpTs8KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AvP4+yrQ3bqo6F1yy3Vq9Bwx8SPA/+CqvfnX9hA8B0=;
 b=lHANT5l5RGXad1u1esQPLu8UjEwNWcGQmLkf4YhEjPM4ut4rAQKRoR5hVPdV18HkxRP1yH
 9erCkjmEUHp9YiAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0B7113910;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eDMHKsGLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 14/18] fbdev/simplefb: Do not use struct fb_info.apertures
Date: Mon, 19 Dec 2022 17:05:12 +0100
Message-Id: <20221219160516.23436-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acquire ownership of the firmware scanout buffer by calling Linux'
aperture helpers. Remove the use of struct fb_info.apertures and do
not set FBINFO_MISC_FIRMWARE; both of which previously configured
buffer ownership.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/simplefb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index e770b4a356b5..10d71879d340 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -12,6 +12,7 @@
  * Copyright (C) 1996 Paul Mackerras
  */
 
+#include <linux/aperture.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
 #include <linux/io.h>
@@ -68,6 +69,8 @@ static int simplefb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 
 struct simplefb_par {
 	u32 palette[PSEUDO_PALETTE_SIZE];
+	resource_size_t base;
+	resource_size_t size;
 	struct resource *mem;
 #if defined CONFIG_OF && defined CONFIG_COMMON_CLK
 	bool clks_enabled;
@@ -472,16 +475,11 @@ static int simplefb_probe(struct platform_device *pdev)
 	info->var.blue = params.format->blue;
 	info->var.transp = params.format->transp;
 
-	info->apertures = alloc_apertures(1);
-	if (!info->apertures) {
-		ret = -ENOMEM;
-		goto error_fb_release;
-	}
-	info->apertures->ranges[0].base = info->fix.smem_start;
-	info->apertures->ranges[0].size = info->fix.smem_len;
+	par->base = info->fix.smem_start;
+	par->size = info->fix.smem_len;
 
 	info->fbops = &simplefb_ops;
-	info->flags = FBINFO_DEFAULT | FBINFO_MISC_FIRMWARE;
+	info->flags = FBINFO_DEFAULT;
 	info->screen_base = ioremap_wc(info->fix.smem_start,
 				       info->fix.smem_len);
 	if (!info->screen_base) {
@@ -511,6 +509,11 @@ static int simplefb_probe(struct platform_device *pdev)
 	if (mem != res)
 		par->mem = mem; /* release in clean-up handler */
 
+	ret = devm_aperture_acquire_for_platform_device(pdev, par->base, par->size);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to acquire aperture: %d\n", ret);
+		goto error_regulators;
+	}
 	ret = register_framebuffer(info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
-- 
2.39.0

