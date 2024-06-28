Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914491C59F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B2010ECF7;
	Fri, 28 Jun 2024 18:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kukELbbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C4710ECF7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:25:16 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-725a7b0fc55so659226a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719599116; x=1720203916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZY2P1E432InDtUHAxbRlDlnKMwO9s6Lbp9JbCU+YOkk=;
 b=kukELbbRo65WQMuKwlKPzvrYkXJrT6z28oFSCNnE7xp+BHGvuaysDtlY6INECj9CvK
 AAnXL7CsHSNdUTG1ecciOfQx1aBOhTCfBNV7ssiGAnlfZUby2VxJgZXDC9rm5PmAM3cb
 mXWaKLZ+JRGXbxeixY0VypLCgsUmcGiDahdpEHwdXNzBlldj7VLb1eKfk6QRgotIvGzl
 NLmQ8pTew3Q9bEk7pWD8WQ5+YUv2aP82/DHiLdKHSG4fDdsIcV6n3uou34CoKgnQRZkF
 ihF+yO/lUDMMvQPx2Hnj+QD9JXtr9tW8Q7240p4MqripiHAHWJPPlW4FAzcoNLefsyqW
 yv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719599116; x=1720203916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZY2P1E432InDtUHAxbRlDlnKMwO9s6Lbp9JbCU+YOkk=;
 b=G35vAsA5XW/hMKppjPxOwgQaElcCTlziybjnXLdNuSxHzP/ZTBVuM2t+/sswyQarrD
 Cje6fEKDm5BXFJa8/vSZYSUCswAeBdWuC3xZqQ1x8sFGb2reh4xQ8p8ZpuiAIZiO0OA7
 K4ERI0yhAh5nqnoH4tHWcnDWhCJs11WvPIInQYp1QqUMWYCLLEY/XTfpECy6YiRubLKp
 z79BNciawSu/9LHOGkor/qfXmGKVM+NSFR15LP7fCAelb5LzZQDQLhyJvaffd9zZ6o9E
 lnrGmOd91CN6I+IDge1aCIClqSKlHp2hJB0Kc+rrHkg7DQmR678EiW1JGRG9XaUSLj8j
 vzRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjG8/zKsq9DzpsvH6uueVqIpqZNRGhQe0mLOSrzva5ftLWNwBDmU3kfgiECZTIcdNnPGNVGo9c1N01uMrIOGTUKFWoC4GcDu1RGKE5j9XN
X-Gm-Message-State: AOJu0YyPgpaQJ4KRN7cFqWmhEUBaQKq5/CBAAiYEz1s8ib+gbX8s39OY
 SLJ+S6K14sRDmUa/KmS+//QKPem0QYRM6fBYXDH9/3/pFBht9YRW
X-Google-Smtp-Source: AGHT+IFd227CU4NsKhgIV1ptlu36fNPRaWha69js3+JNj18Wns8bvFJngeFgg2rvQ4Dg5Ge6fu0USQ==
X-Received: by 2002:a05:6a21:99a8:b0:1be:c641:de2a with SMTP id
 adf61e73a8af0-1bec641df45mr9487173637.47.1719599115903; 
 Fri, 28 Jun 2024 11:25:15 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.84.231])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e21aesm18557465ad.64.2024.06.28.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:25:15 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 1/2] drm/mipi-dsi: add more multi functions for better error
 handling
Date: Fri, 28 Jun 2024 23:54:27 +0530
Message-ID: <20240628182428.171031-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628182428.171031-1-tejasvipin76@gmail.com>
References: <20240628182428.171031-1-tejasvipin76@gmail.com>
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

Add more functions that can benefit from being multi style, which
reduces code size in panels where they appear.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 164 +++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  10 ++
 2 files changed, 174 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..3f7fe734b684 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1639,6 +1639,170 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
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
+	ssize_t ret;
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
+	ssize_t ret;
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
+	ssize_t ret;
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
+	ssize_t ret;
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
+	ssize_t ret;
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
+ * mipi_dsi_dcs_set_page_address_multi() - define the column extent of the
+ *	frame memory accessed by the host processor
+ * @ctx: Context for multiple DSI transactions
+ * @start: first column of frame memory
+ * @end: last column of frame memory
+ *
+ * Like mipi_dsi_dcs_set_page_address() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
+					   u16 start, u16 end)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
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
index 71d121aeef24..203b5d53d58f 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -358,6 +358,16 @@ void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
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
2.45.2

