Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0630F952
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 18:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005DD6ED8D;
	Thu,  4 Feb 2021 17:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15346ED8D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 17:16:39 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id s107so4115937otb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJnVO3IRTh6jLTnURSMqZt6jb+mhY21ToLMIpLkV9R4=;
 b=DhM2acIpr+HIk3JVAZvNpFn5a6f9MUwyT7EWsFy2cOKrCeHyfYQt+p5Kh7UioqqHL1
 RnHG2tXuYB5AuR4K+IbXmPhqZQSGTGKUrGAGszVMQOtsx99l6BMz9GYjtfE3rwM9WtdJ
 UXNmWYZbNjQi3TqhxNOS+LsJ7E4aexI6FMs8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJnVO3IRTh6jLTnURSMqZt6jb+mhY21ToLMIpLkV9R4=;
 b=hRLoiyL3fey/fAa94JZkima63jVz57MhYUptXzCdtT2n7ntyGxYokkUKsWKI+7qZ2i
 L4V0INQkuOJwmqKD8LblzTU6WPEpLijBS5I6ueiZqhKjxPIzlV9F2keeFKJotAV7hQuZ
 Skj8Y3P+2zMZxkn13gl4ePXyZ7UydnySTZV7jy1XHKu3US/g1IuKqtZq6LUF1tooErgN
 XxncGUjf/B4iw/gltF09z+/xlzqaqOgiWes1yBTuGI+9fxNttQ1a//BqzmwAtY6cuVmB
 L4084yHsxGC+owhoOBQgYjshy9V0vQcWkIMsEoW/eqVuHN2m1R7fwb5fBTf3TUR/g0Ot
 j3gA==
X-Gm-Message-State: AOAM530acokFpjyBCCUVOSE11ENPH/x1nyA+Hc8ygeyK3TWvqyfh8/76
 YNmLAeDA7jlRYiHlKahH1k/7tn9u5glY2eWaoab4eA==
X-Google-Smtp-Source: ABdhPJwAkGg4N4y18wGDr+SCd9/HnouTpio3RzotUFP5dy6ZXX80lPrKik+UQ1LGNd1ps7C62WHTl9aITStWc16IyCk=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr236633otr.303.1612458998103; 
 Thu, 04 Feb 2021 09:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
In-Reply-To: <20210204161339.GX4718@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 4 Feb 2021 18:16:27 +0100
Message-ID: <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
> > tldr; DMA buffers aren't normal memory, expecting that you can use
> > them like that (like calling get_user_pages works, or that they're
> > accounting like any other normal memory) cannot be guaranteed.
> >
> > Since some userspace only runs on integrated devices, where all
> > buffers are actually all resident system memory, there's a huge
> > temptation to assume that a struct page is always present and useable
> > like for any more pagecache backed mmap. This has the potential to
> > result in a uapi nightmare.
> >
> > To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> > blocks get_user_pages and all the other struct page based
> > infrastructure for everyone. In spirit this is the uapi counterpart to
> > the kernel-internal CONFIG_DMABUF_DEBUG.
>
> Fast gup needs the special flag set on the PTE as well.. Feels weird
> to have a special VMA without also having special PTEs?

There's kinda no convenient & cheap way to check for the pte_special
flag. This here should at least catch accidental misuse, people
building their own ptes we can't stop. Maybe we should exclude
VM_MIXEDMAP to catch vm_insert_page in one of these.

Hm looking at code I think we need to require VM_PFNMAP here to stop
vm_insert_page. And looking at the various functions, that seems to be
required (and I guess VM_IO is more for really funky architectures
where io-space is somewhere else?). I guess I should check for
VM_PFNMAP instead of VM_SPECIAL?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
