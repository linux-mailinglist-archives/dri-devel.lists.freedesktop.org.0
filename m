Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F9B96AE3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D34410E1F7;
	Tue, 23 Sep 2025 15:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b4TV0txA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3F10E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:56:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso36697225e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758643003; x=1759247803; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RAZ4THQUhLp/jCSZc6k8pRe3JJ30LyWIBv7Rdm7k38s=;
 b=b4TV0txAWPrl73fP16gcqysxKXnncbeAgVLoxsHqtDYVEJ3Osc++TDVA1y/zhtNMk6
 hMGOI89izasKhPAQiwaen0qvgp86LnUOPDIxLBDB+cxLFRnSQSJ1QFCICXNse7mRYSU/
 NqMpb+CoSN4+MPur74AoU/kGNWHQ9v9Fj4OVCJcHTL1O5kLJEz12Z1TciYnEuSfXtG/w
 NZRgJva2htdV7e7qglo+F98wLVbJBc2OfoQQR8CoQXXxcdkNryTcs0FCp2XCTMv+TzxE
 5nNNqsNz7wxTfFiBXxzZnQJgzJ1G1jJNng09mc2g0PJ/OhxxDXJMaeLbJo83K8oigJFL
 qTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758643003; x=1759247803;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RAZ4THQUhLp/jCSZc6k8pRe3JJ30LyWIBv7Rdm7k38s=;
 b=J9OXKLD7rb5ahdEmFTg/hfBR7ihSH+RDKjwT97QFCTs17prw70jLooEo47wrsAQZN1
 ulnmtMYpjvbBk9r8j9qpaQED7kTLIYR1NM2mJZWl1I+8+7DxGchwfPlpiEg99KQV7myX
 rgYbgZXscc/JTCFWPsDtVKTxkede1y7L1Y/XnhWrW/CxvxxdSlYbf63XY6myLp0oRP2D
 ULdn7N0Mr8i8r/mS8D8fSi4KN9jlgvQ176WcvJjBOfT3o8JRo4Kf/jFJT9I4J+jWZL2E
 vHAq5EMCmLWvI0Ndb57Oc+V8onWGpyNKt5VqkaFYHsYu0mQOEVpio+fV3MqvTNRljKHc
 GwnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy3pA8K+X4SVCbO0PxubiBg2mqGiFHQ1IfNUwJsPKfrO9o8/h/OdU3hnrb+LIXor+Qzt3xOqqZ/Yc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfDlGnbMTGw28g/cgcHGW0dBevEzhwACOWa00StBEzkv0ds/nW
 wm0k+6VHpKzzpSVkejcXrEym31EiGzLqgYBGpwLbTdg32mu9c9zhpxJE
X-Gm-Gg: ASbGnctE3wwb3EY1B/vOJWpi7rjle1FRkNTfHXIQ7ywRVwblqv/oWflAeHZ+Gf0Bj55
 /IPS2mP5vw0gRyXx67B4ecluRsO2OJkj0K6E7+aqIFer2JATQMDB2WKfXqti3DDvZbi6/PNKTOb
 eyPBb4jodnEVdfYFq8yib8jL+jBYj6PKGR8iItaNKJedG27/shoFOl1t0o7CYdJ2MtI3IAiPoly
 H8HdBthmIVOl3lsdihFVlenRi2rWxBooGRICrD+zya2EdsfeCbjIriWBsQUr/YYLEnZEclSRRVK
 Br8kYSIhmey2JXs1DoqSEyEZt+9TdV2Gr/wZBn53m1/VYyLAeONNd8mRA2qzX46Np7ht/aufTE/
 X4oFafZsfswo2hUJqDXZFDJyW62uU0BnEQ63spor3PJLTdZjEL/L16gCNnyaO5RxHSnhn
X-Google-Smtp-Source: AGHT+IF0O7ehdqAB1QQAuoqY6m+j/Uj2ZkmlzqIVAVJm6bomKNVnwhf+M+9Mh3XvnYTFUDYTzupMzQ==
X-Received: by 2002:a05:600c:3b93:b0:468:7a5a:725 with SMTP id
 5b1f17b1804b1-46e1d975205mr31719315e9.1.1758643002051; 
 Tue, 23 Sep 2025 08:56:42 -0700 (PDT)
