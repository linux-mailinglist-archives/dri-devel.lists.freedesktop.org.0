Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14734B3A0A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 08:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398DC10ED50;
	Sun, 13 Feb 2022 07:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BA710ED50
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 07:52:52 +0000 (UTC)
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id J9ggnUnHkSDrIJ9ggnIPy2; Sun, 13 Feb 2022 08:52:51 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 13 Feb 2022 08:52:51 +0100
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] tda9950: Slightly simplify tda9950_devm_glue_init()
Date: Sun, 13 Feb 2022 08:52:49 +0100
Message-Id: <8e8ce53c113547beb314d332cfdedbf05a2d7506.1644738725.git.christophe.jaillet@wanadoo.fr>
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_add_action_or_reset() instead of hand writing it.
This is more straightforward and saves a few lines of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/i2c/tda9950.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 5b03fdd1eaa4..526774594510 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -361,9 +361,7 @@ static int tda9950_devm_glue_init(struct device *dev, struct tda9950_glue *glue)
 			return ret;
 	}
 
-	ret = devm_add_action(dev, tda9950_devm_glue_exit, glue);
-	if (ret)
-		tda9950_devm_glue_exit(glue);
+	ret = devm_add_action_or_reset(dev, tda9950_devm_glue_exit, glue);
 
 	return ret;
 }
-- 
2.32.0

