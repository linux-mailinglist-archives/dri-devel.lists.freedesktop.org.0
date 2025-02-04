Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EFCA26FA1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 11:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC4210E31B;
	Tue,  4 Feb 2025 10:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X6SzkhM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024BE10E33A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738666575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ENPdj8vS//32EG5fwlsbuS9PmiW4rTWenuQKfCHE7XE=;
 b=X6SzkhM0ZEOeoVrW2I9AucgeD5lP7X3vPXTnHAOd7oB1ectwXAP0DhTGehU8ZtCg7x59ZD
 1moUBSb3WahCj9+/Ti22yJodxNjDPOb5yBmDX+duc3APjjCVzuq7Nv4GUK1lTzMFyahQN8
 wbiBCcqM4rVPjxoSJX0vJGZ/wF7fuoE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-3gfOdW4XN_uKIGSi73IigQ-1; Tue, 04 Feb 2025 05:56:12 -0500
X-MC-Unique: 3gfOdW4XN_uKIGSi73IigQ-1
X-Mimecast-MFC-AGG-ID: 3gfOdW4XN_uKIGSi73IigQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dae3db3bcso258060f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 02:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738666571; x=1739271371;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ENPdj8vS//32EG5fwlsbuS9PmiW4rTWenuQKfCHE7XE=;
 b=vSSBrI/DZWqHgOnkM9nKpetMjZvNPUyAjntagIgTvLgJCNrGF6bNMpfIW3TEoYLIhJ
 MRMZiseyKIjwvqfx8PHi6jXMi0rfnGaTz6KjsCUuSJsU2cVMnotB9J08sGQQP/scjPlQ
 U65iVDARHOZ+KKoaOFsYKg1wDokZgbujCnfmNZ4ertA0LAr8LArfN9tYSsYuQK3hsmvE
 2THdnJW4ggQkczngiiQv5J0ARqpFcLmKKfMq8r+s6l0OudG7PkfPx64dSKW1kw2w5Isf
 jc9H1knKWK/RZ5wGlGuVyj3ceOD0enEMpTGYmbmleCSZYv2YQHTfl9UPT7xd6JE0AawX
 thxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZrd/G85IA3jsf5X86nEYkFZwPyQ1jIpSS/U03ygRSBeDt/2O+zKI34OGkrvKn6uwgJGu7xuvfjpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4PvxU5VgfKbzdukQDKz1Oh38hCB8CXks+dyYXzyOCLaVyIq8f
 JO71ZJXojjf8jKjue3/hV2ihF3G3NZ7wbP7ozPo5hG8IIQJgZOmbJ7CsmBhvjd8ZYAkwe194jKm
 4/JUrHJJYLfd62BWnWh2TyB0A1+hPGxUc87SzikV5dJiSrTw4/Xid191f1CcG+UvZsw==
