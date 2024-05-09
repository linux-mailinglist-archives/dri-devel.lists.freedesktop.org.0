Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947698C1973
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C07810EE0E;
	Thu,  9 May 2024 22:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c+1hgVqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C7310ECEF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:38 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f57713684so1650161e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294257; x=1715899057; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wy0dt4C+2st62hdh4kql6KATuv+sQnVh0BPdtj9s5/U=;
 b=c+1hgVqSEAkjrs9e9Xm6eUViFrs97bHiXsVNSWNfwTF9I64BaR+aBQr3+R1pXMAqw6
 T/IlT12snF5s/t3jYxqd5f+3QhAth4AgrLzUsPMLFQtcc4tqEjw6YDcCDmLekax/IsPO
 m4me3vcXPQagVSyVjPMtlrZf5vgeChkHN8TVfvQMeVG73yVEIshlMKIbh3vhTfVKdl9h
 hffkOZqrQzuamoix1KSriPREf+f2akvdL1D8KLvpvSyi2Qf4Wsil35L1kLkM7kX9CqZ+
 tqQVpS9KoUgstGImAkOOwtF82nRSoljEkDPILkBxsNAAbW8tI8MgyxnrkpgjwvBl4zSy
 Ukow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294257; x=1715899057;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wy0dt4C+2st62hdh4kql6KATuv+sQnVh0BPdtj9s5/U=;
 b=v/uHmZkyNn2mOvKtlCKG1BmPoPfRHcXTC+JZLCg8+h3s1QoYC9+ncfMgDHgLMZDSrY
 NiTTlEfUoIxWNgN7J71wdF/DGqxs5Pw6UtRR+eNthiEhy4uPNlYqpayDYhiDZ77omDED
 TtanLloM6TRUP8XJDs7018oZfeOj123SlBGC8sqAEEGShm8IJbNbvKZueZ3yitwPkL33
 4A8FJXDsieJHehmWHsVHkwQJn58OCIr2u4Y9IWG28Rw8ZiW/RkdWVgOriLCbmFaM278g
 tHk7+TW5ePScsmXiJzQp+hfgpR6/GJ8kt9GTPFHqlt7w5lqkaIiGfVJHdBfhEUTL3ter
 gD3Q==
X-Gm-Message-State: AOJu0Ywq3eZCQFStrTSXDX83JCstuSsbMc99dMeyGJQ5xZ0eTG/EnWfG
 W+WewHiDnqXfiA70YFObCxjPb6i+bHa+HCjSsbSFAOR+ASC3mwEm6afGz2ksQl4=
X-Google-Smtp-Source: AGHT+IFFYEts9ZdAyO7Nds0YpCPtjBBhbL4QPT1Cngkc5NgAxY7Yoqv1tCL+scNEb/egzkHvDimwRw==
X-Received: by 2002:a19:6449:0:b0:51d:8756:33f3 with SMTP id
 2adb3069b0e04-5220fc6d46bmr467761e87.32.1715294256979; 
 Thu, 09 May 2024 15:37:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 01:37:34 +0300
Subject: [PATCH RFC 1/7] drm/mipi-dsi: wrap more functions for streamline
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-dsi-panels-upd-api-v1-1-317c78a0dcc8@linaro.org>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9046;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vRxiLvTGirbB6HN43H6Eoei1WmxE/UqWmb9+hJ19B+U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPVAuK86GU8+ebU/1bVmiEBTyjZ+Bg5j7tOlty
 DaCkxLKzTGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj1QLgAKCRCLPIo+Aiko
 1YWoB/9zqwhRLAqs5SU32GE/oZfJ/4r5Ewh0B+3p+KKiFO/MoILG5QBiSBlw09fRoyjCcKxKOqk
 v3SifezXPjC9mSGKE3owHb9fVL2GmsOEVct669hYocAXHvZMkwM3PCqBpm6HmMA9zPyAIZNu5lQ
 ipuTJt0YczcR4Xe/cHHqGtj6iRXM56SxsVYpmRi4IdvzLIfSRAePrgScU4g9D0Qrr/mNqI08bil
 1KvLUlaMIa6vo776VEoCbgMX+BtWIZEZhkF86mTPNt/aSQn8tlcZeWvVs/4mRmkuEo1fMDb9qNG
 KNr6AuQ264YR/sq9E4pl/8hx7G7QO3MlqN3dtZqeKhFsyUQ/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Follow the pattern of mipi_dsi_dcs_*_multi() and wrap several existing
