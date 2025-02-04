Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B31A26FAC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 11:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C822D10E5E9;
	Tue,  4 Feb 2025 10:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PksNHLlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1761910E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738666746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XpujTQImwnvH48Gh8o+ReoxCrgAbp83og5IvT6h4ywg=;
 b=PksNHLlXJzf+vjehsO/cTF/de800K7isE/YyVdmf6Ked4MMnULenf9XgTikPOwyhsu709q
 F9s72i7Er5Trmd6T2k/5JqoQshKhfyLTqr4ztdXHkRYnmiiqNPxi8uDBqmF2i1gHcrkKsu
 maGonUvrcnkFiPLl/1sk0DQm2pq+baY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-yqpVPV0pMJq8nZNFeYYY3w-1; Tue, 04 Feb 2025 05:59:04 -0500
X-MC-Unique: yqpVPV0pMJq8nZNFeYYY3w-1
X-Mimecast-MFC-AGG-ID: yqpVPV0pMJq8nZNFeYYY3w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361d4e8359so38300885e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 02:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738666743; x=1739271543;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpujTQImwnvH48Gh8o+ReoxCrgAbp83og5IvT6h4ywg=;
 b=JfP/YuODpl/eLW+oTNS9IxlE+A4qHVwtoHsApNrMsQusfEvpyKImCbI+l1MXO4/+Hd
 8269vVC9YJvATTd/2XlGw9wzQOdmDubo+5B9pVZoPk+WORQb2vsXIlkdd7I+Qyu/si6F
 RZRoB6EY7dMR1WArZENuJB7U7deejHtni2xRvPQLlHPWvBIi2P6m2fXGsYdt/dsYCZzg
 uRnmu5Q27RW/0q/teonXM1LdZIe+mxfw397ZTgO5K5pBTngKmW0MFfIgTTZhZE4ij5rQ
 LR47LAH+kaRKuPgu/z1prCnDtCZLkkbwMCdTdtgrMHUQ1+3qx82Z2orFrXvlKL1HJOaC
 r39Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXltV0+wOci6j6IeYK3XAasG1tQ+1XUAXdPAPQHs7Js9Uh4xRihoIGyWxx+3J+I02QV4SLMkFEM/2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw79ypszXMK5RfAlxFfkT0DMhNN86XtVp1iB8OWIHXPxkQI5smh
 3cx1r7qaqT8HjsLNn105EHss64wYA53Xr16JUfX26haCZAtGPqYOs4Z1olnOwcUXkUuLVIIdZ7A
 ngKK+Ta2mYsm+sMzjGkF4/zOt6Ry27rrhrjERm6WKSMU0wNia/v+Mv3Lj/oIEFY3aWQ==
X-Gm-Gg: ASbGncuzrOMW+rNdEJ6uYOK+sGvQs2E4JS7l8tql7Cf8qBn+wn2qHqgkI9bQLVgKIJo
 jy0vKG93ukEZ4IbM5x8FWHXtS3gX9JWiwpQEhqbRbffc8a42+lFcXUcrpxJCdH+LNtOv6EaXz4u
 vZpmE0Tqn+TzVgiSHUHqrB6ygfskk87A/qh5l5OtU1VVhRULZDps5d4ba9pBM+tKp+X4B72udLn
 KEIrwIVXUdiAd9xNuRBCqzbCzhljlqjoF4KpqvSIrIhNM9wmRm+5J9r7lhpQIgVv6RKP68nFOCs
 IoCNW2ReM5VJ3/5JDcdMmyztg/pGNQ5AOFNqfaQzxnkAbD+fWiJtfh91gLnPEMD1YtHUTqrjv76
 yd3RZJhWjB+AQ3OiX8sOLdA5NsSk=
X-Received: by 2002:a05:600c:4fc1:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-438dc40d46amr203679275e9.23.1738666742628; 
 Tue, 04 Feb 2025 02:59:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2pXXnBUdbjcdl5UcGdp7l7FhKF9MgvAbgHEFZ34qqL37B8yGAQruTpfwYsdNHYT5VAQSTfg==
