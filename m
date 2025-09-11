Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4CB5316F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49110EAE5;
	Thu, 11 Sep 2025 11:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N1xAcENx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1510E0F5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757591529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFSNAReIPxMfDq0//HsR9GYvcebZMlltpyKxC4QevlA=;
 b=N1xAcENxFJ3yl6/5hfHTk7sIlaZzb1llrYpIeFqxppc7dem+n/Jl142SrI2lNpRgVLtfLN
 ymaTTS6Qf46N4Qf3rHP2v3eJSJJ+8WOp4GhTneVorTxB5FljIfdO449LCPRZ2m7f7Djyxj
 zOlGmBJsaOY4JQYEWSIDClT2e1leqIU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-DXDRAJrUNr-Ncx6d1341Aw-1; Thu, 11 Sep 2025 07:52:06 -0400
X-MC-Unique: DXDRAJrUNr-Ncx6d1341Aw-1
X-Mimecast-MFC-AGG-ID: DXDRAJrUNr-Ncx6d1341Aw_1757591525
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-55f6bdc1773so317850e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 04:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757591525; x=1758196325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QFSNAReIPxMfDq0//HsR9GYvcebZMlltpyKxC4QevlA=;
 b=szrrHp5g3Da5NOJuvY8exe56Samp+GoB6qnNGFQPx96M8bRk38TJIcnc1Q+IPGxcAU
 RPyuOR8MmqV98OU0UfoHJyq3gLVfoq1cYCCtGIkNydWeUoe4Ryle7aaR95OkIBTuI0IO
 Ba3KTC5CF9UOF2nfAn4DiFy83xTUwOfEKZpU6elnoK0/iOd4MsK9bKlSi453xp4TXg/d
 TJuBp/frYLKYj+a5LDyY3c8zydKhCWUDYOFmFiqDqD+dtu1TI6cRoGosrjHlmcbfR4HM
 ehv7P8LZ32zAoWFijHeu8fxU1HhOV00LUMe+DtOxw71K/5hyuK87PFV5imdCaGevRMZK
 R8dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTzeHCxIDSiB0tWr6kajMquQi0IXBUCjUlzxEa+ecNHNCr5jXxStT6B6KNuNtcEbFpXbz1b+0iUgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq8T5niM9OrjolQKI4f/OYYXB8H1vpz9Apyceyy8fw9iWVY4Lj
 lDZIUbtkqUkuwxP8SpKR0MMiyq052vj8THB0zxLIsb7slkddwQSCfQmVFUsWEI15CrFuRCGo9Jy
 QJ+I2kfdGe7cb44nbpM4TcaKaG2/s4slVjZO4GOQ0DROwA5SE+4ImxKbYWTVASaNpDZGF
X-Gm-Gg: ASbGnct5BROwUdVzr0vnbniHeLELe39gQf+Wb6OX9FSt4mWoOukO6kzKHqejYUMHkk0
 0ABZZfh/VksWvAVC1T9jqitRj3Bq90dVLeWrmzaj8/cITo+howY4Ur2TlHwa/sSFXjI/PdZPrwG
 wRdjNS98eOHwzClAImWvodMLvL0EAI0MHd6KXWd+v0WvIKbAMt8U+TYADH0XQ1tfcxxulD/1qxr
 Y/3/EO+bFk6LFV3ktUi2GtMPQ/Ny0qrTdiqTW6vslCDL614oo5iVK8mw5tVCVH71mIR85cM0sb4
 FY7Md9na0g0ZMRYmlzFQAZEj5/CelNHJcqigC3YdS+OM/aiypliwNa++IXvSq8wRwN3t/cAyC6d
 fDbJwX+QTWWEsuIupFHE2TP8yaqyN4ot+4dFXhKhDcKh+4T6/YA==
X-Received: by 2002:a05:6512:3e19:b0:55f:6831:6eff with SMTP id
 2adb3069b0e04-5625eb95710mr7497401e87.4.1757591524575; 
 Thu, 11 Sep 2025 04:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSZqn3zLcuK5tUPBaAcRR8ioorhgaZjrssIarYSMWB+fPQ8ZMZad/gn0ZbUOMVd1PP6SS9vQ==
X-Received: by 2002:a05:6512:3e19:b0:55f:6831:6eff with SMTP id
 2adb3069b0e04-5625eb95710mr7497368e87.4.1757591523996; 
 Thu, 11 Sep 2025 04:52:03 -0700 (PDT)
Received: from ?IPV6:2001:999:704:9310:43e6:e14c:406:e339?
 (n7kwfhcd2z0e9u7cxfd-1.v6.elisa-mobile.fi.
 [2001:999:704:9310:43e6:e14c:406:e339])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63e47sm377870e87.80.2025.09.11.04.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:52:03 -0700 (PDT)
Message-ID: <d35eea42-ed32-481f-9dcf-704d22eb8706@redhat.com>
Date: Thu, 11 Sep 2025 14:52:02 +0300
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
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250908000448.180088-7-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P9jaSOtVPPk8CH_WshFOVQ2I37IXMIRiq7ClCH0l-po_1757591525
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

sending again for the v5 thread..

On 9/8/25 03:04, Balbir Singh wrote:

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
> index 1f0ac122c3bf..41b4cc05a450 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>  #define MIGRATE_PFN_VALID	(1UL << 0)
>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>  #define MIGRATE_PFN_WRITE	(1UL << 3)
> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>  #define MIGRATE_PFN_SHIFT	6
>  
>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> @@ -143,6 +144,7 @@ enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>  };
>  
>  struct migrate_vma {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index f45ef182287d..1dfcf4799ea5 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -14,6 +14,7 @@
>  #include <linux/pagewalk.h>
>  #include <linux/rmap.h>
>  #include <linux/swapops.h>
> +#include <linux/pgalloc.h>
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

seems you have to split_huge_pmd() for the huge zero page here in case
of !thp_migration_supported() afaics

>  	for (addr = start; addr < end; addr += PAGE_SIZE) {

