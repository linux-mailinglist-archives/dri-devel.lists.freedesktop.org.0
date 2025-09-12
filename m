Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD4B54208
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E832F10E432;
	Fri, 12 Sep 2025 05:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lh4m5648";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300B310E432
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757654918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJ9I3kFrAfuzRn5zG3IfhkcbkFVirVLdOlMEX4ozb3Q=;
 b=Lh4m5648XNvKQlKdjYrL00gkPUvQtUC9sn5PelqqyzIvEr0gAoKedpxlJ8rkqkFiWtG+Qr
 3XQV9BnpwY9iMQyvTTqlCjX6e7fAmcsEWnCmK33u3kFsAv3In+KVQJ4yjnCkOfy8Nan0GV
 jqHCtZbwkPsEWsyedxHdOo1wTAloAq8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-jaQa_dVCNsiIlNu_H0_81A-1; Fri, 12 Sep 2025 01:28:36 -0400
X-MC-Unique: jaQa_dVCNsiIlNu_H0_81A-1
X-Mimecast-MFC-AGG-ID: jaQa_dVCNsiIlNu_H0_81A_1757654915
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-333f8db9035so7736341fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 22:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757654915; x=1758259715;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aJ9I3kFrAfuzRn5zG3IfhkcbkFVirVLdOlMEX4ozb3Q=;
 b=jPLsgWCC5wqfu2sRsXjet2vyWbTWk+2lT9RTKICOkHvV8p+iuqcs1L4PxsmXXmWjg/
 bsDGqxX3kvE4MSCfiN2LSCSf5O4zoiJ9KkxSioNH4P7a9KUwygVHlDccM2RCi8FG+ikJ
 CwbH+g5b7dxxVJvOOq+/Uc9A2eN+qAdvINDTLIwAOuwbGGH+Kz9vLpQtWGEkMGGwonMc
 fK+PnARpyJr7dNhAiaoVrrEfsH4Po7rUs+RUudlyvSs6IstXtXf30R43d50/+ezPaprm
 JOOYQt43Gverq2N1J/tq0j4N4OSTIg1AZEGTotho0WRD4VkHgVB2ps/ROWETamfMWoGe
 jSTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6QK0p8Cbn2ZMIGtB7Z1AZtZ0DHcT/kNXitWpSvFmBgBeWsPbUrz/Qdbf49JuFpL8XENu9PudqSBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuBv2i0AM+I5Zv2a/pPcFHDyek84Svpv4gj/+ftqAx10kIvAvd
 Z/axNI6C8qTf1Up3RuEGuTtoOA+nwIxA1D9uu/ugtecyHVBaVsSB8oO68YQhI50uD5sppULeFGF
 8ymIZ/q/lx2jKdkZX0MK8D1M4cqe5HXSJ1WsBw/bhWUmhSQOpQfhLqZX17JdapY4oBTXT
X-Gm-Gg: ASbGncswiSV3WrJz39mFYhgtRQACgyGqPw1F/Jtgig/aaMl+DvB4E3+tz60TmzB2xI0
 QoKD8PJj7m0q9YAFCYXKrrZx/LXL2aFNTDUhyBcHMO3sBCnHtkaaRTyl1lzhapV/b+f8dbFeWoK
 KVJ6oqO/xl6s1xWj6Q8cgrqrt1fBmTnb+yJ5d6BYetncLgxb4DKdye7IAJLrYJvcixNt6AHvoIf
 0fytf8rFpeltSQEDQIuy6Gxy1ZuDu1x0lwAOgtPK7CbvV19gXieiEZ3ccP9FMfx05X1eUPjuRJO
 VO8JU6LZqNn9GHkt9/X5sseUkQPBDYCupGiQBTSpZ1SOLn9wy8LKMyHIQLL4A+A/F9Q73AuHfeq
 GbeO47rJ0zNNRVZtCj5UNFC2EOgMP8pnJdQlklAwDqWx4Y1zcChdQ
X-Received: by 2002:a2e:be91:0:b0:351:b11d:e630 with SMTP id
 38308e7fff4ca-351b11ded0amr3280311fa.11.1757654914791; 
 Thu, 11 Sep 2025 22:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpGJ8fEYHY6vVQRRiNssGfCLT3ZkT3GfJOpIxVKWucfTurAjgfRecqT3PfQJdvJQYHVWNvWA==
