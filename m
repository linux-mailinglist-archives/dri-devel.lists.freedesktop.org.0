Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4062E48D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA2110E673;
	Thu, 17 Nov 2022 18:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EBB10E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:40:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n20so7472705ejh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1XmyqLWH4AqUOHKKfV1yv3QMSJcaiHXG6zk/U0Icvk=;
 b=aVpjZjUmugzu/Zf4UlP/gNFrPeVw2QoCsRb8vQyv+jCL2d8y5OsKj0GZ64BylixKY0
 NfuzLBkmZe8U4Wk8RmKUxISvrCQxlekxCVlwh1jsS1d3zSbod1iElJrNETfONX6hd34B
 uTxQxEo8KEASodUrTV8If32PYhb+hH5pppYTuYRmGBsgATHW1APz8U0Z++AVWuzVBvqH
 JIyPjQ5y4tjj+sWJB5ZdTTgjDNb11EMmdDAw6J0W5teFOHpT3FNKzUsp7OBOR79yctoF
 fMy/I2WJ3TdIvil4m8cnjwiYPvF6Gu5HIix1clcbsjTLjE6t+iA2JJLXTSmH164iVJJL
 BpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1XmyqLWH4AqUOHKKfV1yv3QMSJcaiHXG6zk/U0Icvk=;
 b=37iPeSXSW+l+uEJ4KkdqSQZjSWGY6/DXtFVza0gZe4tWdvx9Kcw6i6tvBRr66fwNoj
 zEKbrdNegpfUZwg14b/J4lVW1jFRL3FO76cOO9GSFTYLV9ffZz53EO5txSEw4t70J6Nv
 ezGFFI1kg67AjrcdfpsMOFb+wEsNsoiEluZDOOOPya2TCYbLel7MVYILJk5aNLACzxte
 cFlrFTIhemH8tLVKjGIEsL7zrWIsJV3C/8rktGHNgWxYIn1YCSrl1lkzMkVWJkg5ea9M
 99FVKJhD5RPaXptP+Fyzh1TcyYOeOXang8TiV1VKO3TDB/5oH2TGL6SZobYnJBgqjEOK
 rkOg==
X-Gm-Message-State: ANoB5pl1QrYAPbIEZxURwtre6pbQh7T9LFazBL1b1Wb/1cknKQDttymy
 SrWm6/WbtVAhZ1qZZdN0pX4=
X-Google-Smtp-Source: AA0mqf6JIF4Hi+lfPgCjyHzvwjQnYPd8qpC0JNMVn/jTtG1nufCYivUOlHMB4CEB9me5Awc/DBy1CA==
X-Received: by 2002:a17:906:3792:b0:7aa:97c7:2bfe with SMTP id
 n18-20020a170906379200b007aa97c72bfemr3146515ejc.196.1668710457524; 
 Thu, 17 Nov 2022 10:40:57 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090682cd00b0078d424e8c09sm695617ejy.77.2022.11.17.10.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:40:56 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 8/8] arm64: tegra: Add simple framebuffer on Jetson Xavier
 NX
Date: Thu, 17 Nov 2022 19:40:39 +0100
Message-Id: <20221117184039.2291937-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add the framebuffer carveout reserved memory node as well as a simple-
framebuffer node that is used to bind to the framebuffer that the
bootloader has set up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- clear out dynamic fields and leave it up to firmware to fill them in
- mark simple-framebuffer node as disabled by default

 .../nvidia/tegra194-p3509-0000+p3668-0001.dts | 43 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
index 238fd98e8e45..85b4aaa2ad4e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
@@ -7,4 +7,47 @@
 / {
 	model = "NVIDIA Jetson Xavier NX Developer Kit (eMMC)";
 	compatible = "nvidia,p3509-0000+p3668-0001", "nvidia,tegra194";
+
+	chosen {
+		framebuffer {
+			compatible = "simple-framebuffer";
+			status = "disabled";
+			memory-region = <&fb>;
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+			clocks = <&bpmp TEGRA194_CLK_SOR1_REF>,
+				 <&bpmp TEGRA194_CLK_SOR1_OUT>,
+				 <&bpmp TEGRA194_CLK_SOR1_PAD_CLKOUT>,
+				 <&bpmp TEGRA194_CLK_PLLD2>,
+				 <&bpmp TEGRA194_CLK_PLLDP>,
+				 <&bpmp TEGRA194_CLK_NVDISPLAY_DISP>,
+				 <&bpmp TEGRA194_CLK_NVDISPLAYHUB>,
+				 <&bpmp TEGRA194_CLK_NVDISPLAY_P0>;
+			width = <0>;
+			height = <0>;
+			stride = <0>;
+			format = "x8b8g8r8";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fb: framebuffer@0,0 {
+			compatible = "framebuffer";
+			reg = <0x0 0x0 0x0 0x0>;
+			iommu-addresses = <&dc0 0x0 0x0 0x0 0x0>;
+		};
+	};
+
+	bus@0 {
+		host1x@13e00000 {
+			display-hub@15200000 {
+				display@15200000 {
+					memory-region = <&fb>;
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index d0dbfafbc930..ec318b9e700c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1972,7 +1972,7 @@ display-hub@15200000 {
 
 				ranges = <0x15200000 0x15200000 0x40000>;
 
-				display@15200000 {
+				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
 					reg = <0x15200000 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.38.1

