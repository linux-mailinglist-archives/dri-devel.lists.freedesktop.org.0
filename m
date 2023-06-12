Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3972C7A4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E1C10E287;
	Mon, 12 Jun 2023 14:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD00210E277
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:14:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F7652048D;
 Mon, 12 Jun 2023 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686579243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DApq01bMcWPqgYhwuryEu5qdYBZjYFccLYihwSFiAXk=;
 b=Zora8HfwuVeNq+hm5G6DUqPUKgOtH8m30gUW2OZP6oVeOC0SvWGqgTfYBjKPMAc4pI9aQI
 6Ew5qXJjBTM44urrB1/6yhlbyymEG/osTY/bs4iFSYk4d5bxC6F57x56AInpWgVPVsVN+X
 4ceLrGintZ/Mib46vhkSzUt+OkIljto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686579243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DApq01bMcWPqgYhwuryEu5qdYBZjYFccLYihwSFiAXk=;
 b=H/zAlbOtFqKuNb3tKoyQFw3FYtGoeSWfqKSzX2hZ0Cmx54Oz0an5bSEQ+PUQanuJpxb/Pf
 WQfNEU/GNlTsfLCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30A641357F;
 Mon, 12 Jun 2023 14:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CFDoCisoh2RwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v2 25/38] fbdev/sh7760fb: Use fb_dbg() in
 sh7760fb_get_color_info()
Date: Mon, 12 Jun 2023 16:08:03 +0200
Message-ID: <20230612141352.29939-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Give struct fb_info to sh7760fb_get_color_info() and use it in
call to fb_dbg(). Prepares fbdev for making struct fb_info.dev
optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sh7760fb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760fb.c
index 4c092c7935027..a2946f06d579e 100644
--- a/drivers/video/fbdev/sh7760fb.c
+++ b/drivers/video/fbdev/sh7760fb.c
@@ -118,7 +118,7 @@ static int sh7760_setcolreg (u_int regno,
 	return 0;
 }
 
-static int sh7760fb_get_color_info(struct device *dev,
+static int sh7760fb_get_color_info(struct fb_info *info,
 				   u16 lddfr, int *bpp, int *gray)
 {
 	int lbpp, lgray;
@@ -150,7 +150,7 @@ static int sh7760fb_get_color_info(struct device *dev,
 		lgray = 0;
 		break;
 	default:
-		dev_dbg(dev, "unsupported LDDFR bit depth.\n");
+		fb_dbg(info, "unsupported LDDFR bit depth.\n");
 		return -EINVAL;
 	}
 
@@ -170,7 +170,7 @@ static int sh7760fb_check_var(struct fb_var_screeninfo *var,
 	int ret, bpp;
 
 	/* get color info from register value */
-	ret = sh7760fb_get_color_info(info->dev, par->pd->lddfr, &bpp, NULL);
+	ret = sh7760fb_get_color_info(info, par->pd->lddfr, &bpp, NULL);
 	if (ret)
 		return ret;
 
@@ -222,7 +222,7 @@ static int sh7760fb_set_par(struct fb_info *info)
 	vdln = vm->yres;
 
 	/* get color info from register value */
-	ret = sh7760fb_get_color_info(info->dev, par->pd->lddfr, &bpp, &gray);
+	ret = sh7760fb_get_color_info(info, par->pd->lddfr, &bpp, &gray);
 	if (ret)
 		return ret;
 
@@ -381,7 +381,7 @@ static int sh7760fb_alloc_mem(struct fb_info *info)
 		return 0;
 
 	/* get color info from register value */
-	ret = sh7760fb_get_color_info(info->dev, par->pd->lddfr, &bpp, NULL);
+	ret = sh7760fb_get_color_info(info, par->pd->lddfr, &bpp, NULL);
 	if (ret) {
 		printk(KERN_ERR "colinfo\n");
 		return ret;
-- 
2.41.0

