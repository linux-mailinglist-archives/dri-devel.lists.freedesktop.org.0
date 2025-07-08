Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E51AFCC4D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAFA10E642;
	Tue,  8 Jul 2025 13:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BG/0LKr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AF410E17F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751981862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IEF+8chj2MkyfolWhjd4h/R7sCyuSgO1z/RGJyUjjsA=;
 b=BG/0LKr1aPVQo9FThyf5UlCeF8VnuVgRAGBk+dJNntLZL98ph+WbzUS71br5CD22tt3yRp
 W3rAyz/gMFIsQSRqYmkiXPrszjQdDCsdKiKrhIVc6TmC8EBUlaTqxK+dpVdFmmCHjmovyx
 EqNO1EDwszi28Uxg7QoR0Pmo7lIRnxQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-krbrzLgQOXu_Zj-uQCrTSw-1; Tue, 08 Jul 2025 09:37:41 -0400
X-MC-Unique: krbrzLgQOXu_Zj-uQCrTSw-1
X-Mimecast-MFC-AGG-ID: krbrzLgQOXu_Zj-uQCrTSw_1751981860
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f858bc5eso3075593f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 06:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751981860; x=1752586660;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IEF+8chj2MkyfolWhjd4h/R7sCyuSgO1z/RGJyUjjsA=;
 b=K9wmosNvSf2b6UTedw80bPIZJV06cwFeMARy2xaCxmZQ3ssmezJYFP+tU13+ItYNNz
 b6HkUoqsedwxXEx32MfwCOngyL5LrtHDWHhAfVS+z9OsWXgB7/GkyVWVYfIDfgRGKLOh
 b70440IA5YhwoJf/M7Kelu74orA1uLXsa+TNalJ3oEv3P70fkcDbOtcA7Sa7avtwzqHA
 3kwQc/TOAD7GBJ/XDVsf9ow5ygljns2Mb4wFnzPAgUo4wyZ8MCLYVriYt0x4AbFkxae+
 LFwtwtpAE3V24FEaKaJQAZbbGI/x7m2ZcBl4V0FnXHaNVwcYiOMK4WWONs5M7kUCSBs8
 TFXg==
X-Gm-Message-State: AOJu0Yw8Bv2JQ98cVGb8FSH3f7aCutY8cMMQhJ8E6U2ZyGlZ+zpX5i0K
 PUUrDu6wLuT8/6dUeg/GbQc8r8ZERXN3Q5mhzgKydRBIzyxVg5WFJ3zkN+KhKCtivXslwESr2xj
 Ut9D1WEwHTjjOngxaVUkhmSAziQ/2b/rAnR/44Ga7ern+nNYMMw1Kq+NzV0s0V6ade4sRxQ==
X-Gm-Gg: ASbGnct2zCWffvUi3auztv0MQsX16FKZSZYvtkqsMSuiLMu5P+KBqbPo/rnQxZ3H5op
 1NMbjrwRt/FIxwmEeoS3iQF7+IT32rX302rn4tLan38N5lzbs3A7XgTZEwnsdcvT7P5E8C412Qy
 Q8nxCYlXRqzoCoeyy/2aAAwiCPE6BZIrYsqi/U6geaqpKx6y1IKoi9EKsTN23nd3wHnubXFpWXn
 VLJxq9Qc/IklVmnIoHmi1MVKsiYSeCTnZx8HAP4rm907odr3dpOXdd3AvCQAg4DvP1XYnHfP4Ey
 9wQXmEYtrEUaqLRBXaMWygHHEvQ5xco0IXUzH0zOgAMEdPFZn4fneYkbb3p9nkwGPzDlq8pAzWi
 rtdS+O9SyYGCbR1r3MN4oIvYxZ4kBMWpHXad8Adf5M1SZ3hHQ/A==
X-Received: by 2002:a05:6000:25f8:b0:3a1:fcd6:1e6b with SMTP id
 ffacd0b85a97d-3b49704279emr11994810f8f.57.1751981859971; 
 Tue, 08 Jul 2025 06:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyStiHSBwGZxWxlcaJkgqzmyO/mAjpR9b6IG99crQSPHfqfD1DaeJswhgokapiT94/TM5Vyg==
X-Received: by 2002:a05:6000:25f8:b0:3a1:fcd6:1e6b with SMTP id
 ffacd0b85a97d-3b49704279emr11994762f8f.57.1751981859378; 
 Tue, 08 Jul 2025 06:37:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f500:4346:f17c:2bde:808c?
 (p200300d82f1af5004346f17c2bde808c.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f500:4346:f17c:2bde:808c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97376sm13208221f8f.61.2025.07.08.06.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:37:38 -0700 (PDT)
Message-ID: <564babd9-fe33-4ca7-b63f-73f007fbfb51@redhat.com>
Date: Tue, 8 Jul 2025 15:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/11] mm/zone_device: support large zone device private
 folios
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-2-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250306044239.3874247-2-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c3S8siJgR7q3_AXnGBWzcoaNhtwrkw5afPW6wg1hHWc_1751981860
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 06.03.25 05:42, Balbir Singh wrote:
> Add routines to support allocation of large order zone device folios
> and helper functions for zone device folios, to check if a folio is
> device private and helpers for setting zone device data.
> 
> When large folios are used, the existing page_free() callback in
> pgmap is called when the folio is freed, this is true for both
> PAGE_SIZE and higher order pages.
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   include/linux/memremap.h | 22 +++++++++++++++++-
>   mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
>   2 files changed, 58 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4aa151914eab..11d586dd8ef1 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
>   	return is_device_private_page(&folio->page);
>   }
>   
> +static inline void *folio_zone_device_data(const struct folio *folio)
> +{
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	return folio->page.zone_device_data;
> +}

