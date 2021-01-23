Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA553011FD
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 02:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1656EA25;
	Sat, 23 Jan 2021 01:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317D26EA25
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jan 2021 01:28:47 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j3so8648680ljb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 17:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=yfeJphQ0sDWpVDHO4BIQKQejXBdG4Gl17zoealRBPD8=;
 b=gICXjdQzjIZupISrGhW4/NffiZvV7rNuGnLKX3VcHrhEpbrHDK/isnFulFOw7k6YmD
 M9YIjj3XVYpfO4CkPcLVWyiOP9hLzmB6VWBRedDhebfMjgquqYTtSpCnHe5AQXimqFIL
 X9l59yHd5nBiHqKPsk1xeWUYHFCyXbvnZZE6Mqi2uqhYzK8sUaWxNuVv5g5Sxf307mu5
 lQ0Rk5bCFgv4OUYAmpYychz0y+xM8PB8DIN+hgym5WN97YX7TOTWwaqzGMyqMB+jpjLx
 Kvq3YB5cwJgKZQrOw8tKKyRvgCdGbE65gwEHZNCQNvHkFbfIwnb/mJq6u6DgfPBYkyJE
 qenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=yfeJphQ0sDWpVDHO4BIQKQejXBdG4Gl17zoealRBPD8=;
 b=XHAje7Pg+rJSjTJD5ffBs4eXaE3VQNH3tDWLuGUeKWcu6l/bLFnU5ctk3395dkPIAs
 3qRq2RDNRThWUmpPw8cpHPdHosxVrDkJUvfiwnPJxhku8zkXjD8IZP5aai8Um1ArAh8i
 GhN4OFr13OhKC814Rnr6CeTOqo115e4jqQ+YSlQvw9GZMpJtA0VSsuqLeSxKnaqYJ8Pu
 SrqD5JIoBV7bg6DxCtgNazNETyNx5B1on5u97Ev5AdA0dkHO+/84Y3dr8N/a+Q+zz5WZ
 +UgrlJVUPbKMslxlR/V8ih7i0LEddZqgmE2u65vcPZEdUyFghHv65w/jqSzrFASBTgtI
 YogQ==
X-Gm-Message-State: AOAM532GcPmq5HRjsmni8yxj+jTTPRT42FoVYx+FoaZlLPeK/VyfbD3P
 WwaZEvTigV8ZlA5np1d3h7DIXdnG+sMhvvOKHDXEzg==
X-Google-Smtp-Source: ABdhPJyIUZEiyrDDDxLY28EF6rN61DxLuQL+7PTZS/r3UdjtMlSsCnW0o7RtD5J7teKoSreixvqjk4ot1Cqj4bHK16E=
X-Received: by 2002:a05:651c:10e:: with SMTP id
 a14mr1388108ljb.128.1611365325426; 
 Fri, 22 Jan 2021 17:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org>
 <X9y+YZujWBTHMuH3@phenom.ffwll.local>
 <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
 <X+Ec+xVhyIUa7IsJ@phenom.ffwll.local>
In-Reply-To: <X+Ec+xVhyIUa7IsJ@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 22 Jan 2021 17:28:32 -0800
Message-ID: <CALAqxLWdq9pKpFLzXmV60LQHpu8BgckDuX1HX5hY4jspHvLK5Q@mail.gmail.com>
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

On Mon, Dec 21, 2020 at 2:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Dec 18, 2020 at 05:16:56PM -0800, John Stultz wrote:
> > On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > > > Reuse/abuse the pagepool code from the network code to speed
> > > > up allocation performance.
> > > >
> > > > This is similar to the ION pagepool usage, but tries to
> > > > utilize generic code instead of a custom implementation.
> > >
> > > We also have one of these in ttm. I think we should have at most one of
> > > these for the gpu ecosystem overall, maybe as a helper that can be plugged
> > > into all the places.
> > >
> > > Or I'm kinda missing something, which could be since I only glanced at
> > > yours for a bit. But it's also called page pool for buffer allocations,
> > > and I don't think there's that many ways to implement that really :-)
> >
> > Yea, when I was looking around the ttm one didn't seem quite as
> > generic as the networking one, which more easily fit in here.
>
> Oops, I didn't look that closely and didn't realize you're reusing the one
> from net/core/.
>
> > The main benefit for the system heap is not so much the pool itself
> > (the normal page allocator is pretty good), as it being able to defer
> > the free and zero the pages in a background thread, so the pool is
> > effectively filled with pre-zeroed pages.
> >
> > But I'll take another look at the ttm implementation and see if it can
> > be re-used or the shared code refactored and pulled out somehow.
>
> I think moving the page_pool from net into lib and using it in ttm might
> also be an option. Lack of shrinker in the networking one might be a bit a
> problem.

Yea. I've been looking at this, to see how to abstract out a generic
pool implementation, but each pool implementation has been tweaked for
the specific use cases, so a general abstraction is a bit tough right
off.

For example the ttm pool's handling allocations both from alloc_pages
and dma_alloc in a pool, where the net page pool only uses alloc_pages
(but can pre map via dma_map_attr).

And as you mentioned, the networking page pool is statically sized
where the ttm pool is dynamic and shrinker controlled.

Further, as the ttm pool is utilized for keeping pools of pages set
for specific cache types, it makes it difficult to abstract that out
as we have to be able to reset the caching (set_pages_wb()) when
shrinking, so that would also have to be pushed down into the pool
attributes as well.

So far, in my attempts to share an abstraction for both the net
page_pool and the ttm page pool, it seems to make the code complexity
worse on both sides -  so while I'm interested in continuing to try to
find a way to share code here, I'm not sure it makes sense to hold up
this series (which is already re-using an existing implementation and
provide a performance bump in microbenchmarks) for the
grand-unified-page-pool. Efforts to refactor the ttm pool and net page
pool can continue on indepently, and I'd be happy to move the system
heap to whatever that ends up being.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
