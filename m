Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3019DA3A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 17:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427B16EC11;
	Fri,  3 Apr 2020 15:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A626D6EC11
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 15:33:30 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id a49so7612412otc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PcGiTW9gKsN8ij/cgifsoS448yNW50SYC+7bPM7xKwU=;
 b=LhOiTfrQL6ZwUyGpfvouUu3SV931KALKFw1NAJet8SzP300MbRnBSW47nAupZuvPUX
 gSUd/Mw5Z+KJQfI1Khq1GdyXTLd18L+UUHZmuIasF7XrvB5raUWlrxvrVQR8L5+s2nZn
 Yu8aKVbwrj1VCiTrNNgwzg2uFhPJOhCfH1w4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PcGiTW9gKsN8ij/cgifsoS448yNW50SYC+7bPM7xKwU=;
 b=P93pYQk0mg7pat+5bA6/u2gkBx9BWTb0orGcgY++LCkjXswI9k6c1NxE2gOiXWY7sN
 Iq8eLoHVx5sp62kZusfkECPH4D5AUm/iacDowrqQ6cuNWNVzfJR+oFQHeGu7rSu7MLSa
 jfCX30rwnbJi+7q1KGQu24Ti8YsmcvRmdgzY8SqZtSwQ4V2z3bmaZ6i+Y6FpsyskoZpf
 hdCOr6YWeYoRV2Nszu8TlHuP77Q+d/WaZRTFkLJuQBeGIbCVoYuEYnYx9qiUTcgeCxwU
 Y5dMFDRvM4kSNyRcQ/5YzV60wL/PaTLzdRxeu2xwy9huNC0d4e4IjjoGaNLvdV/DHayr
 dH1g==
X-Gm-Message-State: AGi0PuaSC9EToU+Y7LWdb2eTvcly+9jiJbqHIHj1hGmvNNXbByoHkArG
 WURjpyV0t9UWQf005WEpTfY5fj0qQgKwMM3VcGFZTT+E
X-Google-Smtp-Source: APiQypJctmLOS6F/uNyPJ4oJ+l9qhnm+VKGLNKhRjhmzD+kwQiYN/+ury1iNXUtAZL3gcFp8mWkxgAAE8NHGFrAmQ0k=
X-Received: by 2002:a05:6820:221:: with SMTP id
 j1mr7184058oob.12.1585928008780; 
 Fri, 03 Apr 2020 08:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
 <20200403141712.GA4088318@kroah.com>
 <CAKMK7uHuzsrMsB=Pnd4MD3VQyRizvjb7Y-RwAdCPF2ZNrfbhvQ@mail.gmail.com>
 <20200403150651.GB4094993@kroah.com>
 <CAKMK7uHN0i1iEUTh1x5RewHWp4L6TdeqnDmaFDRpf=V=hNHQcw@mail.gmail.com>
In-Reply-To: <CAKMK7uHN0i1iEUTh1x5RewHWp4L6TdeqnDmaFDRpf=V=hNHQcw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 3 Apr 2020 17:33:17 +0200
Message-ID: <CAKMK7uEsgckZYT8R3jLvXpMeN_kP-pzX6G8Lt+pZbDZHsLuR2g@mail.gmail.com>
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

