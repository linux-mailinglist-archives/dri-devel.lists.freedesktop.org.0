Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D6A37E99
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 10:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBFF10E0D0;
	Mon, 17 Feb 2025 09:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eh7+/9Gu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B08310E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739784766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Eeb7nv1cNhGbfxr+l0PpfHS4x7aSgl8Mgbc1lpE/bK0=;
 b=eh7+/9Gu+dPqZCr6N+lIS6fCNtVLv6EWSLuTbrbTmcdzFZsF7TusghKLeiAzG9wgPGxYk8
 DyPUCCDfbtEDFAPqbRZBlOuBPH/AlNeol72tmpb5SMDTAHpfClPIi1bBoK9VowOVLDq+Xa
 RCnUbeuRovNMeSWpW8SwGwlod6hzEZ0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-65rkjwqnO3aUNRWKcVrlwg-1; Mon, 17 Feb 2025 04:32:44 -0500
X-MC-Unique: 65rkjwqnO3aUNRWKcVrlwg-1
X-Mimecast-MFC-AGG-ID: 65rkjwqnO3aUNRWKcVrlwg_1739784763
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab77e03f2c0so453579166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 01:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739784763; x=1740389563;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Eeb7nv1cNhGbfxr+l0PpfHS4x7aSgl8Mgbc1lpE/bK0=;
 b=XrCR1jd1q93zU8jyMdjouFLji4dvnFijLrsaVEq6Je/IQFSnbxJv+rOWcTOEJfHxpW
 AjVjda4rGO46We4JyxJcy/HZWdwiqr+yKoRLzXAFyyfp+Y/5KFKd71tJZt1U1H6V0vdo
 LrApKaxZeuK9r6cVwt7UaNYQ6Lmr294zdY7DFzkPihRZ1gUwqgoCc1uyaqNWe5kolsGg
 vdpdmsA6kjGknyIbVZFhLF1lg0cCOKXiVG4XptRMaGsgr5s+zZdrwhsLZ47a/WmwQX1j
 Q4S2Vf9Ch2PRgxtja8DJF2Fb6IZI+mNqDs+BbQ1VOcCUvX98uAFAs2JYGv9hM1ZRUghJ
 Jv0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM8ZoLqdKOTKY369hmde9adVgGgvNEZpL1Kvg/GQhqC1JvLlSOSbqHDpovMkd+XCBM9aJWA3/R7KA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKIuuEWYzHfqtlDRECBNA8iUWcfgzaP0CN8bfxUmX2NzA/jRqH
 IXWcKcHDEkCc2xTyA2kC1KY2Acv+wdpMh9BjefixINu/yv69xifiVk0hNyPCpiY7LRwm6HL1a36
 OrDqMWHnZfSTny0lUPj1KQ0V3BvanzJMOapRT6PA/T4w4X31YO7pb1aQYv6UCh5xUog==
X-Gm-Gg: ASbGncsnX9TFihXHeKjkFPDmY2Kz12i24X4bN0phMEy/I8NJZgb6y4zZw1osX3MDVHW
 kMS0dUcE634Ucr+eCRHYKZYZSHy38FCZWItmK67q1wP9brZcjBWPPPTIA5doc258b3BZ+GqvgLv
 7QdyGV25cfI7SOIya3JwGGJuO4X1l9D+VkP+bq8U2m2BoqNxnHO3RaV0lQ98Ii8uXEgQnP8ZIQs
 kAcmz8xoQJUDSE6P9lx1bZe6Tpb3gXEWfdQq7LvCVM96+0hgHkJIGseksnVQ5pcj1ueNtRez73U
 LonJqaS4GSOuG9xzrmg8yAsJBhP+UlvE4X68DoVPj96vt/46hBumPlp2FkrjhCoMeiXKOf8DAAO
 JEUlYnr8WDNs8Y3UsPIDi4SeYoQyiYg==
X-Received: by 2002:a17:906:31d6:b0:ab7:e943:4c1 with SMTP id
 a640c23a62f3a-abb7091ab36mr780762866b.11.1739784763482; 
 Mon, 17 Feb 2025 01:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3Wgg/IfmYVp/LsQNMw7j+PPvq4aGzaMQEi/BT3iuWyQBhHI1flKgzEnpyKaqJ/zoXhyrMhQ==
X-Received: by 2002:a17:906:31d6:b0:ab7:e943:4c1 with SMTP id
 a640c23a62f3a-abb7091ab36mr780753066b.11.1739784761522; 
 Mon, 17 Feb 2025 01:32:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:900:900f:3c9e:2f7b:5d0a?
 (p200300cbc7390900900f3c9e2f7b5d0a.dip0.t-ipconnect.de.
 [2003:cb:c739:900:900f:3c9e:2f7b:5d0a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376bb3sm864425066b.109.2025.02.17.01.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:32:40 -0800 (PST)
Message-ID: <76a9a0dc-4d2f-430c-a2be-a2371f3108d7@redhat.com>
Date: Mon, 17 Feb 2025 10:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
To: Alistair Popple <apopple@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250210193801.781278-1-david@redhat.com>
 <20250210193801.781278-4-david@redhat.com>
 <20250210210001.5dc68b38eb1bfa44d0fd78f6@linux-foundation.org>
 <48fd75b9-696e-402c-95bd-55f2f0e24dfc@redhat.com>
 <vclmxoorivzhamd4smaaeyamdeangj3aqlbl27muzxuljasdrg@t4jj77rmiozu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <vclmxoorivzhamd4smaaeyamdeangj3aqlbl27muzxuljasdrg@t4jj77rmiozu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rQHB81KluHBlhxMjt1kyWjLyltP9hnJuCnFeQTtxVDg_1739784763
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

On 17.02.25 01:01, Alistair Popple wrote:
> On Tue, Feb 11, 2025 at 09:33:54AM +0100, David Hildenbrand wrote:
>> On 11.02.25 06:00, Andrew Morton wrote:
>>> On Mon, 10 Feb 2025 20:37:45 +0100 David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> The single "real" user in the tree of make_device_exclusive_range() always
>>>> requests making only a single address exclusive. The current implementation
>>>> is hard to fix for properly supporting anonymous THP / large folios and
>>>> for avoiding messing with rmap walks in weird ways.
>>>>
>>>> So let's always process a single address/page and return folio + page to
>>>> minimize page -> folio lookups. This is a preparation for further
>>>> changes.
>>>>
>>>> Reject any non-anonymous or hugetlb folios early, directly after GUP.
>>>>
>>>> While at it, extend the documentation of make_device_exclusive() to
>>>> clarify some things.
>>>
>>> x86_64 allmodconfig:
>>>
>>> drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_atomic_range_fault':
>>> drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: error: 'folio' undeclared (first use in this function)
>>>     612 |                 page = make_device_exclusive(mm, start, drm->dev, &folio);
>>>         |                                                                    ^~~~~
>>> drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: note: each undeclared identifier is reported only once for each function it appears in
>>
>> Ah! Because I was carrying on the same branch SVM fixes [1] that are
>> getting surprisingly little attention so far.
> 
> I believe this has been picked up in drm-misc-fixes now:
> 
> https://lore.kernel.org/dri-devel/Z69eloo_7LM6NneO@cassiopeiae/

Yes. Both trees should merge without conflicts. However, we can later 
get rid of the now-superfluous page_folio() that was required in the drm 
fix.

-- 
Cheers,

David / dhildenb

