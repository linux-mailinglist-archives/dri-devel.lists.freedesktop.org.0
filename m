Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E41B46DAF
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046A10E378;
	Sat,  6 Sep 2025 13:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yg+j8nAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A2910E374
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:17:21 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so3175170e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757164639; x=1757769439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
 b=Yg+j8nAFNemOFSzmxwGtRDU6DAGO99Bsd/u/a3TWWBTZvasHRumO1L9phUi6ztZNGP
 4eaku84RgezZqCk7X24oPY3Fpd0AfHtZT5/Bx/buA6xvN6eTFKZrT3oGKRyMBnpy4uf+
 QunU1k53XgkW3zHDUfAf4MS68xWknX6y68z2HEAIiA1xvFPzIkDYV58gNSqhR1TNGXrs
 KrVk1Tqx99ozkk7YOfj7Hppn9STPltYH0U8u2/fPzoMqt5+wgQLmgvQvbpDAi0WXQgGl
 eZ+WPysmtY2xIJqc3jiGY83QpSfohM3ALGJwWhqA1NG91R8UWx1Vlv0vi+e7M4+JM+Df
 PS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757164639; x=1757769439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
 b=Pq2c4anM5KAIm54I8bAXtu4XnjTUHUxzQnbAbwtw+Up1aHf/VdCx0Xt+7YxBEBXSPr
 l3dKNZnKD31KLYpQPXCmCnc/zeYWqNlCPdGHQ5o38YQMagbQUIrkiMVGETOMIo3C71LZ
 3R7dDKkt/ESl/+8Udi19YrFWcckrbm5rSOty5CH0vp6Lx0ku9LbQ0wnrKkgNvU/Y9Nd9
 rxqCCmgAo2orJJXYV/9hbmWpTnQhBCltPuwBvsNcHM0Rgx8X+XRoGWXGauFlw0huNzyL
 72BuWzbGBP14eM02NEUaFUv+3BJ+dh9te5u/WiHWvP0xPADDtYAkbP8jkIvsDR6MAW2W
 TGaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPK4HnmBjhYBdDcgBwtSLF8dr+nzSKKztVFvNx2oFCKPXmlahvai8ZxNTQNt/lDRsEWmT0tPCEHj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBczklDHoahQmgje8pSPzH4Hfr3Uk957ISgdMjmYfD0QfyfKGs
 cYC3et9g/rx5Uiwswg18NDTqViOovPfmzrTa7kPakdz2TQ60AeUErTTl4/osPA==
X-Gm-Gg: ASbGncuCYpocYolQlV9eMSb5Sy27bKxBzvcEdjKvMzSK0AY5RlG+fgjvcl3Zjs8zVrM
 tUrC5wxCwMdXg6bU1uecZSnaB0jRfNc1Fbrm80z4trQvNxfEictBIRUfShQF+8chwDQ6YopetFc
 TKPO7NviFvNBjcNMFbOEAqgTHVvQ7miAa8LtxXENjY6Cm5MLi/BNapSe7/Qz5gNxnQF6CgF2eK2
 dBYUp9BTXr8GtMEx0aT6bMdYWpHSjRYsNYX93X033+crfeeWnQCmX46ZB+KGosJQlU+hX4CbpaK
 fxpsuUVG9l88wZfSttp+KNFpnDIYGkQB8+QmqEJle8UlOPPSwqxqkvuX9prfoId/VMOaFtkc2B7
 QitLvnVZhO51QNA==
X-Google-Smtp-Source: AGHT+IF0XtiV51Ye0m2nDgyWEyVZWdZXdOMIrgeIT7t+FXgoHro7abHxMEkhc0w1HnmHJgO6z0SnAQ==
X-Received: by 2002:a05:6512:6d3:b0:560:8c58:6cd7 with SMTP id
 2adb3069b0e04-5625f817e0emr722096e87.5.1757164639337; 
 Sat, 06 Sep 2025 06:17:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:17:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
Date: Sat,  6 Sep 2025 16:16:55 +0300
Message-ID: <20250906131655.239340-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
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

Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 5cdbf1246cf8..39c0f791c7ee 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -238,7 +238,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsi_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSI pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index be752a245a55..fecd4891e751 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -343,7 +343,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsia_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSIA pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		dsi@54400000 {
@@ -356,7 +360,11 @@ dsi@54400000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsib_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 4>; /* DSIB pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.48.1

