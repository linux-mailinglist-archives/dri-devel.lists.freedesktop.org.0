Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1D6AC700
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146AD10E39B;
	Mon,  6 Mar 2023 16:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9139D10E375
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 567171FE0B;
 Mon,  6 Mar 2023 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACmxitiOteI6mi9z0BgBQ/16D1s/Eul8G7DwC8i4fUY=;
 b=agFGvjCcIAnoCBZPbPcoRWKEeBcQjj4jGbuaZWlzGXf7CeQ/K/b8KZ5BXf1UvGDvQgTA0W
 II2Q/E2hv3CAMmY4wNlgUi390KReXar+ihBinjwMPuKWLCL2GwQmKj4mgMMBYMRN/0x5FU
 Td76lF0lEWkmjgOIzqo2tYja9ScHbGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACmxitiOteI6mi9z0BgBQ/16D1s/Eul8G7DwC8i4fUY=;
 b=zGQGSCh49AibU4o0tE11q5r6bDGen1nUV0vNfXlzFWtgegrLutSY7a9TMGIdOI2+EuhTHD
 p7OKwUQ9GOpcqvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEA5813513;
 Mon,  6 Mar 2023 16:00:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +OtpOSEOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 27/99] fbdev/geode: Parse option string with struct option_iter
Date: Mon,  6 Mar 2023 16:59:04 +0100
Message-Id: <20230306160016.4459-28-tzimmermann@suse.de>
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
 drivers/video/fbdev/geode/gx1fb_core.c | 16 ++++++++--------
 drivers/video/fbdev/geode/gxfb_core.c  | 17 ++++++++---------
 drivers/video/fbdev/geode/lxfb_core.c  | 14 ++++++--------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 9c942001ac10..dd1dc7ee7f83 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -403,17 +404,14 @@ static void gx1fb_remove(struct pci_dev *pdev)
 }
 
 #ifndef MODULE
-static void __init gx1fb_setup(char *options)
+static void __init gx1fb_setup(const char *options)
 {
-	char *this_opt;
+	struct option_iter iter;
+	const char *this_opt;
 
-	if (!options || !*options)
-		return;
-
-	while ((this_opt = strsep(&options, ","))) {
-		if (!*this_opt)
-			continue;
+	option_iter_init(&iter, options);
 
+	while (option_iter_next(&iter, this_opt)) {
 		if (!strncmp(this_opt, "mode:", 5))
 			strscpy(mode_option, this_opt + 5, sizeof(mode_option));
 		else if (!strncmp(this_opt, "crt:", 4))
@@ -423,6 +421,8 @@ static void __init gx1fb_setup(char *options)
 		else
 			strscpy(mode_option, this_opt, sizeof(mode_option));
 	}
+
+	option_iter_release(&iter);
 }
 #endif
 
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 3ed85d2d53e9..f5e88e92ba16 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -16,6 +16,7 @@
  * 16 MiB of framebuffer memory is assumed to be available.
  */
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -488,21 +489,17 @@ static struct pci_driver gxfb_driver = {
 };
 
 #ifndef MODULE
-static int __init gxfb_setup(char *options)
+static int __init gxfb_setup(const char *options)
 {
+	struct option_iter iter;
+	const char *opt;
 
-	char *opt;
+	option_iter_init(&iter, options);
 
-	if (!options || !*options)
-		return 0;
-
-	while ((opt = strsep(&options, ",")) != NULL) {
+	while (option_iter_next(&iter, opt)) {
 		static char mode_option_buf[256];
 		int ret;
 
-		if (!*opt)
-			continue;
-
 		ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", opt);
 		if (WARN(ret < 0, "gxfb: ignoring invalid option, ret=%d\n", ret))
 			continue;
@@ -511,6 +508,8 @@ static int __init gxfb_setup(char *options)
 		mode_option = mode_option_buf;
 	}
 
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 6e1e73a21bdb..d687054cdb09 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -618,17 +619,14 @@ static struct pci_driver lxfb_driver = {
 };
 
 #ifndef MODULE
-static int __init lxfb_setup(char *options)
+static int __init lxfb_setup(const char *options)
 {
-	char *opt;
+	struct option_iter iter;
+	const char *opt;
 
-	if (!options || !*options)
-		return 0;
-
-	while ((opt = strsep(&options, ",")) != NULL) {
-		if (!*opt)
-			continue;
+	option_iter_init(&iter, options);
 
+	while (option_iter_next(&iter, opt)) {
 		if (!strcmp(opt, "noclear"))
 			noclear = 1;
 		else if (!strcmp(opt, "nopanel"))
-- 
2.39.2

