Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E95955A2C3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312A910F4B9;
	Fri, 24 Jun 2022 20:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4922710F4B9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:34:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fi2so6927349ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 13:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=O02FH6+L5nNzRKcHGJtpg3Iq/GHSe7hIcdLe672U+do=;
 b=VN4S8bFkS9I0nerxa6a8LrEJXyvXCi4MnJYdVQ+qhgjPQ0EOOvsKUjt0TYXt922hZ5
 GB5V2vBcoCrhMOdCq5TZ3xgml0Eg1cQRjy8EK2BkuC3UQ4beqCxtgCvjuQDcK+vEueip
 FYxdO2f9FyTWgE2s6dEwgfbhQKN34M2tzi0lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O02FH6+L5nNzRKcHGJtpg3Iq/GHSe7hIcdLe672U+do=;
 b=dc4R7esTdPaaTzsnH9EGgPRz/5YP0wk2afSbKUWQJeWWC5ntEEI/Rpjv9XYckWxfau
 /HDe5b8Fiq1GOauPpE4lEzInv/QXI4IgtQPfQnciUuC2LLUy0OffAMBAadVbU5BinkQw
 AXpvrmn/4H46zD8p/BuFpLMih+nxJdbgg3nO2wA5pPt3eYdxkYLP3SVEHVcQYPp9BaKq
 0BvLOHmPsEyTVSJZ6sovjgb3Vkd4IHI60Yd4NZqk/Bptph5PAIbSQTPNpWat/FkPcJ52
 lJyL5lePTl4hWk65SWDbVE60v62aDwa2HlwSakidQozm4E3UQop2pqCj0G3j8FJIWoQk
 u89A==
X-Gm-Message-State: AJIora+JBwG0RvTzFTtJVZ83mkl0+No3h3wO64ob5OlQV517OFMNY/sP
 2PCEYR6QrwU487VN3th4pi9YdA==
X-Google-Smtp-Source: AGRyM1sO4zC7JGeChYiGHRXIYx/lbAJzJ6rEZDtUXTiZo/WlGXwSnKliAEEsqXDEPVZNeKDIPhly3A==
X-Received: by 2002:a17:907:8a0e:b0:726:3467:b018 with SMTP id
 sc14-20020a1709078a0e00b007263467b018mr815298ejc.552.1656102853698; 
 Fri, 24 Jun 2022 13:34:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a056402150800b0043578cf97d0sm2758900edw.23.2022.06.24.13.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 13:34:13 -0700 (PDT)
Date: Fri, 24 Jun 2022 22:34:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Message-ID: <YrYfw6T4MGvifIco@phenom.ffwll.local>
References: <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
 <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
 <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Digging out of a hole, apologies to everyone.

On Fri, Jun 17, 2022 at 03:08:00PM +0200, Christian König wrote:
> Am 17.06.22 um 15:03 schrieb Bas Nieuwenhuizen:
> > [SNIP]
> > > > > BOOKKEEP can only be used by VM updates themselves. So that they don't
> > > > > interfere with CS.
> > > > That is the point why we would go BOOKKEEP for explicit sync CS
> > > > submissions, no? Explicit submission shouldn't interfere with any
> > > > other CS submissions. That includes being totally ignored by GL
> > > > importers (if we want to have synchronization there between an
> > > > explicit submission and GL, userspace is expected to use Jason's
> > > > dmabuf fence import/export IOCTLs)
> > > No, that would break existing DMA-buf rules.
> > > 
> > > Explicit CS submissions are still a dependency for implicit submissions.
> > This is explicitly what we don't want for explicit submissions and why
> > I waited with this series until the DMA_RESV_USAGE series landed. We
> > wish to opt out from implicit sync completely, and just use the IOCTLs
> > Jason wrote for back-compat with windowing systems that need it.
> > 
> > If BOOKKEEP isn't for that, should we add a new USAGE?
> 
> BOOKKEEP is exactly for that, but as discussed with Daniel that's not what
> we want in the kernel.

Not sure which Daniel you talked to, but this wasn't me.

> When you mix implicit with explicit synchronization (OpenGL with RADV for
> example) it should be mandatory for the OpenGL to wait for any RADV
> submission before issuing an operation.
> 
> What you want to do is intentionally not supported.

vk is very intentional in it's rejecting of any implicit sync. Which means
when you share a buffer with gl, even in _that_ case there must be no sync
automatically, or your implementation is kinda shit. Instead anyone
sharing a buffer with vk and using it in gl must take care of sync by
importing the timeline syncobj to gl, that's why all these extensions got
added.

This leaves libva in the cold, but hey libva didn't even get around to
adding the full set of modifier extensions so I can't really get myself to
care.

So summary this means:

- a CS/execbuf for vk should _only_ set BOOKKEEPING fences (except ofc if
  there's memory management moves in the preparation, which use KERNEL
  fences and then become additional dependencies for the job)

- because vk memory model is that always everything currently bound can be
  used this means you set BOOKKEEPING on absolutely everything. The
  current clever trick amdgpu has with shared buffers is also not really
  the right thing.

- implicit sync is only controlled through the new import/export ioctl on
  the dma-buf

- if you set any READ/WRITE fences anywhere else, you have potential
  oversync compared to what the vk spec would want

- userspace gets to keep absolutely all the pieces here. Which is not an
  issue, because userspace is totally allowed to fill a buffer with
  garbage and hand that to the compositor already, so there's nothing new
  going wrong here.

- ideally (definitely required for vk sparse) when you unbind or rebind
  then the BOOKKEEPING fences for the vm/ctx get for the old buffers get
  simply replaced by the pte clearing and tlb flushing fences (like amdkfd
  does for compute, vk really just wants to look like compute in
  everything). In practice, especially with partial and multiple mappings
  of the same underlying bo involved, this might be too expensive to
  accurately track since you can only do the replacement trick when the
  last mapping is gone. It might be worth it for private bo though, dunno.

For amdgpu the current special owner checks mostly allow you to get the
semantics vulkan wants. But it breaks down when you have cross-device or
cross-process sharing.

We should probably also document this in the kerneldoc for the BOOKKEEPING
usage that this is the fence type that vulkan cs should use in all
drivers, otherwise this will become an endless mess of driver specific
hacks (i.e. the world we currently live in).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
