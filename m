Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596706AC640
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1E510E37D;
	Mon,  6 Mar 2023 16:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A289810E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4E8131FDF6;
 Mon,  6 Mar 2023 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk7crcnOtaYz5lnPu5nHcEno5CdLWKHT+UBXQhxUl8A=;
 b=GZXdKU6aEL7CBeCsklgVkmVkIEMmxg5dvY4rPpZZXFYp5mNWFe6RiZvl5BDYpi9UN0DtI5
 qIpUhIkwDwylSmmVcPaCadPGfdUOkn6ll8RQNrWmsRbDF7PD9OcGXq9lrwoh5b9/9ROyIa
 rtiCyUhaVcaIId6N1XHJOnubTk2Uzfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk7crcnOtaYz5lnPu5nHcEno5CdLWKHT+UBXQhxUl8A=;
 b=Mc7IPHSQBqfzl2cZHYrUjQsreYZzMHsizsnW9xXH+s5PvhaOf8ELhUtJec5g5JKlJ0vnXg
 7t9+6B2a9vT14HBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB6DA13513;
 Mon,  6 Mar 2023 16:00:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uB6MOBwOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 13/99] fbdev/au1100fb: Parse option string with struct
 option_iter
Date: Mon,  6 Mar 2023 16:58:50 +0100
Message-Id: <20230306160016.4459-14-tzimmermann@suse.de>
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
 drivers/video/fbdev/au1100fb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 519313b8bb00..17dae92ac53f 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -42,6 +42,7 @@
  *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
 #include <linux/clk.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -365,7 +366,9 @@ static const struct fb_ops au1100fb_ops =
 
 static int au1100fb_setup(struct au1100fb_device *fbdev)
 {
-	char *this_opt, *options;
+	char *options;
+	struct option_iter iter;
+	const char *this_opt;
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
 
 	if (num_panels <= 0) {
@@ -375,10 +378,10 @@ static int au1100fb_setup(struct au1100fb_device *fbdev)
 
 	if (fb_get_options(DRIVER_NAME, &options))
 		return -ENODEV;
-	if (!options)
-		return -ENODEV;
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
+	option_iter_init(&iter, options);
+
+	while (option_iter_next(&iter, this_opt)) {
 		/* Panel option */
 		if (!strncmp(this_opt, "panel:", 6)) {
 			int i;
@@ -401,6 +404,8 @@ static int au1100fb_setup(struct au1100fb_device *fbdev)
 			print_warn("Unsupported option \"%s\"", this_opt);
 	}
 
+	option_iter_release(&iter);
+
 	print_info("Panel=%s", fbdev->panel->name);
 
 	return 0;
-- 
2.39.2

