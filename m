Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C61646DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379A86EBFF;
	Wed, 19 Feb 2020 14:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5B6E811
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:23:08 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id z2so23937848oih.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxtJGn0Nu6JJhuJ0MsxPguyQ2/5Yt1O+Eb1Q6WjaaAQ=;
 b=U3FzweZHQhhgSFZgG9UiqxGl9SIloqTm4cJfPzaTMytSN0YPDY7gceTGWhMmKQuGWF
 sJ4VzAM9dCe1hDtl1V5uo66t3lWcxvgdDcbOfa8YfePo6KfPR1ge+PXfmWJxgnPmeDO/
 YWiZR4TUuZsFpFDaSiqpJfGingwGfYTVJm7HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxtJGn0Nu6JJhuJ0MsxPguyQ2/5Yt1O+Eb1Q6WjaaAQ=;
 b=MRA5Nx5AnR2YmKKlIXLynqpu2hiuXJTsdljDyI593GRi9+nmuISQ5phsqNYC/COyqi
 BQjKusDcY1OpXdmdY3Fs0TGzZcqN0ZoSZZr5HEY4V1PMTZ5rjdCJYp6V9q9w+od7jloC
 I5aNpG1CzlinBJX47cyZkNy33Qx1TocCuUebaVIyg7JTpMmQIGdpJ8vW3mMW6LHq9QKH
 KrnVZsdo1P9wzyEQnLemX5cxeaRVZfTb74YvkUamcIsuooXTEZMYo90X8C/oh5vA/9ai
 1gxEMWz05DIuzOj0EWwefTwnU5yePkgk90gDIZDGVJG779xJP6fg534iBkh5hNlutWpe
 k71g==
X-Gm-Message-State: APjAAAUA07Ph4hqxNtsM6hawAUksXhueTdGo1qFXs8qW/7PPxvWd4/GQ
 z+ci3n38RcBujg13IwUilA/Ya5qAJai/phPOrzGM2A==
X-Google-Smtp-Source: APXvYqwbStNrRRpI0KeOEGGrJoODuvIkGq9mmmiNPVmKg6TNb5pqcIlOxVpcQoY/8Ly18kcdLiQ+CXQmlc2Bey5lvKQ=
X-Received: by 2002:aca:2407:: with SMTP id n7mr4800632oic.14.1582122187270;
 Wed, 19 Feb 2020 06:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
 <20200219133302.GA2837131@kroah.com>
In-Reply-To: <20200219133302.GA2837131@kroah.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 15:22:49 +0100
Message-ID: <CAKMK7uHHMmqZ6FrK3r6J3SXV8FmsJ=+QfeNHRtodZboV5CwQyw@mail.gmail.com>
Subject: Re: [PATCH 03/52] drm: add managed resources tied to drm_device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 2:33 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 19, 2020 at 03:28:47PM +0200, Laurent Pinchart wrote:
> > Hi Daniel,
> >
> > Thank you for the patch.
> >
> > On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > > We have lots of these. And the cleanup code tends to be of dubious
> > > quality. The biggest wrong pattern is that developers use devm_, which
> > > ties the release action to the underlying struct device, whereas
> > > all the userspace visible stuff attached to a drm_device can long
> > > outlive that one (e.g. after a hotunplug while userspace has open
> > > files and mmap'ed buffers). Give people what they want, but with more
> > > correctness.
> > >
> > > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > > a few simplifications - I didn't (yet) copy over everything. Since
> > > the types don't match code sharing looked like a hopeless endeavour.
> > >
> > > For now it's only super simplified, no groups, you can't remove
> > > actions (but kfree exists, we'll need that soon). Plus all specific to
> > > drm_device ofc, including the logging. Which I didn't bother to make
> > > compile-time optional, since none of the other drm logging is compile
> > > time optional either.
> > >
> > > One tricky bit here is the chicken&egg between allocating your
> > > drm_device structure and initiliazing it with drm_dev_init. For
> > > perfect onion unwinding we'd need to have the action to kfree the
> > > allocation registered before drm_dev_init registers any of its own
> > > release handlers. But drm_dev_init doesn't know where exactly the
> > > drm_device is emebedded into the overall structure, and by the time it
> > > returns it'll all be too late. And forcing drivers to be able clean up
> > > everything except the one kzalloc is silly.
> > >
> > > Work around this by having a very special final_kfree pointer. This
> > > also avoids troubles with the list head possibly disappearing from
> > > underneath us when we release all resources attached to the
> > > drm_device.
> >
> > This is all a very good idea ! Many subsystems are plagged by drivers
> > using devm_k*alloc to allocate data accessible by userspace. Since the
> > introduction of devm_*, we've likely reduced the number of memory leaks,
> > but I'm pretty sure we've increased the risk of crashes as I've seen
> > some drivers that used .release() callbacks correctly being naively
> > converted to incorrect devm_* usage :-(
> >
> > This leads me to a question: if other subsystems have the same problem,
> > could we turn this implementation into something more generic ? It
> > doesn't have to be done right away and shouldn't block merging this
> > series, but I think it would be very useful.
>
> It shouldn't be that hard to tie this into a drv_m() type of a thing
> (driver_memory?)
>
> And yes, I think it's much better than devm_* for the obvious reasons of
> this being needed here.

There's two reasons I went with copypasta instead of trying to share code:
- Type checking, I definitely don't want people to mix up devm_ with
drmm_. But even if we do a drv_m that subsystems could embed we do
have quite a few different types of component drivers (and with
drm_panel and drm_bridge even standardized), and I don't want people
to be able to pass the wrong kind of struct to e.g. a managed
drmm_connector_init - it really needs to be the drm_device, not a
panel or bridge or something else.

- We could still share the code as a kind of implementation/backend
library. But it's not much, and with embedding I could use the drm
device logging stuff which is kinda nice. But if there's more demand
for this I can definitely see the point in sharing this, as Laurent
pointed out with the tiny optimization with not allocating a NULL void
* that I've done (and screwed up) it's not entirely trivial code.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
