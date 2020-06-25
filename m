Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9520A06D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 15:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59D6E2B0;
	Thu, 25 Jun 2020 13:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2216E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 13:59:46 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id j11so2354653oiw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xkuv2dmy2A6JZ03EEs+u17QuIcYIBbo77ThdcYSjHjI=;
 b=i5K/hTc6Brlatf+2YL3cqZOTobJi5v/LFFiLgGdjE4ceXe1yhLQfICHNgdvoWNDkrg
 s3cIKWI7I19wrpoI5bTWDsmnZKNVH0dnyLhNY7yLvs9XZWH6iyJ85Q/q6AG6AWEb0T30
 1XSJyT42VGHx2n28COuM5gYtkyL9SasHIJgOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xkuv2dmy2A6JZ03EEs+u17QuIcYIBbo77ThdcYSjHjI=;
 b=f3nrZgEmGfZuglkV8ktlgifCZbVVwwxnJRJZ2LvtjEDxRzozE4KmlQPW3lq3xtqIV/
 bdgRZeixbMdkrnSAIz19kDD6W5+Lq5UMkT/O2ES98ae+kMiPRL6l7rC/ZVj7TvZvVgiO
 SI7S9+1cZkwfls3FmJdLmHBrLFeVBH5tT4QIrCfQ8mSnDZ3/V+aFMldoM2CdfbjYRAHk
 it9vf2Mypwaow+KmJE+jkEhd3eCcV5gJpzhzD7x8U+eRpcAVo/PZDBB54vO1dATMNUKo
 Uk8zyGLEMxNkzCYBp6Ig1uZAN+ciRCjvx+5XBk5MTYGtjkmZ+KWc1BLupKipYl0X34xI
 56GA==
X-Gm-Message-State: AOAM531ySbNX2MOyHQH1PT3dP+GmHI3o3d9lcwsl2XEznKf7yziHpeLI
 mHSwiSTArDo/R0bC/W4AINFz17A1vY8OVfvI8mn7vg==
X-Google-Smtp-Source: ABdhPJwsyhmuFvo2DMgc/ognpebSy3h9JzNpBbuMGWgyQH4D+OLtzRFMcALM80Oq9oBk1N97SdYUBgs9Xcu5gYUQXDc=
X-Received: by 2002:aca:bc06:: with SMTP id m6mr2088369oif.101.1593093585564; 
 Thu, 25 Jun 2020 06:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
 <159309113252.4527.2883585204850736358@build.alporthouse.com>
 <c6f72d4d-c8a0-c484-7c31-761e9c37b85e@intel.com>
In-Reply-To: <c6f72d4d-c8a0-c484-7c31-761e9c37b85e@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Jun 2020 15:59:34 +0200
Message-ID: <CAKMK7uHgwUQYLDPJnmTqcX1=UPuinifm+Y7+z-krSzqXpKXnow@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf: fix dma-fence-chain out of order
 test
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 3:23 PM Lionel Landwerlin
<lionel.g.landwerlin@intel.com> wrote:
>
> On 25/06/2020 16:18, Chris Wilson wrote:
> > Quoting Lionel Landwerlin (2020-06-25 13:34:43)
> >> There was probably a misunderstand on how the dma-fence-chain is
> >> supposed to work or what dma_fence_chain_find_seqno() is supposed to
> >> return.
> >>
> >> dma_fence_chain_find_seqno() is here to give us the fence to wait upon
> >> for a particular point in the timeline. The timeline progresses only
> >> when all the points prior to a given number have completed.
> > Hmm, the question was what point is it supposed to wait for.
> >
> > For the simple chain of [1, 3], does 1 being signaled imply that all
> > points up to 3 are signaled, or does 3 not being signaled imply that all
> > points after 1 are not. If that's mentioned already somewhere, my bad.
> > If not, could you put the answer somewhere.
> > -Chris
>
> In [1, 3], if 1 is signaled, the timeline value is 1. And find_seqno(2)
> should return NULL.
>
>
> In the out_of_order selftest the chain was [1, 2, 3], 2 was signaled and
> the test was expecting no fence to be returned by find_seqno(2).
>
> But we still have to wait on 1 to complete before find_seqno(2) can
> return NULL (as in you don't have to wait on anything).
>
>
> Hope that answer the question.

I asked Christian to document why timeline works like this, but I
can't find it in the kerneldoc right now. If it's missing I think we
should fix that and add the explanation, iirc it was around gpu reset
creating too much havoc otherwise.
-Daniel

>
>
> -Lionel
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
