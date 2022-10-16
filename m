Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4AA5FFCE8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 03:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB1010E5F0;
	Sun, 16 Oct 2022 01:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C201310E59A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 01:33:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3638330A;
 Sun, 16 Oct 2022 03:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665883997;
 bh=ieNfBG7/of6KMXgXmOP56haDL3EhVK5nv2A5zcxE7BA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oyY4I9e0/GRssDO1YOZiM0nS+w9LkxnniO25CukfRZlmI4j6kbMsAbkl/vd++9a1l
 ChMAdioeKq5ohcj91HCPkhNacL4j2wn/zKE4EEnJUjLgAkm7f2drfDc+C+SrTG9fbD
 VIx4PV8P3pyHlCoorKI6KXO95jiXZgv00Ytnvwes=
Date: Sun, 16 Oct 2022 04:32:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: add new bus-format property
 for panel-dpi
Message-ID: <Y0tfRhn/f1FiGDi4@pendragon.ideasonboard.com>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
 <Y0gLdQleE64FQgn9@gaggiata.pivistrello.it>
 <CAPY8ntAszGzcp4XC=XKMHJvzCC9LHHf24pt=nZAUFKcK5=JM_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAszGzcp4XC=XKMHJvzCC9LHHf24pt=nZAUFKcK5=JM_Q@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 max.krummenacher@toradex.com, francesco.dolcini@toradex.com,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Oct 14, 2022 at 03:08:49PM +0100, Dave Stevenson wrote:
> On Thu, 13 Oct 2022 at 13:58, Francesco Dolcini wrote:
> > On Tue, Jun 28, 2022 at 08:18:36PM +0200, Max Krummenacher wrote:
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > The property is used to set the enum bus_format and infer the bpc
> > > for a panel defined by 'panel-dpi'.
> > > This specifies how the panel is connected to the display interface.
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> >
> > <snip>
> >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > index dae0676b5c6e..52f5db03b6a8 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > @@ -26,7 +26,28 @@ properties:
> > >    height-mm: true
> > >    label: true
> > >    panel-timing: true
> > > -  port: true
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    description:
> > > +      Input port node, receives the panel data.
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +
> > > +        properties:
> > > +          bus-format:
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            minimum: 0x1001
> > > +            maximum: 0x1fff
> > > +            description: |
> > > +              Describes how the display panel is connected to the display interface.
> > > +              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> > > +              The mapping between the color/significance of the panel lines to the
> > > +              parallel data lines are defined in:
> > > +              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
> > > +
> >
> > Last month I had the chance to talk in person about this topic with
> > Dave, Marek and Max in Dublin.
> >
> > My understanding is that this change is addressing a general need, Dave
> > confirmed me they have a downstream patch for raspberrypi [1].
> >
> > From what I could tell the only concern is about the actual encoding of
> > this `bus-format` property.
> >
> > I am personally convinced that a simple enum is the way to go, I think
> > that Marek proposal is adding complexity and not flexibility (from my
> > understanding Dave is on the same page, just correct me if I
> > misunderstood you).
> 
> Yes I agree with you here.
> 
> This binding is for the panel, and currently the only path to pass the
> panel mode to the DPI transmitter is one or more MEDIA_BUS_FMT_* enums
> in struct drm_display_info *bus_formats.
> 
> Looking at Marek's comment over DSI and data-lanes, yes both source
> and sink could advertise a data-lanes property to cover the condition
> where they aren't wired up in a 1:1 fashion. Reality is that most
> drivers don't support reordering the lanes - looking at the bindings,
> only one (msm) documents the use of data-lanes on the host side.
> rcar_mipi_dsi looks at the number of lanes specified only, and then
> checks that the number requested by the device is <= the number
> configured.
> 
> As I see it, the comparison here is that this "bus-format" property is
> the equivalent of the data-lanes on the sink, and is the desired
> number of lanes value passed from sink to source (one integer, not a
> mapping).
> If the source can reorder the lanes, then that is a property of the
> source. This binding is for the sink, and so isn't a reasonable
> comparison. It also doesn't have to be called "bus-format" on the
> source, and can take a totally different form.
> I'll admit that I know data-lane configuration more from CSI2, but
> within V4L2 it is the node that can support reordering that should
> have the lanes in a non-incrementing order, and that is normally the
> SoC rather than the sensor. The same would seem to apply here - it's
> the SoC that can remap the signals, not the panel.
> 
> It could be argued that for DPI the panel should only advertise the
> panel's bit depth for each channel, not the padding. The panel is
> generic and could handle any wiring/padding options, and it isn't
> necessarily a simple 16/18/24/32 bit bus representation, just a
> collection of N wires.
> Padding and wiring is a function of the DPI transmitter / SoC, or
> potentially an interconnect node between the two.

Sooo... I'm not sure where to start :-)

I think the trouble when describing the connection between a source and
a sink in DT is that none of the source or sink is an ideal place to
describe properties of the connection.

