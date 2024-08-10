Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017A94DAC4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 06:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072B110E028;
	Sat, 10 Aug 2024 04:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EEEvhdRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DE610E028
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 04:55:05 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3db50abf929so2016962b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 21:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723265704; x=1723870504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IS2eypZenlB0YB7xDQlNlol297l5Xqi9mIfw1aOttS8=;
 b=EEEvhdRybTieHcJhwKIvXcStgEF25D6nnr0v9ROIEv2xX6qUlTJ/zWGrbf/GDlWdLZ
 wLRchDwtOaIc7pG9EvgRfhtWeQ21fWFdyvxvpu5Kcea3oiRP8OBKYYmUDWFEzLf2QqBv
 xcvWV7W0iR99WxbXZ5CvKgiqYJDVfJZK2b0iRzY7FRoob1tz3dhGAh1BDygLmesJ90pg
 Wl8Zu/S5A0bF8+dTjoWt8Gjl6IQU3GoB3tZjyNQWZYsPmXdlGcUq2Mov7XmFsBQ219e8
 3mgZ/pLRq85SJOyoAlavsk8FZ/lWJNXz7VjM85hJ9W9MTooW3nCMCCzg7RRTlIn14bth
 gMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723265704; x=1723870504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IS2eypZenlB0YB7xDQlNlol297l5Xqi9mIfw1aOttS8=;
 b=wk9SJlUjoAF8Q/v5GpfVtaT6gHsegMKVAfMxYzkpzulK+uj6kFz5DI/yraypleFdOB
 DEQMrs/Yd4T88sNCseXRFGaft6B5IJZtO0WAJefcm2HR7XQY+lBft17OvMD1TAZZDDDA
 uBi1rzUGWRMngql3MYcG7G1LrTE/CUb0khzEh7wrjk3IqgR7V8vO4xfjCtBx1YmNGzVE
 d20oDGRl0ezXy8QZ6Oh6VBVbQzYm45g+2cyhPxwthvRwn6UfT6d7FLcrgbbK7uGNzeqU
 xo/wbyyCZbcidhqRp95tfxjbvDNi22loHBHnwoMSjVQBu6iJMKwNFSqk1+aX3S5wG8es
 vjYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJVkSk+5ncNUDZ/dJGEdVVJmRVYhEUxsxcyn27LCOMRrFgUlAe+A0H2y7FDlH+L47RoTE28ZndeF0b/JaYbY4Yi7jmUhpoLFahHSykx7Yl
X-Gm-Message-State: AOJu0YySJE0QAIJTngHLDOwtZAec1zV4m6cpQxqJI534ek3wce3RRQC2
 55JqyxXDOG0WIZbYIPtAMyfg2P327YCvUbfF1Gz5hfkHOZ2eVIMG
X-Google-Smtp-Source: AGHT+IHDNq0Y0g8CWga0ectmzl5Wbkm4MdbLEC+pLI0m00o5hpFZx9xFMZDa1UF7ISR8lw2Pl0kiiw==
X-Received: by 2002:a05:6808:6542:b0:3d9:3e48:8b13 with SMTP id
 5614622812f47-3dc4166b4d4mr3997158b6e.10.1723265704323; 
 Fri, 09 Aug 2024 21:55:04 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb8fd82asm5227005ad.73.2024.08.09.21.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 21:55:04 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 1/2] drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
Date: Sat, 10 Aug 2024 10:24:03 +0530
Message-ID: <20240810045404.188146-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240810045404.188146-1-tejasvipin76@gmail.com>
References: <20240810045404.188146-1-tejasvipin76@gmail.com>
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

mipi_dsi_dcs_set_tear_scanline_multi can heavily benefit from being
converted to a multi style function as it is often called in the context of
similar functions.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 8d0a866cf1e0..b7ad18c148c2 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1339,6 +1339,9 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
  * @dsi: DSI peripheral device
  * @scanline: scanline to use as trigger
  *
+ * This function is deprecated. Use mipi_dsi_dcs_set_tear_scanline_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure
  */
 int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scanline)
@@ -1833,6 +1836,34 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_page_address_multi);
 
+/**
+ * mipi_dsi_dcs_set_tear_scanline_multi() - set the scanline to use as trigger for
+ *    the Tearing Effect output signal of the display module
+ * @ctx: Context for multiple DSI transactions
+ * @scanline: scanline to use as trigger
+ *
+ * Like mipi_dsi_dcs_set_tear_scanline() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
+					  u16 scanline)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_dcs_set_tear_scanline(dsi, scanline);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to set tear scanline: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline_multi);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 602be6ce081a..c823cc13ad1f 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -375,6 +375,8 @@ void mipi_dsi_dcs_set_column_address_multi(struct mipi_dsi_multi_context *ctx,
 					   u16 start, u16 end);
 void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
 					   u16 start, u16 end);
+void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
+					u16 scanline);
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
-- 
2.46.0

