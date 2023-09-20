Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD67A7CFF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C48010E48E;
	Wed, 20 Sep 2023 12:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C260010E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:05:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48A3161ACC;
 Wed, 20 Sep 2023 12:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5755AC433C9;
 Wed, 20 Sep 2023 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1695211544;
 bh=IzG/+OB+1GIftoKIl+QHFixjiO95sTMj1J5J8mC7g1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wMI++lPZr+2bmen5ZmWLk0gqOFHBAF0z+l5xZQu+yD6lW5646JXtFjeSKZxUV4DH4
 GosdJ47fexHtL74jb+F4GSAgcMiPa2/ySL6eK6Hn3T/FdywdyZvBWwBzE/Wm+ppZr+
 E6ejfwCSdsHm9yR8PjhgxA+6qORItwipvAMWwCsQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.14 106/186] backlight/bd6107: Compare against struct
 fb_info.device
Date: Wed, 20 Sep 2023 13:30:09 +0200
Message-ID: <20230920112840.838636787@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112836.799946261@linuxfoundation.org>
References: <20230920112836.799946261@linuxfoundation.org>
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

4.14-stable review patch.  If anyone has any objections, please let me know.

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
@@ -110,7 +110,7 @@ static int bd6107_backlight_check_fb(str
 {
 	struct bd6107 *bd = bl_get_data(backlight);
 
-	return bd->pdata->fbdev == NULL || bd->pdata->fbdev == info->dev;
+	return bd->pdata->fbdev == NULL || bd->pdata->fbdev == info->device;
 }
 
 static const struct backlight_ops bd6107_backlight_ops = {


