Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED981CDD2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C0E10E85F;
	Fri, 22 Dec 2023 17:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708B10E855
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336746a545fso1256709f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266961; x=1703871761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLzYp4+k7Wco/dLyvbXtMOp2x7OPvW43+Ey3FkfhV04=;
 b=PQ7dD83qU30jBKvB0J5rII+FXv5Ca6Fel1TosIj1ZuckvlV7uVjapUgMElu6GAtQIP
 mPkNFLsD0HZa6TBVcalkpjcw/BLGoUmaqY3yt7IR22ZHpBx1M9ZjeiLP6+mtqZe644VW
 6q76NwypOWrfgwB0FFhz191m5s0PF9hHRV5Ht0rUC1IML8ee1zwEuTGpkHaYcxgctj1J
 s/lZtJcGBjiXDsWDv8ql5Ih1EnasyDTZBJ/Spm+ImDMk8JAY3yAJu5qBzkMP/erZ8NMY
 JNY8mbj+KKX81gI5EEKhOorCjF/PErL5S2F9FPnNuSF2MOCI5MuN5Dv4fg3YnQAowxUJ
 9h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266961; x=1703871761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLzYp4+k7Wco/dLyvbXtMOp2x7OPvW43+Ey3FkfhV04=;
 b=U08sIMvordCwG6ymsyA7aXPOL2c9+oiyKdxNkTOIktaEnpNSh4meAWAeFHywa9K1/V
 89gI7YNlxf1vumQrdT58mYd6h/j8wT/sdfKLnXROr2V6tveG4gQXKAatw0Jri8cLCfWA
 8bQ9sd8EJvdy7XQECCnIrkYtDbPu8lHP2F7Md4dYmSJpqXdx8KlvVInUrLNomd1gkFuy
 Ww2aFZ9TA5FjBNa78sElicT09uaTDt2EaM/WoNs/Hf0lhPc7PvWtkFH7hfsEZgKI3g0p
 KChWPcEYB2iIbwvtFvZ7ORWPVuGwKvRnexxO/r503VN5BhbmuweRyopGIef+lCWNK4w+
 uM9A==
X-Gm-Message-State: AOJu0Yzp09iBBvfFjzcHQFA2TXPezP70V/hN83FcjYVkkf4QBTeMLpO5
 7rdPFJYFtjb1ilYOBSg4+w==
X-Google-Smtp-Source: AGHT+IGbd8E/7UYhaxEGvqWFhQLwqbcpgCocA70NL6yVomx8hW0OvFLh92M66p/2d8jdHube5d2uBA==
X-Received: by 2002:a5d:6046:0:b0:336:8d2e:77a1 with SMTP id
 j6-20020a5d6046000000b003368d2e77a1mr945167wrt.47.1703266961379; 
 Fri, 22 Dec 2023 09:42:41 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.40
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
Subject: [PATCH v4 27/29] ARM: dts: rockchip: Add display subsystem for RK3128
Date: Fri, 22 Dec 2023 18:42:18 +0100
Message-ID: <20231222174220.55249-28-knaerzche@gmail.com>
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

Add vop and display-subsystem nodes to RK3128's device tree.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - no changes

changes in v3:
 - no changes

changes in v4:
 - none

 arch/arm/boot/dts/rockchip/rk3128.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index e2264c40b924..1a3bc8b2bc6e 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -115,6 +115,12 @@ opp-1200000000 {
 		};
 	};
 
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+		status = "disabled";
+	};
+
 	gpu_opp_table: opp-table-1 {
 		compatible = "operating-points-v2";
 
@@ -246,6 +252,27 @@ power-domain@RK3128_PD_GPU {
 		};
 	};
 
+	vop: vop@1010e000 {
+		compatible = "rockchip,rk3126-vop";
+		reg = <0x1010e000 0x300>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_LCDC0>, <&cru DCLK_VOP>,
+			 <&cru HCLK_LCDC0>;
+		clock-names = "aclk_vop", "dclk_vop",
+			      "hclk_vop";
+		resets = <&cru SRST_VOP_A>, <&cru SRST_VOP_H>,
+			 <&cru SRST_VOP_D>;
+		reset-names = "axi", "ahb",
+			      "dclk";
+		power-domains = <&power RK3128_PD_VIO>;
+		status = "disabled";
+
+		vop_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	qos_gpu: qos@1012d000 {
 		compatible = "rockchip,rk3128-qos", "syscon";
 		reg = <0x1012d000 0x20>;
-- 
2.43.0

