Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36438A003B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 21:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3025210E605;
	Wed, 10 Apr 2024 19:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CBobSbem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B34C10E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 19:03:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BC0861EAB;
 Wed, 10 Apr 2024 19:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F84CC433C7;
 Wed, 10 Apr 2024 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712775817;
 bh=S8NmEXKVaI1r9fUCrU6f1WB8Na0Z5mpdO3VRO7eiavM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CBobSbemzs62QSNAqv6HwSPxAY2iptSYLmY76ryN7CKtLmeUHJD0d1Zo0yPgfldGm
 ygQf7JOl5ys2YYW6DAlSIB5j9HkOi4nhKHyP44e/zUGk2KMFBGg2TUDONVEJDgfbz0
 6jE5fbOci7aRvBaGUsO4LwCp8ixP9h+lZUlygfwQ3oo7RqXEXsDm35FLMAuxTD93G/
 gj8MxGApB/orbGD567KXmLcPoTaWK2OZ03bdVes8WFxu2J5ADmrOjED965se7CJ1nd
 DYxOHbCdx3fCyn1E1YQEcnz1VXvagqkwRERnXPFxi4Xbt35hPmbV5tSb+bcNmvuJj2
 IR+uK15oettKQ==
Date: Wed, 10 Apr 2024 14:03:35 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Message-ID: <20240410190335.GA890682-robh@kernel.org>
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Apr 09, 2024 at 02:02:09PM +0200, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.
> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 40 +++++++++++++++++++
>  .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
>  .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
>  .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
>  .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
>  .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
>  .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
>  .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
>  .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
>  .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
>  .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
>  .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
>  .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
>  .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
>  .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
>  16 files changed, 372 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index b4c28e96dd55..623cf7e37fe3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -61,6 +61,27 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Input and output ports can have multiple endpoints, each of those
> +      connects to either the primary, secondary, etc, display pipeline.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: AAL input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          AAL output to the next component's input, for example could be one
> +          of many gamma, overdrive or other blocks.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
>  required:
>    - compatible
>    - reg
> @@ -88,5 +109,24 @@ examples:
>             power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>             clocks = <&mmsys CLK_MM_DISP_AAL>;
>             mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
> +
> +           ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@0 {
> +                   reg = <0>;
> +                   aal0_in: endpoint {
> +                       remote-endpoint = <&ccorr0_out>;
> +                   };
> +               };
> +
> +               port@1 {
> +                   reg = <1>;
> +                   aal0_out: endpoint {
> +                       remote-endpoint = <&gamma0_in>;
> +                   };
> +               };
> +           };
>         };
>      };
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 8c2a737237f2..71ea277a5d8e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -54,6 +54,27 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Input and output ports can have multiple endpoints, each of those
> +      connects to either the primary, secondary, etc, display pipeline.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: CCORR input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          CCORR output to the input of the next desired component in the
> +          display pipeline, usually only one of the available AAL blocks.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index b886ca0d89ea..61d040a10c08 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -64,6 +64,28 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Input and output ports can have multiple endpoints, each of those
> +      connects to either the primary, secondary, etc, display pipeline.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: COLOR input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          COLOR output to the input of the next desired component in the
> +          display pipeline, for example one of the available CCORR or AAL
> +          blocks.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 1588b3f7cec7..3d4ab3f86294 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -55,6 +55,28 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Input and output ports can have multiple endpoints, each of those
> +      connects to either the primary, secondary, etc, display pipeline.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DITHER input, usually from a POSTMASK or GAMMA block.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DITHER output to the input of the next desired component in the
> +          display pipeline, for example one of the available DSC compressors,
> +          DP_INTF, DSI, LVDS or others.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 803c00f26206..6607cb1c6e0a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -64,13 +64,34 @@ properties:
>        Output port node. This port should be connected to the input port of an
>        attached HDMI, LVDS or DisplayPort encoder chip.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPI input port

Strictly speaking, 'port' is equivalent to 'port@0', so it is already 
defined to be the output path. It is a little odd for the input to be 
port@1, but that is why we define the numbering.

Same comment applies to DSI.

Rob
