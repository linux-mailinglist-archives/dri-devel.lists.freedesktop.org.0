Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1009AB2C304
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6659410E5D6;
	Tue, 19 Aug 2025 12:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R9pKnE9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F7F10E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:14 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-afcb732eee6so849840966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605833; x=1756210633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpAJrdDioA3K7/+UDEGCcZqVfZOD6D2E3R2fJlZANzE=;
 b=R9pKnE9eInkOtid1J6vgXBPUcUQ1Tj6c3L3C7GYVHwtOuhDrMKzFMZ4F+NcrqdkmBB
 dRNzE38TtOYsbUxYvMD5W+sE2kfgnKQEjY6wISxPG43aJqrLKj4Kc04kJssQDU0+p3R0
 fiu/RiMAsBtnti8gSvkNF02JPyyN50YjiqsDJ2pg1aYn5Cckl5gBd8OIbIBb+EzwU7aC
 8+ONqAskiJtXVBVskDYw/B7rcRpw2FlaPtO4eMHfWZjin0A5Z6zUzYwM5TdHgpsYlNL5
 6IDx0V/4TLIbTE18udinHvGQKDD5P+Rx/iDSMjWLswYvklGOvprnPmXHntIThrOLGavs
 fOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605833; x=1756210633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpAJrdDioA3K7/+UDEGCcZqVfZOD6D2E3R2fJlZANzE=;
 b=liOtCW0BX5vzRMzivSDIXsMt8wydcxwMRCNMea4pkSxqEBDo4DvN2ampEA+IQlEfuZ
 KxdBfVL0vseBDPXVQOM6p58o8ddIiGf6Ds2YRoy8HxyAHRkWIMLo+zv1aYzk0bzJvi41
 e7JdZVVpUzV4vY3aB36QI1Be1+r3q3P82RsByfIAwxjc0fbwzIv+sjCCwGVnCQaqmTeP
 2OPN2SnoCtTAN3ATxeto81E4epD9Ve5zapC6w3HfP01gW5YeGMVYv1y263OpszDw7VZ9
 i2tt1vsJDiK/nvYNPkzV+b7t3jH2WL9H00olrecJNrsCEhhcmBc7d3BaNsoQ2LHwRdMA
 s9pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi+VNelK8YXrWX8w+fDUWC9kIwBm9o8P39aRwRUoFAnngvz2x91CvUyyvbbZdZ5qfaHydQX7hzDQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkALvNqh7o6if9BTDGpwr1LFXbKEpj1BjF9Ywf6a22yY6x8cRX
 wFSd1OgGM/SDzrI5qKXaDPSOArmjxV2Sgbls+sg5Yr9nDzyh3l+Y0Fo5
X-Gm-Gg: ASbGncsBQqoNdz4qmlBVy5wHg0PKSIfYiL3CGHba7WI+roGSluHwg6e+oPBhqikk4DT
 9dForXGjSeT1SaN3whnndMlYEXcgx4/KePNcv3x0j/d5il8LJrzcdgdcmvaIG2Wp9peoOeZivIe
 U/N6YM3Kq4secmOY64Bs1tNxZJUzPJyROHn1dXd/IGG0IWxuVTABnnulMIeuO2FsD7LxhzcoS55
 zVFVuxkyF/a8eFrBHnRkMbEblPx8OFYOn3n1Fmk3gGthYp3Ci53wfZeZsvbXAgJPiju+WLZxmm3
 1hMAjCWteetSzHnEAxv6h9sDfxaZwuo3VrAbVbCn/7daYaUDgxZ4TcSplAqVaGvz36IG1b/zlXv
 2/eelboSPks7Eoi8dZocE4rtl
X-Google-Smtp-Source: AGHT+IHvM5DccqskpaOVZxNfX6lgCDdNfDK3EqRTSS9p/z8kmF7PIsdXdNlSir76MBljF1I98Xhy5g==
X-Received: by 2002:a17:907:7f0e:b0:af4:12f6:420 with SMTP id
 a640c23a62f3a-afddcb4db40mr234210466b.13.1755605833042; 
 Tue, 19 Aug 2025 05:17:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 18/19] ARM: tegra: add CSI binding for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:30 +0300
Message-ID: <20250819121631.84280-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 17 ++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 19 ++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 606839fd40bb..d00786368115 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,21 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				clock-names = "csi";
+				power-domains = <&pd_venc>;
+
+				status = "disabled";
+			};
 		};
 
 		/* DSI MIPI calibration logic is a part of VI/CSI */
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index d9223bd7cf3b..c3e9212d5edf 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -151,7 +151,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,23 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia_pad", "csib_pad";
+				power-domains = <&pd_venc>;
+
+				status = "disabled";
+			};
 		};
 
 		/* DSI MIPI calibration logic is a part of VI/CSI */
-- 
2.48.1

