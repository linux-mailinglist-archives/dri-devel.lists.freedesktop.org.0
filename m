Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA23C867C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 16:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B3D6E3D8;
	Wed, 14 Jul 2021 14:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F30E6E3DA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:58:12 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
 by andre.telenet-ops.be with bizsmtp
 id V2yA2500L4sai0K012yA18; Wed, 14 Jul 2021 16:58:11 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3gKw-001AEm-H8; Wed, 14 Jul 2021 16:58:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3gKv-00AcNX-Vv; Wed, 14 Jul 2021 16:58:09 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH resend 5/5] video: fbdev: ssd1307fb: Cache address ranges
Date: Wed, 14 Jul 2021 16:58:04 +0200
Message-Id: <20210714145804.2530727-6-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714145804.2530727-1-geert@linux-m68k.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cache the column and page ranges, to avoid doing unneeded I2C transfers
when the values haven't changed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/ssd1307fb.c | 52 +++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 8e3d4be74723b9bf..23b43ce479898813 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -82,6 +82,11 @@ struct ssd1307fb_par {
 	struct regulator *vbat_reg;
 	u32 vcomh;
 	u32 width;
+	/* Cached address ranges */
+	u8 col_start;
+	u8 col_end;
+	u8 page_start;
+	u8 page_end;
 };
 
 struct ssd1307fb_array {
@@ -160,28 +165,43 @@ static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
 	int ret;
 
 	/* Set column range */
-	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
-	if (ret < 0)
-		return ret;
+	if (col_start != par->col_start || col_end != par->col_end) {
+		ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
+		if (ret < 0)
+			return ret;
 
-	ret = ssd1307fb_write_cmd(par->client, col_start);
-	if (ret < 0)
-		return ret;
+		ret = ssd1307fb_write_cmd(par->client, col_start);
+		if (ret < 0)
+			return ret;
 
-	ret = ssd1307fb_write_cmd(par->client, col_end);
-	if (ret < 0)
-		return ret;
+		ret = ssd1307fb_write_cmd(par->client, col_end);
+		if (ret < 0)
+			return ret;
+
+		par->col_start = col_start;
+		par->col_end = col_end;
+	}
 
 	/* Set page range */
-	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PAGE_RANGE);
-	if (ret < 0)
-		return ret;
+	if (page_start != par->page_start || page_end != par->page_end) {
+		ret = ssd1307fb_write_cmd(par->client,
+					  SSD1307FB_SET_PAGE_RANGE);
+		if (ret < 0)
+			return ret;
 
-	ret = ssd1307fb_write_cmd(par->client, page_start);
-	if (ret < 0)
-		return ret;
+		ret = ssd1307fb_write_cmd(par->client, page_start);
+		if (ret < 0)
+			return ret;
+
+		ret = ssd1307fb_write_cmd(par->client, page_end);
+		if (ret < 0)
+			return ret;
 
-	return ssd1307fb_write_cmd(par->client, page_end);
+		par->page_start = page_start;
+		par->page_end = page_end;
+	}
+
+	return 0;
 }
 
 static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
-- 
2.25.1

