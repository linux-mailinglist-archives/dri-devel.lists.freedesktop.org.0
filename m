Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ECC6AC628
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25F10E36D;
	Mon,  6 Mar 2023 16:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52C210E375
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2985223A0;
 Mon,  6 Mar 2023 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWjL74/OQnkYsQeBKz+W/Sdt0NW8X9eOoOaYmGq20ZE=;
 b=vHmpKEBQ90w+/BT1zxBEOj2D77zpxSMvpvdq+0mohTN7y8DSDx1vPqH/FA5O5IELosojyc
 Pbsgf6BoBUtWK8CtryNMO8YbmaJ0kjXKwQ5NJtqufnKhjViihsh5+jRyPpIjSgmkGwnfkU
 kOUBJ2jwseUqN8N2vshQgaytk+I3Q0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWjL74/OQnkYsQeBKz+W/Sdt0NW8X9eOoOaYmGq20ZE=;
 b=5xdvoayhMf1/lx6ek8bk0QKqS1TSIdVuKhQIbFTzLgx+/0efMZXjXRnKC35b5kA4O0I6NT
 H4zWj9KQFA7creBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5234D13A6A;
 Mon,  6 Mar 2023 16:00:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id INpHEx0OBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 14/99] fbdev/au1200fb: Parse option string with struct
 option_iter
Date: Mon,  6 Mar 2023 16:58:51 +0100
Message-Id: <20230306160016.4459-15-tzimmermann@suse.de>
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
 drivers/video/fbdev/au1200fb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 81c315454428..31a3f6afd8aa 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -31,6 +31,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
@@ -1578,16 +1579,17 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
 static int au1200fb_setup(struct au1200fb_platdata *pd)
 {
 	char *options = NULL;
-	char *this_opt, *endptr;
+	struct option_iter iter;
+	const char *this_opt;
+	char *endptr;
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
 	int panel_idx = -1;
 
 	fb_get_options(DRIVER_NAME, &options);
 
-	if (!options)
-		goto out;
+	option_iter_init(&iter, options);
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
+	while (option_iter_next(&iter, this_opt)) {
 		/* Panel option - can be panel name,
 		 * "bs" for board-switch, or number/index */
 		if (!strncmp(this_opt, "panel:", 6)) {
@@ -1636,7 +1638,8 @@ static int au1200fb_setup(struct au1200fb_platdata *pd)
 			print_warn("Unsupported option \"%s\"", this_opt);
 	}
 
-out:
+	option_iter_release(&iter);
+
 	return 0;
 }
 
-- 
2.39.2

