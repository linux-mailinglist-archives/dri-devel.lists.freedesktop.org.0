Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925697229AE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813E710E2CA;
	Mon,  5 Jun 2023 14:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DF910E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76DDD21B71;
 Mon,  5 Jun 2023 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mPTLDhohp4Z1Ea+6VCp5sKGyC16+G5DhQ4PLkx6FPE=;
 b=q3L8tcp+mGVnQ83UZ4yFA+W1IdT52sVjv49f3GSZXWex6DJlMQO81V3zGsTpmgid4dXSOy
 QVwI+iTJ+49zwqXfl3KgJ9Sv8/kAwJHr3kZg3bRNIH6NsqVU4Y5XAhnJmK31XYm3/tZzjz
 JtFoHF/gYJXRv550K6hiDj4iZB8bqvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mPTLDhohp4Z1Ea+6VCp5sKGyC16+G5DhQ4PLkx6FPE=;
 b=NoY2loB6M5qkJd9UAG/JapgZNElUey9LXICchiYMSQVrHghCnGVu3mRbZ9U/+BY9nYpNym
 YMY3SQEiB7KCVzCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F31913A3C;
 Mon,  5 Jun 2023 14:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OAq3BrT1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 19/30] fbdev/rivafb: Reorder backlight and framebuffer
 init/cleanup
Date: Mon,  5 Jun 2023 16:48:01 +0200
Message-Id: <20230605144812.15241-20-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the init and cleanup calls for
both data structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
---
 drivers/video/fbdev/riva/fbdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 41edc6e79460..e328b2d39e2b 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -2031,9 +2031,6 @@ static int rivafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pd, info);
 
-	if (backlight)
-		riva_bl_init(info->par);
-
 	ret = register_framebuffer(info);
 	if (ret < 0) {
 		printk(KERN_ERR PFX
@@ -2041,6 +2038,9 @@ static int rivafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 		goto err_iounmap_screen_base;
 	}
 
+	if (backlight)
+		riva_bl_init(info->par);
+
 	printk(KERN_INFO PFX
 		"PCI nVidia %s framebuffer ver %s (%dMB @ 0x%lX)\n",
 		info->fix.id,
@@ -2084,9 +2084,9 @@ static void rivafb_remove(struct pci_dev *pd)
 	kfree(par->EDID);
 #endif
 
+	riva_bl_exit(info);
 	unregister_framebuffer(info);
 
-	riva_bl_exit(info);
 	arch_phys_wc_del(par->wc_cookie);
 	iounmap(par->ctrl_base);
 	iounmap(info->screen_base);
-- 
2.40.1

