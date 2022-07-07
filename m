Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797A156A71D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CDC10F24D;
	Thu,  7 Jul 2022 15:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEB110FECB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECA6822174;
 Thu,  7 Jul 2022 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657208398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuKPmf5uVn0ang87bL1p9igKcmpSelj6HtQl75lgOic=;
 b=SfQxXCLKjgtvjg+zEtlWRH8/KVF2A2Hps7+xniscEVYkP5g4NmpKOXRxyBN3U0uA/uaPIu
 jcoDKlpN7ANxHTGrB2aAAua/fs9Dm6tjE24QPeDHH60y/pJtfzvayw9ZazIf5k6bsp8yB1
 i6ziG9e+cx2HAGsxaH6gVVIzrhEvjp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657208398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuKPmf5uVn0ang87bL1p9igKcmpSelj6HtQl75lgOic=;
 b=Tqe011xR3issK0a7FZWCIfV/WclJKTiGHPujqnwmpM3xBj4oQlVXY5ewEvNF8UY+/u0Y2Q
 zlFoAEVUXfVmylCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDBCC13A33;
 Thu,  7 Jul 2022 15:39:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qE9sLU7+xmI9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:39:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH 03/11] fbdev/vga16fb: Auto-generate module init/exit code
Date: Thu,  7 Jul 2022 17:39:44 +0200
Message-Id: <20220707153952.32264-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707153952.32264-1-tzimmermann@suse.de>
References: <20220707153952.32264-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/vga16fb.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index f7c1bb018843..e7767ed50c5b 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1321,12 +1321,21 @@ static int __init vga16fb_setup(char *options)
 
 static int vga16fb_probe(struct platform_device *dev)
 {
+#ifndef MODULE
+	char *option = NULL;
+#endif
 	struct screen_info *si;
 	struct fb_info *info;
 	struct vga16fb_par *par;
 	int i;
 	int ret = 0;
 
+#ifndef MODULE
+	if (fb_get_options("vga16fb", &option))
+		return -ENODEV;
+	vga16fb_setup(option);
+#endif
+
 	si = dev_get_platdata(&dev->dev);
 	if (!si)
 		return -ENODEV;
@@ -1449,31 +1458,7 @@ static struct platform_driver vga16fb_driver = {
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

