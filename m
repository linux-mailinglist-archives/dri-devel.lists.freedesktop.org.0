Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59DC8C10E1
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012B110EAAD;
	Thu,  9 May 2024 14:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WD3ja1Su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6FC10EA96
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:07:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34dc9065606so486695f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263626; x=1715868426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nuIg0rxmudwavGYdewcr3VwDoFHinfP7P23xo/y6UpU=;
 b=WD3ja1SuY6UKh+3XA70+Qn+I32Cnh36E46WAr7UeyR+6jeJt4frKRfHanB7CwhGFu8
 6f5z7JhBYbhWY2CNd7pmQbS6u5Kr160zVXh3ZU4AWcPex0jjm3nfugUPHH+uzRkL1CJD
 C/RnTKBaMr8+a6WowKOW3FUiuJ1msdq7GOd2YKdcAZXgNr48nJwW84tIeaqiqE0QZSvl
 xAjfrxO2PKvttQN90ZxMPZ+Xb8EF6JWRaFy77D+hSVB4HWck+SeyatIGkJkU4qjBR9/f
 jL8pROUYyrw84DkL7DmUzHAyAYNb/55tpNJstelS+cg2n3fpHY2wV5WHByx0VL0FiTXz
 9eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263626; x=1715868426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuIg0rxmudwavGYdewcr3VwDoFHinfP7P23xo/y6UpU=;
 b=MQz4ounf75UiM3RCJpvCjxwYGc+m5tMndltcfHuj5p1dq/SGKx3iKO4f7IDeGkFU06
 PhVjSyI7SFvD6UlqB0o/2bHJhvo+9Twqx5aVMJtGv2EUdq1kQu5LLHnHKVPV9k8BYTuC
 IdukpYEAQ5x3nG9fEIQ2/BVyLJwHCl9d5C7mG3UYRTNUXHucmEHjStWlNmpkppbSwzSm
 v3d2Dhmd7KSAseoP4UlQi3zGcUr6xQ2DT9D5oD7k8XdXawfCSficMuv23n1ruAzm9pFK
 NycQaYuJBqeSS9nfnTmAZKWL0EwRAicSjwZ1+aV7w3goVwfcMeqmfQcwL8o+zjE5B7QK
 fXQg==
X-Gm-Message-State: AOJu0YyqysUfB7EMUM5I494RT2pgv11uKl+LVOm2F1r7wDmhXDXPy38w
 XMZf7UfPh+pUx0lQMkhVcBw2TmBIiQ4VD7px5ZaNeaeNUryDzts=
X-Google-Smtp-Source: AGHT+IGrYuifyNXu2UQb3DwjWFh9xvmk2vwwMGUSyNdVTWC6BwXLa/x62uQHm8HbCp9cEY6jEZx1eA==
X-Received: by 2002:a5d:5604:0:b0:34a:6fac:6dab with SMTP id
 ffacd0b85a97d-3501812650emr2546256f8f.12.1715263625950; 
 Thu, 09 May 2024 07:07:05 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:07:05 -0700 (PDT)
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
Subject: [PATCH v3 7/7] ARM: dts: rockchip: Add DSI for RK3128
Date: Thu,  9 May 2024 16:06:53 +0200
Message-ID: <20240509140653.168591-8-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509140653.168591-1-knaerzche@gmail.com>
References: <20240509140653.168591-1-knaerzche@gmail.com>
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

changes since v2:
 - dropped ahb clock again

 arch/arm/boot/dts/rockchip/rk3128.dtsi | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index fbd95bb08cd3..7f2bf3e51082 100644
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

