Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205695A576C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 01:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D63D10F5E4;
	Mon, 29 Aug 2022 23:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D582A10F5E4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 23:08:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90431481;
 Tue, 30 Aug 2022 01:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661814516;
 bh=V/noL5H3GGat0X1qZ40oI+6OfQ6QMlmf7rC/4vB+poY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liE817KLQtHDm3GEbvXYnedB96v9ivXs4fQlkLc2UOi/l+cAVbqGII2V1UvJ3dDke
 1DF/inO4KuoaB+FNGd1bxvt53gRAy381yS0GEZ1YU9ojkb80WeNk4Kl2rvcvLxGzZv
 aXw7BCWF2W6GEwvaL0fYudC5jljkpIVyrZe2XMNM=
Date: Tue, 30 Aug 2022 02:08:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dw-hdmi: Fix
 'unevaluatedProperties' warnings
Message-ID: <Yw1G69ny9tZrFWk4@pendragon.ideasonboard.com>
References: <20220829215816.6206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220829215816.6206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

Thank you for the patch.

On Mon, Aug 29, 2022 at 10:58:16PM +0100, Lad Prabhakar wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings when running dtbs_check:
> 
> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: hdmi@fead0000: Unevaluated properties are not allowed ('resets' was unexpected)
> 	From schema: Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> 
> The main problem is that SoC DTSI's are including resets property, whereas
> the renesas,dw-hdmi.yaml has 'unevaluatedProperties: false'. So just add
> optional resets property to the binding.

Given that all the DT sources in the kernel specify the resets property,
how about making it mandatory ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> index 0c9785c8db51..a7e44e249dd3 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> @@ -38,6 +38,9 @@ properties:
>    clock-names:
>      maxItems: 2
>  
> +  resets:
> +    maxItems: 1
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  

-- 
Regards,

Laurent Pinchart