Received: from localhost (dhcp-91-156.inf.ed.ac.uk. [129.215.91.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f0aac439sm284469705e9.5.2025.09.23.08.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 08:56:41 -0700 (PDT)
Date: Tue, 23 Sep 2025 16:56:40 +0100
From: Karim Manaouil <kmanaouil.dev@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 05/15] mm/migrate_device: handle partially mapped folios
 during collection
Message-ID: <20250923155640.lbtvyi54ueyv2tjb@wrangler>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-6-balbirs@nvidia.com>
 <3FE3F2B9-86F9-4EED-863A-093FE3959B1A@nvidia.com>
 <62fb7aca-cd30-4058-bfd1-d08f78d5c38d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62fb7aca-cd30-4058-bfd1-d08f78d5c38d@nvidia.com>
X-Mailman-Approved-At: Tue, 23 Sep 2025 15:57:48 +0000
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

On Tue, Sep 23, 2025 at 01:44:20PM +1000, Balbir Singh wrote:
> On 9/23/25 12:23, Zi Yan wrote:
> > On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> > 
> >> Extend migrate_vma_collect_pmd() to handle partially mapped large folios
> >> that require splitting before migration can proceed.
> >>
> >> During PTE walk in the collection phase, if a large folio is only
> >> partially mapped in the migration range, it must be split to ensure the
> >> folio is correctly migrated.
> >>
> >> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Zi Yan <ziy@nvidia.com>
> >> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> >> Cc: Rakie Kim <rakie.kim@sk.com>
> >> Cc: Byungchul Park <byungchul@sk.com>
> >> Cc: Gregory Price <gourry@gourry.net>
> >> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> >> Cc: Alistair Popple <apopple@nvidia.com>
> >> Cc: Oscar Salvador <osalvador@suse.de>
> >> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >> Cc: Nico Pache <npache@redhat.com>
> >> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >> Cc: Dev Jain <dev.jain@arm.com>
> >> Cc: Barry Song <baohua@kernel.org>
> >> Cc: Lyude Paul <lyude@redhat.com>
> >> Cc: Danilo Krummrich <dakr@kernel.org>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Simona Vetter <simona@ffwll.ch>
> >> Cc: Ralph Campbell <rcampbell@nvidia.com>
> >> Cc: Mika Penttilä <mpenttil@redhat.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Francois Dugast <francois.dugast@intel.com>
> >> ---
> >>  mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 82 insertions(+)
> >>
> >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> index abd9f6850db6..70c0601f70ea 100644
> >> --- a/mm/migrate_device.c
> >> +++ b/mm/migrate_device.c
> >> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
> >>  	return 0;
> >>  }
> >>
> >> +/**
> >> + * migrate_vma_split_folio() - Helper function to split a THP folio
> >> + * @folio: the folio to split
> >> + * @fault_page: struct page associated with the fault if any
> >> + *
> >> + * Returns 0 on success
> >> + */
> >> +static int migrate_vma_split_folio(struct folio *folio,
> >> +				   struct page *fault_page)
> >> +{
> >> +	int ret;
> >> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
> >> +	struct folio *new_fault_folio = NULL;
> >> +
> >> +	if (folio != fault_folio) {
> >> +		folio_get(folio);
> >> +		folio_lock(folio);
> >> +	}
> >> +
> >> +	ret = split_folio(folio);
> >> +	if (ret) {
> >> +		if (folio != fault_folio) {
> >> +			folio_unlock(folio);
> >> +			folio_put(folio);
> >> +		}
> >> +		return ret;
> >> +	}
> >> +
> >> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
> >> +
> >> +	/*
> >> +	 * Ensure the lock is held on the correct
> >> +	 * folio after the split
> >> +	 */
> >> +	if (!new_fault_folio) {
> >> +		folio_unlock(folio);
> >> +		folio_put(folio);
> >> +	} else if (folio != new_fault_folio) {
> >> +		folio_get(new_fault_folio);
> >> +		folio_lock(new_fault_folio);
> >> +		folio_unlock(folio);
> >> +		folio_put(folio);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>  				   unsigned long start,
> >>  				   unsigned long end,
> >> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>  			 * page table entry. Other special swap entries are not
> >>  			 * migratable, and we ignore regular swapped page.
> >>  			 */
> >> +			struct folio *folio;
> >> +
> >>  			entry = pte_to_swp_entry(pte);
> >>  			if (!is_device_private_entry(entry))
> >>  				goto next;
> >> @@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>  			    pgmap->owner != migrate->pgmap_owner)
> >>  				goto next;
> >>
> >> +			folio = page_folio(page);
> >> +			if (folio_test_large(folio)) {
> >> +				int ret;
> >> +
> >> +				pte_unmap_unlock(ptep, ptl);
> >> +				ret = migrate_vma_split_folio(folio,
> >> +							  migrate->fault_page);
> >> +
> >> +				if (ret) {
> >> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> >> +					goto next;
> >> +				}
> >> +
> >> +				addr = start;
> >> +				goto again;
> >> +			}
> > 
> > This does not look right to me.
> > 
> > The folio here is device private, but migrate_vma_split_folio()
> > calls split_folio(), which cannot handle device private folios yet.
> > Your change to split_folio() is in Patch 10 and should be moved
> > before this patch.
> > 
> 
> Patch 10 is to split the folio in the middle of migration (when we have
> converted the entries to migration entries). This patch relies on the
> changes in patch 4. I agree the names are confusing, I'll reword the
> functions

Hi Balbir,

I am still reviewing the patches, but I think I agree with Zi here.

split_folio() will replace the PMD mappings of the huge folio with PTE
mappings, but will also split the folio into smaller folios. The former
is ok with this patch, but the latter is probably not correct if the folio
is a zone device folio. The driver needs to know about the change, as
usually the driver will have some sort of mapping between GPU physical
memory chunks and their corresponding zone device pages.

