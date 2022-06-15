Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7B54D45F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B476B1138F2;
	Wed, 15 Jun 2022 22:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAF11138F2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:14:35 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9B281536;
 Thu, 16 Jun 2022 00:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655331273;
 bh=V7keF6pU0jUq8EnyWXp07yw1MdtBpVEvVzp0Y4GC/AM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EaVN9fgpjbexDh51WkOfQQ4XH+sGWDHzbQe92EEEQvOPIFzL184FUSSBg1eyyHycZ
 Yh6vaFnqmpFcr/XeR5QQ8CPKvKys1iy9so+fQuCPF1L1tFUkbHUPpJDZOHlnwkpY1Q
 bnI1pcGi68n6EUdXUKZzbMO4k/foAr4nZyfhE+bg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/6] ARM: dts: stm32: Use new media bus type macros
Date: Thu, 16 Jun 2022 01:14:10 +0300
Message-Id: <20220615221410.27459-7-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/stm32429i-eval.dts  | 3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 0d98aca01736..5fae11e6607b 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -50,6 +50,7 @@
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32429i-EVAL board";
@@ -186,7 +187,7 @@ &dcmi {
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov2640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index d142dd30e16b..306d41a6138f 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -8,6 +8,7 @@
 #include "stm32mp157c-ed1.dts"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -90,7 +91,7 @@ &dcmi {
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov5640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
-- 
Regards,

Laurent Pinchart

