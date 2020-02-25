Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3716BD16
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 10:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A417D6EA65;
	Tue, 25 Feb 2020 09:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4046EA65;
 Tue, 25 Feb 2020 09:13:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D636828FF0F;
 Tue, 25 Feb 2020 09:13:56 +0000 (GMT)
Date: Tue, 25 Feb 2020 10:13:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new bus-width prop
Message-ID: <20200225101354.5f621ccb@collabora.com>
In-Reply-To: <20200224223139.GA29578@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-10-boris.brezillon@collabora.com>
 <20200224223139.GA29578@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Feb 2020 00:31:39 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Tue, Jan 28, 2020 at 02:55:11PM +0100, Boris Brezillon wrote:
> > Add the bus-width property to describe the input bus format.
> > 
> > v10:
> > * Add changelog to the commit message
> > * Add Rob's R-b
> > 
> > v8 -> v9:
> > * No changes
> > 
> > v7:
> > * Rebase on top of lvds-codec changes
> > * Drop the data-mapping property
> > 
> > v4 -> v6:
> > * Not part of the series
> > 
> > v3:
> > * New patch
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 8f373029f5d2..7c4e42f4de61 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -55,6 +55,14 @@ properties:
> >          description: |
> >            For LVDS encoders, port 0 is the parallel input
> >            For LVDS decoders, port 0 is the LVDS input
> > +        properties:
> > +          bus-width:
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +              - enum: [18, 24]
> > +              - default: 24
> > +          description:
> > +            Number of data lines used to transmit the RGB data.  
> 
> This is a bit unclear. First of all, depending on whether the node is an
> LVDS encoder or decoder, port@0 is either a parallel input or an LVDS
> input. The property mentiones RGB data, does it mean it apply to LVDS
> encoders only ? Or should it be in port@1 for LVDS decoders ?

Right, I only considered the encoder case here. For the decoder case, we
don't need a bus-width prop yet, as the bus format output is currently
enforced by the bus format input of the next component in the chain
(panel/next-bridge), but that might change if we start dealing with
panel/bridges supporting several input formats and expecting the LVDS
encoder/decoder to select one. What we do need for the decoder case
though, is a data-mapping prop, otherwise this LVDS bridge exposes a
FIXED in-format and the previous element in the chain has to use its
'default' output format (which might not be appropriate).

Maybe we should go for Sam's approach and expose a data-mapping prop
on both ends of the bridge (that implies describing RGB/DPI bus width
using the data-mapping prop), this way we wouldn't have to distinguish
the encoder/decoder case.

> 
> Then, I'm not sure what the property describes. Is it the number of data
> lanes that the chip has ? Or the number of lanes routed on the board ?

It's the number of lanes routed on the board. I'll clarify that.

> Should it be specified only if the number of lanes on the board is
> different than the maximum number of lanes of the hardware ?

You mean default number of lanes (24)? Well, I guess defining it
explicitly is not a bad thing, so, even if the default is already 24,
I don't see a problem setting bus-width = <24>. Actually, maybe that's
even better if we force new users to explicitly define the number of
lanes exposed on the DPI interface, but we definitely need this default
value if we want to keep things backward compatible. Not sure how to
express that (it's not mandatory, it's not optional, it's recommended
:-)).

> A more
> detailed description is needed.
> 
> Updating the example would also be useful.

I can do that too.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
