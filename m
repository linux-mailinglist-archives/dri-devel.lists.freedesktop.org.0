Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B12E48AE16
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CCF10E57D;
	Tue, 11 Jan 2022 13:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7F810E575
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:02:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8149CC;
 Tue, 11 Jan 2022 14:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641906171;
 bh=g5GU9fZ4UHvlyUr5dy6Z2i/6+1rT3ShdpeafTGHyLDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NOw6VJgmmWUX9M+Le6kMO+BHItAuFz2goF7ZRcOe6NsisB+FHcOfiff+J1Dfelb++
 Cic8xqxnTOrpX8l1inljvYi34jThebX1vwCrSnZvfhlXHSjtbqBhyWoTNx4/eRxwTB
 cvunjSz+3qr8EIdbgsoBliYw1V6/RSfloTGl/Y8U=
Date: Tue, 11 Jan 2022 15:02:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: Turn lvds.yaml into a
 generic schema
Message-ID: <Yd1/8DMWaNK11LPN@pendragon.ideasonboard.com>
References: <20220111110635.804371-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111110635.804371-1-maxime@cerno.tech>
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

On Tue, Jan 11, 2022 at 12:06:34PM +0100, Maxime Ripard wrote:
> The lvds.yaml file so far was both defining the generic LVDS properties
> (such as data-mapping) that could be used for any LVDS sink, but also
> the panel-lvds binding.
> 
> That last binding was to describe LVDS panels simple enough, and had a
> number of other bindings using it as a base to specialise it further.
> 
> However, this situation makes it fairly hard to extend and reuse both
> the generic parts, and the panel-lvds itself.
> 
> Let's remove the panel-lvds parts and leave only the generic LVDS
> properties.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v2:
>   - Fix references to that file
> 
> Changes from v1:
>   - Moved the schema out of panel
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   |  2 +-
>  .../bindings/display/{panel => }/lvds.yaml    | 31 ++-----------------
>  .../display/panel/advantech,idk-1110wr.yaml   | 19 ++++++++++--
>  .../display/panel/innolux,ee101ia-01d.yaml    | 23 ++++++++++++--
>  .../display/panel/mitsubishi,aa104xd12.yaml   | 19 ++++++++++--
>  .../display/panel/mitsubishi,aa121td01.yaml   | 19 ++++++++++--
>  .../display/panel/sgd,gktw70sdae4se.yaml      | 19 ++++++++++--
>  MAINTAINERS                                   |  2 +-
>  8 files changed, 93 insertions(+), 41 deletions(-)
>  rename Documentation/devicetree/bindings/display/{panel => }/lvds.yaml (86%)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 5079c1cc337b..27b905b81b12 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -67,7 +67,7 @@ properties:
>                    - vesa-24
>                  description: |
>                    The color signals mapping order. See details in
> -                  Documentation/devicetree/bindings/display/panel/lvds.yaml
> +                  Documentation/devicetree/bindings/display/lvds.yaml
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
> similarity index 86%
> rename from Documentation/devicetree/bindings/display/panel/lvds.yaml
> rename to Documentation/devicetree/bindings/display/lvds.yaml
> index 49460c9dceea..55751402fb13 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/lvds.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/panel/lvds.yaml#
> +$id: http://devicetree.org/schemas/display/lvds.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: LVDS Display Panel
> +title: LVDS Display Common Properties
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> @@ -26,18 +26,7 @@ description: |+

The description mentions "This bindings supports display panels
compatible with the following specifications". This needs a small update
to avoid referring to panels.

With this updated,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>    Device compatible with those specifications have been marketed under the
>    FPD-Link and FlatLink brands.
>  
> -allOf:
> -  - $ref: panel-common.yaml#
> -
>  properties:
> -  compatible:
> -    contains:
> -      const: panel-lvds
> -    description:
> -      Shall contain "panel-lvds" in addition to a mandatory panel-specific
> -      compatible string defined in individual panel bindings. The "panel-lvds"
> -      value shall never be used on its own.
> -
>    data-mapping:
>      enum:
>        - jeida-18
> @@ -96,22 +85,6 @@ properties:
>        If set, reverse the bit order described in the data mappings below on all
>        data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
>  
> -  port: true
> -  ports: true
> -
> -required:
> -  - compatible
> -  - data-mapping
> -  - width-mm
> -  - height-mm
> -  - panel-timing
> -
> -oneOf:
> -  - required:
> -      - port
> -  - required:
> -      - ports
> -
>  additionalProperties: true
>  
>  ...
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> index 93878c2cd370..3a8c2c11f9bd 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> -  - $ref: lvds.yaml#
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: advantech,idk-1110wr
> +
> +  required:
> +    - compatible
>  
>  properties:
>    compatible:
>      items:
>        - const: advantech,idk-1110wr
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    data-mapping:
>      const: jeida-24
> @@ -35,6 +45,11 @@ additionalProperties: false
>  
>  required:
>    - compatible
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
>  
>  examples:
>    - |+
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> index a69681e724cb..566e11f6bfc0 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> @@ -11,15 +11,26 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> -  - $ref: lvds.yaml#
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: innolux,ee101ia-01d
> +
> +  required:
> +    - compatible
>  
>  properties:
>    compatible:
>      items:
>        - const: innolux,ee101ia-01d
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    backlight: true
> +  data-mapping: true
>    enable-gpios: true
>    power-supply: true
>    width-mm: true
> @@ -27,5 +38,13 @@ properties:
>    panel-timing: true
>    port: true
>  
> +required:
> +  - compatible
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
> +
>  additionalProperties: false
>  ...
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> index b5e7ee230fa6..5cf3c588f46d 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> -  - $ref: lvds.yaml#
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mitsubishi,aa104xd12
> +
> +  required:
> +    - compatible
>  
>  properties:
>    compatible:
>      items:
>        - const: mitsubishi,aa104xd12
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    vcc-supply:
>      description: Reference to the regulator powering the panel VCC pins.
> @@ -39,6 +49,11 @@ additionalProperties: false
>  required:
>    - compatible
>    - vcc-supply
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
>  
>  examples:
>    - |+
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> index 977c50a85b67..54750cc5440d 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> -  - $ref: lvds.yaml#
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mitsubishi,aa121td01
> +
> +  required:
> +    - compatible
>  
>  properties:
>    compatible:
>      items:
>        - const: mitsubishi,aa121td01
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    vcc-supply:
>      description: Reference to the regulator powering the panel VCC pins.
> @@ -39,6 +49,11 @@ additionalProperties: false
>  required:
>    - compatible
>    - vcc-supply
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
>  
>  examples:
>    - |+
> diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> index e63a570ae59d..44e02decdf3a 100644
> --- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> -  - $ref: lvds.yaml#
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sgd,gktw70sdae4se
> +
> +  required:
> +    - compatible
>  
>  properties:
>    compatible:
>      items:
>        - const: sgd,gktw70sdae4se
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    data-mapping:
>      const: jeida-18
> @@ -35,6 +45,11 @@ additionalProperties: false
>  
>  required:
>    - compatible
> +  - port
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
>  
>  examples:
>    - |+
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41d2916600e0..368072da0a05 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6079,7 +6079,7 @@ L:	dri-devel@lists.freedesktop.org
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-lvds.c
> -F:	Documentation/devicetree/bindings/display/panel/lvds.yaml
> +F:	Documentation/devicetree/bindings/display/lvds.yaml
>  
>  DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
>  M:	Guido Günther <agx@sigxcpu.org>

-- 
Regards,

Laurent Pinchart
