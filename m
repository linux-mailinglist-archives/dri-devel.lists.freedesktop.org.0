Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E26B2965
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F27A10E862;
	Thu,  9 Mar 2023 16:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091F810E85E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6D902017E;
 Thu,  9 Mar 2023 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDLfWugx/oPOz6pILs/JXlPMBz5A3FDUfG3kXQPg+jE=;
 b=10+7N1KxIlvvKdllrJbUahxa/LQ75ZbLFlZVVLr7VD9pJtlR073sO6rv7I/YqFMa6lB4Ok
 bIAY8IaxEgsaExB8N45YhTJ4oZLhdYKhrO80gW9ugwYYCXgn3bXNcVeV8bFwCvmZRQqLMS
 WNWxVj7CVPsE3vjYH7XZ6eW5xex3mD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDLfWugx/oPOz6pILs/JXlPMBz5A3FDUfG3kXQPg+jE=;
 b=ffHZR+Za2tyTYGAnEwADCX6f12QPIzo3WuhS/V+mV+h1tYUfmHyGDHFJ7YVHeQxV8FWUIt
 gJ/d4jgTaNNdRMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 552E913A73;
 Thu,  9 Mar 2023 16:02:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SITtEwIDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 015/101] fbdev/cirrusfb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:35 +0100
Message-Id: <20230309160201.5163-16-tzimmermann@suse.de>
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
 drivers/video/fbdev/cirrusfb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index ba45e2147c52..85b9442031b3 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -367,6 +367,7 @@ struct cirrusfb_info {
 };
 
 static bool noaccel;
+static char *mode_option_buf;
 static char *mode_option = "640x480@60";
 
 /****************************************************************************/
@@ -2336,10 +2337,13 @@ static int __init cirrusfb_setup(char *options)
 
 		if (!strcmp(this_opt, "noaccel"))
 			noaccel = 1;
-		else if (!strncmp(this_opt, "mode:", 5))
-			mode_option = this_opt + 5;
-		else
-			mode_option = this_opt;
+		else {
+			if (!strncmp(this_opt, "mode:", 5))
+				this_opt += 5;
+			kfree(mode_option_buf);
+			mode_option_buf = kstrdup(this_opt, GFP_KERNEL); // ignore errors
+			mode_option = mode_option_buf;
+		}
 	}
 	return 0;
 }
@@ -2387,6 +2391,7 @@ static void __exit cirrusfb_exit(void)
 #ifdef CONFIG_ZORRO
 	zorro_unregister_driver(&cirrusfb_zorro_driver);
 #endif
+	kfree(mode_option_buf);
 }
 
 module_init(cirrusfb_init);
-- 
2.39.2

