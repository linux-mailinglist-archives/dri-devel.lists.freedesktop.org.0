Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B295AB45644
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 13:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2127710E2D8;
	Fri,  5 Sep 2025 11:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="qDb3jecR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BAF10EB77
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 11:26:56 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e96c48e7101so2080717276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1757071615; x=1757676415;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yNzF16PbnrymzXw8XwNj1X2cjJHo1hQQnEraT/RlzJM=;
 b=qDb3jecREkvC37nuWajbWRhRAvEHO/P7PCzrCo2bkob29SLEEVQ8mPh7ERZiSoI4lU
 xdqABpjCPDfS77HPDdnpZmAF8bLcvzyvLlV3PVB3FNklRmSHPZJVtJ0f6OJqNcA67NUE
 tLBeYSpuIgRC+B6aIdybIluWXobbyQUgIQiU/+BPPDuZP+JHRVr2u3e5tgunGIW6KiQK
 rbC+dnDN05GMz2oIqCTeZJO1Slr+TBl5ccSa4+KKuzQQVz6c9WfE4YneKuS3UIhvK+cy
 KPraQ095Ss3L7YmAKFtwIyG230A5quil5wXulpa6INu61UbsHLYsN/07OEopFd6w0nun
 u4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757071615; x=1757676415;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yNzF16PbnrymzXw8XwNj1X2cjJHo1hQQnEraT/RlzJM=;
 b=ahqKpj7u23OttCVp/xFA4/CS/yOWSEgDeYt7BaSQtTN9t7WX4AK8F3FbfCMgqj+y05
 tODonz7eIV2FRshujWihUsjNGTIgBtUeEnccsxpNp2iyfk4iAYsEgTMG+lhaPE9xgi7t
 PXKSktUJVoTmC/OVhE1Flh1o0z/e6rsPy9/3u9jj+5Gv63Q2lmZg5LLIM28951KfEair
 KI0Al72IOQRcjaNH9Cc7VoDHvgA0Xot3r/48Ac3ASmG2ky8FRXWeMls71o5lMNFXCV34
 yrpgCPXDBv+50/J+Zq9LAxDMQYI6EVd4APBK1hi3GQGWD+kTLqn1fz9o7ECPi/xOefHg
 M1Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMrDdIW7skN1BbSivqmunyTAR41JGNjcYq52eyjs/hmEH4zTRlcwZr8njke5aSHv4MBo1OhXC45pE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ6A7fR8SnkqimkEuTr26ZkcpPRZqwdMbzJLWI+VnbThl8pAQR
 noclBO6y5BNk+1uPNYJxtsNrPlw2+YIhy8I6RQKtNsuYgVuvIOHSEd6Z+xVzu6w/e3Y=
X-Gm-Gg: ASbGnctfF2r1uD4l276xUGaeoj9KqFu6iM43V6di5eAToiLLO+esNWYf8AA8rsRG5Ny
 C4HGz1jJfHPPmD7ex2Ej8RWCGlSNfBK6qwRUpwKhc23TbxiETyVclGLXBMxWRQQuk7t8T8ZwHb7
 h6txm2XSB63KurAaLYFfWzjlyLOsdHpH1te5+RTN8AH3JVbcSDI4Frx68aRRpWH5k8oklVfqPwN
 eSABeB5NMbtp+7Dpy4zHPmQih9RU768PlxVZHu/TWZndHWe/j0T7+3hWJuEuqj7Hi2KWhQtgj7Z
 8kKbDNFLxglp1OHHm0yLZl7yqt9IvXyQchLVTlDm/v/yCR+q5BM66p1WY1y0v4mlHD5YdkTSOuP
 bh3mqdjLAAX7NPnueww==