On Fri, Apr 3, 2020 at 5:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Apr 3, 2020 at 5:06 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Apr 03, 2020 at 04:47:04PM +0200, Daniel Vetter wrote:
> > > On Fri, Apr 3, 2020 at 4:17 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Apr 03, 2020 at 03:57:45PM +0200, Daniel Vetter wrote:
> > > > > In drm we've added nice drm_device (the main gpu driver thing, which
> > > > > also represents the userspace interfaces and has everything else
> > > > > dangling off it) init functions using devres, devm_drm_dev_init and
> > > > > soon devm_drm_dev_alloc (this patch series adds that).
> > > > >
> > > > > A slight trouble is that drm_device itself holds a reference on the
> > > > > struct device it's sitting on top (for sysfs links and dmesg debug and
> > > > > lots of other things), so there's a reference loop. For real drivers
> > > > > this is broken at remove/unplug time, where all devres resources are
> > > > > released device_release_driver(), before the final device reference is
> > > > > dropped. So far so good.
> > > > >
> > > > > There's 2 exceptions:
> > > > > - drm/vkms|vgem: Virtual drivers for which we create a fake/virtual
> > > > >   platform device to make them look more like normal devices to
> > > > >   userspace. These aren't drivers in the driver model sense, we simple
> > > > >   create a platform_device and register it.
> > > >
> > > > That's a horrid abuse of platform devices, just use a "virtual" device
> > > > please, create/remove it when you need it, and all should be fine.
> > > >
> > > > > - drm/i915/selftests, where we create minimal mock devices, and again
> > > > >   the selftests aren't proper drivers in the driver model sense.
> > > >
> > > > Again, virtual devices are best to use for this.
> > >
> > > Hm yeah, I guess we should fix that. i915 selftests do use raw struct
> > > device though, and it's not really the problem.
> > >
> > > > > For these two cases the reference loop isn't broken, because devres is
> > > > > only cleaned up when the last device reference is dropped. But that's
> > > > > not happening, because the drm_device holds that last struct device
> > > > > reference.
> > > > >
> > > > > Thus far this wasn't a problem since the above cases simply
> > > > > hand-rolled their cleanup code. But I want to convert all drivers over
> > > > > to the devm_ versions, hence it would be really nice if these
> > > > > virtual/fake/mock uses-cases could also be managed with devres
> > > > > cleanup.
> > > > >
> > > > > I see three possible approaches:
> > > > >
> > > > > - Clean up devres from device_del (or platform_device_unregister) even
> > > > >   when no driver is bound. This seems like the simplest solution, but
> > > > >   also the one with the widest impact, and what this patch implements.
> > > > >   We might want to include more of the cleanup than just
> > > > >   devres_release_all, but this is all I need to get my use case going.
> > > >
> > > > After device_del, you should never be using that structure again anyway.
> > > > So why is there any "resource leak"?  You can't recycle the structure,
> > > > and you can't assign it to anything else, so eventually you have to do
> > > > a final put on the thing, which will free up the resources.
> > >
> > > I guess I should have spent more time explaining this. There's two
> > > references involved:
> > >
> > > - drm_device->dev points at the underlying struct device. The
> > > drm_device holds a reference until it's fully cleaned up, so that we
> > > can do nice stuff like use dev_ versions of printk functions, and you
> > > always know that there's not going to be a use-after free.
> > >
> > > - now the other dependency is that as long as the device exists (not
> > > just in memory, but in the device model, i.e. between device_add() and
> > > device_del()) the drm_device should exist. So what we do in the
> > > bus-specific remove/disconnect callback is that we call
> > > drm_dev_unregister(). This drops the drm_device refcount that the drm
> > > chardev was holding, to make sure that an open() on the chardev can
> > > actually get at the memory without going boom. Then after the
> > > drm_dev_unregister, again in the remove/disconnect callback of th
> > > driver, there's a drm_dev_put(). Which might or might not be the final
> > > drm_dev_put(), since if there's currently some open fd we keep the
> > > refcount elevated, to avoid oopses and fun stuff like that. And
> > > drm_device pointers get shared very widely, thanks to fun stuff like
> > > dma_buf buffer sharing and dma_fence hw syncpt sharing across
> > > processes and drivers.
> > >
> > > Once the final drm_dev_put() is called we also end up calling
> > > put_device() and everything is happy.
> > >
> > > So far so good.
> > >
> > > Now the problem is that refcount is hard, and most drm drivers get it
> > > wrong in some fashion or another, so I'm trying to solve all this with
> > > more magic.
> >
> > Wait, no.  Fix the drivers.  Seriously, don't try to "bust" the
> > reference count logic here.
>
> I guess still not clear. What I'm doing is fixing the drivers. But
> because they all get it wrong, I'm trying to hide as much of the
> refcounting as possible behind functions which do the right thing.
>
> Which works great for the epic pile of real hw drivers that we have.
>
> The problem I have is is _only_ with those drm drivers which run on
> fake hw. For those forcing them to use the exact same functions as the
> real hw drivers has some challenges, because they're not really real
> drivers. Now the original patch had 3 ideas for how to make things
> work for those fake drivers too, with one of them implemented in this
> patch (the one that required the least amount of typing on my part).
>
> You harping that I'm getting the refcounting wrong is kinda totally
> missing the point, because that's what I'm doing.
>
> > > Since all drivers need to have a drm_dev_put() at the end of their
> > > driver's remove/disconnect callback we've added a devm_drm_dev_init
> > > function which registers a devres action to do that drm_dev_put() at
> > > device_del time (which might or might not be the final drm_dev_put()).
> > > Nothing has changed thus far.
> > >
> > > Now this works really well because when you have a real driver model
> > > driver attached, then device_del ends up calling devres_release_all(),
> > > which ends up triggering the multi-stage cleanup of drm_devices. But
> > > if you do _not_ have a real driver attached, then device_del does
> > > nothing wrt devres cleanup. Instead this is delayed until the final
> > > put_device().
> > >
> > > Unfortunately that final put_device() will never happen, because
> > > drm_device is still holding a reference to the struct device. And the
> > > final drm_dev_put of that drm_device will never happen, because that
> > > drm_dev_put call is in a devres actions, which wont ever get called.
> >
> > True, so fix the logic to do the final put_device() :)
> >
> > > This is the only case where this reference loop happens and doesn't
> > > get broken. By calling devres_release_all at device_del time,
> > > irrespective of whether a driver is bound or not, we make both cases
> > > work the same. And at both cases the devres cleanup happens device_del
> > > time, and not when the final put_device is called.
> >
> > So what is so odd about these random drivers that the normal process
> > does not work for them?
>
> They're not drivers in the driver model sense.
>
> > Along these lines, you might look into how the v4l developers finally
> > fixed this as they had much the same type of issues that you do with
> > regards to reference counting and resources and userspace file handles.
>
> We have a pile of v4l developers on dri-devel, they've been reviewing
> the stuff we've been doing in drm over the past 2-3 years already ...
>
> > > Aside: The final put_device has another devres_release_all() call,
> > > which given your explanation sounds very wrong - at that point the
> > > physical device is long gone, and cleaning up devres actions at that
> > > point is way too late. I think a good cleanup patch on top of this
> > > would be to remove that call, and replace it with an assert that no
> > > one managed to sneak in a devres_add_action between device_del and the
> > > final put_device().
> >
> > The physical device might be gone, but an open handle to the device
> > might still be around, keeping the structure in place and the driver
> > thinking it still has access to it's memory structures.
>
> I understand that. This is not the problem I'm having here, we've
> fixed that problem a while ago (at least in drm core, but the drivers
> have a bit a harder time picking up the correct coding patterns,
> mostly because there's overwhelming code in existing drivers that's
> just plain broken).
>
> > > > And then all should be fine, right?  But, by putting the freeing here,
> > > > you can still have a "live" device that thinks it has resources availble
> > > > that it can access, but yet they are now gone.  Yeah, it's probably not
> > > > ever going to really happen, but the lifecycles of dynamic devices are
> > > > tough to "prove" at times, and I worry that freeing things this early is
> > > > going to cause odd disconnect issues.
> > >
> > > Not exactly sure what you mean here, but trying to fix all the driver
> > > bugs we have in drm is why I'm doing this. We have a massive amount of
> > > gaps still, but we're slowly closing them all off with stuff like
> > > drm_dev_enter/exit, to make sure there's no races possible between
> > > driver hotunplug and concurrent access by userspace.
> >
> > Again, look at what v4l did, I think it might work out for you all as
> > well.
>
> I think we're talking past each another quite badly here ...

So I've read through the v4l register/unregister code for the cdev,
and in spirit it matches what we're doing with drm_device. In practice
the drm version is a lot more complicated, mostly because our uapi is
kinda hilarious and our single userspace-facing object is exposed
through an entire set of of different cdev (the one I have here has
like at 5 different cdev registered ...).

The other big difference that I'm seeing is that our equivalent of
video_unregister_device is split up, i.e. we're not using the
equivalent of device_unregister, but the device_del and put_device
that one boils down is split up, with some things happening in
between. Mostly because developers insist that when they remove/unbind
a driver, we're supposed to shut down the display hardware, instead of
just continuing to scan out garbage. Otherwise we could just use the
merged device_unregister().

tldr; I'm not seeing what we're doing totally wrong compared to v4l ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
