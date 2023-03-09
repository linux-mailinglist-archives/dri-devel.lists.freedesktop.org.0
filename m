Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5063D6B2952
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61FB10E85E;
	Thu,  9 Mar 2023 16:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774E10E1A8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C8DAA20183;
 Thu,  9 Mar 2023 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVdpUcThieHjdBQBTJhLTZp8YL7s1ZuPBMFCE/O3DfA=;
 b=16Hw9Sfr6Z2pS0gL7MptHMWvTf11QUZOFD9jaXUqUcma/ijNYD6dWj95PKRUBgzn+4ROgT
 hv9vWl5weWTtTeR651/eU2I3Sh1mFmRJ9tBjByxuuJiPAliq0ThR5nlMC2LeKxSTFTtEeu
 z5iP0+h5DxNe+WXAyg3dQL1TgYHvL9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVdpUcThieHjdBQBTJhLTZp8YL7s1ZuPBMFCE/O3DfA=;
 b=nlEd+LNVfDtgynpThxA8Ms6+nW6bkD4nYQo3XkK+bvgmVFMlPUzEig0NE/Q7QYPW1HY8Jf
 3tVPZCAUwX8XNxAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62EFF1391B;
 Thu,  9 Mar 2023 16:02:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aAomFwQDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 020/101] fbdev/efifb: Parse option string with struct
 option_iter
Date: Thu,  9 Mar 2023 17:00:40 +0100
Message-Id: <20230309160201.5163-21-tzimmermann@suse.de>
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
 drivers/video/fbdev/efifb.c | 42 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index a5779fb453a2..be77a76f7d1d 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/kernel.h>
 #include <linux/efi.h>
 #include <linux/efi-bgrt.h>
@@ -284,31 +285,32 @@ static const struct fb_ops efifb_ops = {
 	.fb_imageblit	= cfb_imageblit,
 };
 
-static int efifb_setup(char *options)
+static int efifb_setup(const char *options)
 {
+	struct option_iter iter;
 	char *this_opt;
 
-	if (options && *options) {
-		while ((this_opt = strsep(&options, ",")) != NULL) {
-			if (!*this_opt) continue;
-
-			efifb_setup_from_dmi(&screen_info, this_opt);
-
-			if (!strncmp(this_opt, "base:", 5))
-				screen_info.lfb_base = simple_strtoul(this_opt+5, NULL, 0);
-			else if (!strncmp(this_opt, "stride:", 7))
-				screen_info.lfb_linelength = simple_strtoul(this_opt+7, NULL, 0) * 4;
-			else if (!strncmp(this_opt, "height:", 7))
-				screen_info.lfb_height = simple_strtoul(this_opt+7, NULL, 0);
-			else if (!strncmp(this_opt, "width:", 6))
-				screen_info.lfb_width = simple_strtoul(this_opt+6, NULL, 0);
-			else if (!strcmp(this_opt, "nowc"))
-				mem_flags &= ~EFI_MEMORY_WC;
-			else if (!strcmp(this_opt, "nobgrt"))
-				use_bgrt = false;
-		}
+	option_iter_init(&iter, options);
+
+	while (option_iter_next(&iter, &this_opt)) {
+		efifb_setup_from_dmi(&screen_info, this_opt);
+
+		if (!strncmp(this_opt, "base:", 5))
+			screen_info.lfb_base = simple_strtoul(this_opt+5, NULL, 0);
+		else if (!strncmp(this_opt, "stride:", 7))
+			screen_info.lfb_linelength = simple_strtoul(this_opt+7, NULL, 0) * 4;
+		else if (!strncmp(this_opt, "height:", 7))
+			screen_info.lfb_height = simple_strtoul(this_opt+7, NULL, 0);
+		else if (!strncmp(this_opt, "width:", 6))
+			screen_info.lfb_width = simple_strtoul(this_opt+6, NULL, 0);
+		else if (!strcmp(this_opt, "nowc"))
+			mem_flags &= ~EFI_MEMORY_WC;
+		else if (!strcmp(this_opt, "nobgrt"))
+			use_bgrt = false;
 	}
 
+	option_iter_release(&iter);
+
 	return 0;
 }
 
-- 
2.39.2

