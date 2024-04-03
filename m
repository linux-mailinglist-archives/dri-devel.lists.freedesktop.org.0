Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD64896329
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 05:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DD51123A1;
	Wed,  3 Apr 2024 03:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cpEo9L9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F4510F840
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 03:44:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-516bfcc775bso80230e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 20:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712115840; x=1712720640; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+T+p5YoQyUiQemU/jDWxQz+rt6jIm9aQcddIMzbzpGw=;
 b=cpEo9L9hT5+ILQ37JQu5SkzABgVdrRHk6H/xclcQZI24IeNtkMnscKTnbnkYyhyzh4
 FwCKLhxp4y0CtBblxIb0U14d1W+6AWuv8xivTEgyjXJpJD7hIoOWU2MptsTRJKSZGl40
 ACD+x+UlIajJmFO2XJ/KVZ0kFir0/FHm4g0u4njbGMW7xPn+EHXiuuX8Obj01nzi2hkj
 W1QltoDBG6jbJLy9YbiFpQL/1LDgyO7pgfeU9ovXF2zkW9yisOMppjM1Rj2s8S2FGdXz
 zGRuLC/TVauNQ+7xcOsnEp25dhDrX15QPU+5glfZIO2Qj4l26TpVHXln4ITMiQOzHB+I
 olog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712115840; x=1712720640;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+T+p5YoQyUiQemU/jDWxQz+rt6jIm9aQcddIMzbzpGw=;
 b=EBkvgX9gRKQcXMp0rY2BS0pSgxd7iamSfblnElSj0jIlnzdHfL6dJFU8AB/CYM6XZg
 39PBtpLedYzyoSpg8zXP8s8TRAbptcQMxBBIJONRLPxoUuDL18Avel11TVWfX2JqyT75
 8vWD49IYwsUPniZV9C4ur5i21tL6pwYnViL2jD21BcinGZHCvuQntRokqmR9K0Bc5SCA
 Uv3bcwKnn6DtRQgR8f90TBRFgc7ByXIAaiiJZueC6ISu4BNjsW6nIYpgHOnnzqFydFd8
 kaWPkLxbWQ1wYjGa2VXEs/PpgAT484c5ZUKYuV+tUKa4BDTlPW/wavpZvWygAEq/nbbt
 mLOg==
X-Gm-Message-State: AOJu0YyCPScRFMlCA4Jcikicvod5ZFS2ICTQzg0EmC2RGM5NS71jUYcy
 cOddMulU0WWBChqZPMqz54HePc+31cOC5W0gKn1OOuloymsZ74oVTT01noDG2qs=
X-Google-Smtp-Source: AGHT+IGtfzqNsIWXjR3lBrH+KbvcO7vtmJYhpysBjIhPrbalUcOtjnu38HJTgTjYUhOp5Z7WdpkgMw==
X-Received: by 2002:ac2:58ea:0:b0:513:d5ea:1d21 with SMTP id
 v10-20020ac258ea000000b00513d5ea1d21mr10812399lfo.69.1712115839856; 
 Tue, 02 Apr 2024 20:43:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 20:43:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:57 +0300
Subject: [PATCH v4 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-3-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3976;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ir5CM+jVaND4C9bLuSFQauIuwSNRo2ScqG2rMJDBLjA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7OkkeRbzXWIfkMtxvOhujgHNt5OQ+MjsZ3
 1J6uivUGSKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1YIKB/wNIG3h5bvt1QfaxHeh9v8mtUutT8ei6fGtabLxfRYmUsTbx1DBS3yrCx0395eAQxG3BA+
 5h2/OBHLE/i+T8x6voeANwrABTo4CsGpnli0xD1AqvqNIelZ2GN7YmNLKNHAmZNYjPgTjdteAb6
 GSZe9YJPlHwh8csbFwlfMJvGzot/d5S4Lwt5b5Glp/1OJiX/nnRGckkzdvH2zsxRel1L2uCxAuL
 kuMuzxie2mpRApvdxtGQooOGpO53SI3JEohjWo0ROAKTsmB6+82mzeFQ3Zo3Ik4MHe8CTDdAxEX
 7g7I8BGc1ERvJQQILmE9zcLy97H8Cq4f6R09AM2EYYYT/p0l
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

Add the extended version of mipi_dsi_compression_mode(). It provides
a way to specify the algorithm and PPS selector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 41 ++++++++++++++++++++++++++++++++++-------
 include/drm/drm_mipi_dsi.h     |  9 +++++++++
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 9874ff6d4718..795001bb7ff1 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -645,29 +645,56 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
 
 /**
- * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
  * @dsi: DSI peripheral device
  * @enable: Whether to enable or disable the DSC
+ * @algo: Selected compression algorithm
+ * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
  *
- * Enable or disable Display Stream Compression on the peripheral using the
- * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ * Enable or disable Display Stream Compression on the peripheral.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
+				  enum mipi_dsi_compression_algo algo,
+				  unsigned int pps_selector)
 {
-	/* Note: Needs updating for non-default PPS or algorithm */
-	u8 tx[2] = { enable << 0, 0 };
+	u8 tx[2] = { };
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
 		.type = MIPI_DSI_COMPRESSION_MODE,
 		.tx_len = sizeof(tx),
 		.tx_buf = tx,
 	};
-	int ret = mipi_dsi_device_transfer(dsi, &msg);
+	int ret;
+
+	if (algo > 3 || pps_selector > 3)
+		return -EINVAL;
+
+	tx[0] = (enable << 0) |
+		(algo << 1) |
+		(pps_selector << 4);
+
+	ret = mipi_dsi_device_transfer(dsi, &msg);
 
 	return (ret < 0) ? ret : 0;
 }
+EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
+
+/**
+ * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * @dsi: DSI peripheral device
+ * @enable: Whether to enable or disable the DSC
+ *
+ * Enable or disable Display Stream Compression on the peripheral using the
+ * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+{
+	return mipi_dsi_compression_mode_ext(dsi, enable, MIPI_DSI_COMPRESSION_DSC, 0);
+}
 EXPORT_SYMBOL(mipi_dsi_compression_mode);
 
 /**
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3011d33eccbd..82b1cc434ea3 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
 	return -EINVAL;
 }
 
+enum mipi_dsi_compression_algo {
+	MIPI_DSI_COMPRESSION_DSC = 0,
+	MIPI_DSI_COMPRESSION_VENDOR = 3,
+	/* other two values are reserved, DSI 1.3 */
+};
+
 struct mipi_dsi_device *
 mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 			      const struct mipi_dsi_device_info *info);
@@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
 int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
+				  enum mipi_dsi_compression_algo algo,
+				  unsigned int pps_selector);
 int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 				   const struct drm_dsc_picture_parameter_set *pps);
 

-- 
2.39.2

