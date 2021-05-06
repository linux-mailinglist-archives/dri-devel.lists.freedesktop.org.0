Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D593751AF
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 11:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94286E49B;
	Thu,  6 May 2021 09:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0136E17B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 09:40:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l2so4865129wrm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PVM3n4MiQ0ppcJJxaAXsKAQRG4FhEGHOWnGID6VnrQg=;
 b=RIQhYmj5oZhZJYdw4EgObUYJ3V+4uWjOpoDuTXO/YCq4Sl+yhxanTgaqSSO7Ayes6q
 lkMeCQnrpYMt5qlZarzF0J9Sqhbqw05XGSz7uNckasIXmCHqM8XXs1xoCj7SvoScYzAs
 20+YQHh5WOSPLAqSlqZrVvlUChRXcPhB4FeYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PVM3n4MiQ0ppcJJxaAXsKAQRG4FhEGHOWnGID6VnrQg=;
 b=B4p+CTNuqvhPKnmpGdVKMwr21zKGTelmqe2TG9jvKLG0gNAyIiXVOM4eOBUiws1zPo
 K0QGZMyYbzHry8DvDEmQEPf4zeovQxNOBOebTb5hCa+BTliAg+F/P+t23DuF7l10IeWS
 cBASRAZI76/f01AODqwSZcvmjs+CC013va/WOFKrhNIvAeCyR/neMMtN1EeKHdpIq/2s
 rn0UpuGBqAVL3FZn2Qezx/6tyymGKlFtC5BzFjVgjkWG9uP1yMw8lyUC660E5I97cRJc
 bh8wr14m48CpRtGN+zIMcmno6qmAt+WyjtVkae/zHc5CZAuqYDG+TJJFMWmBeTHODfAu
 eR8A==
X-Gm-Message-State: AOAM531EjwP3VwU3USh23hGci1kH6aQXmq+ihMG5/7Yo2G3ehf/gwJBe
 xTaWlmsJpOokSzLleUxZk/xDTA==
X-Google-Smtp-Source: ABdhPJyz7xB8rgcs1MmVi94Rg97OEYBHgU3oHN4/RKWaeHeblxUv1EPuHJju56qgrHc5WICjzeuFvg==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr3950561wru.15.1620294031368;
 Thu, 06 May 2021 02:40:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z14sm3757949wrt.54.2021.05.06.02.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:40:30 -0700 (PDT)
Date: Thu, 6 May 2021 11:40:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
Message-ID: <YJO5jBaNj1XCTFXE@phenom.ffwll.local>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
 <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
 <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
 <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
 <b6d0c32c-cf90-6118-5c60-238b6f4a0aaa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6d0c32c-cf90-6118-5c60-238b6f4a0aaa@amd.com>
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

