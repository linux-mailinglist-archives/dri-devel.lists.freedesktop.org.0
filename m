Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711FDACEB7E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7E10E813;
	Thu,  5 Jun 2025 08:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KG8DVzVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC0D10E813
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749111036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/aafh01NTxR+A0AeWsHCsf2rjG1YaF5gheNCJp/ghJg=;
 b=KG8DVzVskntnGLCD+VJBp+Vdv+Nztmwd7O88DFJbuNtlzCTpeWcstKkq4NlsoSLMeW/5jX
 00ipGbcZC1SEfFv8KQQNDqeADzF6sjLo18gXtRTu4VSXBsESAGgWrHAqlF4ULGlsjZqE/+
 Ux/PpFnN41zs/99eekjo+Z5AA4/Pu8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-Ns03lwVZOEOe-3GG93QpGg-1; Thu, 05 Jun 2025 04:10:35 -0400
X-MC-Unique: Ns03lwVZOEOe-3GG93QpGg-1
X-Mimecast-MFC-AGG-ID: Ns03lwVZOEOe-3GG93QpGg_1749111034
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d2037f1eso3892595e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 01:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749111034; x=1749715834;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/aafh01NTxR+A0AeWsHCsf2rjG1YaF5gheNCJp/ghJg=;
 b=bFKjHLV6hzqRTaHln3AAyt/AUxnovwMC4xgIGsKRdzezfhttlBDk6zR+GRq7meAhNW
 KLsy6MV2G4pujb2pBlD1zd/2aAszbwqgcH+6B9x4N0i1E1j0IeDhXm8AHLcnBPBk119R
 MTSkLx7cToOkqoMJn/+DUiy53obBfwa8g7Gn39lQ9yV3KNeBnV3Fxi7ZkmDv25IUR8wz
 qeUqubR31FIWaCT8G7fn3AXmR75LYq1lLzGmE0EaeelHV7kGHXfA2TTK1N8xlHEuRWFm
 zpmmiCB32gsjonFKSOvMUiw4ROZIGOcvQNs440mOG1zAAYsxAujziZMocGcvBXFufG95
 /FSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXIUPR6x8hie4e8NIXHa1+rYMJG+qpFx3B1tlFOmX74RcOmsqlFZrWqB6F7xy8IdUSAmdYjCwGBAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCL3p4X4G7dGqd83W7NGKHvwD93sI6GkMfIWBwN5N9a52UZ52t
 AoAcCbPKM/e2Xk4iGxdPs8Qu7qtpccl2M9uU1BqY2QABZnWTrSCAEkk2FrNBd5MQDoMKHsmGHJZ
 AqYSKea4Dh6jf2as8CTFLDSQok9EbhK6tUsr3cP9V17smzgQsknuPxurQyXdq0htxhB86ww==
X-Gm-Gg: ASbGncsVAK3Mp++LwLwwvDbrXDMyYwzoXFDPLIl04q55vWzMLShK6NREfCu11Hit3Ev
 49rkeB/w+uOKci5WasqePjCLy+S0HfVv0AS/fGId/o4QAKVZpQNjRMpZyzAhiJNJJj+SMhvmBpN
 Aj9Ar8HArvF2s7Nbhd3Xi03/gXLsS6Vh+Idv/hsp81sxInBXZZiXx4QAFexvPidAaOnbF3qu1eq
 431Yy1G5+rWhfyywBhSqOi9HYiKaswiV6def9LRPvfPdY+zhiuYGTGZx08WJAocx7Vgfl1MLNd7
 TO6e0M2CXQHEQXwTZK0fgaaYztgFv2+ObUF9kJlm2ywOGn/4qUJrRCmTaxkQRx+qCdVuzY1NcAA
 J9nX+X8hIISIwzklOa1pIaPyUtrIKIupzNmAK
X-Received: by 2002:a05:600c:3b2a:b0:43d:97ea:2f4 with SMTP id
 5b1f17b1804b1-451f0a730b0mr58780825e9.12.1749111033965; 
 Thu, 05 Jun 2025 01:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQaYAgZhu0/nJvvDbz/QegVm0m1Rp5DMdQtvjdR9TXdNKm057xHvIDTOC0STgOwPWMrDD66g==
