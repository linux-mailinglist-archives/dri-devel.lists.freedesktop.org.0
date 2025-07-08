Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF89AFCC54
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E479210E658;
	Tue,  8 Jul 2025 13:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QfzdF2In";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1471110E653
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751982066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=90JZwa2zY540O+XL2x/zpYzBcHl37ktmZ0WyKnrIg+Q=;
 b=QfzdF2InYKkl9KA3YdYhHjFdlI+ruQoI/x55bv+W8B8BZNvIqpnAVR1D2Aczzyu18gsQZd
 ZuaO09MdhuMiSSHxzDj9xT58P8Jho5rc/m+5z1o47safKdnUuMzSZcy0eo9Aeo3UDTk6SA
 jlsyLRvnprSyxONXhSsVMVQU7w6P8TQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-bGhPqQIEOamzCqTomIp--g-1; Tue, 08 Jul 2025 09:41:04 -0400
X-MC-Unique: bGhPqQIEOamzCqTomIp--g-1
X-Mimecast-MFC-AGG-ID: bGhPqQIEOamzCqTomIp--g_1751982063
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b4a0013c0dso1044596f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 06:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751982063; x=1752586863;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=90JZwa2zY540O+XL2x/zpYzBcHl37ktmZ0WyKnrIg+Q=;
 b=K6qhYZ3AqqTIomVhXx2iEaWrqDEJL1vkmrHp+NQGto0IHNy+agzWZvznZ2I7G+0yT9
 0ujF+fh+p17mtwWKUKoBpVwxVCn/EwtPX2y+d1N55ZTMzX55yGuDylvvfk2llNA2n2Hz
 m5tMuAaiMhjKlsDakX688qOhRQQvhRRu8RPeEIiJz87Gom0aZJAw3kC7Y+JqTgMku6pQ
 eQE5BCSzFqJTGV/XVgTyh2A9NpmKq1KTZbWBjVG+l2bTTkdACm3zPFQgtrNmAQnnQD+5
 jp8S4tz33vbkLb5xzY6Ibv/hiIZYFKvz9HKSgWaX9MrFmz3LwxzF2KXul0IVznfwgbt7
 dB9g==
X-Gm-Message-State: AOJu0Yy6kEl8o+ju08DzB0nZQvUEv/HdfqaU4sIQYwPOIiTDGRxKcCSR
 /fQ8H0EgBGbORHrNc5jmmFCESpTNsGuq7OiZ0esUdwyGpH5wEnHnnRmvlgaVB9GS9uc1Ucbgf8O
 UJPQ7H023Pm5mzO1fyzFaKq7m/LJ02JYmpNecFXahCgaAmxUaf7yiyjb1spm6d2mJ6BcsEg==
X-Gm-Gg: ASbGnctHSKeaM8bIF8vtAnKXCXa8IlZZh0q7PZWqJdZLfJyCk4Jz8NWgS7uXws0/Yxa
 AthYLfvY2Il98Dus1M4usVy0yQJNcJcC7DLgGs1SKE4sZlL7mA+rKVxYFK8x1OI0TPTwWWGsffa
 nBTUIhSeki28/xTK/WcsSk3Ip23Sz4FVo77NT8hWlW5ON1qoVpz6hgs1saYtvuwBKr10f8973+h
 XfpRPrC8v1dC/+qpRMLga1pG21IkxPvkfnT+RhC5nVweannsgcEORtUG7cWlqAsNkRNvIa9SXIU
 1sSwameYWr6b8UWLg5lnGTLS3zjsDUBFT0RBHqgZhoO8iG1UlCjquAgRVxvgr2LfLd2D97vtzPP
 ko3ghvskismOHcEPJ7Osr2y6fVSI2uVfaFqoau+AtU34lqr0qfw==
X-Received: by 2002:a05:6000:2483:b0:3a4:f902:3872 with SMTP id
 ffacd0b85a97d-3b4964c09damr11081421f8f.19.1751982063253; 
 Tue, 08 Jul 2025 06:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTwIccSZ2F+zKMy8zNMAZ8I0g4f+S3AXZFIEXYqZXvwxgwrx/WVWwrXZ8+odW2+fMzTmIWCw==
X-Received: by 2002:a05:6000:2483:b0:3a4:f902:3872 with SMTP id
 ffacd0b85a97d-3b4964c09damr11081377f8f.19.1751982062761; 
 Tue, 08 Jul 2025 06:41:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f500:4346:f17c:2bde:808c?
 (p200300d82f1af5004346f17c2bde808c.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f500:4346:f17c:2bde:808c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd49cee7sm22397085e9.29.2025.07.08.06.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:41:02 -0700 (PDT)
Message-ID: <59a5d9ed-36db-4799-849b-7bbd885465d1@redhat.com>
Date: Tue, 8 Jul 2025 15:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 02/11] mm/migrate_device: flags for selecting device private
 THP pages
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
 <20250306044239.3874247-3-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250306044239.3874247-3-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vHXpPdswjbUKE9ZouHC-wiN5HluQEmwlZpUlh83pEjM_1751982063
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
> Add flags to mark zone device migration pages.
> 
> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
> device pages as compound pages during device pfn migration.
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   include/linux/migrate.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 61899ec7a9a3..b5e4f51e64c7 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -167,6 +167,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>   #define MIGRATE_PFN_VALID	(1UL << 0)
>   #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>   #define MIGRATE_PFN_WRITE	(1UL << 3)
> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>   #define MIGRATE_PFN_SHIFT	6
>   
>   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> @@ -185,6 +186,7 @@ enum migrate_vma_direction {
>   	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>   	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>   	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>   };
>   
>   struct migrate_vma {

Squash that into the patch where it is actually used.

-- 
Cheers,

David / dhildenb

