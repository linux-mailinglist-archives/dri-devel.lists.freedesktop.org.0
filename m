Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE9CB0B8F
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 18:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DA510E5E0;
	Tue,  9 Dec 2025 17:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E934110E536
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:24:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4FF1691;
 Tue,  9 Dec 2025 04:24:22 -0800 (PST)
Received: from [10.1.36.174] (unknown [10.1.36.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595E93F740;
 Tue,  9 Dec 2025 04:24:27 -0800 (PST)
Message-ID: <081a44f5-9400-4c62-8760-6896011fa3e2@arm.com>
Date: Tue, 9 Dec 2025 12:24:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
Content-Language: en-GB
To: Barry Song <21cnbao@gmail.com>
Cc: gao xu <gaoxu2@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "surenb@google.com" <surenb@google.com>,
 zhouxiaolong <zhouxiaolong9@honor.com>
References: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
 <CAGsJ_4w-XtJ8zzc8H4OwW4XV21T8FWGxeoMnfAxmAgBhzrvxWQ@mail.gmail.com>
 <6f891b70-7ee9-44a3-92a1-bbeb4d2b9fee@arm.com>
 <CAGsJ_4xb--mwsPHVFXzcpnZ29Wh8N-OTZNyNVW2CZd-U00A_ww@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAGsJ_4xb--mwsPHVFXzcpnZ29Wh8N-OTZNyNVW2CZd-U00A_ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 17:28:12 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2025 11:37, Barry Song wrote:
> On Mon, Dec 8, 2025 at 6:38 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 08/12/2025 09:52, Barry Song wrote:
>>> On Mon, Dec 8, 2025 at 5:41 PM gao xu <gaoxu2@honor.com> wrote:
>>>>
>>>> commit 04c7adb5871a ("dma-buf: system_heap: use larger contiguous mappings
>>>> instead of per-page mmap") facilitates the use of PTE_CONT. The system_heap
>>>> allocates pages of order 4 and 8 that meet the alignment requirements for
>>>> PTE_CONT. enabling PTE_CONT for larger contiguous mappings.
>>>
>>> Unfortunately, we don't have pte_cont for architectures other than
>>> AArch64. On the other hand, AArch64 isn't automatically mapping
>>> cont_pte for mmap. It might be better if this were done
>>> automatically by the ARM code.
>>
>> Yes indeed; CONT_PTE_MASK and PTE_CONT are arm64-specific macros that cannot be
>> used outside of the arm64 arch code.
>>
>>>
>>> Ryan(Cced) is the expert on automatically setting cont_pte for
>>> contiguous mapping, so let's ask for some advice from Ryan.
>>
>> arm64 arch code will automatically and transparently apply PTE_CONT whenever it
>> detects suitable conditions. Those suitable conditions include:
>>
>>   - physically contiguous block of 64K, aligned to 64K
>>   - virtually contiguous block of 64K, aligned to 64K
>>   - 64K block has the same access permissions
>>   - 64K block all belongs to the same folio
>>   - not a special mapping
>>
>> The last 2 requirements are the tricky ones here: We require that every page in
>> the block belongs to the same folio because a contigous mapping only maintains a
>> single access and dirty bit for the whole 64K block, so we are losing fidelity
>> vs per-page mappings. But the kernel tracks access/dirty per folio, so the extra
>> fidelity we get for per-page mappings is ingored by the kernel anyway if the
>> contiguous mapping only maps pages from a single folio. We reject special
>> mappings because they are not backed by a folio at all.
>>
>> For your case, remap_pfn_range() will create special mappings so we will never
>> set the PTE_CONT bit.
>>
>> Likely we are being a bit too conservative here and we may be able to relax this
>> requirement if we know that nothing will ever consume the access/dirty
>> information for special mappings? I'm not if that is the case in general though
>> - it would need some investigation.
>>
>> With that issue resolved, there is still a second issue; there are 2 ways the
>> arm64 arch code detects suitable contiguous mappings. The primary way is via a
>> call to set_ptes(). This part of the "PTE batching" API and explicitly tells the
>> implementaiton that all the conditions are met (including the memory being
>> backed by a folio). This is the most efficient approach. See contpte_set_ptes().
>>
>> There is a second (hacky) approach which attempts to recognise when the last PTE
>> of a contiguous block is set and automatically "fold" the mapping. See
>> contpte_try_fold(). This approach has a cost because (for systems without
>> BBML2_NOABORT) we have to issue a TLBI when we fold the range.
>>
>> For remap_pfn_range(), we would be relying on the second approach since it is
>> not currently batched (and could not use set_ptes() as currently spec'ed due to
>> there being no folio). If we are going to add support for contiguous pfn-mapped
>> PTEs, it would be preferable to add equivalent batching APIs (or relax set_ptes()).
>>
> 
> Thanks a lot, Ryan. It seems quite tricky to support automatic cont_pte.
> 
>> I think this would be a useful improvement, but it's not as straightforward as
>> adding PTE_CONT in system_heap_mmap().
> 
> Since it's just a driver, I'm not sure if it's acceptable to use CONFIG_ARM64.
> However, I can find many instances of it in drivers.
> drivers % git grep CONFIG_ARM64 | wc -l
>      127
> 
> On the other hand, a corner case is when the dma-buf is partially unmapped.
> I assume cont_pte can still be automatically unfolded, even for
> special mappings?

I think unfolding will probably happen to work, but you're definitely in the
neighbourhood of "horrible hack that may not work as intended in some corner cases".

I think it would be much better to support batching for pfn-mapped ptes. That
would generalize to many more users. (and I might be interested in taking a look
at some point next year if nobody else gets to it).

We deliberately didn't want to expose the idea of a single, specific contiguous
size to the generic code so that the arch could make more fine-grained decisions. :)

Thanks,
Ryan



> 
> Thanks
> Barry

