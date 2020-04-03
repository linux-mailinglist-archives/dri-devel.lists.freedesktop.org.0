Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACE19D96D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8971A6EC03;
	Fri,  3 Apr 2020 14:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FDE6EBFD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:47:17 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l22so6241981oii.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q494EeIqu794MuQ3IIt/myofSWXEMItS949n7jGyw/0=;
 b=WJ3QNPl0ZdMv5shmCIBImV3rhoBDUFynePlbMsKagaJdM3iFYsLkVCRTRkRwSxJBeS
 iWkr1YRCA/5k+DmEuzRCauuLu+2UMxBWKe8Gz8LjO+Qq9Zum40KV+IoKvR9Jxx6S/JLK
 GzLRba1l2IafBnF3G/yk95UtsZYGHtBt6vD+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q494EeIqu794MuQ3IIt/myofSWXEMItS949n7jGyw/0=;
 b=kv5osnOd+GXizN5yBr/rHIDRzelVU2v/cn+IS6n0cFySLWJkIQzfkR9jc51bZQJ32U
 Cpz1owBiQunFSNdU+s4EGUFu5ux7v93mhhE0qumw3JUWsGYZURECd9sJOHqRd19ZeRKc
 1NBMf2zHyS6pB0GPVp7tXrhRPbFqtTnG7mmVeHtX66IsX6o/+E2LPrFgdB2TO8DPuY2N
 0NTkeGiOXU65CiPALKOWg+OEvmNf38RbwuNwgL4cpRPG/C11EsHlgJN8LbBQdeJl8XWx
 qZgT9TBYbIwaC/4O0BDjHYhmPOr0cgsUE2lhxM0JKqyHm+W//43hDKAm5ygUWx9M6yyR
 MyyA==
X-Gm-Message-State: AGi0PuagkeHqKuPeTdroQdCZq4ntu6ZfSLtKeCF1xVYw70TChsiC28/a
 lWdASAgynFI1uihr5o5X/Yz9vSIPsJJarBRkKCksOw==
X-Google-Smtp-Source: APiQypIV3l7JhRoBsme7mjfH/hr2XzxnNQ4CbrulcFzdNFHM5a9dHEEjgKldE+JHHebZlBm41L85hhJbWnUvgedf1lQ=
X-Received: by 2002:aca:c45:: with SMTP id i5mr3018742oiy.101.1585925236102;
 Fri, 03 Apr 2020 07:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
 <20200403141712.GA4088318@kroah.com>
In-Reply-To: <20200403141712.GA4088318@kroah.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 3 Apr 2020 16:47:04 +0200
Message-ID: <CAKMK7uHuzsrMsB=Pnd4MD3VQyRizvjb7Y-RwAdCPF2ZNrfbhvQ@mail.gmail.com>
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

On Fri, Apr 3, 2020 at 4:17 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 03, 2020 at 03:57:45PM +0200, Daniel Vetter wrote:
> > In drm we've added nice drm_device (the main gpu driver thing, which
> > also represents the userspace interfaces and has everything else
> > dangling off it) init functions using devres, devm_drm_dev_init and
> > soon devm_drm_dev_alloc (this patch series adds that).
> >
> > A slight trouble is that drm_device itself holds a reference on the
> > struct device it's sitting on top (for sysfs links and dmesg debug and
> > lots of other things), so there's a reference loop. For real drivers
> > this is broken at remove/unplug time, where all devres resources are
> > released device_release_driver(), before the final device reference is
> > dropped. So far so good.
> >
> > There's 2 exceptions:
> > - drm/vkms|vgem: Virtual drivers for which we create a fake/virtual
> >   platform device to make them look more like normal devices to
> >   userspace. These aren't drivers in the driver model sense, we simple
> >   create a platform_device and register it.
>
> That's a horrid abuse of platform devices, just use a "virtual" device
> please, create/remove it when you need it, and all should be fine.
>
> > - drm/i915/selftests, where we create minimal mock devices, and again
> >   the selftests aren't proper drivers in the driver model sense.
>
> Again, virtual devices are best to use for this.

Hm yeah, I guess we should fix that. i915 selftests do use raw struct
device though, and it's not really the problem.

