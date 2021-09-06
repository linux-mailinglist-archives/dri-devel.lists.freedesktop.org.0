Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF84020A3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 22:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7B89C17;
	Mon,  6 Sep 2021 20:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9079389C17
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 20:14:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f6bc797c-0f4e-11ec-a02a-0050568c148b;
 Mon, 06 Sep 2021 20:13:56 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 69317194D23;
 Mon,  6 Sep 2021 22:13:58 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:14:05 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Message-ID: <YTZ2jf0xynvvZM2s@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-2-msp@baylibre.com>
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

Hi Markus,

On Mon, Sep 06, 2021 at 09:35:24PM +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to the actual dpi. They differ in some points
> regarding registers and what needs to be set but the function blocks
> itself are similar in design.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

I fail to see why they share the same dt-schema as the main content in
the schema is the clocks and they differ.

A new mediatek,dpintf schema seems more appropriate.

I recall I though so when reading the RFC variant but failed to comment on it.

	Sam

> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 43 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..1a158b719ce6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller Device Tree Bindings
>  
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
> @@ -13,7 +13,8 @@ maintainers:
>  description: |
>    The Mediatek DPI function block is a sink of the display subsystem and
>    provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  output bus. The Mediatek DP_INTF is a similar function block that is
> +  connected to the (embedded) display port function block.
>  
>  properties:
>    compatible:
> @@ -23,6 +24,7 @@ properties:
>        - mediatek,mt8173-dpi
>        - mediatek,mt8183-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf
>  
>    reg:
>      maxItems: 1
> @@ -37,10 +39,11 @@ properties:
>        - description: DPI PLL
>  
>    clock-names:
> -    items:
> -      - const: pixel
> -      - const: engine
> -      - const: pll
> +    description:
> +      For dpi clocks pixel, engine and pll are required. For dpintf pixel,
> +      hf_fmm and hf_fdp are required.
> +    minItems: 3
> +    maxItems: 3
>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -64,6 +67,34 @@ required:
>    - clock-names
>    - port
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-dpintf
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: hf_fmm
> +            - const: hf_fdp
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: engine
> +            - const: pll
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.33.0
