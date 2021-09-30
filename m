Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44941D7A5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7166EB61;
	Thu, 30 Sep 2021 10:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AF36EB61
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:26:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v127so4212338wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 03:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ULdmJ+J+IOwd+xSNKOWigr2m3RTVkWIfk4uhnpqHMLo=;
 b=K5ezINOFonefdKg8VJTl2Zv2lLbywRjne/rIn7CYG01Pp88DQTL6skD6gla52imtM3
 3kur2ynshbgmPqa1hejucK5wuS9VUYih6mlTrGIibb4yjXfZSU3ZXvQXTLWSd2GVLLY7
 vI4+JKXMtJT/00jy7h0yYTpHlxx6ScSSLZOjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ULdmJ+J+IOwd+xSNKOWigr2m3RTVkWIfk4uhnpqHMLo=;
 b=d4QvieCFu0FlXLr/t/69/JrzItFMt3MmIoEvxbr3koOf8EArWOQxJ7yl47f0lhkwOF
 ILcXez/RPTNAxIILbvJsbg7jjqACXSm2mKcAJOVSTVkmppl7WFCakyUDAEAHtzKlIbGw
 KYypvl9M/2SJ0JvTZh8xE/pQERdNUIEDyAH5W5MSs9+qAi6LEZhWlWfLlRNLyornmmCs
 obJLg7K2czwVhHDfABHs3F26t+DGiAPwfG1HlrejWr2lQPkaT7hxvYPgVzvKy1ZyLPOS
 TvGpg9FyuU2xaUsh+h7pBd45jUW7K4VJlPvvdp8rDykbTVesfqQlfGQhWS5QFHGz54EJ
 g95A==
X-Gm-Message-State: AOAM532/RAlFBxlJMi6zJMK1j6B5Djl4aIFccnr3jDKBoNO/VsqnL0JH
 86/vCv6TduUkWG9minl4LXt0HA==
X-Google-Smtp-Source: ABdhPJz+L3+rQwHVvmlnxhGyLbRSuak8adFc2vKdO/kXHjfTHfw+HTf0RoeD6nxRN3OakvG6/lD4+Q==
X-Received: by 2002:a1c:9dc7:: with SMTP id
 g190mr15564160wme.120.1632997594361; 
 Thu, 30 Sep 2021 03:26:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i1sm2709465wrb.93.2021.09.30.03.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 03:26:34 -0700 (PDT)
Date: Thu, 30 Sep 2021 12:26:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
Message-ID: <YVWQ2HDhoqNBQ/2d@phenom.ffwll.local>
References: <20210720131110.88512-1-christian.koenig@amd.com>
 <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
 <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
 <YVV8sVphD5BGeNtA@phenom.ffwll.local>
 <4065f898-d31d-a5dc-8d9a-aafa0a1bed54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4065f898-d31d-a5dc-8d9a-aafa0a1bed54@gmail.com>
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

On Thu, Sep 30, 2021 at 11:48:42AM +0200, Christian König wrote:
> 
> 
> Am 30.09.21 um 11:00 schrieb Daniel Vetter:
> > On Wed, Sep 22, 2021 at 01:08:44PM +0200, Christian König wrote:
> > > Totally forgotten to ping once more about that.
> > > 
> > > Michel has tested this now and I think we should push it ASAP. So can I get
> > > an rb?
> > 		spin_lock_irq(&dmabuf->poll.lock);
> > 		if (dcb->active)
> > 			events &= ~EPOLLIN;
> > 		else
> > 			dcb->active = EPOLLIN;
> > 		spin_unlock_irq(&dmabuf->poll.lock);
> > 
> > 
> > This pattern (and same for EPOLLOUT) makes no sense to me. I guess the
> > intent is that this filters out events for which we're already listening,
> > but:
> > 
> > - it checks for any active event, not the specific one
> 
> Which is correct. We now use one dcb for EPOLLIN and another one for
> EPOLLOUT.
> 
> We could make that a boolean instead if that makes it cleaner.

Ha yes I missed that. Boolean sounds much better.
> 
> > - if we're waiting already and new fences have been added, wont we miss
> >    them?
> 
> No, when we are already waiting the callback will sooner or later fire and
> result in a re-check.
> 
> > Or does this all work because the poll machinery restarts everything
> > again?
> 
> Yes, exactly that. Otherwise waiting for multiple fences wouldn't work
> either.

Ok with that clarified can you cut a v8 with booleans and I whack an r-b
on that? Or just include it, I'm massively burried here and trying to dig
out :-/

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (with the booleans)

-Daniel
> 
> Regards,
> Christian.
> 
> > 
> > I'm totally confused here for sure. The other changes in the patch look
> > good though.
> > -Daniel
> > 
> > > Thanks,
> > > Christian.
> > > 
> > > Am 23.07.21 um 10:04 schrieb Michel Dänzer:
> > > > On 2021-07-20 3:11 p.m., Christian König wrote:
> > > > > Daniel pointed me towards this function and there are multiple obvious problems
> > > > > in the implementation.
> > > > > 
> > > > > First of all the retry loop is not working as intended. In general the retry
> > > > > makes only sense if you grab the reference first and then check the sequence
> > > > > values.
> > > > > 
> > > > > Then we should always also wait for the exclusive fence.
> > > > > 
> > > > > It's also good practice to keep the reference around when installing callbacks
> > > > > to fences you don't own.
> > > > > 
> > > > > And last the whole implementation was unnecessary complex and rather hard to
> > > > > understand which could lead to probably unexpected behavior of the IOCTL.
> > > > > 
> > > > > Fix all this by reworking the implementation from scratch. Dropping the
> > > > > whole RCU approach and taking the lock instead.
> > > > > 
> > > > > Only mildly tested and needs a thoughtful review of the code.
> > > > > 
> > > > > v2: fix the reference counting as well
> > > > > v3: keep the excl fence handling as is for stable
> > > > > v4: back to testing all fences, drop RCU
> > > > > v5: handle in and out separately
> > > > > v6: add missing clear of events
> > > > > v7: change coding style as suggested by Michel, drop unused variables
> > > > > 
> > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > CC: stable@vger.kernel.org
> > > > Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
> > > > 
> > > > Tested-by: Michel Dänzer <mdaenzer@redhat.com>
> > > > 
> > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
