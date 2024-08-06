Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F0949270
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485610E384;
	Tue,  6 Aug 2024 14:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ga7AP58s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B844510E384
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:00:20 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-76cb5b6b3e4so470683a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722952820; x=1723557620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHlnE4b+EF1jE+6OxMeMiJgfIbEWX1SJndOm5es4WF8=;
 b=ga7AP58stP+3bWPyIbQeo0bBL9aTGJYII3Ht4j3Y86K3708qwyKL1Dd7OXUqBVmZ2v
 P3y6ip5u09uHxuXZcYlzWYAIEMidiVxyD0PTWwptDFpku7eZ9+O4iFWGBL25pnXHZj4l
 EuZo4JFjqAxavZNyO0bIU8owyVj9m747z1yXNxAORWpqmvCYAvexhpOBH4IcE+6Y32mq
 RwErLbS/kQ1BJ2JixQfyB2TwZ6ST7ff1VXu4KRAKzwxADRjoPa0GQ7G80g2H9oEKAaD9
 eWWEZT3lwov38W2jNNiiFJw2g2LIFN1WOwAFLJqqymaC4lgWULKsPYjCceuJCU4q1tI/
 0iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722952820; x=1723557620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zHlnE4b+EF1jE+6OxMeMiJgfIbEWX1SJndOm5es4WF8=;
 b=RY4TwAGKdZybOqwxLYf3dXhltyjF/U7S+sg/QVnlWkBxXziGzk/N+E0TXMjwho2MVP
 XxmDLKSv+s/hBleA3eItoKoYY3c4SaQSsI6frKSluM5EIuppfj4iAHwqIxX6u+pvNBtl
 g0zMrnUkchXa5Xsk6ARdf8t7iTl15+OZZob5grXlZXL0buBEe6l0xPeq1xVs8kqfky2M
 B+bLCAHDNQKeM4N98mV94z+1hxbGP/JH+0BZYIGL5BLuXDY6e5wC6yvCyA78fT7QckTz
 uwqK9cYC+8np03tQ67Qh+64aH2viNaUWeKjEemYNSYt0dSCmwqijpLe6GwqKbBBxpm9O
 MRPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdfdG4KVP6cch3t9zyNL1N7mXfsB+oCfsv/n7IbrkMwYZXd0xdOND7pw/VsMnJfpbNUmkIelCHi4k8wq2ZIzVRl+6R2hACJCEJYA4Q3UIH
X-Gm-Message-State: AOJu0Yyk5NtUd32iGZZo7VwdIopvea0wYuUGlAnj3AUhF84DDmY2ad9I
 FuQGDRQZ5fmbgkCsk6pwhYAD6pRtx12dIoDNCq2Abh3Z1fL9EJHr
X-Google-Smtp-Source: AGHT+IHcJGI37zJWjKZY/3gSGyIlz/mnFiRHe73rgoXzvjKXK3FoUkz2I0fJ9saNOFAKAI5XOa+Prw==
X-Received: by 2002:a05:6a20:c990:b0:1c2:8904:14c2 with SMTP id
 adf61e73a8af0-1c69961543emr14209508637.37.1722952819962; 
 Tue, 06 Aug 2024 07:00:19 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([14.96.13.220])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7b8a7453e92sm4415203a12.41.2024.08.06.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 07:00:19 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
Date: Tue,  6 Aug 2024 19:29:48 +0530
Message-ID: <20240806135949.468636-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806135949.468636-1-tejasvipin76@gmail.com>
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add more functions that can benefit from being multi style and mark
older variants as deprecated to eventually convert all mipi_dsi functions
to multi style.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 194 +++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  10 ++
 2 files changed, 204 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..8d0a866cf1e0 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -603,6 +603,8 @@ EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral);
  * mipi_dsi_turn_on_peripheral() - sends a Turn On Peripheral command
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_turn_on_peripheral_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi)
@@ -652,6 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
  * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
  *
  * Enable or disable Display Stream Compression on the peripheral.
+ * This function is deprecated. Use mipi_dsi_compression_mode_ext_multi() instead.
  *
  * Return: 0 on success or a negative error code on failure.
  */
@@ -703,6 +706,7 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
  * @pps: VESA DSC 1.1 Picture Parameter Set
  *
  * Transmit the VESA DSC 1.1 Picture Parameter Set to the peripheral.
+ * This function is deprecated. Use mipi_dsi_picture_parameter_set_multi() instead.
  *
  * Return: 0 on success or a negative error code on failure.
  */
