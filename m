Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7303289B4C2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 01:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175E210FDF4;
	Sun,  7 Apr 2024 23:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s+4zSLiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D667810FDEE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 23:53:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516a01c8490so4182638e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 16:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712534034; x=1713138834; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+T+p5YoQyUiQemU/jDWxQz+rt6jIm9aQcddIMzbzpGw=;
 b=s+4zSLiYEZnrxRr6+QrfxJZndQ2VXRaGEOjfX4tAaDkyaL8Y4xsloQ9JNjx5G0y0Y6
 yLvI0o6BfV6LM8aP8Q3oqL7WcSglZBUuu09rwl7BKRK8j+jOMe1aGHBC6BnpnzhrICat
 Pnv4L2rCPYdq7H/G3kp3pZf/gX0HmIptNtinumMCRUq1OPTZVMFjJvVz0enrbpK4JfPP
 GGOPyyPz5/AnsCbOiIyJKPFNhhYYD6MqCk6jstSjOBaDXaw5SfXSAI1ldtw7CU/ov+Ci
 +cQOhDYkyePwL00jyiBYlWp4qU6sbICtyIkHK0gVbgGZqy5mTR8pWFezKWbL98k2Re6L
 lJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712534034; x=1713138834;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+T+p5YoQyUiQemU/jDWxQz+rt6jIm9aQcddIMzbzpGw=;
 b=Fuk4fZxtVFWmZSRCb4DkCq+edGa2QV/thMrelq8pbPu/Vtjf3rEkcwxnQi1pWFwjyR
 fwQfth/dzWErR1ohain5ciB3M3HsXm24TSAVGftem96BWLi8kTYVg5jXf7ZVqLmWrhsb
 bs61lJNXULgL15hZeusUPd21ft8NwpofT1NGwRxvEOOR2D6qZR1ri9GG4k4ws8qv5h9D
 sigSGi5F0eu9hW4WI5GcZep2HjKwLUA2ZesV0NLLXn8QU2lvxFTOgCXxbWkB1L187Ajg
 Omma1ZZxIbz4mWGCQIMnr3+/lxWwrxUB7f2CeSBUVsXbix1d2xn8GhzyrSoSBObBHRBs
 OYag==
X-Gm-Message-State: AOJu0Yx00UWTwad9d0rPlJgaT1MPrTrbfC/cBT9xMpqBj783+JI42//X
 jv5Ew4xRxo7IojM7ySK7i/G90oFbxrS1GSh3zAdJKBleeErlI1ugjsLc5Gk12us=
X-Google-Smtp-Source: AGHT+IFOPggYsdEAgsgSafAdrankSogyBfbRUSleUWj3/m04vN64SUwJX1Bv63VVzB7X6fP4EbkVIw==
X-Received: by 2002:a05:6512:370b:b0:513:e29d:6840 with SMTP id
 z11-20020a056512370b00b00513e29d6840mr2497793lfr.15.1712534033985; 
 Sun, 07 Apr 2024 16:53:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 t27-20020ac2549b000000b00516b07fdc26sm965696lfk.109.2024.04.07.16.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 16:53:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 02:53:52 +0300
Subject: [PATCH v5 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-lg-sw43408-panel-v5-3-4e092da22991@linaro.org>
References: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
In-Reply-To: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzIP+Sa4hTKtHUTbPcjnH4GFR9b+OZoj1rSMO
 uBvi7Ady7qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhMyDwAKCRCLPIo+Aiko
 1UDlCACseKdDfogzr5q8q3Y4B7gkbVojQes4xCZF8bzA9bqA0iW1aUeZz+6+de6uvxs903c/uBq
 l+1cLoAf7omzcfnk0GrbLqr68QSmZmoym8brUNToqNELFbdOP2XTwZ54jqaafjlwEw7DG2FJkE3
 EWmkK8cwb/UX9i423ee2yMYSUAmYQIgS5TDIsHhw97B8RMwWlLp7YYpPkdAaCvaQZY8RT9SY4xG
 5tGtk3trlF6aKGGn/U3m9YzvsF8V3echPB3tzswzSewJvSXN7uQPMCJq9jk+o5s2FqMgzM9HAcV
 nEP4ngQl39JNqaUGL2u6OwcRu01pYporYP9jc5+/8L1hsI9v
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

