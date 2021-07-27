Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BE3D7753
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B19F6E9E2;
	Tue, 27 Jul 2021 13:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EA96E99A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:47:38 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
 by xavier.telenet-ops.be with bizsmtp
 id aDnb250031fSPfK01Dnbz2; Tue, 27 Jul 2021 15:47:37 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8NQk-001Pc2-Oi; Tue, 27 Jul 2021 15:47:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8NQk-00FnhQ-Cn; Tue, 27 Jul 2021 15:47:34 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sam Ravnborg <sam@ravnborg.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 3/5] video: fbdev: ssd1307fb: Extract ssd1307fb_set_{col,
 page}_range()
Date: Tue, 27 Jul 2021 15:47:28 +0200
Message-Id: <20210727134730.3765898-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727134730.3765898-1-geert@linux-m68k.org>
References: <20210727134730.3765898-1-geert@linux-m68k.org>
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

Extract the code to set the column and page ranges into two helper
functions.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v2:
  - Use two separate helpers instead of a single combined helper,
  - Add Acked-by.
---
 drivers/video/fbdev/ssd1307fb.c | 57 +++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 6d7bd025bca1a175..86eb9c99a783f0da 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -152,6 +152,40 @@ static inline int ssd1307fb_write_cmd(struct i2c_client *client, u8 cmd)
 	return ret;
 }
 
+static int ssd1307fb_set_col_range(struct ssd1307fb_par *par, u8 col_start,
+				   u8 cols)
+{
+	u8 col_end = col_start + cols - 1;
+	int ret;
+
+	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307fb_write_cmd(par->client, col_start);
+	if (ret < 0)
+		return ret;
+
+	return ssd1307fb_write_cmd(par->client, col_end);
+}
+
+static int ssd1307fb_set_page_range(struct ssd1307fb_par *par, u8 page_start,
+				    u8 pages)
+{
+	u8 page_end = page_start + pages - 1;
+	int ret;
+
+	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PAGE_RANGE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd1307fb_write_cmd(par->client, page_start);
+	if (ret < 0)
+		return ret;
+
+	return ssd1307fb_write_cmd(par->client, page_end);
+}
+
 static int ssd1307fb_update_display(struct ssd1307fb_par *par)
 {
 	struct ssd1307fb_array *array;
@@ -462,30 +496,13 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 		return ret;
 
 	/* Set column range */
-	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
-	if (ret < 0)
-		return ret;
-
-	ret = ssd1307fb_write_cmd(par->client, par->col_offset);
-	if (ret < 0)
-		return ret;
-
-	ret = ssd1307fb_write_cmd(par->client, par->col_offset + par->width - 1);
+	ret = ssd1307fb_set_col_range(par, par->col_offset, par->width);
 	if (ret < 0)
 		return ret;
 
 	/* Set page range */
-	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PAGE_RANGE);
-	if (ret < 0)
-		return ret;
-
-	ret = ssd1307fb_write_cmd(par->client, par->page_offset);
-	if (ret < 0)
-		return ret;
-
-	ret = ssd1307fb_write_cmd(par->client,
-				  par->page_offset +
-				  DIV_ROUND_UP(par->height, 8) - 1);
+	ret = ssd1307fb_set_page_range(par, par->page_offset,
+				       DIV_ROUND_UP(par->height, 8));
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1

