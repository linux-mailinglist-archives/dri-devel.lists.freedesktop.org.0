Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA423762A7
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 11:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC01D6E1E9;
	Fri,  7 May 2021 09:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7597C6E1E9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 09:11:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n2so8457392wrm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HsxrW3bdknow00JOjw61Uow51pyASehSq1Q7d2U+OwA=;
 b=Qt1o6hcye8AX4pf74Lkpt7E43rjaXth6U9YimvnfiyKcQkEBXITHKgkcfFQHo9+lXN
 DDtbNTV3nwO5NhZkp21B3RqSSira1e+t41RmyltRZVV00CbSfVqSfWiS3yXQUOVeYYmx
 UAcA95ADNkU/t8rORM3jZDwOGTtlK/qPp6fS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HsxrW3bdknow00JOjw61Uow51pyASehSq1Q7d2U+OwA=;
 b=lq60v3EfrvKbU7AM3qJEK96blQ2K0E7qUd+h8fQKiIp+/+SGZV4iq5Uady9agHk3SD
 hsJoBY76LZFgTZRfUluVb1aBVJlqnAzALXnURZmU9+IBLP7To7+/lETDpY4OIsvqLupt
 4MzLH0qIJYvKQ6pP2l/j0cV9PvkmbKSpwm2cgKLKdPvpXUkmKD857zeHJfgUwCafnl58
 akjbfV2bNU7+PBkHPvrLePgCt5Cw/TKPoQU6/eeNsN5M8HoGgxYHIRHvTdN2oWoMONHm
 O8r7kxHa5oiqfWvwZEY+tVm6qamUX2VEpHs1/sTFKy03KDiAtWBacBONfpDiHC8evilx
 TPFg==
X-Gm-Message-State: AOAM533hJBK3bn3K42TE+yb/kKFjG2I5fO1YDMdqiGA3hm+FdGSfF2MS
 aLpUm+dl32wVv45qMb258aeRmw==
X-Google-Smtp-Source: ABdhPJzzxj7LxIzguCe+tMyC5TSEGBFiPX+pV6pGZMwLUJyDgEXvKmMPUCPRTJvvR4m2sU8oKbWhtw==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr11049195wrv.254.1620378686851; 
 Fri, 07 May 2021 02:11:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s21sm6090633wmc.10.2021.05.07.02.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 02:11:26 -0700 (PDT)
Date: Fri, 7 May 2021 11:11:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
Message-ID: <YJUEPPUGCiTJC8V8@phenom.ffwll.local>
References: <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
 <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
 <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
 <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
 <b6d0c32c-cf90-6118-5c60-238b6f4a0aaa@amd.com>
 <YJO5jBaNj1XCTFXE@phenom.ffwll.local>
 <d398c3fd-badd-e9da-a74b-00231ad958a5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d398c3fd-badd-e9da-a74b-00231ad958a5@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 helgaas@kernel.org, dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:25:06PM -0400, Andrey Grodzovsky wrote:
> 
> 
> On 2021-05-06 5:40 a.m., Daniel Vetter wrote:
> > On Fri, Apr 30, 2021 at 01:27:37PM -0400, Andrey Grodzovsky wrote:
> > > 
> > > 
> > > On 2021-04-30 6:25 a.m., Daniel Vetter wrote:
> > > > On Thu, Apr 29, 2021 at 04:34:55PM -0400, Andrey Grodzovsky wrote:
> > > > > 
> > > > > 
> > > > > On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
> > > > > > On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
> > > > > > > > On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
> > > > > > > > > On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > > > With this calling drm_dev_unplug will flush and block
> > > > > > > > > > all in flight IOCTLs
> > > > > > > > > > 
> > > > > > > > > > Also, add feature such that if device supports graceful unplug
> > > > > > > > > > we enclose entire IOCTL in SRCU critical section.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > > > > > 
> > > > > > > > > Nope.
> > > > > > > > > 
> > > > > > > > > The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
> > > > > > > 
> > > > > > > Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca0ca5bdab20a4533491c08d91072fe2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637558908355926609%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SESZFWQEcQUHGGek8d1cNi9Iwo9XOmXqxg9MieRkxNU%3D&amp;reserved=0
> > > > > > > currently in code ?
> > > > > > 
> > > > > > I forgot about this one, again. Thanks for reminding.
> > > > > > 
> > > > > > > > > Especially not with an opt-in flag so that it could be shrugged of as a
> > > > > > > > > driver hack. Most of these ioctls should have absolutely no problem
> > > > > > > > > working after hotunplug.
> > > > > > > > > 
> > > > > > > > > Also, doing this defeats the point since it pretty much guarantees
> > > > > > > > > userspace will die in assert()s and stuff. E.g. on i915 the rough contract
> > > > > > > > > is that only execbuf (and even that only when userspace has indicated
> > > > > > > > > support for non-recoverable hw ctx) is allowed to fail. Anything else
> > > > > > > > > might crash userspace.
> > > > > > > 
> > > > > > > Given that as I pointed above we already fail any IOCTls with -ENODEV
> > > > > > > when device is unplugged, it seems those crashes don't happen that
> > > > > > > often ? Also, in all my testing I don't think I saw a user space crash
> > > > > > > I could attribute to this.
> > > > > > 
> > > > > > I guess it should be ok.
> > > > > 
> > > > > What should be ok ?
> > > > 
> > > > Your approach, but not your patch. If we go with this let's just lift it
> > > > to drm_ioctl() as the default behavior. No driver opt-in flag, because
> > > > that's definitely worse than any other approach because we really need to
> > > > get rid of driver specific behaviour for generic ioctls, especially
> > > > anything a compositor will use directly.
> > > > 
> > > > > > My reasons for making this work is both less trouble for userspace (did
> > > > > > you test with various wayland compositors out there, not just amdgpu x86
> > > > > 
> > > > > I didn't - will give it a try.
> > > 
> > > Weston worked without crashes, run the egl tester cube there.
> > > 
> > > > > 
> > > > > > driver?), but also testing.
> > > > > > 
> > > > > > We still need a bunch of these checks in various places or you'll wait a
> > > > > > very long time for a pending modeset or similar to complete. Being able to
> > > > > > run that code easily after hotunplug has completed should help a lot with
> > > > > > testing.
> > > > > > 
> > > > > > Plus various drivers already acquired drm_dev_enter/exit and now I wonder
> > > > > > whether that was properly tested or not ...
> > > > > > 
> > > > > > I guess maybe we need a drm module option to disable this check, so that
> > > > > > we can exercise the code as if the ioctl has raced with hotunplug at the
> > > > > > worst possible moment.
> > > > > > 
> > > > > > Also atomic is really tricky here: I assume your testing has just done
> > > > > > normal synchronous commits, but anything that goes through atomic can be
> > > > > > done nonblocking in a separate thread. Which the ioctl catch-all here wont
> > > > > > capture.
> > > > > 
> > > > > Yes, async commit was on my mind and thanks for reminding me. Indeed
> > > > > I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
> > > > > drm_dev_enter/exit. Note that i have a bunch of patches, all name's
> > > > > starting with 'Scope....' that just methodically put all the background
> > > > > work items and timers the drivers schedules in drm_dev_enter/exit scope.
> > > > > This was supposed to be part of the 'Scope Display code' patch.
> > > > 
> > > > That's too much. You still have to arrange that the flip completion event
> > > > gets sent out. So it's a bit tricky.
> > > > 
> > > > In other places the same problem applies, e.g. probe functions need to
> > > > make sure they report "disconnected".
> > > 
> > > I see, well, this is all part of KMS support which I defer for now
> > > anyway. Will tackle it then.
> > > 
> > > > 
> > > > > > > > > You probably need similar (and very precisely defined) rules for amdgpu.
> > > > > > > > > And those must definitely exclude any shard ioctls from randomly failing
> > > > > > > > > with EIO, because that just kills the box and defeats the point of trying
> > > > > > > > > to gracefully handling hotunplug and making sure userspace has a chance of
> > > > > > > > > survival. E.g. for atomic everything should continue, including flip
> > > > > > > > > completion, but we set all outputs to "disconnected" and send out the
> > > > > > > > > uevent. Maybe crtc enabling can fail too, but that can also be handled
> > > > > > > > > through the async status we're using to signal DP link failures to
> > > > > > > > > userspace.
> > > > > > > 
> > > > > > > As I pointed before, because of the complexity of the topic I prefer to
> > > > > > > take it step by step and solve first for secondary device use case, not
> > > > > > > for primary, display attached device.
> > > > > > 
> > > > > > Yeah makes sense. But then I think the right patch is to roll this out for
> > > > > > all drivers, properly justified with existing code. Not behind a driver
> > > > > > flag, because with all these different compositors the last thing we want
> > > > > > is a proliferation of driver-specific behaviour. That's imo the worst
> > > > > > option of all of them and needs to be avoided.
> > > > > 
> > > > > So this kind of patch would be acceptable to you if I unconditionally
> > > > > scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
> > > > > I am worried to break other drivers with this, see patch https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Ddrm-misc-next%26id%3Df0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca0ca5bdab20a4533491c08d91072fe2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637558908355926609%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=62f4gdl3lQH0ap58HTyv47zxALjaa5Td%2BysskR83rig%3D&amp;reserved=0
> > > > > Before setting drm_dev_unplug I go through a whole process of signalling
> > > > > all possible fences in the system which some one some where might be
> > > > > waiting on. My concern is that in the absence of HW those fences won't
> > > > > signal and so unless I signal them myself srcu_synchrionize in
> > > > > drm_dev_unplug will hang waiting for any such code scoped by
> > > > > drm_dev_enter/exit.
> > > > 
> > > > Uh right. I forgot about this.
> > > > 
> > > > Which would kinda mean the top level scope is maybe not the best idea, and
> > > > perhaps we should indeed drill it down. But then the testing issue
> > > > definitely gets a lot worse.
> > > > 
> > > > So what if we'd push that drm_dev_is_unplugged check down into ioctls?
> > > > Then we can make a case-by case decision whether it should be converted to
> > > > drm_dev_enter/exit, needs to be pushed down further into drivers (due to
> > > > fence wait issues) or other concerns?
> > > > 
> > > > Also I guess we need to have a subsystem wide rule on whether you need to
> > > > force complete all fences before you call drm_dev_unplug, or afterwards.
> > > 
> > > I don't see how you can handle it afterwards. If a thread is stuck in
> > > dma_fence_wait in non interruptible wait (any kernel thread) and with no
> > > timeout there is nothing you can do to stop the wait. Any such code
> > > scopped with drm_dev_enter/exit will cause a hang in drm_dev_unplug.
> > > The only way then is to preemptively force signal all such fences before
> > > calling drm_dev_unplug - as I do in the above mentioned patch.
> > 
> > Yeah, which is why I don't think top-level drm_dev_enter/exit is a good
> > idea.
> > 
> > > > If we have mixed behaviour on this there will be disappointment. And since
> > > > hotunplug and dma_fence completion are both userspace visible that
> > > > inconsistency might have bigger impact.
> > > > 
> > > > This is all very tricky indeed :-/
> > > > 
> > > > btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
> > > > with that: We could do the same trick we've done for DRM_UNLOCKED:
> > > > - drm_dev_enter/exit is called for any ioctl that has not set the
> > > >     DRM_HOTUNPLUG_SAFE flag
> > > > - for drm core ioctls we push them into all ioctls and decide how to
> > > >     handle/where (with the aim to have the least amount of code flow
> > > >     different during hotunplug vs after hotunplug has finished, to reduce
> > > >     testing scope)
> > > > - then we make DRM_HOTUNPLUG_SAFE the implied default
> > > > 
> > > > This would have us left with render ioctls, and I think the defensive
> > > > assumption there is that they're all hotunplug safe. We might hang on a
> > > > fence wait, but that's fixable, and it's better than blowing up on a
> > > > use-after-free security bug.
> > > > 
> > > > Thoughts?
> > > 
> > > I don't fully see a difference between the approach described above and
> > > the full drill down to each driver and even within the driver, to the HW
> > > back-ends - what criteria I would use to decide if for a given IOCTL i
> > > scope with drm_dev_enter/exit at the highest level while for another
> > > i go all the way down ? If we would agree that signaling the fences
> > > preemptively before engaging drm_dev_unplug is generically the right
> > > approach maybe we can then scope drm_ioctl unconditionally with
> > > drm_dev_enter/exit and then for each driver go through the same process
> > > I do for amdgpu - writing driver specific function which takes care of
> > > all the fences. We could then just create a drm callback which would
> > > be called from drm_ioctl before drm_dev_unplug is called.
> > 
> > So I see the appeal of just nuking all the fences, but I'm not sure that's
> > a good plan. We've done this in the old i915 gpu reset code too, and the
> > issue is it's defacto inverting the locking. But also the hw is truly
> > gone, so it also makes sense.
> > 
> > The problem is a bit roll-out, if we state that dma_fence_wait is allowed
> > with a drm_dev_enter/exit, then all drivers need to force-retire their
> > fences.
> > 
> > The other option would be that we require that dma_fence_wait is _not_
> > allowed in drm_dev_enter/exit, and that therefore these areas must be
> > marked up more fine-grained to avoid deadlocks. I like this more from the
> > testing aspect (it makes it easier to be reasonable sure your code handles
> > concurrent hotunplug), but also it's pretty easy to validate with the
> > dma_fence lockdep annotations we have I think.
> 
> They key question as I see it - is it ok for a device to be unplugged
> while it's driver has anywhere in it's code a dma_fence_wait
> waiting for work completion from this device. The answers seems to me
> is no, the HW is gone, this fence will never signal and so you will be
> left with indefinitely hanged code thread with all it's unreleased
> resources. If i am correct in the above statement then avoiding scoping
> code with drm_dev_enter/exit because a dma_fence_wait might be there in the
> middle
> just hides the problem. Also, then the only solution for each driver
> wanting to support hot-unplug is to force retire all it's HW
> fences once it's notified of device removal.

