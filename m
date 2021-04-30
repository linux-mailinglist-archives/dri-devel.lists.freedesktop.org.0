Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB336F86D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 12:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1AE6EDC3;
	Fri, 30 Apr 2021 10:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF176EDB2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 10:25:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x7so69916244wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ozsXPzzhfZHnpsS/UEX8ejqsffrnIoj1rgzZ/bFBFO8=;
 b=UFrsyDG6lNI73MCbks2ObBYXo69ERwCBdhmrSrq5gC3SS1fPg/Y0a3Kyja3oiWuniF
 VawscbikJ/AGsNrfIQO4ymZ4YGesy/wre+p1nws9q6dvidNRPugiMmubUcvE4Bzb+3Ak
 DeiBDUOFktIMGmjy2BgwRMxwtYrJ8hIKB5RQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ozsXPzzhfZHnpsS/UEX8ejqsffrnIoj1rgzZ/bFBFO8=;
 b=M7ELHcPzcdqYfLEFXGhY2mvCADE6VMP4wTzSEjebUjmR/0SUw0Q+Yr1zUPmf5h3keo
 cIMDB2QsmdmaKVgl8Py0ONSa0F9dy572wxrTKLUvHqY+inXcgr5O2aqfgakcEyQOSmKL
 BOliIPr/dM8isJiqdepi4BSi+D65A1ndJHptychhOYA5WCQ51rGB9IFhS+oRDrvkCZF/
 qs/+v/nV8ynUBeJJmJo3TwhodRP8UVzqNCO9gA6eSj91cJsgT956DTwoPgirYeYBU7y5
 xpKeguDYgtYWuFCz7KH2jDwHWxuMBVE5wv1gw4T4zIgAQy6ZsoWealyJJLduE37Stfqx
 BppQ==
X-Gm-Message-State: AOAM530lgN/xnIdISGOBipmfcGbANPwFkV8hxKrv6vNYNl34c/r33f8Z
 l1bPLhxqICJUM/RASJD6cNYFOg==
X-Google-Smtp-Source: ABdhPJxBBwomHxieZwxXqbxTtfPHFLL66rZnpjbeSe+KX5/rnvoDXrbR8TILRrVILBwn6z4bUyBw5A==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr5918877wrw.108.1619778306842; 
 Fri, 30 Apr 2021 03:25:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm12791901wmc.22.2021.04.30.03.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:25:06 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:25:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
Message-ID: <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
 <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
 <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 04:34:55PM -0400, Andrey Grodzovsky wrote:
> 
> 
> On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
> > On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
> > > 
> > > 
> > > On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
> > > > On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
> > > > > On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
> > > > > > With this calling drm_dev_unplug will flush and block
> > > > > > all in flight IOCTLs
> > > > > > 
> > > > > > Also, add feature such that if device supports graceful unplug
> > > > > > we enclose entire IOCTL in SRCU critical section.
> > > > > > 
> > > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > 
> > > > > Nope.
> > > > > 
> > > > > The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
> > > 
> > > Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C1821a19173a84ebae31108d90b41b2fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553199084555468%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=d6kXadWHv4CEDgODsm%2FOzIIjIDA9rZDLUuV11MmEU3A%3D&amp;reserved=0
> > > currently in code ?
> > 
> > I forgot about this one, again. Thanks for reminding.
> > 
> > > > > Especially not with an opt-in flag so that it could be shrugged of as a
> > > > > driver hack. Most of these ioctls should have absolutely no problem
> > > > > working after hotunplug.
> > > > > 
> > > > > Also, doing this defeats the point since it pretty much guarantees
> > > > > userspace will die in assert()s and stuff. E.g. on i915 the rough contract
> > > > > is that only execbuf (and even that only when userspace has indicated
> > > > > support for non-recoverable hw ctx) is allowed to fail. Anything else
> > > > > might crash userspace.
> > > 
> > > Given that as I pointed above we already fail any IOCTls with -ENODEV
> > > when device is unplugged, it seems those crashes don't happen that
> > > often ? Also, in all my testing I don't think I saw a user space crash
> > > I could attribute to this.
> > 
> > I guess it should be ok.
> 
> What should be ok ?

