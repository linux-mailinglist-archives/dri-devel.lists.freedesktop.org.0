Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA56B2953
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E3810E869;
	Thu,  9 Mar 2023 16:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0B610E1A8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D3A322149;
 Thu,  9 Mar 2023 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPLL2nIMXVIbOX360ZiaSKuPOUXR3YFNZkhMEK9hl5o=;
 b=trE7up6tmAL8SM9RbL+ai1E5Cq3JpkvyWTc+J3fidroMRDQ4e2RJKpFjXU01wCryg/ONIP
 0L+NcJvqQG5Hn1WbN5zu84UJjaBmnQQkCs05aIy/CNGn7O+atljpOQJwrVG6VHd95Ymumq
 ZoUwZGockmE47KlNWpBdmfnQGfvVJ94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPLL2nIMXVIbOX360ZiaSKuPOUXR3YFNZkhMEK9hl5o=;
 b=61DoR8i/KKWWcskabhK7cyMJ3KnsxiG6NbRhVV4D1pVyBP0r2ztvDjpLiMqUP5fBBZc5J/
 qpDb4TCqn25oLIDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 391291391B;
 Thu,  9 Mar 2023 16:02:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mB4KDQADCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 010/101] fbdev/atafb: Parse option string with struct
 option_iter
Date: Thu,  9 Mar 2023 17:00:30 +0100
Message-Id: <20230309160201.5163-11-tzimmermann@suse.de>
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

v2:
	* add missing call to option_iter_init()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/atafb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index f0cc7c992c88..6e625ac020b5 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -47,6 +47,7 @@
 #define ATAFB_EXT
 #define ATAFB_FALCON
 
+#include <linux/cmdline.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/string.h>
@@ -2934,17 +2935,15 @@ static void __init atafb_setup_user(char *spec)
 	}
 }
 
-static int __init atafb_setup(char *options, struct platform_device *pdev)
+static int __init atafb_setup(const char *options, struct platform_device *pdev)
 {
+	struct option_iter iter;
 	char *this_opt;
 	int temp;
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-		if (!*this_opt)
-			continue;
+	while (option_iter_next(&iter, &this_opt)) {
 		if ((temp = get_video_mode(this_opt))) {
 			// ignore errors
 			mode_option = devm_kstrdup(&pdev->dev, this_opt, GFP_KERNEL);
@@ -2981,6 +2980,9 @@ static int __init atafb_setup(char *options, struct platform_device *pdev)
 		else if (!strncmp(this_opt, "R", 1))
 			atafb_setup_user(this_opt + 1);
 	}
+
+	option_iter_release(&iter);
+
 	return 0;
 }
 
-- 
2.39.2

