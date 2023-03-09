Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24316B2954
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2692C10E863;
	Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556E010E859
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEFA822147;
 Thu,  9 Mar 2023 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqqiwJisVH/SAzHfF2Z9EuhM1jnh+DNN6yoV0M1wteU=;
 b=xiFACuqremRu3gpC320ePcV8wZYe25+7E1u76jHQkErsmQu7yJlFnJNQGW5UYBZ9SQv5ot
 bOJU2ibthwLG/3GRKurnyiM+5pGzEzNNXleZRAo7u2koBtXCfSlz5rL7e9u2+FabOmsT/d
 A7lNPBm0yB0uEA2jxRkC1VxLlHOPhz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqqiwJisVH/SAzHfF2Z9EuhM1jnh+DNN6yoV0M1wteU=;
 b=c+5tBBtUF7Pe6+RmCA6axMVd3JFqEAs3odqujArmd2jPBkWAbsfx7CWjteAitmvohzjvmY
 RhvH9JTrpfkHYdBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92BC013A73;
 Thu,  9 Mar 2023 16:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CEgAI/4CCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 006/101] fbdev/amifb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:26 +0100
Message-Id: <20230309160201.5163-7-tzimmermann@suse.de>
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
copy's memory with devm_kstrdup(), as the driver parses the option string
once per probed device. Linux will automatically free the memory upon
releasing the device.

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/amifb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index d88265dbebf4..9517aa5bd2c0 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -2345,7 +2345,7 @@ static void __init amifb_setup_mcap(char *spec)
 	amifb_vfmax = vmax;
 }
 
-static int __init amifb_setup(char *options)
+static int __init amifb_setup(char *options, struct platform_device *pdev)
 {
 	char *this_opt;
 
@@ -2363,8 +2363,10 @@ static int __init amifb_setup(char *options)
 			amifb_setup_mcap(this_opt + 11);
 		else if (!strncmp(this_opt, "fstart:", 7))
 			min_fstrt = simple_strtoul(this_opt + 7, NULL, 0);
-		else
-			mode_option = this_opt;
+		else {
+			// ignore errors
+			mode_option = devm_kstrdup(&pdev->dev, this_opt, GFP_KERNEL);
+		}
 	}
 
 	if (min_fstrt < 48)
@@ -3542,7 +3544,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 		amifb_video_off();
 		return -ENODEV;
 	}
-	amifb_setup(option);
+	amifb_setup(option, pdev);
 #endif
 	custom.dmacon = DMAF_ALL | DMAF_MASTER;
 
-- 
2.39.2

