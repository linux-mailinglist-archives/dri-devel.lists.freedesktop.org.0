Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4CB9E8E7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 12:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F110E8B5;
	Thu, 25 Sep 2025 10:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TuHO+6ur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8574810E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758794784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UQ1yIMrrwyU17r+tTnLpblX0dAaSzYGyBKLGlXcYZwI=;
 b=TuHO+6urt6hJn3ze4poCZ3CLLNwR1YxLMijTAfvSWsiDQHwihRPlaixSpw0MLijNgEm9sv
 gd76tehzjH+VnXrNbPZA3yxdkh88hIIIUC6Bc5CVXA0UOmDMhGWs32OTR/wjktKtWeHrs5
 851k1SSlBgIDK7IiYyn4rYUw07+zBc4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Msw0dO7ZOoSnh6uFwOjbOQ-1; Thu, 25 Sep 2025 06:06:23 -0400
X-MC-Unique: Msw0dO7ZOoSnh6uFwOjbOQ-1
X-Mimecast-MFC-AGG-ID: Msw0dO7ZOoSnh6uFwOjbOQ_1758794782
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e31191379so4948715e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758794782; x=1759399582;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQ1yIMrrwyU17r+tTnLpblX0dAaSzYGyBKLGlXcYZwI=;
 b=bODyrttJeRMJ7bPPDBAfURyeUqiKOkbftHmLOq8z6UhWG3ijK64g4l5Y8JFhopQC1e
 uWVN+tQixJAr1KgoANSh6Vl5mayDZczz9cH/FDSFbWoUAQJcRQE74UI+hlFNwiMKIohi
 B4kzMpWrfuHW7W6fbnlmJa2JFYBp4uro3vo8ecKv+gbfVBS00/9xEy+WQVvFzbuNX07l
 uOBKZFTOFnVwRCLx19DIOLar31LD1LlRsBjLB7Y2YVO33AVMPBA61FGK4kcI47EqbcHR
 Wq3K6JODxD5v+a+4D2+x7fPkborTeS9Ej1I97Vur1D6FosFsTx87nlzoP/WzLXMJdApX
 l14Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5GmoCgGexjpBMN965VZ8DcFyknkzUrfxNqABnghDJegPF7TvCW11IHPOmExQ3GeP+KsPYp6v0g+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy67kcuOuwfPsbNCk4RHmJ6pIF+AqnLU0wva03tJMZ+i0pojno
 i/l7TRkb2YhrXcZpN31gMKED5RNwpxo1UcPowif541ZxwzPQ6Dp+kuyZXTwILEx2+KCv9ZZeNwn
 YzZ8Q/mgf3JU2NyXob8R3eMcIy1XQDHAWWVKVkse/OiH0BxxJR7BjTKemT0aGCBnnKYAdZw==
X-Gm-Gg: ASbGncsf7iuSK3SomhepRpDqLTrjsvXdTYW735PjbQoUFpGXi3qLCHZUEr8buGlysBi
 7gAhdpA7absLuT1j6yYaHmKWEtCOajJHSPBew7Sss4tDQq/4yYTmPL5ga+skDZD/wN8IOYAUpD2
 fpVCmBqPsWtCmXMGyOgkedJvP1pAFqYlDhvKzvBdVHN66TKLTMf6sohTh2HntQA4ylKuA5ECvpp
 Ebh4Ti7T0foDUEwpWysSHipYM+4/va8DVfqZfn8uZEaNOxOwIK69OJL6mv45m+/V9wfKNFw/GiM
 yspVWlNrLZPTk/KBYbzh+iRd5J0DkQBAIHsrzAyjSfXk3lSpb1cw08heHTvXAyhj1fW3U54tSsX
 fkn1QNvE3YBwDimrCrqElq4Goge5enKiJ3prKJUyUtrwy39xT2/Y/+EKl5yz1Q0FD/2MA
X-Received: by 2002:a05:600c:1e87:b0:46e:27f7:80ce with SMTP id
 5b1f17b1804b1-46e329e51c2mr23724935e9.23.1758794781994; 
 Thu, 25 Sep 2025 03:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXJl4bhmMZAV2Ov8ckXqohzCkRtHDu295sdMoIicohDcdpvJzXAjcv+ktFKrVhD9D0sp0u6g==
X-Received: by 2002:a05:600c:1e87:b0:46e:27f7:80ce with SMTP id
 5b1f17b1804b1-46e329e51c2mr23724515e9.23.1758794781570; 
 Thu, 25 Sep 2025 03:06:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08?
 (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de.
 [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f1dsm70034495e9.13.2025.09.25.03.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:06:20 -0700 (PDT)
Message-ID: <c9a0f531-bba6-48a1-bb50-639fb4f2dfb6@redhat.com>
Date: Thu, 25 Sep 2025 12:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 04/15] mm/huge_memory: implement device-private THP splitting
To: Zi Yan <ziy@nvidia.com>, Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
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
 <7987AB89-4E80-4A0D-8736-E95F998698DA@nvidia.com>
 <a77b03b8-508b-4bad-8913-fb825ecd8a0d@nvidia.com>
 <F6F6DB2E-C08B-417A-A8CB-3E759FE2C3A7@nvidia.com>
 <901c82e7-0442-4791-b249-b035f8ee428d@nvidia.com>
 <B24E4F6A-F61B-4E9B-A2FE-4004C62A3DD2@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <B24E4F6A-F61B-4E9B-A2FE-4004C62A3DD2@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2aKV5YRpc54h92RS2rvmILCYPTorBnQYZ2fIjDGdH6Y_1758794782
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

>>> Even if this is the only call site, there is no guarantee that
>>> there will be none in the future. I am not sure why we want caller
>>> to handle this special case. Who is going to tell the next user
>>> of RMP_USE_SHARED_ZEROPAGE or caller to try_to_map_unused_to_zeropage()
>>> that device private is incompatible with them?
>>>
>>
>> I don't disagree, but the question was why are device private pages even making
>> it to try_to_map_unused_to_zeropage()>>
> 
> Then, it could be done in remove_migration_pte():
> 
> if (rmap_walk_arg->map_unused_to_zeropage &&
> 	!folio_is_device_private(folio) &&
> 	try_to_map_unused_to_zeropage(&pvmw, folio, idx))
> 	continue;
> 
> Maybe I am too hung up on this and someone else could pat on my back and
> tell me it is OK to just do this at the only caller instead. :)

I think we shouldn't set a flag for a folio that does not make any 
sense. Just like we don't set the flag for non-anon folios?

In addition, we could add a 
VM_WARN_ON_ONCE(folio_is_device_private(folio)) in 
try_to_map_unused_to_zeropage(), to catch any future abuse.

-- 
Cheers

David / dhildenb

