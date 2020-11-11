Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E72AFA1B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 21:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FB489C55;
	Wed, 11 Nov 2020 20:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB5389A0F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 20:59:02 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4794A200E0;
 Wed, 11 Nov 2020 21:58:59 +0100 (CET)
Date: Wed, 11 Nov 2020 21:58:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: display: mcde: Convert to YAML schema
Message-ID: <20201111205857.GB3013948@ravnborg.org>
References: <20201111130754.2283993-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111130754.2283993-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=yBEHZZzgUMe7HTM6xYwA:9 a=cynmI1JdOsakvpse:21
 a=Wbn6I1S6ap2JUSG2:21 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

A few comments when I read through this.

	Sam

On Wed, Nov 11, 2020 at 02:07:54PM +0100, Linus Walleij wrote:
> This moves the MCDE bindings over to using the YAML schema
> to describe the ST-Ericsson MCDE display controller,
> making use of the generic DSI controller schema.
> 
> We also add the "port" node, we will use this when adding
> LCD panels using the direct parallel interface DPI instead
> of DSI.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Cut the description on the interrupts.
> - Drop maxItems: 3 on clocks and clock-names: implicit from
>   the number of listed items.
> - Tag the DSI ports with unevaluatedProperties: false
> - Tag the MCDE as such with additionalProperties: true
> - It was a bit hard to test this because of the code base
>   being out of phase with the validation tools but it seems
>   to check out.
> ---
>  .../devicetree/bindings/display/ste,mcde.txt  | 104 -----------
>  .../devicetree/bindings/display/ste,mcde.yaml | 166 ++++++++++++++++++
>  2 files changed, 166 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ste,mcde.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ste,mcde.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ste,mcde.txt b/Documentation/devicetree/bindings/display/ste,mcde.txt
> deleted file mode 100644
> index 4c33c692bd5f..000000000000
> --- a/Documentation/devicetree/bindings/display/ste,mcde.txt
> +++ /dev/null
> @@ -1,104 +0,0 @@
> -ST-Ericsson Multi Channel Display Engine MCDE
> -
> -The ST-Ericsson MCDE is a display controller with support for compositing
> -and displaying several channels memory resident graphics data on DSI or
> -LCD displays or bridges. It is used in the ST-Ericsson U8500 platform.
> -
> -Required properties:
> -
> -- compatible: must be:
> -  "ste,mcde"
> -- reg: register base for the main MCDE control registers, should be
> -  0x1000 in size
> -- interrupts: the interrupt line for the MCDE
> -- epod-supply: a phandle to the EPOD regulator
> -- vana-supply: a phandle to the analog voltage regulator
> -- clocks: an array of the MCDE clocks in this strict order:
> -  MCDECLK (main MCDE clock), LCDCLK (LCD clock), PLLDSI
> -  (HDMI clock), DSI0ESCLK (DSI0 energy save clock),

> -  DSI1ESCLK (DSI1 energy save clock), DSI2ESCLK (DSI2 energy
> -  save clock)
I did not find these two clocks in the binding below.

