Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38F28564C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 03:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90616E84B;
	Wed,  7 Oct 2020 01:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4127E6E849
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:25:28 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7C031ABA;
 Wed,  7 Oct 2020 03:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602033926;
 bh=IOF4hus7yFTuFk8YrLLOss/PoObLsLL0JbsBbHM11i8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r0lSmWJU8Jmn3MBJDcDz5Kl6mUyVL5mA9b0krEP5PMUDsTWhOzICX/Mp+CMNMw3od
 RKSHQEaiEYJP1E864kSX/HY8YMFCvt3R89emneesJHG8HU3+VThIrGrc2QQcMMv9XU
 mAxee3lBTp9ne1LDfxUUhR/ewa32hsr/6ItWuY0k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Date: Wed,  7 Oct 2020 04:24:33 +0300
Message-Id: <20201007012438.27970-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v1:

- Fix indentation under enum
---
 .../devicetree/bindings/display/fsl,lcdif.yaml | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 063bb8c58114..404bd516b7f5 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
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
+            - fsl,imx6sl-lcdif
+            - fsl,imx6sll-lcdif
+            - fsl,imx6ul-lcdif
+            - fsl,imx7d-lcdif
+            - fsl,imx8mq-lcdif
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
