Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89CB9E881
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 12:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6610E184;
	Thu, 25 Sep 2025 10:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GKrXIzuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A1110E184
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758794503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8GYfmE+k0d5YWbdZiC8QhNj3hq9CWQkLFh7lpDQVQfE=;
 b=GKrXIzuv/bLY9b1LfXfVPr5jKsZpPHgbboHiuCntH1Te/Evx3UalnCy/MdB/0ejx2EdrK6
 +ycCMmxs9yGzPYbemRYkEHDsyIyvYfdm9JsdsYk3w5DPSW21JCGaqIcZcyn62wrnYIu+GX
 obzluTB/52mY+lp7iUnXUKUWUqlJpFo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96--eB3kJd9NPGo99D8eurYAA-1; Thu, 25 Sep 2025 06:01:41 -0400
X-MC-Unique: -eB3kJd9NPGo99D8eurYAA-1
X-Mimecast-MFC-AGG-ID: -eB3kJd9NPGo99D8eurYAA_1758794501
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e375dab7dso1420505e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758794500; x=1759399300;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8GYfmE+k0d5YWbdZiC8QhNj3hq9CWQkLFh7lpDQVQfE=;
 b=WMbOs+wQI84OK/oh0eX0I33HUi+SwulbcmOlSVueIW+5fz8NM0XQcZcHufSqIDs2/d
 eMXXX6x6IQ5W8MbxgN3Yt7MybRGkZG9f3pEA+08F+5kkEHDZjnWa2Bf/bOiWHF7bKrLe
 ueqJD+Vn1ft1SVQMEMdBKpbtV10vtVZIF35XYa6Q0cVNtWbkPfR60ZU+qAGVW9EslOd7
 oRswyrQUrkAL+JgNr02bP12k9GHxJFYHDcNfrSrL8uLYVPWAl+jTEzv0gi3QfedG30ZX
 OEq267ZAIcDYxa5xy20ePs35nySr5OJjzFFP6kdWyTFuAN/XzdT26z4inIfgbLv6VHz/
 atRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAO8njNHmXH5LPex8YyTR0hI7B+1otYf0xdkcw60N9jMSihHxU6SK38u1+RCKcpnDfSUMyBHX9LgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwUKSUZCxWua0i9HnzvtAYBf54nKhfcCnDBjQ5bnd83QtpbtIb
 xX1bh0ZJDcPi/KIRM8FluJCV1x4SEtTkkORKzqqzLQHSWhnZg4YRaNPsnVPmvyOsIt6/NVQZHI+
 XMGzuOk9G0Yort5FTV9qr5xBzkzcPXFy5geUOvQo/wzHoZhhQ/SXcoKeRE2Md/A7sYzwVJQ==
X-Gm-Gg: ASbGnct+1blxtB1DkncMf6z5GyM+FSWSBj/dMfWcAJnGLmcmW3fMblYyF0GKtxkyAoM
 F0Huc0o3hJgFpIQByga5YuuhRCk8f13F1rS7TMFFy3UQ3AmdyUAyegbWtT+MGAuOrD50fV8QUMW
 F0ccp79s8JcBRNfV5YbzoublwJZskqpz0QRPkbuzIFomzmpnf23FD5aTg+LjvBS+m5HzLgJhtE6
 bZkR189qiOQTVX0SvQulH0DilHc8WEZ9RSm+UBqbb3nCil3OzYo5j9inVEmC0gBcaGNEqK/Y3iQ
 HUanlVRYAN/j/dxc5x20TdCA7rV1U6DFlgkNJ9JSs6pf77eFcdQG3cBCKBMI407iItaSFLvnTIv
 yOYSNJ/g7i1lJil14lAj1rFZDvftptiNRvSHpgAWSSgW5wVdlYNmjpkuMiXUUsA23MgnT
X-Received: by 2002:a05:600c:1d07:b0:45f:2805:91df with SMTP id
 5b1f17b1804b1-46e329eb016mr27720635e9.20.1758794500326; 
 Thu, 25 Sep 2025 03:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJBLgrscqxeUvK3zCTB81zQ03AZ8FMFwoE2WABAhafpLxL3o7HLyxi6RuvwKQYgGpl6h0/hw==
X-Received: by 2002:a05:600c:1d07:b0:45f:2805:91df with SMTP id
 5b1f17b1804b1-46e329eb016mr27719935e9.20.1758794499610; 
 Thu, 25 Sep 2025 03:01:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08?
 (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de.
 [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab48570sm68576145e9.16.2025.09.25.03.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:01:38 -0700 (PDT)
Message-ID: <b0bd326a-0ef6-4c72-ae25-3faff1fd6eb7@redhat.com>
Date: Thu, 25 Sep 2025 12:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 04/15] mm/huge_memory: implement device-private THP splitting
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-5-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250916122128.2098535-5-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yfIRZxiQwlFEpvfrz-gbWrg2bNzMDEdXGwtLMIT1sdE_1758794501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16.09.25 14:21, Balbir Singh wrote:
> Add support for splitting device-private THP folios, enabling fallback
> to smaller page sizes when large page allocation or migration fails.
> 
> Key changes:
> - split_huge_pmd(): Handle device-private PMD entries during splitting
> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>    don't support shared zero page semantics
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
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
> ---
>   mm/huge_memory.c | 138 +++++++++++++++++++++++++++++++++--------------
>   1 file changed, 98 insertions(+), 40 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 78166db72f4d..5291ee155a02 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2872,16 +2872,18 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   	struct page *page;
>   	pgtable_t pgtable;
>   	pmd_t old_pmd, _pmd;
> -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
> -	bool anon_exclusive = false, dirty = false;
> +	bool soft_dirty, uffd_wp = false, young = false, write = false;
> +	bool anon_exclusive = false, dirty = false, present = false;
>   	unsigned long addr;
>   	pte_t *pte;
>   	int i;
> +	swp_entry_t swp_entry;

Not renaming this variable avoids a lot of churn below. So please keep 
it called "entry" in this patch.

-- 
Cheers

David / dhildenb