X-Received: by 2002:a05:600c:4fc1:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-438dc40d46amr203678885e9.23.1738666742209; 
 Tue, 04 Feb 2025 02:59:02 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413?
 (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de.
 [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13139sm220452995e9.3.2025.02.04.02.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 02:59:00 -0800 (PST)
Message-ID: <211bcb36-5834-4969-90c4-73e26431d463@redhat.com>
Date: Tue, 4 Feb 2025 11:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
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
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
 <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
 <z7s7xb2ftv5hqg3uzjqkou6enguleazwwehxbi5zulbkar2aej@zlbdh2kdewdn>
 <d552cc03-b7af-44be-bcaf-13da720a2226@redhat.com>
 <Z50C9tyZC_wQS6Ux@phenom.ffwll.local>
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
In-Reply-To: <Z50C9tyZC_wQS6Ux@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rZLKhO0Ml_Rzpu2Akec1CqGZaeUo57c6F40KitiSkXk_1738666743
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

On 31.01.25 18:05, Simona Vetter wrote:
> On Fri, Jan 31, 2025 at 11:55:55AM +0100, David Hildenbrand wrote:
>> On 31.01.25 00:06, Alistair Popple wrote:
>>> On Thu, Jan 30, 2025 at 02:03:42PM +0100, Simona Vetter wrote:
>>>> On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
>>>>> On 30.01.25 10:51, Simona Vetter wrote:
>>>>>> On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
>>>>>>> Let's do it just like mprotect write-upgrade or during NUMA-hinting
>>>>>>> faults on PROT_NONE PTEs: detect if the PTE can be writable by using
>>>>>>> can_change_pte_writable().
>>>>>>>
>>>>>>> Set the PTE only dirty if the folio is dirty: we might not
>>>>>>> necessarily have a write access, and setting the PTE writable doesn't
>>>>>>> require setting the PTE dirty.
>>>>>>
>>>>>> Not sure whether there's much difference in practice, since a device
>>>>>> exclusive access means a write, so the folio better be dirty (unless we
>>>>>> aborted halfway through). But then I couldn't find the code in nouveau to
>>>>>> do that, so now I'm confused.
>>>>>
>>>>> That confused me as well. Requiring the PTE to be writable does not imply
>>>>> that it is dirty.
>>>>>
>>>>> So something must either set the PTE or the folio dirty.
>>>>
>>>> Yeah I'm not finding that something.
>>>>
>>>>> ( In practice, most anonymous folios are dirty most of the time ... )
>>>>
>>>> And yup that's why I think it hasn't blown up yet.
>>>>
>>>>> If we assume that "device-exclusive entries" are always dirty, then it
>>>>> doesn't make sense to set the folio dirty when creating device-exclusive
>>>>> entries. We'd always have to set the PTE dirty when restoring the exclusive
>>>>> pte.
>>>>
>>>> I do agree with your change, I think it's correct to put this
>>>> responsibility onto drivers. It's just that nouveau seems to not be
>>>> entirely correct.
>>>
>>> Yeah, agree it should be a driver responsibility but also can't see how nouveau
>>> is correct there either. I might see if I can get it to blow up...
>>
>> (in context of the rmap walkers) The question is, how do we consider
>> device-exclusive entries:
>>
>> (1) dirty? Not from a CPU perspective.
>> (2) referenced? Not from a CPU perspective.
>>
>> If the answer is always "no" to all questions, then memory notifiers must
>> handle it, because we'd be answering the question from the CPU point of
>> view.
>>
>> If the answer is always "yes", there is a problem: we can only make it
>> clean/young by converting it to an ordinary PTE first (requiring MMU
>> notifiers etc.), which makes it quite nasty.
>>
>> Mixed answers are not possible, because we don't know just from staring at
>> the entry.
> 
> I think it's the gpu's (or whatever is using it) responsibility to update
> folio state while it has ptes pointing at memory. Whether that's
> device-exclusive system memory or device-private migrated memory. Anything
> else doesn't make sense to me conceptually.
> 
> And I don't think we can just blindly assume even for device-exclusive
> mappings that they will be dirty when we convert them back to a real pte,
> because we might have raced trying to set up the gpu mapping and restarted
> before we even put the pte into place. Or maybe someone was real quick at
> writing it back after the gpu already dropped it's pte.
> 
> I guess maybe some clear documentation in all these functions
> (make_device_exclusive, hmm_range_fault, migration helpers) that it's the
> drivers job to dirty pages correctly would help?


I'll add a comment to make_device_exclusive(), stating that these 
entries are considered clean+old from a MM perspective, and that the 
driver must update the folio when notified by MMU notifiers.

We should probably document that somewhere else as well as you suggested 
separately.

-- 
Cheers,

David / dhildenb

