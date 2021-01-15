Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD622F8859
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F66F6E4AE;
	Fri, 15 Jan 2021 22:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0346E4AB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:23:28 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 154CD1381;
 Fri, 15 Jan 2021 23:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610749406;
 bh=GsFEbIUp28O/bXAtCgPgK0ml1MI/Xl1O7day7F+o2Gw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PQxR5whZoLMZyF6Ba7908cs5P5dtagntkFMr61k5Jv3TYwt0F9WjENPNx1Zx2qfYM
 RNy83uhefpZwQ0PMnSfPYd58U9tDbfhx6wBe+JAQDvFguSPToznQZ8Onl/Bno7z6aT
 zWWSOiR+6vMdtXLCXIeNZGuy1zpdKk52KVLV7exw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Date: Sat, 16 Jan 2021 00:23:03 +0200
Message-Id: <20210115222304.5427-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
References: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
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
 Martin Kepplinger <martin.kepplinger@puri.sm>,
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:

- Fix indentation under items too

Changes since v1:

- Fix indentation under enum
---
 .../devicetree/bindings/display/fsl,lcdif.yaml | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index bbd47d80d253..4fc24d482b1c 100644
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
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+              - fsl,imx6ul-lcdif
+              - fsl,imx7d-lcdif
+              - fsl,imx8mq-lcdif
+          - const: fsl,imx6sx-lcdif
 
   reg:
     maxItems: 1
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
