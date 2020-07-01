Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C42107E4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE726E184;
	Wed,  1 Jul 2020 09:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61FC6E184
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:19:44 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B6A0C80503;
 Wed,  1 Jul 2020 11:19:41 +0200 (CEST)
Date: Wed, 1 Jul 2020 11:19:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
Message-ID: <20200701091940.GB266726@ravnborg.org>
References: <20200701070344.6330-1-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701070344.6330-1-simhavcs@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7oS1v-cyAAAA:8 a=pGLkceISAAAA:8 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=dHiIaXZRstW55kd5OMIA:9 a=ie3UdB0zIniZHkjz:21
 a=LqGCcjRVTOAnRfX9:21 a=CjuIK1q_8ugA:10 a=PcM2qe9_4d1tJnOwuzRa:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris.Cheng@taec.toshiba.com,
 Ken-Sue.Tan@taec.toshiba.com, David Airlie <airlied@linux.ie>,
 narmstrong@baylibre.com, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Bhushan.Patel@taec.toshiba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay.

On Wed, Jul 01, 2020 at 12:33:36PM +0530, Vinay Simha BN wrote:
> This driver is tested with two panels with Apq8016-IFC6309 board
> https://www.inforcecomputing.com/products/single-board-computers-sbc/qualcomm-snapdragon-410-inforce-6309-micro-sbc
> 
> 1. 1366x768@60 auo,b101xtn01 data-mapping = "jeida-24"
> 2. 800x480@60 innolux,at070tn92 data-mapping = "vesa-24"
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
>  Initial version wast .txt file
> 
> v2:
>  From txt to yaml file format
> 
> v3:
> * Andrzej Hajda review comments incorporated
>   dual port lvds implemented
> 
> * Laurent Pinchart review comments incorporated
>   dsi lanes property removed and it is dynamically
>   picked from the dsi ports
>   VESA/JEIDA format picked from panel-lvds dts
> ---
>  .../display/bridge/toshiba,tc358775.yaml      | 204 ++++++++++++++++++
>  1 file changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> new file mode 100644
> index 000000000000..ec53d62d408b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> @@ -0,0 +1,204 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC358775 DSI to LVDS bridge bindings
> +
> +maintainers:
> + - Vinay Simha BN <simhavcs@gmail.com>
> +
> +description: |
> + This binding supports DSI to LVDS bridge TC358775
> +
> +properties:
> +  compatible:
> +    const: toshiba,tc358775
> +
> +  reg:
> +    maxItems: 1
> +    description: i2c address of the bridge, 0x0f
> +
> +  vdd-supply:
> +    maxItems: 1
> +    description:  1.2V LVDS Power Supply
> +
> +  vddio-supply:
> +    maxItems: 1
> +    description: 1.8V IO Power Supply
> +
> +  stby-gpios:
> +    maxItems: 1
> +    description: Standby pin, Low active
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Hardware reset, Low active
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: |
> +          DSI Input. The remote endpoint phandle should be a
> +          reference to a valid mipi_dsi_host device node.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Video port for LVDS output (panel or connector).
> +
> +      port@2:
> +        type: object
> +        description: |
> +          Video port for Dual link LVDS output (panel or connector).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> + - compatible
> + - reg
> + - vdd-supply
> + - vddio-supply
> + - stby-gpios
> + - reset-gpios
> + - ports
> +
> +examples:
> + - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c@78b8000 {
> +        /* On High speed expansion */
> +        label = "HS-I2C2";
> +        reg = <0x078b8000 0x500>;
> +        clock-frequency = <400000>; /* fastmode operation */
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tc_bridge: bridge@f {
> +            compatible = "toshiba,tc358775";
> +            reg = <0x0f>;
> +
> +            vdd-supply = <&pm8916_l2>;
> +            vddio-supply = <&pm8916_l6>;
> +
> +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    d2l_in_test: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    lvds_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +    dsi@1a98000 {
> +        reg = <0x1a98000 0x25c>;
> +        reg-names = "dsi_ctrl";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@1 {
> +                reg = <1>;
> +                dsi0_out: endpoint {
> +                    remote-endpoint = <&d2l_in_test>;
> +                        data-lanes = <0 1 2 3>;
> +                };
> +             };
> +         };
> +     };
> +
Fix indent. One of the '}' is indented one space too much.


> + - |
> +    i2c@78b8000 {
> +        /* On High speed expansion */
> +        label = "HS-I2C2";
> +        reg = <0x078b8000 0x500>;
> +        clock-frequency = <400000>; /* fastmode operation */
> +        #address-cells = <1>;
> +        #size-cells = <0>;
What is the purpose with the second example?
Does it explain the binding better in some way?

The examples shall help understanding the binding, not help
understanding the HW. The latter is the role of the binding.


> +
> +        tc_bridge_dual: bridge@f {
> +            compatible = "toshiba,tc358775";
> +            reg = <0x0f>;
> +
> +            vdd-supply = <&pm8916_l2>;
> +            vddio-supply = <&pm8916_l6>;
> +
> +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    d2l_in_dual: endpoint {
> +                        remote-endpoint = <&dsi0_out_dual>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    lvds0_out: endpoint {
> +                        remote-endpoint = <&panel_in0>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    lvds1_out: endpoint {
> +                        remote-endpoint = <&panel_in1>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +    dsi@1a98000 {
> +        reg = <0x1a98000 0x25c>;
> +        reg-names = "dsi_ctrl";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@1 {
> +                reg = <1>;
> +                dsi0_out_dual: endpoint {
> +                    remote-endpoint = <&d2l_in_dual>;
> +                        data-lanes = <0 1 2 3>;
> +                };
> +             };
> +         };
> +     };
If this example is kept then fix indent of '}'.

	Sam
> +...
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
