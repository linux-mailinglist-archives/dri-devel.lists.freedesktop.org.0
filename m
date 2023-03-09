Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755426B29EB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AE010E8A6;
	Thu,  9 Mar 2023 16:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434B110E86E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E51032019C;
 Thu,  9 Mar 2023 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ewk1zW+eJTNjlZhtMIf7xoC1lhKXLT0JOMFhSzbnk2I=;
 b=W8t0NpW6nUBoUC6nOtj8OYG4dlb2Wir2e0S7qsu1tGBDg1OVfUMaZC9SfNnFPv83dlgal5
 ATx9fPTNlMgxGGrnOxh+/3azWFejpIvlXRgDbHbDThikNI1gTLmbrcm7LNNu67rjERZrL1
 mFqMzEQ7gpFZBZ8yZQupXA1CVuXDZHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ewk1zW+eJTNjlZhtMIf7xoC1lhKXLT0JOMFhSzbnk2I=;
 b=nmkM7AlEnDqTw3Pxe33LJ0VWVSWtjwybLvxhhm0zRm+ZLzRBaNwjKqWdKjJyqPghMVb4IO
 C/JmGbL+n0AJKrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80F5813A73;
 Thu,  9 Mar 2023 16:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6NCMHiMDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 097/101] fbdev/vt8623fb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:01:57 +0100
Message-Id: <20230309160201.5163-98-tzimmermann@suse.de>
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

Assume that the driver does not own the option string or its substrings
and hence duplicate the option string for the video mode. Allocate the
copy's memory with kstrdup() and free it in the module's exit function.

Done in preparation of constifying the option string.

v2:
	* replace static memory with kstrdup()/kfree() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/vt8623fb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 034333ee6e45..321b1813cf3c 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -95,6 +95,7 @@ static const struct svga_timing_regs vt8623_timing_regs     = {
 
 /* Module parameters */
 
+static char *mode_option_buf;
 static char *mode_option = "640x480-8@60";
 static int mtrr = 1;
 
@@ -911,6 +912,7 @@ static void __exit vt8623fb_cleanup(void)
 {
 	pr_debug("vt8623fb: cleaning up\n");
 	pci_unregister_driver(&vt8623fb_pci_driver);
+	kfree(mode_option_buf);
 }
 
 /* Driver Initialisation */
@@ -929,8 +931,10 @@ static int __init vt8623fb_init(void)
 	if (fb_get_options("vt8623fb", &option))
 		return -ENODEV;
 
-	if (option && *option)
-		mode_option = option;
+	if (option && *option) {
+		mode_option_buf = kstrdup(option, GFP_KERNEL); // ignore errors
+		mode_option = mode_option_buf;
+	}
 #endif
 
 	pr_debug("vt8623fb: initializing\n");
-- 
2.39.2

