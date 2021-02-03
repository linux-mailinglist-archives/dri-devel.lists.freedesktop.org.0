Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F130D334
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 06:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A156E425;
	Wed,  3 Feb 2021 05:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBBE6E425
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 05:56:27 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id s107so1678290otb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 21:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JK+v/H9Y5ZpRZhdXAC5BUOgw8LiPelyQG0wSqPcrtWI=;
 b=fR9fmJIUrOuAx4WrH055RjPXJ7h71Ne+Me1+7Vja0BEHf3Jb9pGFvE4EIUK8lfLyoC
 PyfACCCxnCjU7DOX4XiAULuPtRAjdAulHDKHQXXFO9wekCHP5rWUmmagMBPUKlf6RIU2
 slND/I0sFpiR/zmnZnRwdsFOOU8BYsbJStTSuwEecddQmBEIkzulKqdKxHUgZS/vGzeZ
 ei+tG04r4OkQKHDMDOcK/fDVaf9t5WJ7TnFC1QIxGkEKGNNiKiqetxt2bjOLQm/D11tb
 J5D4jz3b1r4mkm1Lk2mC6zc0a5BVVjPccq8PZ3v7BDWaXpvtA7c1UrwS/txd45nyoL+m
 IjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JK+v/H9Y5ZpRZhdXAC5BUOgw8LiPelyQG0wSqPcrtWI=;
 b=Z8U35HJHXMcRuexINFbpDnryiSVkK1ffB36GVi5CwphxHWBZX83OhudtSW7QLPgAZK
 XyMOoBpYWlS3zNuIpIGxqDdVrvlkU6Ukkuc5W/CfdBGc+uiU2vdOSVCzr5m1me/Jj/wM
 0ubu7MeG4wkgKSO7tKjyaj5DcesJpz8rb75RaOfs3sS1civSHKcB1l/pkZ+1jfC5OIAz
 8fg1vIgaDPjkQ0ChP3B7hdWtncxC6PHIaYD3WcHYRTrs6qvAj6w1NdZw1HUgoZo67pZk
 qEgoBYc1FAFQUvu33sOTT1uq7bcU5yQ2hj38Pd3InP4KQnKsKclMogR36L4eMQJY7HVM
 rA6w==
X-Gm-Message-State: AOAM531rDBGzkQO0d5GQNbF5V6IKjlA9oPDoyei5pUkgkf7neNRYnG2+
 +RZt+QwFLPglSyj4ho1t4JPjV/7zMz6iprfpbyQu/A==
X-Google-Smtp-Source: ABdhPJy2RJSM/IQLXgr2vBtIZODFBoIES8ezKQ2K+tCeiev7PYCR07s4A6wgMtyVX7p7mQXjnJqS3/so5tjVOUB5lPE=
X-Received: by 2002:a9d:2c2:: with SMTP id 60mr975041otl.70.1612331786600;
 Tue, 02 Feb 2021 21:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org>
 <X9y+YZujWBTHMuH3@phenom.ffwll.local>
 <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
 <X+Ec+xVhyIUa7IsJ@phenom.ffwll.local>
 <CALAqxLWdq9pKpFLzXmV60LQHpu8BgckDuX1HX5hY4jspHvLK5Q@mail.gmail.com>
 <YBlb1V62cFP9Fz1/@phenom.ffwll.local>
