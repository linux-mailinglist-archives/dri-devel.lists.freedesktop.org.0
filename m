Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C994FDDB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 08:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DF110E2BD;
	Tue, 13 Aug 2024 06:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lue/M2yO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C965610E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:30:56 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3db14339fb0so3060669b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723530656; x=1724135456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnhRO8oIbYzeyc2+UcIe5cCUCjnBIooF0x4NCKcs5c0=;
 b=Lue/M2yOcuP4mHG4ezBkrOcFviQGdaGxqdm2Ip4DvBhnrd1SRvZq9kMtCOUXIa+J1F
 9XEUKoHNscVKI9N8mBhcTcHs9B17+MqZewanFy8Wg3jHcskjyAv4DG3IWBU5Xsn1ielD
 wEaXltGGJXwNRu848kCKxjNjMy38dncjAafnYgcaJfP0/n4Tcosil8SmUvaKEenGR1mf
 MOXrnPVmuNVLzq5YdFCii6W1aYzMAKfwkIVpgjPSlsEzGQp5EwX0o7FmQn44SKWU2Mxx
 NsK8W3QLBPlhAMpKnILxRQMqfD4AfoPkyiteHCNeAs0w76OLio+k+aWRwWEQehOOZDj9
 cNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723530656; x=1724135456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnhRO8oIbYzeyc2+UcIe5cCUCjnBIooF0x4NCKcs5c0=;
 b=BAZ1l+3zJtUMkgIZdLsUf8I8kA4/mxkE1soSYMJoyb3mtFANYoc91M0hcp5RxTpDtp
 A5JAgpfse7CV8uNUbWj58fEAyoMJkRvy3+UAV13ostVq0YH8cBejv9IL6ZL3OFAb6zto
 NbvtSM5J7JXxQBXmd+v3rKbfbY2sG78hxJ/Lz3+w0/ZMHIJJ3M4A2AT6xNTMcewWaTcg
 MjfAZ5qNr0HceJe+Uz1BijMo6YLBrobBown5u2qF/l2jF0mA0v542myhMhrR1ImsAoH/
 pOz0/xV8xub7KpsAaX6HoisaWueENYtbKW4XqFpLg6OkZ7YtocHv65X/RAID4WbYDlYi
 AkxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmJJKCXSMoUfoPxFUhlo70/N0Cx80+3aj3Oo9xNhy+2x1eBvyMMDeykkbqIT/tUaLKpr3tqWL5pAZ0hS/fexwrUE4hANUUiwfXeGJMgCF8
X-Gm-Message-State: AOJu0YxahtQfgRHGO7/HYwoTY5eIYMTAyPPGwy6/80Ni2IhYtWHPUs+N
 uZokZlyaxZq+tNZu7BWAvjD+IUDZ64pNzK/jXz/Ns5pVhp4TyISi
X-Google-Smtp-Source: AGHT+IGl8lpHE28XNKZxP+IXMifzfzU3TnIAs1cjru610NhqeJHIbTIlZ1khvSkQ6UxuCEbZ5iaDAw==
X-Received: by 2002:a05:6808:f8b:b0:3da:ab86:bfd7 with SMTP id
 5614622812f47-3dd1edd2f60mr3438679b6e.3.1723530655907; 
 Mon, 12 Aug 2024 23:30:55 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6325:9539:8b89:ebee:b1a0:5ff9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5874ef7sm4991965b3a.38.2024.08.12.23.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 23:30:55 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 1/2] drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
Date: Tue, 13 Aug 2024 11:59:11 +0530
Message-ID: <20240813062912.467280-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813062912.467280-1-tejasvipin76@gmail.com>
References: <20240813062912.467280-1-tejasvipin76@gmail.com>
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

