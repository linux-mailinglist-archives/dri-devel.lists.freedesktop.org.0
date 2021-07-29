Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80A3DA2FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 14:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05C6ED80;
	Thu, 29 Jul 2021 12:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B856ED80
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:18:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so3895860wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=K4XS3jQDbEhTY4vhox2tdi5eMV9YDnW9YG1Sohr9u2s=;
 b=U63mBHus6cpWixWrdLqgH3fsIR0xA3Sg/F8vRn330H6P96Mp0QmZ7KiW0lbiqiSf5P
 pA5BMVC6ldBDPT0Sdpo3bgyujN3F1l993wnSO59bW+56hlfxOfCmd77puUhbxWpFhJgc
 IA4qXHHBGYM8AeNxjSwAGGJu05lE8fkvJXm6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=K4XS3jQDbEhTY4vhox2tdi5eMV9YDnW9YG1Sohr9u2s=;
 b=F95e3EqR07Srd/Wi4SXNsO9B8fUdlKuQ4WvCwCbRg3ywPaYFQnurzu+nITInoN9WfP
 wbkYhgC6vOO367o1uo2DaqE+El948CtW6yH1Fw5L891w1KQyUkBdSaiGj9D57NSDEXvZ
 P0HWdMiRI9aSFi65N53J0MfgmKeC29jf1/DqJOdy9oLBblAhPufPCbSeVNEdE4ISffEz
 7QPdG42lF0gP6ectMP5AYQu6Qw5HIbfmcvkA7vfW7TAIXqJV4TtPRgdNGUbGTVuNsHIG
 5THqLDuo0A+Zqogcv2lnlBq/DdXAYCwmXcW+UTdHN5opNjk4plh6NuAFWKu4HoU6gGQR
 q+nw==
X-Gm-Message-State: AOAM532PHQGpSVl7WHuEZo2e/NEIxf2Z14XQ58cMOOtGZkxk/cr1oXBt
 ZIMnTPinhmXKBBX1FjtObcZgKg==
X-Google-Smtp-Source: ABdhPJyQpJTA1ak/werqdV/qBjPra4SeA8v+xZEOpcOm43FkOHkPAROt99M4EftcdD3ZSY1URgB8Zg==
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr4429287wmq.137.1627561112158; 
 Thu, 29 Jul 2021 05:18:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v5sm3379855wrd.74.2021.07.29.05.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:18:31 -0700 (PDT)
Date: Thu, 29 Jul 2021 14:18:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <YQKclVvL+QeeL6cP@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>, Roy Sun <Roy.Sun@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
 <YQJUKXgf/Q957fmy@phenom.ffwll.local>
 <ff394f2b-b555-e80f-b685-d0d59e2bbe67@daenzer.net>
 <YQJu6AqKn7bdT1li@phenom.ffwll.local>
 <20210729123732.3259a9bf@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210729123732.3259a9bf@eldfell>
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

