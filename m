Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56431431E9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 20:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261486EB04;
	Mon, 20 Jan 2020 19:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08DE6EB04
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 19:02:55 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3032120023;
 Mon, 20 Jan 2020 20:02:50 +0100 (CET)
Date: Mon, 20 Jan 2020 20:02:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: David Lechner <david@lechnology.com>
Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
Message-ID: <20200120190249.GA9619@ravnborg.org>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=WZHNqt2aAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=UoRE_DPNZI_mX2jt1NQA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=PrHl9onO2p7xFKlKy1af:22
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David.

> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
> 
> not all of these properties are applicable.
> 

> > +required:
> > +  - compatible
> > +  - reg
> > +  - dc-gpios
> > +  - reset-gpios
> 
> Missing optional rotation and backlight properties.

Thanks for catching this. I have written a little .yaml files
since I applied this - and learned a little more of the syntax.

See attached patch for my attempt to fix this.
Please review.

	Sam

From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 20 Jan 2020 19:55:04 +0100
Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r

David Lechner noticed (paraphrased):
- not all properties from panel-common are applicable.
- missing optional rotation and backlight properties

Fix this by listing all allowed properties, and do not allow other properties.

Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
Reported-by: David Lechner <david@lechnology.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Lechner <david@lechnology.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/sitronix,st7735r.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index 8892d79e6e10..0cebaaefda03 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -39,12 +39,19 @@ properties:
     maxItems: 1
     description: Display data/command selection (D/CX)
 
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
 required:
   - compatible
   - reg
   - dc-gpios
   - reset-gpios
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