Your approach, but not your patch. If we go with this let's just lift it
to drm_ioctl() as the default behavior. No driver opt-in flag, because
that's definitely worse than any other approach because we really need to
get rid of driver specific behaviour for generic ioctls, especially
anything a compositor will use directly.

> > My reasons for making this work is both less trouble for userspace (did
> > you test with various wayland compositors out there, not just amdgpu x86
> 
> I didn't - will give it a try.
> 
> > driver?), but also testing.
> > 
> > We still need a bunch of these checks in various places or you'll wait a
> > very long time for a pending modeset or similar to complete. Being able to
> > run that code easily after hotunplug has completed should help a lot with
> > testing.
> > 
> > Plus various drivers already acquired drm_dev_enter/exit and now I wonder
> > whether that was properly tested or not ...
> > 
> > I guess maybe we need a drm module option to disable this check, so that
> > we can exercise the code as if the ioctl has raced with hotunplug at the
> > worst possible moment.
> > 
> > Also atomic is really tricky here: I assume your testing has just done
> > normal synchronous commits, but anything that goes through atomic can be
> > done nonblocking in a separate thread. Which the ioctl catch-all here wont
> > capture.
> 
> Yes, async commit was on my mind and thanks for reminding me. Indeed
> I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
> drm_dev_enter/exit. Note that i have a bunch of patches, all name's
> starting with 'Scope....' that just methodically put all the background
> work items and timers the drivers schedules in drm_dev_enter/exit scope.
> This was supposed to be part of the 'Scope Display code' patch.

That's too much. You still have to arrange that the flip completion event
gets sent out. So it's a bit tricky.

In other places the same problem applies, e.g. probe functions need to
make sure they report "disconnected".

> > > > > You probably need similar (and very precisely defined) rules for amdgpu.
> > > > > And those must definitely exclude any shard ioctls from randomly failing
> > > > > with EIO, because that just kills the box and defeats the point of trying
> > > > > to gracefully handling hotunplug and making sure userspace has a chance of
> > > > > survival. E.g. for atomic everything should continue, including flip
> > > > > completion, but we set all outputs to "disconnected" and send out the
> > > > > uevent. Maybe crtc enabling can fail too, but that can also be handled
> > > > > through the async status we're using to signal DP link failures to
> > > > > userspace.
> > > 
> > > As I pointed before, because of the complexity of the topic I prefer to
> > > take it step by step and solve first for secondary device use case, not
> > > for primary, display attached device.
> > 
> > Yeah makes sense. But then I think the right patch is to roll this out for
> > all drivers, properly justified with existing code. Not behind a driver
> > flag, because with all these different compositors the last thing we want
> > is a proliferation of driver-specific behaviour. That's imo the worst
> > option of all of them and needs to be avoided.
> 
> So this kind of patch would be acceptable to you if I unconditionally
> scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
> I am worried to break other drivers with this, see patch https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=drm-misc-next&id=f0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6
> Before setting drm_dev_unplug I go through a whole process of signalling
> all possible fences in the system which some one some where might be
> waiting on. My concern is that in the absence of HW those fences won't
> signal and so unless I signal them myself srcu_synchrionize in
> drm_dev_unplug will hang waiting for any such code scoped by
> drm_dev_enter/exit.

Uh right. I forgot about this.

Which would kinda mean the top level scope is maybe not the best idea, and
perhaps we should indeed drill it down. But then the testing issue
definitely gets a lot worse.

So what if we'd push that drm_dev_is_unplugged check down into ioctls?
Then we can make a case-by case decision whether it should be converted to
drm_dev_enter/exit, needs to be pushed down further into drivers (due to
fence wait issues) or other concerns?

