Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCFC799838
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 14:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6733810E292;
	Sat,  9 Sep 2023 12:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943C10E293
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 12:57:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1633560AFA;
 Sat,  9 Sep 2023 12:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A6CC433CA;
 Sat,  9 Sep 2023 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694264252;
 bh=pKbjQqIdcxHoEQvfKxsbyQkPOctN3ZEe2s7PliB8pCg=;
 h=Subject:To:Cc:From:Date:From;
 b=ANUHcbj9uMivVKTQ5dpa3ifx4ZKTI08mBOJRcUPXr9yVsEany5FV3oCpc3c/EmU2N
 +JX+ti3HdEz2GcZyvvCLMtWDBwYFQZgKENOKHVqYmhLteFnB4V/mlqWN82nOts0diF
 rjymV5JqoTOp6bnxjE0HZWbI4tODH+B8LFDtZWSI=
Subject: Patch "backlight/bd6107: Compare against struct fb_info.device" has
 been added to the 6.4-stable tree
To: daniel.thompson@linaro.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, javierm@redhat.com, jingoohan1@gmail.com,
 laurent.pinchart+renesas@ideasonboard.com, lee@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 09 Sep 2023 13:56:51 +0100
Message-ID: <2023090951-relatable-item-719f@gregkh>
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

    backlight/bd6107: Compare against struct fb_info.device

to the 6.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     backlight-bd6107-compare-against-struct-fb_info.device.patch
and it can be found in the queue-6.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 992bdddaabfba19bdc77c1c7a4977b2aa41ec891 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 13 Jun 2023 13:06:36 +0200
Subject: backlight/bd6107: Compare against struct fb_info.device

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 992bdddaabfba19bdc77c1c7a4977b2aa41ec891 upstream.

Struct bd6107_platform_data refers to a platform device within
the Linux device hierarchy. The test in bd6107_backlight_check_fb()
compares it against the fbdev device in struct fb_info.dev, which
is different. Fix the test by comparing to struct fb_info.device.

Fixes a bug in the backlight driver and prepares fbdev for making
struct fb_info.dev optional.

v2:
	* move renames into separate patch (Javier, Sam, Michael)

Fixes: 67b43e590415 ("backlight: Add ROHM BD6107 backlight driver")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.12+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20230613110953.24176-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/backlight/bd6107.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -104,7 +104,7 @@ static int bd6107_backlight_check_fb(str
 {
 	struct bd6107 *bd = bl_get_data(backlight);
 
-	return bd->pdata->fbdev == NULL || bd->pdata->fbdev == info->dev;
+	return bd->pdata->fbdev == NULL || bd->pdata->fbdev == info->device;
 }
 
 static const struct backlight_ops bd6107_backlight_ops = {


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.4/drm-ast-report-connection-status-on-display-port.patch
queue-6.4/drm-hyperv-fix-a-compilation-issue-because-of-not-in.patch
queue-6.4/backlight-gpio_backlight-compare-against-struct-fb_info.device.patch
queue-6.4/backlight-lv5207lp-compare-against-struct-fb_info.device.patch
queue-6.4/backlight-bd6107-compare-against-struct-fb_info.device.patch
