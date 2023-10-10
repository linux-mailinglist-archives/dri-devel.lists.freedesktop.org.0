Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA47BFEB6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 16:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A8410E382;
	Tue, 10 Oct 2023 14:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Tue, 10 Oct 2023 14:05:47 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5B710E382
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E2C93FB16;
 Tue, 10 Oct 2023 15:57:06 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DC-5xPbGdTKb; Tue, 10 Oct 2023 15:57:04 +0200 (CEST)
Date: Tue, 10 Oct 2023 15:57:02 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
Message-ID: <ZSVYLiwzSZi4mSy7@qwark.sigxcpu.org>
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Mader <robert.mader@posteo.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Hector Martin <marcan@marcan.st>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Caleb,
thanks for putting this out. 

On Mon, Oct 09, 2023 at 06:32:50PM +0100, Caleb Connolly wrote:
> Some display panels found in modern phones and laptops feature
> non-standard display shapes with features like rounded corners, notches
> (sections of the display that are cut-out from the edge), and cutouts
> (such as circular "hole punch" camera cutouts, or wider pill-shaped
> "islands").
> 
> Some discussion has been underway previously on how best to describe
> these features [1][2], including a reference userspace implementation
> using SVG paths [3]. Using this previous discussion as a jumping off
> point, this RFC allows for describing the following display features:
> 
> * Corner radius (on a per-corner basis)
> * Circular or pill-shaped cutouts
> * Notches with arbitrary shapes

The coordinate systems is 0,0 at top,left display corner?

> It's easy to make a case for only using rectangles to describe these
> missing parts of a display, however this severely limits their utility.
> Describing display occlusions as accurately as possible allows for a lot of
> useful UX features. For example, displaying a ring around a hole-punch
> camera when it's in use, or wrapping UI elements around a notch. These
> behaviours are only possible to implement when the dimensions are known
> with near pixel-perfect accuracy.
> 
> Cutouts are described as rectangles with a width, height, and corner
> radius.
> A radius of half the width longest edge will definitionally be an ellipse.
> This simple description is suitable for describing hole-punch cameras,
> as well
> as pill-shaped cutouts. I'm not aware of any devices that can't be
> described like this.

I wonder if we shouldn't just use a closed SVG path and put this and notches
in one bucket that way. We need to indicate the "type" of a notch/cutout
anyway as there's e.g. ones which aren't fully opaque but "just" lower
resolution areas. We could start out with one type "fully opaque".

> Notches are a little more complicated, they usually feature convex and
> concave corners as well as straight lines. Here they are described as a
> sequence of optionally disjoint arcs, where the space between one arc ending
> and another starting is inferred to be a straight line.

gmobile is using a subset of a closed SVG path (so does Android
afaik). The upside of "just arcs" would be that bounding box is even simpler
but as this affects userspace I think getting a better approximation
using a path would be worth it and we could treat it the same as
cutouts.

> Each arc is described with an X and Y pixel coordinate, a radius, and a
> start and end point in degrees. These arcs can precisely describe the
> shape of a notch, and easily allow for a basic bounding box to be
> derived using the min/max coordinates specified in the path.
> 
> Some displays feature partially occluded edges ("waterfall edges") where
> the screen bends, it may be useful for user interfaces to avoid placing
> certain UI elements like buttons too close to these edges. These edges
> are described by a distance from the edge where it begins to be
> occluded, and the number of degrees that the display curves (this
> directly affects how usable this edge of the screen is).

I've not yet seen a device with this on Linux. Would it make sense to
leave it out until we have those coming. E.g. are all waterfalls the
same or are some more usable for displaying information than others?

What is your plan on informing userspace about that? Feed it through DRM
via drm properties or would userspace poke at /sys and try to find the
right panel for the connector? drm would have the upside of not being
bound to device-tree using platforms.

Cheers,
 -- Guido

