Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29343BE0E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 01:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7154D89F45;
	Tue, 26 Oct 2021 23:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0A189F45
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:43:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4161E596;
 Wed, 27 Oct 2021 01:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635291831;
 bh=sBZGC41FZ8lM7k20QL93O9OnTW1EC4idqMei7mhIvj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=foyomoE5hBCK4AIKAW0e4NwzwOsWD4h1kvFjGX4E3cBYvxd+16kAd5vVwTzHcEujG
 P0CxAQN960OgBdQmCW+OMXHufwLItO0QXpTVrc+T+h2OUAAON0aaxjq/g5T9XC/K/p
 mV6rtqEDmTzSvZ7Fd/p9fYMWdEFXQvWqPJu65x3o=
Date: Wed, 27 Oct 2021 02:43:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <YXiSoEdKUDRr3K5E@pendragon.ideasonboard.com>
References: <20211017001204.299940-1-marex@denx.de>
 <YW24EbfbtJdMMDRV@pendragon.ideasonboard.com>
 <c34f8a7e-eec6-9373-0c52-f6546ad689a8@denx.de>
 <YW3Rw0hZmB6plu+V@pendragon.ideasonboard.com>
 <4f235f45-5c03-eaeb-69ac-3d801a1dd58c@denx.de>
 <YW5qlXPyy6ZOHS6N@pendragon.ideasonboard.com>
 <c3f74fc5-3ec7-f01a-3195-273c28ceec83@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3f74fc5-3ec7-f01a-3195-273c28ceec83@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 19, 2021 at 04:39:05PM +0200, Marek Vasut wrote:
> On 10/19/21 8:49 AM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> >>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>>>> index 1faae3e323a4..708de84ac138 100644
> >>>>>> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>>>> @@ -79,6 +79,14 @@ properties:
> >>>>>>           - port@0
> >>>>>>           - port@1
> >>>>>>     
> >>>>>> +  pclk-sample:
> >>>>>> +    description:
> >>>>>> +      Data sampling on rising or falling edge.
> >>>>>> +    enum:
> >>>>>> +      - 0  # Falling edge
> >>>>>> +      - 1  # Rising edge
> >>>>>> +    default: 0
> >>>>>> +
> >>>>>
> >>>>> Shouldn't this be moved to the endpoint, the same way data-mapping is
> >>>>> defined as an endpoint property ?
> >>>>
> >>>> The strapping is a chip property, not port property, so no.
> >>>
> >>> For this particular chip that's true. I'm still not convinced overall.
> >>> For some cases it could be a per-port property
> >>
> >> Can you be more specific about "some cases" ?
> > 
> > I'm thinking about bridges that could have multiple parallel inputs.
> 
> Can you draft an example how such a binding would look like within the 
> confines of this lvds-codec.yaml ?
> 
> I also have to wonder how such a hypothetical device would work, would 
> it serialize two parallel bussed into single LVDS one ?

Such a device would require custom bindings I think, as lvds-codec is
limited to a single input and a single output. thine,thc63lvd1024.yaml
is an example of such a device.

> >>> , and moving it there for
> >>> lvds-codec too could allow implementing helpers to parse DT properties,
> >>> without much drawback for this particular use case as far as I can see.
> >>> It's hard to predict the future with certainty of course, so I won't
> >>> insist.
> >>
> >> The DT bindings and the OS drivers are separate thing, we really
> >> shouldn't start bending DT bindings so that they would fit nicely with a
> >> specific OS driver model.
> > 
> > DT bindings are not holy beings that live in a mythical heaven way above
> > the mere mortal drivers, they would be useless without implementations.
> > It's not about bending them, which I regularly push against during
> > review, but about structuring them in a way that facilitates
> > implementations when all other things are equal.
> 
> Note that the pclk-sample isn't a property of the input, but of the 
> chip, I don't think it is a good idea to say they are equal and conflate 
> them like so.

With a chip that has a single input, that's always the case :-)

Anyway, I don't mind a chip-level property for this binding as we're
limited to a single port. If other devices need to specify this at the
port level, I'm sure we'll be able to cope with the lack of uniformity.

> > As I said, despite wondering whether or not it would be better to move
> > the property to the endpoint (and that was a genuine open question), I
> > won't insist in this case.
> 
> [...]

-- 
Regards,

Laurent Pinchart
