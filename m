Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC16B2975
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E50010E875;
	Thu,  9 Mar 2023 16:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C302610E870
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6ED1722152;
 Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TOK4HErI/2h/odaJ3yQPBqDv7GClK8xHBQXOXIADoU=;
 b=jBhUeHAiZtHj5w0OHCClBUsdhGNNr/Mpx36csnTC1VjalZbz/ujMyeQStVoWpcvitGc1p8
 ywHU2HzIR2NcHa+P60b2S71DlryhFt0IrY0GderO0YUjbAICm9w593P5E6EVkzdZbWQjmf
 4tNJ0CXzhbEQ5idJV7fZ1Dd0FltqjCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TOK4HErI/2h/odaJ3yQPBqDv7GClK8xHBQXOXIADoU=;
 b=5lKnZxp2h7vlv0rHhmQcFlwWIUCOfpYmAYE3sc99d60+piWXHA9tnj6cR2/qUVaj1MeK/G
 UTteoFXco8iT5BDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C16213A73;
 Thu,  9 Mar 2023 16:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QBn1AQkDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 031/101] fbdev/hyperv_fb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:51 +0100
Message-Id: <20230309160201.5163-32-tzimmermann@suse.de>
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
and hence duplicate the option string for the video mode. As the driver
implements a very simple mode parser in a fairly unstructured way, just
duplicate the option string and parse the duplicated memory buffer. Free
the buffer afterwards.

Done in preparation of constifying the option string and switching the
driver to struct option_iter.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hyperv_fb.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 4a6a3303b6b4..edb0555239c6 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -903,17 +903,23 @@ static const struct fb_ops hvfb_ops = {
 static void hvfb_get_option(struct fb_info *info)
 {
 	struct hvfb_par *par = info->par;
-	char *opt = NULL, *p;
+	char *options = NULL;
+	char *optbuf, *opt, *p;
 	uint x = 0, y = 0;
 
-	if (fb_get_options(KBUILD_MODNAME, &opt) || !opt || !*opt)
+	if (fb_get_options(KBUILD_MODNAME, &options) || !options || !*options)
 		return;
 
+	optbuf = kstrdup(options, GFP_KERNEL);
+	if (!optbuf)
+		return;
+	opt = optbuf;
+
 	p = strsep(&opt, "x");
 	if (!*p || kstrtouint(p, 0, &x) ||
 	    !opt || !*opt || kstrtouint(opt, 0, &y)) {
 		pr_err("Screen option is invalid: skipped\n");
-		return;
+		goto out;
 	}
 
 	if (x < HVFB_WIDTH_MIN || y < HVFB_HEIGHT_MIN ||
@@ -922,12 +928,14 @@ static void hvfb_get_option(struct fb_info *info)
 	    (par->synthvid_version == SYNTHVID_VERSION_WIN8 &&
 	     x * y * screen_depth / 8 > SYNTHVID_FB_SIZE_WIN8)) {
 		pr_err("Screen resolution option is out of range: skipped\n");
-		return;
+		goto out;
 	}
 
 	screen_width = x;
 	screen_height = y;
-	return;
+
+out:
+	kfree(optbuf);
 }
 
 /*
-- 
2.39.2

