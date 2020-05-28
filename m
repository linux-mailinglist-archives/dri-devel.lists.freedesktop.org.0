Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FAD1E6FEC
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 01:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6D36E83C;
	Thu, 28 May 2020 23:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F2B6E096
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 23:04:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D76AE2A8;
 Fri, 29 May 2020 01:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590707074;
 bh=NkLFU1lGVrngCpsagvs/+jL3KcMwCsMCh3BtwfDEfjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IgKSkqXuHNMXbQJ2AyRoBp51Qqr9n+65voqBALl1ZlkzTV67Cdif5vTMiFNuxbOl6
 1z46scVXW+iq68qhH6XewIHrwHxLoDdCbmD4D7/egijpiAV6MzwXCD4xDkNVj47gTw
 RUNfuypROaw1YAMjPNqQsT2Isr/5miTUFkH+9sB8=
Date: Fri, 29 May 2020 02:04:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: renesas, du: Convert binding to YAML
Message-ID: <20200528230419.GF14756@pendragon.ideasonboard.com>
References: <20200515003340.18191-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200528185244.GA400585@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528185244.GA400585@bogus>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Thu, May 28, 2020 at 12:52:44PM -0600, Rob Herring wrote:
> On Fri, May 15, 2020 at 03:33:40AM +0300, Laurent Pinchart wrote:
> > Convert the Renesas R-Car DU text binding to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../bindings/display/renesas,du.txt           | 139 ---
> >  .../bindings/display/renesas,du.yaml          | 915 ++++++++++++++++++
> 
> A 'normal' conversion is about double the lines. I guess this is a sign 
> that the original was not well specified.

The original was specified in a much more compressed form (for instance
there was a table with one line per SoC to describe the port node, the
YAML equivalent has to be longer).

> Maybe this can be split to reduce some of the if/then? One way is define 
> a common 'include' file that each specific instance can reference

With your recommendation of using pattern instead of enum for the dclkin
clock names, we're down to 848 lines, it's already a bit better :-)

I could indeed split the file, but I'll then run into naming issues. If
you look at the compatible strings for each of the if...then...else,
they don't have easy patterns that could be used to name files. I could
name the files based on one arbitrarily chosen compat string among the
multiple values that are supported, but I think that would become
confusing. I could also have one file per SoC, but we'll then end up
with lots of files, several of them being totally identical except for
the compatible string. Would you mind keeping it as-is, or do you think
it really needs to be split ?

> [...]
> 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > new file mode 100644
> > index 000000000000..ca48065afe1f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -0,0 +1,915 @@
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
> > +      - renesas,du-r8a7743 # for RZ/G1M compatible DU
> > +      - renesas,du-r8a7744 # for RZ/G1N compatible DU
> > +      - renesas,du-r8a7745 # for RZ/G1E compatible DU
> > +      - renesas,du-r8a77470 # for RZ/G1C compatible DU
> > +      - renesas,du-r8a774a1 # for RZ/G2M compatible DU
> > +      - renesas,du-r8a774b1 # for RZ/G2N compatible DU
> > +      - renesas,du-r8a774c0 # for RZ/G2E compatible DU
> > +      - renesas,du-r8a7779 # for R-Car H1 compatible DU
> > +      - renesas,du-r8a7790 # for R-Car H2 compatible DU
> > +      - renesas,du-r8a7791 # for R-Car M2-W compatible DU
> > +      - renesas,du-r8a7792 # for R-Car V2H compatible DU
> > +      - renesas,du-r8a7793 # for R-Car M2-N compatible DU
> > +      - renesas,du-r8a7794 # for R-Car E2 compatible DU
> > +      - renesas,du-r8a7795 # for R-Car H3 compatible DU
> > +      - renesas,du-r8a7796 # for R-Car M3-W compatible DU
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
> > +
> > +        additionalProperties: false
> 
> You can drop this and assume there's a generic check for this. Though I 
> guess this does ensure only 'remote-endpoint' is present which a generic 
> schema couldn't do.

When you say I can drop "this", which part do you mean exactly ? I
indeed wanted to specify that no other property than remote-endpoint can
be present. What's your recommendation ?

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
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> 
> Here and elsewhere:
> 
> - pattern: "^dclkin\.[01]$"

I assume you meant

- pattern: "^dclkin\\.[01]$"

Will fix.

> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
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
> 
> Does that matter?

It's a nice reminder that we should add support for it. And I don't
meant in the driver, even if that part is also required, but in the DT
bindings. I don't want to blindly state

            port@2:
              description: TCON

