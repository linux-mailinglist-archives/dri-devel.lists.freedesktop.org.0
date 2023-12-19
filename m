Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71A818D50
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B3010E4FC;
	Tue, 19 Dec 2023 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FCE10E4D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so52527295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005292; x=1703610092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fkhg2+aCs7jdMgzfxvYxQH9D4wpiG0MxQ7esIiT4Fss=;
 b=MkLABOeg/DVOv7bO5uRjQYyjaJEQvoxsvp6RpP9jHqd9pdDz5/Z4lE/rEjMO+Qu3KQ
 ko3USnqS5k8jd1jIFLp1F+1nW6qB06OGM118Kv3PTxwxcSh/QNMbaoeLhIE8aiyO01vH
 g7t4FyJzsAWyaPSjL84KwBby531uE3CjvzyLxzoiyZu2/6g3dcvWJgSkgrcp4FtdJtgU
 5V1FxlmkosgFm3kT56nVnrzJ7maq0R0au83jKeFALs317ZO9SjCZs27Fdo60pVCkFUx9
 pohTzalp7SiO8rTRA5NScucOejp5GZQAvUaeyHZgwiPcmMumnzvTkKkfqS7yB7E5yt3q
 5/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005292; x=1703610092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fkhg2+aCs7jdMgzfxvYxQH9D4wpiG0MxQ7esIiT4Fss=;
 b=AiHiiN6ui0lzTIPrS8IQgKDnkU7FIRSXjykD/AHYzaEBo8Gq3GRNLXv16trkv1Cjyp
 +r2FnjPLfp+cayHc1rHSy2bQ0grDW6Iy0anI5FtvvVZ58j4nBT1vg46JJPbk5mFAK2mL
 OlsuW6eK5Oui1ffneOHPfeGUCK/v/+DLcmB5Dn0dLs4cK7usodjy9txI7179l6o0PLkm
 FLyrqNQiGFMnB74DSf3l8GR+HlKiPKtOkd2+RjiRVVNSPMza1Us5MCE7VuCATB6m1tpd
 vZC1s8RBdBp5faTbRfvy45jYliiZSfc24FxcDKu6UfrawRigWcDwzjTG3RlUjOKMGn27
 OuTQ==
X-Gm-Message-State: AOJu0YymE5Bby8s6vG2/qw9d6HwoRl15u2fqI8O7/zW5aUJ/vZbiGp/J
 D/bCulbuw5aBWNTnbav7HQ==
X-Google-Smtp-Source: AGHT+IGcO6yQrlw/IQJbarilDOyEAsYRP2fJCi+GiVdt/rewnkpVpso4E0zT/HF1QyL68nY60lqA1A==
X-Received: by 2002:a05:600c:4710:b0:40c:6b6c:6867 with SMTP id
 v16-20020a05600c471000b0040c6b6c6867mr3950390wmo.178.1703005292435; 
 Tue, 19 Dec 2023 09:01:32 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.31
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
Subject: [PATCH v3 27/29] ARM: dts: rockchip: Add display subsystem for RK3128
Date: Tue, 19 Dec 2023 18:00:57 +0100
Message-ID: <20231219170100.188800-28-knaerzche@gmail.com>
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

Add vop and display-subsystem nodes to RK3128's device tree.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - no changes

changes in v3:
 - no changes

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

