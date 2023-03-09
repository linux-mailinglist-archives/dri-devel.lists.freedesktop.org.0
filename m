Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270B6B2993
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C377910E88C;
	Thu,  9 Mar 2023 16:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF73B10E895
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A14712017B;
 Thu,  9 Mar 2023 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrW7pYFX5R5J7fTSEP6NHJNhtqFQ7aaj+PBS3SvPTGg=;
 b=KMyi1ArSofl/bsuzaDcxSPA6St3dbkNeQtu4GG/uXz+mB3OSzgwPJRG/SVapYXPcoZudSI
 F7o/npDk+E29i4ursyWn9ajqDmAW8KzUMZ5sl21zEJ+MJfjD2rNMX/sDmkl4m8npxWvwT+
 86BW9xhw7Q2fbROUtPyJ1oSOxlM9pec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377740;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrW7pYFX5R5J7fTSEP6NHJNhtqFQ7aaj+PBS3SvPTGg=;
 b=lf0QPjtylGKlpjax3PSZ8yyUW9A+oDhATNg9XPu1acJ5HWImpCm+MTnRl0ICzIJB+Uv0s8
 PgCWdEKJOhB0P4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4509513A73;
 Thu,  9 Mar 2023 16:02:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iCHxDwwDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 039/101] fbdev/imxfb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:00:59 +0100
Message-Id: <20230309160201.5163-40-tzimmermann@suse.de>
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
 drivers/video/fbdev/imxfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 51fde1b2a793..aad7d447385c 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -843,7 +843,7 @@ static struct lcd_ops imxfb_lcd_ops = {
 	.set_power	= imxfb_lcd_set_power,
 };
 
-static int imxfb_setup(void)
+static int imxfb_setup(struct platform_device *pdev)
 {
 	char *opt, *options = NULL;
 
@@ -856,8 +856,8 @@ static int imxfb_setup(void)
 	while ((opt = strsep(&options, ",")) != NULL) {
 		if (!*opt)
 			continue;
-		else
-			fb_mode = opt;
+
+		fb_mode = devm_kstrdup(&pdev->dev, opt, GFP_KERNEL); // ignore errors
 	}
 
 	return 0;
@@ -877,7 +877,7 @@ static int imxfb_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "i.MX Framebuffer driver\n");
 
-	ret = imxfb_setup();
+	ret = imxfb_setup(pdev);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