At a high level, yes dma_fence must always complete. I don't think we have
a disagreement here on that.

What we're discussing here is the precise sequencing and barriers, where
things get tricky. Requiring that you force-complete all dma_fence that
might be affected before you hotunplug is one solution, the other is
tuning the critical sections that drm_dev_enter/exit annotates.

This isn't about avoiding anything or hiding problems, this is about
locking/synchronization design. And for that we must agree on what is
allowed inside/outside of a critical section for all possible
combinations.

E.g. we're also "hiding" problems with calling dma_fence_wait from
shrinkers/mmu notifiers by forbidding allocations in
dma_fence_begin/end_signalling critical paths.

> > A third reasons for not requiring force-retiring of dma_fence before
> > drm_dev_unplug is the races: Before drm_dev_unplug you haven't stopped new
> > fences from happening, but until you've stopped new fences it's hard to
> > guarantee they're all retired. How do you solve this currently.
> 
> See amdgpu_finilize_device_fences in https://patchwork.ozlabs.org/project/linux-pci/patch/20210428151207.1212258-20-andrey.grodzovsky@amd.com/
> I think the steps described there answer your
> concern here.

The hard problem is stopping further command submission. Not seeing how
you solve that.

But I'm definitely scared about all the scheduler/tdr interactions you
already have there, and that looks quite a bit like fallout from doing
things the wrong way round.

