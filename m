Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED02DF5B8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 15:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97C889948;
	Sun, 20 Dec 2020 14:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFC889948
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 14:48:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2879F593;
 Sun, 20 Dec 2020 15:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608475732;
 bh=9C1hkK/yRHoiFu609iNhOmuxuwqztWPNjHBCuap35uY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GxVPEBRAy6Vx1A9YykF1sc1+6Eg9X1Z3fFaMbwYQ5m5pf3er6eiWIuHox4rEqBwpi
 DArz10qSy6I3SRteaN1Qz/8N3VD+OOyt0aKQOxiitFmX/IkIRkGRHW/L10CyMDFyqb
 r9q50JSQHk4E5kWuWaJr7zPYf/1cQzGcEv6WF4Rw=
Date: Sun, 20 Dec 2020 16:48:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: renesas, du: Convert binding to YAML
Message-ID: <X99kTE1Ag30f0Vl/@pendragon.ideasonboard.com>
References: <20201215230603.7796-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201217234822.GA431595@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217234822.GA431595@robh.at.kernel.org>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Thu, Dec 17, 2020 at 05:48:22PM -0600, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 01:06:03AM +0200, Laurent Pinchart wrote:
> > Convert the Renesas R-Car DU text binding to YAML.
> 
> I tend to think this should be split up, but up to you.

I wouldn't mind, but I'm not sure how to do so in a meaningful way that
wouldn't result in, for instance, a file name renesas,du-r8a7791.yaml
that would contain bindings for all of

- renesas,du-r8a7743
- renesas,du-r8a7744
- renesas,du-r8a7791
- renesas,du-r8a7793

which I think would be quite confusing, or one file per SoC with lots of
duplications, which doesn't sound great either :-S If there's a better
split, I'd be happy to implement it.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Use pattern instead of enum for dclkin
> > - Update MAINTAINERS
> > ---
> >  .../bindings/display/renesas,du.txt           | 145 ---
> >  .../bindings/display/renesas,du.yaml          | 854 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 855 insertions(+), 146 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > new file mode 100644
> > index 000000000000..f56ef3eed742
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -0,0 +1,854 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/renesas,du.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Display Unit (DU)
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +description: |
> > +  These DT bindings describe the Display Unit embedded in the Renesas R-Car
> > +  Gen1, R-Car Gen2, R-Car Gen3, RZ/G1 and RZ/G2 SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,du-r8a7742 # for RZ/G1H compatible DU
> > +      - renesas,du-r8a7743 # for RZ/G1M compatible DU
> > +      - renesas,du-r8a7744 # for RZ/G1N compatible DU
> > +      - renesas,du-r8a7745 # for RZ/G1E compatible DU
> > +      - renesas,du-r8a77470 # for RZ/G1C compatible DU
> > +      - renesas,du-r8a774a1 # for RZ/G2M compatible DU
> > +      - renesas,du-r8a774b1 # for RZ/G2N compatible DU
> > +      - renesas,du-r8a774c0 # for RZ/G2E compatible DU
> > +      - renesas,du-r8a774e1 # for RZ/G2H compatible DU
> > +      - renesas,du-r8a7779 # for R-Car H1 compatible DU
> > +      - renesas,du-r8a7790 # for R-Car H2 compatible DU
> > +      - renesas,du-r8a7791 # for R-Car M2-W compatible DU
> > +      - renesas,du-r8a7792 # for R-Car V2H compatible DU
> > +      - renesas,du-r8a7793 # for R-Car M2-N compatible DU
> > +      - renesas,du-r8a7794 # for R-Car E2 compatible DU
> > +      - renesas,du-r8a7795 # for R-Car H3 compatible DU
> > +      - renesas,du-r8a7796 # for R-Car M3-W compatible DU
> > +      - renesas,du-r8a77961 # for R-Car M3-W+ compatible DU
> > +      - renesas,du-r8a77965 # for R-Car M3-N compatible DU
> > +      - renesas,du-r8a77970 # for R-Car V3M compatible DU
> > +      - renesas,du-r8a77980 # for R-Car V3H compatible DU
> > +      - renesas,du-r8a77990 # for R-Car E3 compatible DU
> > +      - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  # See compatible-specific constraints below.
> > +  clocks: true
> > +  clock-names: true
> > +  interrupts: true
> > +  resets: true
> > +  reset-names: true
> > +
> > +  ports:
> > +    type: object
> > +    description: |
> > +      The connections to the DU output video ports are modeled using the OF
> > +      graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > +      The number of ports and their assignment are model-dependent. Each port
> > +      shall have a single endpoint.
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^port@[0-3]$":
> > +        type: object
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              remote-endpoint:
> > +                $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> 
> No need to document more than 'port' nodes if no extra endpoint 
> properties.

I'll fix that.

> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +  renesas,cmms:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +    description:
> > +      A list of phandles to the CMM instances present in the SoC, one for each
> > +      available DU channel.
> > +
> > +  renesas,vsps:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +    description:
> > +      A list of phandle and channel index tuples to the VSPs that handle the
> > +      memory interfaces for the DU channels. The phandle identifies the VSP
> > +      instance that serves the DU channel, and the channel index identifies
> > +      the LIF instance in that VSP.
> 
> These 2 properties are about the only thing shared.
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +  - resets
> > +  - ports
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,du-r8a7779
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 1
> > +          maxItems: 3
> > +          items:
> > +            - description: Functional clock
> > +            - description: DU_DOTCLKIN0 input clock
> > +            - description: DU_DOTCLKIN1 input clock
> > +
> > +        clock-names:
> > +          minItems: 1
> > +          maxItems: 3
> > +          items:
> > +            - const: du.0
> > +            - pattern: "^dclkin\\.[01]$"
> > +            - pattern: "^dclkin\\.[01]$"
> 
> IIRC, with single quotes you just need '\.' instead of '\\.'

Thanks for the tip, fixed.

> > +
> > +        interrupts:
> > +          maxItems: 1
> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: DPAD 1
> > +            # port@2 is TCON, not supported yet
> > +            port@2: false
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +      required:
> > +        - interrupts
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a7743
> > +              - renesas,du-r8a7744
> > +              - renesas,du-r8a7791
> > +              - renesas,du-r8a7793
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 4
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: Functional clock for DU1
> > +            - description: DU_DOTCLKIN0 input clock
> > +            - description: DU_DOTCLKIN1 input clock
> > +
> > +        clock-names:
> > +          minItems: 2
> > +          maxItems: 4
> > +          items:
> > +            - const: du.0
> > +            - const: du.1
> > +            - pattern: "^dclkin\\.[01]$"
> > +            - pattern: "^dclkin\\.[01]$"
> > +
> > +        interrupts:
> > +          maxItems: 2
> 
> What are they?

I've modified the common section at the top to include

  interrupts:
    description: Interrupt specifiers, one per DU channel

> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du.0
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: LVDS 0
> > +            # port@2 is TCON, not supported yet
> > +            port@2: false
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names

[snip]


-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
