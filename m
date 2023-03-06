Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB80D6AC62A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A42A10E379;
	Mon,  6 Mar 2023 16:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3275310E378
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EAF0A223CD;
 Mon,  6 Mar 2023 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TOK4HErI/2h/odaJ3yQPBqDv7GClK8xHBQXOXIADoU=;
 b=j2oGZGmRcaFV4sOEfUtQD63SjvnKYDpLXdmiKny/eUdB8X3MerkbRpoduPUwFuOII6rYzy
 ylz/c4M+1109Jzoe8AcG4X9xugu9U4k8q/to5ONmkPmRsBau/iGr+OdeMmIkeqII7Yi3Yq
 qEn1v2R4sz4XTPsnkx5sOrX8rtbv1Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TOK4HErI/2h/odaJ3yQPBqDv7GClK8xHBQXOXIADoU=;
 b=B22qWvL6Z85SpiqMWFw+V0uhYhQ49REUShk3qyvO2UXPkep+f20mR5bso4tLc4mruF8h4W
 7ZuV47ng/Et9K2CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D8DB13A6A;
 Mon,  6 Mar 2023 16:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MI2tISMOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 31/99] fbdev/hyperv_fb: Duplicate video-mode option string
Date: Mon,  6 Mar 2023 16:59:08 +0100
Message-Id: <20230306160016.4459-32-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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

