Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB96B2979
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533D10E891;
	Thu,  9 Mar 2023 16:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E4010E85C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5144920180;
 Thu,  9 Mar 2023 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xqb9CgIoQGPm/XxyMitPmhdSDaGH79IsOOqR6TG8g1I=;
 b=CeFZiktdszGYTi/TFyAP/ldlwhwuYupWUIF8tFKc6aafQMfvB68x2fKK6RCTZ2dKq0yJFe
 PKiygqiGal7n0KWo4eMoRqzqq8uDvuKdTrrsqodbae/SHTXusnmBmasNUmYf5B9gRr/hCa
 +l7440uanYzdUVQVbOhZzu5inLDIDqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xqb9CgIoQGPm/XxyMitPmhdSDaGH79IsOOqR6TG8g1I=;
 b=2ZDnOM33w7luTv8IUcn8JfTZUfCM8NDRECPE/CedbN1GUmMeWxZ515kMbjBj1afytoFiPy
 SarN+ubFAu54ViDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCA331391B;
 Thu,  9 Mar 2023 16:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aDToNAEDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 014/101] fbdev/au1200fb: Parse option string with struct
 option_iter
Date: Thu,  9 Mar 2023 17:00:34 +0100
Message-Id: <20230309160201.5163-15-tzimmermann@suse.de>
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
 drivers/video/fbdev/au1200fb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 81c315454428..43b6a9dfeec4 100644
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
+	char *this_opt;
+	char *endptr;
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
 	int panel_idx = -1;
 
 	fb_get_options(DRIVER_NAME, &options);
 
-	if (!options)
-		goto out;
+	option_iter_init(&iter, options);
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
+	while (option_iter_next(&iter, &this_opt)) {
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

