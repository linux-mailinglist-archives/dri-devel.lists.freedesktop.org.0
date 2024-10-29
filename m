Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754B9B5293
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C8210E6EC;
	Tue, 29 Oct 2024 19:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPBH9646";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AEB10E6EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 19:16:55 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7edb3f93369so3773976a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730229415; x=1730834215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=;
 b=DPBH9646qOMgqdbgr8/GSPPbzqaHRI8PIW66DC/1b36DXjWt3zFVG0+yGtz9ST3mIG
 CG/aLV5cL39Y0ey7XSetnHzeEW45Yrh4AQGZOlIU2eVY7biZYugYOuIHMrSsWKKTf3xb
 qG7GEUVe9r7EcF1hvSPhb/tc6v/3QmvLdVEBdR821dppdkzcSKlwRNHmBjN9/5x41HMZ
 4fN8j8FxUHpuQTsQjArEb71ySLkENBZnTeoOJnMtygCEKhH5X06sqTaaT4xrGfW1wB2x
 2VsDTfCxJudbGd4LO+Av7B14L1srJaku0hSqAx1RdK2THWK6gRSGjBONYPoXb/YQYsp9
 oSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730229415; x=1730834215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=;
 b=UzcO4kXvzNctuB8gd/7PmWIRzZukd5IaDRqTQNg24eZLxRpcq3bDEr7tlDrJ1Ne4xI
 MaP5x5SsY3Au6oOySXA2p9ZHO1CFH0mQG459kfmXW01qGgaWWATp8XqQp0GAgr18+VzV
 azO4jlTWf6GhsHSSBVyTeEnmzNBj7cKgf9b9oK8DRhRLXditIFLvx2u71QjJR9L9ylqq
 Q2oIfBcf88fhwP8N0V/mCbSknrWxa7zf/q3Oe8vA8bmJo9el/tdfOQhQ29RzMxFo0C7T
 J2jqVEK44Dc53xqjzCJcLtErgpytTKxpHTvC2kqyrtnhzFQP5vJpxz7aClafpzolpeYM
 b85g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQIO9VJDc7g8o5ipt0OxrDnU23BS0dbIYbRXmGioEMYdttboKmKcREW3nICkNd6Fk8cPx5D64sxnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTxsyWlY0pBwwg3pHmPbAMncaiUr7Qt2qqgft/xwaKW6ZejeqK
 jkY87dAmkBug2gHAJsfHhFbsLQURpK5uiu7MlV3btryloCNwDIh4l0Gaig==
X-Google-Smtp-Source: AGHT+IFTWq5E2+C67K9DtUnmc5ZutA88kE0YA5e/SigUzJXK7DIsERXz99OcPpiFqA+Gv4FpUe17bA==
X-Received: by 2002:a05:6a21:58b:b0:1d9:762a:98ba with SMTP id
 adf61e73a8af0-1d9a83c9c31mr17108740637.16.1730229415320; 
 Tue, 29 Oct 2024 12:16:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 12:16:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 3/3] ARM: dts: imx6sl: Provide a more specific lcdif
 compatible
Date: Tue, 29 Oct 2024 16:16:40 -0300
Message-Id: <20241029191640.379315-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
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
Changes since v2:
- None.

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
index 85fe2a4ab97a..eff83f5e5535 100644
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

