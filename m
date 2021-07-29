Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C603DA001
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639076E0A6;
	Thu, 29 Jul 2021 09:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9639A6E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:03:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so3507796wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=tZq9WBpGzGj/xoxWMyN/SX4ni6yk9168UnPyM/0Pu34=;
 b=AgOpHAsmJFKpCTa9G83TzE3YLhb8hw1/WLLX5GEYl2dIt3c2XVR6jRyNGjmQrL0mzc
 9U0aqmLUNviZcK2p32T3jg7YnfWrHZ163m/SBQcIqMqQk+V2FiDxmnrxyimUBMwhFxCl
 hCAY9AmZwakr7XF570Xd7LOvwQekMkugfc8mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=tZq9WBpGzGj/xoxWMyN/SX4ni6yk9168UnPyM/0Pu34=;
 b=Ba2DzyV/Xs+46aCTCwwmn+GSsVrUs8fluHWG1LIHvH5DDwhKf9rlqN6rgTEq6optE6
 ZagmMdzNGUcq5rMT55UjJmWEzdVD8vOJSzk4tPUoru7b5crjLcB9KJGrRiHmvqGqcRVE
 D+hnqND4yzjOTeWKvNjKQpL9/TcFl/O5DaWlr4IDPmp7D1yGKkNCFeQe1DXnQdnWBQ6/
 X806Yq5xqjmK2Eo4YXBlqSgD2Ch8BncSpNnsKu//INAwmXGNbHPuc0X4gacmCiIDd27I
 GKMVx3jpsZr1k1nVJ9g8W8miSHD23jKtaRcvX8mLq0WUrGdaW3aO3wzfGlCcVUdwW0xb
 5T1g==
X-Gm-Message-State: AOAM5326iX51h6wUF6s1LARAdacB8F4aCW45GpLtq8WUWsuybkDNTDIU
 rbBOlYwifYWurVxm8NsyvQXZeg==
X-Google-Smtp-Source: ABdhPJxkrH/kywcVb0qmeLSL3TvP5lRMh3WKdA7FI/99yJ/devreqqfI/qopWniyN+YUr05awdgGLQ==
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr1261855wmz.174.1627549420023; 
 Thu, 29 Jul 2021 02:03:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm2435632wmi.29.2021.07.29.02.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 02:03:39 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:03:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <YQJu6AqKn7bdT1li@phenom.ffwll.local>
Mail-Followup-To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
 <YQJUKXgf/Q957fmy@phenom.ffwll.local>
 <ff394f2b-b555-e80f-b685-d0d59e2bbe67@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff394f2b-b555-e80f-b685-d0d59e2bbe67@daenzer.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Roy Sun <Roy.Sun@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 10:17:43AM +0200, Michel Dänzer wrote:
> On 2021-07-29 9:09 a.m., Daniel Vetter wrote:
> > On Wed, Jul 28, 2021 at 08:34:13AM -0700, Rob Clark wrote:
> >> On Wed, Jul 28, 2021 at 6:24 AM Michel Dänzer <michel@daenzer.net> wrote:
> >>> On 2021-07-28 3:13 p.m., Christian König wrote:
> >>>> Am 28.07.21 um 15:08 schrieb Michel Dänzer:
> >>>>> On 2021-07-28 1:36 p.m., Christian König wrote:
> >>>>>> Am 27.07.21 um 17:37 schrieb Rob Clark:
> >>>>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:
> >>>>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
> >>>>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:
> >>>>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> >>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>>>
> >>>>>>>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
> >>>>>>>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
> >>>>>>>>>>> callback, this approach adds a way to set a deadline on the fence, by
> >>>>>>>>>>> which the waiter would like to see the fence signalled.
> >>>>>>>>>>>
> >>>>>>>>>>> I've not yet had a chance to re-work the drm/msm part of this, but
> >>>>>>>>>>> wanted to send this out as an RFC in case I don't have a chance to
> >>>>>>>>>>> finish the drm/msm part this week.
> >>>>>>>>>>>
> >>>>>>>>>>> Original description:
> >>>>>>>>>>>
> >>>>>>>>>>> In some cases, like double-buffered rendering, missing vblanks can
> >>>>>>>>>>> trick the GPU into running at a lower frequence, when really we
> >>>>>>>>>>> want to be running at a higher frequency to not miss the vblanks
> >>>>>>>>>>> in the first place.
> >>>>>>>>>>>
> >>>>>>>>>>> This is partially inspired by a trick i915 does, but implemented
> >>>>>>>>>>> via dma-fence for a couple of reasons:
> >>>>>>>>>>>
> >>>>>>>>>>> 1) To continue to be able to use the atomic helpers
> >>>>>>>>>>> 2) To support cases where display and gpu are different drivers
> >>>>>>>>>>>
> >>>>>>>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eYaSOSS5wOngNAd9wufp5eWCx5GtAwo6GkultJgrjmA%3D&amp;reserved=0
> >>>>>>>>>> Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmerge_requests%2F1880&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1ZkOzLqbiKSyCixGZ0u7Hd%2Fc1YnUZub%2F%2Fx7RuEclFKg%3D&amp;reserved=0 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).
> >>>>>>>>>>
> >>>>>>>>> I guess you mean "no effect at all *except* for fullscreen..."?
> >>>>>>>> I meant what I wrote: The compositor will wait for the next buffer to become idle, so there's no boost from this mechanism for the client drawing to that buffer. And since the compositor does no drawing of its own in this case, there's no boost from that either.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> I'd perhaps recommend that wayland compositors, in cases where only a
> >>>>>>>>> single layer is changing, not try to be clever and just push the
> >>>>>>>>> update down to the kernel.
> >>>>>>>> Even just for the fullscreen direct scanout case, that would require some kind of atomic KMS API extension to allow queuing multiple page flips for the same CRTC.
> >>>>>>>>
> >>>>>>>> For other cases, this would also require a mechanism to cancel a pending atomic commit, for when another surface update comes in before the compositor's deadline, which affects the previously single updating surface as well.
> >>>>>>>>
> >>>>>>> Well, in the end, there is more than one compositor out there.. and if
> >>>>>>> some wayland compositors are going this route, they can also implement
> >>>>>>> the same mechanism in userspace using the sysfs that devfreq exports.
> >>>>>>>
> >>>>>>> But it sounds simpler to me for the compositor to have a sort of "game
> >>>>>>> mode" for fullscreen games.. I'm less worried about UI interactive
> >>>>>>> workloads, boosting the GPU freq upon sudden activity after a period
> >>>>>>> of inactivity seems to work reasonably well there.
> >>>>>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
> >>>>>>
> >>>>>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
> >>>>>>
> >>>>>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
> >>>>> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
> >>>>>
> >>>>> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
> >>>>
> >>>> Well then let's extend the KMS API instead of hacking together workarounds in userspace.
> >>>
> >>> That's indeed a possible solution for the fullscreen / direct scanout case.
> >>>
> >>> Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.
> >>
> >> I think solving the fullscreen game case is sufficient enough forward
> >> progress to be useful.  And the results I'm seeing[1] are sufficiently
> >> positive to convince me that dma-fence deadline support is the right
> >> thing to do.
> 
> I'm not questioning that this approach helps when there's a direct chain of fences from the client to the page flip. I'm pointing out there will not always be such a chain.
> 
> 
> >> But maybe the solution to make this also useful for mutter
> 
> It's not just mutter BTW. I understand gamescope has been doing this for some time already. And there seems to be consensus among developers of Wayland compositors that this is needed, so I expect at least all the major compositors to do this longer term.
> 
> 
> >> is to, once we have deadline support, extend it with an ioctl to the
> >> dma-fence fd so userspace can be the one setting the deadline.
> 
> I was thinking in a similar direction.
> 
> > atomic ioctl with TEST_ONLY and SET_DEADLINES? Still gives mutter the
> > option to bail out with an old frame if it's too late?
> 
> This is a bit cryptic though, can you elaborate?

So essentially when the mutter compositor guesstimator is fairly confident
about the next frame's composition (recall you're keeping track of clients
to estimate their usual latency or something like that), then it does a
TEST_ONLY commit to check it all works and prep the rendering, but _not_
yet fire it off.

Instead it waits until all buffers complete, and if some don't, pick the
previous one. Which I guess in an extreme case would mean you need a
different window tree configuration and maybe different TEST_ONLY check
and all that, not sure how you solve that.

Anyway, in that TEST_ONLY commit my idea is that you'd also supply all the
in-fences you expect to depend upon (maybe we need an additional list of
in-fences for your rendering job), plus a deadline when you want to have
them done (so that there's enough time for your render job still). And the
kernel then calls dma_fence_set_deadline on all of them.

Pondering this more, maybe a separate ioctl is simpler where you just
supply a list of in-fences and deadlines.

The real reason I want to tie this to atomic is for priviledge checking
reasons. I don't think normal userspace should have the power to set
arbitrary deadlines like this - at least on i915 it will also give you a
slight priority boost and stuff like that, to make sure your rendering for
the current frame goes in ahead of the next frame's prep work.

So maybe just a new ioctl that does this which is limited to the current
kms owner (aka drm_master)?

In i915 we also do a mild boost for when userspace waits on a buffer
(assuming it's blocking the cpu), but that boost has a pretty sharp
decay/cooldown to prevent abuse and keeping the gpu artificially
upclocked. That really is just meant to avoid the tailspin when you have a
ping-pong workload between gpu and cpu and both downclock in turn because
the other side is too slow and the gpu/cpu aren't really busy enough.
Until you're crawling at idle clocks getting nothing done.

I think on the windows side they "fix" this by making the clock
adjustments extremely conservative and slow (except when they detect that
it's a game/benchmark). Good enough for battery tests, not so great in
reality.
-Daniel

> > Also mutter would need to supply the deadline, because we need to fit the
> > rendering in still before the actual flip. So gets a bit quirky maybe ...
> 
> That should be fine. mutter is already keeping track of how long its rendering takes.
> 
> 
> -- 
> Earthling Michel Dänzer               |               https://redhat.com
> Libre software enthusiast             |             Mesa and X developer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
