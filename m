Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF28C10DC
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F7610EA8D;
	Thu,  9 May 2024 14:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lsePVrKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC2A10EA8D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:07:04 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34de61b7ca4so600047f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263623; x=1715868423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gG8NnG9MCxt3FCrGHfY+CHmnXlhVbyAkGBrDmW81e5k=;
 b=lsePVrKl0s3wgxsPzW+0V0D6qdnC4y3NU5iuGppOu0IBeKYmKbzyIwBboR5o7T3Grb
 4dOyZQtSGyz6Qi9mQJOSazHNT90lPGAm2mutectLmCtbnSYIsmo05KPMCyitWZRHc1tv
 36nDz93k5h/u7SJqMtBpNpxzfQqDqkK52Bglf0nWcT2lOeCSvDUaxT539wAkoYN4rOK7
 OuhaYtEyDzzyIMYNskEX8y7Uita2n0FSdstVXO/ko4yqdfbQ1/fL+q+l0aXDJ+6NP0jp
 E3mGGlvg+YZLORBKrjS9spgQx5lqdYalAECl1AVKKLhKdNyr7wGq4+rvBeExZznJnvsW
 r8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263623; x=1715868423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gG8NnG9MCxt3FCrGHfY+CHmnXlhVbyAkGBrDmW81e5k=;
 b=i8jqgBqxyatZd5urj8B1NZWc0vqi4g3xS9id6Vb/VDGGzTcQnF0XfZyVFOl1ubUh5E
 qPeyrJk/DQDSkyEt2R+x3dh8W7TBJ/HHCdzDJ4QHUSoyTmYMz5EUJfilZZOi5pgXH51T
 ejqCZTpSILkWt+1tDUfcGRRn3SIKkdc+gbnzRqOQSpA9uMn64AZtSA+o6KWbZ8gK43Oz
 YadmGMveZjuQbMAaabbV11HW2xzy+f+l0lJ+ZOY7hOOxAsH3I1Itl6YxCiv4zHdDxHzh
 3oqFPGENTw/W1rb0q+H1a8x2gg8f7OPBhLNIlV4HyYbTZhLyxCs6NkyA9woglXczHWgf
 OIyQ==
X-Gm-Message-State: AOJu0YwZ7V+Uijnti5AJgqzUpz+yIcioKPgbrZ33HSs8Z3wmSZkFr6JW
 pNvAUl2lYE8eaElPiCyo1snnmrZXHg0jzCalQkVh9+o7E8s0gjM=
X-Google-Smtp-Source: AGHT+IF638N9r8RenDUS5cIi1bm0ckYuTr7cNtt0tRexV/Fy7f9WgU1uTe9kWso6VR3HVhKQKBvSlQ==
X-Received: by 2002:a5d:68c8:0:b0:34a:d1d4:cb3c with SMTP id
 ffacd0b85a97d-34fca6233aamr5597109f8f.39.1715263623270; 
 Thu, 09 May 2024 07:07:03 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:07:02 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v3 5/7] drm/rockchip: dsi: Add support for RK3128
Date: Thu,  9 May 2024 16:06:51 +0200
Message-ID: <20240509140653.168591-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509140653.168591-1-knaerzche@gmail.com>
References: <20240509140653.168591-1-knaerzche@gmail.com>
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

The DesignWare MIPI DSI controller found RK3128 SoCs supports up to 4 DSI
data lanes. Similar to PX30/RK356x/RV1126 it uses an external D-PHY.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes since v1:
 - none

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4cc8ed8f4fbd..58a44af0e9ad 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -153,6 +153,11 @@
 #define PX30_DSI_TURNDISABLE		BIT(5)
 #define PX30_DSI_LCDC_SEL		BIT(0)
 
+#define RK3128_GRF_LVDS_CON0		0x0150
+#define RK3128_DSI_FORCETXSTOPMODE	GENMASK(13, 10)
+#define RK3128_DSI_FORCERXMODE		BIT(9)
+#define RK3128_DSI_TURNDISABLE		BIT(8)
+
 #define RK3288_GRF_SOC_CON6		0x025c
 #define RK3288_DSI0_LCDC_SEL		BIT(6)
 #define RK3288_DSI1_LCDC_SEL		BIT(9)
@@ -1493,6 +1498,18 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3128_chip_data[] = {
+	{
+		.reg = 0x10110000,
+		.lanecfg1_grf_reg = RK3128_GRF_LVDS_CON0,
+		.lanecfg1 = HIWORD_UPDATE(0, RK3128_DSI_TURNDISABLE |
+					     RK3128_DSI_FORCERXMODE |
+					     RK3128_DSI_FORCETXSTOPMODE),
+		.max_data_lanes = 4,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 	{
 		.reg = 0xff960000,
@@ -1670,6 +1687,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	{
 	 .compatible = "rockchip,px30-mipi-dsi",
 	 .data = &px30_chip_data,
+	}, {
+	 .compatible = "rockchip,rk3128-mipi-dsi",
+	 .data = &rk3128_chip_data,
 	}, {
 	 .compatible = "rockchip,rk3288-mipi-dsi",
 	 .data = &rk3288_chip_data,
-- 
2.43.2

