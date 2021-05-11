Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C284C37A90C
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7EF6EA4A;
	Tue, 11 May 2021 14:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CB56EA4A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:23:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id j26so19432850edf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EHY4rzxebDbvvaO/T0JYZuUcbOfjgdUciSZUqoyMrX0=;
 b=SQ3wLXUfHrbtU1TYeU6bajRf2eWpXJMD6vzKF8Q3HTYU4da9Ho3IZyBDydh0prsTrQ
 u8u2mOOzohuFt6Rr8+EzXZqFAb+fLb0EjpYpt4XXXEaawNrU6+gGb+m+FycdbO6edaY9
 eLa2X0uofi9RcQsHuphIRc8WaHaK1SnSDQpP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EHY4rzxebDbvvaO/T0JYZuUcbOfjgdUciSZUqoyMrX0=;
 b=efBkwLYIsGGZR7STyywYLa8GP6R0YVrkBhMAjRhmSV6kyUHUVyK/Ul4LjqGaJQZyu8
 1wsreawbMZ70GgkP8TqXjD2qwPg0oeEK4z0b55ybPjC/F604HiC9HdOQCq6zsUtksL0q
 0yxGPquVZsMQ39JoJTs95MnJEmIFaPl8hHXYRXQQxlJzLGPYg+zLyLy1PsBXXqPyWi4B
 0E9xHjbecI3E9G2fsLN8C3NXvj6L9VI3qVXkRljWjwGGlSQ6kUKqaJaldqhV1wKPTj45
 mqGSeMmgQMseNwf1sNdcHWiNB4+6Uvilht0XT+QrSlF78ZI/odRTg8G3E7TpraMhhdmg
 Onbg==
X-Gm-Message-State: AOAM531qtU6mPUupBRxbKPC9dpg3jJ+LcIxhfS2nkEClS21rWjFmBqcK
 xQsfrPUZlbhcLKFxb966sWJ2eaFRjmDu6g==
X-Google-Smtp-Source: ABdhPJy57CWVVjeGXMvUf+p+74SJ2IrHI9p4LdZA1jH7+ZKpZhveM6YBtgekqts1+kO7BnkoP++55w==
X-Received: by 2002:a05:6402:546:: with SMTP id
 i6mr11152338edx.376.1620743035825; 
 Tue, 11 May 2021 07:23:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d25sm11622175ejd.59.2021.05.11.07.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:23:55 -0700 (PDT)
Date: Tue, 11 May 2021 16:23:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
 <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 09:47:56AM +0200, Christian König wrote:
> Am 11.05.21 um 09:31 schrieb Daniel Vetter:
> > [SNIP]
> > > > And that's just the one ioctl I know is big trouble, I'm sure we'll find
> > > > more funny corner cases when we roll out explicit user fencing.
> > > I think we can just ignore sync_file. As far as it concerns me that UAPI is
> > > pretty much dead.
> > Uh that's rather bold. Android is built on it. Currently atomic kms is
> > built on it.
> 
> To be honest I don't think we care about Android at all.

we = amd or we = upstream here?

> > > What we should support is drm_syncobj, but that also only as an in-fence
> > > since that's what our hardware supports.
> > Convince Android folks, minimally. Probably a lot more. Yes with hindsight
> > we should have just gone for drm_syncobj instead of the sync_file thing,
> > but hindsight and all that.
> > 
> > This is kinda why I don't think trying to support the existing uapi with
> > userspace fences underneath with some magic tricks is a good idea. It's
> > just a pile of work, plus it's not really architecturally clean.
> > 
> > > > Anotherone that looks very sketchy right now is buffer sharing between
> > > > different userspace drivers, like compute <-> media (if you have some
> > > > fancy AI pipeline in your media workload, as an example).
> > > Yeah, we are certainly going to get that. But only inside the same driver,
> > > so not much of a problem.
> > Why is this not much of a problem if it's just within one driver?
> 
> Because inside the same driver I can easily add the waits before submitting
> the MM work as necessary.

What is MM work here now?

> > > > > Adding implicit synchronization on top of that is then rather trivial.
> > > > Well that's what I disagree with, since I already see some problems that I
> > > > don't think we can overcome (the atomic ioctl is one). And that's with us
> > > > only having a fairly theoretical understanding of the overall situation.
> > > But how should we then ever support user fences with the atomic IOCTL?
> > > 
> > > We can't wait in user space since that will disable the support for waiting
> > > in the hardware.
> > Well, figure it out :-)
> > 
> > This is exactly why I'm not seeing anything solved with just rolling a
> > function call to a bunch of places, because it's pretending all things are
> > solved when clearly that's not the case.
> > 
> > I really think what we need is to first figure out how to support
> > userspace fences as explicit entities across the stack, maybe with
> > something like this order:
> > 1. enable them purely within a single userspace driver (like vk with
> > winsys disabled, or something else like that except not amd because
> > there's this amdkfd split for "real" compute)
> > 1a. including atomic ioctl, e.g. for vk direct display support this can be
> > used without cross-process sharing, new winsys protocols and all that fun
> > 2. figure out how to transport these userspace fences with something like
> > drm_syncobj
> > 2a. figure out the compat story for drivers which dont do userspace fences
> > 2b. figure out how to absorb the overhead if the winsys/compositor doesn't
> > support explicit sync
> > 3. maybe figure out how to make this all happen magically with implicit
> > sync, if we really, really care
> > 
> > If we do 3 before we've nailed all these problems, we're just guaranteeing
> > we'll get the wrong solutions and so we'll then have 3 ways of doing
> > userspace fences
> > - the butchered implicit one that didn't quite work
> > - the explicit one
> > - the not-so-butchered implicit one with the lessons from the properly
> >    done explicit one
> > 
> > The thing is, if you have no idea how to integrate userspace fences
> > explicitly into atomic ioctl, then you definitely have no idea how to do
> > it implicitly :-)
> 
> Well I agree on that. But the question is still how would you do explicit
> with atomic?

If you supply an userpace fence (is that what we call them now) as
in-fence, then your only allowed to get a userspace fence as out-fence.
That way we
- don't block anywhere we shouldn't
- don't create a dma_fence out of a userspace fence

The problem is this completely breaks your "magically make implicit
fencing with userspace fences" plan.

So I have a plan here, what was yours?

> Transporting fences between processes is not the fundamental problem here,
> but rather the question how we represent all this in the kernel?
> 
> In other words I think what you outlined above is just approaching it from
> the wrong side again. Instead of looking what the kernel needs to support
> this you take a look at userspace and the requirements there.

Uh ... that was my idea here? That's why I put "build userspace fences in
userspace only" as the very first thing. Then extend to winsys and
atomic/display and all these cases where things get more tricky.

I agree that transporting the fences is easy, which is why it's not
interesting trying to solve that problem first. Which is kinda what you're
trying to do here by adding implicit userspace fences (well not even that,
just a bunch of function calls without any semantics attached to them).

So if there's more here, you need to flesh it out more or I just dont get
what you're actually trying to demonstrate.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > And "just block" might be good enough for a quick demo, it still breaks
> > the contract. Same holds for a bunch of the winsys problems we'll have to
> > deal with here.
> > -Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Like here at intel we have internal code for compute, and we're starting
> > > > to hit some interesting cases with interop with media already, but that's
> > > > it. Nothing even close to desktop/winsys/kms, and that's where I expect
> > > > will all the pain be at.
> > > > 
> > > > Cheers, Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
