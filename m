Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B89519C8D
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5810E2A0;
	Wed,  4 May 2022 10:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623E410E2A0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:08:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gh6so1966856ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rDvB+eR1HPDPBgGgQVQu2odCTv9ee9o4/T9uHCg8jP4=;
 b=A56yDbl+jbM/gnxspFPWnGAYTEb0RqS2FzO7zYJrM+jL5V5PQog7tdfOOGVGOgj3g3
 74+mk4+8V5EvHB0v9xnXL2vZ6c1GpJtriJSGRQJWqXrHbhfpUI8mqVMqX/wilUanQVUA
 eT/ihO+r2X13yIcZwGtoxlBc5OH19/1ypIFW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rDvB+eR1HPDPBgGgQVQu2odCTv9ee9o4/T9uHCg8jP4=;
 b=YWFRyLQbG/bzhD4GvEXFlugQi0h5bBU8I3XaBleaNtHlhoW1njC+WfFg2rZGsexJS9
 9EaFVDPIGDIs/usFFDrIFdF48CJGoU/V0rky7mvDMpUutxk1JY3NcoA+NrdvV/kp4u5F
 uf4uD8pn+ebMVHttF+I+prDl1YgR58rhjotdESeagT5VF+Fx9OY4FFCNlbnt6IG8JSqG
 PuQDV8OER9BcfW9YcPD2MjUxokDoGzWFp5ucDkesVN0iDBcMOi4bpqhfiZk5BXdyP1jb
 gqPSrffObHseu2zrgexwoBwMeGlOTpts4mQQZsfa/fxzw6wq3GAAT5yBgDkwllf+fr+6
 levQ==
X-Gm-Message-State: AOAM533zzKabm0oXh+ciwWxVNLSlvetNsZrisNxCl8D3mzqGz5n55z6Q
 pv6MD8YgApu8p+gd4jAS1EYBLA==
X-Google-Smtp-Source: ABdhPJwbjPuToa2SnetpxbPrTynYxAMYWjdHnaxw0b3HqZFbxYlHD3SMrwyEcKnvnOumNHYnDaOB8g==
X-Received: by 2002:a17:907:2064:b0:6f4:3f07:c76e with SMTP id
 qp4-20020a170907206400b006f43f07c76emr13671217ejb.462.1651658933850; 
 Wed, 04 May 2022 03:08:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hz19-20020a1709072cf300b006f3ef214df7sm5618514ejc.93.2022.05.04.03.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 03:08:53 -0700 (PDT)
Date: Wed, 4 May 2022 12:08:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <YnJQs1iusrBvpuMs@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
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
Cc: tvrtko.ursulin@linux.intel.com, sergemetral@google.com, tzimmermann@suse.de,
 gustavo@padovan.org, Felix.Kuehling@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jason@jlekstrand.net, alexander.deucher@amd.com, daniels@collabora.com,
 skhawaja@google.com, sumit.semwal@linaro.org, maad.aldabagh@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 06:37:07PM +0200, Christian König wrote:
> Hello everyone,
> 
> it's a well known problem that the DMA-buf subsystem mixed
> synchronization and memory management requirements into the same
> dma_fence and dma_resv objects. Because of this dma_fence objects need
> to guarantee that they complete within a finite amount of time or
> otherwise the system can easily deadlock.
> 
> One of the few good things about this problem is that it is really good
> understood by now.
> 
> Daniel and others came up with some documentation:
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
> 
> And Jason did an excellent presentation about that problem on last years
> LPC: https://lpc.events/event/11/contributions/1115/
> 
> Based on that we had been able to reject new implementations of
> infinite/user DMA fences and mitigate the effect of the few existing
> ones.
> 
> The still remaining down side is that we don't have a way of using user
> fences as dependency in both the explicit (sync_file, drm_syncobj) as
> well as the implicit (dma_resv) synchronization objects, resulting in
> numerous problems and limitations for things like HMM, user queues
> etc....
> 
> This patch set here now tries to tackle this problem by untangling the
> synchronization from the memory management. What it does *not* try to do
> is to fix the existing kernel fences, because I think we now can all
> agree on that this isn't really possible.
> 
> To archive this goal what I do in this patch set is to add some parallel
> infrastructure to cleanly separate normal kernel dma_fence objects from
> indefinite/user fences:
> 
> 1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some
> existing driver defines). To note that a certain dma_fence is an user
> fence and *must* be ignore by memory management and never used as
> dependency for normal none user dma_fence objects.
> 
> 2. The dma_fence_array and dma_fence_chain containers are modified so
> that they are marked as user fences whenever any of their contained
> fences are an user fence.
> 
> 3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be
> used with indefinite/user fences and separates those into it's own
> synchronization domain.
> 
> 4. The existing dma_buf_poll_add_cb() function is modified so that
> indefinite/user fences are included in the polling.
> 
> 5. The sync_file synchronization object is modified so that we
> essentially have two fence streams instead of just one.
> 
> 6. The drm_syncobj is modified in a similar way. User fences are just
> ignored unless the driver explicitly states support to wait for them.
> 
> 7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers
> can use to indicate the need for user fences. If user fences are used
> the atomic mode setting starts to support user fences as IN/OUT fences.
> 
> 8. Lockdep is used at various critical locations to ensure that nobody
> ever tries to mix user fences with non user fences.
> 
> The general approach is to just ignore user fences unless a driver
> stated explicitely support for them.
> 
> On top of all of this I've hacked amdgpu so that we add the resulting CS
> fence only as kernel dependency to the dma_resv object and an additional
> wrapped up with a dma_fence_array and a stub user fence.
> 
> The result is that the newly added atomic modeset functions now
> correctly wait for the user fence to complete before doing the flip. And
> dependent CS don't pipeline any more, but rather block on the CPU before
> submitting work.
> 
> After tons of debugging and testing everything now seems to not go up in
> flames immediately and even lockdep is happy with the annotations.
> 
> I'm perfectly aware that this is probably by far the most controversial
> patch set I've ever created and I really wish we wouldn't need it. But
> we certainly have the requirement for this and I don't see much other
> chance to get that working in an UAPI compatible way.
> 
> Thoughts/comments?

I think you need to type up the goal or exact problem statement you're
trying to solve first. What you typed up is a solution along the lines of
"try to stuff userspace memory fences into dma_fence and see how horrible
it all is", and that's certainly an interesting experiment, but what are
you trying to solve with it?

Like if the issue is to enable opencl or whatever, then that's no problem
(rocm on amdkfd is a thing, same maybe without the kfd part can be done
anywhere else). If the goal is to enable userspace memory fences for vk,
then we really don't need these everywhere, but really only in drm_syncobj
(and maybe sync_file).

If the goal is specifically atomic kms, then there's an entire can of
worms there that I really don't want to think about, but it exists: We
have dma_fence as out-fences from atomic commit, and that's already
massively broken since most drivers allocate some memory or at least take
locks which can allocate memory in their commit path. Like i2c. Putting a
userspace memory fence as in-fence in there makes that problem
substantially worse, since at least in theory you're just not allowed to
might_faul in atomic_commit_tail.

If the goal is to keep the uapi perfectly compatible then your patch set
doesn't look like a solution, since as soon as another driver is involved
which doesn't understand userspace memory fences it all falls apart. So
works great for a quick demo with amd+amd sharing, but not much further.
And I don't think it's feasible to just rev the entire ecosystem, since
that kinda defeats the point of keeping uapi stable - if we rev everything
we might as well also rev the uapi and make this a bit more incremental
again :-)

There's probably more to ponder here ...

I'm not sure what exactly the problem statement is that matches your
solution here though, so that seems to be missing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
