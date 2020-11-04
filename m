Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA02A6D0A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 19:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2EA6E20A;
	Wed,  4 Nov 2020 18:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B76E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 18:45:07 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa2f6af0005>; Wed, 04 Nov 2020 10:45:03 -0800
Received: from [10.2.49.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 18:44:57 +0000
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@infradead.org>
References: <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org> <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
Date: Wed, 4 Nov 2020 10:44:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201104181708.GU36674@ziepe.ca>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604515503; bh=8Ugq3MVZhAulHFLpXWMZRWPLhPny25VZOQYdcq4TO0Y=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=LevZOWfSVNFRWN4kR3miaQt5LJlNcyeB9Ghugs0ySBdOh/MQLGl5DRy1UnBuawKGN
 MsfMPuReQvwD80mrwk72YzJgprfaPEzy1iWCw2bcBIdepgHc2yIb1Z3tSbNtmEzOtU
 74pXxKH+MYaO7mcOVRHUIJlaJ+S6YdrrRiDmU5IgDOTF2gsFbVWNUGDqZmjLUVrBs+
 KGS2R/Zsa7bMMbNrwo9WMhxZao/dnX05W1Igj+s1NtoEdpZL8MR5Y+v8eG6ulR90ea
 VKoKDEiFK4daZpfXrySmcBWNIL6VlfFacFRqV7CsvPsOFqcDAR/c16xbI63Eet0A3q
 CwJJD0KoyL0qA==
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
 KVM list <kvm@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 J??r??me Glisse <jglisse@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, Daniel
 Vetter <daniel.vetter@intel.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/20 10:17 AM, Jason Gunthorpe wrote:
> On Wed, Nov 04, 2020 at 04:41:19PM +0000, Christoph Hellwig wrote:
>> On Wed, Nov 04, 2020 at 04:37:58PM +0000, Christoph Hellwig wrote:
>>> On Wed, Nov 04, 2020 at 05:26:58PM +0100, Daniel Vetter wrote:
>>>> What we're discussing is whether gup_fast and pup_fast also obey this,
>>>> or fall over and can give you the struct page that's backing the
>>>> dma_mmap_* memory. Since the _fast variant doesn't check for
>>>> vma->vm_flags, and afaict that's the only thing which closes this gap.
>>>> And like you restate, that would be a bit a problem. So where's that
>>>> check which Jason&me aren't spotting?
>>>
>>> remap_pte_range uses pte_mkspecial to set up the PTEs, and gup_pte_range
>>> errors out on pte_special.  Of course this only works for the
>>> CONFIG_ARCH_HAS_PTE_SPECIAL case, for other architectures we do have
>>> a real problem.
>>
>> Except that we don't really support pte-level gup-fast without
>> CONFIG_ARCH_HAS_PTE_SPECIAL, and in fact all architectures selecting
>> HAVE_FAST_GUP also select ARCH_HAS_PTE_SPECIAL, so we should be fine.
> 
> Mm, I thought it was probably the special flag..
> 
> Knowing that CONFIG_HAVE_FAST_GUP can't be set without
> CONFIG_ARCH_HAS_PTE_SPECIAL is pretty insightful, can we put that in
> the Kconfig?
> 
> config HAVE_FAST_GUP
>          depends on MMU
>          depends on ARCH_HAS_PTE_SPECIAL
>          bool
> 
Well, the !CONFIG_ARCH_HAS_PTE_SPECIAL case points out in a comment that
gup-fast is not *completely* unavailable there, so I don't think you want
to shut it off like that:

/*
  * If we can't determine whether or not a pte is special, then fail immediately
  * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
  * to be special.
  *
  * For a futex to be placed on a THP tail page, get_futex_key requires a
  * get_user_pages_fast_only implementation that can pin pages. Thus it's still
  * useful to have gup_huge_pmd even if we can't operate on ptes.
  */


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
