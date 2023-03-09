Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924286B29C5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3456610E898;
	Thu,  9 Mar 2023 16:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6A110E876
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0CB020179;
 Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/RxdU96+Et0kzCkk2iYUxqvPXUD67Kvpv1fXm/8kdc=;
 b=mfnholkjsMEQvpK82mVARspwIIfUUYeOFssQ09i02V6sLrf/qO41Jfj6e585c7gBPyoull
 dhQBuCYg7Hb2mbaazaJ8z0cuyXmEoIlVTRMNSgs27zJ72mDU7bdVMzxPEXgkI6jIPEhbhD
 squjRb32eWRLLEM1w29gCulbq+jbMsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/RxdU96+Et0kzCkk2iYUxqvPXUD67Kvpv1fXm/8kdc=;
 b=Puy71ZT0dgYe9nmL3wzhzAklO8doO12DACnGbhg9wZXEfQQpN4ejuRSV1kY5sakar8RV81
 W5sYnqsQz0BSykBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72EE11391B;
 Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IJgiGwkDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 032/101] fbdev/i740fb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:52 +0100
Message-Id: <20230309160201.5163-33-tzimmermann@suse.de>
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
 drivers/video/fbdev/i740fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 3860b137b86a..61c022b8d5de 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -31,6 +31,7 @@
 
 #include "i740_reg.h"
 
+static char *mode_option_buf;
 static char *mode_option;
 static int mtrr = 1;
 
@@ -1273,8 +1274,11 @@ static int  __init i740fb_setup(char *options)
 			continue;
 		else if (!strncmp(opt, "mtrr:", 5))
 			mtrr = simple_strtoul(opt + 5, NULL, 0);
-		else
-			mode_option = opt;
+		else {
+			kfree(mode_option_buf);
+			mode_option_buf = kstrdup(opt, GFP_KERNEL); // ignore errors
+			mode_option = mode_option_buf;
+		}
 	}
 
 	return 0;
@@ -1302,6 +1306,7 @@ static int __init i740fb_init(void)
 static void __exit i740fb_exit(void)
 {
 	pci_unregister_driver(&i740fb_driver);
+	kfree(mode_option_buf);
 }
 
 module_init(i740fb_init);
-- 
2.39.2