Also given that drm/scheduler is shared, why can't this be a drm/scheduler
helper function?

> > Finally there's still hangcheck and all that, so if we go with forbidding
> > dma_fence_wait from within drm_dev_enter/exit sections, then drivers don't
> > need to have additional tricky code to force-retire fences. TDR will take
> > care already (albeit with maybe a slightly annoying long timeout, which
> > we can shorten to "time out everything immediately" after drm_dev_unplug).
> 
> I am not aware of TDR handlers  that do it today, at least we don't,
> we don't check that if device is gone let's instead of resetting the device
> and resubmit jobs just force retire all the HW fences. In any case, this
> can and i think should be done in pci remove callback because this is
> the place that supposed to handle device extraction. I for example in
> amdgpu_finilize_device_fences just block all TDRs from taking place as first
> step in the process. If other drivers want to force retire fences
> in their TDR handlers they still need to block and wait for all such
> TDRs in their pci_remove handler.

TDR definitely force-completes the fence that did hang. Of course it'll
take a while until they've all completed this way, but we do have
guaranteed forward progress since we've stopped all further fences from
showing up because drm_dev_unplug is called already.

And yes after drm_dev_unplug you can then force-retire the tdr stuff.

> > What we definitely can't have is half the drivers doing it one way, and
> > the other half the other way. So your driver flag to wrap the ioctl
> > optionally in a drm_dev_enter/exit path is a no-go still I think.
> > 
> > I guess my tldr; is: I definitely see how your current approach gives
> > quicker results for amdgpu right now, but long term I'm seeing more
> > positives on the other one. At least I expect less special cases due to
> > hotunplug with that.
> 
> As i expressed my viewpoint above - seems to me any driver in need to
> support hot-unplug must force retire it's fences because of need to
> unblock all dma_fence waits and so it will not be a special case.

This isn't the special case I meant. It's the very tricky
force-retire-before-you-unplugged-officially which is large scale nasty.

