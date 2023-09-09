Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B634799827
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 14:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4410E270;
	Sat,  9 Sep 2023 12:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D59310E270
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 12:56:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C4EC0CE02C6;
 Sat,  9 Sep 2023 12:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B69C433C8;
 Sat,  9 Sep 2023 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694264173;
 bh=F9FuAotg+asRLs3vr4mZWfrO2Zcd1XLg5kfucsDiAks=;
 h=Subject:To:Cc:From:Date:From;
 b=uAM7CeL8UgPvD24OriMa5w9+FKBaVr5PEYKdp6GlStXQ2CAML8pzzZohcpW0rvgJv
 oeY6ywkkuaU6lZ2PH6CgnM64wswrg2bejbkXv9buUcCLWkKLSXLeQQJZRWIUrcNp+B
 SzXqJDcptVoev0Y6pUUv+AoiXoF2vyuxLk96Gsus=
Subject: Patch "backlight/gpio_backlight: Compare against struct
 fb_info.device" has been added to the 4.19-stable tree
To: dalias@libc.org, daniel.thompson@linaro.org,
 dri-devel@lists.freedesktop.org, glaubitz@physik.fu-berlin.de,
 gregkh@linuxfoundation.org, jingoohan1@gmail.com,
 laurent.pinchart+renesas@ideasonboard.com, lee@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 09 Sep 2023 13:56:04 +0100
Message-ID: <2023090904-rebuild-caucus-951c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    backlight/gpio_backlight: Compare against struct fb_info.device

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     backlight-gpio_backlight-compare-against-struct-fb_info.device.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 7b91d017f77c1bda56f27c2f4bbb70de7c6eca08 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 13 Jun 2023 13:06:38 +0200
Subject: backlight/gpio_backlight: Compare against struct fb_info.device

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 7b91d017f77c1bda56f27c2f4bbb70de7c6eca08 upstream.

Struct gpio_backlight_platform_data refers to a platform device within
the Linux device hierarchy. The test in gpio_backlight_check_fb()
compares it against the fbdev device in struct fb_info.dev, which
is different. Fix the test by comparing to struct fb_info.device.

Fixes a bug in the backlight driver and prepares fbdev for making
struct fb_info.dev optional.

v2:
	* move renames into separate patch (Javier, Sam, Michael)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8b770e3c9824 ("backlight: Add GPIO-based backlight driver")
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-sh@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.12+
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20230613110953.24176-4-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/backlight/gpio_backlight.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -48,7 +48,7 @@ static int gpio_backlight_check_fb(struc
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
 
-	return gbl->fbdev == NULL || gbl->fbdev == info->dev;
+	return gbl->fbdev == NULL || gbl->fbdev == info->device;
 }
 
 static const struct backlight_ops gpio_backlight_ops = {


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-4.19/backlight-gpio_backlight-compare-against-struct-fb_info.device.patch
queue-4.19/backlight-lv5207lp-compare-against-struct-fb_info.device.patch
queue-4.19/backlight-bd6107-compare-against-struct-fb_info.device.patch
queue-4.19/drm-msm-replace-drm_framebuffer_-un-reference-with-p.patch
