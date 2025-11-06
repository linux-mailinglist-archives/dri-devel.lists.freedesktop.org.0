Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C83C3D083
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764AB10E9A4;
	Thu,  6 Nov 2025 18:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FiaMkmQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C34F10E9A5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:11:42 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-656b0bd47b8so339569eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762452701; x=1763057501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTvSrRIoFUcQoZC4cTRmqWQzhHQETi5HQX0+94VQOzE=;
 b=FiaMkmQvZ2aQeYMrsEU/NON3bbdklex5BQgPGMC+fKaOIgNmNKq0eNuosNXEPAyf2O
 ETEpJBXxMxtAeST5SkjqnwdyigKule/C5dprwuCGndfV1bUQPSoOVvIrIrMoNovXsav2
 ZccwzNah42mOGRcQyEW4GiYIDctYGU7Y0exJj0zpqPExH23NbCmoWwEo7BS5MQmc7+yi
 ax1fn5ZwYthi7v3cR5ZgYSDi0CEEl1+d93BBG/gneN/H2HF+igZd17EtH7z4vRlkjvP2
 gTxPVuV/rjxQusQcCphqzJmngpJtkdUWIVqTi5O+bOu2+E7AlKPispOGeTHK2NyWHR6S
 S5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762452701; x=1763057501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nTvSrRIoFUcQoZC4cTRmqWQzhHQETi5HQX0+94VQOzE=;
 b=KjwBaEl7K65ifERsccjpzDGTd40OhhhA+lACne2muql3OOehq9QFwc4G2WTv3xNehd
 Ljk9TsAbwu/LerxsV2KKGOZMFvRLKFbRPKPabO/W9JrhC6XTXPfcIDC69fTRSilakOWo
 GRiOJvu3vn561z34NiOnsUwdaikf7xl41cjYVgnGvopv5CwmK1qImRAm4ryb9H60YvWp
 Gl4qpYB8qJf+E6HYLHLZcjGzUTc4G/hx5c7jl5k2dtMbWl7ErhugVmz89p/gh7vW+v/w
 IFSeXUh0ulhu1GFsxf6VLfGoykxbdNe9fIR47lDZc0Fp4Mpzy5TTHfyzIk+3jLjUeEtm
 GQMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuuibeBv2E86w3a/v4rq/EEBo+Vmjo2BixAwErhVsuZ3wxRATkjR8h/ve5diwbEN94RTuJutUzefE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGrPtmQJxfg6uIB9oo9AD6ohCol0tmvGoPJUQdFo+2ln6JlzMH
 BGq7io8BqrolRDEvEgGmj7u3P804pxcQakNGgY0YEvc0aPx3opTSXtp+
X-Gm-Gg: ASbGncvd78AE8dem9mrJA1qGW0tXnuI0fUf2Sl1vqHrKrTJmoQf2Mm6yH8KN042jXrX
 VbEAriOfApAaWz4U02QIRC7tvGrX0FWYLqLfna93EnuCf4imnVFMD6wdx23L54ITWjEwqhJyt2s
 yxXZ/LVO5G3H5b03fqQ2RI9aUFfWNcxVWe1FoKabgexwbdZuYr1NaPgbvnux6u7aphWKVGX9JQm
 AhjHHv1rV8zEpTuaBphJdpuxy8Hr5n6Jl5gis3sfN1tCIT9LptU/mjlSJaj9qNwIYJzz/gYTtQv
 uLux4qb1xIi6sDIvHWmiOuAU8fTq8n3dnJO5H5wx/DdCK2E7KsgPQerRYFG+2T3RgqJvcjINCdb
 9KUz23K8u9JYBdL0bN60U+LZE5rZ40BU5NAGXrgMgJYPolJo5V/T/A4HbHyH0dz5awYBD0VjfCo
 BBQghJIC+ALohmWSwTEbs=
X-Google-Smtp-Source: AGHT+IEfuV69CL6SVcZpapKEvHBs4toFoMM6EFJyVvrWMOaDwcUJHXd4zzkXKqfcYAZxWxaA5cWcnw==
X-Received: by 2002:a05:6871:2b22:b0:3e1:1de:9c0d with SMTP id
 586e51a60fabf-3e41e49bdefmr305404fac.17.1762452700826; 
 Thu, 06 Nov 2025 10:11:40 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:41f9:c9d3:db30:c36a])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e41ed0aa06sm137739fac.8.2025.11.06.10.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 10:11:40 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, rfoss@kernel.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, andy.yan@rock-chips.com, heiko@sntech.de,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add HDMI to Gameforce Ace
Date: Thu,  6 Nov 2025 12:09:14 -0600
Message-ID: <20251106180914.768502-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106180914.768502-1-macroalpha82@gmail.com>
References: <20251106180914.768502-1-macroalpha82@gmail.com>
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
no_hpd to poll for connected devices.

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

