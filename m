Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515E457903
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329E6E311;
	Fri, 19 Nov 2021 22:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63B46E311
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 22:46:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51DF51974;
 Fri, 19 Nov 2021 23:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637362016;
 bh=et4RViE4z8kirTlgFJjO14p/y17SYbMDh1z4CtXuG1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Csu32PMfNiOt6k5nZFkUo6w8/bYZ4c+I5m5GT0JP8o2WfmWvCF9gv8B3oh3sSkvgA
 nPhcevXCImfIpOe1OXup8GhmnO5t4i3T6UzdeOuYu6vkgwQk1jDX6fu90bOlkm4Z92
 w7LatMa6QrULel6Wo/Nb9tHqyoAMa2F3o3lg9Fp0=
Date: Sat, 20 Nov 2021 00:46:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] dt-bindings: display: Turn lvds.yaml into a generic
 schema
Message-ID: <YZgpSWVXjKr9secH@pendragon.ideasonboard.com>
References: <20211116143503.385807-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211116143503.385807-1-maxime@cerno.tech>
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

On Tue, Nov 16, 2021 at 03:35:02PM +0100, Maxime Ripard wrote:
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
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../display/panel/advantech,idk-1110wr.yaml   | 17 ++++++++++-
>  .../display/panel/innolux,ee101ia-01d.yaml    | 21 +++++++++++++-
>  .../bindings/display/panel/lvds.yaml          | 29 +------------------
>  .../display/panel/mitsubishi,aa104xd12.yaml   | 17 ++++++++++-
>  .../display/panel/mitsubishi,aa121td01.yaml   | 17 ++++++++++-
>  .../display/panel/sgd,gktw70sdae4se.yaml      | 17 ++++++++++-
>  6 files changed, 85 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> index 93878c2cd370..f27cd2038636 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: advantech,idk-1110wr
> +
> +  required:
> +    - compatible

I've never encountered this before, what does it do ?

> +
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
> index a69681e724cb..6e06eecac14e 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> @@ -11,15 +11,26 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: innolux,ee101ia-01d
> +
> +  required:
> +    - compatible
> +
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
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index 49460c9dceea..5281a75c8bb5 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/panel/lvds.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: LVDS Display Panel
> +title: LVDS Display Common Properties

Maybe

title: LVDS Display Panel Common Properties

or do you foresee this being useful for non-panel LBDS sinks too ? In
that case the title is fine, but the file could be moved in the parent
directory.

I'm also wondering what we should do with the data-mapping and
data-mirror properties. For an LVDS panel they're fine at the device
level, but for an LVDS sink, they may be better placed at the port or
endpoint level.

>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> @@ -26,18 +26,7 @@ description: |+
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
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> index b5e7ee230fa6..e684b9771532 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mitsubishi,aa104xd12
> +
> +  required:
> +    - compatible
> +
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
> index 977c50a85b67..c0df6ee89c7a 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mitsubishi,aa121td01
> +
> +  required:
> +    - compatible
> +
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
> index e63a570ae59d..8bb85701e507 100644
> --- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sgd,gktw70sdae4se
> +
> +  required:
> +    - compatible
> +
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

-- 
Regards,

Laurent Pinchart
