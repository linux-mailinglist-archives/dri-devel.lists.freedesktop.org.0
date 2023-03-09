Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0F6B296E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380410E879;
	Thu,  9 Mar 2023 16:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6420610E86C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0690B22151;
 Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOJRS9DbzwjJAtDnq9gbzKlqhGtP/9e84GLDpJD2PAc=;
 b=dmbO1My0VEsrfehWJQphCmuDLEDRyugyo2oCtg6Om48efhz6TaciAkI2te+daozi6/4UYp
 ZqydCAlg2Xw2FPV+Mh+jldMrnbz2UouxENxa3ayhkFCdCNbQQEZRf2xJ9dhb8ABiKo8UCY
 aIRnsnaoVBxc8eKmKA2b1T7owKmKftc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOJRS9DbzwjJAtDnq9gbzKlqhGtP/9e84GLDpJD2PAc=;
 b=v8Ul8UMoXoBnv7XJVeXlR9wlvfT/Lkfi/hSq34WjrzCIHulVpmtEHu3YOZljjamfIjzFhg
 9EipOjM8Ib+//bDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 973811391B;
 Thu,  9 Mar 2023 16:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WMTxIwgDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 030/101] fbdev/gxt4500: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:50 +0100
Message-Id: <20230309160201.5163-31-tzimmermann@suse.de>
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
 drivers/video/fbdev/gxt4500.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 5f42d3d9d6ce..65cb44c281c1 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -158,6 +158,7 @@ struct gxt4500_par {
 };
 
 /* mode requested by user */
+static char *mode_option_buf;
 static char *mode_option;
 
 /* default mode: 1280x1024 @ 60 Hz, 8 bpp */
@@ -779,12 +780,21 @@ static struct pci_driver gxt4500_driver = {
 
 static int gxt4500_init(void)
 {
+#ifndef MODULE
+	char *options;
+#endif
+
 	if (fb_modesetting_disabled("gxt4500"))
 		return -ENODEV;
 
 #ifndef MODULE
-	if (fb_get_options("gxt4500", &mode_option))
+	if (fb_get_options("gxt4500", &options))
 		return -ENODEV;
+
+	if (options && *options) {
+		mode_option_buf = kstrdup(options, GFP_KERNEL); // ignore errors
+		mode_option = mode_option_buf;
+	}
 #endif
 
 	return pci_register_driver(&gxt4500_driver);
@@ -794,6 +804,7 @@ module_init(gxt4500_init);
 static void __exit gxt4500_exit(void)
 {
 	pci_unregister_driver(&gxt4500_driver);
+	kfree(mode_option_buf);
 }
 module_exit(gxt4500_exit);
 
-- 
2.39.2

