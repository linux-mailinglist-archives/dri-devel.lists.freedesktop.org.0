Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2B8947FC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 01:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A6810F6B0;
	Mon,  1 Apr 2024 23:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kfRdHn16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318110F65D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 23:51:17 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-515a81928faso5594734e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 16:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712015476; x=1712620276; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mpzfYidIvNvRN3cBwlHro7O/6yl5AJp4jLHzEWJGefo=;
 b=kfRdHn165vGVWs2YxiexbLNgLtFKldrsXwVya/uVSEg5Vb1IDRo9v6kqgMsq2QB/If
 WZ18yggZe9zJfacyLsMPwUWZFGhZtS+O2PEkxlrZYRaWvNPvUqBSDJXGk8tfCQnbnYgW
 o38q3sE3a6Q3t3NPWj2hgap7rTLEq4ofgD0oeI+movBSmx+oa0RucR1SPjnPPmre2SmP
 69qWaSZcc06tN9cybNYGboNVuEP2S0UGmId1GgGbj/ZGofSDGNs9CQ+8QRX8Uk6kyo+M
 XmSyr3PpZdKjmLSOXjdsayqH+h5xyCnnbMAI9q1/710798OZ10BpZN9H8Ex5XH9vfKLA
 3fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712015476; x=1712620276;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpzfYidIvNvRN3cBwlHro7O/6yl5AJp4jLHzEWJGefo=;
 b=uUH7w14RhZ+GD45vOnXDAXPB8vWLKKapmI/dxrlX6tJUrRU/P/yur+J9ttslp9LrDn
 m3kI11JxdVEhknUAGmuiH6vidBukt2VR01YEWq7zvOLYJuIftJ2O50XcyqIHVMZkA29i
 49TLlYkDHsr0n4T9A/joAm4YOEsSO4j0zEPWttxV8HyD0a3DoLQYOAkLKGWGKA8hHQw6
 gO+S83G1dHbsnJLqHX/fjcvUAS5e9TI+3UsfpTxzcrwpgP4KsEZ/HrMbqf8YAlIPYcwG
 nKNOYOfEaqQNzn0a9eon1I8Xkj5LcLFwpkcudO2g/SScZRMBldiM2RFIqD68lUqrVyZF
 Odpg==
X-Gm-Message-State: AOJu0YzNLniI8l1ci2/jRRUoimsgRu3q3NrYkvFSDLiwMGwnUWT9Mj03
 Eh4YsKVCt1sFl85EzkUqQ/Wc3+ZalEZTsQxgVnaVsz4vNbb/11B8q6zpgvVo6yc=
X-Google-Smtp-Source: AGHT+IEB2QzZuXS4R7In8uUvOplVuIkx/5QcTjBrAkrqWljwAWGeuJ4Uw8lPhznuCpa/fGL+cqKnOw==
X-Received: by 2002:a05:6512:3b0:b0:513:bf23:ce3 with SMTP id
 v16-20020a05651203b000b00513bf230ce3mr6870634lfp.62.1712015475781; 
 Mon, 01 Apr 2024 16:51:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 g28-20020a0565123b9c00b00515d127a399sm1176135lfv.58.2024.04.01.16.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 16:51:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 02:51:13 +0300
Subject: [PATCH v3 2/4] drm/mipi-dsi: use correct return type for the DSC
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-lg-sw43408-panel-v3-2-144f17a11a56@linaro.org>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
In-Reply-To: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rOvOaoNrEOh1JwJ8A0R+xJN2bNlhVIkJiYWXEFZjcZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC0hwGj7vMo/Qzh0+3TBiCZLL4baY6KAU+dlyE
 vw+6BoHZOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtIcAAKCRCLPIo+Aiko
 1Zv+B/9wd2V5+AZfCycvRGBF4noHw+StvkzjCmm8/yNBKOTXw92ECQQeXQyhdCDfxWuJSNcfdhH
 z3MjqZwynJX76c3byfFHg3E4Y16BAv21oi7lfKZXZCD3eotB7i448jq6ObfxKEBWEae3rT/+nKs
 GoP9NlqdeuTpURnhpCqqb+Xt9/cfmyyavxioTm0vhtfT8PzGPiIh54S3UZkSJqZ9j6pqY/ugBAM
 bsC1MPWunq1bMRstUGrwHypdSHdHgGXfR5cbU2Qd2sfYfJmUgiTOdoMppG0NmmtILsToesdm/q/
 RxDM0+dlz8tfLJOi90XWEi8jRA9un1FqARRV9Vbz/7aW/duX
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

The functions mipi_dsi_compression_mode() and
mipi_dsi_picture_parameter_set() return 0-or-error rather than a buffer
size. Follow example of other similar MIPI DSI functions and use int
return type instead of size_t.

Fixes: f4dea1aaa9a1 ("drm/dsi: add helpers for DSI compression mode and PPS packets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
 include/drm/drm_mipi_dsi.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ef6e416522f8..9874ff6d4718 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -654,7 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
 {
 	/* Note: Needs updating for non-default PPS or algorithm */
 	u8 tx[2] = { enable << 0, 0 };
@@ -679,8 +679,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps)
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps)
 {
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664..3011d33eccbd 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -241,9 +241,9 @@ int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps);
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps);
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);

-- 
2.39.2

