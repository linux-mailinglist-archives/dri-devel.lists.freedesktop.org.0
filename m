Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D7F6B2990
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E7610E896;
	Thu,  9 Mar 2023 16:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26B410E865
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91F6020187;
 Thu,  9 Mar 2023 16:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Fvb4dPXHzZD/13C8edGQz9gQl5cXDYn4iOfZr+To1w=;
 b=pm629shnQGKiBBzrb5+svkmSoJF+pNnls41PQ/vMQxKfkhV3DvoddGC87F2oTKavt6j+zN
 8cuw0qj8h167xmuDD1saIJ4SB+ScJxIpnBuFm+DdsWeh/UgpJ6Dlv6fg8kVtxNG4iEFTFv
 bncU6vSQJft37xWHdbIUKU9ZZIiqmTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Fvb4dPXHzZD/13C8edGQz9gQl5cXDYn4iOfZr+To1w=;
 b=9LVYwwmbreLK0qJ6oYY8OIE07dDgcNSwoV8BwX3bZbTbHofzMoswL4EnI2dsAQwqNFx6lH
 vAYXKckuD1SFU8Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E8B013A73;
 Thu,  9 Mar 2023 16:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gL9qCggDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 029/101] fbdev/grvga: Parse option string with struct
 option_iter
Date: Thu,  9 Mar 2023 17:00:49 +0100
Message-Id: <20230309160201.5163-30-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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
index 28c2e0e0763a..742331d0f08b 100644
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
+	char *this_opt;
 
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
 
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strncmp(this_opt, "custom", 6)) {
 			if (grvga_parse_custom(this_opt, &info->var) < 0) {
 				dev_err(&dev->dev, "Failed to parse custom mode (%s).\n", this_opt);
+				option_iter_release(&iter);
 				retval = -EINVAL;
 				goto free_fb;
 			}
@@ -373,6 +374,8 @@ static int grvga_probe(struct platform_device *dev)
 			mode_opt = devm_kstrdup(&dev->dev, opt, GFP_KERNEL); // ignore errors
 	}
 
+	option_iter_release(&iter);
+
 	par = info->par;
 	info->fbops = &grvga_ops;
 	info->fix = grvga_fix;
-- 
2.39.2