X-Received: by 2002:a05:600c:3b2a:b0:43d:97ea:2f4 with SMTP id
 5b1f17b1804b1-451f0a730b0mr58780185e9.12.1749111033420; 
 Thu, 05 Jun 2025 01:10:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2?
 (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de.
 [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb178895sm10101345e9.14.2025.06.05.01.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 01:10:32 -0700 (PDT)
Message-ID: <ba6fe395-d18d-46fe-8ba5-7b84bbf23c13@redhat.com>
Date: Thu, 5 Jun 2025 10:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
To: Michael Kelley <mhklinux@outlook.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "weh@microsoft.com" <weh@microsoft.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e069436f-764d-464d-98ac-36a086297632@redhat.com>
 <SN6PR02MB4157A3F9E646C060553E5D90D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41574078A6785C3E2E1A6391D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB41574078A6785C3E2E1A6391D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zbGRle4fCuKOcqh7rXk1RXcVlg7YmQlM7gWvi8EdJRc_1749111034
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

On 04.06.25 23:58, Michael Kelley wrote:
> From: Michael Kelley <mhklinux@outlook.com> Sent: Tuesday, June 3, 2025 10:25 AM
>>
>> From: David Hildenbrand <david@redhat.com> Sent: Tuesday, June 3, 2025 12:55 AM
>>>
>>> On 03.06.25 03:49, Michael Kelley wrote:
>>>> From: David Hildenbrand <david@redhat.com> Sent: Monday, June 2, 2025 2:48 AM
>>>>>
> 
> [snip]
> 
>>>>>> @@ -182,20 +221,34 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
>>>>>>     	}
>>>>>>
>>>>>>     	/*
>>>>>> -	 * We want the page to remain locked from ->page_mkwrite until
>>>>>> -	 * the PTE is marked dirty to avoid mapping_wrprotect_range()
>>>>>> -	 * being called before the PTE is updated, which would leave
>>>>>> -	 * the page ignored by defio.
>>>>>> -	 * Do this by locking the page here and informing the caller
>>>>>> -	 * about it with VM_FAULT_LOCKED.
>>>>>> +	 * The PTE must be marked writable before the defio deferred work runs
>>>>>> +	 * again and potentially marks the PTE write-protected. If the order
>>>>>> +	 * should be switched, the PTE would become writable without defio
>>>>>> +	 * tracking the page, leaving the page forever ignored by defio.
>>>>>> +	 *
>>>>>> +	 * For vmalloc() framebuffers, the associated struct page is locked
>>>>>> +	 * before releasing the defio lock. mm will later mark the PTE writaable
>>>>>> +	 * and release the struct page lock. The struct page lock prevents
>>>>>> +	 * the page from being prematurely being marked write-protected.
>>>>>> +	 *
>>>>>> +	 * For FBINFO_KMEMFB framebuffers, mm assumes there is no struct page,
>>>>>> +	 * so the PTE must be marked writable while the defio lock is held.
>>>>>>     	 */
>>>>>> -	lock_page(pageref->page);
>>>>>> +	if (info->flags & FBINFO_KMEMFB) {
>>>>>> +		unsigned long pfn = page_to_pfn(pageref->page);
>>>>>> +
>>>>>> +		ret = vmf_insert_mixed_mkwrite(vmf->vma, vmf->address,
>>>>>> +					       __pfn_to_pfn_t(pfn, PFN_SPECIAL));
>>>>>
>>>>> Will the VMA have VM_PFNMAP or VM_MIXEDMAP set? PFN_SPECIAL is a
>>>>> horrible hack.
>>>>>
>>>>> In another thread, you mention that you use PFN_SPECIAL to bypass the
>>>>> check in vm_mixed_ok(), so VM_MIXEDMAP is likely not set?
>>>>
>>>> The VMA has VM_PFNMAP set, not VM_MIXEDMAP.  It seemed like
>>>> VM_MIXEDMAP is somewhat of a superset of VM_PFNMAP, but maybe that's
>>>> a wrong impression.
>>>
>>> VM_PFNMAP: nothing is refcounted except anon pages
>>>
>>> VM_MIXEDMAP: anything with a "struct page" (pfn_valid()) is refcounted
>>>
>>> pte_special() is a way for GUP-fast to distinguish these refcounted (can
>>> GUP) from non-refcounted (camnnot GUP) pages mapped by PTEs without any
>>> locks or the VMA being available.
>>>
>>> Setting pte_special() in VM_MIXEDMAP on ptes that have a "struct page"
>>> (pfn_valid()) is likely very bogus.
>>
>> OK, good to know.
>>
>>>
>>>> vm_mixed_ok() does a thorough job of validating the
>>>> use of __vm_insert_mixed(), and since what I did was allowed, I thought
>>>> perhaps it was OK. Your feedback has set me straight, and that's what I
>>>> needed. :-)
>>>
>>> What exactly are you trying to achieve? :)
>>>
>>> If it's mapping a page with a "struct page" and *not* refcounting it,
>>> then vmf_insert_pfn() is the current way to achieve that in a VM_PFNMAP
>>> mapping. It will set pte_special() automatically for you.
>>>
>>
>> Yes, that's what I'm using to initially create the special PTE in the
>> .fault callback.
>>
>>>>
>>>> But the whole approach is moot with Alistair Popple's patch set that
>>>> eliminates pfn_t. Is there an existing mm API that will do mkwrite on a
>>>> special PTE in a VM_PFNMAP VMA? I didn't see one, but maybe I missed
>>>> it. If there's not one, I'll take a crack at adding it in the next version of my
>>>> patch set.
>>>
>>> I assume you'd want vmf_insert_pfn_mkwrite(), correct? Probably
>>> vmf_insert_pfn_prot() can be used by adding PAGE_WRITE to pgprot. (maybe
>>> :) )
>>
>> Ok, I'll look at that more closely. The sequence is that the special
>> PTE gets created with vmf_insert_pfn(). Then when the page is first
>> written to, the .pfn_mkwrite callback is invoked by mm. The question
>> is the best way for that callback to mark the existing PTE as writable.
>>
> 
> FWIW, vmf_insert_pfn_prot() won't work. It calls insert_pfn() with
> the "mkwrite" parameter set to 'false', in which case insert_pfn()
> does nothing if the PTE already exists.

Ah, you are worried about the "already exists but is R/O case".

> 
> So I would need to create a new API that does appropriate validation
> for a VM_PFNMAP VMA, and then calls insert_pfn() with the "mkwrite"
> parameter set to 'true'.

IMHO, nothing would speak against vmf_insert_pfn_mkwrite().

Much better than using that "mixed" ... beauty of a function.

-- 
Cheers,

David / dhildenb

