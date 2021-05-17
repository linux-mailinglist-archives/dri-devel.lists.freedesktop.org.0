Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673B383ABB
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACDB6E9F9;
	Mon, 17 May 2021 17:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176156E9F7;
 Mon, 17 May 2021 17:07:13 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id c13so2285342qvx.5;
 Mon, 17 May 2021 10:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAVM06Z0b3X00uWZ/iOWO0Am27P94BoQacVHMIqOeTA=;
 b=Hi7Pzs6QbfTYK6VkC34Npoj70CXFPM+CGdoBXqdqgKx+d3k1CXMiyvi2NxJ9o+3Ps5
 TUczTsSeJIYSDtqqvDKgZ6WhB1TB++5ox4YpvxJVaHH1xLROr3NUCcg4upKIy1xQgMGN
 Ev+9CRnJzuDT8U96AnUq/+CzcBXut28+0MFLmVe1zM8BLZNzk1iHzg8HiPZobysWXV2H
 6SivE7N9E4vkYFIq9fIsn0B8UXwgxVu+CX08qBZs9j7rllsatUG1ywvTEZvVboY4C5gt
 ugBSSY1T1VgYMOi5OEi1l8AOzlbs2C6By2kupIg3G92xdpRjkqBAo3cTRWAESPoJILaa
 yCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAVM06Z0b3X00uWZ/iOWO0Am27P94BoQacVHMIqOeTA=;
 b=Ff5/AJgw+E798RbqTeq0u5XTRkEb77L1av3L0tONEmjlvdbkNrdBj3yEXzdPZIXHL8
 ode/Wkm/PlL9aJaFwadK6ZEjkXg1d5dWDJl621z+McSilpeJqcueO1bz/4Emy5Gy0Eaj
 HJd7YE4Ab613oSnWaOfdcWi3UL9BqliqlRNyrTCdnMcqo28x3TQ6X50UGAEzohI91xWm
 3AU9AsflDGxWzKxrpRuVoC2u40vf9I0YVtLtQxVo/Y9LRjvFlObcUc5RlaI4rdJX4EoK
 xZ76bQmYV7e9n1IlnEx8anIIV2o0v3Kr6WNi+OfsBpURmLMXWcbkysCT+N569D0Sbi08
 VSiA==
X-Gm-Message-State: AOAM530GUBeg4y3lTWOJIb0mlQHtSWVEQpmgihE3jzOEeUN2e8EwomZu
 PmrzPuo7npstNr8lFKdnWva22WSExXEbofYJHd8=
X-Google-Smtp-Source: ABdhPJzx7xfbVLxtJRcNnW6bLoi3veRw1dYSAINsnytiKfr6pa5SKgDCTSXmaY3v6JH/Q6kWZHSQFDo8ra71nMmy0Wo=
X-Received: by 2002:ad4:4961:: with SMTP id p1mr611618qvy.43.1621271231753;
 Mon, 17 May 2021 10:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de>
 <87pmxqiry6.fsf@depni.sinp.msu.ru> <20210517123716.GD15150@lst.de>
 <87lf8dik15.fsf@depni.sinp.msu.ru> <20210517131137.GA19451@lst.de>
In-Reply-To: <20210517131137.GA19451@lst.de>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 17 May 2021 18:06:44 +0100
Message-ID: <CAM0jSHPy68kMi8NnpAO7ESVW0Ct=dhZ0kYHJO7APy-GBsNp2fQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 May 2021 at 14:11, Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, May 17, 2021 at 04:09:42PM +0300, Serge Belyshev wrote:
> > Christoph Hellwig <hch@lst.de> writes:
> >
> > > As an ad-hoc experiment:  can you replace the call to remap_pfn_range
> > > with remap_pfn_range_notrack (and export it if you build i915 modular)
> > > in remap_io_sg and see if that makes any difference?
> >
> > That worked, thanks -- no artifacts seen.
>
> Looks like it is caused by the validation failure then.  Which means the
> existing code is doing something wrong in its choice of the page
> protection bit.  I really need help from the i915 maintainers here..

AFAIK there are two users of remap_io_sg, the first is our shmem
objects(see i915_gem_shmem.c), and for these we support UC, WC, and WB
mmap modes for userspace. The other user is device local-memory
objects(VRAM), and for this one we have an actual io_mapping which is
allocated as WC, and IIRC this should only be mapped as WC for the
mmap mode, but normal userspace can't hit this path yet.

What do we need to do here? It sounds like shmem backed objects are
allocated as WB for the pages underneath, but i915 allows mapping them
as UC/WC which trips up this track_pfn thing?

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
