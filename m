Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B13B41393
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 06:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641A510E087;
	Wed,  3 Sep 2025 04:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CZohyeTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33CB10E087
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 04:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756874447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFKFd7BRRcC6ayNrWC4OEZv5/Y2ehiWbsueptb8aZyE=;
 b=CZohyeTE2MCbNM9IWRRbTit0bHlm+r7BgS6rChWfe6kzkKrNFeKoBWwwHYZT81p5qhYELB
 Mh54Kzlor0g8OulIVaNW4TFkHR/oZEdO7ikR4o5XNopjRf2eViXmZCosDqIx3QMxAeW9FX
 2ze++G4ZogPqDnDa7BiXXN82xQrzvhU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-6Si6vUqUPDCi6m4N2M9jJw-1; Wed, 03 Sep 2025 00:40:46 -0400
X-MC-Unique: 6Si6vUqUPDCi6m4N2M9jJw-1
X-Mimecast-MFC-AGG-ID: 6Si6vUqUPDCi6m4N2M9jJw_1756874444
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-337f3ee628eso7600681fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 21:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756874444; x=1757479244;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nFKFd7BRRcC6ayNrWC4OEZv5/Y2ehiWbsueptb8aZyE=;
 b=VIPD1U0t2YdEOIC2V3EPJ5WeeWHbUeAIVzV7LgnwtJPvPRM36IL0Af6bISgsoqUMPw
 AyvJ8XwrIUg3WhsK66MyamLyJylwxtaIjetb5mSqHSnaDTPk8UKp5akCPnIqBk48vd6v
 RggX5G1SeLyeXmw2uuhUbDkBPpXYxXMRiXoyAhd7/KmHxFR/RK8Ib/dnbUv73gENRVoB
 63kWk46IfIj+CGYE+BD+27LZdegM2y6KEK4Yr/BlgayXtPu5/+hI1ksBZHc0hNvbjkUb
 REM1GQ9BL3c8o1RvDVxE9tXfsedYjNlqGIYRyJsNcQ5FPaPuAJbuhE72bdx6maVNQ7+4
 fN5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8GJk0Hp1bymyf2CtOQN9Ym9VWHhdqu6DqmGgdBQDyfeDewvWnkK575bzq4xb0iqIQd3Nz1+HjZyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp3wEowXMesXyIaY3WWSojMJX3Pzw+WHfSUIyz1YNpvQu9MYlU
 iNRAa++lk8e+LGtK74+bC8ggF17WHQ24E48RL9hblLvAcvP2sy1jLMLzroj5049aosrmTevt+kL
 oiJNpmRbunw6nNHLY/cu1MmhQ+lNDwfYjvuNx+0WYSQmAbOzdPX+XMFBNQdYpJjaR+a8J
X-Gm-Gg: ASbGncs3UxUDs/SUANa5XN1baMsQwIqQq2C0cw0XsWwcvERNIDsoI5s3Q/CZ6VrJnMm
 EJLhi7UswDBn4LA/U3hX0ON7iwEF/2jjSRuLvXbMPsm6auiqJeZWH9uqLXDEbFGq9bEMQqQmiGC
 HVRq4bNTJuobDK2Sa0vA7y+7W7hjDbaN3yi3n/D4oTLlBBYPQp3AtC1v53zAYz8t630+xWXJtTE
 e1w8o85kP4FQb2uY2RtxE+KeVHcmfFYOu+LLjiiWzf6Iu1s4kLJIeyEe6IYoFSgZKatucdc4Yd7
 jKAb6OJGiZSweh3rpJYXFZW0NjJOQVBk6ZllDnUe8dZE89hCb0mYAAelDzqhFaqauw==
X-Received: by 2002:a2e:a990:0:b0:336:e1d6:8920 with SMTP id
 38308e7fff4ca-336e1d6917cmr23417361fa.31.1756874444347; 
 Tue, 02 Sep 2025 21:40:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB9QYuRkeTjERXflES7M4qiiN/3BjWaFP3YSaUZpEcyOTHs10oLde5VZHbPVXv9pkoXi4/XQ==
