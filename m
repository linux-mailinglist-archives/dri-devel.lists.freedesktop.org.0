Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7474DCC53
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8C10E67C;
	Thu, 17 Mar 2022 17:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F349410E67F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:23:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so3545347wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oqyywNMRAsscGujJTuGQYDrwpZtKNn+Ebf019FA+ycE=;
 b=W/TLt7+cvhxXX5oJ7Oz2acoguoZpzbGmEfkYmBANhpfRCxaF9Zq6tKpv13hoivEpEQ
 9IKCHpRPYBMXAYxep7ZZZpNtMT4jpucCw02QpiTY7I/SiGEiI84DlhkzaYVEe25M3lVr
 vQVHzWIeKkVP5fOXg3Iowl/epP5BIndCm1Aug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oqyywNMRAsscGujJTuGQYDrwpZtKNn+Ebf019FA+ycE=;
 b=Ot4ZItlxiaq+X5OxzoIweADTniHChNrx6fsgZLi0ikl1tT7QlRNV6RzKIA0eI9Fod2
 7PndwdwO6nSIE/WVbY/pSoFNKPIaGAJkQ1X/zr1f76WEbvos3zcNnrR2zjAN/IcsR/sp
 KmFDclNCsDDeiYcBvC1f7Y/4IeUpo2RxmYevT2jM6SBvGlhMAu4it5TR0av+sd/Fhc1c
 XJJFOkQFMh5W3I0RqIMbwZHAqyXxDZ51Fiso3Gg1COr2ebgBvZILnqNSGzdL0Pfom1WP
 kKVBnq9Fz7lvdddn3OErpPzDL7/5EnFhHAH7j1/dqrEygkbMXKuuYXpPEOXX0fuUKhfc
 P4pg==
X-Gm-Message-State: AOAM5331AR7DRpV1owG9iYbt2KcbYBQ9Xijjd1GN87AxwLnsJgx3r7Vf
 t/emq79mAzzSpqA5FbILxGZX+g==
X-Google-Smtp-Source: ABdhPJxHUmOkc3z9QO/kMhayRnxJ0eeit5nqIofeyFEiWlUMpyE9a2wKvA2U0rgrrh9Vqzhl0+QTYg==
X-Received: by 2002:a05:600c:4796:b0:386:45aa:667b with SMTP id
 k22-20020a05600c479600b0038645aa667bmr5005550wmo.104.1647537825417; 
 Thu, 17 Mar 2022 10:23:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b001f0620ecb3csm4612244wrt.40.2022.03.17.10.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 10:23:44 -0700 (PDT)
Date: Thu, 17 Mar 2022 18:23:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <YjNunvEn0EGjQY1W@phenom.ffwll.local>
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGtUasyC1e0Fz2cFhSMEtUJCJTsFQs7+4mg_FP45LwX=4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtUasyC1e0Fz2cFhSMEtUJCJTsFQs7+4mg_FP45LwX=4A@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 08:34:21AM -0700, Rob Clark wrote:
> On Thu, Mar 17, 2022 at 2:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Mar 17, 2022 at 08:03:27AM +0100, Christian König wrote:
> > > Am 16.03.22 um 16:36 schrieb Rob Clark:
> > > > [SNIP]
> > > > just one point of clarification.. in the msm and i915 case it is
> > > > purely for debugging and telemetry (ie. sending crash logs back to
> > > > distro for analysis if user has crash reporting enabled).. it isn't
> > > > used for triggering any action like killing app or compositor.
> > >
> > > By the way, how does msm it's memory management for the devcoredumps?
> >
> > GFP_NORECLAIM all the way. It's purely best effort.
> 
> We do one GEM obj allocation in the snapshot path (the hw has a
> mechanism to snapshot it's own state into a gpu buffer.. not sure if
> nice debugging functionality like that is a commentary on the blob
> driver quality, but I'm not complaining)
> 
> I suppose we could pre-allocate this buffer up-front.. but it doesn't
> seem like a problem, ie. if allocation fails we just skip snapshotting
> stuff that needs the hw crashdumper.  I guess since vram is not
> involved, perhaps that makes the situation a bit more straightforward.

The problem is that you need to allocate with GFP_ATOMIC, instead of
GFP_KERNEL, or things go very bad.

The scheduler dma-fence annotations I've had (well still have them here)
would catch this stuff, but thus far they got nowhere.

> > Note that the fancy new plan for i915 discrete gpu is to only support gpu
> > crash dumps on non-recoverable gpu contexts, i.e. those that do not
> > continue to the next batch when something bad happens. This is what vk
> > wants and also what iris now uses (we do context recovery in userspace in
> > all cases), and non-recoverable contexts greatly simplify the crash dump
> > gather: Only thing you need to gather is the register state from hw
> > (before you reset it), all the batchbuffer bo and indirect state bo (in
> > i915 you can mark which bo to capture in the CS ioctl) can be captured in
> > a worker later on. Which for non-recoverable context is no issue, since
> > subsequent batchbuffers won't trample over any of these things.
> >
> > And that way you can record the crashdump (or at least the big pieces like
> > all the indirect state stuff) with GFP_KERNEL.
> >
> > msm probably gets it wrong since embedded drivers have much less shrinker
> > and generally no mmu notifiers going on :-)
> 
> Note that the bo's associated with the batch are still pinned at this
> point, from the bo lifecycle the batch is still active.  So from the
> point of view of shrinker, there should be no interaction.  We aren't
> doing anything with mmu notifiers (yet), so not entirely sure offhand
> the concern there.
> 
> Currently we just use GFP_KERNEL and bail if allocation fails.

Yeah you have a simple enough shrinker for this not to be a problem. The
issue is that sooner or later things tend to not stay like that, and we're
trying to have common rules for dma_fence to make sure everyone follows
the same rules.
-Daniel

> 
> BR,
> -R
> 
> > > I mean it is strictly forbidden to allocate any memory in the GPU reset
> > > path.
> > >
> > > > I would however *strongly* recommend devcoredump support in other GPU
> > > > drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> > > > to debug and fix a couple obscure issues that I was not able to
> > > > reproduce by myself.
> > >
> > > Yes, completely agree as well.
> >
> > +1
> >
> > Cheers, Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
