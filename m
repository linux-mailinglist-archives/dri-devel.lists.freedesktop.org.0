Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4645DE40
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 17:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B870A6E584;
	Thu, 25 Nov 2021 16:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D576E554
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:04:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u18so12668450wrg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 08:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kHdSMAOwLSMX+m+Y3BVujwHChGV1VSEejUWtst4SuaY=;
 b=AKCw6wouE5Z3sIR16JxmC3KMUy4mTCOLvi5FajeJyXFvcStcoSCYkJCVWjhg5LIRWy
 7i9uqmo6tkd6Gg7NMJ0133gyemWpm8PGYKqQmUBCjOG+VGHLBvcqtlmb2p8iWNaWcnce
 G+glawUUTAXhYQpsJ5ygl55Yg7jH8LIfxLIOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kHdSMAOwLSMX+m+Y3BVujwHChGV1VSEejUWtst4SuaY=;
 b=yHlSZgfQmw4p3DCYCT4pfjXx2Wb91lUKsmiikT1QYzvvzfEjXwpOuSWd6ny4syZkYC
 iMwgNDsCI/dNiatisgeiX5/TSbk34FTfPOANFTpSxoLBEsvHKzfbdqvaGxkRTvGXq2Ge
 98gjmpnIFD4LASWnKye90kjyISl12tay2lDi7qlj1wmdzRm9RcKfEwpPBUzsb5YHKbDH
 UXGEJpRtIOTbQMcuJCDmRwabS4XPi327QDG5jdjm0p9JkQEl+qFp+pcrJqZ5i8tlzXxt
 ncVV/QRnSjmNSHK+F2HDHuYeRT6TjGC/oFNQ+qH+1m2iptoclHJhzX2mXgo7r4yRvYxY
 gBYQ==
X-Gm-Message-State: AOAM530eRKH9X67RAEhLlNf807KAAb1ZE03f4YIKLWkjNJ4kOwb0Yx5O
 lAa0T+BQdp7Z6ix7ZW6qcIjiyQ==
X-Google-Smtp-Source: ABdhPJy4AgwwjRQfGqxNS+ef+eW9r6rG/MiHKLmp0lZkSO4suOBoZPpIGSFj0BEdfqIdWwabvq5I5A==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr7656846wrs.237.1637856243644; 
 Thu, 25 Nov 2021 08:04:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g4sm3158104wro.12.2021.11.25.08.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 08:04:03 -0800 (PST)
Date: Thu, 25 Nov 2021 17:04:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: completely rework the dma_resv semantic
Message-ID: <YZ+z8VPjCGAWfpCT@phenom.ffwll.local>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 23, 2021 at 03:20:45PM +0100, Christian König wrote:
> Hi guys,
> 
> as discussed before this set of patches completely rework the dma_resv semantic
> and spreads the new handling over all the existing drivers and users.
> 
> First of all this drops the DAG approach because it requires that every single
> driver implements those relatively complicated rules correctly and any
> violation of that immediately leads to either corruption of freed memory or
> even more severe security problems.
> 
> Instead we just keep all fences around all the time until they are signaled.
> Only fences with the same context are assumed to be signaled in the correct
> order since this is exercised elsewhere as well. Replacing fences is now only
> supported for hardware mechanism like VM page table updates where the hardware
> can guarantee that the resource can't be accessed any more.
> 
> Then the concept of a single exclusive fence and multiple shared fences is
> dropped as well.
> 
> Instead the dma_resv object is now just a container for dma_fence objects where
> each fence has associated usage flags. Those use flags describe how the
> operation represented by the dma_fence object is using the resource protected
> by the dma_resv object. This allows us to add multiple fences for each usage
> type.
> 
> Additionally to the existing WRITE/READ usages this patch set also adds the new
> KERNEL and OTHER usages. The KERNEL usages is used in cases where the kernel
> needs to do some operation with the resource protected by the dma_resv object,
> like copies or clears. Those are mandatory to wait for when dynamic memory
> management is used.
> 
> The OTHER usage is for cases where we don't want that the operation represented
> by the dma_fence object participate in any implicit sync but needs to be
> respected by the kernel memory management. Examples for those are VM page table
> updates and preemption fences.
> 
> While doing this the new implementation cleans up existing workarounds all over
> the place, but especially amdgpu and TTM. Surprisingly I also found two use
> cases for the KERNEL/OTHER usage in i915 and Nouveau, those might need more
> thoughts.
> 
> In general the existing functionality should been preserved, the only downside
> is that we now always need to reserve a slot before adding a fence. The newly
> added call to the reservation function can probably use some more cleanup.
> 
> TODOs: Testing, testing, testing, doublechecking the newly added
> kerneldoc for any typos.
> 
> Please review and/or comment,

I like.

Unfortunately also massively burried, but I really like. I think the past
few months (years?) of discussions and bikeshed have been worth it, this
looks tidy and clear in semantics and in how drivers use it all.

Ofc this will take some time to review/test in detail and land, but I
think next steps would be to resurrect Jason's explicit dma-buf fence
import/export series (should also clean up nicely I think), and then roll
out the new fence semantics to a few vk/compute stacks? I think especially
for vk what we want is that normal CS only ever uses OTHER, and any
implicit sync that needs to happen for winsys buffers is done through the
import/export ioctls. GL might need something slightly different, but
normally there's not many shared buffers, so doing a pile of ioctl calls
for implicit synced buffers seems fine. But perhaps GL does want a new CS
ioctl flag.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
