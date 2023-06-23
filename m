Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D373BA71
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CBD10E64B;
	Fri, 23 Jun 2023 14:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F98510E64B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:43:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E0DEBC;
 Fri, 23 Jun 2023 16:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687531357;
 bh=wdihR9kOfvIQ6G8MVle6NFFv5LJO2T8O0WCVNoKqb1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VbcvcnwV642L1NkucKgXc8YtBoftMHpYjSn6AayKFnjm9KWOdNTZIwBoOh8YRg7Cr
 rItp4abJJNREMYeDz1RHehAffaXManymW8Mn/eeMPNizWKR+4GbM8yOIIl23orQKMW
 k9Emk67/9E9hMZ1YjHAAqDoJXQQ9lQpQL3d0DrS8=
Date: Fri, 23 Jun 2023 17:43:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 01/39] dt-bindings: display: Add Renesas SH-Mobile LCDC
 bindings
Message-ID: <20230623144312.GE2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2259ff548f007afcb5a315a4c95c83a0ee4b7e03.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2259ff548f007afcb5a315a4c95c83a0ee4b7e03.1687423204.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:13AM +0200, Geert Uytterhoeven wrote:
> Add device tree bindings for the LCD Controller (LCDC) found in Renesas
> SuperH SH-Mobile and ARM SH/R-Mobile SOCs.
> 
> Based on a plain text prototype by Laurent Pinchart.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> Changes compared to Laurent's original:
>   - Convert to json-schema,
>   - Rename compatible values from "renesas,lcdc-<SoC>" to
>     "renesas,<SoC>-lcdc",
>   - Add power-domains property,
>   - Add MIPI-DSI port on SH-Mobile AG5,
>   - Update example to reflect reality,
>   - Add to MAINTAINERS.
> ---
>  .../display/renesas,shmobile-lcdc.yaml        | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> new file mode 100644
> index 0000000000000000..72a39fce7294d56d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,shmobile-lcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH-Mobile LCD Controller (LCDC)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I'd be happy if you co-maintained this with me :-) Or even took
ownership completely.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a7740-lcdc # R-Mobile A1
> +      - renesas,sh73a0-lcdc  # SH-Mobile AG5
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +      Only the functional clock is mandatory.
> +      Some of the optional clocks are model-dependent (e.g. "video" (a.k.a.
> +      "vou" or "dv_clk") is available on R-Mobile A1 only).
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum: [ fck, media, lclk, hdmi, video ]

Switching to per-item descriptions would allow documenting which clock
applies to which SoC.

Are enum items unique by default ?

This would allow a combination of clocks that doesn't include the fck
clock, that's not right.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      The connections to the output video ports are modeled using the OF graph
> +      bindings specified in Documentation/devicetree/bindings/graph.txt.

it's available in YAML form now. I'd just drop the "specified in ...".

> +      The number of ports and their assignment are model-dependent.
> +      Each port shall have a single endpoint.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: LCD port (R-Mobile A1 and SH-Mobile AG5)
> +        unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: HDMI port (R-Mobile A1 LCDC1 and SH-Mobile AG5)
> +        unevaluatedProperties: false
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI-DSI port (SH-Mobile AG5)
> +        unevaluatedProperties: false

Let's condition the ports on the compatible value to enable automatic
validation.

> +
> +    required:
> +      - port@0

Based on the above, port@1 is required too as it's present on all
supported SoCs. Let's condition this on the compatible value too.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7740-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    lcdc0: lcd-controller@fe940000 {
> +        compatible = "renesas,r8a7740-lcdc";
> +        reg = <0xfe940000 0x4000>;
> +        interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&mstp1_clks R8A7740_CLK_LCDC0>,
> +                 <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk0_clk>,
> +                 <&vou_clk>;
> +        clock-names = "fck", "media", "lclk", "video";
> +        power-domains = <&pd_a4lc>;
> +        status = "disabled";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                lcdc0_rgb: endpoint {
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83e9f4ac6bedaa9f..dc1935c196cb0e0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7023,6 +7023,7 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:	Documentation/devicetree/bindings/display/renesas,du.yaml
> +F:	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
>  F:	drivers/gpu/drm/renesas/
>  F:	include/linux/platform_data/shmob_drm.h
>  

-- 
Regards,

Laurent Pinchart
