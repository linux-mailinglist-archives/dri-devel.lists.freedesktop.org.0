Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDB7A8082
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A838B10E4A5;
	Wed, 20 Sep 2023 12:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D9410E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:37:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6230B81D4E;
 Wed, 20 Sep 2023 12:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCF2C433CB;
 Wed, 20 Sep 2023 12:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1695213452;
 bh=N2Q3thzPsD1IOXoqeJopgy4EfF0bxTXrEYdfZbDLFYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yp7RXF7oxUVf3qi8I3OS3K45JinmueT/Joozr3+FP/FNFt7Wdwx+P2mlzM28Oyd0m
 aK065R9Px+WRpeGdHE9Ur8mCehSj1+ub7XUSmcHrgpx/aEe8lqp3yCgicuLgEcvSEv
 lT+u15VQS1p2BwXDuntgDeZiN26ttNTZqcsB5D30=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 216/367] backlight/lv5207lp: Compare against struct
 fb_info.device
Date: Wed, 20 Sep 2023 13:29:53 +0200
Message-ID: <20230920112904.192991206@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112858.471730572@linuxfoundation.org>
References: <20230920112858.471730572@linuxfoundation.org>
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
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jingoo Han <jingoohan1@gmail.com>,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee@kernel.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Rich Felker <dalias@libc.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5.4-stable review patch.  If anyone has any objections, please let me know.

------------------

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
@@ -72,7 +72,7 @@ static int lv5207lp_backlight_check_fb(s
 {
 	struct lv5207lp *lv = bl_get_data(backlight);
 
-	return lv->pdata->fbdev == NULL || lv->pdata->fbdev == info->dev;
+	return lv->pdata->fbdev == NULL || lv->pdata->fbdev == info->device;
 }
 
 static const struct backlight_ops lv5207lp_backlight_ops = {


