Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B737A43D7AD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 01:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5356E02E;
	Wed, 27 Oct 2021 23:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8AF6E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:43:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD903E7;
 Thu, 28 Oct 2021 01:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635378232;
 bh=jxM6yuUbm08pSAxjR4O8oqNRdc2Zry9e1We34Plg8Gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/nnUOQ52WxZxvXUyJzmLmoAYahCoGQexAlJR3pPinJnvpIlXydR8PSyoe3DRk/pZ
 DpoMuXzMgXrtoZGmym290MqEUYnHtsTMSipBoccBGNlBmlwtz4jiTuLuhSZ/6smt+1
 jWKH4o0Izt9oYhYqrQqZifC3HKT2c2/w67aEb8Ag=
Date: Thu, 28 Oct 2021 02:43:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <YXnkIVRa9bcpI4+0@pendragon.ideasonboard.com>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
 <20211019065239.969988-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211019065239.969988-4-alexander.stein@ew.tq-group.com>
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

Hi Alexander,

Thank you for the patch.

On Tue, Oct 19, 2021 at 08:52:38AM +0200, Alexander Stein wrote:
> Add a VCC regulator which needs to be enabled before the EN pin is
> released.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index a5779bf17849..f1e4f149ccb4 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -32,6 +32,9 @@ properties:
>      maxItems: 1
>      description: GPIO specifier for bridge_en pin (active high).
>  
> +  vcc-supply:
> +    description: A 1.8V power supply (see regulator/regulator.yaml).

I would have dropped the part between parentheses as it's kind of
implied, but I don't mind much.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -134,6 +137,7 @@ examples:
>              reg = <0x2d>;
>  
>              enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> +            vcc-supply = <&reg_sn65dsi83_1v8>;
>  
>              ports {
>                  #address-cells = <1>;

-- 
Regards,

Laurent Pinchart
