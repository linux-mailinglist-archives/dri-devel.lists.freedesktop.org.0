Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD081CDDC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0B10E86C;
	Fri, 22 Dec 2023 17:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6C10E855
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d490a1936so5922075e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266962; x=1703871762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRLz1zrBuFNm0Af22mx0D2/7q2j0Q/CWyrbrvtrtVPY=;
 b=AK/suBumAD00ckFNRZMyIlxxLnRKD0eMb4BmeyGuDvzYkEhkh987/AcUdxqK1B86zu
 JEf8rkgXUcXJzb1sDIfswTbmaHatpFi3UeKTY0KDiLp+xCv65k94g9EDQ8DdftOI4Xx5
 sPx7OMyM8YYSRi2jYquMD4iWt+vKR0kfJw1wCiREKKgEQK8JrCtqj/kbrXqUR2J7RtXe
 eTbD+G+L46eDgtkwNHnkqc6lstlfCAdee4DlaV4vsbFUpjNkrdsM0YUnPe9Ga13n5shU
 pz4Nw/WnHHCwOpPnzTaH7TI3+BX2Hj2/SThhGOy7dKooq6P1R0RXcc4Vs2auM8CHd1ZF
 FoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266962; x=1703871762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRLz1zrBuFNm0Af22mx0D2/7q2j0Q/CWyrbrvtrtVPY=;
 b=VlEKXsyRXFJAkLwgy/VfWhj+X2WksojQd+GEkWSbUWPCS0i27y9u305c2U3mPhP67T
 XgENuYxKUS+HjZ8aoEmx7KK19icjy7M0rgPcpgWZjkht44f6yt+mswL4vHVO2RPJAw4D
 YD+JpKf/7AXCYM1FvtElDj6HpPMFvsNMaSzpD/8Qq9LDW8FRuwxd2l1q05YVp+y2Sesx
 C1RZjPfkAettQE6qUQZjMwkHGwj4F8cgYat5F+Dg14sQhXuTDnCzQyL3YqxgesSpLopZ
 FmcMk3CS0OIAaWCIAzXUANgAc7CwtT0SxOnhhOSTd+4BLI2Jv9zIxYPXIDoEQoLOU8XI
 Kf6g==
X-Gm-Message-State: AOJu0Yz/c5vZ4EqpcZcRxcrYfH74j88Mooch8M0Y09SSUOYm1mMwzHCl
 uMxWoHBsi22ZUgEndw5kDg==
X-Google-Smtp-Source: AGHT+IEHpUVIRCbHP3AshFALoArBl6E2zYs7rd6xJQGGfnJ//3nhB9bjJ/XDbpPL3zjGmIJ8dwji1w==
X-Received: by 2002:a05:600c:a02:b0:40d:3868:6b85 with SMTP id
 z2-20020a05600c0a0200b0040d38686b85mr544367wmp.198.1703266962256; 
 Fri, 22 Dec 2023 09:42:42 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:41 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 28/29] ARM: dts: rockchip: Add HDMI node for RK3128
Date: Fri, 22 Dec 2023 18:42:19 +0100
Message-ID: <20231222174220.55249-29-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RK3128 has Innosilicon based HDMI TX controller similar to the one found in
RK3036.
Add it and the respective port nodes to the SoC device tree.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - no changes

changes in v3:
 - no changes

changes in v4:
 - none

 arch/arm/boot/dts/rockchip/rk3128.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 1a3bc8b2bc6e..fb98873fd94e 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -270,6 +270,11 @@ vop: vop@1010e000 {
 		vop_out: port {
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			vop_out_hdmi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_in_vop>;
+			};
 		};
 	};
 
@@ -463,6 +468,34 @@ usb2phy_otg: otg-port {
 		};
 	};
 
+	hdmi: hdmi@20034000 {
+		compatible = "rockchip,rk3128-inno-hdmi";
+		reg = <0x20034000 0x4000>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_HDMI>, <&cru DCLK_VOP>;
+		clock-names = "pclk", "ref";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmii2c_xfer &hdmi_hpd &hdmi_cec>;
+		power-domains = <&power RK3128_PD_VIO>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+				hdmi_in_vop: endpoint {
+					remote-endpoint = <&vop_out_hdmi>;
+				};
+			};
+
+			hdmi_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	timer0: timer@20044000 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044000 0x20>;
-- 
2.43.0

