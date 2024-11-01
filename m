Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49A9B92A3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258C110E9D8;
	Fri,  1 Nov 2024 13:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hr060/gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6EE10E9D8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:54:34 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7edb6879196so1422009a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730469274; x=1731074074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=;
 b=Hr060/gzZZwaeDOFedRzTesW0sHDO1tche5o2bXI1vACbkHTHDngx68IQ6TJ6OGy8F
 z9VDKZQCuB5vfeySynTCBqrD7i6s88WHzOifxpy13W6+yiNkB95AuHwF1gsDx2QzXdat
 lIa+VWKK+rhgbQiqGNZDJceAKdU2puyq+1NM+MYGNRpzRjYz1Fb7+Auk4cyb8+ITlKXt
 nXzqbMCj/C9zxXAxLchPbgJ+IsQZtxZrpsBlVwVho4/AbVEg8wdEcl7JTRO2WDemcsBl
 fuOxAJweOsBuq9A4zBgimBQbFrKMLXkdHDdEcTdVBHt8+Q2PeKLzupelGn7d4e0hN6MU
 11Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730469274; x=1731074074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=;
 b=ESZjI3FZ0Mptv0dgVh6c1OEef8tR3vCVUu+2/vVaRm2pLWNZqcudsFQZbi0H+HIzqJ
 dRE/qPQ4OP50jqPlkCk60jIZZUkgSPrG42BECG8ivslKExjsbPpKCYDmEisboy6MCgs/
 D62HQtBIBaJRjWM5YQ1e324YTggvVt/woan6GvtV9rSt/VvMQ38hNXRQ0zVJejnfoeqC
 AjTaZOdWYEjToIp/2R3bCQ0KqGikPHkwCwKbr83/9eeKvIxnDAQEcdJz2AMfnESnthbL
 OUY/sLSNbRLek7mzUDPmBYEWHxFlFXwz3hqPrYtm+i+7mprXY8Jy5R59O2LJLQumQLvY
 mrcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVItEdB33NtV5k8cjHO8wSLq8ze8zOr7MBPSoqW+H9P5Y3GusEZwqEUEAICE5R3MGD+LuMTpeiaQwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWOBOUPV5m1xXzTnHeZ3c1gm9ySqxLP3EiCkdSFMBcWpXdElT8
 8DD0SII2hBqxuil9PwAMzEgmyefc2fxszzjQ0GCnqnp7wP6WL4hp
X-Google-Smtp-Source: AGHT+IH8W2eCY65X0S8AQbE9o3p5Q3zI8rq+GaKzoJeNimr8oXqT3hybKf0PinVDefFIyOyprLWsVg==
X-Received: by 2002:a05:6a20:c797:b0:1d4:fcd0:5bea with SMTP id
 adf61e73a8af0-1d9a83ab7f2mr30193095637.6.1730469273852; 
 Fri, 01 Nov 2024 06:54:33 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:54:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif
 compatible
Date: Fri,  1 Nov 2024 10:54:06 -0300
Message-Id: <20241101135406.47836-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
References: <20241101135406.47836-1-festevam@gmail.com>
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
Changes since v3:
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

