Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81241DC12
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8EA6E40C;
	Thu, 30 Sep 2021 14:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92F26E40C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:13:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 r11-20020a1c440b000000b0030cf0f01fbaso1831929wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AKyFNcBtjFGQl6Qx7WoS3hNUd3yQzUTuxsyEEuLPSQ4=;
 b=jIDgkZ1tv3CRXzbBdkJX0XmY4y9tD36LfnPnZuGeHsi1NxReSacvqsDHJQ8dGp8Leh
 j8DsOYiG03428+upMwoKcJPFOjepge6uuhiK+iKCpbG7KCy5HpbK4EVg5qeorNooEMb1
 S4MHTKqkee2uqMMFyrMQsiUjR3cDtmm2WoGns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AKyFNcBtjFGQl6Qx7WoS3hNUd3yQzUTuxsyEEuLPSQ4=;
 b=aQImnISHIYrX6JCw74pHCNWTsD3/W+DfDRIF9MGon101f8ZE8Mu+8nyn+1PvrhiMFy
 v234Mi2x2OGcErehhJ33b/Fh4TxsaZs78bXSDIiiiXr2LVMzz7z22m1QnHHvJRHEgmOb
 NXc2t8KfE3fTYyFKAM6U9PeqagwaTYTQbtv2Wa2BFZRkAwkHRay5gmDhpij4SaFUgsm8
 DWGqaJrZd0uiT3VzH21H2fgpM42OZ/eNMDMTJJhuvHh+q6/tOyesteQ0WITyVIpPDQLo
 2N4dHNduJ8iDqsleL7pofX7mcxGt6DHjIzYQGpclas0HPSrx3Bg3x4Yy/3ooJlHA8yZm
 JrWw==
X-Gm-Message-State: AOAM531X++gelE7PAGDkw6agrRgteZg+vr2p47YmEcggXyHYiNM3brKf
 WWkEd6qtSqVdReKug3qw+FaLPQ==
X-Google-Smtp-Source: ABdhPJzsR43jijxK6ET4AD3ZwsnZU5LOojEvNlmn+FMwJ6gevLgU5jXfpt3Jxm8Z7KBbcOcmHeQ1Sw==
X-Received: by 2002:a1c:192:: with SMTP id 140mr5555221wmb.186.1633011221245; 
 Thu, 30 Sep 2021 07:13:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x21sm4928651wmc.14.2021.09.30.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:13:40 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:13:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
Message-ID: <YVXGEvQ4CVIAk3H0@phenom.ffwll.local>
References: <20210720131110.88512-1-christian.koenig@amd.com>
 <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
 <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
 <YVV8sVphD5BGeNtA@phenom.ffwll.local>
 <4065f898-d31d-a5dc-8d9a-aafa0a1bed54@gmail.com>
 <YVWQ2HDhoqNBQ/2d@phenom.ffwll.local>
 <7671dea5-f8f1-4988-e121-a1cd261a717f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7671dea5-f8f1-4988-e121-a1cd261a717f@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 30, 2021 at 01:32:28PM +0200, Christian König wrote:
> Am 30.09.21 um 12:26 schrieb Daniel Vetter:
> > On Thu, Sep 30, 2021 at 11:48:42AM +0200, Christian König wrote:
> > > 
> > > Am 30.09.21 um 11:00 schrieb Daniel Vetter:
> > > > On Wed, Sep 22, 2021 at 01:08:44PM +0200, Christian König wrote:
> > > > > Totally forgotten to ping once more about that.
> > > > > 
> > > > > Michel has tested this now and I think we should push it ASAP. So can I get
> > > > > an rb?
> > > > 		spin_lock_irq(&dmabuf->poll.lock);
> > > > 		if (dcb->active)
> > > > 			events &= ~EPOLLIN;
> > > > 		else
> > > > 			dcb->active = EPOLLIN;
> > > > 		spin_unlock_irq(&dmabuf->poll.lock);
> > > > 
> > > > 
> > > > This pattern (and same for EPOLLOUT) makes no sense to me. I guess the
> > > > intent is that this filters out events for which we're already listening,
> > > > but:
> > > > 
> > > > - it checks for any active event, not the specific one
> > > Which is correct. We now use one dcb for EPOLLIN and another one for
> > > EPOLLOUT.
> > > 
> > > We could make that a boolean instead if that makes it cleaner.
> > Ha yes I missed that. Boolean sounds much better.
> > > > - if we're waiting already and new fences have been added, wont we miss
> > > >     them?
> > > No, when we are already waiting the callback will sooner or later fire and
> > > result in a re-check.
> > > 
> > > > Or does this all work because the poll machinery restarts everything
> > > > again?
> > > Yes, exactly that. Otherwise waiting for multiple fences wouldn't work
> > > either.
> > Ok with that clarified can you cut a v8 with booleans and I whack an r-b
> > on that? Or just include it, I'm massively burried here and trying to dig
> > out :-/
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (with the booleans)
> 
> My bad, boolean won't work because we also use the flags for the call to
> "wake_up_locked_poll(dcb->poll, dcb->active);".
> 
> Anyway that doesn't really change anything on the logic and I inherited that
> handling from the existing code, just moved it around a bit.

Hm yeah. I guess

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But this poll stuff just massively confuses me.
-Daniel

> 
> Christian.
> 
> > 
> > -Daniel
> > > Regards,
> > > Christian.
> > > 
> > > > I'm totally confused here for sure. The other changes in the patch look
> > > > good though.
> > > > -Daniel
> > > > 
> > > > > Thanks,
> > > > > Christian.
> > > > > 
> > > > > Am 23.07.21 um 10:04 schrieb Michel Dänzer:
> > > > > > On 2021-07-20 3:11 p.m., Christian König wrote:
> > > > > > > Daniel pointed me towards this function and there are multiple obvious problems
> > > > > > > in the implementation.
> > > > > > > 
> > > > > > > First of all the retry loop is not working as intended. In general the retry
> > > > > > > makes only sense if you grab the reference first and then check the sequence
> > > > > > > values.
> > > > > > > 
> > > > > > > Then we should always also wait for the exclusive fence.
> > > > > > > 
> > > > > > > It's also good practice to keep the reference around when installing callbacks
> > > > > > > to fences you don't own.
> > > > > > > 
> > > > > > > And last the whole implementation was unnecessary complex and rather hard to
> > > > > > > understand which could lead to probably unexpected behavior of the IOCTL.
> > > > > > > 
> > > > > > > Fix all this by reworking the implementation from scratch. Dropping the
> > > > > > > whole RCU approach and taking the lock instead.
> > > > > > > 
> > > > > > > Only mildly tested and needs a thoughtful review of the code.
> > > > > > > 
> > > > > > > v2: fix the reference counting as well
> > > > > > > v3: keep the excl fence handling as is for stable
> > > > > > > v4: back to testing all fences, drop RCU
> > > > > > > v5: handle in and out separately
> > > > > > > v6: add missing clear of events
> > > > > > > v7: change coding style as suggested by Michel, drop unused variables
> > > > > > > 
> > > > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > > > CC: stable@vger.kernel.org
> > > > > > Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
> > > > > > 
> > > > > > Tested-by: Michel Dänzer <mdaenzer@redhat.com>
> > > > > > 
> > > > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
