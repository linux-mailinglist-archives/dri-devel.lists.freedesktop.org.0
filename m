Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866BA802DC6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296DB10E2E1;
	Mon,  4 Dec 2023 09:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA310E2EE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701680752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=54yj0/Ej7pqackj9Q5yMm8Vqxd8rRbXrGNCkl/ms7ok=;
 b=MFYNBgMnUvr61ujnbuufgpPyaZ/7K6pWxT9XGBWNsDKo6ZE7j56NQptC0a/ytNixg7skbK
 DjArtWfm90D6muytxIMIodFRgIx/pi5KX0YYPCO+T6mOnTPqEiTX8rJWAsc1cFbOjh2PET
 ddto3W1O1emvNB1sRyVnnVFe0Eok678=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-bcaB68ZvOvCjH34YY4caKw-1; Mon, 04 Dec 2023 04:05:50 -0500
X-MC-Unique: bcaB68ZvOvCjH34YY4caKw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33340d20b90so1149566f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 01:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701680749; x=1702285549;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54yj0/Ej7pqackj9Q5yMm8Vqxd8rRbXrGNCkl/ms7ok=;
 b=GjVCxD3m/JVeLN4N9+EfEyeUdao5knxBYR4Odmz1cr2x45Df8oSAh5ldP4Eq9+luKy
 D690cLpY6ZCSRjcgLdlQfbCg9pCocNnfNbPKLabpvZy8998VK7G7xltM50xpawefcy6E
 f0OH1Lu6IYsu+rYmpXGfH70UF2vk0ppLHzp8BvHNhtvWrZE/vySIa7tWAIOqLC2GKoE6
 r1STScLGSuNaKquFyTYlx/wO721s2PYC65edsayRbCvLn9T3VfO/z00E+9Qom1zR96TQ
 oQqrDvUQKc35KFFb1hfqfhnA+Y27FcppttXq8yzIUmrkW1SSRBORebRjG354W6/HzQ2F
 p3EA==
X-Gm-Message-State: AOJu0YxGj0UR8MfmsIkUN8TH6H7RCFj7EyytL12RGpJf81fd5nJtdIlW
 e6twdjVjvGojjPKNItqe4ZokJmknfzVGNEKiAF75ag0Fu8yjTnOGRXEWCc2XVpvJEwbAi7ah2c6
 Rh7Dz6aDr300XewMhqBrcbUvDeA1w
X-Received: by 2002:a5d:6648:0:b0:333:2fd2:51f5 with SMTP id
 f8-20020a5d6648000000b003332fd251f5mr3372462wrw.110.1701680749443; 
 Mon, 04 Dec 2023 01:05:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqEx0v/CwBWVoaKyxmmKjNkGZ8fWec1MHBaeDTfzCZaNupLsUv6SxtQte2jJM/O3ZCG+h6xQ==
X-Received: by 2002:a5d:6648:0:b0:333:2fd2:51f5 with SMTP id
 f8-20020a5d6648000000b003332fd251f5mr3372452wrw.110.1701680749030; 
 Mon, 04 Dec 2023 01:05:49 -0800 (PST)
Received: from ?IPV6:2003:cb:c722:3700:6501:8925:6f9:fcdc?
 (p200300cbc72237006501892506f9fcdc.dip0.t-ipconnect.de.
 [2003:cb:c722:3700:6501:8925:6f9:fcdc])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4a4f000000b0033328f47c83sm10296440wrs.2.2023.12.04.01.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 01:05:48 -0800 (PST)
Message-ID: <a4861ace-3cc3-435a-8d8d-1e902fc9d2d0@redhat.com>
Date: Mon, 4 Dec 2023 10:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v5)
To: Christoph Hellwig <hch@infradead.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
 <20231123064443.1035709-4-vivek.kasireddy@intel.com>
 <ZWWvD4B4hurV62gH@infradead.org>
 <IA0PR11MB71857980C94225951F6DD3AAF882A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZW2KzbRKEWZ7ZTGn@infradead.org>
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
In-Reply-To: <ZW2KzbRKEWZ7ZTGn@infradead.org>
X-Mimecast-Spam-Score: 0
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.12.23 09:16, Christoph Hellwig wrote:
> On Thu, Nov 30, 2023 at 06:41:11AM +0000, Kasireddy, Vivek wrote:
>> I see your concern. The word "file" does make it look like this API works
>> with all kinds of files although it is meant to specifically work with
>> files that
>> belong to shmemfs or hugetlbfs. Since it is intended to work with memfds
>> in particular, I'll rename this helper alloc_memfd_page(). I think it also
>> makes sense to do s/file/memfd in this whole patch. Does this sound ok?
> 
> That sounds much better, yes.  And please also rename the new api
> to memfd_pin_user_pages。
> 
>>
>>> asserts that this is true).  gup.c also seems like a very odd place
>>> for such a helper.
>> I only created this helper to cleanly separate lookup and creation and to
>> reduce the level of indentation in pin_user_pages_fd(). Anyway, would
>> mm/memfd.c be a more appropriate location?
> 
> I think so, but I'll defer to the MM maintainers.
> 
>> As mentioned above, this API is mainly intended for memfds and FWICS,
>> memfds are backed by files from either shmemfs or hugetlbfs.
> 
> Ok.  Witht better naming this should be more obvious.
> 
> 

All sounds reasonable to me!

-- 
Cheers,

David / dhildenb

