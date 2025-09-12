Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F00AB5421A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595E010E435;
	Fri, 12 Sep 2025 05:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E/zlw6hl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD5810E435
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757655521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/fMTw17wcHtqFRGn0LVfXt45GBXrdFjvwip8q4HpKI=;
 b=E/zlw6hlB2dP8QeBk2QRA35rP3j1wAOYNCd+1OHzaL231p+kkRi8PpxMSHCqi9fJ7W3Ix9
 txGFKFP+28knnoZ6gR6W3b0gsrVih7uA3i3BVANSp4Y86vMuZqSKqepz/xg2vFzEPbNd17
 OMyZDXB43AyvtSOQZVBTh+UztFwbOk8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-zwobHIcpPcKWbZhMH_Yisg-1; Fri, 12 Sep 2025 01:38:40 -0400
X-MC-Unique: zwobHIcpPcKWbZhMH_Yisg-1
X-Mimecast-MFC-AGG-ID: zwobHIcpPcKWbZhMH_Yisg_1757655519
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-55f67dfc650so1319624e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 22:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757655519; x=1758260319;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/fMTw17wcHtqFRGn0LVfXt45GBXrdFjvwip8q4HpKI=;
 b=fUkgPV5IKZMD3pR0I7D3HGsdY1odKV9mOfGompmnC82uAhOZJQXhyH07X6UoZn1RWx
 fiNTkI07eqFd6FYrIedXjZy8j/4OCZWSYxKzBHhZ6xRxGZgNCpOPPi5gFtsPp8TNqlOv
 Q273cen5g2CV3J5kiXkl8sqBz4W0k+PgrHBcZzW1ECoJLJfzjsFvL6J1E8jFEi9nR72Q
 439aqaQCtnOwitJgwSYUHZHWskwaw/cLkolj9bK+QeLtUkf24zkphKM0qEEE0pzwjS+E
 rKcsT00nt04YKrgS0fLac/RtF8bsQO96CGBUT8QGpatPVJiIdYdhzYjjB7egicWaSerp
 DdHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtJUy6SGx5jIo8sPIinXytdPde60DEKHy0cWuNc4x54ul51bfPGSiTVojABkVGenMrxaz/5ojGOYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnc3lGqENTA4ZHQN9hcmwjY2+84Gvcd9BPGcxQTYS5Lvr1n9i1
 VI0GJzLkBqSLFm6YluKx8kJfjNjHtMZcaoK9MVzudiQvVdR+UjrRzF+lP9jlA1T8IQZnwzVH0fe
 uP/iDHxO2hCDWIofEfJNJtMKAa5axI7gIcSL+r3IYqfX1AzbSj+rMbCuCU02buQj8SRJR
X-Gm-Gg: ASbGnctHkkD7oK270oBiDOKJuPyMM4hY0CUhzPVXy6h3bNkfSfeeqaJOIKYK4VsMpmp
 N/8CcQcu2oTvkzp2egHTMh07wXQeIas7igSIJp7qsqLvTbleN17qSiHAHPua4JIa2dLbLPSQ2DG
 lvInHUDy14UzPZ1CpOO3HR7t25zFtZau9I5+kI3Rw3ycJXVjm+kxgcsvnzd4+CrN0oA/NRKGLZw
 fGBmVu9nstT10+HcnxUv3oeG6mh2VoQjGO3DdhhkYm9yctjR3bCPXUuO98aFIc6sLUFgXAT8Gaz
 Q4xV5MXZ1ZSctz7ca1srT/q23aDC/X8ycfmcHMORa4klQ3a8DC24gH49SlODYVB1Wyx+/A9KSZK
 pVuUOfpsYr3KiUkjmTnc52Sds7p+BcOW/n1RVF7ksYLuuM8cYtXSm
X-Received: by 2002:ac2:51d4:0:b0:571:75c8:43a5 with SMTP id
 2adb3069b0e04-57175c845b8mr65088e87.1.1757655518517; 
 Thu, 11 Sep 2025 22:38:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe3otVU1/RsO3+BWrCGouA69nfgwLCHLM+77KekXiYcNhrEbv3mMPoDIbeIVC1KQsturvUHg==
X-Received: by 2002:ac2:51d4:0:b0:571:75c8:43a5 with SMTP id
 2adb3069b0e04-57175c845b8mr65076e87.1.1757655518018; 
 Thu, 11 Sep 2025 22:38:38 -0700 (PDT)
