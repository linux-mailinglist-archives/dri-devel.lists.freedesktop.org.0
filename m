Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4F8BD59B
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CF910FFC9;
	Mon,  6 May 2024 19:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iB6M7dfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2921310FE9C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:05 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso586119066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024643; x=1715629443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oPo30HLErisAcogmRAQBmaHjRdsPf6mxSQ2qeztK2Sw=;
 b=iB6M7dfWWrpjSudXxrgyBCrJmyCdgAiNa4Vywj+HlK5bfqn1wHhzoz1H6EA06JoRdz
 rnPuRfnwpe7rKz8U42ZCRqg0L/y7TAP5ubJktfcGcTbjoJ1ZPFQi5tQ7KdWgKb6J22Cc
 tqAbvanhsP6RQKuQI8cyQ46p1f/Mh+3KfWSyjGchF6UQ8W9pkf/OhG7Jgh3X3xy9gEfo
 e+M786QQC21mHBLAJzy2orCgnG3z09wsceOrvoZtCNLT/SbSWmAwz/wqJWYn1XSqDlJd
 k85PnbUtzadmMOFZ3z7V4O0IMWlUc6Q8F+gmZz9oZVc/kmBJO9XMmtm/fTpgdlH7sB/5
 QGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024643; x=1715629443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oPo30HLErisAcogmRAQBmaHjRdsPf6mxSQ2qeztK2Sw=;
 b=YPeEu7I3uk7iZYDl3KxMPDDIWVe9V6zy+MG8Djb8OG/ClvV0txtQbe9BxYoFJb8v87
 xYJaZjRAi6l8IsujwqqkUXDpcpSQUIa2JUaoWZ7adc8bTRwonFysGJho+bBrZLZtxmq7
 7VMgBQQq9gVDQzS8/rszL36vrp4oLQlL2kJ8H+/IZEB7C36QvD+2TjpbYgXcCGVDoNWP
 0PcPWbJDH0ZYj1m2Ajd443tqzCyPof+wvLpS6MJ+rKIUSd3oH1+/koXCSiEPP4zfQAoV
 k6HIk/IJoCZfmX6wIEdk8DI8b8DHqLUGeYN5BkmT2cYjZFjFEKR+PHltsIlcEykv0K8j
 PYGw==
X-Gm-Message-State: AOJu0YxLEqRl73PLDRTJkzUAo+6djYizn6TlAPXghN4mBlvguTzwVau9
 Js2lwYsPrZJm0UIcT99420WFldYznUia8d2a0hdvMYIPPO6bTtw=
X-Google-Smtp-Source: AGHT+IHSrrVeS/vienMxLpjAA24SO1Al2k+NRtJh5keVZVgcxbiYBpQB1pEWoo3HKzaMNkd68QRWQw==
X-Received: by 2002:a17:907:97d2:b0:a59:c9ad:bd26 with SMTP id
 js18-20020a17090797d200b00a59c9adbd26mr2965779ejc.12.1715024643508; 
 Mon, 06 May 2024 12:44:03 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:44:03 -0700 (PDT)
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
Subject: [PATCH 7/7] ARM: dts: rockchip: Add DSI for RK3128
Date: Mon,  6 May 2024 21:43:42 +0200
Message-ID: <20240506194343.282119-8-knaerzche@gmail.com>
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

Add the Designware MIPI DSI controller and it's port nodes.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index d16a9d03ba2b..93885338a80b 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -276,6 +276,42 @@ vop_out_hdmi: endpoint@0 {
 				reg = <0>;
 				remote-endpoint = <&hdmi_in_vop>;
 			};
+
+			vop_out_dsi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dsi_in_vop>;
+			};
+		};
+	};
+
+	dsi: dsi@10110000 {
+		compatible = "rockchip,rk3128-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x10110000 0x4000>;
+		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_MIPI>;
+		clock-names = "pclk";
+		phys = <&dphy>;
+		phy-names = "dphy";
+		resets = <&cru SRST_VIO_MIPI_DSI>;
+		reset-names = "apb";
+		rockchip,grf = <&grf>;
+		power-domains = <&power RK3128_PD_VIO>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dsi_in: port@0 {
+				reg = <0>;
+				dsi_in_vop: endpoint {
+					remote-endpoint = <&vop_out_dsi>;
+				};
+			};
+
+			dsi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.43.2

