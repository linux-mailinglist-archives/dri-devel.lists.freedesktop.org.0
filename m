Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26C9DAA95
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A89410EB21;
	Wed, 27 Nov 2024 15:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="geo9siy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B847010EB21
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:16:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0358CA40E70;
 Wed, 27 Nov 2024 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B01C4CED2;
 Wed, 27 Nov 2024 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732720592;
 bh=73uSU84WC159XIEa9x/EDBuom42dzuqTcTszbM/yk0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=geo9siy/nYm1+nZ7+jxEfER0rrXEjzKbIryvpQmVcu/R9vrmoZ5I4CvT/NFNbajdm
 8Mq8gKeYC8ptnH79jDB6rM4pcJS0aSSHg+IYdu6fl4+4XA3tGCYxYThGGUbvKqvvph
 +gYT2sHHKwOLDuIc38gwd8Zd0sf86KLO8FQYBxCCCA43kDko9zgvs8xfqysxL27g8n
 7ysDVIg6GGCg6C3oWyxW7AwI96XAr7d1AMDFpix2LPJYxIHxg58pjPrie8/H93fG8Z
 EF1iiC+u7jv+PrECbwAdWe6VVxoV2SJWJ0JFIdoJH0N/3ll99sa4E6xTkd+79LNUIe
 7/d2z3hBqE5cQ==
Date: Wed, 27 Nov 2024 09:16:30 -0600
From: Rob Herring <robh@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <20241127151630.GA3515396-robh@kernel.org>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127103031.1007893-2-andrej.picej@norik.com>
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

On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> From: Janine Hagemann <j.hagemann@phytec.de>
> 
> Add an optional property to change LVDS output voltage. This depends on
> the connected display specifications. With this property we directly set
> the LVDS_VCOM (0x19) register.
> Better register property mapping would be quite tricky. Please check
> bridge's datasheet for details on how register values set the LVDS
> data lines and LVDS clock output voltage.
> 
> Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 48a97bb3e2e0..5b2c0c281824 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -58,6 +58,12 @@ properties:
>                    - const: 2
>                    - const: 3
>                    - const: 4
> +              ti,lvds-vcom:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description: LVDS output voltage configuration. This defines
> +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> +                  details on how register values set the LVDS data lines and
> +                  LVDS clock output voltage.

Constraints? 0 - 2^32 are all valid values?

>  
>        port@1:
>          $ref: /schemas/graph.yaml#/$defs/port-base
> @@ -78,6 +84,12 @@ properties:
>                    - const: 2
>                    - const: 3
>                    - const: 4
> +              ti,lvds-vcom:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description: LVDS output voltage configuration. This defines
> +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> +                  details on how register values set the LVDS data lines and
> +                  LVDS clock output voltage.

Never good to just have 2 copies of the same thing. Move the whole port 
schema to a $defs entry and add the property there. Then just $ref it:

  port@0:
    description: Video port for MIPI DSI Channel-A input
    $ref: '#/$defs/dsi-port'


$defs:
  dsi-port:
    $ref: /schemas/graph.yaml#/$defs/port-base
    unevaluatedProperties: false
    description: Video port for MIPI DSI inputs

    properties:
      endpoint:
        $ref: /schemas/media/video-interfaces.yaml#
        unevaluatedProperties: false

        properties:
          data-lanes:
            description: array of physical DSI data lane indexes.
            minItems: 1
            items:
              - const: 1
              - const: 2
              - const: 3
              - const: 4

