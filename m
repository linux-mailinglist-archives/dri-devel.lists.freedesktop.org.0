Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D061D2EC03C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 16:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A06E216;
	Wed,  6 Jan 2021 15:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6756E216
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 15:18:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD1BA878;
 Wed,  6 Jan 2021 16:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609946288;
 bh=6Mbpshc2s926symhXWx345xx90B3Cra5PtgDj9FiqdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6JMRL/n2Qd7l9lfx527Y2Ktoyn9a3/c+aBLBvW3g1JnCHJey0qA//ZOg+ZLHcrX9
 i/Fyo8mhUAg1qj8hoNcomGOvi9mk2+o0/J/hBvIXUeFpD0y+UuCc7Ho+B6ZVMoCAn2
 ScfZDX2dbKpm5PgFPvWpPXQ2FPqW5/NER4Rx5Jyk=
Date: Wed, 6 Jan 2021 17:17:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <X/XUow/ku/bsDXvr@pendragon.ideasonboard.com>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105060818.24158-5-laurent.pinchart+renesas@ideasonboard.com>
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
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Given that the maintainers property is mandatory in the schema, what's
the procedure when no maintainer steps up for a converter YAML binding ?

On Tue, Jan 05, 2021 at 08:08:16AM +0200, Laurent Pinchart wrote:
> Convert the Rockchip HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Use Mark's @gmail.com e-mail address as the @rock-chips.com address
>   bounces
> 
> Changes since v1:
> 
> - Drop pinctrl-0 and pinctrl-1
> - Use unevaluatedProperties instead of additionalProperties
> - Drop reg and interrupts as they're checked in the base schema
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> - Tidy up clock names
> ---
>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> deleted file mode 100644
> index 3d32ce137e7f..000000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Rockchip DWC HDMI TX Encoder
> -============================
> -
> -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> -with a companion PHY IP.
> -
> -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> -following device-specific properties.
> -
> -
> -Required properties:
> -
> -- compatible: should be one of the following:
> -		"rockchip,rk3228-dw-hdmi"
> -		"rockchip,rk3288-dw-hdmi"
> -		"rockchip,rk3328-dw-hdmi"
> -		"rockchip,rk3399-dw-hdmi"
> -- reg: See dw_hdmi.txt.
> -- reg-io-width: See dw_hdmi.txt. Shall be 4.
> -- interrupts: HDMI interrupt number
> -- clocks: See dw_hdmi.txt.
> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> -- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
> -  corresponding to the video input of the controller. The port shall have two
> -  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
> -- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
> -
> -Optional properties
> -
> -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> -  connected to a system I2C master this property contains a phandle to that
> -  I2C master controller.
> -- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
> -- clock-names: May contain "cec" as defined in dw_hdmi.txt.
> -- clock-names: May contain "grf", power for grf io.
> -- clock-names: May contain "vpll", external clock for some hdmi phy.
> -- phys: from general PHY binding: the phandle for the PHY device.
> -- phy-names: Should be "hdmi" if phys references an external phy.
> -
> -Optional pinctrl entry:
> -- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> -  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> -  i2c timeout.  It's intended that this unwedge pinctrl entry will
> -  cause the SDA line to be driven low to work around a hardware
> -  errata.
> -
> -Example:
> -
> -hdmi: hdmi@ff980000 {
> -	compatible = "rockchip,rk3288-dw-hdmi";
> -	reg = <0xff980000 0x20000>;
> -	reg-io-width = <4>;
> -	ddc-i2c-bus = <&i2c5>;
> -	rockchip,grf = <&grf>;
> -	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> -	clock-names = "iahb", "isfr";
> -	ports {
> -		hdmi_in: port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			hdmi_in_vopb: endpoint@0 {
> -				reg = <0>;
> -				remote-endpoint = <&vopb_out_hdmi>;
> -			};
> -			hdmi_in_vopl: endpoint@1 {
> -				reg = <1>;
> -				remote-endpoint = <&vopl_out_hdmi>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..d3b2f87f152a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Mark Yao <markyao0591@gmail.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> +  with a companion PHY IP.
> +
> +allOf:
> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3228-dw-hdmi
> +      - rockchip,rk3288-dw-hdmi
> +      - rockchip,rk3328-dw-hdmi
> +      - rockchip,rk3399-dw-hdmi
> +
> +  reg-io-width:
> +    const: 4
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - {}
> +      - {}
> +      # The next three clocks are all optional, but shall be specified in this
> +      # order when present.
> +      - description: The HDMI CEC controller main clock
> +      - description: Power for GRF IO
> +      - description: External clock for some HDMI PHY
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - {}
> +      - {}
> +      - enum:
> +          - cec
> +          - grf
> +          - vpll
> +      - enum:
> +          - grf
> +          - vpll
> +      - const: vpll
> +
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The HDMI DDC bus can be connected to either a system I2C master or the
> +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> +      to a system I2C master this property contains a phandle to that I2C
> +      master controller.
> +
> +  phys:
> +    maxItems: 1
> +    description: The HDMI PHY
> +
> +  phy-names:
> +    const: hdmi
> +
> +  pinctrl-names:
> +    description:
> +      The unwedge pinctrl entry shall drive the DDC SDA line low. This is
> +      intended to work around a hardware errata that can cause the DDC I2C
> +      bus to be wedged.
> +    items:
> +      - const: default
> +      - const: unwedge
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input of the DWC HDMI TX
> +
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            description: Connection to the VOPB
> +
> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            description: Connection to the VOPL
> +
> +        required:
> +          - endpoint@0
> +          - endpoint@1
> +
> +    required:
> +      - port
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the GRF to mux vopl/vopb.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-io-width
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - ports
> +  - rockchip,grf
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3288-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    hdmi: hdmi@ff980000 {
> +        compatible = "rockchip,rk3288-dw-hdmi";
> +        reg = <0xff980000 0x20000>;
> +        reg-io-width = <4>;
> +        ddc-i2c-bus = <&i2c5>;
> +        rockchip,grf = <&grf>;
> +        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> +        clock-names = "iahb", "isfr";
> +
> +        ports {
> +            port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                hdmi_in_vopb: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&vopb_out_hdmi>;
> +                };
> +                hdmi_in_vopl: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&vopl_out_hdmi>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