On Fri, Apr 30, 2021 at 01:27:37PM -0400, Andrey Grodzovsky wrote:
> 
> 
> On 2021-04-30 6:25 a.m., Daniel Vetter wrote:
> > On Thu, Apr 29, 2021 at 04:34:55PM -0400, Andrey Grodzovsky wrote:
> > > 
> > > 
> > > On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
> > > > On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
> > > > > 
> > > > > 
> > > > > On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
> > > > > > On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
> > > > > > > On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > With this calling drm_dev_unplug will flush and block
> > > > > > > > all in flight IOCTLs
> > > > > > > > 
> > > > > > > > Also, add feature such that if device supports graceful unplug
> > > > > > > > we enclose entire IOCTL in SRCU critical section.
> > > > > > > > 
> > > > > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > > > 
> > > > > > > Nope.
> > > > > > > 
> > > > > > > The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
> > > > > 
> > > > > Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cf4c0568093cc462f625808d90bc23a3c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553751106596888%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PPKrQYBrgRMjpwlL0r8n5zenIhQMFWc6gniHgUTxTAY%3D&amp;reserved=0
> > > > > currently in code ?
> > > > 
> > > > I forgot about this one, again. Thanks for reminding.
> > > > 
> > > > > > > Especially not with an opt-in flag so that it could be shrugged of as a
> > > > > > > driver hack. Most of these ioctls should have absolutely no problem
> > > > > > > working after hotunplug.
> > > > > > > 
> > > > > > > Also, doing this defeats the point since it pretty much guarantees
> > > > > > > userspace will die in assert()s and stuff. E.g. on i915 the rough contract
> > > > > > > is that only execbuf (and even that only when userspace has indicated
> > > > > > > support for non-recoverable hw ctx) is allowed to fail. Anything else
> > > > > > > might crash userspace.
> > > > > 
> > > > > Given that as I pointed above we already fail any IOCTls with -ENODEV
> > > > > when device is unplugged, it seems those crashes don't happen that
> > > > > often ? Also, in all my testing I don't think I saw a user space crash
> > > > > I could attribute to this.
> > > > 
> > > > I guess it should be ok.
> > > 
> > > What should be ok ?
> > 
> > Your approach, but not your patch. If we go with this let's just lift it
> > to drm_ioctl() as the default behavior. No driver opt-in flag, because
> > that's definitely worse than any other approach because we really need to
> > get rid of driver specific behaviour for generic ioctls, especially
> > anything a compositor will use directly.
> > 
> > > > My reasons for making this work is both less trouble for userspace (did
> > > > you test with various wayland compositors out there, not just amdgpu x86
> > > 
> > > I didn't - will give it a try.
> 
> Weston worked without crashes, run the egl tester cube there.
> 
> > > 
> > > > driver?), but also testing.
> > > > 
> > > > We still need a bunch of these checks in various places or you'll wait a
> > > > very long time for a pending modeset or similar to complete. Being able to
> > > > run that code easily after hotunplug has completed should help a lot with
> > > > testing.
> > > > 
> > > > Plus various drivers already acquired drm_dev_enter/exit and now I wonder
> > > > whether that was properly tested or not ...
> > > > 
> > > > I guess maybe we need a drm module option to disable this check, so that
> > > > we can exercise the code as if the ioctl has raced with hotunplug at the
> > > > worst possible moment.
> > > > 
> > > > Also atomic is really tricky here: I assume your testing has just done
> > > > normal synchronous commits, but anything that goes through atomic can be
> > > > done nonblocking in a separate thread. Which the ioctl catch-all here wont
> > > > capture.
> > > 
> > > Yes, async commit was on my mind and thanks for reminding me. Indeed
> > > I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
> > > drm_dev_enter/exit. Note that i have a bunch of patches, all name's
> > > starting with 'Scope....' that just methodically put all the background
> > > work items and timers the drivers schedules in drm_dev_enter/exit scope.
> > > This was supposed to be part of the 'Scope Display code' patch.
> > 
> > That's too much. You still have to arrange that the flip completion event
> > gets sent out. So it's a bit tricky.
> > 
> > In other places the same problem applies, e.g. probe functions need to
> > make sure they report "disconnected".
> 
> I see, well, this is all part of KMS support which I defer for now
> anyway. Will tackle it then.
> 
> > 
> > > > > > > You probably need similar (and very precisely defined) rules for amdgpu.
> > > > > > > And those must definitely exclude any shard ioctls from randomly failing
> > > > > > > with EIO, because that just kills the box and defeats the point of trying
> > > > > > > to gracefully handling hotunplug and making sure userspace has a chance of
> > > > > > > survival. E.g. for atomic everything should continue, including flip
> > > > > > > completion, but we set all outputs to "disconnected" and send out the
> > > > > > > uevent. Maybe crtc enabling can fail too, but that can also be handled
> > > > > > > through the async status we're using to signal DP link failures to
> > > > > > > userspace.
> > > > > 
> > > > > As I pointed before, because of the complexity of the topic I prefer to
> > > > > take it step by step and solve first for secondary device use case, not
> > > > > for primary, display attached device.
> > > > 
> > > > Yeah makes sense. But then I think the right patch is to roll this out for
> > > > all drivers, properly justified with existing code. Not behind a driver
> > > > flag, because with all these different compositors the last thing we want
> > > > is a proliferation of driver-specific behaviour. That's imo the worst
> > > > option of all of them and needs to be avoided.
> > > 
> > > So this kind of patch would be acceptable to you if I unconditionally
> > > scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
> > > I am worried to break other drivers with this, see patch https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Ddrm-misc-next%26id%3Df0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cf4c0568093cc462f625808d90bc23a3c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553751106596888%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F3Jq6SvTm%2BZX7AVpaxEepfOj0C3O7%2Bo2Wm3y0gxrmKI%3D&amp;reserved=0
> > > Before setting drm_dev_unplug I go through a whole process of signalling
> > > all possible fences in the system which some one some where might be
> > > waiting on. My concern is that in the absence of HW those fences won't
> > > signal and so unless I signal them myself srcu_synchrionize in
> > > drm_dev_unplug will hang waiting for any such code scoped by
> > > drm_dev_enter/exit.
> > 
> > Uh right. I forgot about this.
> > 
> > Which would kinda mean the top level scope is maybe not the best idea, and
> > perhaps we should indeed drill it down. But then the testing issue
> > definitely gets a lot worse.
> > 
> > So what if we'd push that drm_dev_is_unplugged check down into ioctls?
> > Then we can make a case-by case decision whether it should be converted to
> > drm_dev_enter/exit, needs to be pushed down further into drivers (due to
> > fence wait issues) or other concerns?
> > 
> > Also I guess we need to have a subsystem wide rule on whether you need to
> > force complete all fences before you call drm_dev_unplug, or afterwards.
> 
> I don't see how you can handle it afterwards. If a thread is stuck in
> dma_fence_wait in non interruptible wait (any kernel thread) and with no
> timeout there is nothing you can do to stop the wait. Any such code
> scopped with drm_dev_enter/exit will cause a hang in drm_dev_unplug.
> The only way then is to preemptively force signal all such fences before
> calling drm_dev_unplug - as I do in the above mentioned patch.

