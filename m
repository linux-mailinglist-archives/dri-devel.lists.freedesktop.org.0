Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2775B4265F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ABB10E8EC;
	Wed,  3 Sep 2025 16:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gvREGodj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56910E8EC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756916073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bzt9EmHzCNTi5JpIlfAxwaC9x9EuNT1d//8tcvBDG2w=;
 b=gvREGodjWCIGqvpuywuuCP1Ap7244165dZzi1nskpW6h/sRtGtRoL9889izb7V8wjtUomA
 VfFuQDE1Xx9cnEi4xdBhAUygjF5Gk+wpOiky/l+96iS34ILpJ3QmOT8di6J6S3BKARsU0n
 v+tzVSFT4zsaZLGqIyI6ukWB1UPRhp0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-mS2sHz_jOU6dyesyNvWmRQ-1; Wed, 03 Sep 2025 12:14:26 -0400
X-MC-Unique: mS2sHz_jOU6dyesyNvWmRQ-1
X-Mimecast-MFC-AGG-ID: mS2sHz_jOU6dyesyNvWmRQ_1756916066
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b9ca27a11so5561395e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916065; x=1757520865;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bzt9EmHzCNTi5JpIlfAxwaC9x9EuNT1d//8tcvBDG2w=;
 b=vyi/KNarOenARS/Xd4EX1zpGkwnBUWiIVIoaJ6rtTGHQPOsmwE4gbnlUX/o1WJNg4q
 4yDoO1GpktBv5yeMmg6HEHJOHMhxMsWcBvQYKkJdzB+wz5lW2hCB1MStgmUR3WIGpi56
 Xp74suxnsI3E/N5lPBOtFENRYjc+QC8Q0mmalmwWK3t+WHtz/ERZqQjRw5eTa9aVWX9i
 z1l5QEhubbvnUuJuab9Df+qPQTCkj0Sjc7t0UDkEdjRAYXAgsJYK7LH3R0mJMyXeDU+3
 gvBYH8DC4al9ObHBnlJdxeiVga7fRUQl8UAD+a1xVnTK41FPOlGf6sTuD7j0zCi0nkh0
 HQNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+5UScKlnE3F4lbKRThPjZT3q3tPthp6ECHfFwIkTNFkICW1AHeFEOqActUJp7o3qe922Xj+wOQQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEWbCSDMisEs7J9u1mV6oFz3hQ//i0kfyNKJ2m8LR6o97i8ug2
 4WA/EpqzWH1uO01DlXtvqc65GAMlNict2lur2zS37H5MjqWBjvsUbQWlJ8CcO+zoJMOPJGyQMiV
 YmFDN5vVJKm+eq/X6ASGpVhs4LJo0zocRj8PL1qYDjPQU3G9wHHvmZWPBaAq35vu9Wej06Q==
X-Gm-Gg: ASbGncuctVDSjo6pgF5VfunfZ+7lUcjwBtaFFmV/rrGJlLxITQzgE7wgEmgJ935C81d
 3pKcnVqDhTFrTJhmEWtsr8in9INW9nAayMa9TcL7G6YUChniTjqhgvpN4upt5jXJ04fOqXIyCLJ
 42FQTWWSYPbqykQvsxiT3RaL0DDEzIgrzMIbrHJZi8fa4tJKPi5/UFAVNkMUcrII3EgTSInf+Fl
 mH3zE8t5TSIx1m/wevh5IiWoKogKo83uGyN4SVn34OUpNK9aFSpL1DNiS2vJanMRtM5Tt0pvXcu
 0kI8wJs+3qKRlKdNI6EkU2vEv3wEtOqFzBQPgrw7OU/gbC5uIH0UObW76L7Otv/3kgsa9EvB5Aq
 qYTl2Rk1JA9XYXutJqBhxlJmMdTVMp6ctGhvlK4q4ZRh1JlvAvumd3z594CjBxHSNMUQ=
