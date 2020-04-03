Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B9419D97C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CC76EBFD;
	Fri,  3 Apr 2020 14:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD876E148
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:51:45 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k9so6288817oia.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwx7MNcyzp0xP4NB6zT9uUvwulA8eZTTieWIOBiDo3o=;
 b=LLOtZU8ekueaMXcAPQJmkV4oM0ZTbScpe4nivot8U5832byLgZkl0OjDg+GBGWSZ32
 jsP2QGE+E8E1XCCJtQiv/+Glr8ofopp1o19RnaVEl4Sn800urFMIMaXglC2r6dxl+hxx
 oWB4HT7yTxtBNKBSx/CXFbq5CDyZrnQ1FLi7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwx7MNcyzp0xP4NB6zT9uUvwulA8eZTTieWIOBiDo3o=;
 b=G0ekEEHg08WGp1VWXrZH48LYwE/UhqtHEcWY2cg3Hh0vMNexmOJSQe089/XugZn8CF
 4vd9QtRKozWESA6L9g9DG8HY3QsRSbteqUoTW91J+rfK2kUc8Nh3/Un7LuigjhykdFPh
 ety77IxeLGulQrvkgN6rLSK23tlZ36Sh8bvx2a7FKOAm0gnDRCsj2N8i3ZYl6tY3mrHR
 laxJmrZnVHWgsHYeJF8xZExfnpwRKXxI37wDCn5tUiuqBu3PDnysPBV1xcRKiFj6hbjF
 vzmmHqXeEiMpruZw5vrwWKwdr7Y0Gm/RsrFwMDC9N+2x0a5SlkgzLoMqt/Gl4Udb9akY
 ZR6w==
X-Gm-Message-State: AGi0Pua79vmw3qt4ZouFob7mlBPss5BWJiD+eCqkqBrWSuDd3HX6KfT2
 cRKW3ytZxwYJTrlnXHJSaHaqyXCxs67jEhwl1WUdxQ==
X-Google-Smtp-Source: APiQypLZ08zWoTZ5euRNS2a5CwAvxUzolT6YNmO5enMv+njDM4/IXchRLI2ywBTCU4W+e0ibqiu+yMXcY2rLaP3KMU0=
X-Received: by 2002:aca:c45:: with SMTP id i5mr3033239oiy.101.1585925504195;
 Fri, 03 Apr 2020 07:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
 <20200403141712.GA4088318@kroah.com>
 <CAKMK7uHuzsrMsB=Pnd4MD3VQyRizvjb7Y-RwAdCPF2ZNrfbhvQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHuzsrMsB=Pnd4MD3VQyRizvjb7Y-RwAdCPF2ZNrfbhvQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 3 Apr 2020 16:51:33 +0200
