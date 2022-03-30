Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135124ECCF5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1197910EE87;
	Wed, 30 Mar 2022 19:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B2A10EE8A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:09:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A12E61497;
 Wed, 30 Mar 2022 19:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6E0C340F0;
 Wed, 30 Mar 2022 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648667345;
 bh=1L+9DBe2kir+EVNigI3BdqqXM81kBYgbIhIJB304CSA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NR4uXmqaP8m/xPFS/kwMVrQVjDg3GeY3yjyYEOG9drHDq3cEOwwFbKcQjT33RBlml
 tBhtIbrpDZazvtumb6YFQfdZpFj5djNp9UocaqmDA6wsAGULpjcbv4m2HsodlALGJP
 KFhN91/LPFVyCJPQ4o/scYCvz6XxrSn0ML5XQ7oxkAO1AfYGGyCoJ4Q11QCcZ4va8w
 aTKSxp6mbjxeqxO/4mnaVaqao/tFVMVHy5TMf9m1SvotV/vbNnu/gONB+BVsQT8o73
 5iL43rVyAlDG6XrEC7Dpe0TEhA8D8uNAbGlpyb/k4N4XMn+53FYBC5dY/Dy00dZT/I
 ddx/RLdQFp3kQ==
Received: by wens.tw (Postfix, from userid 1000)
 id 557E75FD11; Thu, 31 Mar 2022 03:09:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/4] drm: ssd130x: Support page addressing mode
Date: Thu, 31 Mar 2022 03:08:45 +0800
Message-Id: <20220330190846.13997-4-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330190846.13997-1-wens@kernel.org>
References: <20220330190846.13997-1-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

On the SINO WEALTH SH1106, which is mostly compatible with the SSD1306,
only the basic page addressing mode is supported. This addressing mode
is not as easy to use compared to the currently supported horizontal
addressing mode, as the page address has to be set prior to writing
out each page, and each page must be written out separately as a result.
Also, there is no way to force the column address to wrap around early,
thus the column address must also be reset for each page to be accurate.

Add support for this addressing mode, with a flag to choose it. This
flag is designed to be set from the device info data structure, but
can be extended to be explicitly forced on through a device tree
property if such a need arises.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 72 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/solomon/ssd130x.h |  2 +
 2 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index d08d86ef07bc..21040d8bf9d1 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -42,6 +42,8 @@
 #define SSD130X_DATA				0x40
 #define SSD130X_COMMAND				0x80
 
+#define SSD130X_PAGE_COL_START_LOW		0x00
+#define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
 #define SSD130X_SET_COL_RANGE			0x21
 #define SSD130X_SET_PAGE_RANGE			0x22
@@ -61,6 +63,10 @@
 #define SSD130X_SET_COM_PINS_CONFIG		0xda
 #define SSD130X_SET_VCOMH			0xdb
 
+#define SSD130X_PAGE_COL_START_MASK		GENMASK(3, 0)
+#define SSD130X_PAGE_COL_START_SET(val)		FIELD_PREP(SSD130X_PAGE_COL_START_MASK, (val))
+#define SSD130X_START_PAGE_ADDRESS_MASK		GENMASK(2, 0)
+#define SSD130X_START_PAGE_ADDRESS_SET(val)	FIELD_PREP(SSD130X_START_PAGE_ADDRESS_MASK, (val))
 #define SSD130X_SET_SEG_REMAP_MASK		GENMASK(0, 0)
 #define SSD130X_SET_SEG_REMAP_SET(val)		FIELD_PREP(SSD130X_SET_SEG_REMAP_MASK, (val))
 #define SSD130X_SET_COM_SCAN_DIR_MASK		GENMASK(3, 3)
@@ -130,6 +136,7 @@ static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 	return ret;
 }
 
