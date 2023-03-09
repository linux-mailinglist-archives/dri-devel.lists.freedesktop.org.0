Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C66B2973
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE25B10E873;
	Thu,  9 Mar 2023 16:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165310E865
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C59D2018D;
 Thu,  9 Mar 2023 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/0ZjJnUahwB+uDTmK6gOidiMLdF9SLqHErBxx1LZFA=;
 b=sde/W8mkq20pfs9Lu23oerLWqFKCK7Ve6Z3emOo1rc8iQ5dtAT5rrBIuQ8EEsScc2Cq1tW
 etL7jJDPhJju0rI0zknbepYz4yQspUtRn6D6Sgwi+OkpxYOwpV0LPTipZND1bxrvgtK0//
 3bblfF5ajVNFkOBL7h8EVvgbEXgD8Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377746;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/0ZjJnUahwB+uDTmK6gOidiMLdF9SLqHErBxx1LZFA=;
 b=k75q3gjqGTjoy7fOj98md7bjeSqPMrPYUc0TVTkEo46OIhA4k8TsIhpdCt1MtBd7R9bguu
 vB4z8fBtKXQfkRAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25DD213A73;
 Thu,  9 Mar 2023 16:02:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cAtPCBIDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 054/101] fbdev/omapfb: Parse option string with struct
 option_iter
Date: Thu,  9 Mar 2023 17:01:14 +0100
Message-Id: <20230309160201.5163-55-tzimmermann@suse.de>
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
 drivers/video/fbdev/omap/omapfb_main.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 1f3df2055ff0..db5256c71f5b 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -11,6 +11,7 @@
  *   Dirk Behme <dirk.behme@de.bosch.com>  - changes for 2.6 kernel API
  *   Texas Instruments                     - H3 support
  */
+#include <linux/cmdline.h>
 #include <linux/platform_device.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
@@ -1842,17 +1843,17 @@ static struct platform_driver omapfb_driver = {
 #ifndef MODULE
 
 /* Process kernel command line parameters */
-static int __init omapfb_setup(char *options)
+static int __init omapfb_setup(const char *options)
 {
-	char *this_opt = NULL;
+	struct option_iter iter;
+	char *this_opt;
 	int r = 0;
 
 	pr_debug("omapfb: options %s\n", options);
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while (!r && (this_opt = strsep(&options, ",")) != NULL) {
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strncmp(this_opt, "accel", 5))
 			def_accel = 1;
 		else if (!strncmp(this_opt, "vram:", 5)) {
@@ -1893,6 +1894,8 @@ static int __init omapfb_setup(char *options)
 		}
 	}
 
+	option_iter_release(&iter);
+
 	return r;
 }
 
-- 
2.39.2

