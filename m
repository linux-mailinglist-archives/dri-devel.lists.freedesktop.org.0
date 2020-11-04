Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E989D2A699F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 17:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EFF6E128;
	Wed,  4 Nov 2020 16:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09106E128
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:27:11 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 79so12375220otc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jKBsc1XM8CUKlg3VqmwM4QNdUSjpFH4yWF5dp0NTz8=;
 b=i+/uTvjsk976DicxcEHtNNkKd5tdb/MRp5JTe2+pAxIGQwwKIuIcHCZ9gIfNuEktop
 Ir1VcTIHdqTsD4wZdHCdfVujbxPqzBZ00Mm5Mu7qHa2cbwKkBevm00cgHWq320ih38Ge
 yItaK3iWE/DQC0jvHc3VxVW7uMRTu+v2PtiCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jKBsc1XM8CUKlg3VqmwM4QNdUSjpFH4yWF5dp0NTz8=;
 b=NExFCfOs5FSQPeHPGRd3ntEtaSXuajMNwZzJvky/yGzaSTL7AyUCkaxaFTo4FqWRNO
 xL7Lifa7bANgl8MJTxDL1uCLd963dI6UxZ0B+7YienBcAOLrsCkEO6l0iKxCia8W4hNg
 Q+ySHgz8hcExw3fruskZzlijcL7LrhtH0T6uhTqfkmdPNRNoWLTiQb5BeRoCsHmTRC1g
 4TnRG7VsUC1UTs244VNawBBbNV/8G2Mww1kh7jAqJwwksgoguZ0+JfpNTh6UkvqvywnH
 9i9Z4JvbKBBuXi5HaWth1XwI2Y1VhLREpYxvmmeLOibYvBfzgzDK7ZD9t8X7S4E1IMf2
 m5jw==
X-Gm-Message-State: AOAM531oeVqxQMi2+xmRwICtv7uSwNT7iKcllwxeG5+At2qOUMpZpb+t
 tVqJsyDsjFg6ljB6i9DkKA5mcUQ8SKfed9Oeu7gPNQ==
X-Google-Smtp-Source: ABdhPJwUkm33VhszJycM92X0W59/Lqj2SzkWRtSj8SP7VfVhLWlLHPhV+pa9uC6mpn9OH9RSQm2eEqL7TT7PFN/zowU=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr18948455otf.188.1604507229909; 
 Wed, 04 Nov 2020 08:27:09 -0800 (PST)
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
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
In-Reply-To: <20201104162125.GA13007@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 4 Nov 2020 17:26:58 +0100
Message-ID: <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
 KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 J??r??me Glisse <jglisse@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 4, 2020 at 5:21 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Nov 04, 2020 at 04:54:19PM +0100, Daniel Vetter wrote:
> > I don't really have a box here, but dma_mmap_attrs() and friends to
> > mmap dma_alloc_coherent memory is set up as VM_IO | VM_PFNMAP (it's
> > actually enforced since underneath it uses remap_pfn_range), and
> > usually (except if it's pre-cma carveout) that's just normal struct
> > page backed memory. Sometimes from a cma region (so will be caught by
> > the cma page check), but if you have an iommu to make it
> > device-contiguous, that's not needed.
>
> dma_mmap_* memory may or may not be page backed, but it absolutely
> must not be resolved by get_user_pages and friends as it is special.
> So yes, not being able to get a struct page back from such an mmap is
> a feature.

Yes, that's clear.

What we're discussing is whether gup_fast and pup_fast also obey this,
or fall over and can give you the struct page that's backing the
dma_mmap_* memory. Since the _fast variant doesn't check for
vma->vm_flags, and afaict that's the only thing which closes this gap.
And like you restate, that would be a bit a problem. So where's that
check which Jason&me aren't spotting?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
