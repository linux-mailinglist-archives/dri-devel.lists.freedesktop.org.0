Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496254D460
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7A0113912;
	Wed, 15 Jun 2022 22:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FBE1138F2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:14:33 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71F031356;
 Thu, 16 Jun 2022 00:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655331272;
 bh=hYw/XG1wi5ZlvDQ178c/bGN3IuQNb9BadCv6ZsV1h1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LAlSmvf8tlZ4mhO5fsFMt9WsM/BiuSUs4ahJ07wNZmGr23eXjByCKwe7owQ2j+APh
 GL2vrtFTrhVEbGLFnaBRO/a4k6rvaYlwGkuhvJimsJh/P/w9IC2g/yTYW+UnEeoL+W
 p9eh91iukhDhwjIVHhFZEgbq9qXIiam9MnO6cKZ8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
Date: Thu, 16 Jun 2022 01:14:09 +0300
Message-Id: <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 4e58c54cde17..33ac4bd1e63b 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -7,6 +7,9 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/media/video-interfaces.h>
+
 #include "r8a7742-iwg21d-q7.dts"
 
 / {
@@ -242,7 +245,7 @@ port {
 		vin0ep: endpoint {
 			remote-endpoint = <&cam0ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -273,7 +276,7 @@ port {
 		vin1ep: endpoint {
 			remote-endpoint = <&cam1ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -305,7 +308,7 @@ vin2ep: endpoint {
 			remote-endpoint = <&cam2ep>;
 			bus-width = <8>;
 			data-shift = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -335,7 +338,7 @@ port {
 		vin3ep: endpoint {
 			remote-endpoint = <&cam3ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
index 40cef0b1d1e6..c73160df619d 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #define CAM_ENABLED	1
 
 &CAM_PARENT_I2C {
@@ -26,7 +28,7 @@ port {
 			CAM_EP: endpoint {
 				bus-width = <8>;
 				data-shift = <2>;
-				bus-type = <6>;
+				bus-type = <MEDIA_BUS_TYPE_BT656>;
 				pclk-sample = <1>;
 				remote-endpoint = <&VIN_EP>;
 			};
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
index f5e77f024251..a7f5cfec64b8 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #define CAM_ENABLED	1
 
 &CAM_PARENT_I2C {
@@ -21,7 +23,7 @@ ov7725@21 {
 		port {
 			CAM_EP: endpoint {
 				bus-width = <8>;
-				bus-type = <6>;
+				bus-type = <MEDIA_BUS_TYPE_BT656>;
 				remote-endpoint = <&VIN_EP>;
 			};
 		};
-- 
Regards,

Laurent Pinchart

