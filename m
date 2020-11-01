Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E610C2A1F93
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 17:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E084A6E0F1;
	Sun,  1 Nov 2020 16:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B1C6E0F1
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 16:40:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27F1680E;
 Sun,  1 Nov 2020 17:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604248812;
 bh=YZpOjafDiwYLclaE2bL0ACE0n5RjBNAzajhphFUjsOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G7eQT5dUdGrCHpbOgpkx+JPOQsGqmg6wunYCS705Er/JWK/pXEwt7v670HBdFdiUI
 cyuYAfZ8Hvz7TW01tUx04LCbYIt8v78qrbREk+SVklIaX2m9BnRyaZB9jxO4lke76P
 VYGgj45gKTLs/TcCR0d+SbbLbsR9WnDcXiGTCaWM=
Date: Sun, 1 Nov 2020 18:39:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v6 1/2] dt-bindings: display: himax,hx8837: Add Himax
 HX8837 bindings
Message-ID: <20201101163922.GA3971@pendragon.ideasonboard.com>
References: <20201030030800.1036888-1-lkundrak@v3.sk>
 <20201030030800.1036888-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030030800.1036888-2-lkundrak@v3.sk>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lubomir,

Thank you for the patch.

On Fri, Oct 30, 2020 at 04:07:59AM +0100, Lubomir Rintel wrote:
> Himax HX8837 is a secondary display controller used to drive the panel
> on OLPC platforms.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Changes since v4:
> - Rob's Reviewed-by
> 
> Changes since v3:
> - Moved to bindings/display/
> - Added the ports
> - Converted to YAML
> - Removed Pavel's Ack, because the changes are substantial
> 
> Changes since v2:
> - s/betweend/between/
> 
> Changes since v1:
> - s/load-gpio/load-gpios/
> - Use interrupt bindings instead of gpio for the IRQ
> 
>  .../bindings/display/bridge/himax,hx8837.yaml | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml b/Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml
> new file mode 100644
> index 0000000000000..f5b0a00f5089d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2018,2019,2020 Lubomir Rintel <lkundrak@v3.sk>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/himax,hx8837.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HX8837 Display Controller Device Tree Bindings
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +properties:
> +  compatible:
> +    const: himax,hx8837
> +
> +  reg:
> +    const: 0xd
> +
> +  load-gpios:
> +    maxItems: 1
> +    description: GPIO specifier of DCON_LOAD pin (active high)
> +
> +  stat-gpios:
> +    minItems: 2
> +    description: GPIO specifier of DCON_STAT0 and DCON_STAT1 pins (active high)
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt specifier of DCON_IRQ pin (edge falling)
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Video port for RGB input.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Video port connected to the panel.
> +
> +    required:
> +      - port@0
> +      - port@1

No regulators ?

> +
> +required:
> +  - compatible
> +  - reg
> +  - load-gpios
> +  - stat-gpios

Do stat-gpios need to be mandatory ? The driver in patch 2/2 doesn't
seem to use them, could we have boards where those signals are not
connected to GPIOs ?

> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        

Could you please avoid spaces or tabs at end of lines ? There are three
other occurrences below.

> +        lcd-controller@d {
> +            compatible = "himax,hx8837";
> +            reg = <0x0d>;
> +            stat-gpios = <&gpio 100 GPIO_ACTIVE_HIGH>,
> +                         <&gpio 101 GPIO_ACTIVE_HIGH>;
> +            load-gpios = <&gpio 142 GPIO_ACTIVE_HIGH>;
> +            interrupts = <&gpio 124 IRQ_TYPE_EDGE_FALLING>;
> +    
> +            ports {
> +                #address-cells = <0x01>;
> +                #size-cells = <0x00>;
> +    
> +                port@0 {
> +                    reg = <0x00>;

reg = <0> should be fine. Same below.

With thse small issues addressed,

> +                    dcon_rgb_in: endpoint {
> +                        remote-endpoint = <&lcd0_rgb_out>;
> +                    };
> +                };
> +    
> +                port@1 {
> +                    reg = <0x01>;
> +                    dcon_gettl_out: endpoint {
> +                        remote-endpoint = <&panel_dettl_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };

It's customary to end bindings with

...

(not sure why though, given that it seems to work find without)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
