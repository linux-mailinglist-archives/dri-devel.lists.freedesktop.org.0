Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0016E945
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0286EB11;
	Tue, 25 Feb 2020 15:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A8A6EB13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 15:03:41 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id h9so12282047otj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 07:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R6y7L6Myxr2kli2akOhQaEKT4fK1INGdCYUk9txXrfw=;
 b=K/0yaUpguJxde/7k+cYaxPrxohycQaoszWcLnibDfcyWm5sM6ZcWPxVN1ibMHZCVPt
 mwkyOSBk12QtwSNuHT28AbHbvTjU7AuwgOODclfBQIwr6dqgUx6YAtUgd5lbQLK4YLQ/
 P8hd9G7BLQ9+AzS6svAoRBniKp6JvdAKiuDxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6y7L6Myxr2kli2akOhQaEKT4fK1INGdCYUk9txXrfw=;
 b=Pw4popH8b2cSQY/eKDWKwJOzb2tqI1W0+URxMCVj/KrqOS5N7b4W2YwDAmCUMBTS84
 it+hFnMa9He1xWAKZ4kVSNu6ReX+/LfjijLbjPvrBcPF8zaKr+syY97hqKOXvaPhd3us
 HZXdZVyMi55R5b8Wd76Mrxfh/eOU4Bc7qA0anM84ZJzRPElBWAFljXFxkKMnLFc6ZFmh
 pPdRjZWJwtW76VdxUyDlsNNgUU5mKvXjCm8geLFdrrDljnlMVqaQY9F9JjCjThdFZ2FP
 IuNt98NZeRnZxFOmOxPkS23g+VYf+v074G6BbnpYM+6EwSBZ01vm7kNtUEA+9doZyEFa
 OhXA==
X-Gm-Message-State: APjAAAUpgBi2dDRtQ+zBOOclWUT13qM75Ry/2hyrjNsB9q1gMJLsG0wU
 qseT3Nitbg8wlVOEF0uj6cALfCqNjC2jQHj3dXiBTUqc
X-Google-Smtp-Source: APXvYqzIFb5QGNXTKTOzO2V2c26F7hLRzkXKI8qXfXMqx80mp6u3sSbxDuxgCOFgIhK+dkVqmrE+6fJ2tJmKqJRkgxg=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr48195422otq.281.1582643020709; 
 Tue, 25 Feb 2020 07:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <CGME20200221210354eucas1p1b9377cb5c64ae9f657191cf7d6c9e92c@eucas1p1.samsung.com>
 <20200221210319.2245170-4-daniel.vetter@ffwll.ch>
 <c088ce3b-d409-3a66-1f45-72f8ee9d9784@samsung.com>
In-Reply-To: <c088ce3b-d409-3a66-1f45-72f8ee9d9784@samsung.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 25 Feb 2020 16:03:29 +0100
Message-ID: <CAKMK7uE+8eQGfV=6t_3vV+L=fOL6zUm5CqSxWf26JNUSL54brg@mail.gmail.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 11:27 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Hi Daniel,
>
>
> The patchset looks interesting.
>
>
> On 21.02.2020 22:02, Daniel Vetter wrote:
> > We have lots of these. And the cleanup code tends to be of dubious
> > quality. The biggest wrong pattern is that developers use devm_, which
> > ties the release action to the underlying struct device, whereas
> > all the userspace visible stuff attached to a drm_device can long
> > outlive that one (e.g. after a hotunplug while userspace has open
> > files and mmap'ed buffers). Give people what they want, but with more
> > correctness.
>
>
> I am not familiar with this stuff, so forgive me stupid questions.
>
> Is it documented how uapi should behave in such case?
>
> I guess the general rule is to return errors on most ioctls (ENODEV,
> EIO?), and wait until userspace releases everything, as there is not
> much more to do.
>
> If that is true what is the point of keeping these structs anyway -
> trivial functions with small context data should do the job.
>
> I suspect I am missing something but I do not know what :)

We could do the above (also needs unmapping of all mmaps, so userspace
then gets SIGSEGV everywhere) and watch userspace crash&burn.
Essentially if the kernel can't do this properly, then there's no hope
that userspace will be any better.

Hence the idea is that we keep everything userspace facing still
around, except it doesn't do much anymore. So connectors still there,
but they look disconnected. Userspace can then hopefully eventually
get around to processing the sysfs hotunplug event and remove the
device from all its list. So the long-term idea is that a lot of stuff
keeps working, except the driver doesn't talk to the hardware anymore.
And we just sit around waiting for userspace to clean things up.

I guess once we have a bunch of the panel/usb drivers converted over
we could indeed document how this is all supposed to work from an uapi
pov. But right now a lot of this is all rather aspirational, I think
only the recent simple display pipe based drivers implement this as
described above.

> > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > a few simplifications - I didn't (yet) copy over everything. Since
> > the types don't match code sharing looked like a hopeless endeavour.
> >
> > For now it's only super simplified, no groups, you can't remove
> > actions (but kfree exists, we'll need that soon). Plus all specific to
> > drm_device ofc, including the logging. Which I didn't bother to make
> > compile-time optional, since none of the other drm logging is compile
> > time optional either.
>
>
> I saw in v1 thread that copy/paste is OK and merging back devres and
> drmres can be done later, but experience shows that after short time
> things get de-synchronized and merging process becomes quite painful.
>
> On the other side I guess it shouldn't be difficult to split devres into
> consumer agnostic core and "struct device" helpers and then use the core
> in drm.
>
> For example currently devres uses two fields from struct device:
>
>     spinlock_t        devres_lock;
>     struct list_head    devres_head;
>
> Lets put it into separate struct:
>
> struct devres {
>
>     spinlock_t        lock;
>     struct list_head    head;
>
> };
>
> And embed this struct into "struct device".
>
> Then convert all core devres functions to take "struct devres *"
> argument instead of "struct device *" and then these core functions can
> be usable in drm.
>
> Looks quite simple separation of abstraction (devres) and its consumer
> (struct device).
>
> After such split one could think about changing name devres to something
> more reliable.

There was a long discussion on v1 exactly about this, Greg's
suggestion was to "just share a struct device". So we're not going to
do this here, and the struct device seems like slight overkill and not
a good enough fit here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
