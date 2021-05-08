Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DDD377400
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 22:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443998949C;
	Sat,  8 May 2021 20:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E0A78949C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 20:31:07 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d65 with ME
 id 2LPa2500521Fzsu03LPaNR; Sat, 08 May 2021 22:23:36 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 May 2021 22:23:36 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: krzysztof.h1@wp.pl, akpm@linux-foundation.org, imre.deak@nokia.com,
 juha.yrjola@solidboot.com
Subject: [PATCH] video: fbdev: lcd_mipid: Fix a memory leak in an error
 handling path
Date: Sat,  8 May 2021 22:23:33 +0200
Message-Id: <8b82e34724755b69f34f15dddb288cd373080390.1620505229.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If 'mipid_detect()' fails, we must free 'md' to avoid a memory leak.

While at it, modernize the function:
   - remove a useless message in case of memory allocation failure
   - change a '== NULL' into a '!'

Fixes: 66d2f99d0bb5 ("omapfb: add support for MIPI-DCS compatible LCDs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/omap/lcd_mipid.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/omap/lcd_mipid.c
index a75ae0c9b14c..b4b93ff4b41a 100644
--- a/drivers/video/fbdev/omap/lcd_mipid.c
+++ b/drivers/video/fbdev/omap/lcd_mipid.c
@@ -551,10 +551,8 @@ static int mipid_spi_probe(struct spi_device *spi)
 	int r;
 
 	md = kzalloc(sizeof(*md), GFP_KERNEL);
-	if (md == NULL) {
-		dev_err(&spi->dev, "out of memory\n");
+	if (!md)
 		return -ENOMEM;
-	}
 
 	spi->mode = SPI_MODE_0;
 	md->spi = spi;
@@ -563,11 +561,15 @@ static int mipid_spi_probe(struct spi_device *spi)
 
 	r = mipid_detect(md);
 	if (r < 0)
-		return r;
+		goto free_md;
 
 	omapfb_register_panel(&md->panel);
 
 	return 0;
+
+free_md:
+	kfree(md);
+	return r;
 }
 
 static int mipid_spi_remove(struct spi_device *spi)
-- 
2.30.2

