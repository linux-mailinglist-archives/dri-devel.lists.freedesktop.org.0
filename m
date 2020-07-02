Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490072135F6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8D96EB40;
	Fri,  3 Jul 2020 08:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8044D6E075
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:05:44 +0000 (UTC)
Received: from home.intra.ispras.ru (unknown [10.10.165.12])
 by smtp.ispras.ru (Postfix) with ESMTP id C2875201D0;
 Thu,  2 Jul 2020 19:05:41 +0300 (MSK)
From: Evgeny Novikov <novikov@ispras.ru>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbdev: da8xx-fb: go to proper label on error handling paths
 in probe
Date: Thu,  2 Jul 2020 19:05:40 +0300
Message-Id: <20200702160540.24546-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
Cc: ldv-project@linuxtesting.org, Jani Nikula <jani.nikula@intel.com>,
 Evgeny Novikov <novikov@ispras.ru>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sekhar Nori <nsekhar@ti.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fb_probe() can successfully allocate a new frame buffer, but then fail
to perform some operations with regulator. In these cases fb_probe()
goes to label err_pm_runtime_disable where the frame buffer is not
released. The patch makes fb_probe() to go to label err_release_fb on
corresponding error handling paths.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/video/fbdev/da8xx-fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 73c3c4c8cc12..e38c0e3f9c61 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1402,14 +1402,14 @@ static int fb_probe(struct platform_device *device)
 	if (IS_ERR(par->lcd_supply)) {
 		if (PTR_ERR(par->lcd_supply) == -EPROBE_DEFER) {
 			ret = -EPROBE_DEFER;
-			goto err_pm_runtime_disable;
+			goto err_release_fb;
 		}
 
 		par->lcd_supply = NULL;
 	} else {
 		ret = regulator_enable(par->lcd_supply);
 		if (ret)
-			goto err_pm_runtime_disable;
+			goto err_release_fb;
 	}
 
 	fb_videomode_to_var(&da8xx_fb_var, lcdc_info);
-- 
2.16.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
