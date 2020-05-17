Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F01D663D
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 08:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2026E375;
	Sun, 17 May 2020 06:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF80D6E375
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 06:12:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2DD1980513;
 Sun, 17 May 2020 08:12:07 +0200 (CEST)
Date: Sun, 17 May 2020 08:12:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/12] dt-bindings: display: Convert ingenic,lcd.txt to
 YAML
Message-ID: <20200517061205.GA609600@ravnborg.org>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=oDXG_uVl-8910JDl3hUA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi PAul.

On Sat, May 16, 2020 at 11:50:46PM +0200, Paul Cercueil wrote:
> Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
> 
> In the process, the new ingenic,jz4780-lcd compatible string has been
> added.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Looks good.
Had to read the minItems/maxItems thing twice to get it,
so I also played a little with the examples, and it worked as expected.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> 
> Notes:
>     This patch comes from a different patchset so it's effectively a V2.
>     
>     Changes were:
>     - lcd_pclk and lcd clocks are in the correct order now,
>     - Add 'port' and 'ports' properties, and document the valid ports.
> 
>  .../bindings/display/ingenic,lcd.txt          |  45 -------
>  .../bindings/display/ingenic,lcd.yaml         | 126 ++++++++++++++++++
>  2 files changed, 126 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> deleted file mode 100644
> index 01e3261defb6..000000000000
> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Ingenic JZ47xx LCD driver
> -
> -Required properties:
> -- compatible: one of:
> -  * ingenic,jz4740-lcd
> -  * ingenic,jz4725b-lcd
> -  * ingenic,jz4770-lcd
> -- reg: LCD registers location and length
> -- clocks: LCD pixclock and device clock specifiers.
> -	   The device clock is only required on the JZ4740.
> -- clock-names: "lcd_pclk" and "lcd"
> -- interrupts: Specifies the interrupt line the LCD controller is connected to.
> -
> -Example:
> -
> -panel {
> -	compatible = "sharp,ls020b1dd01d";
> -
> -	backlight = <&backlight>;
> -	power-supply = <&vcc>;
> -
> -	port {
> -		panel_input: endpoint {
> -			remote-endpoint = <&panel_output>;
> -		};
> -	};
> -};
> -
> -
> -lcd: lcd-controller@13050000 {
> -	compatible = "ingenic,jz4725b-lcd";
> -	reg = <0x13050000 0x1000>;
> -
> -	interrupt-parent = <&intc>;
> -	interrupts = <31>;
> -
> -	clocks = <&cgu JZ4725B_CLK_LCD>;
> -	clock-names = "lcd";
> -
> -	port {
> -		panel_output: endpoint {
> -			remote-endpoint = <&panel_input>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> new file mode 100644
> index 000000000000..d56db1802fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs LCD controller devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^lcd-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - ingenic,jz4740-lcd
> +      - ingenic,jz4725b-lcd
> +      - ingenic,jz4770-lcd
> +      - ingenic,jz4780-lcd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Pixel clock
> +      - description: Module clock
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: lcd_pclk
> +      - const: lcd
> +    minItems: 1
> +
> +  port:
> +    description: OF graph bindings (specified in bindings/graph.txt).
> +
> +  ports:
> +    description: OF graph bindings (specified in bindings/graph.txt).
> +    type: object
> +    properties:
> +      port@0:
> +        type: object
> +        description: DPI output, to interface with TFT panels.
> +
> +      port@8:
> +        type: object
> +        description: Link to the Image Processing Unit (IPU).
> +          (See ingenic,ipu.yaml).
> +
> +    required:
> +      - port@0
> +
> +required:
> +    - compatible
> +    - reg
> +    - interrupts
> +    - clocks
> +    - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ingenic,jz4740-lcd
> +          - ingenic,jz4780-lcd
> +then:
> +  properties:
> +    clocks:
> +      minItems: 2
> +    clock-names:
> +      minItems: 2
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +    clock-names:
> +      maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4740-cgu.h>
> +    lcd-controller@13050000 {
> +      compatible = "ingenic,jz4740-lcd";
> +      reg = <0x13050000 0x1000>;
> +
> +      interrupt-parent = <&intc>;
> +      interrupts = <30>;
> +
> +      clocks = <&cgu JZ4740_CLK_LCD_PCLK>, <&cgu JZ4740_CLK_LCD>;
> +      clock-names = "lcd_pclk", "lcd";
> +
> +      port {
> +        endpoint {
> +          remote-endpoint = <&panel_input>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/jz4725b-cgu.h>
> +    lcd-controller@13050000 {
> +      compatible = "ingenic,jz4725b-lcd";
> +      reg = <0x13050000 0x1000>;
> +
> +      interrupt-parent = <&intc>;
> +      interrupts = <31>;
> +
> +      clocks = <&cgu JZ4725B_CLK_LCD>;
> +      clock-names = "lcd_pclk";
> +
> +      port {
> +        endpoint {
> +          remote-endpoint = <&panel_input>;
> +        };
> +      };
> +    };
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
