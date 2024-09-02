Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA567968589
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410D610E290;
	Mon,  2 Sep 2024 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DGkUbpSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7205D10E290
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:00:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-374c2b0707fso919831f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725274848; x=1725879648; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9AbdFYp0oWoo5+QVAKEhIvqNpk//Miw7lQcs9E9X+oo=;
 b=DGkUbpSRZlQIvsSrcWWKj+h3rIhcOJFV+U0NxhdcQM/8D/r4C/LD72Z/Wx5WLrfFI3
 Dg/uynk5yBLXRbndn1RKIEQhvVZJxVUGg9lrLlppnKEmMavok6EOTjhi7ajv8PtIiXOd
 IK5kQBhfYqNjWfjWFOf9fm6ciA5plSe5KzqIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725274848; x=1725879648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9AbdFYp0oWoo5+QVAKEhIvqNpk//Miw7lQcs9E9X+oo=;
 b=Tp6xoNhY0t0fuiE7UkDUU0CcmF673fliMxnPUv37s58DJrCRuxELI6Ktts1f7f42+v
 HdxQWOKd0rZx6NWItmU/uMKJ+BbCzll4f9AOcPM6qGcmg1qgv48ZO1r1NIXHLuFGyucU
 wOZSEhHLVWBSg6z5BZS/U6hWRypkaXLrs4QMzVmR6WLlm9ND/38NYuwcaWTaszmYTmzl
 Rxe9XkINv+T8RkzGlsZ7O6AJ8dXVZ2iv6DbRw/zM3QtCIqXNCGn/U3hwV8RFuSLvWR6t
 E6EuNjORZRO52EA+N1DDWFHDyUCCMMbTZVOvH/Sq8r9wfhJvvn9Gyz8JW6yUklM2APGh
 VTlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEfyhDhSzr1KpX/T/GDLQY/9jtsnmE3km6f9mgd24CUGdsbCYf5uGfMgZ7/p8TBOKBcW5jkc/Di5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSLE5NNv79EiSabUH//wJ2TJhc1k48OO7LzPvLG3Csofh//2to
 WdqfXENhB7SshbA7f75i9PKn+o3hKjuLMIBOHMrY8kEg394EycneTE/DlUxLe4E=
X-Google-Smtp-Source: AGHT+IGvEGK4a7O8/4Zng62/s5d7t65zI7lTTvDmmdrrBwFd5OSyOubpMLXWwLShczkIPFKlSQd19g==
X-Received: by 2002:adf:f188:0:b0:371:88e5:6d34 with SMTP id
 ffacd0b85a97d-374c94554b1mr2290146f8f.7.1725274847507; 
 Mon, 02 Sep 2024 04:00:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cef1e179sm1231825f8f.46.2024.09.02.04.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:00:47 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:00:44 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <ZtWa3HIJmWJbStB8@phenom.ffwll.local>
References: <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
 <CADnq5_OD-eiuS38ePYErOUyUN1LcUjvyKPbQdoXjrGHNt8juRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OD-eiuS38ePYErOUyUN1LcUjvyKPbQdoXjrGHNt8juRg@mail.gmail.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 27, 2024 at 02:24:27PM -0400, Alex Deucher wrote:
