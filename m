Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917AE72299F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B5E10E2C4;
	Mon,  5 Jun 2023 14:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E7D10E2B3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF5C21FE69;
 Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbYOvmv180KZxIMHrG1c5fTu+u0cohOPPIFVll5LKyg=;
 b=oauipHmX3GfcojR6ISWTAZ9n13PQNSMBffhG4NoxSFdsqPd400nn0eacbYPm6c8KRcT9Xd
 uClNS2yUKbMUF6CzjEf/ufYSX8dfq6CrmBaZmhhyQe3R1EgRdXPvD4SKfZKks+1kuHUfun
 Is1aD3HAo28rNcOE10y5YkZnkC7UVZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbYOvmv180KZxIMHrG1c5fTu+u0cohOPPIFVll5LKyg=;
 b=kMqpEWdvjdvmmd/S3EPYSewH2Wm94GyOuP/puzfPMMnAL+BLaWiqHuqcEBVd4y/ZGQk4Gz
 1Muc66kw1O3/i/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81CD313A3C;
 Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2O3UHrH1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 10/30] fbdev/ep93xx-fb: Output messages with fb_info() and
 fb_err()
Date: Mon,  5 Jun 2023 16:47:52 +0200
Message-Id: <20230605144812.15241-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cases were output helpers are called with struct fb_info.dev.
Use fb_info() and fb_err() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/ep93xx-fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 376ee59e925c..f6cd200fe50f 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -436,9 +436,9 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 	 * least.
 	 */
 	if (check_screenpage_bug && phys_addr & (1 << 27)) {
-		dev_err(info->dev, "ep93xx framebuffer bug. phys addr (0x%x) "
-			"has bit 27 set: cannot init framebuffer\n",
-			phys_addr);
+		fb_err(info, "ep93xx framebuffer bug. phys addr (0x%x) "
+		       "has bit 27 set: cannot init framebuffer\n",
+		       phys_addr);
 
 		dma_free_coherent(info->device, fb_size, virt_addr, phys_addr);
 		return -ENOMEM;
@@ -525,7 +525,7 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	err = fb_find_mode(&info->var, info, video_mode,
 			   NULL, 0, NULL, 16);
 	if (err == 0) {
-		dev_err(info->dev, "No suitable video mode found\n");
+		fb_err(info, "No suitable video mode found\n");
 		err = -EINVAL;
 		goto failed_resource;
 	}
@@ -554,8 +554,8 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	if (err)
 		goto failed_framebuffer;
 
-	dev_info(info->dev, "registered. Mode = %dx%d-%d\n",
-		 info->var.xres, info->var.yres, info->var.bits_per_pixel);
+	fb_info(info, "registered. Mode = %dx%d-%d\n",
+		info->var.xres, info->var.yres, info->var.bits_per_pixel);
 	return 0;
 
 failed_framebuffer:
-- 
2.40.1