Yeah, which is why I don't think top-level drm_dev_enter/exit is a good
idea.

> > If we have mixed behaviour on this there will be disappointment. And since
> > hotunplug and dma_fence completion are both userspace visible that
> > inconsistency might have bigger impact.
> > 
> > This is all very tricky indeed :-/
> > 
> > btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
> > with that: We could do the same trick we've done for DRM_UNLOCKED:
> > - drm_dev_enter/exit is called for any ioctl that has not set the
> >    DRM_HOTUNPLUG_SAFE flag
> > - for drm core ioctls we push them into all ioctls and decide how to
> >    handle/where (with the aim to have the least amount of code flow
> >    different during hotunplug vs after hotunplug has finished, to reduce
> >    testing scope)
> > - then we make DRM_HOTUNPLUG_SAFE the implied default
> > 
> > This would have us left with render ioctls, and I think the defensive
> > assumption there is that they're all hotunplug safe. We might hang on a
> > fence wait, but that's fixable, and it's better than blowing up on a
> > use-after-free security bug.
> > 
> > Thoughts?
> 
> I don't fully see a difference between the approach described above and
> the full drill down to each driver and even within the driver, to the HW
> back-ends - what criteria I would use to decide if for a given IOCTL i
> scope with drm_dev_enter/exit at the highest level while for another
> i go all the way down ? If we would agree that signaling the fences
> preemptively before engaging drm_dev_unplug is generically the right
> approach maybe we can then scope drm_ioctl unconditionally with
> drm_dev_enter/exit and then for each driver go through the same process
> I do for amdgpu - writing driver specific function which takes care of
> all the fences. We could then just create a drm callback which would
> be called from drm_ioctl before drm_dev_unplug is called.

So I see the appeal of just nuking all the fences, but I'm not sure that's
a good plan. We've done this in the old i915 gpu reset code too, and the
issue is it's defacto inverting the locking. But also the hw is truly
gone, so it also makes sense.

The problem is a bit roll-out, if we state that dma_fence_wait is allowed
with a drm_dev_enter/exit, then all drivers need to force-retire their
fences.

The other option would be that we require that dma_fence_wait is _not_
allowed in drm_dev_enter/exit, and that therefore these areas must be
marked up more fine-grained to avoid deadlocks. I like this more from the
testing aspect (it makes it easier to be reasonable sure your code handles
concurrent hotunplug), but also it's pretty easy to validate with the
dma_fence lockdep annotations we have I think.