X-Received: by 2002:a2e:be91:0:b0:351:b11d:e630 with SMTP id
 38308e7fff4ca-351b11ded0amr3280201fa.11.1757654914261; 
 Thu, 11 Sep 2025 22:28:34 -0700 (PDT)
Received: from ?IPV6:2001:999:408:6576:1142:7350:b6c5:671e?
 (n4ctkw60s7hbahed3xa-1.v6.elisa-mobile.fi.
 [2001:999:408:6576:1142:7350:b6c5:671e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f15a591fasm6136911fa.9.2025.09.11.22.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 22:28:33 -0700 (PDT)
Message-ID: <4cc2ba18-e7de-448f-aaee-043ed68dc6e3@redhat.com>
Date: Fri, 12 Sep 2025 08:28:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 06/15] mm/migrate_device: implement THP migration of zone
 device pages
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
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <49039b9d-4c42-480f-a219-daf0958be28e@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cPtrkCOJetDddP011qd5wV0q8yktzVZNxmJdZojmLgs_1757654915
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

On 9/12/25 08:04, Balbir Singh wrote:

> On 9/11/25 21:52, Mika Penttilä wrote:
>> sending again for the v5 thread..
>>
>> On 9/8/25 03:04, Balbir Singh wrote:
>>
>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>>> device pages as compound pages during device pfn migration.
>>>
>>> migrate_device code paths go through the collect, setup
>>> and finalize phases of migration.
>>>
>>> The entries in src and dst arrays passed to these functions still
>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>>> representation allows for the compound page to be split into smaller
>>> page sizes.
>>>
>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>>> and migrate_vma_insert_huge_pmd_page() have been added.
>>>
>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>>> some reason this fails, there is fallback support to split the folio
>>> and migrate it.
>>>
>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>>> migrate_vma_insert_page()
>>>
>>> Support for splitting pages as needed for migration will follow in
>>> later patches in this series.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> ---
>>>  include/linux/migrate.h |   2 +
>>>  mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
>>>  2 files changed, 395 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>> index 1f0ac122c3bf..41b4cc05a450 100644
>>> --- a/include/linux/migrate.h
>>> +++ b/include/linux/migrate.h
>>> @@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>  #define MIGRATE_PFN_SHIFT	6
>>>  
>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>> @@ -143,6 +144,7 @@ enum migrate_vma_direction {
>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>>  };
>>>  
>>>  struct migrate_vma {
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index f45ef182287d..1dfcf4799ea5 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -14,6 +14,7 @@
>>>  #include <linux/pagewalk.h>
>>>  #include <linux/rmap.h>
>>>  #include <linux/swapops.h>
>>> +#include <linux/pgalloc.h>
>>>  #include <asm/tlbflush.h>
>>>  #include "internal.h"
>>>  
>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>  	if (!vma_is_anonymous(walk->vma))
>>>  		return migrate_vma_collect_skip(start, end, walk);
>>>  
>>> +	if (thp_migration_supported() &&
>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>>> +						MIGRATE_PFN_COMPOUND;
>>> +		migrate->dst[migrate->npages] = 0;
>>> +		migrate->npages++;
>>> +		migrate->cpages++;
>>> +
>>> +		/*
>>> +		 * Collect the remaining entries as holes, in case we
>>> +		 * need to split later
>>> +		 */
>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>> +	}
>>> +
>> seems you have to split_huge_pmd() for the huge zero page here in case
>> of !thp_migration_supported() afaics
>>
> Not really, if pfn is 0, we do a vm_insert_page (please see if (!page) line 1107) and
> folio  handling in migrate_vma_finalize line 1284

Ok actually seems it is handled by migrate_vma_insert_page() which does

        if (!pmd_none(*pmdp)) {
                if (pmd_trans_huge(*pmdp)) {
                        if (!is_huge_zero_pmd(*pmdp))
                                goto abort;
                        folio_get(pmd_folio(*pmdp));
                        split_huge_pmd(vma, pmdp, addr);   <----- here
                } else if (pmd_leaf(*pmdp))
                        goto abort;
        }


>
> Thanks,
> Balbir
>
--Mika

