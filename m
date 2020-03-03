Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35062177E98
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 19:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312AD6E51C;
	Tue,  3 Mar 2020 18:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C9C6E44C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:47:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72EC32AF;
 Tue,  3 Mar 2020 19:47:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583261230;
 bh=U/Og/71bdeBJxFVqfT9cTiJGEF4Dp+GH3QbsZDHKb/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J9tCIWgh0w8kGnEMwDaF8cd9frQ5hd8uhKmHzPuuh8TFY9mzgFgGEGOGVOqHi4V4d
 hO19JB/Sz8OZHv6cErjD6liV9jB7dnkfxGg6S9kY5ZrZa5MDoqIxYZ20NC9K+Nu+jW
 Mgh2k026EFlXSp/t8qsgsEl32jmcVx/8QoApL5qo=
Date: Tue, 3 Mar 2020 20:46:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: convert display-timings to
 DT schema
Message-ID: <20200303184649.GH11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216181513.28109-3-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Feb 16, 2020 at 07:15:10PM +0100, Sam Ravnborg wrote:
> Add display-timings.yaml - that references panel-timings.yaml.
> display-timings.yaml will be used for display bindings
> when they are converted to meta-schema format.
> 
> For now the old display-timing.txt points to the new
> display-timings.yaml - and all users are left as-is.
> 
> v2:
>   - Updated native-mode description
> 
> v3:
>   - Simpler "^timing" pattern (Rob)
>   - timing node is of type object (Rob)
>   - added display-timings to panel-common.yaml
>   - added yaml document terminator "..."
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/panel/display-timing.txt | 124 +-----------------
>  .../display/panel/display-timings.yaml        |  77 +++++++++++
>  .../bindings/display/panel/panel-common.yaml  |   8 ++
>  3 files changed, 86 insertions(+), 123 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/display-timings.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
> index 78222ced1874..7f55ad4a40c4 100644
> --- a/Documentation/devicetree/bindings/display/panel/display-timing.txt
> +++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt
> @@ -1,123 +1 @@
> -display-timing bindings
> -=======================
> -
> -display-timings node
> ---------------------
> -
> -required properties:
> - - none
> -
> -optional properties:
> - - native-mode: The native mode for the display, in case multiple modes are
> -		provided. When omitted, assume the first node is the native.
> -
> -timing subnode
> ---------------
> -
> -required properties:
> - - hactive, vactive: display resolution
> - - hfront-porch, hback-porch, hsync-len: horizontal display timing parameters
> -   in pixels
> -   vfront-porch, vback-porch, vsync-len: vertical display timing parameters in
> -   lines
> - - clock-frequency: display clock in Hz
> -
> -optional properties:
> - - hsync-active: hsync pulse is active low/high/ignored
> - - vsync-active: vsync pulse is active low/high/ignored
> - - de-active: data-enable pulse is active low/high/ignored
> - - pixelclk-active: with
> -			- active high = drive pixel data on rising edge/
> -					sample data on falling edge
> -			- active low  = drive pixel data on falling edge/
> -					sample data on rising edge
> -			- ignored     = ignored
> - - syncclk-active: with
> -			- active high = drive sync on rising edge/
> -					sample sync on falling edge of pixel
> -					clock
> -			- active low  = drive sync on falling edge/
> -					sample sync on rising edge of pixel
> -					clock
> -			- omitted     = same configuration as pixelclk-active
> - - interlaced (bool): boolean to enable interlaced mode
> - - doublescan (bool): boolean to enable doublescan mode
> - - doubleclk (bool): boolean to enable doubleclock mode
> -
> -All the optional properties that are not bool follow the following logic:
> -    <1>: high active
> -    <0>: low active
> -    omitted: not used on hardware
> -
> -There are different ways of describing the capabilities of a display. The
> -devicetree representation corresponds to the one commonly found in datasheets
> -for displays. If a display supports multiple signal timings, the native-mode
> -can be specified.
> -
> -The parameters are defined as:
> -
> -  +----------+-------------------------------------+----------+-------+
> -  |          |        ^                            |          |       |
> -  |          |        |vback_porch                 |          |       |
> -  |          |        v                            |          |       |
> -  +----------#######################################----------+-------+
> -  |          #        ^                            #          |       |
> -  |          #        |                            #          |       |
> -  |  hback   #        |                            #  hfront  | hsync |
> -  |   porch  #        |       hactive              #  porch   |  len  |
> -  |<-------->#<-------+--------------------------->#<-------->|<----->|
> -  |          #        |                            #          |       |
> -  |          #        |vactive                     #          |       |
> -  |          #        |                            #          |       |
> -  |          #        v                            #          |       |
> -  +----------#######################################----------+-------+
> -  |          |        ^                            |          |       |
> -  |          |        |vfront_porch                |          |       |
> -  |          |        v                            |          |       |
> -  +----------+-------------------------------------+----------+-------+
> -  |          |        ^                            |          |       |
> -  |          |        |vsync_len                   |          |       |
> -  |          |        v                            |          |       |
> -  +----------+-------------------------------------+----------+-------+
> -
> -Note: In addition to being used as subnode(s) of display-timings, the timing
> -      subnode may also be used on its own. This is appropriate if only one mode
> -      need be conveyed. In this case, the node should be named 'panel-timing'.
> -
> -
> -Example:
> -
> -	display-timings {
> -		native-mode = <&timing0>;
> -		timing0: 1080p24 {
> -			/* 1920x1080p24 */
> -			clock-frequency = <52000000>;
> -			hactive = <1920>;
> -			vactive = <1080>;
> -			hfront-porch = <25>;
> -			hback-porch = <25>;
> -			hsync-len = <25>;
> -			vback-porch = <2>;
> -			vfront-porch = <2>;
> -			vsync-len = <2>;
> -			hsync-active = <1>;
> -		};
> -	};
> -
> -Every required property also supports the use of ranges, so the commonly used
> -datasheet description with minimum, typical and maximum values can be used.
> -
> -Example:
> -
> -	timing1: timing {
> -		/* 1920x1080p24 */
> -		clock-frequency = <148500000>;
> -		hactive = <1920>;
> -		vactive = <1080>;
> -		hsync-len = <0 44 60>;
> -		hfront-porch = <80 88 95>;
> -		hback-porch = <100 148 160>;
> -		vfront-porch = <0 4 6>;
> -		vback-porch = <0 36 50>;
> -		vsync-len = <0 5 6>;
> -	};
> +See display-timings.yaml in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> new file mode 100644
> index 000000000000..c8c0c9cb0492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: display timing bindings

