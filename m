Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2612EA535
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 07:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D863C89F49;
	Tue,  5 Jan 2021 06:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3889F0A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 06:08:46 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C7EC58B;
 Tue,  5 Jan 2021 07:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609826924;
 bh=r500VogUG2STcIuAc/UQqHpr6ZmYpBHy/1ydmJVZ+iE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=deUE+jSJMRLsADJCk/V9WUwrE1GFjBBCZwY2lY+luRdz1I+RUUHanCjPhdKqFblqQ
 sszR8eFBO92SoPG0wYKXdltIpw+4a/rgeC+fl99CIK5sYKORioZboj1zRGA5fYOgng
 +51l7468Pz+w8FntZJb5IFrLQvEkD9OtO1UupFDQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/6] dt-bindings: display: bridge: Add YAML schema for
 Synopsys DW-HDMI
Date: Tue,  5 Jan 2021 08:08:13 +0200
Message-Id: <20210105060818.24158-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a .yaml schema containing the common properties for the Synopsys
DesignWare HDMI TX controller. This isn't a full device tree binding
specification, but is meant to be referenced by platform-specific
bindings for the IP core.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Add default to reg-io-width property
- Add additionalProperties
- Rebase on top of OF graph schema, dropped redundant properties
- Drop cec clock as it's device-specific
- Increase max clocks to 5 to accommodate the Rockchip DW-HDMI
---
 .../display/bridge/synopsys,dw-hdmi.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
new file mode 100644
index 000000000000..96c4bc06dbe7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Synopsys DesignWare HDMI TX Controller
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  This document defines device tree properties for the Synopsys DesignWare HDMI
+  TX controller (DWC HDMI TX) IP core. It doesn't constitute a full device tree
+  binding specification by itself but is meant to be referenced by device tree
+  bindings for the platform-specific integrations of the DWC HDMI TX.
+
+  When referenced from platform device tree bindings the properties defined in
+  this document are defined as follows. The platform device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+properties:
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    description:
+      Width (in bytes) of the registers specified by the reg property.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 4]
+    default: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 5
+    items:
+      - description: The bus clock for either AHB and APB
+      - description: The internal register configuration clock
+    additionalItems: true
+
+  clock-names:
+    minItems: 2
+    maxItems: 5
+    items:
+      - const: iahb
+      - const: isfr
+    additionalItems: true
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+additionalProperties: true
+
+...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
