Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A146AC6AC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B306110E3B1;
	Mon,  6 Mar 2023 16:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA3B10E375
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29555223CC;
 Mon,  6 Mar 2023 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slMylKd0o1pIzeZMW4EsaSmRliq1ZmGtsXfkeJQfBhI=;
 b=nWYRCxcpSw24XPnQhN6bsR7WDZgM5apHXp8qLJ8oOubE1YwShKqdO5TsIDKOMtJ3FPFb6N
 EZxbONNv0/77cheKLv9YZW6HrNa7N9p2dN+u8ZRCH6c/NY1jDBriNp7vIecSSHruZY/N9R
 zEcCu0I151s7ETsZ4rKWTZQfYb4sRPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slMylKd0o1pIzeZMW4EsaSmRliq1ZmGtsXfkeJQfBhI=;
 b=4kKE/MQinGXqJrRY+pyR3GyijdpoQkzvzi4uId+nsbVwA3X0bWWFnbwzB5QDn590hlGa6x
 yiJ+B/TIhTZCXFDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDA8D13A6A;
 Mon,  6 Mar 2023 16:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iONwLSIOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 29/99] fbdev/grvga: Parse option string with struct option_iter
Date: Mon,  6 Mar 2023 16:59:06 +0100
Message-Id: <20230306160016.4459-30-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use struct option_iter to walk over the individual options in the
driver's option string. Replaces the hand-written strsep() loop with
a clean interface. The helpers for struct option_iter handle empty
option strings and empty options transparently. The struct's _init
and _release functions duplicate and release the option string's
memory buffer as needed.

Done in preparation of constifying the option string.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/grvga.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index bb4baec2eccc..f803dc37c891 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -10,6 +10,7 @@
  * Contributors: Kristoffer Glembo <kristoffer@gaisler.com>
  */
 
+#include <linux/cmdline.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
@@ -334,6 +335,8 @@ static int grvga_probe(struct platform_device *dev)
 	unsigned long grvga_mem_size = 0;
 	struct grvga_par *par = NULL;
 	char *options = NULL, *mode_opt = NULL;
+	struct option_iter iter;
+	const char *this_opt;
 
 	info = framebuffer_alloc(sizeof(struct grvga_par), &dev->dev);
 	if (!info)
@@ -353,15 +356,13 @@ static int grvga_probe(struct platform_device *dev)
 	if (!options || !*options)
 		options =  "640x480-8@60";
 
-	while (1) {
-		char *this_opt = strsep(&options, ",");
-
-		if (!this_opt)
-			break;
+	option_iter_init(&iter, options);
 
+	while (option_iter_next(&iter, this_opt)) {
 		if (!strncmp(this_opt, "custom", 6)) {
 			if (grvga_parse_custom(this_opt, &info->var) < 0) {
 				dev_err(&dev->dev, "Failed to parse custom mode (%s).\n", this_opt);
+				option_iter_release(&iter);
 				retval = -EINVAL;
 				goto free_fb;
 			}
@@ -385,6 +386,8 @@ static int grvga_probe(struct platform_device *dev)
 		}
 	}
 
+	option_iter_release(&iter);
+
 	par = info->par;
 	info->fbops = &grvga_ops;
 	info->fix = grvga_fix;
-- 
2.39.2