> 
> [1]: https://lore.kernel.org/dri-devel/f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech/
> [2]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/issues/87
> [3]: https://gitlab.gnome.org/World/Phosh/gmobile
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> Some folks have previously suggested that this information belongs in
> userspace and not in devicetree. I would like to be clear that
> devicetree is for describing hardware, and parts of a display which can
> never actually be seen are very much properties of the underlying
> hardware.
> ---
> base-commit: 268c4b354d66908697299063c44c0b553b01d935
> 
> // Caleb (they/them)
> ---
>  .../bindings/display/panel/panel-common.yaml       |   7 +
>  .../bindings/display/panel/panel-occlusions.yaml   | 182 +++++++++++++++++++++
>  2 files changed, 189 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 0a57a31f4f3d..6ea52a031872 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -150,6 +150,13 @@ properties:
>        controller, this property contains a phandle that references the
>        controller.
>  
> +  occlusions:
> +    $ref: panel-occlusions.yaml#
> +    description:
> +      Some panels have non-standard shapes due to features like rounded corners,
> +      notches, cutouts, and "waterfall" edges. The panel-occlusions bindings
> +      can be used to describe these features.
> +
>  dependencies:
>    width-mm: [ height-mm ]
>    height-mm: [ width-mm ]
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-occlusions.yaml b/Documentation/devicetree/bindings/display/panel/panel-occlusions.yaml
> new file mode 100644
> index 000000000000..0932026bbd8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-occlusions.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-occlusions.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for describing display notches, cutouts, and other occlusions
> +
> +maintainers:
> +  - Caleb Connolly <caleb.connolly@linaro.org>
> +
> +description: |
> +  This document defines devicetree nodes that can be used to describe
> +  different kind of display occlusions such as notches, camera cutouts, rounded
> +  corners, and other features that may require special treatment by the display
> +  subsystem. All pixel values should be given in the displays native resolution.
> +
> +properties:
> +  $nodename:
> +    const: occlusions
> +
> +  corners:
> +    type: object
> +    description: |
> +      An area of the display which is fully obscured by a notch.
> +    properties:
> +      radius-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Describes the radius when it's identical for all corners
> +
> +      radius-top-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Describes the radius when it's identical for both top corners
> +
> +      radius-bottom-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Describes the radius when it's identical for both top corners
> +
> +      radius-top-left-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The radius of the top left corner in pixels
> +
> +      radius-top-right-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The radius of the top right corner in pixels
> +
> +      radius-bottom-left-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The radius of the bottom left corner in pixels
> +
> +      radius-bottom-right-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The radius of the bottom right corner in pixels
> +
> +    dependencies:
> +      radius-top-left-px: [ radius-top-right-px ]
> +      radius-top-right-px: [ radius-top-left-px ]
> +      radius-bottom-left-px: [ radius-bottom-right-px ]
> +      radius-bottom-right-px: [ radius-bottom-left-px ]
> +
> +    anyOf:
> +      - required:
> +          - radius-px
> +      - required:
> +          - radius-top-px
> +          - radius-bottom-px
> +      - required:
> +          - radius-top-px
> +          - radius-bottom-left-px
> +          - radius-bottom-right-px
> +      - required:
> +          - radius-bottom-px
> +          - radius-top-left-px
> +          - radius-top-right-px
> +      - required:
> +          - radius-top-left-px
> +          - radius-top-right-px
> +          - radius-bottom-left-px
> +          - radius-bottom-right-px
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  "^cutout(-[0-9])?$":
> +    type: object
> +    description: |
> +      An area of the display which is not directly adjacent to an
> +      edge and is fully occluded (for example, a camera cutout).
> +    properties:
> +      x-position-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The horizontal coordinate of the center of the cutout.
> +
> +      y-position-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The horizontal coordinate of the center of the cutout.
> +
> +      width-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The width of the cutout in pixels.
> +
> +      height-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The width of the cutout in pixels.
> +
> +      corner-radius-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          The radius of the corners in pixels. For a circle this should be half of
> +          the width/height.
> +
> +    required:
> +      - x-position-px
> +      - y-position-px
> +      - width-px
> +      - height-px
> +      - corner-radius-px
> +
> +    additionalProperties: false
> +
> +  "^notch(-[0-9])?$":
> +    type: object
> +    description: |
> +      An area of the display which is fully occluded by a notch.
> +    properties:
> +      path:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          Sequence of values defining the arcs which describe this path. Lines
> +          are inserted between arcs that don't directly meet.
> +        maxItems: 8 # Ought to cover most scenarios
> +        items:
> +          items:
> +            - description: X coordinate of center point in pixels
> +            - description: Y coordinate of center point in pixels
> +            - description: Circle radius
> +            - description: Starting angle in degrees
> +            - description: Ending angle in degrees
> +
> +    required:
> +      - path
> +
> +    additionalProperties: false
> +
> +  "^(left|right|top|bottom)-edge$":
> +    type: object
> +    description: |
> +      An edge of the screen with reduced visibility due to a waterfall design
> +      or similar.
> +    properties:
> +      size-px:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The distance from the edge where it begins to obscure visbility
> +
> +      curve-degrees:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The number of degrees that the display curves.
> +        maximum: 100
> +
> +    required:
> +      - size-px
> +      - curve-degrees
> +
> +additionalProperties: false
> +
> +examples:
> +  - | # A panel with a large-ish notch on the top edge, and different corner radii
> +    panel {
> +        occlusions {
> +            notch {
> +                path = <360 8  10 0    90>,
> +                       <435 10 20 270 180>,
> +                       <645 10 20 180  90>,
> +                       <645 8  10  90   0>;
> +            };
> +
> +            corners {
> +                radius-top-px = <30>;
> +                radius-bottom-px = <40>;
> +            };
> +        };
> +    };
> 
