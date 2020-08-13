Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA876243219
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 03:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5496E2F8;
	Thu, 13 Aug 2020 01:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DAC6E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 01:29:35 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B25DC4;
 Thu, 13 Aug 2020 03:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597282172;
 bh=aP00vh/Yl0i46i+VQZNlATPsa2UNz+xKT3vkI5WjEiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HKwLJeZIGRPguSDljWf9XzttWn3Kka+NPkLZ0D6ruk5HH8OBasE+ceNmGI1sUgc6U
 eO0et182qbs7sn8BTKqDc+3jaFffHaS1qk/HbFmWUMHrb/DVy0Sf4TgupyFfyZA9OY
 4zOyt3J3DE1YYqR8vfUeX2ZjgQcFBVK+E8bu8asw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width endpoint
 property
Date: Thu, 13 Aug 2020 04:29:05 +0300
Message-Id: <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
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

When the PCB routes the display data signals in an unconventional way,
the output bus width may differ from the bus width of the connected
panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].

Add a bus-width property to describe this data routing.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
index ec6533b1d4a3..d15bb8edc29f 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.yaml
+++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
@@ -58,6 +58,18 @@ properties:
         type: object
 
         properties:
+          data-shift:
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
