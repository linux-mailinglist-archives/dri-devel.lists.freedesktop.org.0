Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32772183D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 17:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE2210E140;
	Sun,  4 Jun 2023 15:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr
 [80.12.242.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721910E140
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 15:42:37 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id 5psGqNLaQt9zc5psGqXS2j; Sun, 04 Jun 2023 17:42:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1685893355;
 bh=KSBCYH83xSlnxT9AqAr79v1PKm1DqpwXR0ggzhv2kFU=;
 h=From:To:Cc:Subject:Date;
 b=ZnL1ytK8458koQso49BCpWyOcEi755OnD8/aYZ70UWHbQUaXQ+XkwqFZLGG5+hG3Z
 yaXTsYtK78QlhCXUpeznPk5AA2jU+eMpncJPkdKMUeAq8OcE53BPbyQ+T7f6CiQ7YP
 zaQ6Wn66OPz1XYNoYQZH1LfM5PZRmm/Xg+BUaWjIxN9fHA97i0qZD7zpcpg7E+8+LX
 UULF2+Wtpp9xj9ZFJyAa0pMqitEleMxEPKAUnIVNlsEpfr3PmbaXLiDiLnHrLjkNkk
 Z6TIBh6/JrK674jq06KhMIcKUqxWNsn5aFWtT93SOOx+NN4lk8Ao7QlFbeKf9msp5Y
 m4SnGCinLe35A==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Jun 2023 17:42:35 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>, Imre Deak <imre.deak@nokia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Krzysztof Helt <krzysztof.h1@wp.pl>,
 Juha Yrjola <juha.yrjola@solidboot.com>
Subject: [PATCH] video: fbdev: omapfb: lcd_mipid: Fix an error handling path
 in mipid_spi_probe()
Date: Sun,  4 Jun 2023 17:42:28 +0200
Message-Id: <f17221571f619c0829db56354f2b74d22f6702a7.1685893329.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If 'mipid_detect()' fails, we must free 'md' to avoid a memory leak.

Fixes: 66d2f99d0bb5 ("omapfb: add support for MIPI-DCS compatible LCDs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/omap/lcd_mipid.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/omap/lcd_mipid.c
index e4a7f0b824ff..a0fc4570403b 100644
--- a/drivers/video/fbdev/omap/lcd_mipid.c
+++ b/drivers/video/fbdev/omap/lcd_mipid.c
@@ -571,11 +571,15 @@ static int mipid_spi_probe(struct spi_device *spi)
 
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
 
 static void mipid_spi_remove(struct spi_device *spi)
-- 
2.34.1

