Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6378CAAE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B600B10E462;
	Tue, 29 Aug 2023 17:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C904910E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so599028466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329473; x=1693934273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS+cPFrn5V/oSL99Q2BbWTKIW7SUu4ItJIJ2pH0oI9I=;
 b=aSD4wG+1ZRnljM4CSIseFFCuF2Tv5IT8Wosx2+GepQr8oGYlYInqGm4jF10OVnDP0L
 BZIXogAsXeoecVaZXYJFSl9ArISaPcBdoOdP4jX1SDAxCtLv80kdnqgfxqejZkeVK8Dr
 1qSbdG5PVML8gIAK2mtsZlsFS3Ege/Q3pT+HLIPFg5AKuk49iKFo/GrUvhJ3w/rJ3vlb
 Tuh6inFRswC+h53iRgRJPjrJBeB7t+T3ZE6ijXz9T3eyepS6VUDenDiDDy0ImCUkwaN0
 8NEopfwb0O7l/QZ5RY84W3ft6aPTskb0Vl5+uIVtchApO7uOjs/JBm8Gs9uexal5+0xq
 TWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329473; x=1693934273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS+cPFrn5V/oSL99Q2BbWTKIW7SUu4ItJIJ2pH0oI9I=;
 b=THueX6N9NT+hOaImEcurU2VIdCZW+y+gvNLUn6+9ay30RGv4UuBrBq+/TEz974ZArk
 KECBVIHQ+8fOP3eKmh6TZonYQTO2wb04EP6iLQrYR6b8G9sJejBWo8uwE0KQIBtJSUyQ
 nNIo4stiKePP1UWtsh1oU0l4mYcBD1br4psIczPR/opHkjh9oMS5w658ThXi2qrPapx1
 Dux1BXTxY4pXIX8H0SmHqfnRCKiYdgOOCf1d1Mo8yfJm73w96Ev9bd/+mVJmPAQNQ8N3
 q7gxpjqi0r9oI49CDZAR33pJCsFHgdpEn4zdN+3mRkU9NfEPAxrjiawjH0NHEKDwbVA7
 qB4Q==
X-Gm-Message-State: AOJu0YyIcVax6pFSdch7gXjAOSlMSyUsWuF8WZ276KJ+padIv0PP0qeA
 WbA/hZQb5R2voZENLDNzig==
X-Google-Smtp-Source: AGHT+IGcrzem3XmHh2sQJCxUgf3Dq9aCyWk4H3R61SzzGzQKcWYq2aZscEw/gTmdQ+TjCJfx6SK5jg==
X-Received: by 2002:a17:906:3018:b0:99c:ad52:b00 with SMTP id
 24-20020a170906301800b0099cad520b00mr20752169ejz.6.1693329473271; 
 Tue, 29 Aug 2023 10:17:53 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 29/31] ARM: dts: rockchip: Make usbphy the parent of
 SCLK_USB480M for RK312x
Date: Tue, 29 Aug 2023 19:16:45 +0200
Message-ID: <20230829171647.187787-30-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without setting the parent for SCLK_USB480M the clock will use xin24m as
it's default parent. While this is generally not an issue for the usb
blocks to work, but the clock driver will "think" it runs at 24 MHz.
That becomes an issue for RK312x since SCLK_USB480M can be a parent for
other HW blocks (users of mux_pll_src_5plls_p) but they never will choose
this clock as their parent, because it runs at OSC frequency.

This sets usb480m_phy as SCLK_USB480M's parent, which now runs and outputs
the expected frequency of 480 MHz and the other blocks can choose
SCLK_USB480M as their parent if needed.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index b13957d55500..19bd6448d122 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -293,6 +293,8 @@ usb_host_ehci: usb@101c0000 {
 		reg = <0x101c0000 0x20000>;
 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST2>;
+		assigned-clocks = <&cru SCLK_USB480M>;
+		assigned-clock-parents = <&usb2phy>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -303,6 +305,8 @@ usb_host_ohci: usb@101e0000 {
 		reg = <0x101e0000 0x20000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST2>;
+		assigned-clocks = <&cru SCLK_USB480M>;
+		assigned-clock-parents = <&usb2phy>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
-- 
2.42.0