X-Gm-Gg: ASbGncvD0UeAwcY1U6CoHBUlIbDhxIOZaFVi7IfZX1dE7FS3ZRtmyJOm/0v7A/uMv/K
 I3Jzpvw7Z2S9nTVgOYtoecrAiOKYtlxlXMK6Isrq0EPgl64dlVQV2y7dKKijuDU73Y0l6a/G73O
 t5fqt7xvZ4+IuuMEBXhCGLs64qj4kXDq4J9uROktrSxUpFxHu+qJvbTS/cVAFIVUIIBWNpFjluj
 /pOXZDRX7qZFkRuKLEHDM9qPXc3n+7zGZ5ARYm/LBKEWurWCcJxvYyqjimUEdeUVhVldkDd+fbP
 V3d9fsNZUsFyjeLERceKaW6xefM5xTR0qZHIa76g3HM4/2WBd3/+GLSEmnElbNDmuQNXUPj6D7J
 MLe/ZoNgacvrnjSqZRV1ACu5VFEM=
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-38c5194a53dmr21633855f8f.14.1738666571289; 
 Tue, 04 Feb 2025 02:56:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3rySAUqWFDjklN/nsVzTv51QU8ZGlK2qwHlBAwJac139RiPUXayk27Sc1Xngxx91aPNI8fw==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-38c5194a53dmr21633827f8f.14.1738666570873; 
 Tue, 04 Feb 2025 02:56:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413?
 (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de.
 [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57b6sm15474346f8f.72.2025.02.04.02.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 02:56:09 -0800 (PST)
Message-ID: <99f215f2-1e7f-4ff6-adec-e838916f6f4e@redhat.com>
Date: Tue, 4 Feb 2025 11:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
 <c5befaa4-bd00-4784-ae66-ddbf16dfe1d9@redhat.com>
 <fp54u2cgvyyp73lpp7bbc5zn7fmyoc7pjn3sokqmlvpq5y7toq@mj6dshe3hg7o>
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
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fp54u2cgvyyp73lpp7bbc5zn7fmyoc7pjn3sokqmlvpq5y7toq@mj6dshe3hg7o>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d9jYSWu-6EogAGLFejTqV7hUJ3MEcjE3hdky-MvT2ak_1738666571
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

On 30.01.25 23:31, Alistair Popple wrote:
> On Thu, Jan 30, 2025 at 10:24:37AM +0100, David Hildenbrand wrote:
>> On 30.01.25 10:01, David Hildenbrand wrote:
>>> On 30.01.25 07:11, Alistair Popple wrote:
>>>> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
>>>>> We require a writable PTE and only support anonymous folio: we can only
>>>>> have exactly one PTE pointing at that page, which we can just lookup
>>>>> using a folio walk, avoiding the rmap walk and the anon VMA lock.
>>>>>
>>>>> So let's stop doing an rmap walk and perform a folio walk instead, so we
>>>>> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
>>>>>
>>>>> We now effectively work on a single PTE instead of multiple PTEs of
>>>>> a large folio, allowing for conversion of individual PTEs from
>>>>> non-exclusive to device-exclusive -- note that the other way always
>>>>> worked on single PTEs.
>>>>>
>>>>> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
>>>>> that is not required: GUP will already take care of the
>>>>> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
>>>>> entry) when not finding a present PTE and having to trigger a fault and
>>>>> ending up in remove_device_exclusive_entry().
>>>>
>>>> I will have to look at this a bit more closely tomorrow but this doesn't seem
>>>> right to me. We may be transitioning from a present PTE (ie. a writable
>>>> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
>>>> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
>>>> update their copies of the PTE. So I think the notifier call is needed.
>>>
>>> Then it is all very confusing:
> 
> Can't argue with that in hindsight :-)
> 
>>> "MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>>> longer have exclusive access to the page."
>>
>> So the second sentence actually describes the other condition. Likely we
>> should make that clearer:
>>
>> --- a/include/linux/mmu_notifier.h
>> +++ b/include/linux/mmu_notifier.h
>> @@ -43,10 +43,11 @@ struct mmu_interval_notifier;
>>    * a device driver to possibly ignore the invalidation if the
>>    * owner field matches the driver's device private pgmap owner.
>>    *
>> - * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>> - * longer have exclusive access to the page. When sent during creation of an
>> - * exclusive range the owner will be initialised to the value provided by the
>> - * caller of make_device_exclusive(), otherwise the owner will be NULL.
>> + * @MMU_NOTIFY_EXCLUSIVE: (1) to signal a device driver that the device will no
>> + * longer have exclusive access to the page; and (2) to signal that a page will
>> + * be made exclusive to a device. During (1), the owner will be NULL, during
>> + * (2), the owner will be initialised to the value provided by the caller of
>> + * make_device_exclusive().
> 
> Yes, I think that makes things clearer. Logically these are really two different
> events though - I guess I didn't want to add another one at the time but I
> wonder if we should just make them separate events rather than overloading them?

I had the same thought and then I wondered: can't we simply use 
MMU_NOTIFY_CLEAR for the exclusive->ordinary path?

I mean, it's essentially a zap+flush followed by a re-insertion of the 
PFN swap entry. Similar to page migration ...

-- 
Cheers,

David / dhildenb

