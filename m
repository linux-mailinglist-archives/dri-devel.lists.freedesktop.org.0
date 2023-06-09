Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E973572A0EE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15B210E6D2;
	Fri,  9 Jun 2023 17:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7661810E6D2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686330601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osHYEg9JMVxcIID/3FozYzoCPjrYA2Xwquo9voZzxrU=;
 b=i9nRxpF5RDiZtiKvNjb2vXN1kAva9zjkmu9jbsw2cyjEqfLO/Jawz+GcATUq6Mct0v0/uY
 aDtHAn6I4dqWM2+RTsCJl9V+dQwgbK9Ip7dsEDBne6YOFtE/OVeSegQU5hRh47ptT2cWRN
 26i2O7LXB99xYjcTTYl9Y28Spb0lBK0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-L-lXIZoIMvKfUk6ZXk1O3w-1; Fri, 09 Jun 2023 13:09:52 -0400
X-MC-Unique: L-lXIZoIMvKfUk6ZXk1O3w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30e4d11a413so860488f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 10:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330591; x=1688922591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osHYEg9JMVxcIID/3FozYzoCPjrYA2Xwquo9voZzxrU=;
 b=cW92ZTuQBRzXFRiBwlHW2z4TYOEwWkAPWFTs9ULh7H/m1AjRgOhz400AY1qHDO/zGt
 cApAZeQsNF3FL+3FFylzJUIiA5k7GVkSN/Uqf6S7J09qu9+RCHTNiYzXqH9Cp4eVhnxC
 4zIC4yl1umXG6ca+u94qxvF3fuF4RTquX4LZn/7sxqq+D45Hv88NINgJ7O5BTo+jJLMW
 AbTYe8pvYAsQIuZ3zMg34r1S9jb0CEWSgolAbDbB7ZtqKlWs0DPN/rGyi1pHDqUKXy7y
 opEM4j542IC2AxbhYjTfb1L+ogrYI5LURgYm5e1mJ5AHLWh8SryqMhMRCZxrNWAuTVRK
 jKTQ==
X-Gm-Message-State: AC+VfDwd9BW8iB2PvOGHD7neEkWvQup59oyz2OZRbm3vCXtZUzIYM9xV
 QzNv/9C6SfmeIP7j4Gte1kw0V3JfKQ6QHHIUOgJ2S10sZeD+1AVgxiOdre0nT9xDmBUlci2sna9
 lMIpF3hLtuQZywy+2ViO8rkWi/X48
X-Received: by 2002:a05:600c:1c15:b0:3f7:aee8:c23a with SMTP id
 j21-20020a05600c1c1500b003f7aee8c23amr4211137wms.19.1686330590918; 
 Fri, 09 Jun 2023 10:09:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DJBJR1m0HtIRW4IMJAA2OUlhq5FLYjJDGioHzrTZbWaUfAcQHxCZLv5OsSW8RuiWv6LcW8g==
X-Received: by 2002:a05:600c:1c15:b0:3f7:aee8:c23a with SMTP id
 j21-20020a05600c1c1500b003f7aee8c23amr4211127wms.19.1686330590735; 
 Fri, 09 Jun 2023 10:09:50 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm3265526wmr.2.2023.06.09.10.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:09:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/ssd130x: Don't allocate buffers on each plane
 update
Date: Fri,  9 Jun 2023 19:09:39 +0200
Message-Id: <20230609170941.1150941-5-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609170941.1150941-1-javierm@redhat.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
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

The resolutions for these panels are fixed and defined in the Device Tree,
so there's no point to allocate the buffers on each plane update and that
can just be done once.

Let's do the allocation and free on the encoder enable and disable helpers
since that's where others initialization and teardown operations are done.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x.c | 88 +++++++++++++++++++------------
 drivers/gpu/drm/solomon/ssd130x.h |  3 ++
 2 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 5cac1149e34e..0be3b476dc60 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -146,6 +146,31 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 	return container_of(drm, struct ssd130x_device, drm);
 }
 
