Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03D26D00A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9C96EB6E;
	Thu, 17 Sep 2020 00:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E36EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:39:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3055D276;
 Thu, 17 Sep 2020 02:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600303158;
 bh=Tltwwb5/vif8GfymqHivlccgOKoi7hBKt4at6lyMSPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1O8AGVgrl/WeOdlQuIVcZ/XGaVqdT6g5c2hVhdeYj+coXCQ9J2tlFxA+6qkHpcsd
 dT4sGEVP3BVb/9tLlpI9ozL0lF+WdMxgbYC/SIJBTtjnJC7fB01qU5AKUue3TC80Gu
 8pPHdR/CNkV/amGC188IoKAY4/QgyVRzp8hRTyLs=
Date: Thu, 17 Sep 2020 03:38:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] dt-bindings: dp-connector: add binding for DisplayPort
 connector
Message-ID: <20200917003848.GN3853@pendragon.ideasonboard.com>
References: <20200916144440.233714-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916144440.233714-1-tomi.valkeinen@ti.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Sep 16, 2020 at 05:44:40PM +0300, Tomi Valkeinen wrote:
> Add binding for DisplayPort connector. A few notes:
> 
> * Similar to hdmi-connector, it has hpd-gpios as an optional property,
>   as the HPD could also be handled by, e.g., the DP bridge.
> 
> * dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
>   is not strictly required: standard DP cables do not even have the pin
>   connected.
> 
> * No property for the connector type. Full size and mini connectors are
>   identical except for the connector size and form, so I believe there
>   is no need to include the type in the bindings.

It could be useful to present information about the connector to
userspace. For instance, a GUI could show a picture of the connector
that the user should plug a cable in. This can also be added later, but
I think it would be useful to have it from the start.

> * No eDP. There's really no "eDP connector", as it's always a custom
>   made connection between the DP and the DP panel. So possibly there is
>   no need for edp-connector binding, but even if there is, I don't want
>   to guess what it could look like, and could it be part of the
>   dp-connector binding.

Agreed.

> * No DP++. I'm not familiar with DP++, but I think it's all handled by
>   the DP bridge, and does not need any new properties to the dp-connector.

I'm not familiar with this either.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Possibly with a type property added,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../display/connector/dp-connector.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> new file mode 100644
> index 000000000000..983be1fe43f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/dp-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DisplayPort Connector
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +properties:
> +  compatible:
> +    const: dp-connector
> +
> +  label: true
> +
> +  hpd-gpios:
> +    description: A GPIO line connected to HPD
> +    maxItems: 1
> +
> +  dp-pwr-supply:
> +    description: Power supply for the DP_PWR pin
> +    maxItems: 1
> +
> +  port:
> +    description: Connection to controller providing DP signals
> +
> +required:
> +  - compatible
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +        compatible = "dp-connector";
> +        label = "dp0";
> +
> +        port {
> +            dp_connector_in: endpoint {
> +                remote-endpoint = <&dp_out>;
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
