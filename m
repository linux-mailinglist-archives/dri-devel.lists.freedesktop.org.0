Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2886B29C0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB9210E897;
	Thu,  9 Mar 2023 16:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CF610E1A8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51F312214E;
 Thu,  9 Mar 2023 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beRjODUzm3MKJbdpk2tBhf5WWDQY92luTF+R5dqwPjA=;
 b=pUwW8HBJkF2ocJX9qli2ulpDhWr2ssZMvfQASEOr7bslcgCqmt5rDyF3SwAaxwQXObPchh
 VZHCfyivOK0DJPNrnkgiUuDJawuRJQurJ35rCJoCq3jVMvDTI7vFpFgdqmlM3qrhdbETtv
 7tsuJiCJyOOcsegB/oLGrVZpGyEIB7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beRjODUzm3MKJbdpk2tBhf5WWDQY92luTF+R5dqwPjA=;
 b=A2hAg8tHxO+4wrA5qr2HRyoVQc3FWQZz70HH0NzdlGLnr94vmvgD36NUurqW0Nxg/G6x6S
 BjZBRq81pUDC6zAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5A901391B;
 Thu,  9 Mar 2023 16:02:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qNQFNwYDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 026/101] fbdev/geode: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:46 +0100
Message-Id: <20230309160201.5163-27-tzimmermann@suse.de>
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

Assume that the drivers do not own the option string or its substrings
and hence duplicate the option string for the video mode. Allocate the
copy's memory with kstrdup() and free it in each module's exit function.

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

v2:
	* replace static memory with kstrdup()/kfree() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/geode/gxfb_core.c | 6 +++++-
 drivers/video/fbdev/geode/lxfb_core.c | 9 +++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 8e05e76de075..491de0ac5876 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -33,6 +33,7 @@
 
 #include "gxfb.h"
 
+static char *mode_option_buf;
 static char *mode_option;
 static int vram;
 static int vt_switch;
@@ -500,7 +501,9 @@ static int __init gxfb_setup(char *options)
 		if (!*opt)
 			continue;
 
-		mode_option = opt;
+		kfree(mode_option_buf);
+		mode_option_buf = kstrdup(opt, GFP_KERNEL); // ignore errors
+		mode_option = mode_option_buf;
 	}
 
 	return 0;
@@ -528,6 +531,7 @@ static int __init gxfb_init(void)
 static void __exit gxfb_cleanup(void)
 {
 	pci_unregister_driver(&gxfb_driver);
+	kfree(mode_option_buf);
 }
 
 module_init(gxfb_init);
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 8130e9eee2b4..6863ee858d8d 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -24,6 +24,7 @@
 
 #include "lxfb.h"
 
+static char *mode_option_buf;
 static char *mode_option;
 static int noclear, nopanel, nocrt;
 static int vram;
@@ -635,8 +636,11 @@ static int __init lxfb_setup(char *options)
 			nopanel = 1;
 		else if (!strcmp(opt, "nocrt"))
 			nocrt = 1;
-		else
-			mode_option = opt;
+		else {
+			kfree(mode_option_buf);
+			mode_option_buf = kstrdup(opt, GFP_KERNEL); // ignore errors
+			mode_option = mode_option_buf;
+		}
 	}
 
 	return 0;
@@ -663,6 +667,7 @@ static int __init lxfb_init(void)
 static void __exit lxfb_cleanup(void)
 {
 	pci_unregister_driver(&lxfb_driver);
+	kfree(mode_option_buf);
 }
 
 module_init(lxfb_init);
-- 
2.39.2

