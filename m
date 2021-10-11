Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDD4297F8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 22:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ED96E53C;
	Mon, 11 Oct 2021 20:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793876E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 20:12:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 78ee2470-2acf-11ec-ac3c-0050568cd888;
 Mon, 11 Oct 2021 20:11:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 169E5194BAE;
 Mon, 11 Oct 2021 22:11:51 +0200 (CEST)
Date: Mon, 11 Oct 2021 22:12:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, tomi.valkeinen@ti.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/bridge: tc358764: Convert to YAML
 binding
Message-ID: <YWSakiB4OFqGzAiw@ravnborg.org>
References: <20211006135150.504897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006135150.504897-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AngeloGioacchino,

On Wed, Oct 06, 2021 at 03:51:50PM +0200, AngeloGioacchino Del Regno wrote:
> Convert the Toshiba TC358764 txt documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for all these conversions to DT-schema.

It would be very good if the changelog could document the warnings they
triggers when they are used to check the existing dts files.
This is a good way to document that the warnings are expected.

While waiting for Rob to review, here is one small nit. See inline
comment below.

My personal preference is to use 4 spaces for indent in the examples.
But two is perfectly fine and there is today no rule for it.

When you are resending these, then it would be nice with a cover letter
and all patches in one series. You can then use the cover letter both to
tell on a higher level what was changed since v1 and to give a status on the
conversion effort. I hope you have converted all bridge DT-schemas.

	Sam

> ---
>  .../display/bridge/toshiba,tc358764.txt       | 35 -------
>  .../display/bridge/toshiba,tc358764.yaml      | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
> deleted file mode 100644
> index 8f9abf28a8fa..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -TC358764 MIPI-DSI to LVDS panel bridge
> -
> -Required properties:
> -  - compatible: "toshiba,tc358764"
> -  - reg: the virtual channel number of a DSI peripheral
> -  - vddc-supply: core voltage supply, 1.2V
> -  - vddio-supply: I/O voltage supply, 1.8V or 3.3V
> -  - vddlvds-supply: LVDS1/2 voltage supply, 3.3V
> -  - reset-gpios: a GPIO spec for the reset pin
> -
> -The device node can contain following 'port' child nodes,
> -according to the OF graph bindings defined in [1]:
> -  0: DSI Input, not required, if the bridge is DSI controlled
> -  1: LVDS Output, mandatory
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	bridge@0 {
> -		reg = <0>;
> -		compatible = "toshiba,tc358764";
> -		vddc-supply = <&vcc_1v2_reg>;
> -		vddio-supply = <&vcc_1v8_reg>;
> -		vddlvds-supply = <&vcc_3v3_reg>;
> -		reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		port@1 {
> -			reg = <1>;
> -			lvds_ep: endpoint {
> -				remote-endpoint = <&panel_ep>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> new file mode 100644
> index 000000000000..267a870b6b0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358764.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC358764 MIPI-DSI to LVDS bridge
> +
> +maintainers:
> +  - Andrzej Hajda <a.hajda@samsung.com>
> +
> +description: |
> +  The TC358764 is bridge device which converts MIPI DSI or MIPI DPI to DP/eDP.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,tc358764
> +
> +  reg:
> +    description: Virtual channel number of a DSI peripheral
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO connected to the reset pin.
> +    maxItems: 1
> +
> +  vddc-supply:
> +    description: Core voltage supply, 1.2V
> +
> +  vddio-supply:
> +    description: I/O voltage supply, 1.8V or 3.3V
> +
> +  vddlvds-supply:
> +    description: LVDS1/2 voltage supply, 3.3V
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for MIPI DSI input, if the bridge DSI controlled
Fix: ..., if the bridge is DSI controlled

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for LVDS output (panel or connector).
> +
> +    required:
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddc-supply
> +  - vddio-supply
> +  - vddlvds-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@0 {
> +        compatible = "toshiba,tc358764";
> +        reg = <0>;
> +        vddc-supply = <&vcc_1v2_reg>;
> +        vddio-supply = <&vcc_1v8_reg>;
> +        vddlvds-supply = <&vcc_3v3_reg>;
> +        reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@1 {
> +            reg = <1>;
> +            lvds_ep: endpoint {
> +              remote-endpoint = <&panel_ep>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.33.0
