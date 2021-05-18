Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E9387BDA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1926EB95;
	Tue, 18 May 2021 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2AE6EB95;
 Tue, 18 May 2021 15:01:04 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id o59so5086051qva.1;
 Tue, 18 May 2021 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kE/TYN77XS7xS5hsC3gM6u7JF175laQK+WTnSTDxZKE=;
 b=SYzZ7gdw6M7DKu4lfJl64L8/O3oF1EP5Cz6ffVWZP/ToyPhYvn3P1V4ai3yN4NFPX0
 SDupjVyVcOSI6qYyFZ0K8qCEu+vrGUu2xMFr0y9AfNruXD7mUybnfeOKuloS6mwh2WD0
 /U33jloGVrn5Q/c42J4A0SUsPGI0zT68rEpefTpNIpVv3O6C5iWqJghe2eH5Kff5RADA
 /WMpHAalSTTm44LE0jz9Oz5eJaLLSxSSZ1LAcngAAv1X8UDJWHgaIOAXsx+1JCvxgKYr
 w7uPEOO9nenpvm+hcfrusf7SI3nZ/EI1bw9GTOTXfd2ROuv9pEu+4mAVLr/XDpJqEZVN
 GzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kE/TYN77XS7xS5hsC3gM6u7JF175laQK+WTnSTDxZKE=;
 b=sht3L/fJKg83vHyPqxgVH9wpD1pedwDEW+0PErIjpGRFn40lFlSA//A3jJVZgDN8My
 9MOZA2JtuiVxFk74SVhNS6F8BYvcC6nlXcAX3btd4E68rPu7JK8oeekNje9ZFzUXxGG+
 97l2+IQS5zTcAW/tQ0KNu7wee7Guo3Swc195KW0SwseWAWrc7ZF+lu60O4AxaMb8jsui
 quohNn0Mw1cona7nexK+OrdrOT3FM+ix/xbgXGp/codKmT5GLmKCjrbyj3ueuB8XJkqU
 DGo/mtNFZxKJAv3ZoH8dbiUALqnIuMjSXpU79PwOknLgEehxTB4KeTRA9z+s2iqqo5Ft
 Ufyw==
X-Gm-Message-State: AOAM533Oajs1ERZr7MVG8Fh45W/0SbgQi8GrNHnHH4iuIieM78JKjwVq
 bQsCiulGOVQPpIWImMCSzZP8s38ZRP1LgR52U4Q=
X-Google-Smtp-Source: ABdhPJz2hQNarssvJBe1pan0qA1TFUCaePTPwAruUq5jstWfe6l7qkN+WVv7//kBN1b/uhwG8FK/5UmlrFj+MB5ni8M=
X-Received: by 2002:a0c:e40e:: with SMTP id o14mr6041377qvl.30.1621350063191; 
 Tue, 18 May 2021 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de>
 <87pmxqiry6.fsf@depni.sinp.msu.ru> <20210517123716.GD15150@lst.de>
 <87lf8dik15.fsf@depni.sinp.msu.ru> <20210517131137.GA19451@lst.de>
 <CAM0jSHPy68kMi8NnpAO7ESVW0Ct=dhZ0kYHJO7APy-GBsNp2fQ@mail.gmail.com>
 <20210518132155.GB2617@lst.de>
In-Reply-To: <20210518132155.GB2617@lst.de>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 18 May 2021 16:00:36 +0100
Message-ID: <CAM0jSHNR04h-t4_mE4KOGbu7fR8En4uNnhQSkB+bE8Q5vqcSjg@mail.gmail.com>
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

On Tue, 18 May 2021 at 14:21, Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, May 17, 2021 at 06:06:44PM +0100, Matthew Auld wrote:
> > > Looks like it is caused by the validation failure then.  Which means the
> > > existing code is doing something wrong in its choice of the page
> > > protection bit.  I really need help from the i915 maintainers here..
> >
> > AFAIK there are two users of remap_io_sg, the first is our shmem
> > objects(see i915_gem_shmem.c), and for these we support UC, WC, and WB
> > mmap modes for userspace. The other user is device local-memory
> > objects(VRAM), and for this one we have an actual io_mapping which is
> > allocated as WC, and IIRC this should only be mapped as WC for the
> > mmap mode, but normal userspace can't hit this path yet.
>
> The only caller in current mainline is vm_fault_cpu in i915_gem_mman.c.
> Is that device local?

The vm_fault_cpu covers both device local and shmem objects.

>
> > What do we need to do here? It sounds like shmem backed objects are
> > allocated as WB for the pages underneath, but i915 allows mapping them
> > as UC/WC which trips up this track_pfn thing?
>
> To me the warnings looks like system memory is mapped with the wrong
> permissions, yes.  If you want to map it as UC/WC the right set_memory_*
> needs to be used on the kernel mapping as well to ensure that the
> attributes don't conflict.

AFAIK mmap_offset also supports multiple active mmap modes for a given
object, so set_memory_* should still work here?
