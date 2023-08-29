Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8778CAE9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7A810E46D;
	Tue, 29 Aug 2023 17:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6C10E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bcfe28909so599846066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329469; x=1693934269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bC2y7VdPt+gQZ4niYJX9yvKSEdfcPfq9HIkHksvZpA=;
 b=lGLyFsRElGEyypnxgJ4cyR1W3hhI3uGn2LWWryaunAyjg3zzlBD6lYgb2VqOuweM/f
 jlnz5i7MN9x/62/CizSh/qRJ01spkv2EsJ77tFZut26Fo98bA2BZM9KGCIcqTwcI09/C
 uTwZrqD2OQSi5QVBYAvRbYmwNOGPIZklud3uK6FoPPetpDm3970xygUGihojNpbHYfEm
 OmPprpzEjklTYdU2YsMhAoe8/6MBGrKa1SBgJG8bBNWlV5TmuOEQmp60a1Zx1g0ZOTJ2
 YZ59q4K1hQc1QSLkCN+4hVD9sOyL0gePkGu7LUVrYCVxB6Xnm8pkTBXN6sz2O3cNTiCT
 YdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329469; x=1693934269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bC2y7VdPt+gQZ4niYJX9yvKSEdfcPfq9HIkHksvZpA=;
 b=OeaV3Ega+LUdY6xQzB6KYb8s1NZITKSruleskbIa4MhvAwJ6cMRFAVINQ2cf70wH0r
 Ep82o06V4maw6mWVL1obnZMxPx5eAXJPLTIEuEU1l02Yacxy9u+ecNveSmTa9iZ6Dtzi
 /kUtDfcnBQsH/C3YVMvpFB4cEVwfjx5yLxrEQRgnIU+lmkppuTt+tX64ow3/3B2JqpKy
 UpiQfxVj2PAuysuLWJpYtrUlodYygG1+ODgizTa1XAIxTQJn1AX4gKwgPeTvcU89ZtIt
 bIVGYH4Z4bzUD2eVznKMflLiaukrKV2MSkuXdXi0yligeJSMk6ZrS8096lF7hdw1RISb
 C1nw==
X-Gm-Message-State: AOJu0YxwvCOUq/VZm4dQFhFDFIj0ejgoQo5jl+Zc8GGz8GQF6xVSVVi/
 mh1Vda5yXgDJmuTBHFyiWQ==
X-Google-Smtp-Source: AGHT+IHmXDVIaV6yhzoHdttsh1bCbntYH5kT5qx7a1c+aLWU6X2nsxuyymCHftiQpUNhOc4FPkF4/w==
X-Received: by 2002:a17:907:b11:b0:9a4:88af:b77 with SMTP id
 h17-20020a1709070b1100b009a488af0b77mr9110577ejl.60.1693329469044; 
 Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 25/31] ARM: dts: rockchip: Add spdif for RK3128
Date: Tue, 29 Aug 2023 19:16:41 +0200
Message-ID: <20230829171647.187787-26-knaerzche@gmail.com>
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

Add the S/PDIF block for RK3128 SoC.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 2339232ae2d7..874c97297c63 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -21,6 +21,20 @@ i2s_8ch: i2s@10200000 {
 		status = "disabled";
 	};
 
+	spdif: spdif@10204000 {
+		compatible = "rockchip,rk3128-spdif", "rockchip,rk3066-spdif";
+		reg = <0x10204000 0x1000>;
+		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SPDIF>, <&cru HCLK_SPDIF>;
+		clock-names = "mclk", "hclk";
+		dmas = <&pdma 13>;
+		dma-names = "tx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&spdif_tx>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2c3: i2c@2005e000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
 		reg = <0x2005e000 0x1000>;
-- 
2.42.0