Also I guess we need to have a subsystem wide rule on whether you need to
force complete all fences before you call drm_dev_unplug, or afterwards.
If we have mixed behaviour on this there will be disappointment. And since
hotunplug and dma_fence completion are both userspace visible that
inconsistency might have bigger impact.

This is all very tricky indeed :-/

btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
with that: We could do the same trick we've done for DRM_UNLOCKED:
- drm_dev_enter/exit is called for any ioctl that has not set the
  DRM_HOTUNPLUG_SAFE flag
- for drm core ioctls we push them into all ioctls and decide how to
  handle/where (with the aim to have the least amount of code flow
  different during hotunplug vs after hotunplug has finished, to reduce
  testing scope)
- then we make DRM_HOTUNPLUG_SAFE the implied default

This would have us left with render ioctls, and I think the defensive
assumption there is that they're all hotunplug safe. We might hang on a
fence wait, but that's fixable, and it's better than blowing up on a
use-after-free security bug.

Thoughts?

It is unfortunately even more work until we've reached the goal, but I
think it's safest and most flexible approach overall.

Cheers, Daniel

> 
> Andrey
> 
> > 
> > Cheers, Daniel
> > 
> > 
> > > 
> > > > > 
> > > > > I guess we should clarify this in the hotunplug doc?
> > > 
> > > Agree
> > > 
> > > > 
> > > > To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
> > > > really make no sense, and where we're rather confident that all properly
> > > > implemented userspace will gracefully handle failures. Like a modeset, or
> > > > opening a device, or trying to import a dma-buf or stuff like that which
> > > > can already fail in normal operation for any kind of reason.
> > > > 
> > > > But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
> > > > after hotunplug.
> > > 
> > > As I pointed above, this a bit confuses me given that we already do
> > > blanker rejection of IOCTLs if device is unplugged.
> > 
> > Well I'm confused about this too :-/
> > 
> > > > And then there's the middle ground, like doing a pageflip or buffer flush,
> > > > which I guess some userspace might handle, but risky to inflict those
> > > > consequences on them. atomic modeset is especially fun since depending
> > > > what you're doing it can be both "failures expected" and "failures not
> > > > really expected in normal operation".
> > > > 
> > > > Also, this really should be consistent across drivers, not solved with a
> > > > driver flag for every possible combination.
> > > > 
> > > > If you look at the current hotunplug kms drivers, they have
> > > > drm_dev_enter/exit sprinkled in specific hw callback functions because of
> > > > the above problems. But maybe it makes sense to change things in a few
> > > > cases. But then we should do it across the board.
> > > 
> > > So as I understand your preferred approach is that I scope any back_end, HW
> > > specific function with drm_dev_enter/exit because that where MMIO
> > > access takes place. But besides explicit MMIO access thorough
> > > register accessors in the HW back-end there is also indirect MMIO access
> > > taking place throughout the code in the driver because of various VRAM
> > > BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
> > > access is spread all over in the driver and even in mid-layers such as
> > > TTM and not limited to HW back-end functions. It means it's much harder
> > > to spot such places to surgically scope them with drm_dev_enter/exit and
> > > also that any new such code introduced will immediately break hot unplug
> > > because the developers can't be expected to remember making their code
> > > robust to this specific use case. That why when we discussed internally
> > > what approach to take to protecting code with drm_dev_enter/exit we
> > > opted for using the widest available scope.
> > 
> > The thing is, you kinda have to anyway. There's enormous amounts of
> > asynchronous processing going on. E.g. nonblocking atomic commits also do
> > ttm unpinning and fun stuff like that, which if you sync things wrong can
> > happen way late. So the door for bad fallout is wide open :-(
> > 
> > I'm not sure where the right tradeoff is to make sure we catch them all,
> > and can make sure with testing that we've indeed caught them all.
> > -Daniel
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