without working on TCON support on the driver side to validate that the
DT binding is fine and that I haven't overlooked something. Do you mind
keeping the comment for now ?

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
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +
> > +        interrupts:
> > +          maxItems: 2
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
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a7745
> > +              - renesas,du-r8a7792
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
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +
> > +        interrupts:
> > +          maxItems: 2
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
> > +              description: DPAD 1
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
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a7794
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
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +
> > +        interrupts:
> > +          maxItems: 2
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
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a77470
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
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +
> > +        interrupts:
> > +          maxItems: 2
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
> > +              description: DPAD 1
> > +            port@2:
> > +              description: LVDS 0
> > +            # port@3 is DVENC, not supported yet
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +            - port@2
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a7790
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 6
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: Functional clock for DU1
> > +            - description: Functional clock for DU2
> > +            - description: DU_DOTCLKIN0 input clock
> > +            - description: DU_DOTCLKIN1 input clock
> > +            - description: DU_DOTCLKIN2 input clock
> > +
> > +        clock-names:
> > +          minItems: 3
> > +          maxItems: 6
> > +          items:
> > +            - const: du.0
> > +            - const: du.1
> > +            - const: du.2
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +
> > +        interrupts:
> > +          maxItems: 3
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
> > +            port@2:
> > +              description: LVDS 1
> > +            # port@3 is TCON, not supported yet
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +            - port@2
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a7795
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +          maxItems: 8
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: Functional clock for DU1
> > +            - description: Functional clock for DU2
> > +            - description: Functional clock for DU4
> > +            - description: DU_DOTCLKIN0 input clock
> > +            - description: DU_DOTCLKIN1 input clock
> > +            - description: DU_DOTCLKIN2 input clock
> > +            - description: DU_DOTCLKIN3 input clock
> > +
> > +        clock-names:
> > +          minItems: 4
> > +          maxItems: 8
> > +          items:
> > +            - const: du.0
> > +            - const: du.1
> > +            - const: du.2
> > +            - const: du.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +              - dclkin.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +              - dclkin.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +              - dclkin.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +              - dclkin.3
> > +
> > +        interrupts:
> > +          maxItems: 4
> > +
> > +        resets:
> > +          maxItems: 2
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du.0
> > +            - const: du.2
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: HDMI 0
> > +            port@2:
> > +              description: HDMI 1
> > +            port@3:
> > +              description: LVDS 0
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +            - port@2
> > +            - port@3
> > +
> > +        renesas,cmms:
> > +          minItems: 4
> > +
> > +        renesas,vsps:
> > +          minItems: 4
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a774a1
> > +              - renesas,du-r8a7796
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 6
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: Functional clock for DU1
> > +            - description: Functional clock for DU2
> > +            - description: DU_DOTCLKIN0 input clock
> > +            - description: DU_DOTCLKIN1 input clock
> > +            - description: DU_DOTCLKIN2 input clock
> > +
> > +        clock-names:
> > +          minItems: 3
> > +          maxItems: 6
> > +          items:
> > +            - const: du.0
> > +            - const: du.1
> > +            - const: du.2
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.2
> > +
> > +        interrupts:
> > +          maxItems: 3
> > +
> > +        resets:
> > +          maxItems: 2
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du.0
> > +            - const: du.2
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: HDMI 0
> > +            port@2:
> > +              description: LVDS 0
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +            - port@2
> > +
> > +        renesas,cmms:
> > +          minItems: 3
> > +
> > +        renesas,vsps:
> > +          minItems: 3
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a774b1
> > +              - renesas,du-r8a77965
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 6
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: Functional clock for DU1
> > +            - description: Functional clock for DU3
> > +            - description: DU_DOTCLKIN0 input clock
> > +            - description: DU_DOTCLKIN1 input clock
> > +            - description: DU_DOTCLKIN3 input clock
> > +
> > +        clock-names:
> > +          minItems: 3
> > +          maxItems: 6
> > +          items:
> > +            - const: du.0
> > +            - const: du.1
> > +            - const: du.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.3
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +              - dclkin.3
> > +
> > +        interrupts:
> > +          maxItems: 3
> > +
> > +        resets:
> > +          maxItems: 2
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du.0
> > +            - const: du.3
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: HDMI 0
> > +            port@2:
> > +              description: LVDS 0
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +            - port@2
> > +
> > +        renesas,cmms:
> > +          minItems: 3
> > +
> > +        renesas,vsps:
> > +          minItems: 3
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a77970
> > +              - renesas,du-r8a77980
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 1
> > +          maxItems: 2
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: DU_DOTCLKIN0 input clock
> > +
> > +        clock-names:
> > +          minItems: 1
> > +          maxItems: 2
> > +          items:
> > +            - const: du.0
> > +            - const: dclkin.0
> > +
> > +        interrupts:
> > +          maxItems: 1
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
> > +            port@2: false
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +        renesas,vsps:
> > +          minItems: 1
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a774c0
> > +              - renesas,du-r8a77990
> > +              - renesas,du-r8a77995
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
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +            - enum:
> > +              - dclkin.0
> > +              - dclkin.1
> > +
> > +        interrupts:
> > +          maxItems: 2
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
> > +            port@2:
> > +              description: LVDS 1
> > +            # port@3 is TCON, not supported yet
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +            - port@2
> > +
> > +        renesas,cmms:
> > +          minItems: 2
> > +
> > +        renesas,vsps:
> > +          minItems: 2
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # R-Car H3 ES2.0 DU
> > +  - |
> > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    display@feb00000 {
> > +        compatible = "renesas,du-r8a7795";
> > +        reg = <0xfeb00000 0x80000>;
> > +        interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cpg CPG_MOD 724>,
> > +                 <&cpg CPG_MOD 723>,
> > +                 <&cpg CPG_MOD 722>,
> > +                 <&cpg CPG_MOD 721>;
> > +        clock-names = "du.0", "du.1", "du.2", "du.3";
> > +        resets = <&cpg 724>, <&cpg 722>;
> > +        reset-names = "du.0", "du.2";
> > +
> > +        renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
> > +        renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                endpoint {
> > +                    remote-endpoint = <&adv7123_in>;
> > +                };
> > +            };
> > +            port@1 {
> > +                reg = <1>;
> > +                endpoint {
> > +                    remote-endpoint = <&dw_hdmi0_in>;
> > +                };
> > +            };
> > +            port@2 {
> > +                reg = <2>;
> > +                endpoint {
> > +                    remote-endpoint = <&dw_hdmi1_in>;
> > +                };
> > +            };
> > +            port@3 {
> > +                reg = <3>;
> > +                endpoint {
> > +                    remote-endpoint = <&lvds0_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
