Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B62B37F0C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 11:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5325110E797;
	Wed, 27 Aug 2025 09:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="boTT6trz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC8B10E797;
 Wed, 27 Aug 2025 09:42:41 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3cd59c5a953so29130f8f.0; 
 Wed, 27 Aug 2025 02:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756287759; x=1756892559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
 b=boTT6trz7a9Ake9/X37yuieYBa2ZL6MmlDK7bh75W7a7c8v2LX/GWVD/D/+xgv7A9F
 q3Z2a3SuLuIoq9PcJ4itjiIuPY1HZeGQrzhvSGs9cbYDLimux16m3KlhhzOpGMh4I1O3
 vnzYNlB8c/0CKXrAktFpx1O3J+D2VMoCV7iQpKI+MGxiOYj4XXIUO9nYjBKd5q9G4+ZU
 4R8l4fHzOtbjTWizBfTyqMCHoJYajUcUBKAFSGCugFdMUA1L1LH9eJ98YTonnM4C9maf
 aEwfyzhuAuLIly83Hdoa4zr4VF28f7OpFgmd1nWla29ivqL7efCSW3YnrpzcAsZA99q7
 0tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756287759; x=1756892559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
 b=SuNdc7qzzUfXhTWd6U7z0z7hVgu4u5dzLigGNYeC97mD7S5MD0F8ggdChhgXSht8hh
 t17eGymhdpp/WDGxS3Ff9XVCuHW0km7mmsoBUrbtFKqDlhPZnC4mPiweJBcfTIJJ7Pu1
 awC0ipWNhzApg19fOz24mNmXaN+TrcCh0qSl6B7XiPvuRiCogeuWe68TsMI5NSj+ZDEm
 Axdnf3Iop55oyOkQhEQun/xnbkX3kAbEF+E/pEdaTEmy7OLURKqo98xX6PKQScLbotQz
 8J/fQHwWRpr4wCbviAt3aZKPKw8NwdT/G2Fwoc9h2KLQ+5yQPVTHqIN0ko1DCoqHWVK+
 8amw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9nCdutnOLmtBoEJ3u33Z62Me2w+FMs/TqXSFqFwQlY9sp75j5RcXz04n5EZBUdwRC9RViApCOI4Bi@lists.freedesktop.org,
 AJvYcCX5gMiblgoGSn64Mlqeav4Yh5vSLxC7KvBoP36H9BcdxVQ/ahUr1hP/9iUwGT85uX8PGdfUnQ2HnpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmN40DqH3IqDMIDGbfU9KKrzZe+E2EOFcl6qW6Y8Jd1JJxaPqM
 A5mH4JPHoM5iYl6YXPs4ExFnMO+ARuHkkLe3xmVm0BzncGMRWrkQM8Z8
X-Gm-Gg: ASbGnctZLe3q8oVUKjK0FYHNijJ2yg8U0llfROxi25Oj6gnRhiGDQvSfKItkSPh9WkJ
 d8uLjNJCadceFPwPWTQvERoCDRt2e+5gM9ynj2M6+Yuv1jAjlwgAddyers5EX7ZlKcq0UZ0BSWv
 c3ET6e0ohcuG0mBYdK0xYNDIOoe4ZsDcdLPfNovpQLY597z/pekhSjda2XDTTQ3lV7Hi3bh6IKe
 hHXlNhBmkXFcCdB/vKxIzcUsn7ZEyNM14lVjxuIptgs8oidZgQ+tRCyQwC50snS1a22lixs88Ko
 tzsDHbeUglu38sOb3UCxfKbwMFq61b74cf3bQdjOte7RJq91DaES0S3rSv3I/FeuWcjCB60PBvk
 eIujiG+QijcAWJ4hmSdVKClAU/G0QTLSWpoaEPn5myo9hdJ0ELlF/RWHDj8EwjToaIg==
X-Google-Smtp-Source: AGHT+IFkjO5GHbU1+2MUuKQvNL0fwH2etmLb7S57NgBpdq01aCYpWSgROxwdQQpXxfO8aoPZevSNpQ==
X-Received: by 2002:a05:6000:3105:b0:3b8:d672:3cf8 with SMTP id
 ffacd0b85a97d-3c5dcb10b6amr14770182f8f.43.1756287759105; 
 Wed, 27 Aug 2025 02:42:39 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87?
 ([2620:10d:c092:600::1:4a1a]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cc4b102889sm3363615f8f.51.2025.08.27.02.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 02:42:38 -0700 (PDT)
Message-ID: <46d09557-1873-4d97-b073-ce0c7296b954@gmail.com>
Date: Wed, 27 Aug 2025 10:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache"
 and one nth_page() usage
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-19-david@redhat.com>
 <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
 <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/22/25 14:59, David Hildenbrand wrote:
> On 22.08.25 13:32, Pavel Begunkov wrote:
>> On 8/21/25 21:06, David Hildenbrand wrote:
>>> We always provide a single dst page, it's unclear why the io_copy_cache
>>> complexity is required.
>>
>> Because it'll need to be pulled outside the loop to reuse the page for
>> multiple copies, i.e. packing multiple fragments of the same skb into
>> it. Not finished, and currently it's wasting memory.
> 
> Okay, so what you're saying is that there will be follow-up work that will actually make this structure useful.

Exactly

>> Why not do as below? Pages there never cross boundaries of their folios. > Do you want it to be taken into the io_uring tree?
> 
> This should better all go through the MM tree where we actually guarantee contiguous pages within a folio. (see the cover letter)

Makes sense. No objection, hopefully it won't cause too many conflicts.

>> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
>> index e5ff49f3425e..18c12f4b56b6 100644
>> --- a/io_uring/zcrx.c
>> +++ b/io_uring/zcrx.c
>> @@ -975,9 +975,9 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
>>            if (folio_test_partial_kmap(page_folio(dst_page)) ||
>>                folio_test_partial_kmap(page_folio(src_page))) {
>> -            dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
>> +            dst_page += dst_offset / PAGE_SIZE;
>>                dst_offset = offset_in_page(dst_offset);
>> -            src_page = nth_page(src_page, src_offset / PAGE_SIZE);
>> +            src_page += src_offset / PAGE_SIZE;
> 
> Yeah, I can do that in the next version given that you have plans on extending that code soon.

If we go with this version:

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

