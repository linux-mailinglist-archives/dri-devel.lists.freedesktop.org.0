Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA507BE99C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222BA10E2BE;
	Mon,  9 Oct 2023 18:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84210E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAaThqSJ1bntsN2jg+kycHzuBu+ozB5ircxnmQS3wP4=;
 b=LbrH1Tzf/mMTJTAvlbiWdImYd3SNV8iHFAulDcj4GESYtZq/j6DFCL6dJr0AgzzJX6mxJs
 lvJnFItJ2QyhD7Zs/rLCSNPoC4uBMOWmmxJ1znl+6SCrDIVF5eYRDYr5w9N4BKW2/tU7fV
 uE6GPNY/CiDqK/4gZoF3jdtevX+bb6I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-iQEVfrdtPBq9ZgI2SfamCQ-1; Mon, 09 Oct 2023 14:36:09 -0400
X-MC-Unique: iQEVfrdtPBq9ZgI2SfamCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32320b3ee93so3395335f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876568; x=1697481368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAaThqSJ1bntsN2jg+kycHzuBu+ozB5ircxnmQS3wP4=;
 b=q4Kay9zhtrDLW0LgR3qSxvIFXQqWsOmK9YJF3XIEPbbfw+tSKpF9XjPGhkbMKFn4/2
 4xeOVOdVhF4S6jvBjL0ZraJGtpRdcWw/pKnxwyxixLbZjzTaeLFg0tXJL/3zfRkCxttz
 7t5SWMnJcNh+pVHC4XYbFT06xCI3KWLNhw7toOC7rZMOsyNKgqzQISIRZ2y52bWlDY/X
 AFngd49oPp8x5qOlaOPKFemGn35dzQ2N7UpqnOFMjRFyJXOJ9XevY16JPNu3AoWG8A56
 ib/97Fd5/ZGtcsiVb3zZ4b4ttMy7EXVWmMxbHQ2MPWP5CX1/KOa8JfTTLULyBxr9mJuG
 JhLg==
X-Gm-Message-State: AOJu0YxLUyXNAmH804Q7u4w9dhWRGMWECR5YZx6bBoXSDFDfTvZvF1Dx
 hq4JrdXZJoTw19cHJxhOyq4lGjr5koXVtHds69ow0WJQXRZbjjpyr3nLqwicThvK/ThJnCegMCO
 g88OHFTdELNIUFtySsy7Wkv9Y0Vzg
X-Received: by 2002:a5d:4650:0:b0:319:7c14:b06b with SMTP id
 j16-20020a5d4650000000b003197c14b06bmr14360235wrs.47.1696876568311; 
 Mon, 09 Oct 2023 11:36:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmiIGqQ4xbXICwKFnBJtMR2yQZr9iiHnXKi+pbx5GVR/MJi6cvkyOFjq45ubbCtuMrA4YqbA==
X-Received: by 2002:a5d:4650:0:b0:319:7c14:b06b with SMTP id
 j16-20020a5d4650000000b003197c14b06bmr14360222wrs.47.1696876568045; 
 Mon, 09 Oct 2023 11:36:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l2-20020a5d4802000000b0031fe0576460sm10335828wrq.11.2023.10.09.11.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] drm/ssd13xx: Add support for the SSD132x OLED controller
 family
Date: Mon,  9 Oct 2023 20:34:21 +0200
Message-ID: <20231009183522.543918-8-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183522.543918-1-javierm@redhat.com>
References: <20231009183522.543918-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Solomon SSD132x controllers (such as the SSD1322, SSD1325 and SSD1327)
are used by 16 grayscale dot matrix OLED panels, extend the driver to also
support this chip family.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd13xx-i2c.c |  13 ++
 drivers/gpu/drm/solomon/ssd13xx-spi.c |  13 ++
 drivers/gpu/drm/solomon/ssd13xx.c     | 206 +++++++++++++++++++++++++-
 drivers/gpu/drm/solomon/ssd13xx.h     |   5 +
 4 files changed, 234 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd13xx-i2c.c b/drivers/gpu/drm/solomon/ssd13xx-i2c.c