In-Reply-To: <YBlb1V62cFP9Fz1/@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 2 Feb 2021 21:56:14 -0800
Message-ID: <CALAqxLVNBGLeCnZ1SMj+bPWTTOMADUw7ioz7zaGRZPC79PpBqg@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, 
 Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, 
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Daniel Mentz <danielmentz@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 6:04 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jan 22, 2021 at 05:28:32PM -0800, John Stultz wrote:
> > On Mon, Dec 21, 2020 at 2:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Dec 18, 2020 at 05:16:56PM -0800, John Stultz wrote:
> > > > On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > > > > > Reuse/abuse the pagepool code from the network code to speed
> > > > > > up allocation performance.
> > > > > >
> > > > > > This is similar to the ION pagepool usage, but tries to
> > > > > > utilize generic code instead of a custom implementation.
> > > > >
> > > > > We also have one of these in ttm. I think we should have at most one of
> > > > > these for the gpu ecosystem overall, maybe as a helper that can be plugged
> > > > > into all the places.
> > > > >
> > > > > Or I'm kinda missing something, which could be since I only glanced at
> > > > > yours for a bit. But it's also called page pool for buffer allocations,
> > > > > and I don't think there's that many ways to implement that really :-)
> > > >
> > > > Yea, when I was looking around the ttm one didn't seem quite as
> > > > generic as the networking one, which more easily fit in here.
> > >
> > > Oops, I didn't look that closely and didn't realize you're reusing the one
> > > from net/core/.
> > >
> > > > The main benefit for the system heap is not so much the pool itself
> > > > (the normal page allocator is pretty good), as it being able to defer
> > > > the free and zero the pages in a background thread, so the pool is
> > > > effectively filled with pre-zeroed pages.
> > > >
> > > > But I'll take another look at the ttm implementation and see if it can
> > > > be re-used or the shared code refactored and pulled out somehow.
> > >
> > > I think moving the page_pool from net into lib and using it in ttm might
> > > also be an option. Lack of shrinker in the networking one might be a bit a
> > > problem.
> >
> > Yea. I've been looking at this, to see how to abstract out a generic
> > pool implementation, but each pool implementation has been tweaked for
> > the specific use cases, so a general abstraction is a bit tough right
> > off.
> >
> > For example the ttm pool's handling allocations both from alloc_pages
> > and dma_alloc in a pool, where the net page pool only uses alloc_pages
> > (but can pre map via dma_map_attr).
> >
> > And as you mentioned, the networking page pool is statically sized
> > where the ttm pool is dynamic and shrinker controlled.
> >
> > Further, as the ttm pool is utilized for keeping pools of pages set
> > for specific cache types, it makes it difficult to abstract that out
> > as we have to be able to reset the caching (set_pages_wb()) when
> > shrinking, so that would also have to be pushed down into the pool
> > attributes as well.
> >
> > So far, in my attempts to share an abstraction for both the net
> > page_pool and the ttm page pool, it seems to make the code complexity
> > worse on both sides -  so while I'm interested in continuing to try to
> > find a way to share code here, I'm not sure it makes sense to hold up
> > this series (which is already re-using an existing implementation and
> > provide a performance bump in microbenchmarks) for the
> > grand-unified-page-pool. Efforts to refactor the ttm pool and net page
> > pool can continue on indepently, and I'd be happy to move the system
> > heap to whatever that ends up being.
>
> The thing is, I'm not sure sharing code with net/core is a really good
> idea, at least it seems like we have some impendence mismatch with the ttm
> pool. And going forward I expect sooner or later we need alignment between
> the pools/caches under drm with dma-buf heap pools a lot more than between
> dma-buf and net/core.

I mean...  I don't think you're wrong here, but it was your suggestion.

> So this feels like a bit code sharing for code sharing's sake and not
> where it makes sense. Expecting net/core and gpu stacks to have the exact
> same needs for a page pool allocator has good chances to bite us in the
> long run.

Again, I agree with you at the high level here (dmabuf system heap and
ttm page pooling are conceptually more likely to align, and
duplication of buffer pools is non-optimal), but there's still the
practical aspect of the ttm pool being pretty tied to the ttm code
(utilizing ttm contexts, fixed MAX_ORDER*TTM_NUM_CACHING_TYPES
subpools per pool + 4 global sub-pools for only x86).

So... I guess I'll go for another pass at trying to pull something
generic out of the ttm_pool, but the cynic in me suspects folks will
just object to any inefficiencies added in order to do so (the
code-sharing for its own sake argument above) and I'll be back to
where I am now. But we'll see.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
