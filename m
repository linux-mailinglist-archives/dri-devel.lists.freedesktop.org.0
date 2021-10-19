Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6DB432E97
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 08:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126FC6E059;
	Tue, 19 Oct 2021 06:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1488D6E059
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:50:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F6F312A;
 Tue, 19 Oct 2021 08:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634626215;
 bh=oJYsDdKLUakPqw9h1bXi8+Pb1dLvnArcaFFmBay2viU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XSekLkn32Iq+m7kSZE3sJlMJgl8CXfD09jgTdHWiANVpa3JNPcYfRIMkmKWBwXd+G
 rpfQVpSyFDJQ4MFlzQtP0/+QzCJVr0iQZJGDPAODn5QweYSRuOEJdAH858jkjbyPuu
 5YouweI8hKsJqS3m9ndtOKq2iJHy8FjGEAMzaf7o=
Date: Tue, 19 Oct 2021 09:49:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <YW5qlXPyy6ZOHS6N@pendragon.ideasonboard.com>
References: <20211017001204.299940-1-marex@denx.de>
 <YW24EbfbtJdMMDRV@pendragon.ideasonboard.com>
 <c34f8a7e-eec6-9373-0c52-f6546ad689a8@denx.de>
 <YW3Rw0hZmB6plu+V@pendragon.ideasonboard.com>
 <4f235f45-5c03-eaeb-69ac-3d801a1dd58c@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f235f45-5c03-eaeb-69ac-3d801a1dd58c@denx.de>
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

Hi Marek,

On Tue, Oct 19, 2021 at 12:18:11AM +0200, Marek Vasut wrote:
> On 10/18/21 9:57 PM, Laurent Pinchart wrote:
> 
> Hi,
> 
> >>>> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>> index 1faae3e323a4..708de84ac138 100644
> >>>> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >>>> @@ -79,6 +79,14 @@ properties:
> >>>>          - port@0
> >>>>          - port@1
> >>>>    
> >>>> +  pclk-sample:
> >>>> +    description:
> >>>> +      Data sampling on rising or falling edge.
> >>>> +    enum:
> >>>> +      - 0  # Falling edge
> >>>> +      - 1  # Rising edge
> >>>> +    default: 0
> >>>> +
> >>>
> >>> Shouldn't this be moved to the endpoint, the same way data-mapping is
> >>> defined as an endpoint property ?
> >>
> >> The strapping is a chip property, not port property, so no.
> > 
> > For this particular chip that's true. I'm still not convinced overall.
> > For some cases it could be a per-port property
> 
> Can you be more specific about "some cases" ?

I'm thinking about bridges that could have multiple parallel inputs.

> > , and moving it there for
> > lvds-codec too could allow implementing helpers to parse DT properties,
> > without much drawback for this particular use case as far as I can see.
> > It's hard to predict the future with certainty of course, so I won't
> > insist.
> 
> The DT bindings and the OS drivers are separate thing, we really 
> shouldn't start bending DT bindings so that they would fit nicely with a 
> specific OS driver model.

DT bindings are not holy beings that live in a mythical heaven way above
the mere mortal drivers, they would be useless without implementations.
It's not about bending them, which I regularly push against during
review, but about structuring them in a way that facilitates
implementations when all other things are equal.

As I said, despite wondering whether or not it would be better to move
the property to the endpoint (and that was a genuine open question), I
won't insist in this case.

-- 
Regards,

Laurent Pinchart
