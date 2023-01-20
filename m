Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC979675B7D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA45210E10B;
	Fri, 20 Jan 2023 17:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DC310E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h16so5455111wrz.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXw2j+x/kse2yPakxaPEW51TbrZ6J1HBieALff4c+rE=;
 b=HxB+Fql78ZELN8ESqJE0nr2QjjtSelDWlhBG63jeCWznR746a2arSU5WR3Dewrng8J
 hpKPCB/+XGVCnjaTSb1hBPnnCks1ywfdHU+gPv3prNvf2m9uSypF49PArI3DIbh+dhY7
 4nVMQ4nvctMibIveBehx3EiUs32eAwRfj6lK57zOYWSAtKFH4lWEpBYZGqeGbe9KSThS
 04EFH383Mi+M8yIjSXIltHW3DxMU4XvnnpWXjQ0sSXERqs9JfRb2KWddyQcV84rKHvjs
 bMNZ0JF7OgQ40n613YIyLOzpeSBfnd7bwq5wCtQ1EbPLfPanVxxa+hjUM/JnY9bEAgX/
 bhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXw2j+x/kse2yPakxaPEW51TbrZ6J1HBieALff4c+rE=;
 b=egy53gugyxnYDKn/6tnz9TBAK/AnsJnbpFB44bN1wRipmYU+qP+y4aL1i/3fqRo8Eu
 nKGFbHzowg51Mk0xjvmtKXYTGj0zB+7HF7mBCQVOYEVpHFYbWtE8kq1dJOILDHRunmUJ
 v756AR6TqHfwuk1BHZ4fKB6lBB2802VRWCp47Xxrs+Tge/IuUxEs9UI7IvmAFaY4KaFJ
 KGZ7EyVFhToQ/eBUSTdb72A1ICt3JEy56iDyafqH9yWkqlOMXZDlS1RpP2zfXAqQdwjY
 UCCS9KGL12bstoFaER2z99gHSgk2tzzFGNkIwdbqNgv57brhLH/TrKj8Q/4KTs2/sTb0
 +IyQ==
X-Gm-Message-State: AFqh2kqszVDYaVTo6DC+bfT/PnFH2rnPgNItE6hauaHuIge1f6dsq3Wx
 VNPRGMivI+eYiEQLwWUC/nw=
X-Google-Smtp-Source: AMrXdXsb64RJIKDpmJTAga1GYyceTGETa/aMFyd6rGzsds7lxOLOWxwF53TLNJ7Cy29mMswL5rWqhA==
X-Received: by 2002:adf:ce90:0:b0:2bb:edc7:504 with SMTP id
 r16-20020adfce90000000b002bbedc70504mr14353213wrn.26.1674235874883; 
 Fri, 20 Jan 2023 09:31:14 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 z12-20020adfd0cc000000b002bdff778d87sm13470524wrh.34.2023.01.20.09.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 8/8] arm64: tegra: Add simple framebuffer on Jetson Xavier
 NX
Date: Fri, 20 Jan 2023 18:31:03 +0100
Message-Id: <20230120173103.4002342-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
index 5ce2650128b1..e0ce54eae17d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1975,7 +1975,7 @@ display-hub@15200000 {
 				#size-cells = <2>;
 				ranges = <0x0 0x15200000 0x0 0x15200000 0x0 0x40000>;
 
-				display@15200000 {
+				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
 					reg = <0x0 0x15200000 0x0 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.39.0

