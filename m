Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAA9B48E0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 13:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE3B10E63A;
	Tue, 29 Oct 2024 12:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="egq8yexs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B040310E63A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:02:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71e625b00bcso4029093b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730203376; x=1730808176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=;
 b=egq8yexswinVqDM34gW78jQppUraiQy54+l+UA2rOQG74UuJtjLly83y0HwJR6EdhM
 BxOaBTPLVit0duPhubFnXN09iy2GMYfkryUXRC4ZQZF3qTEMR4E180Ity4gGaT1gMrHE
 m9KQUiJ1IO2YyUVS8si3KmbQti93xGyrX2jjJjiM0W2lDLOpg+FhyEYpBl6YsjjZx2s3
 Ng7fNrmYXx0zZOecx4VTsVTUTzHzdqT7Sjrp9bVCV4ZSwz5MYDX/oMb4vIJ4MpRXGgU1
 2meDmHollDxK+XR4Q9kmgNhC5ezt7x2RrppWKr4IctJglPQsVu5aZAs2EaAW8wcZH8cn
 LROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730203376; x=1730808176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=;
 b=n+1o7RY1P1hew2YNKp75oYWWnzgE3Wri/7kyUkNPo0ILkqnrx83yVkKMCrNFDi5jyj
 SqxU7KAHcmYyMO6frJarhA16yqsrccfxL2pRHlYM81/KraFUhfZZ4wokJZ5roi80oxWs
 Jg22RJmCXtv2yVWLzeuxCmdvcOCJvj3AqR0EVgy1XyKBslGG2dW1UAIVf8FF/HcJkLBc
 frVfXt8HYir0OSH3JfKN7W2EcmCQeQWPHNRVlBb8NpGn0JHc8UG+Mn7RRPb400XGohJD
 YMasaKXGDnrFOGKnROu86VEXWsltgiGyG7nDuuXK2WBQ0Ld6pWLIVmqOEBKnEtJkp0gU
 AZGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXrObEpg/oTRC3RsQRmqM4ml/C8A6xKBhm2/BqSR/nm8KQ/NLHJUHehDe6tmDHb1ZnmGypjVHCEQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBaHi705CGgH6ODrk7Pp5PTGox6o/TjDmCalvtGQHDE3tzYmqM
 f9B6SVTvcSiKb8MBWrTJeGHw963UKeWJ1xEWWPRWYMcWD8NdR6lD
X-Google-Smtp-Source: AGHT+IGbiEdJV3ydS0kSLnafJ9ewMOqHsVNosLuolIBvEY4inEwZ5wIYaFPuZwSU7Tw9iUcPvg13Dg==
X-Received: by 2002:a05:6a00:230b:b0:71e:4cff:2654 with SMTP id
 d2e1a72fcca58-72062f86088mr17177530b3a.6.1730203375835; 
 Tue, 29 Oct 2024 05:02:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 05:02:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 3/3] ARM: dts: imx6sl: Provide a more specific lcdif
 compatible
Date: Tue, 29 Oct 2024 09:02:36 -0300
Message-Id: <20241029120236.299040-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029120236.299040-1-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Add 3 entries for keeping DT compatibility. (Ahmad, Andreas).

 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..840e19b2ca0f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..e6fd47814665 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -648,7 +648,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1