A third reasons for not requiring force-retiring of dma_fence before
drm_dev_unplug is the races: Before drm_dev_unplug you haven't stopped new
fences from happening, but until you've stopped new fences it's hard to
guarantee they're all retired. How do you solve this currently.

Finally there's still hangcheck and all that, so if we go with forbidding
dma_fence_wait from within drm_dev_enter/exit sections, then drivers don't
need to have additional tricky code to force-retire fences. TDR will take
care already (albeit with maybe a slightly annoying long timeout, which
we can shorten to "time out everything immediately" after drm_dev_unplug).

What we definitely can't have is half the drivers doing it one way, and
the other half the other way. So your driver flag to wrap the ioctl
optionally in a drm_dev_enter/exit path is a no-go still I think.

I guess my tldr; is: I definitely see how your current approach gives
quicker results for amdgpu right now, but long term I'm seeing more
positives on the other one. At least I expect less special cases due to
hotunplug with that.

Cheers, Daniel

> 
> Andrey
> 
> > 
> > It is unfortunately even more work until we've reached the goal, but I
> > think it's safest and most flexible approach overall.
> > 
> > Cheers, Daniel
> > 
> > > 
> > > Andrey
> > > 
> > > > 
> > > > Cheers, Daniel
> > > > 
> > > > 
> > > > > 
> > > > > > > 
> > > > > > > I guess we should clarify this in the hotunplug doc?
> > > > > 
> > > > > Agree
> > > > > 
> > > > > > 
> > > > > > To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
> > > > > > really make no sense, and where we're rather confident that all properly
> > > > > > implemented userspace will gracefully handle failures. Like a modeset, or
> > > > > > opening a device, or trying to import a dma-buf or stuff like that which
> > > > > > can already fail in normal operation for any kind of reason.
> > > > > > 
> > > > > > But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
> > > > > > after hotunplug.
> > > > > 
> > > > > As I pointed above, this a bit confuses me given that we already do
> > > > > blanker rejection of IOCTLs if device is unplugged.
> > > > 
> > > > Well I'm confused about this too :-/
> > > > 
> > > > > > And then there's the middle ground, like doing a pageflip or buffer flush,
> > > > > > which I guess some userspace might handle, but risky to inflict those
> > > > > > consequences on them. atomic modeset is especially fun since depending
> > > > > > what you're doing it can be both "failures expected" and "failures not
> > > > > > really expected in normal operation".
> > > > > > 
> > > > > > Also, this really should be consistent across drivers, not solved with a
> > > > > > driver flag for every possible combination.
> > > > > > 
> > > > > > If you look at the current hotunplug kms drivers, they have
> > > > > > drm_dev_enter/exit sprinkled in specific hw callback functions because of
> > > > > > the above problems. But maybe it makes sense to change things in a few
> > > > > > cases. But then we should do it across the board.
> > > > > 
> > > > > So as I understand your preferred approach is that I scope any back_end, HW
> > > > > specific function with drm_dev_enter/exit because that where MMIO
> > > > > access takes place. But besides explicit MMIO access thorough
> > > > > register accessors in the HW back-end there is also indirect MMIO access
> > > > > taking place throughout the code in the driver because of various VRAM
> > > > > BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
> > > > > access is spread all over in the driver and even in mid-layers such as
> > > > > TTM and not limited to HW back-end functions. It means it's much harder
> > > > > to spot such places to surgically scope them with drm_dev_enter/exit and
> > > > > also that any new such code introduced will immediately break hot unplug
> > > > > because the developers can't be expected to remember making their code
> > > > > robust to this specific use case. That why when we discussed internally
> > > > > what approach to take to protecting code with drm_dev_enter/exit we
> > > > > opted for using the widest available scope.
> > > > 
> > > > The thing is, you kinda have to anyway. There's enormous amounts of
> > > > asynchronous processing going on. E.g. nonblocking atomic commits also do
> > > > ttm unpinning and fun stuff like that, which if you sync things wrong can
> > > > happen way late. So the door for bad fallout is wide open :-(
> > > > 
> > > > I'm not sure where the right tradeoff is to make sure we catch them all,
> > > > and can make sure with testing that we've indeed caught them all.
> > > > -Daniel
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
