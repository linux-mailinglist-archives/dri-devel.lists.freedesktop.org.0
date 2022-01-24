Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7E497FAD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA11A10EB0B;
	Mon, 24 Jan 2022 12:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A1610EAF3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:37:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B76831F3A5;
 Mon, 24 Jan 2022 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643027826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BvTyfbynmp1tvbb2xrVXgUH7BvMPhSq6ndaTxmcMSQ=;
 b=LNx1IfQ25ERpOinjT20TO53P419CkVkTJnbo7/0MSj3HcXziffuuTCFtSNHRQd1bYzavLp
 ceYYMbOArNS2SG1qR0/b7iOsVd7/XD0Cu7Nsr9jWxshp814XrdU8FPC0QySyV5reldlgpi
 7QHas/aCIoJ7/5oxboAV+Eq1TOBQ6AU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643027826;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BvTyfbynmp1tvbb2xrVXgUH7BvMPhSq6ndaTxmcMSQ=;
 b=BEsVzO0YHkscZc04nypFBPS7hSNV0xz8Z3AcKDhPibw7OWJK7zctmVxGiyl6p7D1D+A/u/
 oK5lnEQYrhJAaCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DC0B13B97;
 Mon, 24 Jan 2022 12:37:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sKbgHXKd7mFyNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 12:37:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zackr@vmware.com, javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 hdegoede@redhat.com
Subject: [PATCH 4/5] fbdev/simplefb: Request memory region in driver
Date: Mon, 24 Jan 2022 13:36:58 +0100
Message-Id: <20220124123659.4692-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124123659.4692-1-tzimmermann@suse.de>
References: <20220124123659.4692-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Requesting the framebuffer memory in simpledrm marks the memory
range as busy. This used to be done by the firmware sysfb code,
but the driver is the correct place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/simplefb.c | 59 ++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 57541887188b..84452028ecc9 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -66,16 +66,36 @@ static int simplefb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 	return 0;
 }
 
-struct simplefb_par;
+struct simplefb_par {
+	u32 palette[PSEUDO_PALETTE_SIZE];
+#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
+	bool clks_enabled;
+	unsigned int clk_count;
+	struct clk **clks;
+#endif
+#if defined CONFIG_OF && defined CONFIG_REGULATOR
+	bool regulators_enabled;
+	u32 regulator_count;
+	struct regulator **regulators;
+#endif
+	bool release_mem_region;
+};
+
 static void simplefb_clocks_destroy(struct simplefb_par *par);
 static void simplefb_regulators_destroy(struct simplefb_par *par);
 
 static void simplefb_destroy(struct fb_info *info)
 {
+	struct simplefb_par *par = info->par;
+
 	simplefb_regulators_destroy(info->par);
 	simplefb_clocks_destroy(info->par);
 	if (info->screen_base)
 		iounmap(info->screen_base);
+
+	if (par->release_mem_region)
+		release_mem_region(info->apertures->ranges[0].base,
+				   info->apertures->ranges[0].size);
 }
 
 static const struct fb_ops simplefb_ops = {
@@ -169,20 +189,6 @@ static int simplefb_parse_pd(struct platform_device *pdev,
 	return 0;
 }
 
-struct simplefb_par {
-	u32 palette[PSEUDO_PALETTE_SIZE];
-#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
-	bool clks_enabled;
-	unsigned int clk_count;
-	struct clk **clks;
-#endif
-#if defined CONFIG_OF && defined CONFIG_REGULATOR
-	bool regulators_enabled;
-	u32 regulator_count;
-	struct regulator **regulators;
-#endif
-};
-
 #if defined CONFIG_OF && defined CONFIG_COMMON_CLK
 /*
  * Clock handling code.
@@ -401,6 +407,7 @@ static void simplefb_regulators_destroy(struct simplefb_par *par) { }
 
 static int simplefb_probe(struct platform_device *pdev)
 {
+	bool request_mem_succeeded = false;
 	int ret;
 	struct simplefb_params params;
 	struct fb_info *info;
@@ -436,9 +443,22 @@ static int simplefb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (request_mem_region(mem->start, resource_size(mem), "simplefb")) {
+		request_mem_succeeded = true;
+	} else {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about
+		 */
+		dev_warn(&pdev->dev, "simplefb: cannot reserve video memory at %pR\n",
+			 mem);
+	}
+
 	info = framebuffer_alloc(sizeof(struct simplefb_par), &pdev->dev);
-	if (!info)
-		return -ENOMEM;
+	if (!info) {
+		ret = -ENOMEM;
+		goto error_release_mem_region;
+	}
 	platform_set_drvdata(pdev, info);
 
 	par = info->par;
@@ -495,6 +515,8 @@ static int simplefb_probe(struct platform_device *pdev)
 			     info->var.xres, info->var.yres,
 			     info->var.bits_per_pixel, info->fix.line_length);
 
+	par->release_mem_region = request_mem_succeeded;
+
 	ret = register_framebuffer(info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
@@ -513,6 +535,9 @@ static int simplefb_probe(struct platform_device *pdev)
 	iounmap(info->screen_base);
 error_fb_release:
 	framebuffer_release(info);
+error_release_mem_region:
+	if (request_mem_succeeded)
+		release_mem_region(mem->start, resource_size(mem));
 	return ret;
 }
 
-- 
2.34.1

