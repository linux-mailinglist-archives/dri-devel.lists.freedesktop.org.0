Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2A5FD816
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2E410E7EE;
	Thu, 13 Oct 2022 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17CB10E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:05:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0CB6492;
 Thu, 13 Oct 2022 13:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665659151;
 bh=dUZBnksssSEsbfYjTSHdrj0Sb8JpUXd5lCyKkoOrkH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=td9o3P/iAjwPyoVF/NtEnmhWLO5rawjBajdtyTf4xyJGDzO90Dgh+VjIj9whSYvZP
 pCBr5bSg2Nq4A042YCFb3z1WKcxtdZiHrmfM8lbHcREkzYw14hH93ElRtY2qDENzS7
 /gSEdzy91op7PCVQw965JCA+kpaB0kQ49CEOMlvk=
Date: Thu, 13 Oct 2022 14:05:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Message-ID: <Y0fxCVUtlkB4XHIq@pendragon.ideasonboard.com>
References: <20221013105116.180380-1-allen.chen@ite.com.tw>
 <20221013105116.180380-2-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221013105116.180380-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen,

Thank you for the patch.

On Thu, Oct 13, 2022 at 06:51:13PM +0800, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml   | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a7..f2c3d1d10359e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,10 +52,51 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>  
> +  data-lanes:
> +    oneOf:
> +      - minItems: 1
> +        maxItems: 1
> +        uniqueItems: true
> +        items:
> +          enum:
> +            - 0
> +            - 1
> +        description: For one lane operation.
> +
> +      - minItems: 2
> +        maxItems: 2
> +        uniqueItems: true
> +        items:
> +          enum:
> +            - 0
> +            - 1
> +        description: For two lanes operation.
> +
> +      - minItems: 4
> +        maxItems: 4
> +        uniqueItems: true
> +        items:
> +          enum:
> +            - 0
> +            - 1
> +            - 2
> +            - 3
> +        description: For four lanes operation.

The data lanes should be in the output endpoint. If there's no output
port, one should be added.

> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: A port node pointing to DPI host port node
>  
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
> +        properties:
> +          link-frequencies:
> +            minItems: 1
> +            maxItems: 1
> +            description: Allowed max link frequencies in Hz.
> +
>  required:
>    - compatible
>    - ovdd-supply
> @@ -84,10 +125,12 @@ examples:
>              pwr18-supply = <&it6505_pp18_reg>;
>              reset-gpios = <&pio 179 1>;
>              extcon = <&usbc_extcon>;
> +            data-lanes = <0 1>;
>  
>              port {
>                  it6505_in: endpoint {
>                      remote-endpoint = <&dpi_out>;
> +                    link-frequencies = /bits/ 64 <150000000>;
>                  };
>              };
>          };

-- 
Regards,

Laurent Pinchart
