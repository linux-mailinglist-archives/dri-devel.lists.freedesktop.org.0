Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181BFA9FA63
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5697710EA07;
	Mon, 28 Apr 2025 20:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FSXbfkzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0614B10EA07
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745871701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LrYFRIG+5naiBlbX+9CjgCvO3T2uyab9clc4dalicFs=;
 b=FSXbfkzH6m0xCSNVsDcBn2CkI/xxSphd1HUGjsYStiLdMnKMXkKc+cQQeAS31X5kHkut+r
 EhCvxAPZddtr78XAUd1h5dIdGPlVYyGVX84G7/2XZ2iuueucLVM+w0ox96HgpK0Wd4QrOA
 aSU0uEENYfZPHjOQFdE/c1odetxBwgg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-66O0dhRaN0GEeoX538OuNQ-1; Mon, 28 Apr 2025 16:21:39 -0400
X-MC-Unique: 66O0dhRaN0GEeoX538OuNQ-1
X-Mimecast-MFC-AGG-ID: 66O0dhRaN0GEeoX538OuNQ_1745871698
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ce8f82e66so27261215e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745871698; x=1746476498;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LrYFRIG+5naiBlbX+9CjgCvO3T2uyab9clc4dalicFs=;
 b=siW9s28L9S9kK7PUJYVdZ+sd5HM2kfBz1wM7eQ/nGibnjqd7MCPpIf3FUAH9kxiQbm
 EriWbKT4wYlDYcUk0gG3i+48LXr5za006ntGnVf4z+ZRyfjysUk1Q51Bg/IusoBPxb9W
 mBx7NahnSNZudbrA9KfgzOzoEd7utdt0E+JaLjDGRjqLSAdL1NRoZL76mA+yXRGxK7XE
 TlxNb8iDRCqW0LV+S1QgxhAEfrt1Io39lzkWdegY5rZxkafS0tW+U0SEf8i+65sDGeh3
 1A2FwKFmJmarw6dngm016y0zLggohVUK5Oy3ON1tUW/ps3UOfvYaOn0rK1fmoAB6T4bO
 qUBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH5Ij/WJxSLLDrPOunSQxmU7rRXcvhM7HdO4VRkhg8lErB69+3YJEqxh/A+IbdSKfxD964tqY7Po8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpcKy9dCFRSVyclNzPIdpyEF4VL7LUq6AWH1aIP4KDNq8Qbq86
 nUx7GdwDsA59Y1rOVuToKnD7kVlLvqnXFe/6jl1iXDTg1/k2fGub4TWqkAte2V4gHLe34ujsrAv
 1vpvDgh9JvjTAl/51hpXu5eq2P/TXQesM1hBSERC2yOAh9RxZvnT8mYATGv9+wSbnAw==
X-Gm-Gg: ASbGncsSQfrY0qhAi2Ug/R7PvVxo329G1ESDqd/nkpyq5TXyHXDubXLdG4ZvhdLGwh0
 3liwrDr2TaambSf22pbb0CNd/5co6u8cokoK209ivYwb11iI94OlC5OvDf6XJX6Pe5yNVulEc02
 DaQNIKYV1BEURnjWyvFwmiBqgm8gP5YbHzM4tFWs/mCMOhuPQFgSwz/SIbAlazhIiY2Tpl4HyfZ
 RJlp2eSt7WPSf/QlMoxES80l2NRT2yCTHK41jOVgGnEansSf7sZroqHq9thiUY2IG9E1WAH4TH8
 bw8Vfk57D7CYRGPD4zVD7ILDpsw4M7TT9BbYQXtiCgTMDQNRpqjv1ndacXXeXDZYc75wRFeQDg5
 egpruOpgAL1BgiydfzaUU/QFsDJoAogN619ppvEg=
X-Received: by 2002:a05:600c:a06:b0:43d:fa59:cc8f with SMTP id
 5b1f17b1804b1-441ac89558fmr4580785e9.33.1745871698129; 
 Mon, 28 Apr 2025 13:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpSf09RRSheP3E2kXomQow4GricntzgKsoJCPbpu2kgpQbD4Ec+VYPptiAm17v8S7ArcU8Xg==
X-Received: by 2002:a05:600c:a06:b0:43d:fa59:cc8f with SMTP id
 5b1f17b1804b1-441ac89558fmr4580665e9.33.1745871697810; 
 Mon, 28 Apr 2025 13:21:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea?
 (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de.
 [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a536a1e8sm135663205e9.28.2025.04.28.13.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:21:37 -0700 (PDT)
Message-ID: <5a2103cb-08c7-4085-ad88-3d373562047e@redhat.com>
Date: Mon, 28 Apr 2025 22:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Suren Baghdasaryan <surenb@google.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <8131940c-8b22-4856-947b-62ca64e2f417@lucifer.local>
 <CAJuCfpFTgXu+RtbzAis4C0kV=hjFQH39BZrKJsQbjnZRMR2tbw@mail.gmail.com>
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
In-Reply-To: <CAJuCfpFTgXu+RtbzAis4C0kV=hjFQH39BZrKJsQbjnZRMR2tbw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h41_tAbtpnfqrc-lZIlniFlM2V92SpmmI4ad8kg_mbU_1745871698
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

On 28.04.25 22:00, Suren Baghdasaryan wrote:
> On Mon, Apr 28, 2025 at 12:47 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
>>
>> +cc Suren, who has worked HEAVILY on VMA field manipulation and such :)
>>
>> Suren - David is proposing adding a new field. AFAICT this does not add a
>> new cache line so I think we're all good.
>>
>> But FYI!
> 
> Thanks! Yes, there should be some space in the last cacheline after my
> last field reshuffling.

That explains why -- that last time I looked at this -- there was no 
easy space available. Thanks for that!

-- 
Cheers,

David / dhildenb

