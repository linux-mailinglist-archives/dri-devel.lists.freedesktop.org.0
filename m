Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F21C6323
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 23:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7746E330;
	Tue,  5 May 2020 21:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575036E105
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 21:34:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89788542;
 Tue,  5 May 2020 23:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1588714495;
 bh=YHDjkXDnsDM+j5ADChCoJFyfuFCYqoFVwlxnuVKc0ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L4sOPRmLgUFQomj1r2bs1jYXkG0njixlxc4uDGiEVt0Wcz3JUIMKlzri13aRYUetW
 wuxDrbSMkcoXt2MODTB/OQ8xTaVYxMX0r6XBPMmDrId6vu0juZGjYKxcIPsIr5UILz
 koRwuj1kKAlKWa7EkG+zIj0wAyT+zV3jQFloOEnc=
Date: Wed, 6 May 2020 00:34:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/6] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to
 yaml
Message-ID: <20200505213450.GA8640@pendragon.ideasonboard.com>
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jonas@kwiboo.se, jeffrey.l.hugo@gmail.com, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 a.hajda@samsung.com, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Thu, Apr 30, 2020 at 12:46:15PM -0700, Douglas Anderson wrote:
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - specification => specifier.
> - power up => power.
> - Added back missing suspend-gpios.
> - data-lanes and lane-polarities are are the right place now.
> - endpoints don't need to be patternProperties.
> - Specified more details for data-lanes and lane-polarities.
> - Added old example back in, fixing bugs in it.
> - Example i2c bus is just called "i2c", not "i2c1" now.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 279 ++++++++++++++++++
>  2 files changed, 279 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> deleted file mode 100644
> index 8ec4a7f2623a..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -SN65DSI86 DSI to eDP bridge chip
> ---------------------------------
> -
> -This is the binding for Texas Instruments SN65DSI86 bridge.
> -http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> -
> -Required properties:
> -- compatible: Must be "ti,sn65dsi86"
> -- reg: i2c address of the chip, 0x2d as per datasheet
> -- enable-gpios: gpio specification for bridge_en pin (active high)
> -
> -- vccio-supply: A 1.8V supply that powers up the digital IOs.
> -- vpll-supply: A 1.8V supply that powers up the displayport PLL.
> -- vcca-supply: A 1.2V supply that powers up the analog circuits.
> -- vcc-supply: A 1.2V supply that powers up the digital core.
> -
> -Optional properties:
> -- interrupts-extended: Specifier for the SN65DSI86 interrupt line.
> -
> -- gpio-controller: Marks the device has a GPIO controller.
> -- #gpio-cells    : Should be two. The first cell is the pin number and
> -                   the second cell is used to specify flags.
> -                   See ../../gpio/gpio.txt for more information.
> -- #pwm-cells : Should be one. See ../../pwm/pwm.yaml for description of
> -               the cell formats.
> -
> -- clock-names: should be "refclk"
> -- clocks: Specification for input reference clock. The reference
> -	  clock rate must be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> -
> -- data-lanes: See ../../media/video-interface.txt
> -- lane-polarities: See ../../media/video-interface.txt
> -
> -- suspend-gpios: specification for GPIO1 pin on bridge (active low)
> -
> -Required nodes:
> -This device has two video ports. Their connections are modelled using the
> -OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -
> -- Video port 0 for DSI input
> -- Video port 1 for eDP output
> -
> -Example
> --------
> -
> -edp-bridge@2d {
> -	compatible = "ti,sn65dsi86";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	reg = <0x2d>;
> -
> -	enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
> -	suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
> -
> -	interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
> -
> -	vccio-supply = <&pm8916_l17>;
> -	vcca-supply = <&pm8916_l6>;
> -	vpll-supply = <&pm8916_l17>;
> -	vcc-supply = <&pm8916_l6>;
> -
> -	clock-names = "refclk";
> -	clocks = <&input_refclk>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			edp_bridge_in: endpoint {
> -				remote-endpoint = <&dsi_out>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			edp_bridge_out: endpoint {
> -				data-lanes = <2 1 3 0>;
> -				lane-polarities = <0 1 0 1>;
> -				remote-endpoint = <&edp_panel_in>;
> -			};
> -		};
> -	};
> -}
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> new file mode 100644
> index 000000000000..6d7d40ad45ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -0,0 +1,279 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI86 DSI to eDP bridge chip
> +
> +maintainers:
> +  - Sandeep Panda <spanda@codeaurora.org>
> +
> +description: |
> +  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
> +  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi86
> +
> +  reg:
> +    const: 0x2d
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge_en pin (active high).
> +
> +  suspend-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for GPIO1 pin on bridge (active low).
> +
> +  vccio-supply:
> +    description: A 1.8V supply that powers the digital IOs.
> +
> +  vpll-supply:
> +    description: A 1.8V supply that powers the DisplayPort PLL.
> +
> +  vcca-supply:
> +    description: A 1.2V supply that powers the analog circuits.
> +
> +  vcc-supply:
> +    description: A 1.2V supply that powers the digital core.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Clock specifier for input reference clock. The reference clock rate must
> +      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> +
> +  clock-names:
> +    const: refclk
> +
> +  gpio-controller: true
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      First cell is pin number, second cell is flags.  GPIO pin numbers are
> +      1-based to match the datasheet.  See ../../gpio/gpio.txt for more
> +      information.
> +
> +  '#pwm-cells':
> +    const: 1
> +    description: See ../../pwm/pwm.yaml for description of the cell formats.
> +
> +  ports:
> +    type: object

