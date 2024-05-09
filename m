Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2346B8C0F3C
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3CD10E74A;
	Thu,  9 May 2024 12:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SCv6s3DD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C282010E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso9779781fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256448; x=1715861248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJEaWHpHfTjOx8txJp83KCReKfr+CJyqA30JyxkgRQs=;
 b=SCv6s3DDVb5ZbuYeNaiWtWeWDYO9RRIT+rQdy4sXge2DP1VtauCoNzxNFaNSciehXw
 VYUmgEdHA9AnCYWNCMbAX9fG0JYTPQ1GNyi766gFV5Pnwg7QKaWZmNiQRXInPkx3oxZ0
 Lc17wyWrUJ0dVYX0/rDF4NwKeh0BX9+O8B8WKE5LByctGMfD0AX5+VCo+GtJUvl9OF2l
 g1vi+wrDz/HUffBcjQ3Bvl1S80Qb1GbsdonkQ+M2w10a+BcyIPUdlH6FaCS9OKk59GPK
 4xWa6h1GZ/18xIrl8Ddc7IgmAZLumVoub8Y4Ujk+JYzdWZN6we2G7An5VbwoXF8TFFr/
 n4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256448; x=1715861248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UJEaWHpHfTjOx8txJp83KCReKfr+CJyqA30JyxkgRQs=;
 b=JTKbqFk20IJaAhBGLLWgC6e59n3JpjlJ8U9e+Kfvs6LrvP/alyknm/s01fWVNgZhYM
 gjv+byAEDtiuaK0PsteJZoyohwF155qxO/xOZdKJqBjQIq4HkMUx44i06m5VqsMDLQqv
 g05Myf6vzpsnZZwTNfT+dWe5glgO9HtaypACNx/rtS/mdJgUWAEvYBa1nAvHbUUbOH6x
 WnKUGgpAUqdeumOe65RkuRkOpCrN/J6AJqiGVtdQ5Db9F/t6VdPGS16Aq/+PQ4DzTHmG
 He3NrQ4wfAnyuSl8a8pO8M2rg5lhhEkRu5wxczkfaIN8PLgbYZhWtQWJKj7HsXqAcksl
 H/hw==
X-Gm-Message-State: AOJu0YwlYrFlCUI6uNfg8TGYdXQrqh5bRPdbFEsoCSAMx9TESHvR3O5Z
 9yczCeynmJPloNPewkRd1iwRov8JofyBanNP31KT7t+o3Md+8uI=
X-Google-Smtp-Source: AGHT+IEOGVpnlxc4D9Jfg4bzT5yUTxC5Nb1l7o9iKNsaxhKiAZ+w5GYZsS4D630ujkwBJ9hHrRUsqA==
X-Received: by 2002:a2e:4602:0:b0:2e0:3132:94d4 with SMTP id
 38308e7fff4ca-2e446f7c72amr28137541fa.16.1715256447777; 
 Thu, 09 May 2024 05:07:27 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:27 -0700 (PDT)
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
Subject: [PATCH v2 7/7] ARM: dts: rockchip: Add DSI for RK3128
Date: Thu,  9 May 2024 14:07:15 +0200
Message-ID: <20240509120715.86694-8-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509120715.86694-1-knaerzche@gmail.com>
References: <20240509120715.86694-1-knaerzche@gmail.com>
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
changes since v1:
 - added HCLK_VIO_H2P as ahb clock

 arch/arm/boot/dts/rockchip/rk3128.dtsi | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index fbd95bb08cd3..1ed4436549ee 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -277,6 +277,42 @@ vop_out_hdmi: endpoint@0 {
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
+		clocks = <&cru PCLK_MIPI>, <&cru HCLK_VIO_H2P>;
+		clock-names = "pclk", "ahb";
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

