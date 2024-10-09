Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F233F996F32
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91B810E76B;
	Wed,  9 Oct 2024 15:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JM8uUONE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10FF10E76A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:09:14 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so9199849a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728486553; x=1729091353; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JEvUlk1jL136GgzQVqdT9mrooxY8Q/uLvCPC41MEpWc=;
 b=JM8uUONEiNhZBzj90akd68bbZl1D1A9CkSKqU/THDZVHx3C806wr1rNVAkpjvHMEdm
 J9mZBIVSCnNKSDo4k+/1qAQxukPzGJoq4x+2fhn3ADx/rcw6JDH/m13eyoRP6ucxx4Mv
 KOP5wsw7c/wW7yvICyBbQ2TzVVxVYCwdZKYRc9SPhHEtkFeERt5tsMYv57wE1zTtCPJb
 GRye7yHZTJPNevaUy0vJL+GA+VtKG+EE4/tsV0jvDTs/Maadj+/UwnL/MCruMfoLpogV
 SDPde9bJ+6x/5znaiaw+cq4QcSu77C7r2BNqWuz+ZB3TEjnc2BQsSv3UDpNuVVClmEl6
 GuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728486553; x=1729091353;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEvUlk1jL136GgzQVqdT9mrooxY8Q/uLvCPC41MEpWc=;
 b=J8cHePxrN3MsqkVIOBcNSsyP3Ziu+ivZVm7dq+W0q7Jfa1mAEc7YL1qXuzIZO2Zucm
 qp6xa4dNMfYKqw/Q0+zsEmQ9eDabbGyhjnbAIK3HqgyB+cW5HRFVTaK4JhLDemj+2fZX
 Civso9kw4aPvlQI7zrXyVy9FUVcHTyZxMrN6wHBQ+Koyq+mgs1TFSsoXcJlu8zpaZmYz
 oYDDC4Qvw/dignBkyrBnRG01Q5ontkVY7JfpJDowHL1Pia587PXQCYiwJOGmYCrL4wOL
 mPbbpBkqbRf2I/UMpO+zG52FYa6lRRFoAZYZMYe5t5JbviP9lu6CAKDir0GvTvfVmTMg
 LZfQ==
X-Gm-Message-State: AOJu0YxPXqZ2WMXqSZPN0w1zdU/4hnhhViDVsGTpQWszmKxvMKCXEbik
 CZTliw+BgwBDnBRa5MaBiiSNjYFt6ivUPVY2dFLNbg61yNHJjxHg
X-Google-Smtp-Source: AGHT+IFpmC0d/mSmKW6krwhiMHYg5RC1Y698kV0WymUaPKy3TEmRyQ4FGV+J9yIkDTIheiYLIN+iZg==
X-Received: by 2002:a17:907:9620:b0:a99:4601:b9d8 with SMTP id
 a640c23a62f3a-a998d34dd72mr221987366b.63.1728486552647; 
 Wed, 09 Oct 2024 08:09:12 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-107.telecom.by.
 [46.53.189.107]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a992e7b19b8sm668861766b.154.2024.10.09.08.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:09:12 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 09 Oct 2024 18:09:06 +0300
Subject: [PATCH v7 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-starqltechn_integration_upstream-v7-1-9967bd15c7c5@gmail.com>
References: <20241009-starqltechn_integration_upstream-v7-0-9967bd15c7c5@gmail.com>
In-Reply-To: <20241009-starqltechn_integration_upstream-v7-0-9967bd15c7c5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728486550; l=2054;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8E4fr1Sq/NtXc9NlBNm/OB/QNGso+ly2Jqs2ZWzRZDo=;
 b=3lUOctdE19ggiM11q2NWrCsulpMt6YIvZwdld84ZfRF1xxEwgUNOc/0E6sjnhacb1QQpmn5rW
 +UfFVu+REpyCxjbZlh5SXgWHsSvzNbXq/x7EmsExNxjBBTHAO1nUPkG
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v7:
- fix kernel doc
---
 drivers/gpu/drm/drm_mipi_dsi.c | 16 ++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 2bc3973d35a1..5e5c5f84daac 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1520,6 +1520,22 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
 
+/**
+ * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
+ * @ctx: Context for multiple DSI transactions
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

