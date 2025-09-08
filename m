Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F0B4831C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 06:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F92F10E0A9;
	Mon,  8 Sep 2025 04:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HMWSqTjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ACE10E0A9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 04:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757304848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJsCe6eTTTGDK/V3oOGv4fFA8SBbBbHuaXgk/m4NaJ0=;
 b=HMWSqTjsiZM0MnGz6HyrdAWFmkzjc7WJpEbmRLkJZDvRtN+vSHWH6yTYE5wzIC5Ii92wTI
 d8Sz47QhE1M6Xv0VBfu+YN4EkiALuez8vRT4/HoC6OCakDxJW6hwuGh3FBwqqcMghNq3+9
 Tx8PipirggEZ5DKL171Oate6YvOnSds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-8XMn7Ls2NLyYIxXXExD71A-1; Mon, 08 Sep 2025 00:14:07 -0400
X-MC-Unique: 8XMn7Ls2NLyYIxXXExD71A-1
X-Mimecast-MFC-AGG-ID: 8XMn7Ls2NLyYIxXXExD71A_1757304846
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45dcfc6558cso27793965e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 21:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757304846; x=1757909646;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xJsCe6eTTTGDK/V3oOGv4fFA8SBbBbHuaXgk/m4NaJ0=;
 b=CpOIM59fOl5BNQJAh+3TOaczsRoeK8LnYtf/tOQfKArQtVPNLv5ZJuunGTDoFNqoic
 PdS1zovd9UvUH+HPiVznfUTB4GjI9SDMr2EwvI/JTGH+/ePGU/3HUwiKayY419rYYIg5
 dVXmaRDeKKDJE6T7zMudrRLpKFcSR2LQn7dCih6N0mmJ6UFZp7F1fFRUZlU0YFy2eCFe
 e8qO27x9ldDAeCXV23udWuBUjbnyVTJsJ5vEoy1KKenpujK2+sK7GMGqWdtEIah7OuXT
 Ol0yRB26Cx/d0y5tsVt67rPfchAOAxzYx93492glLdJFj6De0ooWL+nvWRkx3fw8D769
 d3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx4MGkaxDM3UgYvAueh217zjVOoid87REvo7thX25V1YuquKL2DiRfDGXJSjF5tUDicqtijEaRY9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdCgdR1ejgL/A8lV7Bj6JjWPb6vFZW1gORuw/wyQ7/yLmBxOJ7
 QUqRnI8wGAbvi70MJeIo5b2lKYrtA6AlJ6bGBmMgbLbAVBnT0K+tfb+dYqbl+W5odC1TLRydBgx
 bzfXSGbXSej8AJ4lqI3DyE/FkTwGeEiZ9bcOWJWc9AhBexS+Ji6bEPJaXARUM03ybThvi
X-Gm-Gg: ASbGncsPfHb/VX4IjS5xNh1OdYD7M7oW7CfT2F/lzkpnItpQt3N2XBw2lNUIrlnY9nY
 MnUl8vHYD/EiwK3rqklmW1x+buyKWdzMhHBHRRp5r5srKobBippVYpv+Of/s1Y2tohmLRtgoSr4
 /kZVBZy1g+mGa2S5inKjMCIjZsxMIjlpIDhUwsFBv9mCTJrctzKs5sKaGy0SfWwMy5hQoJjlMHW
 pfIqk4DBkFms7Pe9v0s7xWqpjz/iyMZdr9F7JwYncEymCk1HIoUxJvOKM8LlnmqUauJgw3CzS+K
 cgk+JcF78c7ZQxqXC9T8gVvyWRlO74JBnV04HphRkMExP0W+qPLiLXj+xp05NIDDBg==
X-Received: by 2002:a05:600c:458d:b0:45d:d50d:c0db with SMTP id
 5b1f17b1804b1-45dddea5102mr52603815e9.15.1757304845817; 
 Sun, 07 Sep 2025 21:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFutUyjnY3i7VNpdhUwrQ7pqW1CmodIEYjJPgtpuIcj6TCRCx7EUrnPJPxT8ek+IEd6gcbzjw==
X-Received: by 2002:a05:600c:458d:b0:45d:d50d:c0db with SMTP id
 5b1f17b1804b1-45dddea5102mr52603475e9.15.1757304845375; 
 Sun, 07 Sep 2025 21:14:05 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd4affb6bsm142588705e9.1.2025.09.07.21.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Sep 2025 21:14:04 -0700 (PDT)
Message-ID: <e6b795de-f522-4952-9ec3-00a2359c43a9@redhat.com>
Date: Mon, 8 Sep 2025 07:14:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 05/15] mm/migrate_device: handle partially mapped folios
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
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-6-balbirs@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250908000448.180088-6-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1aU-KeUUDYKWmNbrXN_MFahtBdTT399D1SqW8sH8B-4_1757304846
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

On 9/8/25 03:04, Balbir Singh wrote:

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
>  mm/migrate_device.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index abd9f6850db6..f45ef182287d 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>  	return 0;
>  }
>  
> +/**
> + * migrate_vma_split_folio() - Helper function to split a THP folio
> + * @folio: the folio to split
> + * @fault_page: struct page associated with the fault if any
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
> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			 * page table entry. Other special swap entries are not
>  			 * migratable, and we ignore regular swapped page.
>  			 */
> +			struct folio *folio;
> +
>  			entry = pte_to_swp_entry(pte);
>  			if (!is_device_private_entry(entry))
>  				goto next;
> @@ -147,6 +196,29 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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
> @@ -171,6 +243,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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

This comment is still not changed, there are other reasons for pte mapped large pages. 
Also now all the mTHPs are splitted, which is change of behavior (currently ignored)
for order < PMD_ORDER.

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

--Mika

