Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB80B52F92
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9284710EA94;
	Thu, 11 Sep 2025 11:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KxeDh4Dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7749610EA94
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757589107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnoZL9IlsM4I8snaZrLtF+NT0iFbOyLl7iwd0dyctVo=;
 b=KxeDh4DdipwZnKuWBxSiFS/GKrqGziXaCgKyO2ROMc1rBR9wa9MyQ2UaGVlWqxiLlDvj+E
 xcXlfa4pz/BrTy/3CLtwi+RWnHeSWbB3gCN1DKGerP/rigM0AEgdN++AdD5Qc/CldWJW2N
 tacoJ/RCoCROD/Y8VpZHqm59TS98+Qc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-N5fiWqR7OKivbGceefOpgg-1; Thu, 11 Sep 2025 07:11:44 -0400
X-MC-Unique: N5fiWqR7OKivbGceefOpgg-1
X-Mimecast-MFC-AGG-ID: N5fiWqR7OKivbGceefOpgg_1757589103
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-55f6a61e239so377592e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 04:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589102; x=1758193902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EnoZL9IlsM4I8snaZrLtF+NT0iFbOyLl7iwd0dyctVo=;
 b=joZ78B65ZZbh66iMtMRtJkK0lzE990rJ1caZP+LsmUlIZDtK3EzG7UlRvEaAsxF7IU
 +m9K/g6SsfESzWx0GUItZI0/qDUTZiM4PPlZUBDxWcDRJWGcr2esRT7vhFDosFUK1CzP
 aOXN/tdjCSjVm6pfxIKZFHCw5xA9CLdORUtMSw2YY+yElP21db/CRsJCyQNPp1tG0W1u
 VbNGgEbF0YYUJR5UB10N1LUwZVIsHRZcIxFywCMV9zFnkVKMt/rxObAPSa+a1dJZuXCd
 VTuZUBZ5hgS0CV9INVwEtl5pKJv2DpJ1qaZAYFkrRskxejMdMgqzm2A+MZ5hB3fRctQu
 ZUWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiAIAbS2jXYlBTYEvusYLDiUI9ShwfwJ7nnwNU2+2D5n/HFMTpL9tV5jlFFBjbnoyPtmU4r0V9v9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywjq194zC8MLh/JUZf8OeEJrm9cSgC4jbKflcEdJjfxTbliElHo
 WFsFXEVp5VwufgQDJd3DxUrfeOPAmlAbepbvPrbVtjkySHih8FaCOdY60U0RzQStjrjaUCNhFgw
 H4Ug4qyral6jX+dBD16iuxrGGainjnFw3UeCnE0LPH3CxU23aqcnfpvWCG5EC0ezHTS0s
X-Gm-Gg: ASbGncsbkygw84cfgNpKbSg5TDd+vVtcERCxSyyV25m+rpetUnxY2Soy2xSGGDn7Ftt
 bjQhdfwBYQfrUEqwq3R8Fo5fDbGH8AwBgOkOZsR28XzIm4N5NkYILOUncWgTQqGRN8LbBmJqzP/
 Jir6giBwDg8FrMP1mTYujUcxHSd/9TtRqibMjyx4y5bnxmO2g8rEXbO7wfz/Un20aGL035zaooH
 Lb1odD8ij1PwbZJwPn7WrOCxjHcu1EuZVTLdyN5CHIbdpsxSQxqedG7cQdqoIqEpZlwoQDyz6ff
 20E9s5xCE8nVidu8+Z33Td6LWfCy7MpLgNjt+SVQwkh4eVNQmAmiVaCpDkbNuknPayBb6DBpM+k
 Iy6bzwVsqbsbSE/VodABmw7PlpW3Zk05rKtQRMmFTfyKpgiiDhw==
