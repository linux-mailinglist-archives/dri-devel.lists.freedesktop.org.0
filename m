Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E757924410B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 00:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3846E260;
	Thu, 13 Aug 2020 22:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF656E260
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 22:04:52 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id g18so1543871ooa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 15:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3xfqWmRtflhotperG6NWnIwC3g3Q247SCA9p41kwBGs=;
 b=UolcndJsDVYSOyRpQ9JTr2zGfNCUwNjMdyqIq4GBD+js16X0QMFHU5pkdTbeMN4D3J
 uwZsx83sUIAi5fU+Gbv5X5jO0+tv/noXUjIKV7uJOsz6DBylNxDXlnygKa+NedmkkH6d
 qTEw+QDw3sG5vtR/zRjLg8lz8ckaz7kKb1JsiOEOYroIvUHv+ofhMZxfUi+xgv5arPwO
 UvRKnfgaTxRKRU7o9D3LtRh/ubS9wF0j9Y88CIhCLROepZJfUBs77IHt62o8ek1hDQ8/
 mNQPIZ4ViJW7nKvDYb/zMZHPeb8DTESKlnSV27oRfA8E5Jq7vDISu7SxEKObQ/gQCYMS
 /TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3xfqWmRtflhotperG6NWnIwC3g3Q247SCA9p41kwBGs=;
 b=jY3+sPeaQcCdW2++tjI8d200Y74PjOW46TcRh/FrCYB08Lvt7nFR/uk4VL3/J8dYI1
 Ptp0z6v5JytHszBCIrsJMXMApiNX1M98hcGFcV2OZFgg5F2Sv4pzfxm5dJART5Lyc67N
 mN302hMZBFeswOYRK3t/0P6W0upf/+laWfQPmARjA8Pe9PWuu4ztrkOUQiLDD5uHv1zK
 Vt0BCzj18In9wxkkYyrHpKU56pmqowKXvBmGmA0TnEn86PbqA/LsAgh1zQNpFn1vB9ft
 SZdDqUDLRhcer0fkBQpen/CucOnq9hlq3lexRlPUMqt/bi9mp0uue0U1uksWIQPUTb7K
 dzMw==
X-Gm-Message-State: AOAM531HPdOtHxgoO+oAGcaWnGVAMnKaPdKngwK+2GrasSufnqFVaYU1
 2SksXJeopsvW6ckfePaWJyQ/29rJh0ISIbHT1GmhAA==
X-Google-Smtp-Source: ABdhPJzyc0QUIbGQc/Raud6mkyJ1G5M3ZSdPSTn1QQLc40+ET2RlCL4akGxQ7ZSYtufsf1cTHSfN70KY25WQ15RXw0c=
X-Received: by 2002:a4a:ca11:: with SMTP id w17mr6358838ooq.88.1597356291596; 
 Thu, 13 Aug 2020 15:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200725032633.125006-1-john.stultz@linaro.org>
 <20200813100411.3gh2awfbmdjupbnw@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200813100411.3gh2awfbmdjupbnw@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 13 Aug 2020 15:04:40 -0700
Message-ID: <CALAqxLVyNtnXeCU1u=kV02k2wGYtBW1iRVLrOpNetRCnBvepvQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] dma-heap: Add proper kref handling on dma-buf heaps
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 nd <nd@arm.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 3:04 AM Brian Starkey <brian.starkey@arm.com> wrote:
> On Sat, Jul 25, 2020 at 03:26:33AM +0000, John Stultz wrote:
> > Add proper refcounting on the dma_heap structure.
> > While existing heaps are built-in, we may eventually
> > have heaps loaded from modules, and we'll need to be
> > able to properly handle the references to the heaps
>
> I'm not 100% clear on the intention here. What would take/drop a
> reference on a heap?

Yea. At the moment nothing, but I did this cleanup as part of some
other changes which would allow drivers that want to produce a dmabuf
without having to create their own exporter to find an existing heap
and allocate from that. Thus we needed to do proper reference counting
on the handles to the heap. Those changes are stuck for now waiting
for an user to be publicly submitted, but this change initially seemed
like a reasonable correctness cleanup, so I went ahead and sent it,
but as Daniel noted we can wait for real users to be submitted before
adding any extra complexity upstream.

> In the case of modules I think the bigger problem is how to prevent
> the module getting removed while there's still something using it.

That's true. Probably need something like a kref on each buffer allocated.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
