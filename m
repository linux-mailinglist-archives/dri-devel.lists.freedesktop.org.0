Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42DB164595
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 14:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A096E7E5;
	Wed, 19 Feb 2020 13:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D836E0CE;
 Wed, 19 Feb 2020 13:33:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7372B24654;
 Wed, 19 Feb 2020 13:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582119184;
 bh=xP+KutYLBJUVnM62JIkbhO5G2sIOfIiEp/27V2QTOJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVxuI43h4yZR0oucg4mTrJYD/FQtm/wQZK7tNzUO63eRDXH5XC2FzIVn9I9L0gXMX
 SZqkGqzXPgOGliNcHP81yvoi3XZ0EUxSyWMtlQwUsSvNxasXovqTzbRJzd9POQuY1h
 PvSdfoUUuYRw/8oTULvgMUDNPCdCTTldwf9S0fR4=
Date: Wed, 19 Feb 2020 14:33:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 03/52] drm: add managed resources tied to drm_device
Message-ID: <20200219133302.GA2837131@kroah.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219132847.GD5070@pendragon.ideasonboard.com>
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

On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > We have lots of these. And the cleanup code tends to be of dubious
> > quality. The biggest wrong pattern is that developers use devm_, which
> > ties the release action to the underlying struct device, whereas
> > all the userspace visible stuff attached to a drm_device can long
> > outlive that one (e.g. after a hotunplug while userspace has open
> > files and mmap'ed buffers). Give people what they want, but with more
> > correctness.
> > 
> > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > a few simplifications - I didn't (yet) copy over everything. Since
> > the types don't match code sharing looked like a hopeless endeavour.
> > 
> > For now it's only super simplified, no groups, you can't remove
> > actions (but kfree exists, we'll need that soon). Plus all specific to
> > drm_device ofc, including the logging. Which I didn't bother to make
> > compile-time optional, since none of the other drm logging is compile
> > time optional either.
> > 
> > One tricky bit here is the chicken&egg between allocating your
> > drm_device structure and initiliazing it with drm_dev_init. For
> > perfect onion unwinding we'd need to have the action to kfree the
> > allocation registered before drm_dev_init registers any of its own
> > release handlers. But drm_dev_init doesn't know where exactly the
> > drm_device is emebedded into the overall structure, and by the time it
> > returns it'll all be too late. And forcing drivers to be able clean up
> > everything except the one kzalloc is silly.
> > 
> > Work around this by having a very special final_kfree pointer. This
> > also avoids troubles with the list head possibly disappearing from
> > underneath us when we release all resources attached to the
> > drm_device.
> 
> This is all a very good idea ! Many subsystems are plagged by drivers
> using devm_k*alloc to allocate data accessible by userspace. Since the
> introduction of devm_*, we've likely reduced the number of memory leaks,
> but I'm pretty sure we've increased the risk of crashes as I've seen
> some drivers that used .release() callbacks correctly being naively
> converted to incorrect devm_* usage :-(
> 
> This leads me to a question: if other subsystems have the same problem,
> could we turn this implementation into something more generic ? It
> doesn't have to be done right away and shouldn't block merging this
> series, but I think it would be very useful.

It shouldn't be that hard to tie this into a drv_m() type of a thing
(driver_memory?)

And yes, I think it's much better than devm_* for the obvious reasons of
this being needed here.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
