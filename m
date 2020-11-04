Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216172A6860
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 16:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF3C89D7F;
	Wed,  4 Nov 2020 15:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2988589D7F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 15:54:31 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 79so12264546otc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 07:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5iSM0n3L7+OTVROVCVTwu3uWAzU5mN6qUkDTEIh4do=;
 b=PitcG0uAHrmeOMZWf07+5nFovh7kr7Adgn3pV0IjFTvWK31RX96qNAX9Ks5Dh/x/M1
 BTJhllHwgJtYkqu+DoGQVr+zvfuKEAes8E2EKiqu7lnWd/wgVh9ipY9g1P/exu8Ll0XH
 MlM5Nev4kEpw3fiAkWDQeeOa/AbBbn0nfEjrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5iSM0n3L7+OTVROVCVTwu3uWAzU5mN6qUkDTEIh4do=;
 b=odmH5to13tbmjDKnMAINk+Jvpv/koshwqMigJ8iuUW41+1fuBsaL2SYIvReaNSk3lo
 6M4A00+RUUcnD6p8rwUX+XBwFLfKiV4Dv51SGxUfdFTbTH7qUN62BhALzZXYpFVxH2HG
 DTHDKzEL1koggcefyXLOON4FuSJ7qynFzhd4KYiK2n/iJHoR8dkrU2YMMtb18+DQif/y
 ei9+GgNswFMgaLV+5IZS15GmN0zic7eB1m3gKJ5zEs7B0kMZgU/Z6IsFhSIO9JcaCk7u
 r34gGGaPtocYW9T+H5bXxbqRmVoN9dyme5+BPV81I9aCwygK6Bbf5FeMNBaHW0u/Hd3r
 GCKA==
X-Gm-Message-State: AOAM532nZp+mbNUjT9iixEQjMon33nriGc3dnEacHJ4XX8hyyzeHzTkO
 3x6njj1Iod3jXMw/kG82lFyz2pQ73XgY8uPKBq5voA==
X-Google-Smtp-Source: ABdhPJwFTZ6h8d4LZSz0ZdASZtc67ts9b22F6yGqx4swNCRA+uz1tGrz0fV1z6m2B8vN3lXuyoPJEYkFgolkB9M18jE=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr18846565otf.188.1604505270511; 
 Wed, 04 Nov 2020 07:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
In-Reply-To: <20201104140023.GQ36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 4 Nov 2020 16:54:19 +0100
Message-ID: <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Pawel Osciak <pawel@osciak.com>, KVM list <kvm@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 4, 2020 at 3:00 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sun, Nov 01, 2020 at 11:50:39PM +0100, Daniel Vetter wrote:
>
> > It's not device drivers, but everyone else. At least my understanding
> > is that VM_IO | VM_PFNMAP means "even if it happens to be backed by a
> > struct page, do not treat it like normal memory". And gup/pup_fast
> > happily break that. I tried to chase the history of that test, didn't
> > turn up anything I understood much:
>
> VM_IO isn't suppose do thave struct pages, so how can gup_fast return
> them?
>
> I thought some magic in the PTE flags excluded this?

I don't really have a box here, but dma_mmap_attrs() and friends to
mmap dma_alloc_coherent memory is set up as VM_IO | VM_PFNMAP (it's
actually enforced since underneath it uses remap_pfn_range), and
usually (except if it's pre-cma carveout) that's just normal struct
page backed memory. Sometimes from a cma region (so will be caught by
the cma page check), but if you have an iommu to make it
device-contiguous, that's not needed.

I think only some architectures have a special io pte flag, and those
are only used for real mmio access. And I think the popular ones all
don't. But that stuff is really not my expertise, just some drive-by
reading I've done to understand how the pci mmap stuff works (which is
special in yet other ways I think).

So probably I'm missing something, but I'm not seeing anything that
prevents this from coming out of a  pup/gup_fast.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