+/* Set address range for horizontal/vertical addressing modes */
 static int ssd130x_set_col_range(struct ssd130x_device *ssd130x,
 				 u8 col_start, u8 cols)
 {
@@ -166,6 +173,26 @@ static int ssd130x_set_page_range(struct ssd130x_device *ssd130x,
 	return 0;
 }
 
+/* Set page and column start address for page addressing mode */
+static int ssd130x_set_page_pos(struct ssd130x_device *ssd130x,
+				u8 page_start, u8 col_start)
+{
+	int ret;
+	u32 page, col_low, col_high;
+
+	page = SSD130X_START_PAGE_ADDRESS |
+	       SSD130X_START_PAGE_ADDRESS_SET(page_start);
+	col_low = SSD130X_PAGE_COL_START_LOW |
+		  SSD130X_PAGE_COL_START_SET(col_start & 0xf);
+	col_high = SSD130X_PAGE_COL_START_HIGH |
+		   SSD130X_PAGE_COL_START_SET((col_start >> 4) & 0xf);
+	ret = ssd130x_write_cmd(ssd130x, 3, page, col_low, col_high);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int ssd130x_pwm_enable(struct ssd130x_device *ssd130x)
 {
 	struct device *dev = ssd130x->dev;
@@ -342,6 +369,11 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 		}
 	}
 
+	/* Switch to page addressing mode */
+	if (ssd130x->page_address_mode)
+		return ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_ADDRESS_MODE,
+					 SSD130X_SET_ADDRESS_MODE_PAGE);
+
 	/* Switch to horizontal addressing mode */
 	return ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_ADDRESS_MODE,
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
@@ -393,13 +425,16 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
 	 */
 
-	ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
-	if (ret < 0)
-		goto out_free;
+	if (!ssd130x->page_address_mode) {
+		/* Set address range for horizontal addressing mode */
+		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
+		if (ret < 0)
+			goto out_free;
 
-	ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
-	if (ret < 0)
-		goto out_free;
+		ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
+		if (ret < 0)
+			goto out_free;
+	}
 
 	for (i = y / 8; i < y / 8 + pages; i++) {
 		int m = 8;
@@ -418,9 +453,29 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 			}
 			data_array[array_idx++] = data;
 		}
+
+		/*
+		 * In page addressing mode, the start address needs to be reset,
+		 * and each page then needs to be written out separately.
+		 */
+		if (ssd130x->page_address_mode) {
+			ret = ssd130x_set_page_pos(ssd130x,
+						   ssd130x->page_offset + i,
+						   ssd130x->col_offset + x);
+			if (ret < 0)
+				goto out_free;
+
+			ret = ssd130x_write_data(ssd130x, data_array, width);
+			if (ret < 0)
+				goto out_free;
+
+			array_idx = 0;
+		}
 	}
 
-	ret = ssd130x_write_data(ssd130x, data_array, width * pages);
+	/* Write out update in one go if we aren't using page addressing mode */
+	if (!ssd130x->page_address_mode)
+		ret = ssd130x_write_data(ssd130x, data_array, width * pages);
 
 out_free:
 	kfree(data_array);
@@ -796,6 +851,9 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 	ssd130x->regmap = regmap;
 	ssd130x->device_info = device_get_match_data(dev);
 
+	if (ssd130x->device_info->page_mode_only)
+		ssd130x->page_address_mode = 1;
+
 	ssd130x_parse_properties(ssd130x);
 
 	ret = ssd130x_get_resources(ssd130x);
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index cd21cdccb566..f5b062576fdf 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -24,6 +24,7 @@ struct ssd130x_deviceinfo {
 	u32 default_dclk_frq;
 	int need_pwm;
 	int need_chargepump;
+	bool page_mode_only;
 };
 
 struct ssd130x_device {
@@ -38,6 +39,7 @@ struct ssd130x_device {
 
 	const struct ssd130x_deviceinfo *device_info;
 
+	unsigned page_address_mode : 1;
 	unsigned area_color_enable : 1;
 	unsigned com_invdir : 1;
 	unsigned com_lrremap : 1;
-- 
2.34.1