s/timing/timings/

> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  A display panel may be able to handle several display timings,
> +  with different resolutions.
> +  The display-timings node makes it possible to specify the timing

s/the timing/the timings/

> +  and to specify the timing that is native for the display.
> +
> +properties:
> +  $nodename:
> +    const: display-timings
> +
> +  native-mode:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The default display timing is the one specified as native-mode.
> +      If no native-mode is specified then the first node is assumed the

s/assumed the/assumed to be the/

> +      native mode.
> +
> +patternProperties:
> +  "^timing":

Should this be "^timing[0-9]*$", or do we want to allow or names ?

> +    type: object
> +    allOf:
> +      - $ref: panel-timing.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +
> +    /*
> +     * Example that specifies panel timing using minimum, typical,
> +     * maximum values as commonly used in datasheet description.
> +     * timing1 is the native-mode.
> +     */
> +    display-timings {
> +        native-mode = <&timing1>;

Does this compile, as there's no phandle named timing1 ?

> +        timing0 {
> +            /* 1920x1080p24 */
> +            clock-frequency = <148500000>;
> +            hactive = <1920>;
> +            vactive = <1080>;
> +            hsync-len = <0 44 60>;
> +            hfront-porch = <80 88 95>;
> +            hback-porch = <100 148 160>;
> +            vfront-porch = <0 4 6>;
> +            vback-porch = <0 36 50>;
> +            vsync-len = <0 5 6>;
> +        };
> +        timing1 {
> +            /* 1920x1080p24 */
> +            clock-frequency = <52000000>;
> +            hactive = <1920>;
> +            vactive = <1080>;
> +            hfront-porch = <25>;
> +            hback-porch = <25>;
> +            hsync-len = <0 25 25>;
> +            vback-porch = <2>;
> +            vfront-porch = <2>;
> +            vsync-len = <2>;
> +            hsync-active = <1>;
> +            pixelclk-active = <1>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 8070c439adbd..ed051ba12084 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -61,6 +61,14 @@ properties:
>      allOf:
>        - $ref: panel-timing.yaml#
>  
> +  display-timings:
> +    description:
> +      Some display panels supports several resolutions with different timing.

s/timing/timings/

> +      The display-timings bindings supports specifying several timings and
> +      optional specify which is the native mode.

s/optional/optionally/

With these small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Great work !

> +    allOf:
> +      - $ref: display-timings.yaml#
> +
>    # Connectivity
>    port:
>      type: object

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
