Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2252A21BE
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 22:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6722B6EB76;
	Sun,  1 Nov 2020 21:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A3B6EB76
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 21:13:15 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9f24f50000>; Sun, 01 Nov 2020 13:13:25 -0800
Received: from [10.2.57.191] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 1 Nov
 2020 21:13:08 +0000
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
Date: Sun, 1 Nov 2020 13:13:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604265205; bh=GWXSjI75ejnpzeAzx+sY3ihD8k46wdcZjw6eIUm7yio=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=TG0DDiiN9wLyRJWPF4CK0bEiJecwbW6ZaU1EN3hcK+iiLqOS9MI5dU3fkfekhcLSo
 D8Uroub9UM3IxPuTpp/mdgWWmHBWeS5eox6FXTaFdsBWTBNRSgl5Cu5ZtmfE5KMOE7
 myLAKYSS+2WWJhxLFAZxS4gweCWLuvWhrXyo/YhKjdz4lKGmESIZ+FE4lXpbabFgXi
 pvFXgZ524Vh7ASupM1Te+PsZY8D0x5iGctVe+fU1Nuogn5PuHPjsxVHvqUnnw+jQJn
 V6H5EGgGWnRfNNY+MZZaEeCvQaNhrKoJRvhfG/sSJ5h2RgpbPxIN1qVGpViLA1sekZ
 JTKyA/FR7JJwQ==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>, Kyungmin
 Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:DMA BUFFER
 SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/20 2:30 AM, Daniel Vetter wrote:
> On Sun, Nov 1, 2020 at 6:22 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 10/31/20 7:45 AM, Daniel Vetter wrote:
>>> On Sat, Oct 31, 2020 at 3:55 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>>> On 10/30/20 3:08 AM, Daniel Vetter wrote:
>> ...
>>>> By removing this check from this location, and changing from
>>>> pin_user_pages_locked() to pin_user_pages_fast(), I *think* we end up
>>>> losing the check entirely. Is that intended? If so it could use a comment
>>>> somewhere to explain why.
>>>
>>> Yeah this wasn't intentional. I think I needed to drop the _locked
>>> version to prep for FOLL_LONGTERM, and figured _fast is always better.
>>> But I didn't realize that _fast doesn't have the vma checks, gup.c got
>>> me a bit confused.
>>
>> Actually, I thought that the change to _fast was a very nice touch, btw.
>>
>>>
>>> I'll remedy this in all the patches where this applies (because a
>>> VM_IO | VM_PFNMAP can point at struct page backed memory, and that
>>> exact use-case is what we want to stop with the unsafe_follow_pfn work
>>> since it wreaks things like cma or security).
>>>
>>> Aside: I do wonder whether the lack for that check isn't a problem.
>>> VM_IO | VM_PFNMAP generally means driver managed, which means the
>>> driver isn't going to consult the page pin count or anything like that
>>> (at least not necessarily) when revoking or moving that memory, since
>>> we're assuming it's totally under driver control. So if pup_fast can
>>> get into such a mapping, we might have a problem.
>>> -Daniel
>>>
>>
>> Yes. I don't know why that check is missing from the _fast path.
>> Probably just an oversight, seeing as how it's in the slow path. Maybe
>> the appropriate response here is to add a separate patch that adds the
>> check.
>>
>> I wonder if I'm overlooking something, but it certainly seems correct to
>> do that.
> 
> You'll need the mmap_sem to get at the vma to be able to do this
> check. If you add that to _fast, you made it as fast as the slow one.

Arggh, yes of course. Strike that, please. :)

> Plus there's _fast_only due to locking recurion issues in fast-paths
> (I assume, I didn't check all the callers).
> 
> I'm just wondering whether we have a bug somewhere with device
> drivers. For CMA regions we always check in try_grab_page, but for dax

OK, so here you're talking about a different bug than the VM_IO | VM_PFNMAP
pages, I think. This is about the "FOLL_LONGTERM + CMA + gup/pup _fast"
combination that is not allowed, right?

For that: try_grab_page() doesn't check anything, but try_grab_compound_head()
does, but only for pup_fast, not gup_fast. That was added by commit
df3a0a21b698d ("mm/gup: fix omission of check on FOLL_LONGTERM in gup fast
path") in April.

I recall that the patch was just plugging a very specific hole, as opposed
to locking down the API against mistakes or confused callers. And it does
seem that there are some holes.

> I'm not seeing where the checks in the _fast fastpaths are, and that
> all still leaves random device driver mappings behind which aren't
> backed by CMA but still point to something with a struct page behind
> it. I'm probably just missing something, but no idea what.
> -Daniel
> 

Certainly we've established that we can't check VMA flags by that time,
so I'm not sure that there is much we can check by the time we get to
gup/pup _fast. Seems like the device drivers have to avoid calling _fast
with pages that live in VM_IO | VM_PFNMAP, by design, right? Or maybe
you're talking about CMA checks only?


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