X-Received: by 2002:a2e:a990:0:b0:336:e1d6:8920 with SMTP id
 38308e7fff4ca-336e1d6917cmr23417061fa.31.1756874443807; 
 Tue, 02 Sep 2025 21:40:43 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c50f79sm7951591fa.1.2025.09.02.21.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 21:40:43 -0700 (PDT)
Message-ID: <ea6caec5-fd20-444c-b937-6cab61198c46@redhat.com>
Date: Wed, 3 Sep 2025 07:40:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 05/15] mm/migrate_device: handle partially mapped folios
 during collection
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
 <20250903011900.3657435-6-balbirs@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250903011900.3657435-6-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: chzrw_yR0DeEb5DgNJET0FsS2taQ3GNC3dbW7RBJaxI_1756874444
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

> Extend migrate_vma_collect_pmd() to handle partially mapped large
> folios that require splitting before migration can proceed.
>
> During PTE walk in the collection phase, if a large folio is only
> partially mapped in the migration range, it must be split to ensure
> the folio is correctly migrated.
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
>  mm/migrate_device.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index e05e14d6eacd..e58c3f9d01c8 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -54,6 +54,54 @@ static int migrate_vma_collect_hole(unsigned long start,
>  	return 0;
>  }
>  
> +/**
> + * migrate_vma_split_folio - Helper function to split a(n) (m)THP folio
> + *
> + * @folio - the folio to split
> + * @fault_page - struct page associated with the fault if any
> + *
> + * Returns 0 on success
> + */
> +static int migrate_vma_split_folio(struct folio *folio,
> +				   struct page *fault_page)
> +{
> +	int ret;
> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
> +	struct folio *new_fault_folio = NULL;
> +
> +	if (folio != fault_folio) {
> +		folio_get(folio);
> +		folio_lock(folio);
> +	}
> +
> +	ret = split_folio(folio);
> +	if (ret) {
> +		if (folio != fault_folio) {
> +			folio_unlock(folio);
> +			folio_put(folio);
> +		}
> +		return ret;
> +	}
> +
> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
> +
> +	/*
> +	 * Ensure the lock is held on the correct
> +	 * folio after the split
> +	 */
> +	if (!new_fault_folio) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +	} else if (folio != new_fault_folio) {
> +		folio_get(new_fault_folio);
> +		folio_lock(new_fault_folio);
> +		folio_unlock(folio);
> +		folio_put(folio);
> +	}
> +
> +	return 0;
> +}
> +
>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   unsigned long start,
>  				   unsigned long end,
> @@ -136,6 +184,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			 * page table entry. Other special swap entries are not
>  			 * migratable, and we ignore regular swapped page.
>  			 */
> +			struct folio *folio;
> +
>  			entry = pte_to_swp_entry(pte);
>  			if (!is_device_private_entry(entry))
>  				goto next;
> @@ -147,6 +197,29 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			    pgmap->owner != migrate->pgmap_owner)
>  				goto next;
>  
> +			folio = page_folio(page);
> +			if (folio_test_large(folio)) {
> +				int ret;
> +
> +				/*
> +				 * The reason for finding pmd present with a
> +				 * large folio for the pte is partial unmaps.
> +				 * Split the folio now for the migration to be
> +				 * handled correctly
> +				 */
> +				pte_unmap_unlock(ptep, ptl);
> +				ret = migrate_vma_split_folio(folio,
> +							  migrate->fault_page);
> +
> +				if (ret) {
> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				addr = start;
> +				goto again;
> +			}
> +
>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>  					MIGRATE_PFN_MIGRATE;
>  			if (is_writable_device_private_entry(entry))
> @@ -171,6 +244,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  					pgmap->owner != migrate->pgmap_owner)
>  					goto next;
>  			}
> +			folio = page_folio(page);
> +			if (folio_test_large(folio)) {
> +				int ret;
> +
> +				/*
> +				 * The reason for finding pmd present with a
> +				 * large folio for the pte is partial unmaps.
> +				 * Split the folio now for the migration to be
> +				 * handled correctly
> +				 */

There are other reasons like vma splits for various reasons.

> +				pte_unmap_unlock(ptep, ptl);
> +				ret = migrate_vma_split_folio(folio,
> +							  migrate->fault_page);
> +
> +				if (ret) {
> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				addr = start;
> +				goto again;
> +			}
>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>  		}

