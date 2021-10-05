Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343F421AF4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 02:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5886A6EAD2;
	Tue,  5 Oct 2021 00:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154486EAD2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 00:03:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC52625B;
 Tue,  5 Oct 2021 02:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633392225;
 bh=vTWJHsJppItdG1fvMuN4FUg4+H954D3cWaDRpVVr4BY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RorcdFyIXDcQWYyBm7X4AMbZkTAGJv1Cq2IPPJ3KbwtggRi3+o3GzmGbvhxWuWuYQ
 W0/c9TD2Sih7LN+nHOOqvyyHVLBi0I3KQ1Cy1jYRylvOJUL9bKuBSXpyagQWnV1U8j
 6OrWE8TUpkW+Lo5FaUks2oNbp0k4nJEsmRVILCaA=
Date: Tue, 5 Oct 2021 03:03:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 1/2] dt-bindings: display: bridge: lvds-codec:
 Document LVDS data mapping select
Message-ID: <YVuWWz+njDNy99sz@pendragon.ideasonboard.com>
References: <20210727161357.8842-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210727161357.8842-1-marex@denx.de>
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

Hi Marek,

Thank you for the patch.

On Tue, Jul 27, 2021 at 06:13:56PM +0200, Marek Vasut wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And all my apologies for the delay.

> ---
> V2: - Use allOf
>     - Move the data-mapping to endpoint
> V3: - Rebase on V2 submitted a while ago, reinstate changelog
>     - Drop the allOf and un-rebase on previous pclk patch
> V4: - port@1, remove $ref: /schemas/graph.yaml#/properties/port and
>       add $ref: /schemas/graph.yaml#/$defs/port-base
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 304a1367faaa7..c0400c60f272a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -55,11 +55,26 @@ properties:
>            For LVDS decoders, port 0 is the LVDS input
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>          description: |
>            For LVDS encoders, port 1 is the LVDS output
>            For LVDS decoders, port 1 is the parallel output
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
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
> @@ -71,6 +86,22 @@ properties:
>  
>    power-supply: true
>  
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          const: lvds-decoder
> +then:
> +  properties:
> +    ports:
> +      properties:
> +        port@1:
> +          properties:
> +            endpoint:
> +              properties:
> +                data-mapping: false
> +
>  required:
>    - compatible
>    - ports

-- 
Regards,

Laurent Pinchart
