Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0976E83F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9B10E5FA;
	Thu,  3 Aug 2023 12:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A70B10E608
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691065979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCy6ACBk2KCNXN+/iDvlXEbsgVPUPclqPGko8x8fDms=;
 b=KKW56C+E0drJl0Is1Xe+ajEqg0r0cBkCRd9CCcTVvdS/B+UdVnLpuPdYYFoiKKNWiFhUTP
 NiXcPmWw70gvJa2GaN2/VUIOirQcKVUFXAf3etuO4V9QwHLokczxzBpmSDWf1x3/MtS8bn
 NWLAxfVcZJsdbUfONMGX0rzpePRwxlI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-g2PNIQbDMPSsDcYl_uBhqA-1; Thu, 03 Aug 2023 08:32:57 -0400
X-MC-Unique: g2PNIQbDMPSsDcYl_uBhqA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe1d5e2982so5941585e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 05:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691065976; x=1691670776;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCy6ACBk2KCNXN+/iDvlXEbsgVPUPclqPGko8x8fDms=;
 b=fzVC93vuGUfMsi63EcxwbJGKnBoRaPCQKV2mSS7lVxRyEzS0Yi83BWA+9J6zMEFveC
 dIpAcag1qK9RDzy93+w/B8k1pM2S9npXIt9wFsspZn0CIS4AevC9uVGah/alMOY86Y5d
 OvbSux3AI5SlvH22xiMiIacCopXYJ+wLoYU/KlVSmr54ISExlU3h+2aozo8ryeBbYHoS
 rtu9cAvJdUE1D/ub73suv0bbZpUZCNNuc//ynswV7mESzghQp6z+tTgV8szk5xWlpE1Z
 DRBrHIhg1Yq5j1lHsZkyfLLtjqQ0Q6wYeQ8fYT4I3ClaoM5nFbpb05ROZ/U0byRpEQoY
 g9Ew==
X-Gm-Message-State: ABy/qLZpBeEHbA1qOS8uJWYpatjVlDpBnXNVPAb0mzhwaAFIhLgHOpdJ
 129SdDixRxffSU3YvB/ZBgiMKT4o8B72OkXgt4BCjKtVPXkwF85GzuAV2rQLidZnlAHClZ4nBYi
 oyUQw4k61yyiQPqccxVVhOU/powtt
X-Received: by 2002:a05:600c:2213:b0:3fe:2813:6130 with SMTP id
 z19-20020a05600c221300b003fe28136130mr7305707wml.22.1691065976699; 
 Thu, 03 Aug 2023 05:32:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFxhdZ+Hook9QUXIMSL0v2ViZvLCsw4Q6coD0i/eEas+TGS7eIHRK9GWXTyHThhfA67P3jRzA==
X-Received: by 2002:a05:600c:2213:b0:3fe:2813:6130 with SMTP id
 z19-20020a05600c221300b003fe28136130mr7305684wml.22.1691065976344; 
 Thu, 03 Aug 2023 05:32:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c718:9a00:a5f5:5315:b9fa:64df?
 (p200300cbc7189a00a5f55315b9fa64df.dip0.t-ipconnect.de.
 [2003:cb:c718:9a00:a5f5:5315:b9fa:64df])
 by smtp.gmail.com with ESMTPSA id
 19-20020a05600c029300b003fe2de3f94fsm4212666wmk.12.2023.08.03.05.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 05:32:55 -0700 (PDT)
Message-ID: <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
Date: Thu, 3 Aug 2023 14:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
To: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZMuaQ4vpv03GTPbF@nvidia.com>
X-Mimecast-Spam-Score: 0
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.08.23 14:14, Jason Gunthorpe wrote:
> On Thu, Aug 03, 2023 at 07:35:51AM +0000, Kasireddy, Vivek wrote:
>> Hi Jason,
>>
>>>>> Right, the "the zero pages are changed into writable pages" in your
>>>>> above comment just might not apply, because there won't be any page
>>>>> replacement (hopefully :) ).
>>>
>>>> If the page replacement does not happen when there are new writes to the
>>>> area where the hole previously existed, then would we still get an
>>> invalidate
>>>> when this happens? Is there any other way to get notified when the zeroed
>>>> page is written to if the invalidate does not get triggered?
>>>
>>> What David is saying is that memfd does not use the zero page
>>> optimization for hole punches. Any access to the memory, including
>>> read-only access through hmm_range_fault() will allocate unique
>>> pages. Since there is no zero page and no zero-page replacement there
>>> is no issue with invalidations.
> 
>> It looks like even with hmm_range_fault(), the invalidate does not get
>> triggered when the hole is refilled with new pages because of writes.
>> This is probably because hmm_range_fault() does not fault in any pages
>> that get invalidated later when writes occur.
> 
> hmm_range_fault() returns the current content of the VMAs, or it
> faults. If it returns pages then it came from one of these two places.
> 
> If your VMA is incoherent with what you are doing then you have bigger
> problems, or maybe you found a bug.
> 
>> The above log messages are seen immediately after the hole is punched. As
>> you can see, hmm_range_fault() returns the pfns of old pages and not zero
>> pages. And, I see the below messages (with patch #2 in this series applied)
>> as the hole is refilled after writes:
> 
> I don't know what you are doing, but it is something wrong or you've
> found a bug in the memfds.


Maybe THP is involved? I recently had to dig that out for an internal 
discussion:

"Currently when truncating shmem file, if the range is partial of THP
(start or end is in the middle of THP), the pages actually will just get
cleared rather than being freed unless the range cover the whole THP.
Even though all the subpages are truncated (randomly or sequentially),
the THP may still be kept in page cache.  This might be fine for some
usecases which prefer preserving THP."

My recollection is that this behavior was never changed.

https://lore.kernel.org/all/1575420174-19171-1-git-send-email-yang.shi@linux.alibaba.com/

-- 
Cheers,

David / dhildenb