index d9cece374331..9cf78d206c6e 100644
--- a/drivers/gpu/drm/solomon/ssd13xx-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd13xx-i2c.c
@@ -92,6 +92,19 @@ static const struct of_device_id ssd13xx_of_match[] = {
 		.compatible = "solomon,ssd1309fb-i2c",
 		.data = &ssd13xx_variants[SSD1309_ID],
 	},
+	/* ssd1302x family */
+	{
+		.compatible = "solomon,ssd1322",
+		.data = &ssd13xx_variants[SSD1322_ID],
+	},
+	{
+		.compatible = "solomon,ssd1325",
+		.data = &ssd13xx_variants[SSD1325_ID],
+	},
+	{
+		.compatible = "solomon,ssd1327",
+		.data = &ssd13xx_variants[SSD1327_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd13xx_of_match);
diff --git a/drivers/gpu/drm/solomon/ssd13xx-spi.c b/drivers/gpu/drm/solomon/ssd13xx-spi.c
index 2416756686cc..55162e49f037 100644
--- a/drivers/gpu/drm/solomon/ssd13xx-spi.c
+++ b/drivers/gpu/drm/solomon/ssd13xx-spi.c
@@ -129,6 +129,19 @@ static const struct of_device_id ssd13xx_of_match[] = {
 		.compatible = "solomon,ssd1309",
 		.data = &ssd13xx_variants[SSD1309_ID],
 	},
+	/* ssd1302x family */
+	{
+		.compatible = "solomon,ssd1322",
+		.data = &ssd13xx_variants[SSD1322_ID],
+	},
+	{
+		.compatible = "solomon,ssd1325",
+		.data = &ssd13xx_variants[SSD1325_ID],
+	},
+	{
+		.compatible = "solomon,ssd1327",
+		.data = &ssd13xx_variants[SSD1327_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd13xx_of_match);
diff --git a/drivers/gpu/drm/solomon/ssd13xx.c b/drivers/gpu/drm/solomon/ssd13xx.c
index b30224856518..bc53e7c80ffe 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.c
+++ b/drivers/gpu/drm/solomon/ssd13xx.c
@@ -99,6 +99,24 @@
 #define SSD130X_SET_AREA_COLOR_MODE_ENABLE	0x1e
 #define SSD130X_SET_AREA_COLOR_MODE_LOW_POWER	0x05
 
+/* ssd132x commands */
+#define SSD132X_SET_COL_RANGE			0x15
+#define SSD132X_SET_DEACTIVATE_SCROLL		0x2e
+#define SSD132X_SET_ROW_RANGE			0x75
+#define SSD132X_SET_DISPLAY_START		0xa1
+#define SSD132X_SET_DISPLAY_OFFSET		0xa2
+#define SSD132X_SET_DISPLAY_NORMAL		0xa4
+#define SSD132X_SET_FUNCTION_SELECT_A		0xab
+#define SSD132X_SET_PHASE_LENGTH		0xb1
+#define SSD132X_SET_CLOCK_FREQ			0xb3
+#define SSD132X_SET_GPIO			0xb5
+#define SSD132X_SET_PRECHARGE_PERIOD		0xb6
+#define SSD132X_SET_GRAY_SCALE_TABLE		0xb8
+#define SSD132X_SELECT_DEFAULT_TABLE		0xb9
+#define SSD132X_SET_PRECHARGE_VOLTAGE		0xbc
+#define SSD130X_SET_VCOMH_VOLTAGE		0xbe
+#define SSD132X_SET_FUNCTION_SELECT_B		0xd5
+
 #define MAX_CONTRAST 255
 
 const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
@@ -144,6 +162,22 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_width = 128,
 		.default_height = 64,
 		.family_id = SSD130X_FAMILY,
+	},
+	/* ssd132x family */
+	[SSD1322_ID] = {
+		.default_width = 480,
+		.default_height = 128,
+		.family_id = SSD132X_FAMILY,
+	},
+	[SSD1325_ID] = {
+		.default_width = 128,
+		.default_height = 80,
+		.family_id = SSD132X_FAMILY,
+	},
+	[SSD1327_ID] = {
+		.default_width = 128,
+		.default_height = 128,
+		.family_id = SSD132X_FAMILY,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd13xx_variants, DRM_SSD13XX);
@@ -610,6 +644,156 @@ static void ssd130x_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
 	}
 }
 