For DSI we have it relatively easy, as we only have to describe the
number of lanes that are routed on the board and possibly how the lanes
are rearranged. The former is a value that is common between the source
and the sink, that's the easiest case, it can be specified in both DT
nodes. The latter is a bit more complicated, and was solved by allowing
specifying lane reordering on both the source and the sink. As there is
typically only one of the two components that will support lane
reordering (if any), DTs will usually specify a 1:1 mapping on one side,
and possibly reorder on the other side. If both the source and the sink
support reordering, setting data-lanes = <1 2> on both sides would lead
to a different configuration than data-lanes = <2 1>, but both would
work the same (I'm not sure why anyone would want the latter though).
There may thus be multiple ways to describe a working setup, but that's
fine, the complexity is manageable, and any hardware configuration can
be described.

The nice thing with DSI is that the actual data format doesn't depend on
the board configuration (provided of course that enough lanes are
available to sustain the required bandwidth). For DPI, things can be
more difficult. In the test below, "format" refers to how data bits are
mapped to hardware lines, similarly in concept to the media bus codes.

I see three different cases at the hardware level:

- Either or both the sink or the source support a single format. This
  means that the side that supports multiple formats will always use the
  same format. If data lines are rearranged, the format output by the
  source may not match the format received by the sink, but the hardware
  configuration of both the sink and the source is effectively fixed to
  system-specific values.

- Both the sink and the source support multiple formats, but only one
  combination of formats is possible with how the data lines are routed.
  This case is very similar to the previous one at the hardware level,
  only one configuration is possible.

- Both the sink and the source support multiple formats, and multiple
  format combinations can lead to working configurations. This isn't an
  uncommon case, there are DPI panels with 24 data lines that can
  support both RGB666 and RGB888.

At the software level, there are also multiple options:

- Both sides could specify the device configuration in DT, using media
  bus codes or any other set of standard or device-specific properties.
  As this would specify a single configuration, it would map quite fine
  to the first two hardware cases. Each driver would read its own
  properties and configure the device accordingly. There would be no
  need for communication between the drivers at runtime in this case.

  This could also support the third hardware case, but would limit it to
  one of the supported configurations, without allowing the other ones
  to be selected at runtime.

  This scheme is similar to data-lanes, in the sense that each side
  reads its own hardcoded configuration from DT. It does however differ
  in that the data format gets hardcoded as well, unlike DSI where the
  data formats needs to be communicated at runtime between the drivers.
  As, like DSI, it requires both sides to specify their hardware
  configuration in DT, interoperability between sources and sinks would
  require all DT bindings for all DPI devices to adhere to this. They
  may not have to specify their configuration using the same set of
  properties, but they would all need to specify it in DT. This would
  thus, I think, lead to a dead end for the third hardware case.

- The two sides could communicate at runtime to dynamically negotiate
  their configuration. Some form of runtime configuration is required to
  fully support the third hardware case, and it could also support the
  other two cases.

  The trouble here, beside how to express the required data in DT, is
  how that communication would be handled. Let's consider a case where
  data lines are "remapped":

  - The display controller that has a D[23:0] output bus
  - The panel that has a D[17:0] bus
  - The data lines connections from the display controller to the panel
    are D[23:18] -> D[17:12], D[15:10] -> D[11:6], D[7:2] -> D[5:0],
    with the display controller's D[17:16], D[9:8] and D[1:0] outputs
    unconnected
  - The panel only supports RGB666
  - The display controller supports both RGB888 and RGB666, and outputs
    RGB666 as 00RRRRRR00GGGGGG00BBBBBB

  This means that the only possibly configuration is the display
  controller outputting RGB888 and the panel receiving RGB666. If we
  expressed that as media bus codes in DT, the panel would would
  communicate its RGB666 input format to the display controller, which
  wouldn't know that it would have to output RGB888.

  Of course, in this particular example, only one hardware configuration
  is possible, so we could support it by specifying the media bus code
  in both DT nodes, but that won't scale to cases where multiple
  configurations are possible.

The easy optin is to consider that most use cases are in the first two
hardware categories, specify the media bus code in DT on both sides, and
consider that support for the third category can be added later. I'm
worried that we would then corner ourselves, as explained above, because
this scheme requires all devices involved to specify their hardcoded
configuration in DT. Will there then be a path forward that wouldn't
break the DT ABI ? Even if there was, it would mean that all driver
would then need to support two sets of DT properties, leading to a
painful transition period on the driver side.

> > The current proposal is already encoding the exact bit placing as
> > described in Documentation/userspace-api/media/v4l/subdev-formats.rst [2],
> > this enumeration can be extended to address any future needs
> > and I would not invent a new one to define the exact same
> > things (and using the same enum was also suggested by Rob).
> >
> > Marek: you told me that you had some concern about some valid use case
> > not covered by this solution, would you mind explaining why that would
> > not be covered with an addition on this enumeration?
> 
> All the MEDIA_BUS_FMT_* enums are explicitly defined with regard to
> the colour component bit positions. Should someone be in the position
> of needing to implement a YUV or similar DPI display, converting these
> enums into the relevant new structure will be straightforward, so
> backwards compatibility can be achieved easily.
> 
> > Any other opinion on this topic? How can we move this forward?
> >
> > Francesco
> >
> > [1] https://github.com/raspberrypi/linux/commit/8e43f1898191b43aa7ed6e6ca3a4cd28709af86d
> > [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html

-- 
Regards,

Laurent Pinchart
