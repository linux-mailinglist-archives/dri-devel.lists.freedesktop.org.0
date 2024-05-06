Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6058BD59A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0DB10FE9C;
	Mon,  6 May 2024 19:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iAbSgaBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32210F094
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:03 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so375251466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024642; x=1715629442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o57hgKIjAk0UpXtlYxOCbQQvJBzOwu3W7y/5J4X3WHA=;
 b=iAbSgaBQM9kfAqZXTBIz05t7DrS4NqRJkj8CMtRC2y02cAmGr/6ERjrhgPrjddxQ3E
 JTuggNi4IGvrzp5fMc1ItZVNPPya31tslosG2bW69cAidEm33vy0YpJVHP+3m3uwnubi
 Q36Z0b34uSZuVSHAwIDRm7tNJexaCMblnr2Z9f3bEejvkzw9rrgVXK70t7HIrDgLryYJ
 W/3wfopZk0U6yecrdnvqglfJDusVdBWCRqulIHtEUo+o1sLKXJcclVfJxvL5ALoz6swv
 EYWSHnsPh6V1pKJQUSnD6Umh4IHOOq9K0vIxdkzy7egbt2mNzObJ4lOywoYbl/TLfgRu
 D1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024642; x=1715629442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o57hgKIjAk0UpXtlYxOCbQQvJBzOwu3W7y/5J4X3WHA=;
 b=H2oT2vaGQBxSDehpZwOuhKwNwk/sJsYTODZXQAHTxozEeYbrKkbSDgyyz8gcMy2s0H
 cKacYVlI116+z6BsHaY8fyii/RupNyvztv6M+n8pfI5rKMdossD66R9eF4Vh7T3vd9oN
 7CdMevN5/+UKq0uoPJorduWE9dMLPTSd6ZbuH9MRNBciMVFAi7Z8k3gMc2LguBlhtbYg
 4SrunfoscM/EGVOtvjpvNfTvZVXq+FAG6srP3XmMaahUo63R+1VkbpllDjm+C/JZToYy
 ky+PE8PTvP6eO69JU3leYwmOJgjuQOZB2TL/IgkBoIuAa45hY9qYf622hml9w22/J2I1
 aPcQ==
X-Gm-Message-State: AOJu0Yz2YBgaEHA1DWbsfwxQixB3MMtATnhLT8GP1dyeDz7lC/HSkySW
 vSy8U/aQPeZfmJcUPRyrz8ZausooP0imW9U6Y6plMbdci9qCxKY=
X-Google-Smtp-Source: AGHT+IH0d83c7xTax7fuIOWVQkoiDle9wGyhCdq0/Z1yJWMYOpdTGsFWFrlzxl7C3Qi6XsSYe60iZA==
X-Received: by 2002:a17:906:fa9a:b0:a55:5520:f43f with SMTP id
 a640c23a62f3a-a59e4cea3e4mr46264666b.10.1715024641987; 
 Mon, 06 May 2024 12:44:01 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:44:01 -0700 (PDT)
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
Subject: [PATCH 5/7] drm/rockchip: dsi: Add support for RK3128
Date: Mon,  6 May 2024 21:43:40 +0200
Message-ID: <20240506194343.282119-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506194343.282119-1-knaerzche@gmail.com>
References: <20240506194343.282119-1-knaerzche@gmail.com>
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

The DesignWare MIPI DSI controller found RK3128 SoCs supports up to 4 dsi
data lanes. Similar to PX30/RK356x/RV1126 it uses an external DPHY.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
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

