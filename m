Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B0B30797
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 23:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6489310EA37;
	Thu, 21 Aug 2025 21:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hgwm17af";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD3D10EA37
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 21:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755810047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cp1mFCWwcTWQzzsUUmh88+YFkDBcq7Y5lQlba0VlHo0=;
 b=hgwm17afif2H66kmOBZawWpdZSaILBIYskvmAefYnQv1qhbiGx8tHx0c+W0ou5ex49GnOU
 8T6W0vSn6kVJ+nMoPfOzlg54kWsFuDFWrNMEm0ELoypMRVbfM5ijKOMRn18tCik6xECAnE
 8KO3fDDq+H3PQoTENylzHcJhciV9BZY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-xWzpMKHIOPm_LUAzHnLIWg-1; Thu, 21 Aug 2025 17:00:45 -0400
X-MC-Unique: xWzpMKHIOPm_LUAzHnLIWg-1
X-Mimecast-MFC-AGG-ID: xWzpMKHIOPm_LUAzHnLIWg_1755810041
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b9e4146902so573804f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755810041; x=1756414841;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cp1mFCWwcTWQzzsUUmh88+YFkDBcq7Y5lQlba0VlHo0=;
 b=RVdr0ciKiJkLyM2f0mHKFUfBxrqbwHrN8sFyJihf1x3QmMmOe9/0nvhLKJQ56WIlQz
 Xy7xa7dag8ibCoxFxSdEHpG8aXlNac+D1+3gHckYsD8N+aYK/Aaey0YeA+5sUQg+aVjB
 VulgYnjItnK1x+urUVtwpJQ148NY/Nu3chgrAY39GAqdVgGOuTEsDAbcnS6WWeXTx4wn
 tiQc4M3UVm5v0hD/jLffaWegUDhO7zwXJ1WhrUuOpYd35xst9w8BwEPqmMgui77CfcL8
 0Kg/eCF5JzcXIt6hPQZe0CA7vNdka4SsYMKw9aKzMZqoKoqDufcCd+gpaGucoMYy7K0X
 X85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ob8En7akIOhgLmrj9kUWq/Nbxm9AIg0A0GwubrE7t/XNN0iKgI0Su722a5f4PSCcuYImUIqQOzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVnjSPYSccJ+Y2/baKbtaxx8Pi9d4gD6fGu9MyT6BpT9lNQWsD
 Qyyrdo+FGm7wC7QHF7AlXlDxdXzEXU6Xu5oNC+1LBj9fRMSICviGG2ICf+p6K04FSMRd30mGy8v
 N8Vligzj9zBRoJ9qkb69Is78IAL8s+P7Je5ExhhkxAaT3POEas5HnC/TOEFi+m1aTLxuB6Q==
X-Gm-Gg: ASbGncsM2lSKEisLrjtha+2MFOd9vnkNuI8/an7PZ9fPn+7M/Z+nWXks3+675p6abRv
 5eCoQxVyVCeNpzLLQDP41JRQgx/ydXAtoJiUvlnneM7ee2S9M31BjkTzMlS1ioLPrpa8pTG5Yzg
 UMe3duxNSv98UA1FWynCd3cnc7iXPMGH0p+rl1zrkPw2X74iI84z53SxVtjAnNFjHUVHtDlY8kF
 1I4+lUw54IXNL5yVZ9LRmf03lSx16RkRzl2EPhOlgpN/mwv8cAo7WTa4W8lnmr1zOFiGUq2aoO3
 FkDF6rJUIZIX9gx7F0QuRSdYK6YjJszAIA5QdWtw0wepcN3v6/e5suM34bnu03pMvpKOQuBQp8I
 98oTvEmIElo/IiQ8kliDGv+x4dMCiulOsAUwqi93uh8ub/mYc1pKeO0ykBQoKSg==
