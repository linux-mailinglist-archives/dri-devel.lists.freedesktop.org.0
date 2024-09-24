Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65383984E94
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B88410E774;
	Tue, 24 Sep 2024 23:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PtCfff1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223610E774
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:03:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E56CA43953;
 Tue, 24 Sep 2024 23:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EEDC4CEC4;
 Tue, 24 Sep 2024 23:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727219011;
 bh=gYYRhZD3rvvtpnrdcL4upxJCTxcxrqykk7cJXG94c74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PtCfff1RO6YZh019eDvWMs7A2ST59pNEh7OgksLQonGnY/lqjFhr+za1Vkuhz/M10
 VSnjXlpsbw+qMWzrSO7inHzf4jhbf50hkVF8wCGMrE/Ld1tE6qbxrL9r1GcBT4l4TE
 OBgVQdFrORhmBMFcNaC51WgYOZYruTL9Z6HnNwCvgtDiSOZpj9Zjv2X+dJR3zXqEZV
 NwBdtpxqfYxtpPz3WG7a2AyMDtuABcN7Y5uSeHAU6ufxzYCm/NuMFsGAUbKKx3oyon
 SfEYUMMbk2PrDSoXXcUuEjSku/aaIrXDQ25FJZJkk4YonlZHy1AcAOC+KCulU3oYvh
 O42LuoJvm+qMA==
Date: Tue, 24 Sep 2024 18:03:30 -0500
From: Rob Herring <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: lcdif: Add support for specifying display
 with timings
Message-ID: <20240924230330.GB441530-robh@kernel.org>
References: <20240923135744.2813712-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923135744.2813712-1-lukma@denx.de>
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

On Mon, Sep 23, 2024 at 03:57:44PM +0200, Lukasz Majewski wrote:
> Up till now the fsl,lcdif.yaml was requiring the "port" property as a
> must have to specify the display interface on iMX devices.
> 
> However, it shall also be possible to specify the display only with
> passing its timing parameters (h* and v* ones) via "display" property:
> (as in
> Documentation/devicetree/bindings/display/panel/display-timings.yaml).
> 
> Such approach has already been used (also in the mainline) with several
> imx28, imx5x and imx6q devices.
> 
> This change allows them to pass the DT_SCHEMA check without issues.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  .../bindings/display/fsl,lcdif.yaml           | 51 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 8e3a98aeec32..14bb64b5b72d 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -50,6 +50,10 @@ properties:
>        - const: disp_axi
>      minItems: 1
>  
> +  display:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle for display timing information
> +
>    dmas:
>      items:
>        - description: DMA specifier for the RX DMA channel.
> @@ -64,6 +68,9 @@ properties:
>        - description: LCDIF Error interrupt
>      minItems: 1
>  
> +  lcd-supply:
> +    description: Regulator for LCD supply voltage.
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -76,7 +83,10 @@ required:
>    - reg
>    - clocks
>    - interrupts
> -  - port
> +
> +patternProperties:
> +  'display([0-9])':

This allows for 'foodisplay0bar'. You need start and end anchors.

And it doesn't even have to be a node because there are no contraints 
here. You need 'type: object' and then to define what's in the node.


> +    description: Node with display timing parameters
>  
>  additionalProperties: false
>  
> @@ -197,5 +207,42 @@ examples:
>              };
>          };
>      };
> -
> +  - |
> +    lcdif: lcdif@80030000 {
> +        compatible = "fsl,imx28-lcdif";
> +        reg = <0x80030000 0x2000>;
> +        interrupts = <38>;
> +        clocks = <&clks 55>;
> +        dmas = <&dma_apbh 13>;
> +        dma-names = "rx";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&lcdif_24bit_pins_a>, <&lcdif_sync_pins_bttc>,
> +                 <&lcdif_reset_pins_bttc>;
> +        lcd-supply = <&reg_3v3>;
> +        display = <&display0>;
> +        status = "okay";

Don't need status in the examples.

> +
> +                bits-per-pixel = <32>;
> +                bus-width = <24>;
> +                display-timings {
> +                        native-mode = <&timing0>;
> +                        timing0: timing0 {
> +                                clock-frequency = <6500000>;
> +                                hactive = <320>;
> +                                vactive = <240>;
> +                                hfront-porch = <20>;
> +                                hback-porch = <38>;
> +                                hsync-len = <30>;
> +                                vfront-porch = <4>;
> +                                vback-porch = <14>;
> +                                vsync-len = <4>;
> +                                hsync-active = <0>;
> +                                vsync-active = <0>;
> +                                de-active = <0>;
> +                                pixelclk-active = <1>;
> +                        };
> +                };
> +        };
> +    };
>  ...
> -- 
> 2.39.2
> 
