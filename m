Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B6B11B2C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 11:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295A10E164;
	Fri, 25 Jul 2025 09:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FEQhG75o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A6A10E164
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753437121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MTWdy+1SlxCZIWCULVABxeLHJl6jZUNfpstFC/dkyck=;
 b=FEQhG75o3c1nZ4Mb6cJXgTyi5U2PnLNGL3L0gw+9uyj+Z8qzSVhgr6492Mhn4acO5S4jHm
 4oVRclPYHYpZO1dfEPto/+VmvUIwL5v3NU1uc6a3CTuMIXW2jzyBdHWNYJue/jVNtcy2yu
 tGhRH1xwzC2h4/mtWYVvyfLUpeUmRfo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-djZXPZkQPkK475oURmObDg-1; Fri, 25 Jul 2025 05:51:59 -0400
X-MC-Unique: djZXPZkQPkK475oURmObDg-1
X-Mimecast-MFC-AGG-ID: djZXPZkQPkK475oURmObDg_1753437117
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45359bfe631so10572495e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753437117; x=1754041917;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MTWdy+1SlxCZIWCULVABxeLHJl6jZUNfpstFC/dkyck=;
 b=pngxHmjX8YFz0ouP+vMWWXJCTAQI0BVwQLvG48Hfi0jjNplCXFjjvPGr8SoCQprmcv
 ou/3LijabJ7zwesfmCCxFl8bSV+A8iZnvCXC8Jlvpf2/3Jcq0RPSPCu++uyacwT9bl6v
 z8kjUFegE1lEtAHJYpeGgAKu5APrxQgiwOh6CnnDRjnj+ByLhQKDbAZQcE/Q8rfItZPR
 pGqUGRWcjnlwSqQeR5AEEfvx1o4q7C+mHUC4RPRrOltShEoAkRuD8MDC7td9F2Xd1xOt
 kiUWHU4kz6KisGpIOneZtDE0jylmf27xT1rbl9hsqlLTX25kRdr3zM9/IPBrDOXWAYdt
 IVtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOy3cdpBd5Bhi4sVoiGzpieeGYlllIDFWXOPTgPpfi/M5XDh2XVF29vkMTucp+TMFDMTx5QMFiASM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWZkZJbyapKAVMzMBKnVUUYjaUSyU0BhSvNveFEHwRpGpE+fkD
 CX+ReCkvRPGJ6b2HqoeRrcP7TUZ0GnPASUx/IBaMqQ1ASXwQYwWmv38IXw47sE29ZGI7nXIuBK2
 8k7pP+sHoElR0XiB0Knsy73YBdQ62ov8CeoWSrqG1PebOeBKqgISlbDXMcw/NC05oKNIm3w==
X-Gm-Gg: ASbGncucB6oDgIqTA6l3cFlpgnEhmyPOQB1PI+kfzev3oJ5VeuWifQpMwDYxatJrNa/
 wacZIqJZAbB3WP3bgWO9C1+mEp2R8+fjCfEmF/o7jDEf9g7mbniCwGRm22nfj+1NOcQsdKr1uxx
 GhjldXSx1aj0wXe1hEoSWO+psTpvTSbUwSUleu1yqietUOsk38R9oO3U6NxCG8OI8ATbiRIopS4
 s/5BOpzrFJFdhauKlxyaR60HR5FYpZW6c1QAMF/ethQmAyRSPHZPiHXkm/j2WR9WAl/nkgAFzl9
 yE2vGEu8xNIfRRjP4N9Vkp5rvGf6SyoPcw42XAuBcDyawVdPB6/lv2nvwgVVdwv6opmua9a5gVj
 aAJ9jONYp28yItcUoB4HqrJ5ZiAgVoNEPZ5M+enkLXva+POVHHWNWNHeeSa501nXt0wA=
X-Received: by 2002:a05:6000:420c:b0:3a6:d296:feaf with SMTP id
 ffacd0b85a97d-3b776737031mr1174837f8f.24.1753437117248; 
 Fri, 25 Jul 2025 02:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Ju9qbPhWwNNwVGPWubTU0EaExWPb4CE4F4jST4yWvzRfvTD7NkOT+SB5u1CFnRPEUIy3bw==