X-Received: by 2002:a05:6000:200d:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3c5daa27e6amr265212f8f.7.1755810041314; 
 Thu, 21 Aug 2025 14:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7vpqV63aDfbj4LuprqMLqq42InG6u1nR+Dt/+ZPeyx1uRJcEanVY8H02OCG3yOg5OQPh6rw==
X-Received: by 2002:a05:6000:200d:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3c5daa27e6amr265173f8f.7.1755810040805; 
 Thu, 21 Aug 2025 14:00:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f26:ba00:803:6ec5:9918:6fd?
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c4ccbf04fasm3476159f8f.7.2025.08.21.14.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 14:00:40 -0700 (PDT)
Message-ID: <23c6e511-19b2-4662-acfc-18692c899a6c@redhat.com>
Date: Thu, 21 Aug 2025 23:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/35] mm: simplify folio_page() and folio_page_idx()
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-14-david@redhat.com>
 <E1AA1AC8-06E4-4896-B62B-F3EA0AE3E09C@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <E1AA1AC8-06E4-4896-B62B-F3EA0AE3E09C@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hQ5BJrRGaU1RFZt_cdCmNIIoZ0OD2JziaY5yseLra6k_1755810041
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21.08.25 22:55, Zi Yan wrote:
> On 21 Aug 2025, at 16:06, David Hildenbrand wrote:
> 
>> Now that a single folio/compound page can no longer span memory sections
>> in problematic kernel configurations, we can stop using nth_page().
>>
>> While at it, turn both macros into static inline functions and add
>> kernel doc for folio_page_idx().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/linux/mm.h         | 16 ++++++++++++++--
>>   include/linux/page-flags.h |  5 ++++-
>>   2 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 48a985e17ef4e..ef360b72cb05c 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -210,10 +210,8 @@ extern unsigned long sysctl_admin_reserve_kbytes;
>>
>>   #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
>>   #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>> -#define folio_page_idx(folio, p)	(page_to_pfn(p) - folio_pfn(folio))
>>   #else
>>   #define nth_page(page,n) ((page) + (n))
>> -#define folio_page_idx(folio, p)	((p) - &(folio)->page)
>>   #endif
>>
>>   /* to align the pointer to the (next) page boundary */
>> @@ -225,6 +223,20 @@ extern unsigned long sysctl_admin_reserve_kbytes;
>>   /* test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE */
>>   #define PAGE_ALIGNED(addr)	IS_ALIGNED((unsigned long)(addr), PAGE_SIZE)
>>
>> +/**
>> + * folio_page_idx - Return the number of a page in a folio.
>> + * @folio: The folio.
>> + * @page: The folio page.
>> + *
>> + * This function expects that the page is actually part of the folio.
>> + * The returned number is relative to the start of the folio.
>> + */
>> +static inline unsigned long folio_page_idx(const struct folio *folio,
>> +		const struct page *page)
>> +{
>> +	return page - &folio->page;
>> +}
>> +
>>   static inline struct folio *lru_to_folio(struct list_head *head)
>>   {
>>   	return list_entry((head)->prev, struct folio, lru);
>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>> index d53a86e68c89b..080ad10c0defc 100644
>> --- a/include/linux/page-flags.h
>> +++ b/include/linux/page-flags.h
>> @@ -316,7 +316,10 @@ static __always_inline unsigned long _compound_head(const struct page *page)
>>    * check that the page number lies within @folio; the caller is presumed
>>    * to have a reference to the page.
>>    */
>> -#define folio_page(folio, n)	nth_page(&(folio)->page, n)
>> +static inline struct page *folio_page(struct folio *folio, unsigned long nr)
>> +{
>> +	return &folio->page + nr;
>> +}
> 
> Maybe s/nr/n/ or s/nr/nth/, since it returns the nth page within a folio.

Yeah, it's even called "n" in the kernel docs ...

> 
> Since you have added kernel doc for folio_page_idx(), it does not hurt
> to have something similar for folio_page(). :)

... which we already have! (see above the macro) :)

Thanks!

-- 
Cheers

David / dhildenb

