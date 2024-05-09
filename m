Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FC8C0F39
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E4710E5A4;
	Thu,  9 May 2024 12:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HIgSwBEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E978610E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41ebcf01013so4551785e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256446; x=1715861246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+bLe4/l+mvEUfFbA3v+BR5qf/S1rNc4PFO2a3ch0KQ=;
 b=HIgSwBEHHFNoSMSnyZUoS8+VZzZK1m6vpZ14+63W2NnlowYC9WAFFni44WUFZ8a8dD
 SiEwE9CzkfStedgJg41T2yDqzzGExhSS6qCurflel3zvCRGwrJEWARwaJ9c06jhAEMxi
 UzLKQBtnQHJBzHO72BeOhN9pbp6c7np/dsmqJxvB5qOHbk6xIQr5Pgke/PiRU9ECLk81
 wiViP1B/2K9VvxmrnoEN8unLKMD+LEdoIsOkworEWREu3ls1YWUA7vrxED4PMu5kObUW
 oQFZgQJ3H9ZCTksuxoinakqvBfg5k+ql5oDqXJ6XM+nm5xSaqIbufmyFAs6ajQJ3yA49
 VRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256446; x=1715861246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q+bLe4/l+mvEUfFbA3v+BR5qf/S1rNc4PFO2a3ch0KQ=;
 b=EPS63GHjXugaGpkx4pWd1QDVPa0uugddHlnu2H7mKD8IiOShPx1IJVBSfByFo/OsV5
 7YvjHqzqbjqw+9dWeID79EBk1/jnCCwTksKPRo+/z0lHCPWjmQuicQBMuOKMXPKM9OUb
 FERxpPgaxhRWB66a/G0sRyKKvw5+/Gq56pzSO906ysCZZl8QGcVEiM/7wOyvHCN80MQW
 ZgshYOa5FYOlZiro81kJbEg7gFSKJkFUSIhd8/ddRuBzV3b+CGwqm1ex0sVjpEhvq8GK
 bHniL8Ov2IGw2SDo+h77sQThFGhpSOcNGw2Fls5cv1dCnRt00vRfk9Jmo4U30bBDTxqs
 dw0g==
X-Gm-Message-State: AOJu0YyMr3Z6F1XCYU27ww3oiOxc2/38qv7MDNW4soo3j5REkm0qMtK+
 Qbs2IUbjCd9JntzIKpC3ufd/cgh93NCEkDIJ6JYB6sNnvMz9wCPom765
X-Google-Smtp-Source: AGHT+IHtoArrqD0dnvqLAhLONFA8xc0foDIiP2c2dDm/g4xMVPSUsPLYrXXxqeAb6C9ioPtRQlXv6w==
X-Received: by 2002:a05:600c:354a:b0:41b:f24a:b590 with SMTP id
 5b1f17b1804b1-41fbc91f3e4mr21505645e9.3.1715256446176; 
 Thu, 09 May 2024 05:07:26 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:25 -0700 (PDT)
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
Subject: [PATCH v2 5/7] drm/rockchip: dsi: Add support for RK3128
Date: Thu,  9 May 2024 14:07:13 +0200
Message-ID: <20240509120715.86694-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509120715.86694-1-knaerzche@gmail.com>
References: <20240509120715.86694-1-knaerzche@gmail.com>
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
index 6ed64cc35275..17fd5260218a 100644
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
@@ -1518,6 +1523,18 @@ static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
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
@@ -1695,6 +1712,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
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

