Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E113D9E16
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74286ECA8;
	Thu, 29 Jul 2021 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10776ECA8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:09:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so3268876wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=khztsyA4Xuq7DRmcu1TTIQSEqbeknz6KE3Dd7p8lqds=;
 b=eNqhijdJE6YymsOWQNdQAKIichpS9gzs5UZJ5KEg72L0Qy0bH+bjxXNwqRhGnCSjeJ
 z1HW2e6dz3O6Uro8Kq2CIQkN/upTMdWNslpyIeHOnfU6aYHt5rSUfX0JXslPILUyx8JB
 y6U+8Bigu0samzmf9KR2Da6cUt6TRctYFyh4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=khztsyA4Xuq7DRmcu1TTIQSEqbeknz6KE3Dd7p8lqds=;
 b=i5go2082iQTYyCg5+9C1blvlvDdYekZc87CPEbBnomTPGdCGUOCBw/l7VsnHRD6XyV
 8rvxoMNcEUawz40XrHtkS4qPS2HHU8FeFYhthmmI5Ne6nszwW3u5gxED64OuyDccoUPj
 Ec+iCNxYOaR9qsRyS01xHKqgV9U0+aO6bLsxOS25XT2MfvnjkMHgK6mOOm0hOtAWlau1
 9vX44DglSTxCcrZpbr8OeSyf9/fIZmgq4h4AGJYIc/FEHJUMRI4uhzc4XVaKKSQHcih/
 2Nj7pkTKlRdZw317JSnxhQbL7fv7AEqeuZvsq9sG/qsXUQiwk5YufnxSmn05rVJ/4e+m
 LZ3A==
X-Gm-Message-State: AOAM530f+vpBm/HoUD+rQCUda1B9GkbNJEGo72zLL01tbkHoP+ibbldn
 Yy9uRcj8iGMlm9x4zad3cNEMFA==
X-Google-Smtp-Source: ABdhPJya6t37/zP2fn+AGgoQScAbX8dTg7R2sruxHnwfNx/V6dol3NlRy/0ereppDACVsUfqIPeycg==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr3193113wmh.113.1627542572057; 
 Thu, 29 Jul 2021 00:09:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t17sm2188136wru.94.2021.07.29.00.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:09:31 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:09:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <YQJUKXgf/Q957fmy@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
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
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
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
 Jack Zhang <Jack.Zhang1@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 08:34:13AM -0700, Rob Clark wrote:
> On Wed, Jul 28, 2021 at 6:24 AM Michel Dänzer <michel@daenzer.net> wrote:
> >
> > On 2021-07-28 3:13 p.m., Christian König wrote:
> > > Am 28.07.21 um 15:08 schrieb Michel Dänzer:
> > >> On 2021-07-28 1:36 p.m., Christian König wrote:
> > >>> Am 27.07.21 um 17:37 schrieb Rob Clark:
> > >>>> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:
> > >>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
> > >>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:
> > >>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> > >>>>>>>> From: Rob Clark <robdclark@chromium.org>
> > >>>>>>>>
> > >>>>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
> > >>>>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
> > >>>>>>>> callback, this approach adds a way to set a deadline on the fence, by
> > >>>>>>>> which the waiter would like to see the fence signalled.
> > >>>>>>>>
> > >>>>>>>> I've not yet had a chance to re-work the drm/msm part of this, but
> > >>>>>>>> wanted to send this out as an RFC in case I don't have a chance to
> > >>>>>>>> finish the drm/msm part this week.
> > >>>>>>>>
> > >>>>>>>> Original description:
> > >>>>>>>>
> > >>>>>>>> In some cases, like double-buffered rendering, missing vblanks can
> > >>>>>>>> trick the GPU into running at a lower frequence, when really we
> > >>>>>>>> want to be running at a higher frequency to not miss the vblanks
> > >>>>>>>> in the first place.
> > >>>>>>>>
> > >>>>>>>> This is partially inspired by a trick i915 does, but implemented
> > >>>>>>>> via dma-fence for a couple of reasons:
> > >>>>>>>>
> > >>>>>>>> 1) To continue to be able to use the atomic helpers
> > >>>>>>>> 2) To support cases where display and gpu are different drivers
> > >>>>>>>>
> > >>>>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eYaSOSS5wOngNAd9wufp5eWCx5GtAwo6GkultJgrjmA%3D&amp;reserved=0
> > >>>>>>> Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmerge_requests%2F1880&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1ZkOzLqbiKSyCixGZ0u7Hd%2Fc1YnUZub%2F%2Fx7RuEclFKg%3D&amp;reserved=0 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).
> > >>>>>>>
> > >>>>>> I guess you mean "no effect at all *except* for fullscreen..."?
> > >>>>> I meant what I wrote: The compositor will wait for the next buffer to become idle, so there's no boost from this mechanism for the client drawing to that buffer. And since the compositor does no drawing of its own in this case, there's no boost from that either.
> > >>>>>
> > >>>>>
> > >>>>>> I'd perhaps recommend that wayland compositors, in cases where only a
> > >>>>>> single layer is changing, not try to be clever and just push the
> > >>>>>> update down to the kernel.
> > >>>>> Even just for the fullscreen direct scanout case, that would require some kind of atomic KMS API extension to allow queuing multiple page flips for the same CRTC.
> > >>>>>
> > >>>>> For other cases, this would also require a mechanism to cancel a pending atomic commit, for when another surface update comes in before the compositor's deadline, which affects the previously single updating surface as well.
> > >>>>>
> > >>>> Well, in the end, there is more than one compositor out there.. and if
> > >>>> some wayland compositors are going this route, they can also implement
> > >>>> the same mechanism in userspace using the sysfs that devfreq exports.
> > >>>>
> > >>>> But it sounds simpler to me for the compositor to have a sort of "game
> > >>>> mode" for fullscreen games.. I'm less worried about UI interactive
> > >>>> workloads, boosting the GPU freq upon sudden activity after a period
> > >>>> of inactivity seems to work reasonably well there.
> > >>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
> > >>>
> > >>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
> > >>>
> > >>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
> > >> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
> > >>
> > >> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
> > >
> > > Well then let's extend the KMS API instead of hacking together workarounds in userspace.
> >
> > That's indeed a possible solution for the fullscreen / direct scanout case.
> >
> > Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.
> >
> 
> I think solving the fullscreen game case is sufficient enough forward
> progress to be useful.  And the results I'm seeing[1] are sufficiently
> positive to convince me that dma-fence deadline support is the right
> thing to do.
> 
> But maybe the solution to make this also useful for mutter is to, once
> we have deadline support, extend it with an ioctl to the dma-fence fd
> so userspace can be the one setting the deadline.

atomic ioctl with TEST_ONLY and SET_DEADLINES? Still gives mutter the
option to bail out with an old frame if it's too late?

Also mutter would need to supply the deadline, because we need to fit the
rendering in still before the actual flip. So gets a bit quirky maybe ...
-Daniel
> 
> [1] https://patchwork.freedesktop.org/patch/447138/
> 
> BR,
> -R

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