> -- clock-names: must be the following array:
> -  "mcde", "lcd", "hdmi"
> -  to match the required clock inputs above.
> -- #address-cells: should be <1> (for the DSI hosts that will be children)
> -- #size-cells: should be <1> (for the DSI hosts that will be children)
> -- ranges: this should always be stated
> -
> -Required subnodes:
> -
> -The devicetree must specify subnodes for the DSI host adapters.
> -These must have the following characteristics:
> -
> -- compatible: must be:
> -  "ste,mcde-dsi"
> -- reg: must specify the register range for the DSI host
> -- vana-supply: phandle to the VANA voltage regulator
> -- clocks: phandles to the high speed and low power (energy save) clocks
> -  the high speed clock is not present on the third (dsi2) block, so it
> -  should only have the "lp" clock
> -- clock-names: "hs" for the high speed clock and "lp" for the low power
> -  (energy save) clock
> -- #address-cells: should be <1>
> -- #size-cells: should be <0>
> -
> -Display panels and bridges will appear as children on the DSI hosts, and
> -the displays are connected to the DSI hosts using the common binding
> -for video transmitter interfaces; see
> -Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -If a DSI host is unused (not connected) it will have no children defined.
> -
> -Example:
> -
> -mcde@a0350000 {
> -	compatible = "ste,mcde";
> -	reg = <0xa0350000 0x1000>;
> -	interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -	epod-supply = <&db8500_b2r2_mcde_reg>;
> -	vana-supply = <&ab8500_ldo_ana_reg>;
> -	clocks = <&prcmu_clk PRCMU_MCDECLK>, /* Main MCDE clock */
> -		 <&prcmu_clk PRCMU_LCDCLK>, /* LCD clock */
> -		 <&prcmu_clk PRCMU_PLLDSI>; /* HDMI clock */
> -	clock-names = "mcde", "lcd", "hdmi";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges;
> -
> -	dsi0: dsi@a0351000 {
> -		compatible = "ste,mcde-dsi";
> -		reg = <0xa0351000 0x1000>;
> -		vana-supply = <&ab8500_ldo_ana_reg>;
> -		clocks = <&prcmu_clk PRCMU_DSI0CLK>, <&prcmu_clk PRCMU_DSI0ESCCLK>;
> -		clock-names = "hs", "lp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		panel {
> -			compatible = "samsung,s6d16d0";
> -			reg = <0>;
> -			vdd1-supply = <&ab8500_ldo_aux1_reg>;
> -			reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
> -		};
> -
> -	};
> -	dsi1: dsi@a0352000 {
> -		compatible = "ste,mcde-dsi";
> -		reg = <0xa0352000 0x1000>;
> -		vana-supply = <&ab8500_ldo_ana_reg>;
> -		clocks = <&prcmu_clk PRCMU_DSI1CLK>, <&prcmu_clk PRCMU_DSI1ESCCLK>;
> -		clock-names = "hs", "lp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -	dsi2: dsi@a0353000 {
> -		compatible = "ste,mcde-dsi";
> -		reg = <0xa0353000 0x1000>;
> -		vana-supply = <&ab8500_ldo_ana_reg>;
> -		/* This DSI port only has the Low Power / Energy Save clock */
> -		clocks = <&prcmu_clk PRCMU_DSI2ESCCLK>;
> -		clock-names = "lp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/ste,mcde.yaml b/Documentation/devicetree/bindings/display/ste,mcde.yaml
> new file mode 100644
> index 000000000000..51851566c72d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ste,mcde.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST-Ericsson Multi Channel Display Engine MCDE
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: ste,mcde
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: an array of the MCDE clocks
> +    items:
> +      - description: MCDECLK (main MCDE clock)
> +      - description: LCDCLK (LCD clock)
> +      - description: PLLDSI (HDMI clock)
> +
> +  clock-names:
> +    items:
> +      - const: mcde
> +      - const: lcd
> +      - const: hdmi
> +
> +  epod-supply:
> +    description: a phandle to the EPOD regulator
> +
> +  vana-supply:
> +    description: a phandle to the analog voltage regulator
> +
> +  port:
> +    type: object
> +    description:
> +      A DPI port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +

This is a transition from .txt to DT Schema so OK with this sub-node.
But otherwise the dsi node should have been linked using graph nodes.
So OK - just thinking out loud.

> +patternProperties:
> +  "^dsi@[0-9a-f]+$":
> +    description: subnodes for the three DSI host adapters
> +    type: object
> +    allOf:
> +      - $ref: dsi-controller.yaml#
> +    properties:
> +      compatible:
> +        const: ste,mcde-dsi
> +
> +      reg:
> +        maxItems: 1
> +
> +      vana-supply:
> +        description: a phandle to the analog voltage regulator
> +
> +      clocks:
> +        description: phandles to the high speed and low power (energy save) clocks
> +          the high speed clock is not present on the third (dsi2) block, so it
> +          should only have the "lp" clock
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        oneOf:
> +          - items:
> +              - const: hs
> +              - const: lp
> +          - items:
> +              - const: lp
> +
The dsi nodes needs the #address-cells and #size-cells - at least if a
panel node is specified.

> +    required:
> +      - compatible
> +      - reg
> +      - vana-supply
> +      - clocks
> +      - clock-names
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - epod-supply
> +  - vana-supply
> +
> +additionalProperties: true
Why are additional properties allowed here?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/mfd/dbx500-prcmu.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mcde@a0350000 {
> +      compatible = "ste,mcde";
> +      reg = <0xa0350000 0x1000>;
> +      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +      epod-supply = <&db8500_b2r2_mcde_reg>;
> +      vana-supply = <&ab8500_ldo_ana_reg>;
> +      clocks = <&prcmu_clk PRCMU_MCDECLK>,
> +               <&prcmu_clk PRCMU_LCDCLK>,
> +               <&prcmu_clk PRCMU_PLLDSI>;
> +      clock-names = "mcde", "lcd", "hdmi";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      dsi0: dsi@a0351000 {
> +        compatible = "ste,mcde-dsi";
> +        reg = <0xa0351000 0x1000>;
> +        vana-supply = <&ab8500_ldo_ana_reg>;
> +        clocks = <&prcmu_clk PRCMU_DSI0CLK>, <&prcmu_clk PRCMU_DSI0ESCCLK>;
> +        clock-names = "hs", "lp";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +          compatible = "samsung,s6d16d0";
> +          reg = <0>;
> +          vdd1-supply = <&ab8500_ldo_aux1_reg>;
> +          reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
> +        };
> +      };
> +
> +      dsi1: dsi@a0352000 {
> +        compatible = "ste,mcde-dsi";
> +        reg = <0xa0352000 0x1000>;
> +        vana-supply = <&ab8500_ldo_ana_reg>;
> +        clocks = <&prcmu_clk PRCMU_DSI1CLK>, <&prcmu_clk PRCMU_DSI1ESCCLK>;
> +        clock-names = "hs", "lp";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +      };
> +
> +      dsi2: dsi@a0353000 {
> +        compatible = "ste,mcde-dsi";
> +        reg = <0xa0353000 0x1000>;
> +        vana-supply = <&ab8500_ldo_ana_reg>;
> +        /* This DSI port only has the Low Power / Energy Save clock */
> +        clocks = <&prcmu_clk PRCMU_DSI2ESCCLK>;
> +        clock-names = "lp";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +      };
> +    };
> +
> +...
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