+static int ssd132x_init(struct ssd13xx_device *ssd13xx)
+{
+	int ret;
+
+	/* Set initial contrast */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD13XX_CONTRAST, 0x80);
+	if (ret < 0)
+		return ret;
+
+	/* Set column start and end */
+	ret = ssd13xx_write_cmd(ssd13xx, 3, SSD132X_SET_COL_RANGE, 0x00, ssd13xx->width / 2 - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set row start and end */
+	ret = ssd13xx_write_cmd(ssd13xx, 3, SSD132X_SET_ROW_RANGE, 0x00, ssd13xx->height - 1);
+	if (ret < 0)
+		return ret;
+	/*
+	 * Horizontal Address Increment
+	 * Re-map for Column Address, Nibble and COM
+	 * COM Split Odd Even
+	 */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD13XX_SET_SEG_REMAP, 0x53);
+	if (ret < 0)
+		return ret;
+
+	/* Set display start and offset */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_DISPLAY_START, 0x00);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_DISPLAY_OFFSET, 0x00);
+	if (ret < 0)
+		return ret;
+
+	/* Set display mode normal */
+	ret = ssd13xx_write_cmd(ssd13xx, 1, SSD132X_SET_DISPLAY_NORMAL);
+	if (ret < 0)
+		return ret;
+
+	/* Set multiplex ratio value */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd13xx->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set phase length */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_PHASE_LENGTH, 0x55);
+	if (ret < 0)
+		return ret;
+
+	/* Select default linear gray scale table */
+	ret = ssd13xx_write_cmd(ssd13xx, 1, SSD132X_SELECT_DEFAULT_TABLE);
+	if (ret < 0)
+		return ret;
+
+	/* Set clock frequency */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_CLOCK_FREQ, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* Enable internal VDD regulator */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_FUNCTION_SELECT_A, 0x1);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge period */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_PRECHARGE_PERIOD, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge voltage */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_PRECHARGE_VOLTAGE, 0x08);
+	if (ret < 0)
+		return ret;
+
+	/* Set VCOMH voltage */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_VCOMH_VOLTAGE, 0x07);
+	if (ret < 0)
+		return ret;
+
+	/* Enable second pre-charge and internal VSL */
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD132X_SET_FUNCTION_SELECT_B, 0x62);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ssd132x_update_rect(struct ssd13xx_device *ssd13xx,
+			       struct drm_rect *rect, u8 *buf,
+			       u8 *data_array)
+{
+	unsigned int x = rect->x1 / 2;
+	unsigned int y = rect->y1;
+	unsigned int width = drm_rect_width(rect);
+	unsigned int height = drm_rect_height(rect);
+	unsigned int columns = DIV_ROUND_UP(width, 2);
+	unsigned int rows = height;
+	u32 array_idx = 0;
+	int ret, i, j;
+
+	/*
+	 * The screen is divided in Segment and Common outputs, where
+	 * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
+	 * the columns.
+	 *
+	 * Each Segment has a 4-bit pixel and each Common output has a
+	 * row of pixels. When using the (default) horizontal address
+	 * increment mode, each byte of data sent to the controller has
+	 * two Segments (e.g: SEG0 and SEG1) that are stored in the lower
+	 * and higher nibbles of a single byte representing one column.
+	 * That is, the first byte are SEG0 (D0[3:0]) and SEG1 (D0[7:4]),
+	 * the second byte are SEG2 (D1[3:0]) and SEG3 (D1[7:4]) and so on.
+	 */
+
+	/* Set column start and end */
+	ret = ssd13xx_write_cmd(ssd13xx, 3, SSD132X_SET_COL_RANGE, x, columns - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set row start and end */
+	ret = ssd13xx_write_cmd(ssd13xx, 3, SSD132X_SET_ROW_RANGE, y, rows - 1);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < height; i++) {
+		/* Process pair of pixels and combine them into a single byte */
+		for (j = 0; j < width; j += 2) {
+			u8 n1 = buf[i * width + j];
+			u8 n2 = buf[i * width + j + 1];
+
+			data_array[array_idx++] = (n2 << 4) | n1;
+		}
+	}
+
+	/* Write out update in one go since horizontal addressing mode is used */
+	ret = ssd13xx_write_data(ssd13xx, data_array, columns * rows);
+
+	return ret;
+}
+
+static void ssd132x_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
+{
+	memset(data_array, 0, ssd13xx->data_array_size);
+
+	/* Write out update in one go since horizontal addressing mode is used */
+	ssd13xx_write_data(ssd13xx, data_array, ssd13xx->data_array_size);
+}
+
 static const struct ssd13xx_funcs ssd13xx_family_funcs[] = {
 	[SSD130X_FAMILY] = {
 		.init = ssd130x_init,
@@ -617,6 +801,12 @@ static const struct ssd13xx_funcs ssd13xx_family_funcs[] = {
 		.clear_screen = ssd130x_clear_screen,
 		.fmt_convert = drm_fb_xrgb8888_to_mono,
 	},
+	[SSD132X_FAMILY] = {
+		.init = ssd132x_init,
+		.update_rect = ssd132x_update_rect,
+		.clear_screen = ssd132x_clear_screen,
+		.fmt_convert = drm_fb_xrgb8888_to_gray8,
+	}
 };
 
 static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
@@ -631,9 +821,12 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 	unsigned int dst_pitch;
 	int ret = 0;
 
-	/* Align y to display page boundaries */
-	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
-	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd13xx->height);
+	if (ssd13xx->device_info->family_id == SSD130X_FAMILY) {
+		/* Align y to display page boundaries */
+		rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
+		rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT),
+				 ssd13xx->height);
+	}
 
 	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
