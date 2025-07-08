Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175D6AFCDF1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCD210E67C;
	Tue,  8 Jul 2025 14:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c9vT67pY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA4F10E68E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751985638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OkhNafGrkOV7xyaO94NX8KYucK3aUTcUdxPsOzblwlM=;
 b=c9vT67pYQBLQksmmziGYFex+zV7OCr5p8CiW/uOg6iaDXLhEG5JSmEVTXALx0Z9FupcSW2
 1QGZH2yYDT66qKCuvG9sT5KWEMEwuzTFe8ylyKXAA1TzFuxvVAoxyrdhsqnDDjente57nK
 Zfb6T7+l6ohcocERYVdCLYbqtD5EjdM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-NQT0Rd_zNyePBFp_lD1S1A-1; Tue, 08 Jul 2025 10:40:36 -0400
X-MC-Unique: NQT0Rd_zNyePBFp_lD1S1A-1
X-Mimecast-MFC-AGG-ID: NQT0Rd_zNyePBFp_lD1S1A_1751985634
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450d290d542so26493205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 07:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751985634; x=1752590434;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OkhNafGrkOV7xyaO94NX8KYucK3aUTcUdxPsOzblwlM=;
 b=AduIv/aKzXqcGFq2Ga4MAogWH6bok2M4tZ5KQbE/NA2j9yMKNuPN1F+FNHoPw26BUY
 TxwTg26aEP0Xa508u65mFGwYUZLLIRP2KpO+wFXdwb4Q5qX25l5ZNDCzGhRBt2W+dpYh
 fJOFBMD4MkpH89K3hDwy21+dTqvf3qVW/Kn1qaK8RbmEb+EyTyRU3tdo365ZO7Nji5SR
 dTzduyaLYCnIRZajoxM3rWwzbrh7tMvPgy9XQzxYR3G0+ck/OBEt05ivona60i70PmNo
 LfRb82lsgMhK7ofcMksbHwk8+S5XBV/s3sl35dUlX2e6OiASRIg3Jav9ma8+F0HYXu/U
 cOxw==
X-Gm-Message-State: AOJu0YzROi0XBJgU9t2K41umre5N+XGngd3vugpMDdAvGnwiCq/qlTWg
 CDsa6WMxW9jUolqMImzfW+kdWIggXghD3RHwPfaza322ladVg2s8zuLlNNnUpFuLTkt0Jyq5Ar5
 0UfSQNIlJNQ18peBAIZ4vBZhltmnLhukSq8OsOWSaqUOf+VhGnR+IxTUaIHXrSZAbhBlsGg==
X-Gm-Gg: ASbGncvx8gIC/XW1a14d0MmAFlqHzi7LVOQj19I67AXzHWcl3+14xl7j4QqcMVd++5J
 xEJ+mCECiWV9AeDHTKLIxNcB8OKs4uo7gmR1IHWLfff8HMvgomQ3hYzf7Dgbop18ut/ZuAM5b2a
 Ds2yDum+qUmh6AHNmIvwBRDsgQg8hHldrJPBkLOncIH2kt26xuqjdGp8ZspeTeK3RiUM0OiqWTa
 NfGCy9CVgwEG1fFHbQyKoH1xrCYedR6CzgMdc3e/gyWNnivbSjVBm/55vQp3sUeZEkGWeVVA7TO
 NwKsgpb+fuGz713AB45y19dpVLS+I1I66iGwdmVL1S2XUPx10xwIMn4Upz1qmVODgktB+UsmoaL
 ngJCkknkxpyk6SzYGgmW6uHtI4Y6ZCaZbraf8y5EndisioE4c9A==
X-Received: by 2002:a05:600c:4e05:b0:43d:2313:7b49 with SMTP id
 5b1f17b1804b1-454cd4cbd79mr34231085e9.12.1751985634187; 
 Tue, 08 Jul 2025 07:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7704N8AonHRhmAKpslFBnCYzTFDT1HqGSr8qtxRp4vTBOvWbadg3iV4yJ5Tan3/eZLUOHRA==
X-Received: by 2002:a05:600c:4e05:b0:43d:2313:7b49 with SMTP id
 5b1f17b1804b1-454cd4cbd79mr34230645e9.12.1751985633696; 
 Tue, 08 Jul 2025 07:40:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f500:4346:f17c:2bde:808c?
 (p200300d82f1af5004346f17c2bde808c.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f500:4346:f17c:2bde:808c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd43cfe3sm24671795e9.2.2025.07.08.07.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:40:33 -0700 (PDT)
Message-ID: <3098c728-c4a7-4559-8213-2bca7971fda7@redhat.com>
Date: Tue, 8 Jul 2025 16:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 05/11] mm/memory/fault: Add support for zone device THP
 fault handling
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
 <20250306044239.3874247-6-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250306044239.3874247-6-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: inblh4bZkkcO4cdE6HiWEw1984LIh46cbqm93a1jFjk_1751985634
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
> When the CPU touches a zone device THP entry, the data needs to
> be migrated back to the CPU, call migrate_to_ram() on these pages
> via do_huge_pmd_device_private() fault handling helper.
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   include/linux/huge_mm.h |  7 +++++++
>   mm/huge_memory.c        | 35 +++++++++++++++++++++++++++++++++++
>   mm/memory.c             |  6 ++++--
>   3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f..ad0c0ccfcbc2 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -479,6 +479,8 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
>   
>   vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
>   
> +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
> +
>   extern struct folio *huge_zero_folio;
>   extern unsigned long huge_zero_pfn;
>   
> @@ -634,6 +636,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>   	return 0;
>   }
>   
> +static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
> +{
> +	return 0;
> +}
> +
>   static inline bool is_huge_zero_folio(const struct folio *folio)
>   {
>   	return false;
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d8e018d1bdbd..995ac8be5709 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1375,6 +1375,41 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>   	return __do_huge_pmd_anonymous_page(vmf);
>   }
>   
> +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
> +	vm_fault_t ret;
> +	spinlock_t *ptl;
> +	swp_entry_t swp_entry;
> +	struct page *page;
> +
> +	if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
> +		return VM_FAULT_FALLBACK;

I'm confused. Why is that required when we already have a PMD entry?

Apart from that, nothing jumped at me.


-- 
Cheers,

David / dhildenb