X-Received: by 2002:a05:6512:1593:b0:55f:3faa:7c2e with SMTP id
 2adb3069b0e04-5625f535a77mr5703527e87.22.1757589102499; 
 Thu, 11 Sep 2025 04:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHndKi4ZUjcu5xTRlvMfXjlXFcDZdujE+IlsZ0U4neE95H5mnTNxQ6YofItgf/sP/wsePXmQ==
X-Received: by 2002:a05:6512:1593:b0:55f:3faa:7c2e with SMTP id
 2adb3069b0e04-5625f535a77mr5703497e87.22.1757589101977; 
 Thu, 11 Sep 2025 04:11:41 -0700 (PDT)
Received: from ?IPV6:2001:999:704:9310:43e6:e14c:406:e339?
 (n7kwfhcd2z0e9u7cxfd-1.v6.elisa-mobile.fi.
 [2001:999:704:9310:43e6:e14c:406:e339])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b6002sm364013e87.28.2025.09.11.04.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:11:41 -0700 (PDT)
Message-ID: <9047198d-7b35-435b-a933-ff7b1357919b@redhat.com>
Date: Thu, 11 Sep 2025 14:11:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 06/15] mm/migrate_device: implement THP migration of zone
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
References: <20250903011900.3657435-1-balbirs@nvidia.com>
 <20250903011900.3657435-7-balbirs@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250903011900.3657435-7-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vEJ5JTYl401w5co-4CCLA3ocUNHQLiEaaAaJKeeALBQ_1757589103
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

Hi,

On 9/3/25 04:18, Balbir Singh wrote:

> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
> device pages as compound pages during device pfn migration.
>
> migrate_device code paths go through the collect, setup
> and finalize phases of migration.
>
> The entries in src and dst arrays passed to these functions still
> remain at a PAGE_SIZE granularity. When a compound page is passed,
> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
> representation allows for the compound page to be split into smaller
> page sizes.
>
> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
> and migrate_vma_insert_huge_pmd_page() have been added.
>
> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
> some reason this fails, there is fallback support to split the folio
> and migrate it.
>
> migrate_vma_insert_huge_pmd_page() closely follows the logic of
> migrate_vma_insert_page()
>
> Support for splitting pages as needed for migration will follow in
> later patches in this series.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/migrate.h |   2 +
>  mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
>  2 files changed, 395 insertions(+), 63 deletions(-)
>
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 9009e27b5f44..40e1c792eb54 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -134,6 +134,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>  #define MIGRATE_PFN_VALID	(1UL << 0)
>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>  #define MIGRATE_PFN_WRITE	(1UL << 3)
> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>  #define MIGRATE_PFN_SHIFT	6
>  
>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> @@ -152,6 +153,7 @@ enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>  };
>  
>  struct migrate_vma {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index e58c3f9d01c8..aba0cd7856da 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -14,6 +14,7 @@
>  #include <linux/pagewalk.h>
>  #include <linux/rmap.h>
>  #include <linux/swapops.h>
> +#include <asm/pgalloc.h>
>  #include <asm/tlbflush.h>
>  #include "internal.h"
>  
> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>  	if (!vma_is_anonymous(walk->vma))
>  		return migrate_vma_collect_skip(start, end, walk);
>  
> +	if (thp_migration_supported() &&
> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
> +						MIGRATE_PFN_COMPOUND;
> +		migrate->dst[migrate->npages] = 0;
> +		migrate->npages++;
> +		migrate->cpages++;
> +
> +		/*
> +		 * Collect the remaining entries as holes, in case we
> +		 * need to split later
> +		 */
> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> +	}
> +

seems you have to split_huge_pmd() for the huge zero page here in case of !thp_migration_supported() afaics

>  	for (addr = start; addr < end; addr += PAGE_SIZE) {
>  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
>  		migrate->dst[migrate->npages] = 0;
> @@ -102,57 +120,150 @@ static int migrate_vma_split_folio(struct folio *folio,
>  	return 0;
>  }

--Mika

