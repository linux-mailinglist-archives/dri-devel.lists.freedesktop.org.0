Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41327457915
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DD96E219;
	Fri, 19 Nov 2021 22:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0F96E219
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 22:49:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D30A1C19;
 Fri, 19 Nov 2021 23:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637362161;
 bh=yI2MGDEezdScvWFcZ3GAH2GaCDd4JUn1Ex56peHijdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X5y+WEFstWVSZmIKcxfz7m+i+V60He0fU7BVV4/uAXkhJBREJzfKb9EYX9YZ+7AoD
 r0eqLP2x2WvkRssNNyb10ITLF0Aeu4IDTMbZn7vTsEv6zCyzH65I9ZWNNVIDwx/mvq
 uttN/kl/2gQR6NQJtzIGyU/1AvWpK3Wo5HugIV+4=
Date: Sat, 20 Nov 2021 00:48:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Message-ID: <YZgp2tN55XDfkJJ6@pendragon.ideasonboard.com>
References: <20211116143503.385807-1-maxime@cerno.tech>
 <20211116143503.385807-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211116143503.385807-2-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Tue, Nov 16, 2021 at 03:35:03PM +0100, Maxime Ripard wrote:
> Following the previous patch, let's introduce a generic panel-lvds
> binding that documents the panels that don't have any particular
> constraint documented.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/panel-lvds.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> new file mode 100644
> index 000000000000..f6ce8e29391e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic LVDS Display Panel Device Tree Bindings
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: lvds.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: panel-lvds
> +
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +              - advantech,idk-1110wr
> +              - innolux,ee101ia-01d
> +              - mitsubishi,aa104xd12
> +              - mitsubishi,aa121td01
> +              - sgd,gktw70sdae4se

This will be annoying to maintain, I'm pretty sure authors will forget
to update this file when adding bindings for other panels. Is there any
way we could select this binding with a positive rule instead of a
negative rule ?

> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - auo,b101ew05
> +          - tbs,a711-panel
> +
> +      - const: panel-lvds
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
> +
> +...

-- 
Regards,

Laurent Pinchart
