Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4C818D4F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E710E4FB;
	Tue, 19 Dec 2023 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D530910E4D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d13e4f7abso29708135e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005293; x=1703610093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=824x2Bpa+BljPPIuTHpPefnYLDXHrvCUJjy6fbKwCl4=;
 b=ZyDbLRbZjTYMrYXzSytKFv4nKZACSmH2CbEGrk7n5yel4b1yDUFzzNB17tGy+/lRlq
 rLG98GglQH9gAKos7YGn2y69DYzZV7i74TiazgRLaG5Mg0FbWRp00lvLlc6mUycq6M+K
 uxxGF+cTwtYzvXlX2FJuhES2wFU+MXUIii9d3yuwaVtyqgaqYF3oFuT1cYuxnmDRcgeu
 QOfYjaFtN0LrsLKYhklOWq2GLIwQ3qf1ASGZXJiMnuDPJF64+7QNsFZq7gwNlB1mmhio
 AWUbSp22OVjtOg5ZxZawfFC0FCdr1qDf3DTqGtsKUNzL6uc7yRanNfpdC55tgw0jckyo
 qJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005293; x=1703610093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=824x2Bpa+BljPPIuTHpPefnYLDXHrvCUJjy6fbKwCl4=;
 b=D3vSFHZVH0VNqdR0OX483y047lBQInAeveOvoUCQgOMCooTeaZEGDMe02qWmQzOUJP
 vFBhree//zPi15HYOmpMqNAjveGj/gY7FDQcHbtypdf6LT5mlzMUor3Boz3iW0klnKmp
 I1JD1xqmdgP2d8RM8aYkk/DCqFoynFH+ggc05/O4kR6A45dUhfVWAG4Y/iGsc2Vj3yYG
 6Nb8jVrrEosmZF1wbcNzwAWOAFdzki987os0Nr07HPwAYwa7uPgC6OAIhUoI33s5qNZ4
 lJrL/L84Rq0C36D+dRsb6NjImxkuCgpSfHK9+JOBamuZGwmUevtFj07l9R+uOqIl2gBT
 HXiQ==
X-Gm-Message-State: AOJu0Yz8bgxA4WkKkANw4KuohkMuo2Hwf3r8KRaEjXWx9+XHuJ+OSerr
 Yry7UjWBnaD7x1XkbCobRA==
X-Google-Smtp-Source: AGHT+IHgcqfEoRYVHjhmsr69xyQlznMp/1EOCdyz0OLbPaZ9r38nDcrP4sBWbdQwF4XoayjoM4b1fw==
X-Received: by 2002:a05:600c:4c8a:b0:40c:d3a:2447 with SMTP id
 g10-20020a05600c4c8a00b0040c0d3a2447mr11436802wmp.87.1703005293173; 
 Tue, 19 Dec 2023 09:01:33 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:32 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 28/29] ARM: dts: rockchip: Add HDMI node for RK3128
Date: Tue, 19 Dec 2023 18:00:58 +0100
Message-ID: <20231219170100.188800-29-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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

