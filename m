Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B245ABB9A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 02:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3E910E954;
	Sat,  3 Sep 2022 00:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5DB10E949
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 00:17:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 783186DD;
 Sat,  3 Sep 2022 02:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662164255;
 bh=P3z29BkLY8pp5QffYlk19e0Qtl1KILoEFtI0UY7fAdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=twNQ42Hfd5MMCl4KY7fIFFwxw0HHAfRqast+K+Knhgy+4bEi/yEFixxuxSiBYSv4R
 1/bM0VD4qsGjr33GceoM8BlM+XWHK3xGjg6vSEYY73NJ6mTndodg/i5r2REHTzrT4q
 512WrT37Dvz1+H0VwARREeIgavTQiCiuZ/dLxNQs=
Date: Sat, 3 Sep 2022 03:17:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add byteswap order to chrontel ch7033
Message-ID: <YxKdE7ZQ97NsuqZk@pendragon.ideasonboard.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
 <20220902153906.31000-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902153906.31000-2-macroalpha82@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

Thank you for the patch.

On Fri, Sep 02, 2022 at 10:39:05AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Update dt-binding documentation to add support for setting byteswap of
> chrontel ch7033.
> 
> New property name of chrontel,byteswap added to set the byteswap order.
> This property is optional.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> index bb6289c7d375..984b90893583 100644
> --- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> @@ -14,6 +14,19 @@ properties:
>    compatible:
>      const: chrontel,ch7033
>  
> +  chrontel,byteswap:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum:
> +      - 0  # BYTE_SWAP_RGB
> +      - 1  # BYTE_SWAP_RBG
> +      - 2  # BYTE_SWAP_GRB
> +      - 3  # BYTE_SWAP_GBR
> +      - 4  # BYTE_SWAP_BRG
> +      - 5  # BYTE_SWAP_BGR
> +    description: |
> +      Set the byteswap value of the bridge. This is optional and if not
> +      set value of BYTE_SWAP_BGR is used.

I don't think this belongs to the device tree. The source of data
connected to the CH7033 input could use different formats. This
shouldn't be hardcoded, but queried at runtime, using the input and
output media bus formats infrastructure that the DRM bridge framework
includes.

> +
>    reg:
>      maxItems: 1
>      description: I2C address of the device

-- 
Regards,

Laurent Pinchart
