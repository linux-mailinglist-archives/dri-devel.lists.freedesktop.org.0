Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AD955B16
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 08:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD8010E055;
	Sun, 18 Aug 2024 06:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZqR18yEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85DF10E055
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:08:31 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d3bc043e81so2491085a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723961311; x=1724566111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnhRO8oIbYzeyc2+UcIe5cCUCjnBIooF0x4NCKcs5c0=;
 b=ZqR18yEnVKhIOYdIKCT9asoasbK6Tk6JcFxAPIfV/M10WE9sCM+Ms2z4xmRfAQTJVY
 mWCXCmtG3IrLcFHflHENY9L8ENJ1ThCNPKMfvnO67H0z1h5f5RikzZYYaFrnXck0tZUH
 SV6QrvvnOHjXP+QCJp/ho1j6/gAc4BU6YM/f3jRN3gF72iSCkbmYLjccPS0xdiCM0Dbr
 m+myCL/la3Vrrj5YaLQfTvGdcaFyLBLatOiWq3+gWBYeZxxWH7qO9NdIoOnZUkPPakFp
 C9atXDQAlrAmJsI7oeqd9Z2o+GSm7VJpBPaGra4DtyT4OKgAMMsjqYL4cBa7YC4ujU6O
 XY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723961311; x=1724566111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnhRO8oIbYzeyc2+UcIe5cCUCjnBIooF0x4NCKcs5c0=;
 b=afOUeYH4SbuYlaYfJjOj38x4DgYrmARwz8GY3+R3AwT6xlh7nlo9GvnuBjyU29DGSL
 ZWMYHtZXUBccAaQVzZGm8o09PQAVcrtSnmjfiP8QLcTQjVFYUP40gYaNe9DyBc0MubvE
 /TkoxWCbpkD1sN67u6TsQvZ/rBHKT9jd7i7YZsU2taqOneCiUdl2gZSlsjrcgjeKv6Z6
 nxl8L1Nx1KgAlsDZGHIm4tJyzpuAV3oQwD6APgnT1SyhByl9GEAuzuuXOgHIL/0QRGxM
 nY5/wpM8I7u5th7XdTB4kE63LN2ibW9gVpa5OyBCVteWNVAAfIAAKD6q8V1qQNlWxskn
 zxfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhz9kL1FsGPpONwzxtLzaUs5tPfpnZTJ+SeKziwTxv0JlcOjaEdtUgRMUbRQejkfqJ/G6QrFU28t/PilHwemt9u7a/dLK2+1dgdrgWaeFs
X-Gm-Message-State: AOJu0Yy3tRIRJxgwMcVFPWwDDY6kVzDL1NgyWsHxWbeLo+ImXEQbVyzQ
 B1x9KOckWjMyRs/qNHWo1ysuLAyW3LHLAV7I16ABBjh/sdedpL+G
X-Google-Smtp-Source: AGHT+IFKX+dkBN6/eSiq0VUEAhavDIJd0EypI+SXpKA6+P2rIe7RILckQEXPojZOkD0j1gGj5WjfXA==
X-Received: by 2002:a17:90a:a787:b0:2cb:3306:b2cc with SMTP id
 98e67ed59e1d1-2d3dfc2aa4amr8742078a91.1.1723961311044; 
 Sat, 17 Aug 2024 23:08:31 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6322:f541:ea23:e535:a48c:3c88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d4394e01b4sm236228a91.46.2024.08.17.23.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 23:08:30 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3 1/2] drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
Date: Sun, 18 Aug 2024 11:38:15 +0530
Message-ID: <20240818060816.848784-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818060816.848784-1-tejasvipin76@gmail.com>
References: <20240818060816.848784-1-tejasvipin76@gmail.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
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

