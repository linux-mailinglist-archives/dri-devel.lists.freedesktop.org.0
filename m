Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4C969B15
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7193A10E46B;
	Tue,  3 Sep 2024 11:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fNFc3eSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A594A10E307
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:29:19 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f4f5dbd93bso48459271fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725352158; x=1725956958; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x50lG6XYYNRVmmKUAOIcsonEwNIod/L4ujBTVUC+uLM=;
 b=fNFc3eSJSycHESHGEXtfauGdjZvkR7LrWC19cjqcbBu69SCl4cgRN/TFdyfiDyfXIK
 GnkrqxMzDIbzkMmvw/LSR7KZA5hBcBaBQ6203VGtkCcwp0X//7xkgIXkoExuSjJO0NdA
 64ECSGwvTMXrX5XBwDpjl3GlAFtszPofpB6tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352158; x=1725956958;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x50lG6XYYNRVmmKUAOIcsonEwNIod/L4ujBTVUC+uLM=;
 b=LAcWxYORBOW0hYftsU0daVEVLf28fIwLoro/nvydVHBeEBSrsvRlF9mU+/QNh8vdkN
 w0xKYGEcfZAQI1WhapKwPvrssdfLoUhEZsPUdIPEfhWh/qQzZeJQjmK4dswWUq2RVjTZ
 1OYrZzx5DuUYhJUG05FrYBnwroJlhLi7HqcDzgbsIdxhXeeUaJ77iH9gbNzWVb2E9aXB
 Km12CdUSOspK/GxqqKAuQaRDGysUXa1SVzCoOGYzevs6JiFhtn/ozC1bxDZfqwLJVyIi
 jtNOSMQyxzfV0gOErc5bUERe8B6uqg7oxl9MoQuOLnWyv3d6R6zNl3R3k1KgG+oHYv1h
 eqDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmyU23No5axHXINycYYYS3bk5LPzKkX/zymEB3xxk6Z+eZMuPLMNQNj7Wfga8grIIEqWw5JjyCw/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKC+2KlpOrQpZtURgWeQI3GGjuGvj9OwEf4ZkhdfUltMd2pD3F
 gzm0xOjwYubvxrV6UWag/UaBGd4nfiHjOWSeodtcK+IrWD7OZ1HwFsgKnkVqsu0=
X-Google-Smtp-Source: AGHT+IGMnQbwPtPtRk9RIqgtwmi08Ikfh1xSU9ITMZuWScrGXPfER19S9QBKYDUfcyHsnkku1jUOOA==
X-Received: by 2002:a05:6512:2212:b0:535:45d2:abf0 with SMTP id
 2adb3069b0e04-53546b90e13mr8240272e87.39.1725352157438; 
 Tue, 03 Sep 2024 01:29:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb9593c32sm150229265e9.48.2024.09.03.01.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:29:17 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:29:15 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Luben Tuikov <ltuikov89@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Make sure drm_sched_fence_ops don't vanish
Message-ID: <ZtbI21Z4js7rO9Rp@phenom.ffwll.local>
References: <20240830104057.1479321-1-boris.brezillon@collabora.com>
 <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
 <20240831091352.1f212fff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240831091352.1f212fff@collabora.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
X-Mailman-Approved-At: Tue, 03 Sep 2024 11:01:31 +0000
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

On Sat, Aug 31, 2024 at 09:13:52AM +0200, Boris Brezillon wrote:
> Hi Matthew,
> 
> On Fri, 30 Aug 2024 22:28:19 +0000
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Fri, Aug 30, 2024 at 12:40:57PM +0200, Boris Brezillon wrote:
> > > dma_fence objects created by drm_sched might hit other subsystems, which
> > > means the fence object might potentially outlive the drm_sched module
> > > lifetime, and at this point the dma_fence::ops points to a memory region
> > > that no longer exists.
> > > 
> > > In order to fix that, let's make sure the drm_sched_fence code is always
> > > statically linked, just like dma-fence{-chain}.c does.
> > > 
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Just like for the other UAF fix, this is an RFC, as I'm not sure that's
> > > how we want it fixed. The other option we have is to retain a module ref
> > > for each initialized fence and release it when the fence is freed.  
> > 
> > So this is different than your other patch. From Xe PoV the other patch
> > is referencing an object which is tied to an IOCTL rather than a module
> > whereas this referencing a module.
> 
> Well, it's not fixing the exact same problem either. My other patch was
> about making sure the timeline name string doesn't disappear when a
> scheduler is destroyed, which can happen while the module is still
> loaded. As Christian pointed out, the "module unload while fences
> exist" problem can be solved by binding the module refcounting to
> the drm_sched_fence_timeline object lifetime, but I wanted to show a
> simpler alternative to this approach with this patch.
> 
> > If a module can disappear when fence
> > tied to the module, well that is a bit scary and Xe might have some
> > issues there - I'd have audit our of exporting internally created
> > fences.
> 
> Yeah, I moved away from exposing driver fences directly because of
> that. Now all I expose to the outside world are drm_sched_fence
> objects, which just moves the problem one level down, but at least we
> can fix it generically if all the drivers take this precaution.
> 
> > 
> > Based on Christian's feedback we really shouldn't be allowing this but
> > also don't really love the idea of a fence holding a module ref either.
> > 
> > Seems like we need a well defined + documented rule - exported fences
> > need to be completely decoupled from the module upon signaling
> 
> That basically means patching drm_sched_fence::ops (with the lock held)
> at signal time so it points to a dummy ops that's statically linked
> (something in dma-fence.c, I guess). But that also means the names
> returned by get_{driver,timeline}_name() no longer reflect the original
> fence owner after signalling, or you have to do some allocation+copy
> of these strings. Neither of these options sound good to me.