X-Google-Smtp-Source: AGHT+IEXVquWXmj0Yd3oyr4uhZoLxM2opNHaeihf8Xp8KBtnXc2guOYW42U1nSR+kmrTjCZ7Op/enQ==
X-Received: by 2002:a05:6902:18ce:b0:e96:fac0:60bc with SMTP id
 3f1490d57ef6-e98a58455f2mr22114649276.41.1757071615282; 
 Fri, 05 Sep 2025 04:26:55 -0700 (PDT)
Received: from [10.0.3.24] ([50.227.229.138]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e9bbdf504e0sm3031724276.11.2025.09.05.04.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 04:26:54 -0700 (PDT)
Message-ID: <1513d5fd-14ef-4cd0-a9a5-1016e9be6540@kernel.dk>
Date: Fri, 5 Sep 2025 05:26:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
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
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/5/25 12:41 AM, David Hildenbrand wrote:
> On 01.09.25 17:03, David Hildenbrand wrote:
>> We can just cleanup the code by calculating the #refs earlier,
>> so we can just inline what remains of record_subpages().
>>
>> Calculate the number of references/pages ahead of times, and record them
>> only once all our tests passed.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/gup.c | 25 ++++++++-----------------
>>   1 file changed, 8 insertions(+), 17 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index c10cd969c1a3b..f0f4d1a68e094 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
>>   #ifdef CONFIG_MMU
>>     #ifdef CONFIG_HAVE_GUP_FAST
>> -static int record_subpages(struct page *page, unsigned long sz,
>> -               unsigned long addr, unsigned long end,
>> -               struct page **pages)
>> -{
>> -    int nr;
>> -
>> -    page += (addr & (sz - 1)) >> PAGE_SHIFT;
>> -    for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
>> -        pages[nr] = page++;
>> -
>> -    return nr;
>> -}
>> -
>>   /**
>>    * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
>>    * @page:  pointer to page to be grabbed
>> @@ -2967,8 +2954,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>>       if (pmd_special(orig))
>>           return 0;
>>   -    page = pmd_page(orig);
>> -    refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
>> +    refs = (end - addr) >> PAGE_SHIFT;
>> +    page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
>>         folio = try_grab_folio_fast(page, refs, flags);
>>       if (!folio)
>> @@ -2989,6 +2976,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>>       }
>>         *nr += refs;
>> +    for (; refs; refs--)
>> +        *(pages++) = page++;
>>       folio_set_referenced(folio);
>>       return 1;
>>   }
>> @@ -3007,8 +2996,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>>       if (pud_special(orig))
>>           return 0;
>>   -    page = pud_page(orig);
>> -    refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
>> +    refs = (end - addr) >> PAGE_SHIFT;
>> +    page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>>         folio = try_grab_folio_fast(page, refs, flags);
>>       if (!folio)
>> @@ -3030,6 +3019,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>>       }
>>         *nr += refs;
>> +    for (; refs; refs--)
>> +        *(pages++) = page++;
>>       folio_set_referenced(folio);
>>       return 1;
>>   }
> 
> Okay, this code is nasty. We should rework this code to just return the nr and receive a the proper
> pages pointer, getting rid of the "*nr" parameter.
> 
> For the time being, the following should do the trick:
> 
> commit bfd07c995814354f6b66c5b6a72e96a7aa9fb73b (HEAD -> nth_page)
> Author: David Hildenbrand <david@redhat.com>
> Date:   Fri Sep 5 08:38:43 2025 +0200
> 
>     fixup: mm/gup: remove record_subpages()
>         pages is not adjusted by the caller, but idnexed by existing *nr.
>         Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 010fe56f6e132..22420f2069ee1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2981,6 +2981,7 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>                 return 0;
>         }
>  
> +       pages += *nr;
>         *nr += refs;
>         for (; refs; refs--)
>                 *(pages++) = page++;
> @@ -3024,6 +3025,7 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>                 return 0;
>         }
>  
> +       pages += *nr;
>         *nr += refs;
>         for (; refs; refs--)
>                 *(pages++) = page++;
> 

Tested as fixing the issue for me, thanks.

-- 
Jens Axboe
