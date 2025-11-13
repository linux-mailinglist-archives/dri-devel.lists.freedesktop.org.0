Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8C9C59C12
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F23110E927;
	Thu, 13 Nov 2025 19:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SvzuELe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BC910E927
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:32:14 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7c28ff7a42eso471818a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763062334; x=1763667134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXmVFPMQ40Hruy/E9zAx+RGPm4uKA5BjVJYa0KPmt0c=;
 b=SvzuELe62CVOduZeSjFo4L4DsFa2mt5VurJ+2G/Q7PJM2hMP8XHUvvvMpjbN1K7LLb
 GQ7uoZ8K0NCCL2ZAQZDd1l3rsskWKK1rhReWrvYygbxdtPltAy0xRZ+loj9x4bO2lr0h
 PNABmBrYgdkemHoQCBxnlq8qs1kFhCNRsUYf7RGCRA27XkvKdomezEjZKXenMlttaFra
 RyKsgNPR/UjXVsQKnh+2oR1aLWngoJLvsZWbd36PIfA6gqpaFWeh9UjXGw4WdcyftWGE
 aGTYA66hZx9Ir3lAArUiiZwvk94lSKrNTdgUzH+fFUYnt6eD7x8zNtniJNXcAUX8KDMA
 1ugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763062334; x=1763667134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IXmVFPMQ40Hruy/E9zAx+RGPm4uKA5BjVJYa0KPmt0c=;
 b=aMbIAQOrFtJ7qWiM5vKTmZMu6lCqA6/YYbRFYbGZT3Acdx7NpGMFgKosnqjutllJpy
 Rd4zIZ+ZR6lyw0aVsEfo9cT/CVsU4lY0ea2j7hl64OSTveiYMD9tL+S4ESI3GCBOM+W0
 k3335o1IFbo+foRxcqB7RtRYeKiq+81B9DX06feXbBWmMWdyPd5ztKOA70laGW0sd6hn
 Hv+kLq0GxXHE2A8OH+LgWRNEjLQUs1oQDhhtlfWyTRX35eyzs8xRWzrEaSWMHgA2vnoh
 Qtv5ubd5NIgoHgZano8BvjvtvItofQ1YwK7hKREcSQ1HhObId6pN8H4EFbrBRZaBKKDv
 eaNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtq9IIvjFguzJyKrT2//PHToDSXsoRMLJt+fmC38o8Q7Cvoor9Y04uYXnsC3OfcLNJCFGJcZGWPQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwW8ciMp9hP9FD/DRwtkLaZApAO7trVdGMBOqc7PalbSKMmogB
 3Hj4tRsJ1itYEvaMWCtcbUgpNt15Ao088Ytqii/QfgF4cmA0+xCR+akT
X-Gm-Gg: ASbGnctMfMyQwoGBeYufQr+vInSIxTLsNVlew3JpsPxE/tH9VOisaOp+2HZgTbq3Fan
 Mo3M/eFIpHfOjADevlV8mqIn1gC95ptqKUK1fsg3trgAuq9D74nvgvuDO4M/b5Un1lXjndAbOzK
 +AdD5mZO3Z5knqYfFQdaN+hiRiR58/V1GS6eUDF7TKcqGkK/b8FUeI6A+POeedsWmRL5aB6zq2q
 jA7NbTtG8cNhKjXByF+LnY7JFZobNaWJCZ/XSIp8SmG29fNi9lxlQDeCYTuQHm5vFBg4cqXwSRG
 tcYUAMC6u2wiPQngTHDDGhZbSXraV/6pulmHvSpCneugRf4RVZNqfRfV9/5MqfyR+cftQ+lOtzu
 WF9bgxMJ/6jV45KBpOA4W7IW5S+c0DF53QtAbBgdlPSl637/iVefs9QjXi20XyVnGYyKTdaw3gx
 Ht7+4rQXHo
X-Google-Smtp-Source: AGHT+IGfs1HSOKgCkHh3+23cdx5vycxiMAoNuzjFkoYhUV+ov5/IFKg29WJ9qWAyfuSrgzsn2nyxJw==
X-Received: by 2002:a05:6830:660a:b0:7c7:1c77:f107 with SMTP id
 46e09a7af769-7c74455a378mr562121a34.34.1763062333910; 
 Thu, 13 Nov 2025 11:32:13 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c73a392fa5sm1693527a34.19.2025.11.13.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 11:32:12 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 heiko@sntech.de, sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add HDMI to Gameforce Ace
Date: Thu, 13 Nov 2025 13:29:39 -0600
Message-ID: <20251113192939.30031-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113192939.30031-1-macroalpha82@gmail.com>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the HDMI port for the Gameforce Ace. The HDMI port
has no HPD pin present (the manufacturer's devicetree states the pin
is reused for an additional face button) so add the attribute of
no-hpd to poll for connected devices.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3588s-gameforce-ace.dts    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index f5894672fcbd..b98e1a3369dc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -300,6 +300,20 @@ amp_headphone: headphone-amplifier {
 		sound-name-prefix = "Headphones Amplifier";
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		ddc-en-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&hdmi0_en>;
+		pinctrl-names = "default";
+		type = "d";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	pwm_fan: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
@@ -498,6 +512,34 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi0 {
+	no-hpd;
+	pinctrl-0 = <&hdmim0_tx0_cec>, <&hdmim0_tx0_scl>,
+		    <&hdmim0_tx0_sda>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
 	pinctrl-names = "default";
@@ -746,6 +788,10 @@ &i2s0_sdi0
 	status = "okay";
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
 &mipidcphy0 {
 	status = "okay";
 };
@@ -842,6 +888,13 @@ charger_int_h: charger-int-h {
 		};
 	};
 
+	hdmi {
+		hdmi0_en: hdmi0-en {
+			rockchip,pins =
+				<4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins =
@@ -1416,6 +1469,16 @@ &vop_mmu {
 	status = "okay";
 };
 
+&vp0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
+
 &vp3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.43.0

