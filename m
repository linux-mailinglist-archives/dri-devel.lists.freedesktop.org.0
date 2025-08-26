Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3485B35888
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09E810E613;
	Tue, 26 Aug 2025 09:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SCOZDbWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86DD10E281
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756199831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zwLG8TC2DRqYuer8IhxBaiMazzrcoUe2P5hs7V1jY0M=;
 b=SCOZDbWFx27nOgjAV1A4KGb00VhOXhel22otlw9x8RaaN2fn/7DQDtmpXlhBeoyOnH77rd
 0X/I9mG7pleEUGAD0rs6kvJXre7lCpwvRbaM4X09X22cM/Q8cKLPHV2C3tzRcIHLfw0e/0
 5H8dO/cMuPSoabHpXIyTY1r0MTr/Zmk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-HubJ7i3uNB-rIu14iVmycQ-1; Tue, 26 Aug 2025 05:17:09 -0400
X-MC-Unique: HubJ7i3uNB-rIu14iVmycQ-1
X-Mimecast-MFC-AGG-ID: HubJ7i3uNB-rIu14iVmycQ_1756199828
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0098c0so37397835e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756199828; x=1756804628;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwLG8TC2DRqYuer8IhxBaiMazzrcoUe2P5hs7V1jY0M=;
 b=IHMAlhagqbhB7Y02xCr3TxqFO6fICi0vdQbxCPEp9fKM54Hscf6YZ2/Iv+tqalqacQ
 7UfIzmDW/WmiAUACyhJumDBbzlShy8eojSvC1+zP5/TFyvq2bxlLHlCGgSpHE8QcGw2T
 LXroBHtwz4lno0TSVdHgI35hij+Y1SBE5az0HSn30wiSup3EG5zNXq8d/7FEwhvlYRsE
 FqiNnDh4Uq4zrJYZKsWfS3tFHNy8Em6P5HGfg5xANVbuxur4gwZXcf87XAvhcEEc+2ts
 RIswYEv4WVZnhojnDjJkwxVrkPBBal7GpYVUrs6L3npyD1dk/G2HeN4/L8zATd1TqVQa
 Kqsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCoX5NTAJIeJa5MhkL96uk+fmHRMTI+h10NpeaTV+v38ud2NSRQEH9+7XN6QcoB6Cd8Fp0LVsubDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGRMlcXzX5YrznvneVSY10E4q2HOjZMPLqmzzppj0n83+z6eeB
 A8a5h3LniphsIJa5q/wPhHPVEFmqaQ4TlJbLy8sFHIhsLb4fSeeB2betkpTYxF3wpF8c4vm+b9/
 WdbebNb2/E0d2zBBn0vwSacffoBGtvT1pcEUD3rT8FVv5kVKCWie7rVjQg2ZcbbXvZ3+/eQ==
X-Gm-Gg: ASbGnctxGqUpzJB9qo3yhFRdGWpjT7C/vmJePkpXsULdcupFHvBYiZqzYG9oTSuYYuM
 YuU8Xuo5e3qX7lpArQufKfLojjo/sQnzwksdr4HGkYVlzKjqPxLnuwPJL97y+CQVgtjHTy8813W
 8n9xf9b7fa4D6KuQVLadg7Mv2QqCs9S7ZBDgzEiLHXveDQXhIZUyaj7DQ4zJN0llRGYnq9f/Fgi
 gwFCgtN8IGn40NhGpDPXA5XMadgQNBRGtqCm/vIMqcX9L9bt6oHyziunWOJz1Pr/qIrzVv+gyIY
 R5zXo9CfHflZf86KZ/YYnAXdX5X0JZI/McwrB562pGGW2vMQqi3VRM+b+luXpXPSu+WhmK/M7w=
 =
X-Received: by 2002:a05:6000:18a2:b0:3c8:dc75:e9ea with SMTP id
 ffacd0b85a97d-3c8dc75eddbmr4761284f8f.28.1756199828241; 
 Tue, 26 Aug 2025 02:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+MyBSfXuhBHgtjTf8j/yDEGP6bQtFzkEyIMLeJsu+pMxh6G3ReZyVuhqCWzlEPKRzHWfERQ==
X-Received: by 2002:a05:6000:18a2:b0:3c8:dc75:e9ea with SMTP id
 ffacd0b85a97d-3c8dc75eddbmr4761246f8f.28.1756199827698; 
 Tue, 26 Aug 2025 02:17:07 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e98d41bsm15714711f8f.16.2025.08.26.02.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 02:17:07 -0700 (PDT)
Message-ID: <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
Date: Tue, 26 Aug 2025 11:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
 <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
 <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -qcdSLMgYxYl8Qt40oyoOUXIb0AhGHigsjS0lkZTFEg_1756199828
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

On 26.08.25 11:00, Christian König wrote:
> On 26.08.25 10:46, David Hildenbrand wrote:
>>>> So my assumption would be that that is missing for the drivers here?
>>>
>>> Well yes and no.
>>>
>>> See the PAT is optimized for applying specific caching attributes to ranges [A..B] (e.g. it uses an R/B tree). But what drivers do here is that they have single pages (usually for get_free_page or similar) and want to apply a certain caching attribute to it.
>>>
>>> So what would happen is that we completely clutter the R/B tree used by the PAT with thousands if not millions of entries.
>>>
>>
>> Hm, above you're saying that there is no direct map, but now you are saying that the pages were obtained through get_free_page()?
> 
> The problem only happens with highmem pages on 32bit kernels. Those pages are not in the linear mapping.

Right, in the common case there is a direct map.

> 
>> I agree that what you describe here sounds suboptimal. But if the pages where obtained from the buddy, there surely is a direct map -- unless we explicitly remove it :(
>>
>> If we're talking about individual pages without a directmap, I would wonder if they are actually part of a bigger memory region that can just be reserved in one go (similar to how remap_pfn_range()) would handle it.
>>
>> Can you briefly describe how your use case obtains these PFNs, and how scattered tehy + their caching attributes might be?
> 
> What drivers do is to call get_free_page() or alloc_pages_node() with the GFP_HIGHUSER flag set.
> 
> For non highmem pages drivers then calls set_pages_wc/uc() which changes the caching of the linear mapping, but for highmem pages there is no linear mapping so set_pages_wc() or set_pages_uc() doesn't work and drivers avoid calling it.
> 
> Those are basically just random system memory pages. So they are potentially scattered over the whole memory address space.

Thanks, that's valuable information.

So essentially these drivers maintain their own consistency and PAT is 
not aware of that.

And the real problem is ordinary system RAM.

There are various ways forward.

1) We use another interface that consumes pages instead of PFNs, like a
    vm_insert_pages_pgprot() we would be adding.

    Is there any strong requirement for inserting non-refcounted PFNs?

2) We add another interface that consumes PFNs, but explicitly states
    that it is only for ordinary system RAM, and that the user is
    required for updating the direct map.

    We could sanity-check the direct map in debug kernels.

3) We teach PAT code in pfnmap_setup_cachemode_pfn() about treating this
    system RAM differently.


There is also the option for a mixture between 1 and 2, where we get 
pages, but we map them non-refcounted in a VM_PFNMAP.

In general, having pages makes it easier to assert that they are likely 
ordinary system ram pages, and that the interface is not getting abused 
for something else.

We could also perform the set_pages_wc/uc() from inside that function, 
but maybe it depends on the use case whether we want to do that whenever 
we map them into a process?

-- 
Cheers

David / dhildenb

