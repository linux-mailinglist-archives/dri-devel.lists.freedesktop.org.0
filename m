Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3286B2A1E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F89710E8A5;
	Thu,  9 Mar 2023 16:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187D510E897
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAE8520199;
 Thu,  9 Mar 2023 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJn8o7oO7CwCuILwl2JzQiMbBkeRnmXaxFrDAwCxN8U=;
 b=fXbV1Qzw6LMJxHNXe60qu6ZDrqzwHGI1/kll5TDILVXN7pmt/2bhsJnP7xW6o/TFQHJDcs
 59PNq2nicPe7LasGax9LCjMfVzz6tBIRJE3o5xYpVQ3NpfMwWKd0SGxdkXLNGKg6TmEOEA
 ny9MDx+0uJnh1GtOvY110idgnhIhDLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJn8o7oO7CwCuILwl2JzQiMbBkeRnmXaxFrDAwCxN8U=;
 b=/U0nSzLLSxyCFAM90iXf1RdWq2BiPXb9dOCzpVgYQagu40T1mHm444umGb2ChCsYIH+LW4
 1Oc7pL9roq++vfBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48DA81391B;
 Thu,  9 Mar 2023 16:02:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2APSEB0DCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 082/101] fbdev/tgafb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:01:42 +0100
Message-Id: <20230309160201.5163-83-tzimmermann@suse.de>
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

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

v2:
	* replace static memory with kstrdup()/kfree() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/tgafb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 14d37c49633c..cf00b8a91bfb 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -59,6 +59,7 @@ static int tgafb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info
 static int tgafb_register(struct device *dev);
 static void tgafb_unregister(struct device *dev);
 
+static const char *mode_option_buf;
 static const char *mode_option;
 static const char *mode_option_pci = "640x480@60";
 static const char *mode_option_tc = "1280x1024@72";
@@ -1568,6 +1569,7 @@ static void tgafb_exit(void)
 {
 	tc_unregister_driver(&tgafb_tc_driver);
 	pci_unregister_driver(&tgafb_pci_driver);
+	kfree(mode_option_buf);
 }
 
 #ifndef MODULE
@@ -1579,9 +1581,11 @@ static int tgafb_setup(char *arg)
 		while ((this_opt = strsep(&arg, ","))) {
 			if (!*this_opt)
 				continue;
-			if (!strncmp(this_opt, "mode:", 5))
-				mode_option = this_opt+5;
-			else
+			if (!strncmp(this_opt, "mode:", 5)) {
+				kfree(mode_option_buf);
+				mode_option_buf = kstrdup(this_opt, GFP_KERNEL); // ignore errors
+				mode_option = mode_option_buf;
+			} else
 				printk(KERN_ERR
 				       "tgafb: unknown parameter %s\n",
 				       this_opt);
-- 
2.39.2

