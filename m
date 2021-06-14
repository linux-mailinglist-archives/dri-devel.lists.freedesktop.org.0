Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED93A6DFE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 20:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073E89C2C;
	Mon, 14 Jun 2021 18:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC1689C2C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 18:10:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD6788C4;
 Mon, 14 Jun 2021 20:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623694213;
 bh=a5Sg792DzwCWzwbmuBe0Bh/onFDMfI42mllwatIAXe4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GtpFCEMj6zitGCZzoyng/W1/Cw0tI6YIFgChPLYdt/Oe56XLTXVFpeJGcRm+eImpg
 D0NKismfuYIeXcUSNGR39H4pOEss0BgScztaLELexxTDv8YR74qlRe0uG7xwTNv7Si
 qb5jJqjQK44vRIZGilAd/+lLVKDqR/FhIdIktt4g=
Date: Mon, 14 Jun 2021 21:09:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: bridge: lvds-codec:
 Document LVDS data mapping select
Message-ID: <YMebcWRcs38IKKTO@pendragon.ideasonboard.com>
References: <20210602203731.419310-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210602203731.419310-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, ch@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Wed, Jun 02, 2021 at 10:37:30PM +0200, Marek Vasut wrote:
> Decoder input LVDS format is a property of the decoder chip or even
> its strapping. Add DT property data-mapping the same way lvds-panel
> does, to define the LVDS data mapping.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use allOf
>     - Move the data-mapping to endpoint
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 53 ++++++++++++++-----
>  1 file changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index cacafa61e3f52..c493d007785ca 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -68,6 +68,18 @@ properties:
>            For LVDS encoders, port 1 is the LVDS output
>            For LVDS decoders, port 1 is the parallel output
>  
> +        properties:
> +          endpoint:
> +            properties:
> +              data-mapping:
> +                enum:
> +                  - jeida-18
> +                  - jeida-24
> +                  - vesa-24
> +                description: |
> +                  The color signals mapping order. See details in
> +                  Documentation/devicetree/bindings/display/panel/lvds.yaml
> +
>      required:
>        - port@0
>        - port@1
> @@ -79,21 +91,38 @@ properties:
>  
>    power-supply: true
>  
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        contains:
> -          const: lvds-encoder
> -then:
> -  properties:
> -    ports:
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: lvds-encoder
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:
> +                  properties:
> +                    pclk-sample: false
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: lvds-decoder

Is this correct ? The condition says that if it's an encoder (not a
decoder), then the data-mapping property on port 1 (the output port,
thus and LVDS port) is not allowed. I think this should be for decoders,
not encoders. You can thus combine the two conditions:

allOf:
  - if:
      not:
        properties:
          compatible:
            contains:
              const: lvds-encoder
    then:
      properties:
        ports:
          properties:
            port@0:
              properties:
                endpoint:
                  properties:
                    pclk-sample: false
            port@1:
              properties:
                endpoint:
                  properties:
                    data-mapping: false

You could also drop the allOf, or keep it to avoid whitespace churn when
a new condition will need to be added.

> +    then:
>        properties:
> -        port@0:
> +        ports:
>            properties:
> -            endpoint:
> +            port@1:
>                properties:
> -                pclk-sample: false
> +                endpoint:
> +                  properties:
> +                    data-mapping: false
>  
>  required:
>    - compatible

-- 
Regards,

Laurent Pinchart
