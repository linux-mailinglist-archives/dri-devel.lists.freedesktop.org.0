Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF91892BAB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 16:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E243510E88B;
	Sat, 30 Mar 2024 15:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="govBqr3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29AE10E886
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 15:00:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso3527425e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711810850; x=1712415650; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gXi248XgYEI1aNqzH18MSPcwgnE2Ghs0byyxqmpezB8=;
 b=govBqr3AuIen4h7V8AaK2uZRrOkeX6+xdBTLSFfMFFyCQ2Wix941N1m19O7qIroknN
 rYzOeBpZ50hVI9/QkRZsscztmQZULAqro9o13AbFu4OseyKcgRCmlemMzKL4hTqIDVUQ
 2LvyIiJdUuM17hUwDj0f/lakz6eSTZXdOu78jYXfW4PKEiGkk9cj198UFO4qHRVXkiYB
 x4l25dCKRKDACo/8Zzx33gNxC/eR2dqunsAHHNiJ6YYHJW4cA2M3L8GGw67nv1UE16MC
 vjRWQ5tj5f583XnV3IwvHa8rFIbUYpVLEBwWBx0QqcPI797FtmkqTEp/97E5IWLWztvE
 yFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711810850; x=1712415650;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXi248XgYEI1aNqzH18MSPcwgnE2Ghs0byyxqmpezB8=;
 b=aTmRDjhrxEAp9OFhpfHAvkbbJHVsKOlEAvkVz8YaQYT5nR4oALb8lrnz02HTR2q4HV
 gU8oCyJ/FA0uwVVv2urQCf/Ezotoxn4FKmnKdvnM/VI2Ga2wOTwXLvT7LjcCFlKA0GfW
 f2jBqcLjAqWo0jak5Omht4UwRRIsT7JyGp1r8pu6pmGtRZDusAjBfQ8gQJ0TRSM0/LMU
 mxA2NvaaD+u9WeZYehFjJUNT55NzXQiPAnwQDOt+MBNFsH6z9PfsUt3HNPAjeDprF/+r
 QgN3dacmnNCTI2Qxd/s0Ze9dZsXirQ/4vkH7l72dQE0fW8kyYdkK4jNTtWFi3hJWvOJV
 s1lA==
X-Gm-Message-State: AOJu0Ywbk2+JHFxsHsWLTPAiJvsqrTnT5vpNf2flR8fvxwic/KEA6YYD
 EkfzNvwQnBVCvhc1KsemBcT70KrP5ZX3U7TJoCYiZieFrGHxqYIHzg95YHG5ozjl1K+3J0rt1t9
 z
X-Google-Smtp-Source: AGHT+IG8fUr3Y+BvOvBw0pX4ptCgxhfFGh8Zgf+AI4HDWWEx9BdVlVw3GH/Lxx9ar3JKgaIyUtFvGw==
X-Received: by 2002:a05:6512:1287:b0:516:a115:4a4d with SMTP id
 u7-20020a056512128700b00516a1154a4dmr813652lfs.68.1711810849633; 
 Sat, 30 Mar 2024 08:00:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j5-20020a056512344500b00515d205a6f0sm496199lfr.29.2024.03.30.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 08:00:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 17:00:47 +0200
Subject: [PATCH v2 2/3] drm/mipi-dsi: add mipi_dsi_compression_mode_raw()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-lg-sw43408-panel-v2-2-293a58717b38@linaro.org>
References: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
In-Reply-To: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3402;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1dHUwNPq/ZE2lZqujLo0paqKG5T8bLmbO34BUbpj00o=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxqHplxtUqThhGu919/sN//TceXwyktfCwLqyuu1DCecu
 edwe3F6J6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwvWLg6Gl56nEj66VlVyG
 xx9G7sxp1d98I4a37MfW5rKYx/57D0022SfSK5Zudy8x/M/8mUYW7Yc9ThV71L7cU7T8hV8zb9h
 5pgw2w4Lf7ifi2ITbao2idruvqG/ZLL6u6NBCncKb+juX9E+6N6NKbYFxRr30D/njraWrpp0+Gt
 A2SyfrqPcN3oeOeqFf49a/SchwTHtYcCy3X2kTC68Dd/+aznOBKQnBn+b9+7igxNzhhZYAW7hfh
 /VXyRgR7T9B82L/1Gj57mZhm77N1m6dytac701mf7Y1HVglLP9i2y3VNVsCGup2fTa/WhH1dGfu
 s5M1ng5PEg259jSLOzjsnie21nSjwM1C84fqvde0E3kUAA==
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

The LG SW43408 panel requires sending non-standard data as a part of the
MIPI_DSI_COMPRESSION_MODE packet. Rather than hacking existing
mipi_dsi_compression_mode() add mipi_dsi_compression_mode_raw(), which
accepts raw data buffer and length.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 ++++++++++++++++++++++++++--------
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ef6e416522f8..f340d1e0a9a5 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -645,29 +645,47 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
 
 /**
- * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * mipi_dsi_compression_mode_raw() - control DSC on the peripheral
  * @dsi: DSI peripheral device
- * @enable: Whether to enable or disable the DSC
+ * @data: data to be sent to the device
+ * @len: size of the data buffer
  *
- * Enable or disable Display Stream Compression on the peripheral using the
+ * Control the Display Stream Compression on the peripheral using the
  * default Picture Parameter Set and VESA DSC 1.1 algorithm.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+ssize_t mipi_dsi_compression_mode_raw(struct mipi_dsi_device *dsi, void *data, size_t len)
 {
-	/* Note: Needs updating for non-default PPS or algorithm */
-	u8 tx[2] = { enable << 0, 0 };
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
 		.type = MIPI_DSI_COMPRESSION_MODE,
-		.tx_len = sizeof(tx),
-		.tx_buf = tx,
+		.tx_len = len,
+		.tx_buf = data,
 	};
 	int ret = mipi_dsi_device_transfer(dsi, &msg);
 
 	return (ret < 0) ? ret : 0;
 }
+EXPORT_SYMBOL(mipi_dsi_compression_mode_raw);
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
+ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+{
+	/* Note: Needs updating for non-default PPS or algorithm */
+	u8 tx[2] = { enable << 0, 0 };
+
+	return mipi_dsi_compression_mode_raw(dsi, tx, sizeof(tx));
+}
 EXPORT_SYMBOL(mipi_dsi_compression_mode);
 
 /**
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664..321d2b019687 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -242,6 +242,7 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
 ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+ssize_t mipi_dsi_compression_mode_raw(struct mipi_dsi_device *dsi, void *data, size_t len);
 ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 				       const struct drm_dsc_picture_parameter_set *pps);
 

-- 
2.39.2

