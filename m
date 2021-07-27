Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC5E3D7755
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F516E8DB;
	Tue, 27 Jul 2021 13:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635156E8FA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:47:38 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
 by baptiste.telenet-ops.be with bizsmtp
 id aDnb2500B1fSPfK01DnbQn; Tue, 27 Jul 2021 15:47:35 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8NQk-001Pc7-W3; Tue, 27 Jul 2021 15:47:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8NQk-00Fnhe-FW; Tue, 27 Jul 2021 15:47:34 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sam Ravnborg <sam@ravnborg.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 5/5] video: fbdev: ssd1307fb: Cache address ranges
Date: Tue, 27 Jul 2021 15:47:30 +0200
Message-Id: <20210727134730.3765898-6-geert@linux-m68k.org>
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

Cache the column and page ranges, to avoid doing unneeded I2C transfers
when the values haven't changed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v2:
  - Add Acked-by,
  - Rebase.
---
 drivers/video/fbdev/ssd1307fb.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 9aed5ee0094f2d95..1e2f71c2f8a8bc78 100644
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
@@ -158,6 +163,9 @@ static int ssd1307fb_set_col_range(struct ssd1307fb_par *par, u8 col_start,
 	u8 col_end = col_start + cols - 1;
 	int ret;
 
+	if (col_start == par->col_start && col_end == par->col_end)
+		return 0;
+
 	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
 	if (ret < 0)
 		return ret;
@@ -166,7 +174,13 @@ static int ssd1307fb_set_col_range(struct ssd1307fb_par *par, u8 col_start,
 	if (ret < 0)
 		return ret;
 
-	return ssd1307fb_write_cmd(par->client, col_end);
+	ret = ssd1307fb_write_cmd(par->client, col_end);
+	if (ret < 0)
+		return ret;
+
+	par->col_start = col_start;
+	par->col_end = col_end;
+	return 0;
 }
 
 static int ssd1307fb_set_page_range(struct ssd1307fb_par *par, u8 page_start,
@@ -175,6 +189,9 @@ static int ssd1307fb_set_page_range(struct ssd1307fb_par *par, u8 page_start,
 	u8 page_end = page_start + pages - 1;
 	int ret;
 
+	if (page_start == par->page_start && page_end == par->page_end)
+		return 0;
+
 	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PAGE_RANGE);
 	if (ret < 0)
 		return ret;
@@ -183,7 +200,13 @@ static int ssd1307fb_set_page_range(struct ssd1307fb_par *par, u8 page_start,
 	if (ret < 0)
 		return ret;
 
-	return ssd1307fb_write_cmd(par->client, page_end);
+	ret = ssd1307fb_write_cmd(par->client, page_end);
+	if (ret < 0)
+		return ret;
+
+	par->page_start = page_start;
+	par->page_end = page_end;
+	return 0;
 }
 
 static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
-- 
2.25.1