> On Tue, Aug 27, 2024 at 12:58 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > [machine died, new one working now, I can read complicated mails again an
> > answer.]
> >
> > On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König wrote:
> > > Am 22.08.24 um 11:23 schrieb Daniel Vetter:
> > > > On Wed, Aug 21, 2024 at 10:14:34AM +0200, Christian König wrote:
> > > > > Am 20.08.24 um 18:00 schrieb Thomas Hellström:
> > > > > > > Or why exactly should shrinking fail?
> > > > > > A common example would be not having runtime pm and the particular bo
> > > > > > needs it to unbind, we want to try the next bo. Example: i915 GGTT
> > > > > > bound bos and Lunar Lake PL_TT bos.
> > > > > WHAT? So you basically block shrinking BOs because you can't unbind them
> > > > > because the device is powered down?
> > > > Yes. amdgpu does the same btw :-)
> > >
> > > Well, amdgpu wouldn't block shrinking as far as I know.
> > >
> > > When the GPU is powered down all fences are signaled and things like GART
> > > unbinding is just postponed until the GPU wakes up again.
> > >
> > > > It's a fairly fundamental issue of rpm on discrete gpus, or anything that
> > > > looks a lot like a discrete gpu. The deadlock scenario is roughly:
> > > >
> > > > - In runtime suspend you need to copy any bo out of vram into system ram
> > > >    before you power the gpu. This requires bo and ttm locks.
> > > >
> > > > - You can't just avoid this by holding an rpm reference as long as any bo
> > > >    is still in vram, because that defacto means you'll never autosuspend at
> > > >    runtime. Plus most real hw is complex enough that you have some driver
> > > >    objects that you need to throw out or recreate, so in practice no way to
> > > >    avoid all this.
> > > >
> > > > - runtime resume tends to be easier and mostly doable without taking bo
> > > >    and ttm locks, because by design you know no one else can possibly have
> > > >    any need to get at the gpu hw - it was all powered off after all. It's
> > > >    still messy, but doable.
> > > >
> > > > - Unfortunately this doesn't help, because your runtime resume might need
> > > >    to wait for a in-progress suspend operation to complete. Which means you
> > > >    still deadlock even if your resume path has entirely reasonable locking.
> > >
> > > Uff, yeah that totally confirms my gut feeling that this looked really
> > > questionable.
> > >
> > > > On integrated you can mostly avoid this all because there's no need to
> > > > swap out bo to system memory, they're there already. Exceptions like the
> > > > busted coherency stuff on LNL aside.
> > > >
> > > > But on discrete it's just suck.
> > >
> > > Mhm, I never worked with pure integrated devices but at least radeon, amdgpu
> > > and nouveau seems to have a solution which would work as far as I can tell.
> >
> > Yeah integrated is easy (if you don't do silly stuff like intel on their
> > latest).
> >
> > > Basically on suspend you make sure that everything necessary for shrinking
> > > is done, e.g. waiting for fences, evacuating VRAM etc...
> >
> > This is the hard part, or the "evacuating VRAM" part at least. My proposal
> > is that essentially the runtime_suspend_prepare hook does that. Imo the
> > clean design is that we wait for rpm autosuspend, and only then start to
> > evacuate VRAM. Otherwise you need to hold a rpm reference if there's
> > anything in VRAM, which kinda defeats the point of runtime pm ...
> >
> > Or you have your own runtime pm refcount that tracks whether anyone uses
> > the gpu, and if that drops to 0 for long enough you evacuate VRAM, and
> > then drop the rpm reference. Which is just implementing the idea I've
> > typed up, except hand-rolled in driver code and with a rpm refcount that's
> > entirely driver internal.
> >
> > And at least last time I checked, amdgpu does the VRAM evacuation in the
> > runtime pm suspend callback, which is why all your runtime_pm_get calls
> > are outside of the big bo/ttm locks.
> 
> It used to do the eviction in the runtime_suspend callback, but we ran
> into problems where eviction would sometimes fail if there was too
> much memory pressure during suspend.  Moving it to prepare made things
> fail earlier.  Ultimately, I think the problem is that runtime pm
> disables swap during runtime pm. See:
> https://gitlab.freedesktop.org/drm/amd/-/issues/2362#note_2111666

That's system suspend/resume, where you have a prepare callback. At least
as far as I know, for runtime pm this doesn't exist.
-Sima

