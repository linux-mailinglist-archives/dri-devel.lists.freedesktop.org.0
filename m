Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C87D754AE6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 20:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3457910E17A;
	Sat, 15 Jul 2023 18:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21AA10E155;
 Sat, 15 Jul 2023 18:53:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BE3321ADA;
 Sat, 15 Jul 2023 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689447227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nBZiCLXU0uFmpREVr8et6lhshWUUvKrFnXs/LiU8uw=;
 b=ExBZohaIoUpM32swEW4TLbTA+2ZURsoBCxxCB1bJPx6VTUDzDbwGTw2jS0q88EQ9JCp4jI
 ucOn7rj0we3ZJtaem65Z+u7i/bHvfPDcKNkm99KAuAQfVrEJTwQ9mv2Dt0IhCVMUZMmD2p
 7P6oXhH3gFR41VSzRUz+fClKaTfnb/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689447227;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nBZiCLXU0uFmpREVr8et6lhshWUUvKrFnXs/LiU8uw=;
 b=8QYCN2WcxYAGEUJeoAu1ZGY7RazmqUfzUvU0vgAHcSLzeAYE8T1eFjuEIXXoSRNSYhMyL9
 oVziRyNB6+uAM6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB86F133F7;
 Sat, 15 Jul 2023 18:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oMFRMzrrsmQCBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:53:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 dan.carpenter@linaro.org
Subject: [PATCH v4 04/18] fbdev: Remove FBINFO_DEFAULT from devm_kzalloc()'ed
 structs
Date: Sat, 15 Jul 2023 20:51:46 +0200
Message-ID: <20230715185343.7193-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715185343.7193-1-tzimmermann@suse.de>
References: <20230715185343.7193-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by devm_kzalloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v4:
	* clarify commit message (Geert, Dan)
v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/pxafb.c    | 1 -
 drivers/video/fbdev/sa1100fb.c | 1 -
 drivers/video/fbdev/wm8505fb.c | 3 +--
 drivers/video/fbdev/xilinxfb.c | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 2a8b1dea3a67..c8c4677d06b4 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1826,7 +1826,6 @@ static struct pxafb_info *pxafb_init_fbinfo(struct device *dev,
 	fbi->fb.var.vmode	= FB_VMODE_NONINTERLACED;
 
 	fbi->fb.fbops		= &pxafb_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT;
 	fbi->fb.node		= -1;
 
 	addr = fbi;
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index a2408bf00ca0..3d76ce111488 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -1089,7 +1089,6 @@ static struct sa1100fb_info *sa1100fb_init_fbinfo(struct device *dev)
 	fbi->fb.var.vmode	= FB_VMODE_NONINTERLACED;
 
 	fbi->fb.fbops		= &sa1100fb_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT;
 	fbi->fb.monspecs	= monspecs;
 	fbi->fb.pseudo_palette	= fbi->pseudo_palette;
 
diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 10a8b1250103..5833147aa43d 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -285,8 +285,7 @@ static int wm8505fb_probe(struct platform_device *pdev)
 	fbi->fb.fix.accel	= FB_ACCEL_NONE;
 
 	fbi->fb.fbops		= &wm8505fb_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT
-				| FBINFO_HWACCEL_COPYAREA
+	fbi->fb.flags		= FBINFO_HWACCEL_COPYAREA
 				| FBINFO_HWACCEL_FILLRECT
 				| FBINFO_HWACCEL_XPAN
 				| FBINFO_HWACCEL_YPAN
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 2aa3a528277f..768a281a8d2c 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -324,7 +324,6 @@ static int xilinxfb_assign(struct platform_device *pdev,
 	drvdata->info.fix.line_length = pdata->xvirt * BYTES_PER_PIXEL;
 
 	drvdata->info.pseudo_palette = drvdata->pseudo_palette;
-	drvdata->info.flags = FBINFO_DEFAULT;
 	drvdata->info.var = xilinx_fb_var;
 	drvdata->info.var.height = pdata->screen_height_mm;
 	drvdata->info.var.width = pdata->screen_width_mm;
-- 
2.41.0

