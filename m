Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3D164D88
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573DF6E84C;
	Wed, 19 Feb 2020 18:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911EE6E84C;
 Wed, 19 Feb 2020 18:19:35 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C932724656;
 Wed, 19 Feb 2020 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582136375;
 bh=6agED8rKeCuF9TXKp9r9dKjwj/0bduzxeRiUoIs5Y8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WdnGH9plUdxsj8yJHmZyC9j11xkmMS2WkTPEv5lEaDopKw/vhq/JjBpgIiRTa4lbB
 P0Z4MW2A6ijaotV2Q9BJMwaDCx8a49uWE/ViRKurkmWK2GCCt/t35CzE06vDOph8Ev
 KKldR63Ub2mK6XFOeuVk2JPcaLYHwTgwNCjSnoFY=
Date: Wed, 19 Feb 2020 19:19:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 03/52] drm: add managed resources tied to drm_device
Message-ID: <20200219181932.GA2852663@kroah.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
 <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
 <20200219170046.GA2846129@kroah.com>
 <20200219173652.GF5070@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219173652.GF5070@pendragon.ideasonboard.com>
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

On Wed, Feb 19, 2020 at 07:36:52PM +0200, Laurent Pinchart wrote:
> Hi Greg,
> 
> On Wed, Feb 19, 2020 at 06:00:46PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Feb 19, 2020 at 03:22:49PM +0100, Daniel Vetter wrote:
> > > On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman wrote:
> > > > On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> > > > > On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > > > > > We have lots of these. And the cleanup code tends to be of dubious
> > > > > > quality. The biggest wrong pattern is that developers use devm_, which
> > > > > > ties the release action to the underlying struct device, whereas
> > > > > > all the userspace visible stuff attached to a drm_device can long
> > > > > > outlive that one (e.g. after a hotunplug while userspace has open
> > > > > > files and mmap'ed buffers). Give people what they want, but with more
> > > > > > correctness.
> > > > > >
> > > > > > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > > > > > a few simplifications - I didn't (yet) copy over everything. Since
> > > > > > the types don't match code sharing looked like a hopeless endeavour.
> > > > > >
> > > > > > For now it's only super simplified, no groups, you can't remove
> > > > > > actions (but kfree exists, we'll need that soon). Plus all specific to
> > > > > > drm_device ofc, including the logging. Which I didn't bother to make
> > > > > > compile-time optional, since none of the other drm logging is compile
> > > > > > time optional either.
> > > > > >
> > > > > > One tricky bit here is the chicken&egg between allocating your
> > > > > > drm_device structure and initiliazing it with drm_dev_init. For
> > > > > > perfect onion unwinding we'd need to have the action to kfree the
> > > > > > allocation registered before drm_dev_init registers any of its own
> > > > > > release handlers. But drm_dev_init doesn't know where exactly the
> > > > > > drm_device is emebedded into the overall structure, and by the time it
> > > > > > returns it'll all be too late. And forcing drivers to be able clean up
> > > > > > everything except the one kzalloc is silly.
> > > > > >
> > > > > > Work around this by having a very special final_kfree pointer. This
> > > > > > also avoids troubles with the list head possibly disappearing from
> > > > > > underneath us when we release all resources attached to the
> > > > > > drm_device.
> > > > >
> > > > > This is all a very good idea ! Many subsystems are plagged by drivers
> > > > > using devm_k*alloc to allocate data accessible by userspace. Since the
> > > > > introduction of devm_*, we've likely reduced the number of memory leaks,
> > > > > but I'm pretty sure we've increased the risk of crashes as I've seen
> > > > > some drivers that used .release() callbacks correctly being naively
> > > > > converted to incorrect devm_* usage :-(
> > > > >
> > > > > This leads me to a question: if other subsystems have the same problem,
> > > > > could we turn this implementation into something more generic ? It
> > > > > doesn't have to be done right away and shouldn't block merging this
> > > > > series, but I think it would be very useful.
> > > >
> > > > It shouldn't be that hard to tie this into a drv_m() type of a thing
> > > > (driver_memory?)
> > > >
> > > > And yes, I think it's much better than devm_* for the obvious reasons of
> > > > this being needed here.
> > > 
> > > There's two reasons I went with copypasta instead of trying to share code:
> > > - Type checking, I definitely don't want people to mix up devm_ with
> > > drmm_. But even if we do a drv_m that subsystems could embed we do
> > > have quite a few different types of component drivers (and with
> > > drm_panel and drm_bridge even standardized), and I don't want people
> > > to be able to pass the wrong kind of struct to e.g. a managed
> > > drmm_connector_init - it really needs to be the drm_device, not a
> > > panel or bridge or something else.
> > 
> > Fair enough, that makes sense.
> > 
> > > - We could still share the code as a kind of implementation/backend
> > > library. But it's not much, and with embedding I could use the drm
> > > device logging stuff which is kinda nice. But if there's more demand
> > > for this I can definitely see the point in sharing this, as Laurent
> > > pointed out with the tiny optimization with not allocating a NULL void
> > > * that I've done (and screwed up) it's not entirely trivial code.
> > 
> > I think moving over time to having this be a backend library is good.
> > But no rush/issues here with this going in now, it solves a real need
> > and we can refactor it later on to try to make it more "bus/class"
> > generic as needed.
> 
> >From a type checking point of view, it would then be nice to have a
> structure that models a device node, other than just struct device that
> is shared by all types of devices. As someone who was involve in the
> creation of the device model we have today, and thus know the history,
> what's your opinion on that ?

My opinion is that 'struct device' was created just for that exact
thing.  If "all you want" is a device node, it is trivial to use:
	device_create();
or device_create_varargs() or device_create_with_groups()
and then use device_destroy() when you are done with it.

yes, it can do much more complex things, as needed, but the basics are
there, so use it in a simple way if you want to, no objection from me.

If there are things that are missing with it, please let me know.

But creating a new structure/way for this, no, we do not want to go back
to the 2.4 and older kernel methods where it was all totally disjointed
and messy.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
