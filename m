Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2C577C7C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862E0AB7BF;
	Mon, 18 Jul 2022 07:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640B5AB7B6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF75020BCA;
 Mon, 18 Jul 2022 07:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658129004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuYc6HSTdE1bmoVlJbZcViYyTFtG6gNP77kJzDK0/nI=;
 b=wx1bphgZgYqfsj6NDn2OU/VtbuLX8HbpiJNGnooN/tBjOvKCPInp2O5WXrDNOdMCOIqeI7
 OOAcIVfP9kgo7SHJ4E7SVb1vLRoohC50rEvdqq/D2tgX/vU9mN3zWCKjHvTVHPU4Nk1DLz
 S7zrv3S2PEgreRlES+UEkZFRA4NqX8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658129004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuYc6HSTdE1bmoVlJbZcViYyTFtG6gNP77kJzDK0/nI=;
 b=hsql5k2L6flgXO+jc9m2lcgBYSwBq0EmtqkBqC1yTNFxl3Zu4XjV4QAuID+ncokwWo9QZv
 g4ZPXjrkWxUGzfCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B62E613A37;
 Mon, 18 Jul 2022 07:23:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EIO5K2wK1WKjcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 07:23:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH v2 03/11] fbdev/vga16fb: Auto-generate module init/exit code
Date: Mon, 18 Jul 2022 09:23:14 +0200
Message-Id: <20220718072322.8927-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718072322.8927-1-tzimmermann@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move vgag16fb's option parsing into the driver's probe function and
generate the rest of the module's init/exit functions from macros.
Keep the options code, although there are no options defined.

v2:
	* no options are supported, remove the code (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/vga16fb.c | 41 +----------------------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 9e614c1db03d..3312b6a4e00d 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1304,21 +1304,6 @@ static const struct fb_ops vga16fb_ops = {
 	.fb_imageblit	= vga16fb_imageblit,
 };
 
-#ifndef MODULE
-static int __init vga16fb_setup(char *options)
-{
-	char *this_opt;
-
-	if (!options || !*options)
-		return 0;
-
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-		if (!*this_opt) continue;
-	}
-	return 0;
-}
-#endif
-
 static int vga16fb_probe(struct platform_device *dev)
 {
 	struct screen_info *si;
@@ -1449,31 +1434,7 @@ static struct platform_driver vga16fb_driver = {
 	.id_table = vga16fb_driver_id_table,
 };
 
-static int __init vga16fb_init(void)
-{
-	int ret;
-#ifndef MODULE
-	char *option = NULL;
-
-	if (fb_get_options("vga16fb", &option))
-		return -ENODEV;
-
-	vga16fb_setup(option);
-#endif
-
-	ret = platform_driver_register(&vga16fb_driver);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static void __exit vga16fb_exit(void)
-{
-	platform_driver_unregister(&vga16fb_driver);
-}
+module_platform_driver(vga16fb_driver);
 
 MODULE_DESCRIPTION("Legacy VGA framebuffer device driver");
 MODULE_LICENSE("GPL");
-module_init(vga16fb_init);
-module_exit(vga16fb_exit);
-- 
2.36.1

