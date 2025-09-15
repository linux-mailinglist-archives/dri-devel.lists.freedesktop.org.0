Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E550BB577FB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5178C10E450;
	Mon, 15 Sep 2025 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qarg0R4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691AC10E450
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757935333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6JS9BpphTEQIvKpjiDMgsvluJyslUVzzLKfuwxGpvmo=;
 b=Qarg0R4xEBZQi4dWaGHcWwgcrFNbN/Xu6kSQglOtFbpcP2SwxUF9SuyrgQOKVweXao12sE
 kMOkiFfbslByq2ctviPtzH2dAiWDbZFgwz0m+i4qefvnMX6ZnONU6QJ53CPLFecKWIjR3F
 VbrGzcvSzmcx6R6gcAhb0INHZpO6Pmw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-l_L_pf3GPsKNhZp4lBLG-w-1; Mon, 15 Sep 2025 07:22:12 -0400
X-MC-Unique: l_L_pf3GPsKNhZp4lBLG-w-1
X-Mimecast-MFC-AGG-ID: l_L_pf3GPsKNhZp4lBLG-w_1757935331
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45f2f1a650dso4130435e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757935331; x=1758540131;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JS9BpphTEQIvKpjiDMgsvluJyslUVzzLKfuwxGpvmo=;
 b=KxsiOrHQxPL2LFQYfuS+HZbMR9+sKQ+2yvUjLCaHkqfV9DginsXfezrL7W+oBWI5Ov
 e93Xd9wjpZpI1cSbV1bVYlAyLpazZkL+L9SOmTq0iVNXrMOYpBBHdAPDPxDKw2mQ6pGt
 P6BEi4RcrnYCffj+fpDsy5FYj4UtsA6llzWXLRaF+77x0DlPAQjOhydQndzxiWmZgJL4
 2NbTY+p8akWtdXy+Afzu9h6o1V2YZqMcKKDLDDBBJhQKhfnTu+0NxmWY7n7rH9s6W3V5
 VjR4VQU9HqAZXPZDuFFO5sZ1z34XFuIHAH2bKfa9jJpt7MmiYu1SvPd51KlWQINT/3Qj
 bMEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU44xY0mHTGFmlDk5tnruv7KpGgcYEDP0mbM1sDE7ssGFGOWJ2dIHbpGOTCRFYhu2Zlm5YH327B3bY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdq+vqV/dKD6tVV43JcdCIBB5PMCTxKfVVDvXlTEuicHAPiHWQ
 uI2tqE/Oep5F6NDBpxgTIzqaNZkynfL1hJLB9UkKyw+E6pPKXePsaN0lRVu2xVQYX6KTr0Y2ai7
 uEFuzOyOxJPOvrfRnVnovNzMJiqD4l0niiTf7DosmK7WXzNKpJS1/lNP95Pusz2Bc3FdbpA==
X-Gm-Gg: ASbGncsoO+I+sLW4ynWCpnZ/YJSoPhga2UFqbY1Fkblp1UjlufuJIugUWG77VBf6+CI
 LJWVBRWVnt0h5sTUZIYYmvlWuXDPqPuGPpnOM86LERENhf7mnBooe4skt22CdfQBUtZl8CwaANs
 KwdPAiHUHj4g984rDbXLqXg38Hyr8WmyMHnHDJHSBbS3yFr5r5mb2+FG1zOP817nvq8jvQH8Ece
 cUFiYbgdFLZklvr7KYqZZSAZDw311YYYBU53d4rKzhLlNwaeLxnrfm6rL0W3NNVO8YZgdmg3Jq4
 CHhElgOK5/8cNb7oUSWA1P5yWqjCGjaNXSQ8t2ggZSg9oGOnh1eJOlV7RHuBGv3qI64CutqR3M0
 oSCr62eIfUf8sfYiscJVUYSNNhw6duAEfzvZs07P4MUr1CpCte3Diej7Z9Y+xyHP827k=
X-Received: by 2002:a05:600c:4446:b0:45d:f7e4:bf61 with SMTP id
 5b1f17b1804b1-45f27ceb2f2mr68690455e9.4.1757935330613; 
 Mon, 15 Sep 2025 04:22:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbzlCmUlfFh3pRrb1LTU/GY0YGAbYOxUMXj2cLY+VIMiWhAEy48i5aLRY2rCGTwJQhgLvVKg==
X-Received: by 2002:a05:600c:4446:b0:45d:f7e4:bf61 with SMTP id
 5b1f17b1804b1-45f27ceb2f2mr68689975e9.4.1757935330079; 
 Mon, 15 Sep 2025 04:22:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd?
 (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de.
 [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7ff9f77c4sm11234210f8f.27.2025.09.15.04.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 04:22:09 -0700 (PDT)
Message-ID: <d5d7cf04-784b-447c-9d63-8322ac97be29@redhat.com>
Date: Mon, 15 Sep 2025 13:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 07/15] mm/memory/fault: add THP fault handling for zone
 device private pages
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-8-balbirs@nvidia.com>
 <d4ae7f61-f2f9-45dc-91db-4de7f3127744@redhat.com>
 <37196a41-77ae-4579-97a2-2c7a1eb65bae@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <37196a41-77ae-4579-97a2-2c7a1eb65bae@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oAypdKQx2Tulu8MRDFKK2Dm4d44tzicw91jyBIyGqSM_1757935331
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


>>>    /*
>>>     * always: directly stall for all thp allocations
>>>     * defer: wake kswapd and fail if not immediately available
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index d9de6c056179..860665f4b692 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -6298,8 +6298,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
>>>            vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
>>>              if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
>>> -            VM_BUG_ON(thp_migration_supported() &&
>>> -                      !is_pmd_migration_entry(vmf.orig_pmd));
>>> +            if (is_device_private_entry(
>>> +                    pmd_to_swp_entry(vmf.orig_pmd)))
>>
>> Single line please.
> 
> Ack
> 
>>
>> But didn't we have a pmd helper for that?
>>
> 
> This is a single if that handles is_swap_pmd() and then is_device_private_entry() and is_pmd_migration_entry()
> under that

I meant using

	if (is_pmd_device_private_entry(vmf.orig_pmd)))

just like below we use

	if (is_pmd_migration_entry(vmf.orig_pmd))


-- 
Cheers

David / dhildenb