Maybe

    additionalProperties: false

here ?

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum:
> +                    - 0
> +                    - 1
> +                    - 2
> +                    - 3
> +                description: See ../../media/video-interface.txt

And maybe
                uniqueItems: true

? Same for port@1.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +              lane-polarities:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum:
> +                    - 0
> +                    - 1
> +                description: See ../../media/video-interface.txt
> +
> +            dependencies:
> +              data-lanes: [lane-polarities]
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for eDP output (panel or connector).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum:
> +                    - 0
> +                    - 1
> +                    - 2
> +                    - 3
> +                description: See ../../media/video-interface.txt
> +
> +              lane-polarities:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum:
> +                    - 0
> +                    - 1
> +                description: See ../../media/video-interface.txt
> +
> +            dependencies:
> +              data-lanes: [lane-polarities]
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - vccio-supply
> +  - vpll-supply
> +  - vcca-supply
> +  - vcc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@2d {
> +        compatible = "ti,sn65dsi86";
> +        reg = <0x2d>;
> +
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +
> +        vpll-supply = <&src_pp1800_s4a>;
> +        vccio-supply = <&src_pp1800_s4a>;
> +        vcca-supply = <&src_pp1200_l2a>;
> +        vcc-supply = <&src_pp1200_l2a>;
> +
> +        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> +        clock-names = "refclk";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            endpoint {
> +              remote-endpoint = <&panel_in_edp>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@2d {
> +        compatible = "ti,sn65dsi86";
> +        reg = <0x2d>;
> +
> +        enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
> +        suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
> +
> +        interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
> +
> +        vccio-supply = <&pm8916_l17>;
> +        vcca-supply = <&pm8916_l6>;
> +        vpll-supply = <&pm8916_l17>;
> +        vcc-supply = <&pm8916_l6>;
> +
> +        clock-names = "refclk";
> +        clocks = <&input_refclk>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            edp_bridge_in: endpoint {
> +              remote-endpoint = <&dsi_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            edp_bridge_out: endpoint {
> +              data-lanes = <2 1 3 0>;
> +              lane-polarities = <0 1 0 1>;
> +              remote-endpoint = <&edp_panel_in>;
> +            };
> +          };
> +        };
> +      };
> +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
