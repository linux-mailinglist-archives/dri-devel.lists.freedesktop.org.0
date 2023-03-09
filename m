Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6246B2968
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8564510E86D;
	Thu,  9 Mar 2023 16:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D376110E038
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CC402017A;
 Thu,  9 Mar 2023 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAKwWillpJMLRw6wMQPDlzuh9+KWUcuRQNAZe1IaSrQ=;
 b=RSlu/cjSsyBJb0MNuFlWjDGlixOEHTWKfPF4CA+Rq/LSjRBhQiMJVX6fcb/RDWUtkmGaJN
 WxBFUszBc4pRI2i7IhFqOz7kntSHcGEOqd8h7jajUJqkFhvJfHTAbVYvHPu+OszvS03e1r
 uATh4kb07ZzFr8ryJzEhzb7B4hhjHxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAKwWillpJMLRw6wMQPDlzuh9+KWUcuRQNAZe1IaSrQ=;
 b=AMAKtOMDSze1CiWVcaaE9i5u9eSGfP91ts9jiKv2c+WvFiqtTHhXEtSSpMJBfV7138SSHC
 sERhL8+1fIr3VdDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F35161391B;
 Thu,  9 Mar 2023 16:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gBB2Ov4CCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 007/101] fbdev/amifb: Parse option string with struct
 option_iter
Date: Thu,  9 Mar 2023 17:00:27 +0100
Message-Id: <20230309160201.5163-8-tzimmermann@suse.de>
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
 drivers/video/fbdev/amifb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 9517aa5bd2c0..a09edc576437 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -40,6 +40,7 @@
  * for more details.
  */
 
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -2345,16 +2346,14 @@ static void __init amifb_setup_mcap(char *spec)
 	amifb_vfmax = vmax;
 }
 
-static int __init amifb_setup(char *options, struct platform_device *pdev)
+static int __init amifb_setup(const char *options, struct platform_device *pdev)
 {
+	struct option_iter iter;
 	char *this_opt;
 
-	if (!options || !*options)
-		return 0;
+	option_iter_init(&iter, options);
 
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-		if (!*this_opt)
-			continue;
+	while (option_iter_next(&iter, &this_opt)) {
 		if (!strcmp(this_opt, "inverse")) {
 			fb_invert_cmaps();
 		} else if (!strcmp(this_opt, "ilbm"))
@@ -2369,6 +2368,8 @@ static int __init amifb_setup(char *options, struct platform_device *pdev)
 		}
 	}
 
+	option_iter_release(&iter);
+
 	if (min_fstrt < 48)
 		min_fstrt = 48;
 
-- 
2.39.2

