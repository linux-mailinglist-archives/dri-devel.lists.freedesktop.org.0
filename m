Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D272D799825
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 14:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2968710E26C;
	Sat,  9 Sep 2023 12:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A2F10E26C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 12:56:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 06D86CE0223;
 Sat,  9 Sep 2023 12:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB49C433C7;
 Sat,  9 Sep 2023 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694264165;
 bh=BqfyDKQ6krO6zekJ3/+2q2XH1BmdZvlCiB5X2svo768=;
 h=Subject:To:Cc:From:Date:From;
 b=kc+ubkgvznGf4BwbL2rFMWZoaup3/2eN0bIyjRyUnvWnb/c8eQjUrF28ufETUR6a7
 T9fiSOQYbl+T6rWpEjb68SQwof/qsWk5nAhw4UU/dNJsd70y78LKXjnANfZmVpLGka
 7cen8ebVCoYX+tfazz4HGgTj/LJWW1ZdOpbCGjyk=
Subject: Patch "backlight/lv5207lp: Compare against struct fb_info.device" has
 been added to the 4.14-stable tree
To: dalias@libc.org, daniel.thompson@linaro.org,
 dri-devel@lists.freedesktop.org, glaubitz@physik.fu-berlin.de,
 gregkh@linuxfoundation.org, javierm@redhat.com, jingoohan1@gmail.com,
 laurent.pinchart+renesas@ideasonboard.com, lee@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de, ysato@users.sourceforge.jp
From: <gregkh@linuxfoundation.org>
Date: Sat, 09 Sep 2023 13:55:55 +0100
Message-ID: <2023090955-sandbag-unearth-eb1f@gregkh>
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

    backlight/lv5207lp: Compare against struct fb_info.device

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     backlight-lv5207lp-compare-against-struct-fb_info.device.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 1ca8819320fd84e7d95b04e7668efc5f9fe9fa5c Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 13 Jun 2023 13:06:40 +0200
Subject: backlight/lv5207lp: Compare against struct fb_info.device

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 1ca8819320fd84e7d95b04e7668efc5f9fe9fa5c upstream.

Struct lv5207lp_platform_data refers to a platform device within
the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
compares it against the fbdev device in struct fb_info.dev, which
is different. Fix the test by comparing to struct fb_info.device.

Fixes a bug in the backlight driver and prepares fbdev for making
struct fb_info.dev optional.

v2:
	* move renames into separate patch (Javier, Sam, Michael)

Fixes: 82e5c40d88f9 ("backlight: Add Sanyo LV5207LP backlight driver")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-sh@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.12+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20230613110953.24176-6-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/backlight/lv5207lp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -75,7 +75,7 @@ static int lv5207lp_backlight_check_fb(s
 {
 	struct lv5207lp *lv = bl_get_data(backlight);
 
-	return lv->pdata->fbdev == NULL || lv->pdata->fbdev == info->dev;
+	return lv->pdata->fbdev == NULL || lv->pdata->fbdev == info->device;
 }
 
 static const struct backlight_ops lv5207lp_backlight_ops = {


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-4.14/backlight-gpio_backlight-compare-against-struct-fb_info.device.patch
queue-4.14/backlight-lv5207lp-compare-against-struct-fb_info.device.patch
queue-4.14/backlight-bd6107-compare-against-struct-fb_info.device.patch
