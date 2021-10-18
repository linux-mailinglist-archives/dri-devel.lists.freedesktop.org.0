Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB687432610
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B1E6E0F1;
	Mon, 18 Oct 2021 18:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72B6E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 18:08:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E00C28C6;
 Mon, 18 Oct 2021 20:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634580515;
 bh=UgDligBdkBJSa+psgu7m13DMpVB69NkjDnaxfX8vpAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hbuxFj6IZRSym2HpPuqe+mV3XB0gclh78Ke2o65+78j2eWvCpGE+na4N5A9wuk3QR
 +/P6gpJeiMPaTb3QNLC6xlBTyFxi0wOBV/n6Ax+xsrjOonbnCmO3u55KW1AaN4BHT5
 MHxgvWZsM0J6xLS5clVk7lUbmWx6hT7xtHsX/50M=
Date: Mon, 18 Oct 2021 21:08:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <YW24EbfbtJdMMDRV@pendragon.ideasonboard.com>
References: <20211017001204.299940-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017001204.299940-1-marex@denx.de>
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

On Sun, Oct 17, 2021 at 02:12:03AM +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, to define the pixel data sampling edge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V4: New patch split from combined V3
> V5: Rebase on recent linux-next
> ---
>  .../bindings/display/bridge/lvds-codec.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 1faae3e323a4..708de84ac138 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -79,6 +79,14 @@ properties:
>        - port@0
>        - port@1
>  
> +  pclk-sample:
> +    description:
> +      Data sampling on rising or falling edge.
> +    enum:
> +      - 0  # Falling edge
> +      - 1  # Rising edge
> +    default: 0
> +

Shouldn't this be moved to the endpoint, the same way data-mapping is
defined as an endpoint property ?

>    powerdown-gpios:
>      description:
>        The GPIO used to control the power down line of this device.
> @@ -102,6 +110,16 @@ then:
>                properties:
>                  data-mapping: false
>  
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          const: lvds-encoder
> +then:
> +  properties:
> +    pclk-sample: false
> +
>  required:
>    - compatible
>    - ports

-- 
Regards,

Laurent Pinchart
