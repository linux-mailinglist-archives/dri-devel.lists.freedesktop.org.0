Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B8A23155
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 16:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600FD10E9B1;
	Thu, 30 Jan 2025 15:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KFQLE0+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387D110E9AB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738252763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DsnUIxFI2s6Rz4ZTdh0EYdszbaLS5S9D8bAJj6V8Zjk=;
 b=KFQLE0+xwllXgNWe0mWuVPWjyLs4+z0poanetdkeErLALxAZqoVnMfPTHYqL3M92OhiHdt
 Qft+OLXyTiIEGyTrQlmG2+ESbrxP3coHXbnlZsJ3yUSw/S4yliRokhDggyXnf/hyH+XhsD
 WwCkGDLEfwUXbwcmPs38ZtNqcWxuj8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-NixlAAOhMPWXvh8TYZdkdQ-1; Thu, 30 Jan 2025 10:59:21 -0500
X-MC-Unique: NixlAAOhMPWXvh8TYZdkdQ-1
X-Mimecast-MFC-AGG-ID: NixlAAOhMPWXvh8TYZdkdQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4362f893bfaso4940885e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 07:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738252760; x=1738857560;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsnUIxFI2s6Rz4ZTdh0EYdszbaLS5S9D8bAJj6V8Zjk=;
 b=MWRYR/jXPC7XzjRSAXhNz4IifiIZwXb//bmM1pN/QPNW1UdYXKvdw5A4AIT9gS5Fdp
 bJpAv2qc6+xVwJ7M3uNX7s6ekHBArys5lhi/v8S2ghvvOsE2kozV4JCjFZ6/y5wB9gMQ
 gQy+cSv5YmiDcYfa6gQH78q25+gbPIH8bHTHEQgCevyiZxbDrVIgyglIuovnxNUCyakB
 kme5io1A6KbogoNgf58TYzW/eyTLvewmWSC1ZWMjpNVRKswLNQ81mW93AYD9etFQQO/2
 GA4RsagMLpJtuSXedF/aUvmU7CrKZL65/X+NcxjmNgBEb+PtJ5V0OS31Sbst7RK+njen
 Yl8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhk9rntGpwUcH+qvCgcGvODHsc04IBGytuKb/ZqrWHZLmPD6j5N1w3jtIPKy3Aq1wekN9Hz6c+TD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCaCkOQoHAa1s3SviixPgYPDmVT7uKQENUnPikoo0iY9R08UcI
 oWK9k2N5sS95KzlvbCJ6wbSa3E5ZIZqwfNgwLfY2W0uR94dSVp76VeIa8gULZ/yCVn4AxACAvey
 Jmc0QdZAFndFFpreEw+Up0pvaiF9sM0gn/+VSZqO00ljsxdkT9KHIwyt8siokY9DGvg==
X-Gm-Gg: ASbGncuYxXitfvrPZidVZsZoysHZ2ozgOANLb7/VB0tVU4UCttE86S3WgNSR3gNUeY7
 RVtSHEAcx/yraWsdMjHSekbiZ1mBSVqneC6COrbFC1JbC8acmXpD8YIPUke12Vqgq/4eBcKX6D+
 x0KPwfP3URjmeZiT24RUz3LCaLJD/kgeUUeu1c+I9y4ipgZoMJFq4t271nJelV0/BDzDIO8e3/G
 FXl+OJ+YkICwptuT2nxkZPAxazmIufv8vfHxVlnijjcDwW/+6Tf3C2ueOEkF0G7uKlGQZpQ9mju
 lBURQsITLblrIYt3ixx8uP9SJlda5hQprk0eFby4ls1I/wnVL3b+9ZQREnEP1P6mBxdrpO98Kph
 GG7HM2SfyAVCh8WdmDwZdImnCV4FFFM2U
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id
 5b1f17b1804b1-438dc3fc2b0mr67980815e9.23.1738252760133; 
 Thu, 30 Jan 2025 07:59:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3rx1FCxTfK9dT4GZUYFii4gIoyAgygN9uLXGcwSeyv5w8U63P6tIrS8/LxKqXr0qRCsRl9g==
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id
 5b1f17b1804b1-438dc3fc2b0mr67980555e9.23.1738252759687; 
 Thu, 30 Jan 2025 07:59:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb?
 (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de.
 [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f41esm27323025e9.36.2025.01.30.07.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:59:18 -0800 (PST)
Message-ID: <9f59b475-232f-41d4-bd6f-7f84111062ac@redhat.com>
Date: Thu, 30 Jan 2025 16:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
To: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
 <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
 <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dASOXBRTFISIkVNjXvT1I7kKPexpg9i_YrdULAk9QRo_1738252760
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

>>>>> Note that the PTE is
>>>>> always writable, and we can always create a writable-device-exclusive
>>>>> entry.
>>>>>
>>>>> With this change, device-exclusive is fully compatible with THPs /
>>>>> large folios. We still require PMD-sized THPs to get PTE-mapped, and
>>>>> supporting PMD-mapped THP (without the PTE-remapping) is a different
>>>>> endeavour that might not be worth it at this point.
>>>
>>> I'm not sure we actually want hugepages for device exclusive, since it has
>>> an impact on what's allowed and what not. If we only ever do 4k entries
>>> then userspace can assume that as long atomics are separated by a 4k page
>>> there's no issue when both the gpu and cpu hammer on them. If we try to
>>> keep thp entries then suddenly a workload that worked before will result
>>> in endless ping-pong between gpu and cpu because the separate atomic
>>> counters (or whatever) now all sit in the same 2m page.
>>
>> Agreed. And the conversion + mapping into the device gets trickier.
>>
>>>
>>> So going with thp might result in userspace having to spread out atomics
>>> even more, which is just wasting memory and not saving any tlb entries
>>> since often you don't need that many.
>>>
>>> tldr; I think not supporting thp entries for device exclusive is a
>>> feature, not a bug.
>>
>> So, you agree with my "different endeavour that might not be worth it"
>> statement?
> 
> Yes.
> 
> Well I think we should go further and clearly document that we
> intentionally return split pages. Because it's part of the uapi contract
> with users of all this.

Yes, see my reply to patch #3/

> 
> And if someone needs pmd entries for performance or whatever, we need two
> things:
> 
> a) userspace must mmap that memory as hugepage memory, to clearly signal
> the promise that atomics are split up on hugepage sizes and not just page
> size
> 
> b) we need to extend make_device_exclusive and drivers to handle the
> hugetlb folio case
> 
> I think thp is simply not going to work here, it's impossible (without
> potentially causing fault storms) to figure out what userspace might want.

Right, I added a link to this discussion in the patch.

Thanks!

-- 
Cheers,

David / dhildenb