I replied in the other thread, my take is we should sort this out in
dma_fence.c. Essentially:

- split the fence cleanup into driver release and the final kfree_rcu.

- move the final kfree_rcu into dma_fence.c code. This means no more
  special slabs all over the place.

- fix up all the rules around the various ->ops callbacks so they don't
  race as much anymore, where we do race. I think the worst is ->wait(),
  we might want to really ditch that one (or at least deprecate it, I
  think for some defacto unfixable drivers it needs to stay).

- add dma_fence guarantee that after dma_fence_signal() has returned it
  will never ever call into ->ops ever again.

It's a bit radical, but I don't think anything less really plugs this mess
for good.

> > or
> > exported fences must retain a module ref.
> 
> Yes, and that's the option I was originally heading to, until I
> realized we have a 3rd option that's already working well for the core
> dma-fence code (AKA the stub, the chain, and other containers I might
> have missed). If the code is not in a module but instead statically
> linked, all our module-lifetime vs fence-lifetime issues go away
> without resorting to this module refcounting trick. Given sched_fence.c
> is pretty self-contained (no deps on other DRM functions that might be
> linked as a module), I now think this is our best shot for drm_sched
> fences.
> 
> The story is a bit different for driver fences exposed to the outside
> world, but if you're using drm_sched, I see no good reason for not using
> the drm_sched_fence proxy for all your fences. Note that the same kind
> of proxy can be generalized at the dma-fence.c level if it's deemed
> valuable for other subsystems.
> 
> The idea behind it being that:
> 
> - the dma_fence_proxy ops should live in dma-fence.c (or any other
>   object that's statically linked)

Proxy ops don't work, unless you fully serialize access to ->ops with
locking (or some other kind of serialization). At that point you might as
well have special code in dma_fence.c that just bypasses ->ops.

> - driver and timeline names attached to a proxy need to be dynamically
>   allocated and owned by some dma_fence_proxy_context object
> - the dma_fence_proxy_context object needs to be refcounted, and each
>   fence attached to this 'fence-context' needs to hold a ref on this
>   struct

Yeah making the fence context/timeline a fully refcounted thing might be
needed, instead of just a integer we allocate with atomic_add. But would
first need to add a proper special case for all the unsorted dma_fences,
we currently still just consume each a timeline ...

> > I'd probably lean towards the
> > former.
> 
> For the reasons exposed above, I don't think that's a viable option,
> unless we decide we no longer care about the fence origin after
> signalling happened (which would be a mess for people looking a
> dma_buf's debug file to be honest).

Why would that be a mess? A signalled fence shouldn't be an issue anymore,
so not sure why you want to know where they came from. And as long as
they're stuck the fences have meaningful debug info ...

> > One reason to support the former is fences can be released in
> > IRQ contexts and dropping a module ref in IRQ context seems a bit
> > problematic. Also because some oher part of kernel holds on to fence ref
> > lazily block a module unload just seems wrong.
> 
> There's always the option to defer the release if we're in a context
> where we can't release immediately. But I think we're overthinking it.
> For the drm_sched_fence, the simple answer is to make this code static,
> just like dma-fence{-chain}.c.

Yeah I think what we all agree is that the final cleanup code must be
built-in for all fences, or this just wont work.

> > Sorry if above we have well defined rule and I'm just not aware.
> 
> AFAICT, it's not.

Yeah we yolo'ed this for more than a decade. Sounds like time to sort it
out ...
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
