Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65C79A937
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 16:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41D510E30E;
	Mon, 11 Sep 2023 14:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2096 seconds by postgrey-1.36 at gabe;
 Mon, 11 Sep 2023 14:57:37 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D7310E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:57:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 99855CE1741;
 Mon, 11 Sep 2023 14:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AA5C433C8;
 Mon, 11 Sep 2023 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694444254;
 bh=HmMMlzB2zE+caSWoXv9op7hseauJj66HYuL+/BIRKrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iBrPtw9UpBMfpAU4hCtn0lFNmWOdKizyRU1lYultL77f9GjKroPL7AWKNi26uUXOH
 flvV9FRFKovfXhPufzTjt2OqzjAvH1ox8VvMwgJLYLCS0J4XDvfBES+O+15D/bZvX3
 y7fUQSO7pq0qXm4jrcBgxBPjnUtXCMQ2l8BmUvyM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.4 664/737] backlight/bd6107: Compare against struct
 fb_info.device
Date: Mon, 11 Sep 2023 15:48:43 +0200
Message-ID: <20230911134709.091749300@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911134650.286315610@linuxfoundation.org>
References: <20230911134650.286315610@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.4-stable review patch.  If anyone has any objections, please let me know.

------------------

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


