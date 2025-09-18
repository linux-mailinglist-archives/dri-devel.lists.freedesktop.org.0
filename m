Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ADCB84C21
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C12910E89D;
	Thu, 18 Sep 2025 13:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="g81jj2VQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 690 seconds by postgrey-1.36 at gabe;
 Thu, 18 Sep 2025 12:40:35 UTC
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C986710E755
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 12:40:35 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 58I9CmCw3443791; Thu, 18 Sep 2025 05:28:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=FlRouMpQLtB0kvLMyco0duirmI8eBjXnc7Q75bnW+0A=; b=g81jj2VQgise
 74iFa6WsCOD4OQ609NXSC1qPlYP8DSb6+fY7rrbX5Fr1x7PI3yF21ngdSewJLV3W
 zm6PtPSv/vyXAtjz6QubO9OP2thUtdEis25qtPtqFQBSL5PbYyPRT3NjX6LdMOfA
 c0WDFm/ZcfwMM8mlFGYomzH8pI2QmsiZJU8TU7EQCde0CAQucJEPPx3+fMNNp3jA
 wn9mNAaf/Rc/Vsa+YKzFPByqmip3jmxQOkdTVxcczGr8x4c+kB9ObJPtxDF6REMZ
 HrBk+PltATGNFFCkw9u9sd1rEGvfTlrsS7R6mzS1eklGPI4o+smtpKI0D1LA4A5A
 Mf+E3D9HfQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 498f8d0yrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Sep 2025 05:28:47 -0700 (PDT)
Received: from devbig091.ldc1.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 18 Sep 2025 12:28:46 +0000
From: Chris Mason <clm@meta.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Chris Mason <clm@meta.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <dri-devel@lists.freedesktop.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Zi Yan
 <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
 <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, "Alistair
 Popple" <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ralph Campbell
 <rcampbell@nvidia.com>, =?UTF-8?q?Mika=20Penttil=C3=A4?=
 <mpenttil@redhat.com>, Matthew Brost <matthew.brost@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: Re: [v5 01/15] mm/zone_device: support large zone device private
 folios
Date: Thu, 18 Sep 2025 05:27:58 -0700
Message-ID: <20250918122813.1440093-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250908000448.180088-2-balbirs@nvidia.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::2d]
X-Authority-Analysis: v=2.4 cv=H6zbw/Yi c=1 sm=1 tr=0 ts=68cbfaff cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=yJojWOMRYYMA:10 a=Ikd4Dj_1AAAA:8 a=K8UWYa9OKnGta0qZC_oA:9
X-Proofpoint-GUID: ZImvgmQS0UbOax2DQ-586paFWLlyJOK7
X-Proofpoint-ORIG-GUID: ZImvgmQS0UbOax2DQ-586paFWLlyJOK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDExNiBTYWx0ZWRfX+t/DLb3/wcJO
 VdnVVdyaFjelpm5ethMiMrJ0GLnxWv2EOnh0DeHIYvc4eZY3GUJo7+higP3SJYTIXJikjRYAT36
 0ffqylSzfqylOL6k7jlXMsj8+iLWD1XwvaCWdh9CCUazYkBCIXaILZw1Wz8GfFf9Vy8Aqyr8bxe
 GCLpoxBewYIONgvMTJRlm2deijGxwpmw6kBGdp+iwejKNZ6/TT/iJJWNdV5ow8me4IKrD5Lerqy
 S15dKO6er4CuYMzEBYUJr4JACF2gU6aoY0rLHT64HRHNKsvHpDf0L4HnYd8jhUv2gahF2QuLxAK
 Dxw7Zj7fWXHzLmVkplYdrFDS8WZzc4D53x3qhAD8n53OvHvWDkr5U9isB2K3+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Mailman-Approved-At: Thu, 18 Sep 2025 13:15:15 +0000
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


[ apologies for resending this, debugging sendmail ]

Hi Balbir,

On Mon,  8 Sep 2025 10:04:34 +1000 Balbir Singh <balbirs@nvidia.com> wrote:
> Add routines to support allocation of large order zone device folios
> and helper functions for zone device folios, to check if a folio is
> device private and helpers for setting zone device data.
> 
> When large folios are used, the existing page_free() callback in
> pgmap is called when the folio is freed, this is true for both
> PAGE_SIZE and higher order pages.
> 
> Zone device private large folios do not support deferred split and
> scan like normal THP folios.

[ ... ]

> diff --git a/mm/memremap.c b/mm/memremap.c
> index 46cb1b0b6f72..66f9186b5500 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -453,11 +452,15 @@ void free_zone_device_folio(struct folio *folio)
>  
>  	switch (pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> +		percpu_ref_put_many(&folio->pgmap->ref, nr);

Here we're dropping nr refs

> +		pgmap->ops->page_free(&folio->page);
> +		folio->page.mapping = NULL;
> +		break;
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>  			break;
> -		pgmap->ops->page_free(folio_page(folio, 0));
> -		put_dev_pagemap(pgmap);
> +		pgmap->ops->page_free(&folio->page);
> +		percpu_ref_put(&folio->pgmap->ref);

Here we're dropping one ref?

>  		break;
>  
>  	case MEMORY_DEVICE_GENERIC:
> @@ -480,14 +483,23 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>  
> -void zone_device_page_init(struct page *page)
> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>  {
> +	struct page *page = folio_page(folio, 0);
> +
> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
>  	 */
> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> -	set_page_count(page, 1);
> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));

Here we always bump by 1 << order

I hesitate to send this one because I don't know the code at all, but the
AI review prompts keep flagging this apparent refcount mismatch, and it looks
real to me.

Are the differences in refcount handling inside free_zone_device_folio()
intentional?

-chris

