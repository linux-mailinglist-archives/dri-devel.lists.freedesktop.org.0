Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F98C0F36
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD2D10E4E8;
	Thu,  9 May 2024 12:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kdDrzeeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440CA10E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51f1bf83f06so789684e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256445; x=1715861245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8klZW1X3Sda14Lq0eRI1WDVW4JJJl7xuMqHEZ5sEhE=;
 b=kdDrzeegXX1hXNPCx9ArV7au1O0x+mJ90MPTxK7DLVTUHZm8HJsvQP3+gIhk/O68Kq
 dtItGR3frHFAJhZCU7OJsdLtjBwvazo4atfqTSTV8+RSDzD88wpoWUIKrC9tVCKfZ8HK
 eD4HT+xY7fCbDl5kwGAbAD6SS7RaEY2HA/ij8zvfUoItDzUpohrpkPTQClf/Su9sFjmz
 EgAwDDu6g3/g1CEoO3IBdgoPvfIpxIQaSihdnIlhOMkGm2wWq6Xnok8oqw9QiVTbnKOw
 jzXY/mptrd/QKbGeVG4bfGcts1GRFZL+srLuqokbkLm/OqRZR4O2FMZ6217FRY6z6MnC
 P6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256445; x=1715861245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8klZW1X3Sda14Lq0eRI1WDVW4JJJl7xuMqHEZ5sEhE=;
 b=gd93iZccmlyxSRkwT/Qc9U8y+rETDp72mgnLwdkZm2pYJu9o8uyWUf76My8/W8gYJP
 kButjsQx38OhQzP6NbJXQI8uPluH8EYVVkRrb925o/egO/4ZiJJWiCSmEx/q/iy3UehW
 6fldzjvcwW88Jn7OyTJu/XboVzLlDVaPpA11payNTw3W13/JxB5F/qrq8JGP6rCO7Zx7
 H2IZP0vuv5bh/XCKBJyUrbix9hgrzqrkpm7UJIXSDjhiAGlk/4M16xaE8f495n1sUta8
 E9XJRNxEDbrGExnDPp/cglHNAW7zi8OEeziIxRwQNgxliGxgpZoyUr0tPZSKr/s5p+nl
 UW3w==
X-Gm-Message-State: AOJu0YyrvsghMCwNret8dmChKqnQIaGfwbDnxOzckIFDBcUBA13qwrAC
 7+HnUDNejef9nPrf0g+9ga6+EINcbDzUOdJ49QFIFB+5Snj6p2o=
X-Google-Smtp-Source: AGHT+IFecuxCJWM/nUWDhGJ7gBSfItZDqcg8FMCaOxeHy6FMY+wOyJdPzB48iweW2PiFVOX6Z6J58A==
X-Received: by 2002:a05:6512:210a:b0:51d:9921:20f7 with SMTP id
 2adb3069b0e04-5217c56f496mr3116279e87.40.1715256445211; 
 Thu, 09 May 2024 05:07:25 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:24 -0700 (PDT)
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
Subject: [PATCH v2 4/7] drm/rockchip: dsi: Support optional AHB clock
Date: Thu,  9 May 2024 14:07:12 +0200
Message-ID: <20240509120715.86694-5-knaerzche@gmail.com>
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

Some integrations of the IP additionally have an AHB clock which has to be
enabled before accessing the registers is possible.

Add support for it as an optional clock.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes since v1:
 - new patch

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4cc8ed8f4fbd..6ed64cc35275 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -265,6 +265,7 @@ struct dw_mipi_dsi_rockchip {
 	struct clk *pllref_clk;
 	struct clk *grf_clk;
 	struct clk *phy_cfg_clk;
+	struct clk *ahb_clk;
 
 	/* dual-channel */
 	bool is_slave;
@@ -1153,7 +1154,15 @@ static int dw_mipi_dsi_dphy_init(struct phy *phy)
 			goto err_init;
 		}
 
+		ret = clk_prepare_enable(dsi->ahb_clk);
+		if (ret) {
+			clk_disable_unprepare(dsi->grf_clk);
+			clk_disable_unprepare(dsi->pclk);
+			goto err_init;
+		}
+
 		ret = dsi->cdata->dphy_rx_init(phy);
+		clk_disable_unprepare(dsi->ahb_clk);
 		clk_disable_unprepare(dsi->grf_clk);
 		clk_disable_unprepare(dsi->pclk);
 		if (ret < 0)
@@ -1240,6 +1249,12 @@ static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
 		goto err_phy_cfg_clk;
 	}
 
+	ret = clk_prepare_enable(dsi->ahb_clk);
+	if (ret) {
+		DRM_DEV_ERROR(dsi->dev, "Failed to enable ahb_clk: %d\n", ret);
+		goto err_ahb_clk;
+	}
+
 	/* do soc-variant specific init */
 	if (dsi->cdata->dphy_rx_power_on) {
 		ret = dsi->cdata->dphy_rx_power_on(phy);
@@ -1269,6 +1284,8 @@ static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
 	return ret;
 
 err_pwr_on:
+	clk_disable_unprepare(dsi->ahb_clk);
+err_ahb_clk:
 	clk_disable_unprepare(dsi->phy_cfg_clk);
 err_phy_cfg_clk:
 	clk_disable_unprepare(dsi->grf_clk);
@@ -1296,6 +1313,7 @@ static int dw_mipi_dsi_dphy_power_off(struct phy *phy)
 			DRM_DEV_ERROR(dsi->dev, "hardware-specific phy shutdown failed: %d\n", ret);
 	}
 
+	clk_disable_unprepare(dsi->ahb_clk);
 	clk_disable_unprepare(dsi->grf_clk);
 	clk_disable_unprepare(dsi->pclk);
 
@@ -1429,6 +1447,13 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 		}
 	}
 
+	dsi->ahb_clk = devm_clk_get_optional(dev, "ahb");
+	if (IS_ERR(dsi->ahb_clk)) {
+		ret = PTR_ERR(dsi->ahb_clk);
+		DRM_DEV_ERROR(dev, "Unable to get ahb_clk: %d\n", ret);
+		return ret;
+	}
+
 	dsi->grf_regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(dsi->grf_regmap)) {
 		DRM_DEV_ERROR(dev, "Unable to get rockchip,grf\n");
-- 
2.43.2