> > For these two cases the reference loop isn't broken, because devres is
> > only cleaned up when the last device reference is dropped. But that's
> > not happening, because the drm_device holds that last struct device
> > reference.
> >
> > Thus far this wasn't a problem since the above cases simply
> > hand-rolled their cleanup code. But I want to convert all drivers over
> > to the devm_ versions, hence it would be really nice if these
> > virtual/fake/mock uses-cases could also be managed with devres
> > cleanup.
> >
> > I see three possible approaches:
> >
> > - Clean up devres from device_del (or platform_device_unregister) even
> >   when no driver is bound. This seems like the simplest solution, but
> >   also the one with the widest impact, and what this patch implements.
> >   We might want to include more of the cleanup than just
> >   devres_release_all, but this is all I need to get my use case going.
>
> After device_del, you should never be using that structure again anyway.
> So why is there any "resource leak"?  You can't recycle the structure,
> and you can't assign it to anything else, so eventually you have to do
> a final put on the thing, which will free up the resources.

I guess I should have spent more time explaining this. There's two
references involved:

- drm_device->dev points at the underlying struct device. The
drm_device holds a reference until it's fully cleaned up, so that we
can do nice stuff like use dev_ versions of printk functions, and you
always know that there's not going to be a use-after free.

- now the other dependency is that as long as the device exists (not
just in memory, but in the device model, i.e. between device_add() and
device_del()) the drm_device should exist. So what we do in the
bus-specific remove/disconnect callback is that we call
drm_dev_unregister(). This drops the drm_device refcount that the drm
chardev was holding, to make sure that an open() on the chardev can
actually get at the memory without going boom. Then after the
drm_dev_unregister, again in the remove/disconnect callback of th
driver, there's a drm_dev_put(). Which might or might not be the final
drm_dev_put(), since if there's currently some open fd we keep the
refcount elevated, to avoid oopses and fun stuff like that. And
drm_device pointers get shared very widely, thanks to fun stuff like
dma_buf buffer sharing and dma_fence hw syncpt sharing across
processes and drivers.

Once the final drm_dev_put() is called we also end up calling
put_device() and everything is happy.

So far so good.

Now the problem is that refcount is hard, and most drm drivers get it
wrong in some fashion or another, so I'm trying to solve all this with
more magic.

Since all drivers need to have a drm_dev_put() at the end of their
driver's remove/disconnect callback we've added a devm_drm_dev_init
function which registers a devres action to do that drm_dev_put() at
device_del time (which might or might not be the final drm_dev_put()).
Nothing has changed thus far.

Now this works really well because when you have a real driver model
driver attached, then device_del ends up calling devres_release_all(),
which ends up triggering the multi-stage cleanup of drm_devices. But
if you do _not_ have a real driver attached, then device_del does
nothing wrt devres cleanup. Instead this is delayed until the final
put_device().

Unfortunately that final put_device() will never happen, because
drm_device is still holding a reference to the struct device. And the
final drm_dev_put of that drm_device will never happen, because that
drm_dev_put call is in a devres actions, which wont ever get called.

This is the only case where this reference loop happens and doesn't
get broken. By calling devres_release_all at device_del time,
irrespective of whether a driver is bound or not, we make both cases
work the same. And at both cases the devres cleanup happens device_del
time, and not when the final put_device is called.

Aside: The final put_device has another devres_release_all() call,
which given your explanation sounds very wrong - at that point the
physical device is long gone, and cleaning up devres actions at that
point is way too late. I think a good cleanup patch on top of this
would be to remove that call, and replace it with an assert that no
one managed to sneak in a devres_add_action between device_del and the
final put_device().

> And then all should be fine, right?  But, by putting the freeing here,
> you can still have a "live" device that thinks it has resources availble
> that it can access, but yet they are now gone.  Yeah, it's probably not
> ever going to really happen, but the lifecycles of dynamic devices are
> tough to "prove" at times, and I worry that freeing things this early is
> going to cause odd disconnect issues.

Not exactly sure what you mean here, but trying to fix all the driver
bugs we have in drm is why I'm doing this. We have a massive amount of
gaps still, but we're slowly closing them all off with stuff like
drm_dev_enter/exit, to make sure there's no races possible between
driver hotunplug and concurrent access by userspace.

The additional trouble is that users are really pissed when we crash
their compositor just because they unplugged an usb display dongle or
an usb projector thing. So the failure mode we're aiming for in drm
for hotunplug is to be very graceful to userspace - experience says
that userspace is even less likely to handle this correctly than the
kernel. That's why we're refcounting drm_device and everything hanging
off it, so that it sticks around and we can pretend to userspace that
it's all still there (but disconnected from hw and the driver). Until
userspace has gone around and managed to process the udev events and
closed all open fds.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
