Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D79166030
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 15:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30596EDAB;
	Thu, 20 Feb 2020 14:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958736EDAB;
 Thu, 20 Feb 2020 14:58:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87F68563;
 Thu, 20 Feb 2020 15:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582210727;
 bh=xGUs69qcXxAJFA4v6dRInwmwTzKr/UWIsnbon4+XNgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gq4jrLM4z0gKggwEDZpMioYw1xhkoTeZ8vs91odAIlS0BwUIay9eWUkOZbZiamK3J
 55pv3A2wb+iFomubo5Ixb/xZYqTYgMrtkXEp2knSBCZMGZVg3bkKX7e968aVM+XabL
 8bjlHA5kVoAVOmXmcaLzh/ecP+5CEH4opXbZGJu0=
Date: Thu, 20 Feb 2020 16:58:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 03/52] drm: add managed resources tied to drm_device
Message-ID: <20200220145828.GI4998@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
 <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
 <20200219170046.GA2846129@kroah.com>
 <20200219173652.GF5070@pendragon.ideasonboard.com>
 <20200219181932.GA2852663@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219181932.GA2852663@kroah.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg,

On Wed, Feb 19, 2020 at 07:19:32PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 19, 2020 at 07:36:52PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 19, 2020 at 06:00:46PM +0100, Greg Kroah-Hartman wrote:
> >> On Wed, Feb 19, 2020 at 03:22:49PM +0100, Daniel Vetter wrote:
> >>> On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman wrote:
> >>>> On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> >>>>> On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> >>>>>> We have lots of these. And the cleanup code tends to be of dubious
> >>>>>> quality. The biggest wrong pattern is that developers use devm_, which
> >>>>>> ties the release action to the underlying struct device, whereas
> >>>>>> all the userspace visible stuff attached to a drm_device can long
> >>>>>> outlive that one (e.g. after a hotunplug while userspace has open
> >>>>>> files and mmap'ed buffers). Give people what they want, but with more
> >>>>>> correctness.
> >>>>>>
> >>>>>> Mostly copied from devres.c, with types adjusted to fit drm_device and
> >>>>>> a few simplifications - I didn't (yet) copy over everything. Since
> >>>>>> the types don't match code sharing looked like a hopeless endeavour.
> >>>>>>
> >>>>>> For now it's only super simplified, no groups, you can't remove
> >>>>>> actions (but kfree exists, we'll need that soon). Plus all specific to
> >>>>>> drm_device ofc, including the logging. Which I didn't bother to make
> >>>>>> compile-time optional, since none of the other drm logging is compile
> >>>>>> time optional either.
> >>>>>>
> >>>>>> One tricky bit here is the chicken&egg between allocating your
> >>>>>> drm_device structure and initiliazing it with drm_dev_init. For
> >>>>>> perfect onion unwinding we'd need to have the action to kfree the
> >>>>>> allocation registered before drm_dev_init registers any of its own
> >>>>>> release handlers. But drm_dev_init doesn't know where exactly the
> >>>>>> drm_device is emebedded into the overall structure, and by the time it
> >>>>>> returns it'll all be too late. And forcing drivers to be able clean up
> >>>>>> everything except the one kzalloc is silly.
> >>>>>>
> >>>>>> Work around this by having a very special final_kfree pointer. This
> >>>>>> also avoids troubles with the list head possibly disappearing from
> >>>>>> underneath us when we release all resources attached to the
> >>>>>> drm_device.
> >>>>>
> >>>>> This is all a very good idea ! Many subsystems are plagged by drivers
> >>>>> using devm_k*alloc to allocate data accessible by userspace. Since the
> >>>>> introduction of devm_*, we've likely reduced the number of memory leaks,
> >>>>> but I'm pretty sure we've increased the risk of crashes as I've seen
> >>>>> some drivers that used .release() callbacks correctly being naively
> >>>>> converted to incorrect devm_* usage :-(
> >>>>>
> >>>>> This leads me to a question: if other subsystems have the same problem,
> >>>>> could we turn this implementation into something more generic ? It
> >>>>> doesn't have to be done right away and shouldn't block merging this
> >>>>> series, but I think it would be very useful.
> >>>>
> >>>> It shouldn't be that hard to tie this into a drv_m() type of a thing
> >>>> (driver_memory?)
> >>>>
> >>>> And yes, I think it's much better than devm_* for the obvious reasons of
> >>>> this being needed here.
> >>> 
> >>> There's two reasons I went with copypasta instead of trying to share code:
> >>> - Type checking, I definitely don't want people to mix up devm_ with
> >>> drmm_. But even if we do a drv_m that subsystems could embed we do
> >>> have quite a few different types of component drivers (and with
> >>> drm_panel and drm_bridge even standardized), and I don't want people
> >>> to be able to pass the wrong kind of struct to e.g. a managed
> >>> drmm_connector_init - it really needs to be the drm_device, not a
> >>> panel or bridge or something else.
> >> 
> >> Fair enough, that makes sense.
> >> 
> >>> - We could still share the code as a kind of implementation/backend
> >>> library. But it's not much, and with embedding I could use the drm
> >>> device logging stuff which is kinda nice. But if there's more demand
> >>> for this I can definitely see the point in sharing this, as Laurent
> >>> pointed out with the tiny optimization with not allocating a NULL void
> >>> * that I've done (and screwed up) it's not entirely trivial code.
> >> 
> >> I think moving over time to having this be a backend library is good.
> >> But no rush/issues here with this going in now, it solves a real need
> >> and we can refactor it later on to try to make it more "bus/class"
> >> generic as needed.
> > 
> > >From a type checking point of view, it would then be nice to have a
> > structure that models a device node, other than just struct device that
> > is shared by all types of devices. As someone who was involve in the
> > creation of the device model we have today, and thus know the history,
> > what's your opinion on that ?
> 
> My opinion is that 'struct device' was created just for that exact
> thing.  If "all you want" is a device node, it is trivial to use:
> 	device_create();
> or device_create_varargs() or device_create_with_groups()
> and then use device_destroy() when you are done with it.
> 
> yes, it can do much more complex things, as needed, but the basics are
> there, so use it in a simple way if you want to, no objection from me.
> 
> If there are things that are missing with it, please let me know.

I don't think it's really about anything missing, but about having two
different APIs for driver developers, to associate resources with either
physical devices that can disappear from the system, or with interfaces
exposed to userspace (or other parts of the kernel). The lifetime
constraints are very different, and if both cases are handled with the
devres API and a struct device, it's very easy for driver authors to
pass the wrong struct device to the API, tying the lifetime of a
userspace-facing resource with the physical device (this is what devres
is mostly used for today :-(). Having two different objects would make
it more apparent which API should be used, and would make it easier to
catch incorrect usage during review. I think this is Daniel's main
point, and the reason that prompted him to create a new API instead of
just reusing devres with the struct device that models the userspace
interface.

(On a side node, I wonder if devres shouldn't have been implemented at
the kref level.)

> But creating a new structure/way for this, no, we do not want to go back
> to the 2.4 and older kernel methods where it was all totally disjointed
> and messy.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