@@ -1037,6 +1041,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_read);
  * mipi_dsi_dcs_nop() - send DCS nop packet
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_dcs_nop_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_nop(struct mipi_dsi_device *dsi)
@@ -1055,6 +1061,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_nop);
  * mipi_dsi_dcs_soft_reset() - perform a software reset of the display module
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_dcs_soft_reset_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_soft_reset(struct mipi_dsi_device *dsi)
@@ -1124,6 +1132,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_get_pixel_format);
  *    display module except interface communication
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_dcs_enter_sleep_mode_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_enter_sleep_mode(struct mipi_dsi_device *dsi)
@@ -1143,6 +1153,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_enter_sleep_mode);
  *    module
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_dcs_exit_sleep_mode_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_exit_sleep_mode(struct mipi_dsi_device *dsi)
@@ -1162,6 +1174,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_exit_sleep_mode);
  *    display device
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_display_off_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_set_display_off(struct mipi_dsi_device *dsi)
@@ -1181,6 +1195,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_off);
  *    display device
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_display_on_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure
  */
 int mipi_dsi_dcs_set_display_on(struct mipi_dsi_device *dsi)
@@ -1202,6 +1218,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_on);
  * @start: first column of frame memory
  * @end: last column of frame memory
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_column_address_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_set_column_address(struct mipi_dsi_device *dsi, u16 start,
@@ -1226,6 +1245,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_column_address);
  * @start: first page of frame memory
  * @end: last page of frame memory
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_page_address_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
@@ -1268,6 +1290,8 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_off);
  * @dsi: DSI peripheral device
  * @mode: the Tearing Effect Output Line mode
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_tear_on_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure
  */
 int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
@@ -1291,6 +1315,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on);
  * @dsi: DSI peripheral device
  * @format: pixel format
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_pixel_format_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format)
@@ -1334,6 +1361,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline);
  * @dsi: DSI peripheral device
  * @brightness: brightness value
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_display_brightness_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
@@ -1639,6 +1669,170 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
 
+/**
+ * mipi_dsi_turn_on_peripheral_multi() - sends a Turn On Peripheral command
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_turn_on_peripheral() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_turn_on_peripheral(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to turn on peripheral: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral_multi);
+
+/**
+ * mipi_dsi_dcs_soft_reset_multi() - perform a software reset of the display module
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_soft_reset() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_soft_reset_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_soft_reset(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to mipi_dsi_dcs_soft_reset: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_soft_reset_multi);
+
+/**
+ * mipi_dsi_dcs_set_display_brightness_multi() - sets the brightness value of
+ *	the display
+ * @ctx: Context for multiple DSI transactions
+ * @brightness: brightness value
+ *
+ * Like mipi_dsi_dcs_set_display_brightness() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
+					       u16 brightness)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to write display brightness: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness_multi);
+
+/**
+ * mipi_dsi_dcs_set_pixel_format_multi() - sets the pixel format for the RGB image
+ *	data used by the interface
+ * @ctx: Context for multiple DSI transactions
+ * @format: pixel format
+ *
+ * Like mipi_dsi_dcs_set_pixel_format() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_pixel_format_multi(struct mipi_dsi_multi_context *ctx,
+					 u8 format)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, format);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to set pixel format: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format_multi);
+
+/**
+ * mipi_dsi_dcs_set_column_address_multi() - define the column extent of the
+ *	frame memory accessed by the host processor
+ * @ctx: Context for multiple DSI transactions
+ * @start: first column of frame memory
+ * @end: last column of frame memory
+ *
+ * Like mipi_dsi_dcs_set_column_address() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
+					   u16 start, u16 end)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_column_address(dsi, start, end);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to set column address: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_column_address_multi);
+
+/**
+ * mipi_dsi_dcs_set_page_address_multi() - define the page extent of the
+ *	frame memory accessed by the host processor
+ * @ctx: Context for multiple DSI transactions
+ * @start: first page of frame memory
+ * @end: last page of frame memory
+ *
+ * Like mipi_dsi_dcs_set_page_address() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
+					 u16 start, u16 end)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, start, end);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to set page address: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_page_address_multi);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 0f520eeeaa8e..602be6ce081a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -365,6 +365,16 @@ void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
 void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx);
 void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 				    enum mipi_dsi_dcs_tear_mode mode);
+void mipi_dsi_turn_on_peripheral_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_soft_reset_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_set_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
+					       u16 brightness);
+void mipi_dsi_dcs_set_pixel_format_multi(struct mipi_dsi_multi_context *ctx,
+					 u8 format);
+void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
+					   u16 start, u16 end);
+void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
+					   u16 start, u16 end);
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
-- 
2.46.0

