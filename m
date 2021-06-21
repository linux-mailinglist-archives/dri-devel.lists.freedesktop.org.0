Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B63AEA9F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0AC6E165;
	Mon, 21 Jun 2021 13:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BF26E159
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:57:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p10-20020a05600c430ab02901df57d735f7so1828891wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VLlZ3l3oqs2n9MfRUIgVccCiGvo4oRXNn+T0dUZho3Y=;
 b=ISclJSKqCKjquPez0j7j8fwVgBuPd1QBiYGbWfTRnkEpmEiAQ4d7x2vf2SBf62+yvQ
 Vcex8R6FnzHADUmHJwV+LGm6Ux5MYnyEM7BDgV3Rd6SnE6LV74YbJ0/kaZEvo+xsrP7f
 1MfXeUEidSIJ7S7Rz8rOiNAw5j9EUO2EUd3kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VLlZ3l3oqs2n9MfRUIgVccCiGvo4oRXNn+T0dUZho3Y=;
 b=fAcY5rkC8OHUfhCxnU/GptZf5OhQx4SdOldcq/D3YMh+SXJdqcdP2scL72QjW+dMRI
 Fg7A80gg0jS+kKF39NiV0vzPHxzcqb3s5z12PcH6tf43trYQN66jxwago7iFU/BNByXu
 OpleNhYDEyLeG6r0kznVXc/nCx+U3PEOFrqY7ailUYXeaPEmXyilykA3KRNfHHUTdRki
 AsbdQcw4CItcbbh93aXKZnW3ecPNpkHUnaU8oA/qX2IRwmIiCexNHliS/fkzjhNi9yuJ
 qW5lcXXuoXMvh6oxZi0S+NCPQOLIIEbYJ0t60Fw295JgLGZ3NKJ/fbXjTXm+6FXNEejq
 quwQ==
X-Gm-Message-State: AOAM533kBJz5XAT/7ifXucNcbkWE5Sy/maoXkC0QjHCKXpi6Bhs9MqTF
 eJbu2A8T/kge0/klwtLRkZPW+A==
X-Google-Smtp-Source: ABdhPJx/Awmpkl/8wlEQMwSEmi6osmK8f+y6jA0HoxZs0Jbc0XkRZ9eXWSShIx/yHKW9+aTwJueFVA==
X-Received: by 2002:a1c:7f96:: with SMTP id a144mr27535034wmd.22.1624283852269; 
 Mon, 21 Jun 2021 06:57:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c23sm13187352wmb.38.2021.06.21.06.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:57:31 -0700 (PDT)
Date: Mon, 21 Jun 2021 15:57:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
Message-ID: <YNCaybb5azk1AADV@phenom.ffwll.local>
References: <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
 <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
 <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
 <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
 <CAKMK7uELvm+OFZ_GJT4NnB5xXChUcTEuozz4MTu9KwEne=bzgA@mail.gmail.com>
 <ce3fbc52-d629-f022-da52-bcc1adafbe23@amd.com>
 <CAKMK7uENS-LQdMcQpa2gi-QZVUu74Y_-13iNoZO8eFTnZZ1PEw@mail.gmail.com>
 <dba19127-3500-6fbe-f20b-b7889fe5cae4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dba19127-3500-6fbe-f20b-b7889fe5cae4@gmail.com>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 12:16:55PM +0200, Christian König wrote:
> Am 18.06.21 um 20:45 schrieb Daniel Vetter:
> > On Fri, Jun 18, 2021 at 8:02 PM Christian König
> > <christian.koenig@amd.com> wrote:
> > > Am 18.06.21 um 19:20 schrieb Daniel Vetter:
> > > [SNIP]
> > > The whole thing was introduced with this commit here:
> > > 
> > > commit f2c24b83ae90292d315aa7ac029c6ce7929e01aa
> > > Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> > > Date:   Wed Apr 2 17:14:48 2014 +0200
> > > 
> > >       drm/ttm: flip the switch, and convert to dma_fence
> > > 
> > >       Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> > > 
> > >    int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> > > ....
> > > -       bo->sync_obj = driver->sync_obj_ref(sync_obj);
> > > +       reservation_object_add_excl_fence(bo->resv, fence);
> > >           if (evict) {
> > > 
> > > Maarten replaced the bo->sync_obj reference with the dma_resv exclusive
> > > fence.
> > > 
> > > This means that we need to apply the sync_obj semantic to all drivers
> > > using a DMA-buf with its dma_resv object, otherwise you break imports
> > > from TTM drivers.
> > > 
> > > Since then and up till now the exclusive fence must be waited on and
> > > never replaced with anything which signals before the old fence.
> > > 
> > > Maarten and I think Thomas did that and I was always assuming that you
> > > know about this design decision.
> > Surprisingly I do actually know this.
> > 
> > Still the commit you cite did _not_ change any of the rules around
> > dma_buf: Importers have _no_ obligation to obey the exclusive fence,
> > because the buffer is pinned. None of the work that Maarten has done
> > has fundamentally changed this contract in any way.
> 
> Well I now agree that the rules around dma_resv are different than I
> thought, but this change should have raised more eyebrows.
> 
> The problem is this completely broke interop with all drivers using TTM and
> I think might even explain some bug reports.
> 
> I re-introduced the moving fence by adding bo->moving a few years after the
> initial introduction of dma_resv, but that was just to work around
> performance problems introduced by using the exclusive fence for both use
> cases.

Ok that part is indeed not something I've known.

> > If amdgpu (or any other ttm based driver) hands back and sgt without
> > waiting for ttm_bo->moving or the exclusive fence first, then that's a
> > bug we need to fix in these drivers. But if ttm based drivers did get
> > this wrong, then they got this wrong both before and after the switch
> > over to using dma_resv - this bug would go back all the way to Dave's
> > introduction of drm_prime.c and support for that.
> 
> I'm not 100% sure, but I think before the switch to the dma_resv object
> drivers just waited for the BOs to become idle and that should have
> prevented this.
> 
> Anyway let's stop discussing history and move forward. Sending patches for
> all affected TTM driver with CC: stable tags in a minute.
> 
> 
> > The only thing which importers have to do is not wreak the DAG nature
> > of the dma_resv fences and drop dependencies. Currently there's a
> > handful of drivers which break this (introduced over the last few
> > years), and I have it somewhere on my todo list to audit&fix them all.
> 
> Please give that some priority.
> 
> Ignoring the moving fence is a information leak, but messing up the DAG
> gives you access to freed up memory.

Yeah will try to. I've also been hung up a bit on how to fix that, but I
think just closing the DAG-breakage is simplest. Any userspace which then
complains about the additional sync that causes would then be motivated to
look into the import ioctl Jason has. And I think the impact in practice
should be minimal, aside from some corner cases.

> > The goal with extracting dma_resv from ttm was to make implicit sync
> > working and get rid of some terrible stalls on the userspace side.
> > Eventually it was also the goal to make truly dynamic buffer
> > reservation possible, but that took another 6 or so years to realize
> > with your work. And we had to make dynamic dma-buf very much opt-in,
> > because auditing all the users is very hard work and no one
> > volunteered. And for dynamic dma-buf the rule is that the exclusive
> > fence must _never_ be ignored, and the two drivers supporting it (mlx5
> > and amdgpu) obey that.
> > 
> > So yeah for ttm drivers dma_resv is primarily for memory management,
> > with a side effect of also supporting implicit sync.
> > 
> > For everyone else (and this includes a pile of render drivers, all the
> > atomic kms drivers, v4l and I have no idea what else on top) dma_resv
> > was only ever about implicit sync, and it can be ignored. And it (the
> > implicit sync side) has to be ignored to be able to support vulkan
> > winsys buffers correctly without stalling where we shouldn't. Also we
> > have to ignore it on atomic kms side too (and depending upon whether
> > writeback is supported atomic kms is perfectly capable of reading out
> > any buffer passed to it).
> 
> Oh! That might actually explain some issues, but that just completely breaks
> when TTM based drivers use atomic.
> 
> In other words for the first use is actually rather likely for TTM based
> drivers to need to move the buffer around so that scanout is possible.
> 
> And that in turn means you need to wait for this move to finish even if you
> have an explicit fence to wait for. IIRC amdgpu rolled its own
> implementation of this and radeon doesn't have atomic, but nouveau is most
> like broken.
> 
> So we do need a better solution for this sooner or later.

So you're still allowed to have additional fences, but if you use the
default helpers then the explicit fenc will overwrite the exclusive fence
in the dma_resv object by default. Also with the default helpers we only
pick out the exclusive fence from the first object, in case you e.g.
supply a YUV buffers as multiple planes in multiple buffers.

But yeah there's probably some bugs here.

> > > It's absolutely not that this is my invention, I'm just telling you how
> > > it ever was.
> > > 
> > > Anyway this means we have a seriously misunderstanding and yes now some
> > > of our discussions about dynamic P2P suddenly make much more sense.
> > Yeah I think at least we finally managed to get this across.
> > 
> > Anyway I guess w/e for me now, otherwise we'll probably resort to
> > throwing chairs :-) I'm dearly hoping the thunderstorms all around me
> > actually get all the way to me, because it's way, way too hot here
> > right now.
> 
> Well it's probably rather Dave or Linus who might start to throw chairs at
> us to not getting this straight sooner.
> 
> At least the weather is getting more durable.

Yeah same here, I can put a t-shirt back on without dying!
-Daniel

> 
> Cheers,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > 
> > > > _only_ when you have a dynamic importer/exporter can you assume that
> > > > the dma_resv fences must actually be obeyed. That's one of the reasons
> > > > why we had to make this a completely new mode (the other one was
> > > > locking, but they really tie together).
> > > > 
> > > > Wrt your problems:
> > > > a) needs to be fixed in drivers exporting buffers and failing to make
> > > > sure the memory is there by the time dma_buf_map_attachment returns.
> > > > b) needs to be fixed in the importers, and there's quite a few of
> > > > those. There's more than i915 here, which is why I think we should
> > > > have the dma_resv_add_shared_exclusive helper extracted from amdgpu.
> > > > Avoids hand-rolling this about 5 times (6 if we include the import
> > > > ioctl from Jason).
> > > > 
> > > > Also I've like been trying to explain this ever since the entire
> > > > dynamic dma-buf thing started.
> > > > -Daniel
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