X-Received: by 2002:a05:600c:c4a1:b0:459:443e:b18a with SMTP id
 5b1f17b1804b1-45b8559aff8mr148123285e9.14.1756916065568; 
 Wed, 03 Sep 2025 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrG1gLsbYnBIn3I8NtcnWq9Wo53kgjPvmlGfN/iDdEiLF/Lvowr8NqtI002hGo3+RIVMQJCw==
X-Received: by 2002:a05:600c:c4a1:b0:459:443e:b18a with SMTP id
 5b1f17b1804b1-45b8559aff8mr148122835e9.14.1756916065025; 
 Wed, 03 Sep 2025 09:14:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f09:9c00:8173:2a94:640d:dd31?
 (p200300d82f099c0081732a94640ddd31.dip0.t-ipconnect.de.
 [2003:d8:2f09:9c00:8173:2a94:640d:dd31])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9a6ecfafsm79703055e9.21.2025.09.03.09.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 09:14:24 -0700 (PDT)
Message-ID: <78b9c23d-98ce-4b06-9acf-d36c58777d56@redhat.com>
Date: Wed, 3 Sep 2025 18:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Frank van der Linden <fvdl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
 <e513c127-d4f4-4e93-8d4b-23d1e4fdceb5@redhat.com>
 <g34tb2ontlnazift3sik5dqs75a7k2bhzo74kknkxoegv4q5vb@jsqo7v6awovf>
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
In-Reply-To: <g34tb2ontlnazift3sik5dqs75a7k2bhzo74kknkxoegv4q5vb@jsqo7v6awovf>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MysQGFxI9JZ8q-H_XeDgsMaVK5avedpGrSEt-yOm2X4_1756916066
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

On 03.09.25 18:12, Thierry Reding wrote:
> On Tue, Sep 02, 2025 at 09:04:24PM +0200, David Hildenbrand wrote:
>>
>>>> +>> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
>>>> +                             unsigned int order_per_bit, const char *name)
>>>> +{
>>>> +       struct cma *cma;
>>>> +       int ret;
>>>> +
>>>> +       ret = cma_check_memory(base, size);
>>>> +       if (ret < 0)
>>>> +               return ERR_PTR(ret);
>>>> +
>>>> +       cma = kzalloc(sizeof(*cma), GFP_KERNEL);
>>>> +       if (!cma)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       cma_init_area(cma, name, size, order_per_bit);
>>>> +       cma->ranges[0].base_pfn = PFN_DOWN(base);
>>>> +       cma->ranges[0].early_pfn = PFN_DOWN(base);
>>>> +       cma->ranges[0].count = cma->count;
>>>> +       cma->nranges = 1;
>>>> +
>>>> +       cma_activate_area(cma);
>>>> +
>>>> +       return cma;
>>>> +}
>>>> +
>>>> +void cma_free(struct cma *cma)
>>>> +{
>>>> +       kfree(cma);
>>>> +}
>>>> --
>>>> 2.50.0
>>>
>>>
>>> I agree that supporting dynamic CMA areas would be good. However, by
>>> doing it like this, these CMA areas are invisible to the rest of the
>>> system. E.g. cma_for_each_area() does not know about them. It seems a
>>> bit inconsistent that there will now be some areas that are globally
>>> known, and some that are not.
>>
>> Yeah, I'm not a fan of that.
>>
>> What is the big problem we are trying to solve here? Why do they have to be
>> dynamic, why do they even have to support freeing?
> 
> Freeing isn't necessarily something that I've needed. It just seemed
> like there wasn't really a good reason not to support it. The current
> implementation here is not sufficient, though, because we'd need to
> properly undo everything that cma_activate_area() does. I think the
> cleanup: block in cma_activate_area() is probably sufficient.
> 
> The problem that I'm trying to solve is that currently, depending on the
> use-case the kernel configuration needs to be changed and the kernel
> rebuilt in order to support it. However there doesn't seem to be a good
> technical reason for that limitation. The only reason it is this way
> seems to be that, well, it's always been this way.

Right, and we can just dynamically grow the array, keep them in a list etc.

-- 
Cheers

David / dhildenb

