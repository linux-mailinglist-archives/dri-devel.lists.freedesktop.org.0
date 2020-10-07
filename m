Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D028564B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 03:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9090E6E849;
	Wed,  7 Oct 2020 01:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29C6E84B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:25:28 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 685E21AFA;
 Wed,  7 Oct 2020 03:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602033926;
 bh=Njh5LksoKUFw4ygPdGey3pAhnS9z0Ij/2vU8KweF3OY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S4OfbtcOpSzSH4WqQDLtg5zOqA5noc5CewG+ECp0oeDBpw9lwnVcG/oEcUcWSz9OP
 sau27RnnUdhiI8MDtIGrK7OztNtdvE2sFtbOknx6jcDND7KbPilEGYAw4uHRNpElkV
 p2YAGOKLByU1Zm2rSnbw1kIXhx+vLvf0CbMIbJnI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] dt-bindings: display: mxsfb: Add a bus-width endpoint
 property
Date: Wed,  7 Oct 2020 04:24:34 +0300
Message-Id: <20201007012438.27970-4-laurent.pinchart@ideasonboard.com>
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

When the PCB routes the display data signals in an unconventional way,
the output bus width may differ from the bus width of the connected
panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].

Add a bus-width property to describe this data routing.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix property name in binding
---
 .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 404bd516b7f5..14b6103a9bd1 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -58,6 +58,18 @@ properties:
         type: object
 
         properties:
+          bus-width:
+            enum: [16, 18, 24]
+            description: |
+              The output bus width. This value overrides the configuration
+              derived from the connected device (encoder or panel). It should
+              only be specified when PCB routing of the data signals require a
+              different bus width on the LCDIF and the connected device. For
+              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
+              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
+              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
+              LCD_DATA[17:12], bus-width should be set to 24.
+
           remote-endpoint:
             $ref: /schemas/types.yaml#/definitions/phandle
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