Not used.

> +
> +static inline void folio_set_zone_device_data(struct folio *folio, void *data)
> +{
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	folio->page.zone_device_data = data;
> +}
> +

Not used.

Move both into the patch where they are actually used.

>   static inline bool is_pci_p2pdma_page(const struct page *page)
>   {
>   	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> @@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
>   }
>   
>   #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page);
> +void init_zone_device_folio(struct folio *folio, unsigned int order);
>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>   void memunmap_pages(struct dev_pagemap *pgmap);
>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> @@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>   
>   unsigned long memremap_compat_align(void);
> +
> +static inline void zone_device_page_init(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +
> +	init_zone_device_folio(folio, 0);
> +}
> +
>   #else
>   static inline void *devm_memremap_pages(struct device *dev,
>   		struct dev_pagemap *pgmap)
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 2aebc1b192da..7d98d0a4c0cd 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -459,20 +459,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>   void free_zone_device_folio(struct folio *folio)
>   {
>   	struct dev_pagemap *pgmap = folio->pgmap;
> +	unsigned int nr = folio_nr_pages(folio);
> +	int i;
> +	bool anon = folio_test_anon(folio);

You can easily get rid of this (see below).

> +	struct page *page = folio_page(folio, 0);

Please inline folio_page(folio, 0) below instead.

>   
>   	if (WARN_ON_ONCE(!pgmap))
>   		return;
>   
>   	mem_cgroup_uncharge(folio);
>   
> -	/*
> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> -	 * and we could PTE-map them similar to THP, we'd have to clear
> -	 * PG_anon_exclusive on all tail pages.
> -	 */
> -	if (folio_test_anon(folio)) {
> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> +	WARN_ON_ONCE(folio_test_large(folio) && !anon);
> +
> +	for (i = 0; i < nr; i++) {
> +		if (anon)
> +			__ClearPageAnonExclusive(folio_page(folio, i));
>   	}

if (folio_test_anon(folio)) {
	for (i = 0; i < nr; i++)
		__ClearPageAnonExclusive(folio_page(folio, i));
} else {
	VM_WARN_ON_ONCE(folio_test_large(folio));
}

>   
>   	/*
> @@ -496,10 +497,19 @@ void free_zone_device_folio(struct folio *folio)
>   
>   	switch (pgmap->type) {
>   	case MEMORY_DEVICE_PRIVATE:
> +		if (folio_test_large(folio)) {
> +			folio_unqueue_deferred_split(folio);

Is deferred splitting even a thing for device-private?

Should we ever queue them for deferred splitting?

> +
> +			percpu_ref_put_many(&folio->pgmap->ref, nr - 1);

Looks like we instead want a helper put_dev_pagemap_refs(pgmap, nr) 
below instead

> +		}
> +		pgmap->ops->page_free(page);
> +		put_dev_pagemap(pgmap);
> +		page->mapping = NULL;
> +		break;
>   	case MEMORY_DEVICE_COHERENT:
>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>   			break;
> -		pgmap->ops->page_free(folio_page(folio, 0));
> +		pgmap->ops->page_free(page);
>   		put_dev_pagemap(pgmap);
>   		break;
>   
> @@ -523,14 +533,28 @@ void free_zone_device_folio(struct folio *folio)
>   	}
>   }
>   
> -void zone_device_page_init(struct page *page)
> +void init_zone_device_folio(struct folio *folio, unsigned int order)
>   {
> +	struct page *page = folio_page(folio, 0);
> +
> +	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);

VM_WARN_ON_ONCE() or anything else that is not *BUG, please.

> +
> +	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);

Why do we need that limitation?

> +
>   	/*
>   	 * Drivers shouldn't be allocating pages after calling
>   	 * memunmap_pages().
>   	 */
> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> -	set_page_count(page, 1);
> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> +	folio_set_count(folio, 1);
>   	lock_page(page);
> +
> +	/*
> +	 * Only PMD level migration is supported for THP migration
> +	 */

I don't understand how that comment interacts with the code below. This 
is basic large folio initialization.

Drop the comment, or move it above the HPAGE_PMD_ORDER check with a 
clear reason why that limitation excists.

> +	if (order > 1) {
> +		prep_compound_page(page, order);
> +		folio_set_large_rmappable(folio);
> +	}
>   }
> -EXPORT_SYMBOL_GPL(zone_device_page_init);
> +EXPORT_SYMBOL_GPL(init_zone_device_folio);


-- 
Cheers,

David / dhildenb