> 
> Alex
> 
> >
> > > Hardware specific updates like GART while the device is suspended are
> > > postponed until resume.
> >
> > Yeah GART shouldn't be the issue, except when you're racing.
> >
> > > > TTM discrete gpu drivers avoided all that by simply not having a shrinker
> > > > where you need to runtime pm get, instead all runtime pm gets are outmost,
> > > > without holding any ttm or bo locks.
> > >
> > > Yes, exactly that.
> > >
> > > > > I would say that this is a serious NO-GO. It basically means that powered
> > > > > down devices can lock down system memory for undefined amount of time.
> > > > >
> > > > > In other words an application can allocate memory, map it into GGTT and then
> > > > > suspend or even get killed and we are not able to recover the memory because
> > > > > there is no activity on the GPU any more?
> > > > >
> > > > > That really sounds like a bug in the driver design to me.
> > > > It's a bug in the runtime pm core imo. I think interim what Thomas laid
> > > > out is the best solution, since in practice when the gpu is off you really
> > > > shouldn't need to wake it up. Except when you're unlucky and racing a
> > > > runtime suspend against a shrinker activity (like runtime suspend throws a
> > > > bo into system memory, and the shrinker then immediately wants to swap it
> > > > out).
> > >
> > > Mhm, why exactly is that problematic?
> > >
> > > Wouldn't pm_runtime_get_if_in_use() just return 0 in this situation and we
> > > postpone any hw activity?
> >
> > So when you're runtime suspend, you need to evacuate VRAM. Which means
> > potentially a lot needs to be moved into system memory. Which means it's
> > likely the shrinker gets active. Also, it's the point where
> > pm_runtime_get_if_in_use() will consistently fail, so right when you need
> > the shrinker to be reliable it will fail the most.
> >
> > > > I've been pondering this mess for a few months, and I think I have a
> > > > solution. But it's a lot of work in core pm code unfortunately:
> > > >
> > > > I think we need to split the runtime_suspend callback into two halfes:
> > > >
> > > > ->runtime_suspend_prepare
> > > >
> > > > This would be run by the rpm core code from a worker without holding any
> > > > locks at all. Also, any runtime_pm_get call will not wait on this prepare
> > > > callback to finish, so it's up to the driver to make sure all the locking
> > > > is there. Synchronous suspend calls obviously have to wait for this to
> > > > finish, but that should only happen during system suspend or driver
> > > > unload, where we don't have these deadlock issues.
> > > >
> > > > Drivers can use this callback for any non-destructive prep work
> > > > (non-destructive aside from the copy engine time wasted if it fails) like
> > > > swapping bo from vram to system memory. Drivers must not actually shut
> > > > down the hardware because a runtime_pm_get call must succeed without
> > > > waiting for this callback to finish.
> > > >
> > > > If any runtime_pm_get call happens while the suspend attempt will be
> > > > aborted without further action.
> > > >
> > > > ->runtime_suspend
> > > >
> > > > This does the actual hw power-off. The power core must guarantee that the
> > > > ->runtime_suspend_prepare has successfully completed at least once without
> > > > the rpm refcount being elevated from 0 to 1 again.
> > > >
> > > > This way drivers can assume that all bo have been swapped out from vram
> > > > already, and there's no need to acquire bo or ttm locks in the suspend
> > > > path that could block the resume path.
> > > >
> > > > Which would then allow unconditional runtime_pm_get in the shrinker paths.
> > > >
> > > > Unfortunately this will be all really tricky to implement and I think
> > > > needs to be done in the rumtime pm core.
> > >
> > > Completely agree that this is complicated, but I still don't see the need
> > > for it.
> > >
> > > Drivers just need to use pm_runtime_get_if_in_use() inside the shrinker and
> > > postpone all hw activity until resume.
> >
> > Not good enough, at least long term I think. Also postponing hw activity
> > to resume doesn't solve the deadlock issue, if you still need to grab ttm
> > locks on resume.
> >
> > > At least for amdgpu that shouldn't be a problem at all.
> >
> > Yeah, because atm amdgpu has the rpm_get calls outside of ttm locks, which
> > is exactly the inversion you've complained about as being broken driver
> > design.
> > -Sima
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
