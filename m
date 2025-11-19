Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DAC71660
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DBB10E6A7;
	Wed, 19 Nov 2025 22:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bpOBJT1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A993C10E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 22:57:58 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-3e2d1477b9cso138381fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763593078; x=1764197878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXmVFPMQ40Hruy/E9zAx+RGPm4uKA5BjVJYa0KPmt0c=;
 b=bpOBJT1BZTWQOBgZK5+qzZf1wrEMjY1Lysit1kRParxhWru3uEWsV9UNivFkP/mH1t
 5GXicFRhvTy0sMI1h9dSnw4dCgG7kFQ9L8PEu23QZm85KFIMFZBIcA6pJCMbNVronCcr
 k/8/W86wQvmnPjcEk40LqjaqRmGJd+MT+Lt0pbXn5XL32AVVXLPmPxgXzYs2HOvzo3Hf
 9gZPD2CKS+ZgkCxQWVIwh4oEEjfT2XlLLkLwpLsevnMe3YpHUZ3GR8vRij1GO1HnMKlT
 NvVBoJECBhcveMhhTvdaDM7uTEMUuKCLqybJLM90ZeXMBPT2IBXZCU7Ri1qWDj//9nHD
 rq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763593078; x=1764197878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IXmVFPMQ40Hruy/E9zAx+RGPm4uKA5BjVJYa0KPmt0c=;
 b=lVtqPxMoOgaWdu/PWpOc0eH4dBLWA78a+m8v6kYaP1SagXxYxxDk0HME2LV86kiSZh
 Setshq/fbNxcxq4WyGIdcUb4fpu2smTupx+ml/AVQr2rTTIkvm1xQ3xdTeqGr+bWGBJh
 NDSdQXgfX3KuI8Ju5sqG2cPBDF4FGWYrq7Udx0iTofK/JIE12zkbTFfaZRhxVBOSiRDs
 AF/XhzSQWz35oWLJk502XgePag7uBWCzwZmBwUOPEusFuyXI8m9fLIPgunMCoxBRuLz4
 RdP3yfc3fa3Art7vuerGC5H0r9Of+bDWTN4WL9IPBtitRYLnB9YUe4RKqJk4ayf5nIWP
 xheQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0aP/C9c6h8OiBs/N9emiO+OOu1H3q44FplgmyxLhbYOkMHhA3KRx0lksa+Lu9xE9OHHqJdUTEas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPQ6IFxdw7go6zzGWUAc25Tnfh4bLjdAQ9xTeopQqwmXLd+x50
 9fTNRALq11/X9IlVL/vSV4Y8NOkApctNEDIY2i3nGJwy9HpLXPYld0zi
X-Gm-Gg: ASbGncsVr+kNrJjTKCols5LVxxHHCeK7wW3oHz4U44IzvxsB7u8c7keN5zGMgID6jF8
 TBBfBb2afPAifCkUCTpTRt3AynnnJW+MrA3XFck1l5YnX0wDFLweH4UCWoDBqELZrQFOC4kHtGB
 ID+5cbF8LdzGUuW/PEWvPB3dXLFoRAQh6ZhF5wRtIUR9zhuXgQp7SsnCTKmBe2+7Lg6Kx8bWTvz
 IzBJ1Pk0FfR2q01tqA0E4WMrv7ZHNipSK6CLAoMC8gc9VYfMP3iULc33ChsZ4rpjbVaH1cbab0v
 2s4hdug46sMtfgyd2k2qlGSN7pM10ObK9Hm8mBUt2UBf4FtZfTYZl/gYIie7zHMlq7OAW4NbDye
 T1foFe7eDF3n93Y/rRq3nhcmLj0D2AEdMKzfq/3okY6TgjAqwMb+xfgNDvVTD9hFV2VSd72c6jU
 v4FRpD0UIR7vFM5TZzZsI=
X-Google-Smtp-Source: AGHT+IEtt8X7i3eTJjeg5rMzfEF6Ri0+tEQiTgyoMB1/D5iNSgiCmp83clMkoOMZdVS/lRECHQLviA==
X-Received: by 2002:a05:6808:152a:b0:43f:5b3e:11f4 with SMTP id
 5614622812f47-450ff34a912mr511966b6e.43.1763593077894; 
 Wed, 19 Nov 2025 14:57:57 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ec9dcfe28csm346496fac.22.2025.11.19.14.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 14:57:57 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, cristian.ciocaltea@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 3/3] arm64: dts: rockchip: Add HDMI to Gameforce Ace
Date: Wed, 19 Nov 2025 16:55:26 -0600
Message-ID: <20251119225526.70588-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119225526.70588-1-macroalpha82@gmail.com>
References: <20251119225526.70588-1-macroalpha82@gmail.com>
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