X-Received: by 2002:a05:6000:420c:b0:3a6:d296:feaf with SMTP id
 ffacd0b85a97d-3b776737031mr1174815f8f.24.1753437116691; 
 Fri, 25 Jul 2025 02:51:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f400:5a9f:b1bf:4bb3:99b1?
 (p200300d82f1af4005a9fb1bf4bb399b1.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f400:5a9f:b1bf:4bb3:99b1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b7785d5e31sm207596f8f.6.2025.07.25.02.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 02:51:56 -0700 (PDT)
Message-ID: <e64ee7c6-5113-4180-94e8-2fd7e711d5e2@redhat.com>
Date: Fri, 25 Jul 2025 11:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
To: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>,
 Yonatan Maman <ymaman@nvidia.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org> <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7F7gXRwBzpBBExFeL42pj49MVg-4yGUbrIgBgkJKH9Q_1753437117
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

On 25.07.25 02:31, Alistair Popple wrote:
> On Thu, Jul 24, 2025 at 10:52:54AM +0200, David Hildenbrand wrote:
>> On 23.07.25 06:10, Alistair Popple wrote:
>>> On Wed, Jul 23, 2025 at 12:51:42AM -0300, Jason Gunthorpe wrote:
>>>> On Tue, Jul 22, 2025 at 10:49:10AM +1000, Alistair Popple wrote:
>>>>>> So what is it?
>>>>>
>>>>> IMHO a hack, because obviously we shouldn't require real physical addresses for
>>>>> something the CPU can't actually address anyway and this causes real
>>>>> problems
>>>>
>>>> IMHO what DEVICE PRIVATE really boils down to is a way to have swap
>>>> entries that point to some kind of opaque driver managed memory.
>>>>
>>>> We have alot of assumptions all over about pfn/phys to page
>>>> relationships so anything that has a struct page also has to come with
>>>> a fake PFN today..
>>>
>>> Hmm ... maybe. To get that PFN though we have to come from either a special
>>> swap entry which we already have special cases for, or a struct page (which is
>>> a device private page) which we mostly have to handle specially anyway. I'm not
>>> sure there's too many places that can sensibly handle a fake PFN without somehow
>>> already knowing it is device-private PFN.
>>>
>>>>> (eg. it doesn't actually work on anything other than x86_64). There's no reason
>>>>> the "PFN" we store in device-private entries couldn't instead just be an index
>>>>> into some data structure holding pointers to the struct pages. So instead of
>>>>> using pfn_to_page()/page_to_pfn() we would use device_private_index_to_page()
>>>>> and page_to_device_private_index().
>>>>
>>>> It could work, but any of the pfn conversions would have to be tracked
>>>> down.. Could be troublesome.
>>>
>>> I looked at this a while back and I'm reasonably optimistic that this is doable
>>> because we already have to treat these specially everywhere anyway.
>> How would that look like?
>>
>> E.g., we have code like
>>
>> if (is_device_private_entry(entry)) {
>> 	page = pfn_swap_entry_to_page(entry);
>> 	folio = page_folio(page);
>>
>> 	...
>> 	folio_get(folio);
>> 	...
>> }
>>
>> We could easily stop allowing pfn_swap_entry_to_page(), turning these into
>> non-pfn swap entries.
>>
>> Would it then be something like
>>
>> if (is_device_private_entry(entry)) {
>> 	page = device_private_entry_to_page(entry);
>> 	
>> 	...
>> }
>>
>> Whereby device_private_entry_to_page() obtains the "struct page" not via the
>> PFN but some other magical (index) value?
> 
> Exactly. The observation being that when you convert a PTE from a swap entry
> to a page we already know it is a device private entry, so can go look up the
> struct page with special magic (eg. an index into some other array or data
> structure).
> 
> And if you have a struct page you already know it's a device private page so if
> you need to create the swap entry you can look up the magic index using some
> alternate function.
> 
> The only issue would be if there were generic code paths that somehow have a
> raw pfn obtained from neither a page-table walk or struct page. My assumption
> (yet to be proven/tested) is that these paths don't exist.

I guess memory compaction and friends don't apply to ZONE_DEVICE, and 
even memory_failure() handling goes a separate path.

-- 
Cheers,

David / dhildenb

