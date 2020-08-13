Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C9243217
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 03:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DD36E30C;
	Thu, 13 Aug 2020 01:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853276E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 01:29:34 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90384B8F;
 Thu, 13 Aug 2020 03:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597282172;
 bh=woAdLeaWut9Feii2mcbA91smYDm6yZyJzi1SuLCiPMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nl/nkQNkaUc3KpkMnAlsZvEhnpb5dZV4Qt65VSqq4zIFSmw6sk70NhCqsZVnTfVbd
 WPl+HjPcCR2xvDoAn49X0mE31aFx0AI+QtlQE6kZjzFYkGzLhe/Gs0tSvVYdOA0t5W
 2wG3ZKVhxFkF4SE+B4K+P45EjAWTLzl4+XxOLNRs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Date: Thu, 13 Aug 2020 04:29:04 +0300
Message-Id: <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Additional compatible strings have been added in DT source for the
i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
Most of the upstream DT sources use the fsl,imx28-lcdif compatible
string, which mostly predates the realization that the LCDIF in the
i.MX6 and newer SoCs have extra features compared to the i.MX28.

Update the bindings to add the missing compatible strings, with the
correct fallback values. This fails to validate some of the upstream DT
sources. Instead of adding the incorrect compatible fallback to the
binding, the sources should be updated separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
index 202381ec5bb7..ec6533b1d4a3 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.yaml
+++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
@@ -15,11 +15,19 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx23-lcdif
-      - fsl,imx28-lcdif
-      - fsl,imx6sx-lcdif
-      - fsl,imx8mq-lcdif
+    oneOf:
+      - enum:
+          - fsl,imx23-lcdif
+          - fsl,imx28-lcdif
+          - fsl,imx6sx-lcdif
+      - items:
+        - enum:
+          - fsl,imx6sl-lcdif
+          - fsl,imx6sll-lcdif
+          - fsl,imx6ul-lcdif
+          - fsl,imx7d-lcdif
+          - fsl,imx8mq-lcdif
+        - const: fsl,imx6sx-lcdif
 
   reg:
     maxItems: 1
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
