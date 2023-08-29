Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E929578CAB0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4291910E464;
	Tue, 29 Aug 2023 17:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64E710E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:47 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so1520198a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329466; x=1693934266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdMp6yGV0P8L7/q8hhpBp7fZJs0P4HxP+xmd/dBUTF0=;
 b=GYmvvj1sFbTTtXbgXqrMaNH/aVAjfAntStRnN8asGz3V+cm1HEbxj7u/duVBcmdQ7Z
 GNd7XfGs74mOUm0PhC/djA+EPK+tWkvMkKamr+St+za05bKr8bU0eS8swyvP+xes04mz
 ODLNqhrP16gRGQynCESNaYqSdtnbj9UtlI3F9WdnhnJ6kX5vRPnFZ6LCvlHVP4zZ24qo
 jfwQv0P8xQJc/f4YjkAeZ21XnUlwK2+r1Kdm5FJbZvHJ4Kw92VSP4SYL09kbYoJDJHvA
 +4vQ0JzfKeGtMTsrHcFKKviELI0MjPux56ean5Tw6J8K1AiRzuDuLKJ870CbIm0TbhMi
 wjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329466; x=1693934266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cdMp6yGV0P8L7/q8hhpBp7fZJs0P4HxP+xmd/dBUTF0=;
 b=Hd9+3lqo5xi1RCGa7rf0+w54efNrAy5E1ysPZQKssWgnF64i+4xMmFcWMaNOe/58Q+
 XcU58EOOusfiX7uwNwI2Eo9zBfE6L16pBUUP1MvtWV4o/eAApd15MwaLZq4fb9i5fV8J
 R6XUQI0vBzohSq7Y/Iy/kG14HyxzZGxWHWuO/c/BTeUybN8Cc8jmy8kEwkz4n94kV8Lk
 IcUzbE5bIFDAHH9fsSxwsmFedbYI2B9VL8WQmFXcmGG0P3co2OPcrJSYfwRtBU3dMUKy
 n/hWlb9lfSrNlzCRpGMnrByCKHFZ17nvKhMa2snsZXJ/atYCVBSYLSo1TZM3FLLSQ4j7
 d+eg==
X-Gm-Message-State: AOJu0YxaYN3RU59W4b+92strS67Npstth9f/wEx+dgPGq3fUjohD+3P1
 2y2QxIlVgNW1S07dYZ075w==
X-Google-Smtp-Source: AGHT+IEIEIVr9GVv8wcpcAh/4P6h2oRMoRbIhTVOy6XqNU2N3y4y6OKPBaGl1PKVnou0mSNTBc9qkA==
X-Received: by 2002:a17:906:cc50:b0:9a2:143e:a062 with SMTP id
 mm16-20020a170906cc5000b009a2143ea062mr11375776ejb.49.1693329466159; 
 Tue, 29 Aug 2023 10:17:46 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:45 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 22/31] ARM: dts: rockchip: Add GPU node for RK312x
Date: Tue, 29 Aug 2023 19:16:38 +0200
Message-ID: <20230829171647.187787-23-knaerzche@gmail.com>
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

RK312x SoCs have Mali400 MP2 GPU.
Add the respective device tree node and the correspondending opp-table.

The frequencies and voltages have been taken from downstream kernel and
work fine for both RK3126 and RK3128.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 617306a9edf7..024d801a9792 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -101,6 +101,27 @@ opp-1200000000 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <975000 975000 1250000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <1250000 1250000 1250000>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
@@ -131,6 +152,29 @@ smp-sram@0 {
 		};
 	};
 
+	gpu: gpu@10090000 {
+		compatible = "rockchip,rk3128-mali", "arm,mali-400";
+		reg = <0x10090000 0x10000>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp",
+				  "gpmmu",
+				  "pp0",
+				  "ppmmu0",
+				  "pp1",
+				  "ppmmu1";
+		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
+		clock-names = "bus", "core";
+		power-domains = <&power RK3128_PD_GPU>;
+		resets = <&cru SRST_GPU>;
+		operating-points-v2 = <&gpu_opp_table>;
+		status = "disabled";
+	};
+
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
-- 
2.42.0

