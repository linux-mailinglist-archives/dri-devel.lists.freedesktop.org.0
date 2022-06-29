Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE1560B52
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 23:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B7510E5EE;
	Wed, 29 Jun 2022 21:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321E210E5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 21:00:40 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id a16so11109037ilr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 14:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QNDYng6HiaUQ2XzlbhKa6Kje7mjtGzKFFC9Apcml49c=;
 b=O24pfxV2XSvpi+QbeGrSJ6gKS0nfBZav+z+sHn4ArX6D8OJRrtq8ZLIIAhLwJsphA3
 cAH4tjiRcSGyDusmJ3v/kkUxVRCn1TS2YI8gHqHj3ZSnQUto6fbbHlFesr1Bbwn6XBDs
 +FUwbrnRDKfItuvbzXQiCEmfgS99FUlhHlY/p2ORar6dNtRrQD4NnUh1nmdy/UDmdvsE
 r0LU44D9NxyrQZxolAh6NvdIazAzm9m/UgK8bxF4YPNZwRB7ixHtJiVVXyBEV68lY3l4
 PD8Ov/gkF5088YQ2uDIpMKzCjP9UGvjbAQ1TX+PP2p++mDNsmyNuVpzw7B8vTVI5/4Lh
 nVZA==
X-Gm-Message-State: AJIora+Cws6frHPUOx6fbg4TA/Gg92WT2DecstjfXLekB8xdUj5vzOKZ
 xYtTsh3jF+ka7uPdolFOAg==
X-Google-Smtp-Source: AGRyM1vaLdz2tY8DbktMG5UohpiNPszRj0YNupGJE9+wwsg3tChAw/usAM6+QnPklIlRt9YF5xSJoQ==
X-Received: by 2002:a05:6e02:19cd:b0:2da:d593:d32 with SMTP id
 r13-20020a056e0219cd00b002dad5930d32mr49391ill.145.1656536439211; 
 Wed, 29 Jun 2022 14:00:39 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id
 u13-20020a5d818d000000b0067513ad66c3sm7061434ion.41.2022.06.29.14.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 14:00:38 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] Revert "drivers/video/backlight/platform_lcd.c: add support
 for device tree based probe"
Date: Wed, 29 Jun 2022 15:00:23 -0600
Message-Id: <20220629210024.815761-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 52e842432f36d5b15227d0ee0d2aa3d2bc3cc0b2.

The DT support never would have worked because there's no platform_data
providing ops. There's not any documented binding for it either.

Cc: Jingoo Han <jg1.han@samsung.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/backlight/platform_lcd.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index b2bfbf070200..dc37494baf42 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -12,7 +12,6 @@
 #include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/lcd.h>
-#include <linux/of.h>
 #include <linux/slab.h>
 
 #include <video/platform_lcd.h>
@@ -133,19 +132,10 @@ static int platform_lcd_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(platform_lcd_pm_ops, platform_lcd_suspend,
 			platform_lcd_resume);
 
-#ifdef CONFIG_OF
-static const struct of_device_id platform_lcd_of_match[] = {
-	{ .compatible = "platform-lcd" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, platform_lcd_of_match);
-#endif
-
 static struct platform_driver platform_lcd_driver = {
 	.driver		= {
 		.name	= "platform-lcd",
 		.pm	= &platform_lcd_pm_ops,
-		.of_match_table = of_match_ptr(platform_lcd_of_match),
 	},
 	.probe		= platform_lcd_probe,
 };
-- 
2.34.1

