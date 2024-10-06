Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91986992058
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 20:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E4210E1C3;
	Sun,  6 Oct 2024 18:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fiw1Opqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128D110E1C3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 18:21:08 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so565457266b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728238866; x=1728843666; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0lAbK3XSMtWaPGPtD0E9P9CrTXsVrlCnkPMgMQ8xgX8=;
 b=fiw1OpqzhBV0apF+1lBdxGUIaPS9KaqFH3+CMxM8pAODT0dUWFBsFWQoU6d/L7dNTb
 VpbjTMOeU6/FS75yfJkjXAEgtjG1MIDNOYukMz6AigRdSRFHB1GWFAoi7lfvTKfxdgMZ
 t3E5AhAFIH1gof9AacNrHdtzlzKcx2zIzW5fEIZV53wOHllYbqH1TBdyiPENHRPs00os
 synIbH0mPa3BSjdZwJVudGhjJRIZvCxQDG4fyNrdfkQMYR1yQIf5L6uscN3SMhPjmHKh
 FtJNyz8LuoB8HPi9yxKZv3Y3AvOEFITeXSLB/5XCbqaH6CtyMAu9yJ3bPc9AO3ulzOLp
 3GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728238866; x=1728843666;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lAbK3XSMtWaPGPtD0E9P9CrTXsVrlCnkPMgMQ8xgX8=;
 b=eNjBYpm4kHBV5JPqvY5o8gqjhDXF3+aduEsy0aYO7GqtyyTdarT8hXiQJQ0U1sO0RH
 Htz6mGtcKbjQ4YpDKZe6qGXtXnYVuyNL1MyOLL71JUjJr428XknOlvSSUnVrNugq1dCo
 dY5X6Lu8HKFBCjWxl2cs+wa3rY4U0CU5VirRKpdPiyFIb8I5eoZEEQ/O2AU+J8ndtfhr
 4PHH0oTHHbTsudhWV0GsxbUyXjE1Ds5jWUsZstrGRUz16DlfgHCcKwe3WfRh2q+Ig9r5
 4/RYDJx+I5rdWCIkEFcYsiiXFWvhenUcQQLaS2SleVQRuwQCsZXlaIrcBDT3yNjvK8eu
 gLkQ==
X-Gm-Message-State: AOJu0YxX03+SER7TsbvXKW5QrbJ9cWMGiEbi0x7rJxyFufVkONRYJJNh
 kfoDXI68ZROXgsnDxHI76S6sk/IatdoLdc2faZt0eiNVITwj7+7W
X-Google-Smtp-Source: AGHT+IG4xL38eaERTSDCvCZoFEEh0wO4U73qoc9yIyvpWQBwHD0rpPJ2DnXvrWw23iuwsXFy2w/0OA==
X-Received: by 2002:a17:907:e260:b0:a86:9776:ef40 with SMTP id
 a640c23a62f3a-a991bd46213mr885089266b.36.1728238866063; 
 Sun, 06 Oct 2024 11:21:06 -0700 (PDT)
Received: from [127.0.1.1] ([109.126.148.51])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a992e5ba407sm294080866b.14.2024.10.06.11.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 11:21:05 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 06 Oct 2024 21:18:19 +0300
Subject: [PATCH v6 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34@gmail.com>
References: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
In-Reply-To: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728238859; l=1942;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=6b1p0XluODvkmpa21j4OVA1qaLtfm9IKDiiyUx6XmBE=;
 b=XAnDW0by1ALFI00WOPyrjqaPYUbVAeqcn0AekhHNvwv07u+NG+W917AUol2wP6F0ldlrNSxmM
 DbuNtRoe8I4AuxEBZascZV9F5p3UJ3rosAHCFrnJy79n+ZBDRB8fdJO
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

mipi_dsi_compression_mode_multi can help with
error handling.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 16 ++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 2bc3973d35a1..d8ee74701f1e 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1520,6 +1520,22 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
 
+/**
+ * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
+ * @dsi: DSI peripheral device
+ * @enable: Whether to enable or disable the DSC
+ *
+ * Enable or disable Display Stream Compression on the peripheral using the
+ * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ */
+void mipi_dsi_compression_mode_multi(struct mipi_dsi_multi_context *ctx,
+				     bool enable)
+{
+	return mipi_dsi_compression_mode_ext_multi(ctx, enable,
+						   MIPI_DSI_COMPRESSION_DSC, 0);
+}
+EXPORT_SYMBOL(mipi_dsi_compression_mode_multi);
+
 /**
  * mipi_dsi_dcs_nop_multi() - send DCS NOP packet
  * @ctx: Context for multiple DSI transactions
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index f725f8654611..94400a78031f 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -280,6 +280,8 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
 					 bool enable,
 					 enum mipi_dsi_compression_algo algo,
 					 unsigned int pps_selector);
+void mipi_dsi_compression_mode_multi(struct mipi_dsi_multi_context *ctx,
+				     bool enable);
 void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 					  const struct drm_dsc_picture_parameter_set *pps);
 

-- 
2.39.2