Received: from ?IPV6:2001:999:408:6576:1142:7350:b6c5:671e?
 (n4ctkw60s7hbahed3xa-1.v6.elisa-mobile.fi.
 [2001:999:408:6576:1142:7350:b6c5:671e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63cc6sm914214e87.66.2025.09.11.22.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 22:38:37 -0700 (PDT)
Message-ID: <06a0e258-2c68-43ee-ab53-313a13ed0d68@redhat.com>
Date: Fri, 12 Sep 2025 08:38:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 06/15] mm/migrate_device: implement THP migration of zone
 device pages
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-7-balbirs@nvidia.com>
 <d35eea42-ed32-481f-9dcf-704d22eb8706@redhat.com>
 <49039b9d-4c42-480f-a219-daf0958be28e@nvidia.com>
 <4cc2ba18-e7de-448f-aaee-043ed68dc6e3@redhat.com>
In-Reply-To: <4cc2ba18-e7de-448f-aaee-043ed68dc6e3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mBZpkBJxaxN6zkZB7BdYqvA1n69YW_38MJd0ScV-W48_1757655519
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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


On 9/12/25 08:28, Mika Penttilä wrote:

> On 9/12/25 08:04, Balbir Singh wrote:
>
>> On 9/11/25 21:52, Mika Penttilä wrote:
>>> sending again for the v5 thread..
>>>
>>> On 9/8/25 03:04, Balbir Singh wrote:
>>>
>>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>>>> device pages as compound pages during device pfn migration.
>>>>
>>>> migrate_device code paths go through the collect, setup
>>>> and finalize phases of migration.
>>>>
>>>> The entries in src and dst arrays passed to these functions still
>>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>>>> representation allows for the compound page to be split into smaller
>>>> page sizes.
>>>>
>>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>>>> and migrate_vma_insert_huge_pmd_page() have been added.
>>>>
>>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>>>> some reason this fails, there is fallback support to split the folio
>>>> and migrate it.
>>>>
>>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>>>> migrate_vma_insert_page()
>>>>
>>>> Support for splitting pages as needed for migration will follow in
>>>> later patches in this series.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> ---
>>>>  include/linux/migrate.h |   2 +
>>>>  mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
>>>>  2 files changed, 395 insertions(+), 63 deletions(-)
>>>>
>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>> index 1f0ac122c3bf..41b4cc05a450 100644
>>>> --- a/include/linux/migrate.h
>>>> +++ b/include/linux/migrate.h
>>>> @@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>>  #define MIGRATE_PFN_SHIFT	6
>>>>  
>>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>>> @@ -143,6 +144,7 @@ enum migrate_vma_direction {
>>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>>>  };
>>>>  
>>>>  struct migrate_vma {
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index f45ef182287d..1dfcf4799ea5 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include <linux/pagewalk.h>
>>>>  #include <linux/rmap.h>
>>>>  #include <linux/swapops.h>
>>>> +#include <linux/pgalloc.h>
>>>>  #include <asm/tlbflush.h>
>>>>  #include "internal.h"
>>>>  
>>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>  	if (!vma_is_anonymous(walk->vma))
>>>>  		return migrate_vma_collect_skip(start, end, walk);
>>>>  
>>>> +	if (thp_migration_supported() &&
>>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>>>> +						MIGRATE_PFN_COMPOUND;
>>>> +		migrate->dst[migrate->npages] = 0;
>>>> +		migrate->npages++;
>>>> +		migrate->cpages++;
>>>> +
>>>> +		/*
>>>> +		 * Collect the remaining entries as holes, in case we
>>>> +		 * need to split later
>>>> +		 */
>>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>>> +	}
>>>> +
>>> seems you have to split_huge_pmd() for the huge zero page here in case
>>> of !thp_migration_supported() afaics
>>>
>> Not really, if pfn is 0, we do a vm_insert_page (please see if (!page) line 1107) and
>> folio  handling in migrate_vma_finalize line 1284
> Ok actually seems it is handled by migrate_vma_insert_page() which does
>
>         if (!pmd_none(*pmdp)) {
>                 if (pmd_trans_huge(*pmdp)) {
>                         if (!is_huge_zero_pmd(*pmdp))
>                                 goto abort;
>                         folio_get(pmd_folio(*pmdp));
>                         split_huge_pmd(vma, pmdp, addr);   <----- here
>                 } else if (pmd_leaf(*pmdp))
>                         goto abort;
>         }
>
While at it, think the folio_get(pmd_folio(*pmdp)); is wrong for here,
we split the pmd for huge zero page.

>> Thanks,
>> Balbir
>>
> --Mika
>