+static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
+{
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+
+	ssd130x->buffer = kcalloc(DIV_ROUND_UP(ssd130x->width, 8),
+				  ssd130x->height, GFP_KERNEL);
+	if (!ssd130x->buffer)
+		return -ENOMEM;
+
+	ssd130x->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
+	if (!ssd130x->data_array) {
+		kfree(ssd130x->buffer);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void ssd130x_buf_free(struct ssd130x_device *ssd130x)
+{
+	kfree(ssd130x->data_array);
+	kfree(ssd130x->buffer);
+}
+
 /*
  * Helper to write data (SSD130X_DATA) to the device.
  */
@@ -434,11 +459,12 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
-static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
-			       struct drm_rect *rect)
+static int ssd130x_update_rect(struct ssd130x_device *ssd130x, struct drm_rect *rect)
 {
 	unsigned int x = rect->x1;
 	unsigned int y = rect->y1;
+	u8 *buf = ssd130x->buffer;
+	u8 *data_array = ssd130x->data_array;
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
@@ -447,14 +473,9 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 	struct drm_device *drm = &ssd130x->drm;
 	u32 array_idx = 0;
 	int ret, i, j, k;
-	u8 *data_array = NULL;
 
 	drm_WARN_ONCE(drm, y % 8 != 0, "y must be aligned to screen page\n");
 
-	data_array = kcalloc(width, pages, GFP_KERNEL);
-	if (!data_array)
-		return -ENOMEM;
-
 	/*
 	 * The screen is divided in pages, each having a height of 8
 	 * pixels, and the width of the screen. When sending a byte of
@@ -488,11 +509,11 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 		/* Set address range for horizontal addressing mode */
 		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
 		if (ret < 0)
-			goto out_free;
+			return ret;
 
 		ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
 		if (ret < 0)
-			goto out_free;
+			return ret;
 	}
 
 	for (i = 0; i < pages; i++) {
@@ -522,11 +543,11 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 						   ssd130x->page_offset + i,
 						   ssd130x->col_offset + x);
 			if (ret < 0)
-				goto out_free;
+				return ret;
 
 			ret = ssd130x_write_data(ssd130x, data_array, width);
 			if (ret < 0)
-				goto out_free;
+				return ret;
 
 			array_idx = 0;
 		}
@@ -536,14 +557,11 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 	if (!ssd130x->page_address_mode)
 		ret = ssd130x_write_data(ssd130x, data_array, width * pages);
 
-out_free:
-	kfree(data_array);
 	return ret;
 }
 
 static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 {
-	u8 *buf = NULL;
 	struct drm_rect fullscreen = {
 		.x1 = 0,
 		.x2 = ssd130x->width,
@@ -551,14 +569,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 		.y2 = ssd130x->height,
 	};
 
-	buf = kcalloc(DIV_ROUND_UP(ssd130x->width, 8), ssd130x->height,
-		      GFP_KERNEL);
-	if (!buf)
-		return;
-
-	ssd130x_update_rect(ssd130x, buf, &fullscreen);
-
-	kfree(buf);
+	ssd130x_update_rect(ssd130x, &fullscreen);
 }
 
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
@@ -569,30 +580,27 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
-	u8 *buf = NULL;
+	u8 *buf = ssd130x->buffer;
+
+	if (!buf)
+		return 0;
 
 	/* Align y to display page boundaries */
 	rect->y1 = round_down(rect->y1, page_height);
 	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd130x->height);
 
 	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), page_height);
-	buf = kcalloc(dst_pitch, drm_rect_height(rect), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
 	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd130x_update_rect(ssd130x, buf, rect);
-
-out_free:
-	kfree(buf);
+	ssd130x_update_rect(ssd130x, rect);
 
 	return ret;
 }
@@ -701,14 +709,22 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 		return;
 
 	ret = ssd130x_init(ssd130x);
-	if (ret) {
-		ssd130x_power_off(ssd130x);
-		return;
-	}
+	if (ret)
+		goto power_off;
+
+	ret = ssd130x_buf_alloc(ssd130x);
+	if (ret)
+		goto power_off;
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
+
+	return;
+
+power_off:
+	ssd130x_power_off(ssd130x);
+	return;
 }
 
 static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
@@ -721,6 +737,8 @@ static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
 
+	ssd130x_buf_free(ssd130x);
+
 	ssd130x_power_off(ssd130x);
 }
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 87968b3e7fb8..161588b1cc4d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -89,6 +89,9 @@ struct ssd130x_device {
 	u8 col_end;
 	u8 page_start;
 	u8 page_end;
+
+	u8 *buffer;
+	u8 *data_array;
 };
 
 extern const struct ssd130x_deviceinfo ssd130x_variants[];
-- 
2.40.1

