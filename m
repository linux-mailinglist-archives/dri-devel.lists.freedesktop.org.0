Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102308BD59D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706471120D3;
	Mon,  6 May 2024 19:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M4upBpeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657E710FE9C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:04 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso380254466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024643; x=1715629443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEUTDPQIQ4fyK+f9Y09kmkHPYR/zl3Q/hqRXE0mT1cg=;
 b=M4upBpeOEesCtKJFWb7bScssAU45GAFxlEWGCXwvRlxbwShYDvxXPW/lIDh7j0xMcK
 sWpmUMKM47hYtixFpMFemhK0gmGG5kr2iYqHvDfYxoh2S963JNMN6HyblZ1DiktQSmyT
 m2qrOtMB4rVmTkz2+2E86TQs8+FCzSKEFsUZxN5YTYENfL9tKZctrrumLbVGYeL9Wozf
 7HZiu53zOJEQBXsdC6k4vNOtalVVAGYzx8YdGtrix5fd+SB/ftjRCrA5mK8YfmHiLJjo
 88djcJFJNVMsi7mHsRcgNLgIT8iMeHEeG6Tu/fnkm2kvvH3rViOATrNc7+viAt+wJZmi
 wLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024643; x=1715629443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEUTDPQIQ4fyK+f9Y09kmkHPYR/zl3Q/hqRXE0mT1cg=;
 b=Ix9FeEaiu8+Z7zQPZYKoslfySvZGN6TI2PnW/Y3YD62hgVpgt60a6r7/8rkGn4tZ/M
 1ODd8okwRXhF8F/wpgilNOTV+/5mZoK4RyAV+WzeiWZdmXhBzzIiH2yjqIHc83127OoM
 lXgdmgmPzrXZl+fyseJcUTwARAMsJZsMWdrG2/EAJ3J5uVF7gKgzH3HkOnyw/5aH+nuY
 j5vJcna3xc8mBzQZFEzNPvl0uHrTUlDg3v9H5B+AiOKIgxYQnjUzx6vtJr3OltOT5Hni
 qRE1oKdolaysFH/aD70iY4EpzPZLiXeNzyWbaxdQea9/CnZ+2X3XYPTNgAr6vuWOF32S
 zXmw==
X-Gm-Message-State: AOJu0Yy/jQe2vdkNaN9VoUQOYgzJwztGRSaer+rTHLRBfsP+324IIqkd
 9cy5JPa7/UjS0njCNQshcEv22TmckY6njPZ1MqtjEqvZxQLIbPY=
X-Google-Smtp-Source: AGHT+IHbkPsuTTfkRPHSR+oNWlUo2rEkFOv/8jNjCTm2kYGpQR0wP36J0oX9tZl1Xf2xBVWgIuha0g==
X-Received: by 2002:a17:907:908f:b0:a59:9edf:14b6 with SMTP id
 ge15-20020a170907908f00b00a599edf14b6mr5458036ejb.45.1715024642757; 
 Mon, 06 May 2024 12:44:02 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:44:02 -0700 (PDT)
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
Subject: [PATCH 6/7] ARM: dts: rockchip: Add DPHY for RK3128
Date: Mon,  6 May 2024 21:43:41 +0200
Message-ID: <20240506194343.282119-7-knaerzche@gmail.com>
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

The InnoSilicon DPHY found in RK3128 SoCs supports DSI/LVDS/TTL with a
maximum transfer rate of 1 Gbps per lane. While at it also add the newly
exported PCLK_MIPIPHY clock id to RK3128_PD_VIO powerdomain as the phy is
part of it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index fb98873fd94e..d16a9d03ba2b 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -216,6 +216,7 @@ power-domain@RK3128_PD_VIO {
 					 <&cru ACLK_LCDC0>,
 					 <&cru HCLK_LCDC0>,
 					 <&cru PCLK_MIPI>,
+					 <&cru PCLK_MIPIPHY>,
 					 <&cru ACLK_RGA>,
 					 <&cru HCLK_RGA>,
 					 <&cru ACLK_VIO0>,
@@ -496,6 +497,18 @@ hdmi_out: port@1 {
 		};
 	};
 
+	dphy: phy@20038000 {
+		compatible = "rockchip,rk3128-dsi-dphy";
+		reg = <0x20038000 0x4000>;
+		clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPIPHY>;
+		clock-names = "ref", "pclk";
+		resets = <&cru SRST_MIPIPHY_P>;
+		reset-names = "apb";
+		power-domains = <&power RK3128_PD_VIO>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	timer0: timer@20044000 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044000 0x20>;
-- 
2.43.2

