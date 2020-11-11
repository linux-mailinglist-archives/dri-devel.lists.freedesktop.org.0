Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3655A2AF382
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 15:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444296E053;
	Wed, 11 Nov 2020 14:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32436E053
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:27:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E02A19;
 Wed, 11 Nov 2020 15:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605104858;
 bh=x+6cQdl3k6jIh9Epg7yQvBNQmgdjXU7lzidL9akFX4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djkgxwnReI8Qzr43qRLT7ZIrkKza7QhYr59Lo/FuXnVJjGZITCeg2N9C48rPUf6AY
 TGjXqQXtkvCyVLZwzJ8hUehXvczXNqOZKI0TbHdXts5ecvGc7FIG+GNwm+UhZQ13iU
 zonazKkes7jcZp+Jl797CRXvmWeD7ixI/nfWq8IM=
Date: Wed, 11 Nov 2020 16:27:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: Convert graph bindings to json-schema
Message-ID: <20201111142735.GG4115@pendragon.ideasonboard.com>
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-2-robh@kernel.org>
 <20201111140009.GD4115@pendragon.ideasonboard.com>
 <CAL_Jsq+A6Ga+h4qK0nzyL87M1DvrRSnzxtjwUNpq--L7MDHxfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+A6Ga+h4qK0nzyL87M1DvrRSnzxtjwUNpq--L7MDHxfA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Wed, Nov 11, 2020 at 08:25:40AM -0600, Rob Herring wrote:
> On Wed, Nov 11, 2020 at 8:00 AM Laurent Pinchart wrote:
> > On Mon, Nov 02, 2020 at 02:36:54PM -0600, Rob Herring wrote:
> > > From: Sameer Pujar <spujar@nvidia.com>
> > >
> > > Convert device tree bindings of graph to YAML format. Currently graph.txt
> > > doc is referenced in multiple files and all of these need to use schema
> > > references. For now graph.txt is updated to refer to graph.yaml.
> > >
> > > For users of the graph binding, they should reference to the graph
> > > schema from either 'ports' or 'port' property:
> > >
> > > properties:
> > >   ports:
> > >     type: object
> > >     $ref: graph.yaml#/properties/ports
> > >
> > >     properties:
> > >       port@0:
> > >         description: What data this port has
> > >
> > >       ...
> > >
> > > Or:
> > >
> > > properties:
> > >   port:
> > >     description: What data this port has
> > >     type: object
> > >     $ref: graph.yaml#/properties/port
> >
> > Sounds like a good approach.
> >
> > > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v3:
> > >  - Move port 'reg' to port@* and make required
> > >  - Make remote-endpoint required
> > >  - Add 'additionalProperties: true' now required
> > >  - Fix yamllint warnings
> > >
> > >  Documentation/devicetree/bindings/graph.txt  | 129 +-----------
> > >  Documentation/devicetree/bindings/graph.yaml | 199 +++++++++++++++++++
> > >  2 files changed, 200 insertions(+), 128 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/graph.yaml
> 
> [...]
> 
> > > diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
> > > new file mode 100644
> > > index 000000000000..b56720c5a13e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/graph.yaml
> > > @@ -0,0 +1,199 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/graph.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Common bindings for device graphs
> > > +
> > > +description: |
> > > +  The hierarchical organisation of the device tree is well suited to describe
> > > +  control flow to devices, but there can be more complex connections between
> > > +  devices that work together to form a logical compound device, following an
> > > +  arbitrarily complex graph.
> > > +  There already is a simple directed graph between devices tree nodes using
> > > +  phandle properties pointing to other nodes to describe connections that
> > > +  can not be inferred from device tree parent-child relationships. The device
> > > +  tree graph bindings described herein abstract more complex devices that can
> > > +  have multiple specifiable ports, each of which can be linked to one or more
> > > +  ports of other devices.
> > > +
> > > +  These common bindings do not contain any information about the direction or
> > > +  type of the connections, they just map their existence. Specific properties
> > > +  may be described by specialized bindings depending on the type of connection.
> > > +
> > > +  To see how this binding applies to video pipelines, for example, see
> > > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +  Here the ports describe data interfaces, and the links between them are
> > > +  the connecting data buses. A single port with multiple connections can
> > > +  correspond to multiple devices being connected to the same physical bus.
> > > +
> > > +maintainers:
> > > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > > +
> > > +select: false
> > > +
> > > +properties:
> > > +  port:
> > > +    type: object
> > > +    description:
> > > +      If there is more than one endpoint node or 'reg' property present in
> > > +      endpoint nodes then '#address-cells' and '#size-cells' properties are
> > > +      required.
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^endpoint(@[0-9a-f]+)?$":
> > > +        type: object
> > > +        properties:
> > > +          reg:
> > > +            maxItems: 1
> > > +
> > > +          remote-endpoint:
> > > +            description: |
> > > +              phandle to an 'endpoint' subnode of a remote device node.
> > > +            $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > > +        required:
> > > +          - remote-endpoint
> >
> > As noted elsewhere, this shouldn't be required.
> >
> > Should we set additionalProperties: false here ?
> 
> No, we've got a bunch of properties that get added to endpoint nodes.
> There's a few cases where 'port' nodes have properties too.

I meant the port node, which I wasn't aware needed additional
properties. Do you have any example ? (I wonder if you will point me to
bindings that I have written ;-))

> > > +  ports:
> > > +    type: object
> > > +    description: |
> > > +      If there is more than one port node or 'reg' property present in port
> > > +      nodes then '#address-cells' and '#size-cells' properties are required.
> > > +      In such cases all port nodes can be grouped under 'ports' independently
> > > +      from any other child device nodes a device might have.
> >
> > Allowing multiple port nodes not grouped in a ports node has created
> > complexity, with very little gain. Should we forbid that going forward ?
> 
> Yes, that's probably a separate change. The examples need updating
> too. We do have a few cases we'll have to support though.

Sure, it can be done on top.

> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^port(@[0-9a-f]+)?$":
> > > +        $ref: "#/properties/port"
> > > +        type: object
> > > +
> > > +        properties:
> > > +          reg:
> > > +            maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +
> >
> > Maybe a single blank line ?
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I've gone thru and updated schemas to use this. Primarily to prove out
> a meta-schema for it. So I'll be sending out another version.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
