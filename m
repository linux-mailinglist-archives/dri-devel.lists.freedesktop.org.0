Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7D164AEE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426608915E;
	Wed, 19 Feb 2020 16:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A5E89138
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:48:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C4B7563;
 Wed, 19 Feb 2020 17:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582130936;
 bh=/NCJBqhwDAR6YDS6oa/BRPHnFnk3elvzrzCS9GPuf0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fl1Gj/28pj7LawlvHF2l7kEbfqGW+IufCXIXE0i1vlVRxyxM9y9V/Q6j8FnAEMYSs
 ohkTZmu1oW4AQsY0BxxSIcSda6uRUu1MbRLj+RLqzI583c9IsH2JCxapJVqsqr62lN
 Wsd4MqboKPQD4xhovfIno8ENp6dlnwr3/19QgqLw=
Date: Wed, 19 Feb 2020 18:48:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5] dt-bindings: display: renesas: du: Document optional
 reset properties
Message-ID: <20200219164838.GC5070@pendragon.ideasonboard.com>
References: <20200214082623.4893-1-geert+renesas@glider.be>
 <20200219160410.GX5070@pendragon.ideasonboard.com>
 <CAMuHMdVEW1pjg=mf55dzi0uJ6f-qQCGXzzvTikffX+JAeJQEsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEW1pjg=mf55dzi0uJ6f-qQCGXzzvTikffX+JAeJQEsQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, Feb 19, 2020 at 05:36:57PM +0100, Geert Uytterhoeven wrote:
> On Wed, Feb 19, 2020 at 5:04 PM Laurent Pinchart wrote:
> > On Fri, Feb 14, 2020 at 09:26:23AM +0100, Geert Uytterhoeven wrote:
> > > Document the optional properties for describing module resets, to
> > > support resetting display channels on R-Car Gen2 and Gen3.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> 
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > @@ -50,6 +50,14 @@ Required Properties:
> > >      VSP instance that serves the DU channel, and the channel index identifies
> > >      the LIF instance in that VSP.
> > >
> > > +Optional properties:
> > > +  - resets: A list of phandle + reset-specifier pairs, one for each entry in
> > > +    the reset-names property.
> > > +  - reset-names: Names of the resets. This property is model-dependent.
> > > +    - All but R8A7779 use one reset for a group of one or more successive
> > > +      channels. The resets must be named "du.x" with "x" being the numerical
> > > +      index of the lowest channel in the group.
> >
> > I've now reviewed the patches that add those properties to our .dtsi
> > files, and I wonder how we should handle the two SoCs that have DU0, DU1
> > and DU3, but not DU2. The reset resource is tied to a group of two
> > channels, so we would use du.0 and du.2 respectively, but that conflicts
> > with the above text.
> >
> > I'm trying to think about the implementation on the driver side, where
> > group resources are associated with a group object, whose index is
> > computed by dividing the channel number by 2. We could have a special
> > case in group initialization that uses du.3 instead of du.2 for the
> > second group.
> >
> > What do you think ? Probably overkill, and we should go for du.3 ?
> 
> The "division by 2" rule is valid for R-Car Gen3, but not for R-Car
> Gen2, where there is only a single reset for all channels.
> 
> Originally we had "du.0-1" and "du.2-3" (hmm, somehow I missed adding
> this to the changelog for the bindings,  but it is present in the
> changelog for the DTS files), but after switching to "du.0" and "du.2",
> I always envisioned implementing this by finding a "du.x" reset by
> looping from the current channel index to 0.  That algorithm works for all
> supported SoCs (irrespective of naming the second reset on R-Car H3-N
> and M3-N "du.2" or "du.3" ;-)
> 
> As per your comment about single resets, we could drop reset-names on
> R-Car Gen2, but doing so would mean another special case in the driver.

Probably not worth it indeed. We can handle all this in the driver,
let's keep it as-is.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
