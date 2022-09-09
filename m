Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24485B3508
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1910EC5D;
	Fri,  9 Sep 2022 10:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2B010EC5D;
 Fri,  9 Sep 2022 10:19:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7FCA3B8248E;
 Fri,  9 Sep 2022 10:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF40C433C1;
 Fri,  9 Sep 2022 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662718794;
 bh=IhWdkplmLLbhX2ufVeAZjIEIqvjIvHwTvI5uHEKFDz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/TTiYIphlOGCDb05fq0V/shmeQkBANdybkYwIemAUq5tfjRZ2UC2G3zvnq21X/z4
 fSlqXrjKri57jKNrNwqeZwUfdle71rgGXWcJPjb8vOQAgM2/Tnv6w1Opf9GRhNeGPb
 0ot5bWmV+VWk4s2XHR2Ol9Hr438c5sZMUkMGADmg=
Date: Fri, 9 Sep 2022 12:19:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Message-ID: <YxsTR4spD5btac1/@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-7-daniele.ceraolospurio@intel.com>
 <YxraNUiyfH6NJiq5@kroah.com>
 <MN2PR11MB409318EA31363B2E749700FFE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrkWotjObH6zAca@kroah.com>
 <BY5PR11MB40869BEBCB65489E21A3F650E5439@BY5PR11MB4086.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB40869BEBCB65489E21A3F650E5439@BY5PR11MB4086.namprd11.prod.outlook.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 09:21:30AM +0000, Winkler, Tomas wrote:
> > >
> > > > -----Original Message-----
> > > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Sent: Friday, September 09, 2022 09:16
> > > > To: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> > > > Cc: intel-gfx@lists.freedesktop.org;
> > > > dri-devel@lists.freedesktop.org; Winkler, Tomas
> > > > <tomas.winkler@intel.com>; Lubart, Vitaly <vitaly.lubart@intel.com>;
> > > > Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > Subject: Re: [PATCH v4 06/15] mei: pxp: support matching with a gfx
> > > > discrete card
> > > >
> > > > On Thu, Sep 08, 2022 at 05:16:03PM -0700, Daniele Ceraolo Spurio wrote:
> > > > > From: Tomas Winkler <tomas.winkler@intel.com>
> > > > >
> > > > > With on-boards graphics card, both i915 and MEI are in the same
> > > > > device hierarchy with the same parent, while for discrete gfx card
> > > > > the MEI is its child device.
> > > > > Adjust the match function for that scenario by matching MEI parent
> > > > > device with i915.
> > > > >
> > > > > V2:
> > > > >  1. More detailed commit message
> > > > >  2. Check for dev is not null before it is accessed.
> > > > >
> > > > > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > > > > Signed-off-by: Daniele Ceraolo Spurio
> > > > > <daniele.ceraolospurio@intel.com>
> > > > > Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > > ---
> > > > >  drivers/misc/mei/pxp/mei_pxp.c | 13 ++++++++++---
> > > > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/misc/mei/pxp/mei_pxp.c
> > > > > b/drivers/misc/mei/pxp/mei_pxp.c index 17c5d201603f..afc047627800
> > > > > 100644
> > > > > --- a/drivers/misc/mei/pxp/mei_pxp.c
> > > > > +++ b/drivers/misc/mei/pxp/mei_pxp.c
> > > > > @@ -159,17 +159,24 @@ static int mei_pxp_component_match(struct
> > > > device
> > > > > *dev, int subcomponent,  {
> > > > >  	struct device *base = data;
> > > > >
> > > > > +	if (!dev)
> > > > > +		return 0;
> > > >
> > > > How can that happen?
> > > >
> > > > > +
> > > > >  	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
> > > >
> > > > That's crazy to assume, but whatever :(
> > > Explained here:
> > > https://lore.kernel.org/all/20220418175932.1809770-2-
> > wonchung@google.c
> > > om/
> > 
> > Still crazy :(
> > 
> > >
> > > >
> > > > >  	    subcomponent != I915_COMPONENT_PXP)
> > > > >  		return 0;
> > > > >
> > > > >  	base = base->parent;
> > > > > -	if (!base)
> > > > > +	if (!base) /* mei device */
> > > >
> > > > Why does this mean that?
> > > >
> > > > Where is that documented?
> > > >
> > > > >  		return 0;
> > > > >
> > > > > -	base = base->parent;
> > > > > -	dev = dev->parent;
> > > > > +	base = base->parent; /* pci device */
> > > >
> > > > Again, why is this the case?
> > > >
> > > > > +	/* for dgfx */
> > > > > +	if (base && dev == base)
> > > > > +		return 1;
> > > > >
> > > > > +	/* for pch */
> > > > > +	dev = dev->parent;
> > > >
> > > > You are digging through a random device tree and assuming that you
> > "know"
> > > > what the topology is going to be, that feels very very fragile and
> > > > ripe for problems going forward.
> > >
> > > I don't think it is random.
> > 
> > Today it is one specific way, but how do you know this always will be this
> > way?
> > 
> > > > How do you ensure that this really is they way the tree is for ALL
> > systems?
> > >
> > > Yes we take the topology assumption in PCI hierarchy.
> > > There is a case where both GFX and MEI are in PCH and you cannot stick
> > additional PCI extender or anything else there.
> > > And case where MEI is child on a standalone graphics card this is set
> > > in software so topology is not going to change unless we rewrite
> > everything.  Be happy to hear your insights.
> > 
> > This is ripe to break in the future if someone makes a differently structured
> > device as there is nothing forcing the current layout to always be this way by
> > hardware designers.
> > 
> > The goal of the driver model is to NOT have these types of hard-coded
> > topology assumptions because, supprise, assumptions like this have always
> > come back to bite people in the end.
> > 
> > This is your driver, so that's fine, but really this feels very very wrong and you
> > will have a hard time guaranteeing that this will always be this way for the
> > next 20+ years of hardware designs.  So why not do it properly from the
> > beginning and pass in the correct pointers to different places?
> > 
> > There is a very good reason that the driver model/core does not make it easy
> > to determine what type of device a 'struct device *' is, because you shouldn't
> > have to rely on that type of thing ever.  You are taking it one step further and
> > just assuming that you know what the type is here, with no real way to
> > ensure that this is the case.
> > 
> > In short, this feels like a very bad design as it is very fragile.
> 
> I believe I understand your concern but I would need to invent another 
> addressing scheme to associate hw components that are already 
> addressable by let say PCI hierarchy.  We've changed two subsystems for this work
> components and aux bus already.  So let's have some fun in the future.

Why are you trying to reach across subsystems in the first place?  Why
is that needed at all and why doesn't MEI just provide a generic way to
do this for any bus type, it shouldn't require any specific topology
from what I can determine.

What am I missing here?

thanks,

greg k-h
