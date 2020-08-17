Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA4245A2C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 02:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0802A6E12E;
	Mon, 17 Aug 2020 00:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80456E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 00:01:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA3F3F9;
 Mon, 17 Aug 2020 02:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597622465;
 bh=WDPbo8HE4yDjtagRmO4s4MqUPYkC1JeTI8HoVQUG6XA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vOBp/ayvA+u0l4PevCbgoYwwHjocKUrzAXBuN7c6eWKYCHq9FP2s6olcSMPKC0r44
 2CclaoSO8E0Lq9+OJhyyySvhKAE/RPxL3Z70wCS9aYG351lk0vZHOxbiv6V1KhGWWs
 cQoEOXFcZbcLdbuCcNdZCE24ATL89zJKVnHJmhTY=
Date: Mon, 17 Aug 2020 03:00:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/8] dt-bindings: display: mxsfb: Convert binding to YAML
Message-ID: <20200817000049.GB7729@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-2-laurent.pinchart@ideasonboard.com>
 <20200816062242.GB1201814@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816062242.GB1201814@ravnborg.org>
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
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Aug 16, 2020 at 08:22:42AM +0200, Sam Ravnborg wrote:
> Hi Laurent.
> 
> Good to see one of the imx bindings migrating to yaml.
> 
> On Thu, Aug 13, 2020 at 04:29:03AM +0300, Laurent Pinchart wrote:
> > Convert the mxsfb binding to YAML. The deprecated binding is dropped, as
> > neither the DT sources nor the driver support it anymore.
> > 
> > The compatible strings are messy, and DT sources use different kinds of
> > combination of documented and undocumented values. Keep it simple for
> > now, and update the example to make it valid. Aligning the binding with
> > the existing DT sources will be performed separately.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> But see below for a few nits
> 
> > ---
> >  .../devicetree/bindings/display/mxsfb.txt     |  87 -------------
> >  .../devicetree/bindings/display/mxsfb.yaml    | 115 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 116 insertions(+), 88 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/mxsfb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
> > deleted file mode 100644
> > index c985871c46b3..000000000000
> > --- a/Documentation/devicetree/bindings/display/mxsfb.txt
> > +++ /dev/null
> > @@ -1,87 +0,0 @@
> > -* Freescale MXS LCD Interface (LCDIF)
> > -
> > -New bindings:
> > -=============
> > -Required properties:
> > -- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
> > -		Should be "fsl,imx28-lcdif" for i.MX28.
> > -		Should be "fsl,imx6sx-lcdif" for i.MX6SX.
> > -		Should be "fsl,imx8mq-lcdif" for i.MX8MQ.
> > -- reg:		Address and length of the register set for LCDIF
> > -- interrupts:	Should contain LCDIF interrupt
> > -- clocks:	A list of phandle + clock-specifier pairs, one for each
> > -		entry in 'clock-names'.
> > -- clock-names:	A list of clock names. For MXSFB it should contain:
> > -    - "pix" for the LCDIF block clock
> > -    - (MX6SX-only) "axi", "disp_axi" for the bus interface clock
> > -
> > -Required sub-nodes:
> > -  - port: The connection to an encoder chip.
> > -
> > -Example:
> > -
> > -	lcdif1: display-controller@2220000 {
> > -		compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> > -		reg = <0x02220000 0x4000>;
> > -		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> > -			 <&clks IMX6SX_CLK_LCDIF_APB>,
> > -			 <&clks IMX6SX_CLK_DISPLAY_AXI>;
> > -		clock-names = "pix", "axi", "disp_axi";
> > -
> > -		port {
> > -			parallel_out: endpoint {
> > -				remote-endpoint = <&panel_in_parallel>;
> > -			};
> > -		};
> > -	};
> > -
> > -Deprecated bindings:
> > -====================
> > -Required properties:
> > -- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
> > -		Should be "fsl,imx28-lcdif" for i.MX28.
> > -- reg:		Address and length of the register set for LCDIF
> > -- interrupts:	Should contain LCDIF interrupts
> > -- display:	phandle to display node (see below for details)
> > -
> > -* display node
> > -
> > -Required properties:
> > -- bits-per-pixel:	<16> for RGB565, <32> for RGB888/666.
> > -- bus-width:		number of data lines.  Could be <8>, <16>, <18> or <24>.
> > -
> > -Required sub-node:
> > -- display-timings:	Refer to binding doc display-timing.txt for details.
> > -
> > -Examples:
> > -
> > -lcdif@80030000 {
> > -	compatible = "fsl,imx28-lcdif";
> > -	reg = <0x80030000 2000>;
> > -	interrupts = <38 86>;
> > -
> > -	display: display {
> > -		bits-per-pixel = <32>;
> > -		bus-width = <24>;
> > -
> > -		display-timings {
> > -			native-mode = <&timing0>;
> > -			timing0: timing0 {
> > -				clock-frequency = <33500000>;
> > -				hactive = <800>;
> > -				vactive = <480>;
> > -				hfront-porch = <164>;
> > -				hback-porch = <89>;
> > -				hsync-len = <10>;
> > -				vback-porch = <23>;
> > -				vfront-porch = <10>;
> > -				vsync-len = <10>;
> > -				hsync-active = <0>;
> > -				vsync-active = <0>;
> > -				de-active = <1>;
> > -				pixelclk-active = <0>;
> > -			};
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > new file mode 100644
> > index 000000000000..202381ec5bb7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/mxsfb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale/NXP i.MX LCD Interface (LCDIF)
> > +
> > +maintainers:
> > +  - Marek Vasut <marex@denx.de>
> > +  - Stefan Agner <stefan@agner.ch>
> > +
> > +description: |
> > +  (e)LCDIF display controller found in the Freescale/NXP i.MX SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx23-lcdif
> > +      - fsl,imx28-lcdif
> > +      - fsl,imx6sx-lcdif
> > +      - fsl,imx8mq-lcdif
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Pixel clock
> > +      - description: Bus clock
> > +      - description: Display AXI clock
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: "pix"
> > +      - const: "axi"
> > +      - const: "disp_axi"
> > +    minItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  port:
> > +    description: The LCDIF output port
> > +    type: object
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          remote-endpoint:
> > +            $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +        required:
> > +          - remote-endpoint
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx6sx-lcdif
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 3
> > +        clock-names:
> > +          minItems: 2
> > +          maxItems: 3
> > +      required:
> > +        - clock-names
> > +    else:
> > +      properties:
> > +        clocks:
> > +          minItems: 1
> > +        clock-names:
> > +          minItems: 1
>
> The else parts looks like it is not needed.
> The clock, clock-names properties has minItems: 1 already from above.

Conceptually you're right, this should be maxItems, not minItems.
However, the DT schema checker automatically adds a maxItems property
that equal minItems when only minItems is specified (and the other way
around as well). This is meant to allow shorter notations. I'm not
convinced it's a good idea, but that's the way it is today.

I'll change to maxItems as it's more explicit.

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx6sx-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    display-controller@2220000 {
> > +        compatible = "fsl,imx6sx-lcdif";
> > +        reg = <0x02220000 0x4000>;
> > +        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> > +                 <&clks IMX6SX_CLK_LCDIF_APB>,
> > +                 <&clks IMX6SX_CLK_DISPLAY_AXI>;
> > +        clock-names = "pix", "axi", "disp_axi";
> > +
> > +        port {
> > +            endpoint {
> > +                remote-endpoint = <&panel_in>;
> > +            };
> > +        };
> > +    };
>
> empty line before "..." - at least most files have it

I'll add that.

> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e3467e88714f..e3fac23383d2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11757,7 +11757,7 @@ M:	Stefan Agner <stefan@agner.ch>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Supported
> >  T:	git git://anongit.freedesktop.org/drm/drm-misc
> > -F:	Documentation/devicetree/bindings/display/mxsfb.txt
> > +F:	Documentation/devicetree/bindings/display/mxsfb.yaml
> >  F:	drivers/gpu/drm/mxsfb/
> >  
> >  MYLEX DAC960 PCI RAID Controller

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