MIPI DSI functions to use the context for processing. This simplifies
and streamlines driver code to use simpler code pattern.

Note, msleep function is also wrapped in this way as it is frequently
called inbetween other mipi_dsi_dcs_*() functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 209 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  19 ++++
 2 files changed, 228 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index d2957cb692d3..4e5e7ad10b7e 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1429,6 +1429,215 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_large);
 
+/**
+ * mipi_dsi_picture_parameter_set_multi() - transmit the DSC PPS to the peripheral
+ * @ctx: Context for multiple DSI transactions
+ * @pps: VESA DSC 1.1 Picture Parameter Set
+ *
+ * Like mipi_dsi_picture_parameter_set() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
+				   const struct drm_dsc_picture_parameter_set *pps)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_picture_parameter_set(dsi, pps);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending PPS failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_picture_parameter_set_multi);
+
+/**
+ * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
+ * @ctx: Context for multiple DSI transactions
+ * @enable: Whether to enable or disable the DSC
+ * @algo: Selected compression algorithm
+ * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
+ *
+ * Like mipi_dsi_compression_mode_ext_multi() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
+					 bool enable,
+					 enum mipi_dsi_compression_algo algo,
+					 unsigned int pps_selector)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_compression_mode_ext(dsi, enable, algo, pps_selector);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending COMPRESSION_MODE failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
+
+/**
+ * mipi_dsi_dcs_nop_multi() - send DCS NOP packet
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_nop() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_nop(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending DCS NOP failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_nop_multi);
+
+/**
+ * mipi_dsi_dcs_enter_sleep_mode_multi() - send DCS ENTER_SLEEP_MODE  packet
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_enter_sleep_mode() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending DCS ENTER_SLEEP_MODE failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_enter_sleep_mode_multi);
+
+/**
+ * mipi_dsi_dcs_exit_sleep_mode_multi() - send DCS EXIT_SLEEP_MODE packet
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_exit_sleep_mode() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending DCS EXIT_SLEEP_MODE failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_exit_sleep_mode_multi);
+
+/**
+ * mipi_dsi_dcs_set_display_off_multi() - send DCS SET_DISPLAY_OFF packet
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_set_display_off() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending DCS SET_DISPLAY_OFF failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_display_off_multi);
+
+/**
+ * mipi_dsi_dcs_set_display_on_multi() - send DCS SET_DISPLAY_ON packet
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_set_display_on() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending DCS SET_DISPLAY_ON failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_display_on_multi);
+
+/**
+ * mipi_dsi_dcs_set_tear_on_multi() - send DCS SET_TEAR_ON packet
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_dcs_set_tear_on() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
+				    enum mipi_dsi_dcs_tear_mode mode)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 5e9cad541bd6..b74a89b40f21 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -275,6 +275,13 @@ int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
 int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 				   const struct drm_dsc_picture_parameter_set *pps);
 
+void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
+					 bool enable,
+					 enum mipi_dsi_compression_algo algo,
+					 unsigned int pps_selector);
+void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
+					  const struct drm_dsc_picture_parameter_set *pps);
+
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
 int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
@@ -338,6 +345,18 @@ int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
 int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 					     u16 *brightness);
 
+void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
+				    enum mipi_dsi_dcs_tear_mode mode);
+
+#define mipi_dsi_msleep(ctx, delay)	\
+	if (!ctx.accum_err)		\
+		msleep(delay)		\
+
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
  *

-- 
2.39.2

