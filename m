Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A9B50AB8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547CE10E823;
	Wed, 10 Sep 2025 02:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UOhjNiOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CB210E823
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:05:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-24af8cd99ddso80311315ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757469950; x=1758074750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=;
 b=UOhjNiOSWVpJmy5nMjLoe8f1uieQiDaNP6oWJBOVE2/PU1nySbx7OW83RuEIIQUMpW
 FJQazidGubsmQ/9sVKp2DTc++1PimnwrFlNgo1NVrB1JNuDwy2rEOicIh7y/TPkWztfA
 eildluB0nRcrfaHKQ3YMjiPyj3Ji/1K5T+1Npju8z3DyFh+5e+me7dRz1pSpHTJEXx6O
 lNnnkmRMBdkNwaMStKkxnXAqgTcpZfxeW0uIGtUbIfNJxxZdsrPtK5DpY7+g0tMXMqnE
 7zsDEZoUYJCrpipsyZrl8amNTN97m84Q93sRWcKHWKJNlJ0cz3X2QbxtMKGAHpe1+UKD
 u4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757469950; x=1758074750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=;
 b=nCjWhIAzZN8xisY51dy3W7pP5KM0nK9WHfMfP5VqHFTjMQJIYVfUS28rRBI3hptaeY
 YDrL0tNfgbl0bLgDwAdaLYJ87pXk5tYqTTNZvpo0LKHW1XE1WymlvoYsIpAy/ikWMTiH
 LlDxFiZC+8aO0UdRy+o7R0kLRgaNzT/gRxm8iVgqIr0eLaKT56agZgILQkGBDzQ4dVu/
 n+eSpag5Zv2h+W+AUc/njea8S3JaGIMuOpvPpEAgo939pzgM3aQLvmjBsSMfbigEmHS2
 IcaclNh44xombHp0Gqyjjh5o1//JTkAzDIU63Tu7azPetzH4/bnrQehqKqorJrVxSqUl
 57qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZgmNmfY+xEJrcb4Z7YoEZWLkRxrMs6b9KqhmcsmDuB5vD8h6eqFCohArVBeBvW07POhPn3psBQ5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTDT4myEaFtgd86CHRwl+i9D4YAQGgAYVsQz5LeH750/vFuE3I
 Bj/1RX+ZM193l/uggfN0BYNPvhuqM+ZN1R97rwlhGsZ8NIygdUQtEM3a
X-Gm-Gg: ASbGncuMh1V8WxAXT2kkpeXOqmfRgCZRs5vyhla4kXnYNFrrmxKB8uEQS3krVeUTW7a
 Si43DEsBSXj28FZLNdyZXX8KTFTMUKVMXz/rCvahai8g5FY0RjOHE+Tax2pz6BRItOxO6ZPAei6
 jHIqsDBYtVioL9O2+lzcQf4rjcR3oLiE4OgV1dccpwq+080dC0XI2Ff2jHj1rAEp6pgLtH9wYy1
 XgQNCtzTkFwi/jJ64tDQqGi9NIzul3okwa/saDLtevGdiY+BcXlmlwVxHVjFZ6wG87b9b3DjJol
 +XI3f5TB5YVQSesks5S6Hse0vxjGFILomSbrsbKecLNKbAvMBSLfkhYq6ISRz19TxIZ2egxtQYo
 JC6MJiomcBGrlyZwNXd8B/vEOF1GtVDfXjyIvjQoIsyOdzMY=
X-Google-Smtp-Source: AGHT+IEVBLAzfDT4V42Ob7mMhF4hEh69hyk11soKUt396GyM7UHe/sGizvdubIBtjiwfPR/vW1jErg==
X-Received: by 2002:a17:903:b90:b0:24c:d6f7:2788 with SMTP id
 d9443c01a7336-251741866e3mr168780505ad.57.1757469949993; 
 Tue, 09 Sep 2025 19:05:49 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:05:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif
 compatible
Date: Tue,  9 Sep 2025 23:05:25 -0300
Message-Id: <20250910020525.342590-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910020525.342590-1-festevam@gmail.com>
References: <20250910020525.342590-1-festevam@gmail.com>
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

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..074c48b04519 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..745f3640e114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
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