Also if your driver doesn't force-retire already, it's buggy. The
additional need of hotunplug is just that we're trying to force-retire a
bit faster, because we know it's all hopeless. But e.g. i915 already has a
fallback that does this automatically:
- first we reset only the engine/context, keeping everyone else running
- if that doesn't pan out, we reset the entire chip and give up an
  anything that's in-flight, which (iirc, it did so at least in the past)
  force retires everything outstanding.

I think amdgpu only has full chip reset, so your first step tries to
reissue all other tasks. But that's not necessarily how it needs to
happen.

Either way drivers must force retire everything (albeit maybe a bit at a
slow pace) if the hw ceased to work properly already. Hotunplug really
isn't anything new here.
-Daniel
> 
> Andrey
> 
> > 
> > Cheers, Daniel
> > 
> > > 
> > > Andrey
> > > 
> > > > 
> > > > It is unfortunately even more work until we've reached the goal, but I
> > > > think it's safest and most flexible approach overall.
> > > > 
> > > > Cheers, Daniel
> > > > 
> > > > > 
> > > > > Andrey
> > > > > 
> > > > > > 
> > > > > > Cheers, Daniel
> > > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > > > 
> > > > > > > > > I guess we should clarify this in the hotunplug doc?
> > > > > > > 
> > > > > > > Agree
> > > > > > > 
> > > > > > > > 
> > > > > > > > To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
> > > > > > > > really make no sense, and where we're rather confident that all properly
> > > > > > > > implemented userspace will gracefully handle failures. Like a modeset, or
> > > > > > > > opening a device, or trying to import a dma-buf or stuff like that which
> > > > > > > > can already fail in normal operation for any kind of reason.
> > > > > > > > 
> > > > > > > > But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
> > > > > > > > after hotunplug.
> > > > > > > 
> > > > > > > As I pointed above, this a bit confuses me given that we already do
> > > > > > > blanker rejection of IOCTLs if device is unplugged.
> > > > > > 
> > > > > > Well I'm confused about this too :-/
> > > > > > 
> > > > > > > > And then there's the middle ground, like doing a pageflip or buffer flush,
> > > > > > > > which I guess some userspace might handle, but risky to inflict those
> > > > > > > > consequences on them. atomic modeset is especially fun since depending
> > > > > > > > what you're doing it can be both "failures expected" and "failures not
> > > > > > > > really expected in normal operation".
> > > > > > > > 
> > > > > > > > Also, this really should be consistent across drivers, not solved with a
> > > > > > > > driver flag for every possible combination.
> > > > > > > > 
> > > > > > > > If you look at the current hotunplug kms drivers, they have
> > > > > > > > drm_dev_enter/exit sprinkled in specific hw callback functions because of
> > > > > > > > the above problems. But maybe it makes sense to change things in a few
> > > > > > > > cases. But then we should do it across the board.
> > > > > > > 
> > > > > > > So as I understand your preferred approach is that I scope any back_end, HW
> > > > > > > specific function with drm_dev_enter/exit because that where MMIO
> > > > > > > access takes place. But besides explicit MMIO access thorough
> > > > > > > register accessors in the HW back-end there is also indirect MMIO access
> > > > > > > taking place throughout the code in the driver because of various VRAM
> > > > > > > BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
> > > > > > > access is spread all over in the driver and even in mid-layers such as
> > > > > > > TTM and not limited to HW back-end functions. It means it's much harder
> > > > > > > to spot such places to surgically scope them with drm_dev_enter/exit and
> > > > > > > also that any new such code introduced will immediately break hot unplug
> > > > > > > because the developers can't be expected to remember making their code
> > > > > > > robust to this specific use case. That why when we discussed internally
> > > > > > > what approach to take to protecting code with drm_dev_enter/exit we
> > > > > > > opted for using the widest available scope.
> > > > > > 
> > > > > > The thing is, you kinda have to anyway. There's enormous amounts of
> > > > > > asynchronous processing going on. E.g. nonblocking atomic commits also do
> > > > > > ttm unpinning and fun stuff like that, which if you sync things wrong can
> > > > > > happen way late. So the door for bad fallout is wide open :-(
> > > > > > 
> > > > > > I'm not sure where the right tradeoff is to make sure we catch them all,
> > > > > > and can make sure with testing that we've indeed caught them all.
> > > > > > -Daniel
> > > > > > 
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