@@ -1217,6 +1410,13 @@ static int ssd13xx_set_buffer_sizes(struct ssd13xx_device *ssd13xx,
 
 		fi = drm_format_info(DRM_FORMAT_R1);
 		break;
+	case SSD132X_FAMILY:
+		unsigned int columns = DIV_ROUND_UP(ssd13xx->width, 2);
+		unsigned int rows = ssd13xx->height;
+
+		ssd13xx->data_array_size = columns * rows;
+
+		fi = drm_format_info(DRM_FORMAT_R8);
 	}
 
 	if (!fi)
diff --git a/drivers/gpu/drm/solomon/ssd13xx.h b/drivers/gpu/drm/solomon/ssd13xx.h
index 399b0c8b5680..58083c7e08c8 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.h
+++ b/drivers/gpu/drm/solomon/ssd13xx.h
@@ -27,6 +27,7 @@
 
 enum ssd13xx_family_ids {
 	SSD130X_FAMILY,
+	SSD132X_FAMILY,
 };
 
 enum ssd13xx_variants {
@@ -36,6 +37,10 @@ enum ssd13xx_variants {
 	SSD1306_ID,
 	SSD1307_ID,
 	SSD1309_ID,
+	/* ssd132x family */
+	SSD1322_ID,
+	SSD1325_ID,
+	SSD1327_ID,
 	NR_SSD13XX_VARIANTS
 };
 
-- 
2.41.0

