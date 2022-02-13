Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00A4B39FB
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 08:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4625F10E117;
	Sun, 13 Feb 2022 07:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F007C10E117
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 07:41:44 +0000 (UTC)
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id J9VsnUjWKSDrIJ9VtnIP2o; Sun, 13 Feb 2022 08:41:42 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 13 Feb 2022 08:41:42 +0100
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] backlight: backlight: Slighly simplify
 devm_of_find_backlight()
Date: Sun, 13 Feb 2022 08:41:39 +0100
Message-Id: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_add_action_or_reset() instead of devm_add_action()+hand writing
what is done in the release function, should an error occur.

This is more straightforward and saves a few lines of code.

While at it, remove a useless test in devm_backlight_release(). 'data' is
known to be not NULL when this function is called.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/backlight/backlight.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 4ae6fae94ac2..b788ff3d0f45 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -710,8 +710,7 @@ static void devm_backlight_release(void *data)
 {
 	struct backlight_device *bd = data;
 
-	if (bd)
-		put_device(&bd->dev);
+	put_device(&bd->dev);
 }
 
 /**
@@ -737,11 +736,10 @@ struct backlight_device *devm_of_find_backlight(struct device *dev)
 	bd = of_find_backlight(dev);
 	if (IS_ERR_OR_NULL(bd))
 		return bd;
-	ret = devm_add_action(dev, devm_backlight_release, bd);
-	if (ret) {
-		put_device(&bd->dev);
+	ret = devm_add_action_or_reset(dev, devm_backlight_release, bd);
+	if (ret)
 		return ERR_PTR(ret);
-	}
+
 	return bd;
 }
 EXPORT_SYMBOL(devm_of_find_backlight);
-- 
2.32.0