Message-ID: <CAKMK7uEf5ZMX0O4F7mMzfOXeHN=o=USc7E_kBYSA4dYk1oiyDg@mail.gmail.com>
Subject: Re: [PATCH 01/44] drivers/base: Always release devres on device_del
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 4:47 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Apr 3, 2020 at 4:17 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Apr 03, 2020 at 03:57:45PM +0200, Daniel Vetter wrote:
> > > In drm we've added nice drm_device (the main gpu driver thing, which
> > > also represents the userspace interfaces and has everything else
> > > dangling off it) init functions using devres, devm_drm_dev_init and
> > > soon devm_drm_dev_alloc (this patch series adds that).
> > >
> > > A slight trouble is that drm_device itself holds a reference on the
> > > struct device it's sitting on top (for sysfs links and dmesg debug and
> > > lots of other things), so there's a reference loop. For real drivers
> > > this is broken at remove/unplug time, where all devres resources are
> > > released device_release_driver(), before the final device reference is
> > > dropped. So far so good.
> > >
> > > There's 2 exceptions:
> > > - drm/vkms|vgem: Virtual drivers for which we create a fake/virtual
> > >   platform device to make them look more like normal devices to
> > >   userspace. These aren't drivers in the driver model sense, we simple
> > >   create a platform_device and register it.
> >
> > That's a horrid abuse of platform devices, just use a "virtual" device
> > please, create/remove it when you need it, and all should be fine.
> >
> > > - drm/i915/selftests, where we create minimal mock devices, and again
> > >   the selftests aren't proper drivers in the driver model sense.
> >
> > Again, virtual devices are best to use for this.
>
> Hm yeah, I guess we should fix that. i915 selftests do use raw struct
> device though, and it's not really the problem.
>
> > > For these two cases the reference loop isn't broken, because devres is
> > > only cleaned up when the last device reference is dropped. But that's
> > > not happening, because the drm_device holds that last struct device
> > > reference.
> > >
> > > Thus far this wasn't a problem since the above cases simply
> > > hand-rolled their cleanup code. But I want to convert all drivers over
> > > to the devm_ versions, hence it would be really nice if these
> > > virtual/fake/mock uses-cases could also be managed with devres
> > > cleanup.
> > >
> > > I see three possible approaches:
> > >
> > > - Clean up devres from device_del (or platform_device_unregister) even
> > >   when no driver is bound. This seems like the simplest solution, but
> > >   also the one with the widest impact, and what this patch implements.
> > >   We might want to include more of the cleanup than just
> > >   devres_release_all, but this is all I need to get my use case going.
> >
> > After device_del, you should never be using that structure again anyway.
> > So why is there any "resource leak"?  You can't recycle the structure,
> > and you can't assign it to anything else, so eventually you have to do
> > a final put on the thing, which will free up the resources.
>
> I guess I should have spent more time explaining this. There's two
> references involved:
>
> - drm_device->dev points at the underlying struct device. The
> drm_device holds a reference until it's fully cleaned up, so that we
> can do nice stuff like use dev_ versions of printk functions, and you
> always know that there's not going to be a use-after free.
>
> - now the other dependency is that as long as the device exists (not
> just in memory, but in the device model, i.e. between device_add() and
> device_del()) the drm_device should exist. So what we do in the
> bus-specific remove/disconnect callback is that we call
> drm_dev_unregister(). This drops the drm_device refcount that the drm
> chardev was holding, to make sure that an open() on the chardev can
> actually get at the memory without going boom. Then after the
> drm_dev_unregister, again in the remove/disconnect callback of th
> driver, there's a drm_dev_put(). Which might or might not be the final
> drm_dev_put(), since if there's currently some open fd we keep the
> refcount elevated, to avoid oopses and fun stuff like that. And
> drm_device pointers get shared very widely, thanks to fun stuff like
> dma_buf buffer sharing and dma_fence hw syncpt sharing across
> processes and drivers.
>
> Once the final drm_dev_put() is called we also end up calling
> put_device() and everything is happy.
>
> So far so good.
>
> Now the problem is that refcount is hard, and most drm drivers get it
> wrong in some fashion or another, so I'm trying to solve all this with
> more magic.
>
> Since all drivers need to have a drm_dev_put() at the end of their
> driver's remove/disconnect callback we've added a devm_drm_dev_init
> function which registers a devres action to do that drm_dev_put() at
> device_del time (which might or might not be the final drm_dev_put()).
> Nothing has changed thus far.
>
> Now this works really well because when you have a real driver model
> driver attached, then device_del ends up calling devres_release_all(),
> which ends up triggering the multi-stage cleanup of drm_devices. But
> if you do _not_ have a real driver attached, then device_del does
> nothing wrt devres cleanup. Instead this is delayed until the final
> put_device().
>
> Unfortunately that final put_device() will never happen, because
> drm_device is still holding a reference to the struct device. And the
> final drm_dev_put of that drm_device will never happen, because that
> drm_dev_put call is in a devres actions, which wont ever get called.
>
> This is the only case where this reference loop happens and doesn't
> get broken. By calling devres_release_all at device_del time,
> irrespective of whether a driver is bound or not, we make both cases
> work the same. And at both cases the devres cleanup happens device_del
> time, and not when the final put_device is called.
>
> Aside: The final put_device has another devres_release_all() call,
> which given your explanation sounds very wrong - at that point the
> physical device is long gone, and cleaning up devres actions at that
> point is way too late. I think a good cleanup patch on top of this
> would be to remove that call, and replace it with an assert that no
> one managed to sneak in a devres_add_action between device_del and the
> final put_device().

I've done a bit more digging, and found this commit:

commit a525a3ddeaca69f405d98442ab3c0746e53168dc
Author: Ming Lei <tom.leiming@gmail.com>
Date:   Wed Jul 25 01:42:29 2012 +0800

    driver core: free devres in device_release

Before this devres_release_all was called at device_del() time,
unconditionally whether a driver was bound or not. Which seems to have
been the intention at least back then. So in a way my patch simply
restores that behaviour for the case where no driver has been bound to
a device structure, but we still have devres resources hanging off it.
-Daniel

>
> > And then all should be fine, right?  But, by putting the freeing here,
> > you can still have a "live" device that thinks it has resources availble
> > that it can access, but yet they are now gone.  Yeah, it's probably not
> > ever going to really happen, but the lifecycles of dynamic devices are
> > tough to "prove" at times, and I worry that freeing things this early is
> > going to cause odd disconnect issues.
>
> Not exactly sure what you mean here, but trying to fix all the driver
> bugs we have in drm is why I'm doing this. We have a massive amount of
> gaps still, but we're slowly closing them all off with stuff like
> drm_dev_enter/exit, to make sure there's no races possible between
> driver hotunplug and concurrent access by userspace.
>
> The additional trouble is that users are really pissed when we crash
> their compositor just because they unplugged an usb display dongle or
> an usb projector thing. So the failure mode we're aiming for in drm
> for hotunplug is to be very graceful to userspace - experience says
> that userspace is even less likely to handle this correctly than the
> kernel. That's why we're refcounting drm_device and everything hanging
> off it, so that it sticks around and we can pretend to userspace that
> it's all still there (but disconnected from hw and the driver). Until
> userspace has gone around and managed to process the udev events and
> closed all open fds.
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
