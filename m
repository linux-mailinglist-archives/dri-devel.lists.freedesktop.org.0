Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622329F7BC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768A86E914;
	Thu, 29 Oct 2020 22:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0156E914
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:20:52 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E89FE2001F;
 Thu, 29 Oct 2020 23:20:47 +0100 (CET)
Date: Thu, 29 Oct 2020 23:20:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
Message-ID: <20201029222046.GA904738@ravnborg.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
 a=Wcbe6aa342C-riXpf6cA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Thu, Oct 29, 2020 at 02:27:52PM -0700, Anitha Chrisanthus wrote:
> This patch adds bindings for Intel KeemBay Display
> 
> v2: review changes from Rob Herring
> v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
>     encoder entry, connect port to dsi)
>     MSSCAM is part of the display submodule and its used to reset LCD
>     and MIPI DSI clocks, so its best to be on this device tree.
> 
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Looks good - and the split betwwen the display and the mipi<->dsi parts
matches the understanding of the HW I have developed.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> new file mode 100644
> index 0000000..8a8effe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Devicetree bindings for Intel Keem Bay display controller
> +
> +maintainers:
> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> +  - Edmond J Dea <edmund.j.dea@intel.com>
> +
> +properties:
> +  compatible:
> +    const: intel,keembay-display
> +
> +  reg:
> +    items:
> +      - description: LCD registers range
> +      - description: Msscam registers range
> +
> +  reg-names:
> +    items:
> +      - const: lcd
> +      - const: msscam
> +
> +  clocks:
> +    items:
> +      - description: LCD controller clock
> +      - description: pll0 clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_lcd
> +      - const: clk_pll0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: Display output node to DSI.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display@20930000 {
> +        compatible = "intel,keembay-display";
> +        reg = <0x20930000 0x3000>,
> +              <0x20910000 0x30>;
> +        reg-names = "lcd", "msscam";
> +        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&scmi_clk 0x83>,
> +                 <&scmi_clk 0x0>;
> +        clock-names = "clk_lcd", "clk_pll0";
> +
> +        port {
> +            disp_out: endpoint {
> +                remote-endpoint = <&dsi_in>;
> +            };
> +        };
> +    };
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