On Thu, Jul 29, 2021 at 12:37:32PM +0300, Pekka Paalanen wrote:
> On Thu, 29 Jul 2021 11:03:36 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Thu, Jul 29, 2021 at 10:17:43AM +0200, Michel Dänzer wrote:
> > > On 2021-07-29 9:09 a.m., Daniel Vetter wrote:  
> > > > On Wed, Jul 28, 2021 at 08:34:13AM -0700, Rob Clark wrote:  
> > > >> On Wed, Jul 28, 2021 at 6:24 AM Michel Dänzer <michel@daenzer.net> wrote:  
> > > >>> On 2021-07-28 3:13 p.m., Christian König wrote:  
> > > >>>> Am 28.07.21 um 15:08 schrieb Michel Dänzer:  
> > > >>>>> On 2021-07-28 1:36 p.m., Christian König wrote:  
> > > >>>>>> Am 27.07.21 um 17:37 schrieb Rob Clark:  
> > > >>>>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:  
> > > >>>>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:  
> > > >>>>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:  
> > > >>>>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:  
> > > >>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
> > > >>>>>>>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
> > > >>>>>>>>>>> callback, this approach adds a way to set a deadline on the fence, by
> > > >>>>>>>>>>> which the waiter would like to see the fence signalled.
> 
> ...
> 
> > > I'm not questioning that this approach helps when there's a direct
> > > chain of fences from the client to the page flip. I'm pointing out
> > > there will not always be such a chain.
> > > 
> > >   
> > > >> But maybe the solution to make this also useful for mutter  
> > > 
> > > It's not just mutter BTW. I understand gamescope has been doing
> > > this for some time already. And there seems to be consensus among
> > > developers of Wayland compositors that this is needed, so I expect
> > > at least all the major compositors to do this longer term.
> > > 
> > >   
> > > >> is to, once we have deadline support, extend it with an ioctl to
> > > >> the dma-fence fd so userspace can be the one setting the
> > > >> deadline.  
> > > 
> > > I was thinking in a similar direction.
> > >   
> > > > atomic ioctl with TEST_ONLY and SET_DEADLINES? Still gives mutter
> > > > the option to bail out with an old frame if it's too late?  
> > > 
> > > This is a bit cryptic though, can you elaborate?  
> > 
> > So essentially when the mutter compositor guesstimator is fairly
> > confident about the next frame's composition (recall you're keeping
> > track of clients to estimate their usual latency or something like
> > that), then it does a TEST_ONLY commit to check it all works and prep
> > the rendering, but _not_ yet fire it off.
> > 
> > Instead it waits until all buffers complete, and if some don't, pick
> > the previous one. Which I guess in an extreme case would mean you
> > need a different window tree configuration and maybe different
> > TEST_ONLY check and all that, not sure how you solve that.
> > 
> > Anyway, in that TEST_ONLY commit my idea is that you'd also supply
> > all the in-fences you expect to depend upon (maybe we need an
> > additional list of in-fences for your rendering job), plus a deadline
> > when you want to have them done (so that there's enough time for your
> > render job still). And the kernel then calls dma_fence_set_deadline
> > on all of them.
> > 
> > Pondering this more, maybe a separate ioctl is simpler where you just
> > supply a list of in-fences and deadlines.
> > 
> > The real reason I want to tie this to atomic is for priviledge
> > checking reasons. I don't think normal userspace should have the
> > power to set arbitrary deadlines like this - at least on i915 it will
> > also give you a slight priority boost and stuff like that, to make
> > sure your rendering for the current frame goes in ahead of the next
> > frame's prep work.
> > 
> > So maybe just a new ioctl that does this which is limited to the
> > current kms owner (aka drm_master)?
> 
> Yeah.
> 
> Why not have a Wayland compositor *always* "set the deadlines" for the
> next screen update as soon as it gets the wl_surface.commit with the
> new buffer and fences (a simplified description of what is actually
> necessary to take a new window state set into use)?

Yeah taht's probably best. And if the frame is scheduled (video at 24fps
or whatever) you can also immediately set the deadline for that too, just
a few frames later. Always minus compositor budget taken into account.

> The Wayland client posted the frame to the compositor, so surely it
> wants it ready and displayed ASAP. If we happen to have a Wayland frame
> queuing extension, then also take that into account when setting the
> deadline.
> 
> Then, *independently* of that, the compositor will choose which frames
> it will actually use in its composition when the time comes.
> 
> No need for any KMS atomic commit fiddling, userspace just explicitly
> sets the deadline on the fence and that's it. You could tie the
> privilege of setting deadlines to simply holding DRM master on whatever
> device? So the ioctl would need both the fence and any DRM device fd.

Yeah tying that up with atomic doesn't make sense.

> A rogue application opening a DRM device and becoming DRM master on it
> just to be able to abuse deadlines feels both unlikely and with
> insignificant consequences. It stops the obvious abuse, and if someone
> actually goes the extra effort, then so what.

With logind you can't become drm master just for lolz anymore, so I'm not
worried about that. On such systems only logind has the rights to access
the primary node, everyone doing headless goes through the render node.

So just limiting the deadline ioctl to current kms owner is imo perfectly
good enough for a security model.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
