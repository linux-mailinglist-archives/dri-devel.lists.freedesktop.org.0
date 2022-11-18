Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FC630EC2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 13:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37E10E26D;
	Sat, 19 Nov 2022 12:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EAB10E753
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:18:27 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
 (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 2AIEGVXC002760-2AIEGVXF002760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Nov 2022 22:16:36 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Helge Deller <deller@gmx.de>, Dongliang Mu <dzm91@hust.edu.cn>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbdev: da8xx-fb: add missing regulator_disable() in fb_probe
Date: Fri, 18 Nov 2022 22:14:06 +0800
Message-Id: <20221118141431.3005015-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Mailman-Approved-At: Sat, 19 Nov 2022 12:39:05 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The error handling code in fb_probe misses regulator_disable if
regulator_enable is called successfully. The previous commit only
adds regulator_disable in the .remove(), forgetting the error
handling code in the .probe.

Fix this by adding a new error label to call regulator_disable.

Fixes: 611097d5daea("fbdev: da8xx: add support for a regulator")
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/video/fbdev/da8xx-fb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 11922b009ed7..cd07e401b326 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1431,7 +1431,7 @@ static int fb_probe(struct platform_device *device)
 		dev_err(&device->dev,
 			"GLCD: kmalloc for frame buffer failed\n");
 		ret = -EINVAL;
-		goto err_release_fb;
+		goto err_disable_reg;
 	}
 
 	da8xx_fb_info->screen_base = (char __iomem *) par->vram_virt;
@@ -1475,7 +1475,7 @@ static int fb_probe(struct platform_device *device)
 
 	ret = fb_alloc_cmap(&da8xx_fb_info->cmap, PALETTE_SIZE, 0);
 	if (ret)
-		goto err_release_fb;
+		goto err_disable_reg;
 	da8xx_fb_info->cmap.len = par->palette_sz;
 
 	/* initialize var_screeninfo */
@@ -1529,6 +1529,9 @@ static int fb_probe(struct platform_device *device)
 err_dealloc_cmap:
 	fb_dealloc_cmap(&da8xx_fb_info->cmap);
 
+err_disable_reg:
+	if (par->lcd_supply)
+		regulator_disable(par->lcd_supply);
 err_release_fb:
 	framebuffer_release(da8xx_fb_info);
 
-- 
2.35.1

