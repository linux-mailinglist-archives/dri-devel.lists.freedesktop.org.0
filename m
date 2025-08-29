Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8BB3C35E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 21:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A6410E21A;
	Fri, 29 Aug 2025 19:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="egx3H2Kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C711510E179
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Qdef9Piv775GEt9ecqC3DBhio0JyExkR0P3CDUdZaXQ=;
 b=egx3H2KlGUPl1Hq2ByW7m5puFXcr/AOC46KvhbR3pEyAlxlPhUKUNx75N471x5yVt7m/gI
 1qN7jQ3RgMHBEhXQaxTt6DWvkQZBFMRgcgjiY+T8GhfuX/Ab5c9IFs4zbGBLpLW72J3Oc0
 9rErSThFdoeczzILWgwHhoxG3jTCeJ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-F5CIvDyKOk-k5j91WeCMLQ-1; Fri, 29 Aug 2025 15:52:04 -0400
X-MC-Unique: F5CIvDyKOk-k5j91WeCMLQ-1
X-Mimecast-MFC-AGG-ID: F5CIvDyKOk-k5j91WeCMLQ_1756497123
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3cf48ec9e40so657237f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 12:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497123; x=1757101923;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qdef9Piv775GEt9ecqC3DBhio0JyExkR0P3CDUdZaXQ=;
 b=W6Xv9jdyTSyhKVLa/tzJEsASjbPfGU3HzH78Xi/Ke8K9KhFO8sIKq8vjb1V4F/s7fx
 txTozUfrEQmeA6TeQ1L6v3nIXZxUNbsi5tSznv9WYFifD2abpEj80AUCOgjTAznrXza+
 X6Y9uQDY5XDTzbw9UBnxQnQd94jMW/BvYaWxvfgKhjGdFFOEvqWjUMrvSc03ov+K9PQ6
 VODfvLfVnv+V6rWur/sNN5PvXD6NiInwsyXJiHfX5U5jaDGVy1CCR/H8NWCKFBu39xL1
 pbSyojJFje/abPgbUHrFSq8JKGctHQhGOe2H4M7rVmFBYhEFVlALRikWYFNZTg4r7jmS
 SQHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Nor0KNFO9zUbMSZYTMlb9f2k+YcpRCl0e0Zkz2uHNeNcIToMnckwPSlNtZUi8GeT+WC+VLyqRHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ/hLWVwaXn8H4A7tTK5m8K9nU5X1ug3ZLnrczUcCaRDxLIIFg
 LnFNCsSYGboNXp3kHJzGlCwHhT5sQX2T58hOdi4/+tt56fwOZjCCh6bx3855ymUnzY1gswgBjsZ
 me31GyDfXQU67qpKFB59z8KZz2XHpTKl1KD9Vs7kJH7Ku82/JF5Pg44U4XAz344G/4SrusA==
X-Gm-Gg: ASbGncuWbpq/2RIoFU86LHHbVaGW0/eEqjY0A7v/LnN8nFymaQw9lpzKSeYtlqDb1RH
 QsMtsHYClDCZ7EtD5los4MgUQemTU4uxvqXlI0cLGeRrlYuWNG/l9phQHJ3XnOS6dwxratl9alG
 M+F0TguTXfwpecsZg+VlInWFGbIM8EZaNmXupbT4cIR9ApVzsJLJVY3K3+oCew5Mpo0NFTRVeDM
 +y6StmByHPLyK7ERDFf+aedtOFfZm6O/1pWxhjw8uyv7SkS4V77kLP6PWMKNgXTIIFNV82C3l/O
 zmqAy0Joe9JGDlaDpdHBc992+dqnOJThy8RlEiU+4L4rNp34Akk1U0W+l64JkKkkVmtpkNmvxLO
 J56MMqSXoMmQYICaWbYs2znp8i/bdOwekT7MKk7/PfCsy/on4Veba1bUJ/tS2Xwt0
X-Received: by 2002:a05:6000:1acf:b0:3c8:c89d:6b5b with SMTP id
 ffacd0b85a97d-3c8c89d6f7dmr15934167f8f.48.1756497122826; 
 Fri, 29 Aug 2025 12:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFEdnfetEA0BUizp3/CuPF56sLxPoeCqh2ZRwgbpaot2nz3v6EntxAXtiXE/xXI9ZBdLsGFA==
X-Received: by 2002:a05:6000:1acf:b0:3c8:c89d:6b5b with SMTP id
 ffacd0b85a97d-3c8c89d6f7dmr15934152f8f.48.1756497122351; 
 Fri, 29 Aug 2025 12:52:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854?
 (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de.
 [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276ccc13sm4411990f8f.22.2025.08.29.12.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 12:52:01 -0700 (PDT)
Message-ID: <4ef6e251-37c2-47ac-bff7-3b2a7d7e58d6@redhat.com>
Date: Fri, 29 Aug 2025 21:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stupid and complicated PAT :)
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
 <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
 <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
 <d32fa753-66a1-451a-8cef-95c1f78fc366@redhat.com>
 <87050572-811e-4b0c-9ebd-8ebb05f3c617@amd.com>
 <e717c8b8-51f1-4332-b5fd-ade55aaba1b0@redhat.com>
 <3a91d9df-1536-490b-bbc6-268a3a32ac1c@redhat.com>
 <00aaca69-2549-48b4-bd3c-fcebe2589df0@redhat.com>
 <094606f3-a138-4561-a0b7-d952f4896939@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <094606f3-a138-4561-a0b7-d952f4896939@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyQlD1cd6SsliY2FJ_w3E0ffjYrjsay2NKy8GrDIQj8_1756497123
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


> 
> Yes, that can absolutely happen. But for iomem we would have an explicit call to ioremap(), ioremap_wc(), ioremap_cache() for that before anybody would map anything into userspace page tables.
> 
> But thinking more about it I just had an OMFG moment! Is it possible that the PAT currently already has a problem with that?
> 
> We had customer projects where BARs of different PCIe devices ended up on different physical addresses after a hot remove/re-add.
> 
> Is it possible that the PAT keeps enforcing certain caching attributes for a physical address? E.g. for example because a driver doesn't clean up properly on hot remove?
> 
> If yes than that would explain a massive number of problems we had with hot add/remove.

The code is a mess, so if a driver messed up, likely everything is possible.

TBH, the more I look at this all, the more WTF moments I am having.

> 
>>> What I am currently wondering is: assume we get a
>>> pfnmap_setup_cachemode_pfn() call and we could reliably identify whether
>>> there was a previous registration, then we could do
>>>
>>> (a) No previous registration: don't modify pgprot. Hopefully the driver
>>>        knows what it is doing. Maybe we can add sanity checks that the
>>>        direct map was already updated etc.
>>> (b) A previous registration: modify pgprot like we do today.
> 
> That would work for me.
> 
>>> System RAM is the problem. I wonder how many of these registrations we
>>> really get and if we could just store them in the same tree as !system
>>> RAM instead of abusing page flags.
>>
>> commit 9542ada803198e6eba29d3289abb39ea82047b92
>> Author: Suresh Siddha <suresh.b.siddha@intel.com>
>> Date:   Wed Sep 24 08:53:33 2008 -0700
>>
>>      x86: track memtype for RAM in page struct
>>          Track the memtype for RAM pages in page struct instead of using the
>>      memtype list. This avoids the explosion in the number of entries in
>>      memtype list (of the order of 20,000 with AGP) and makes the PAT
>>      tracking simpler.
>>          We are using PG_arch_1 bit in page->flags.
>>          We still use the memtype list for non RAM pages.
>>
>>
>> I do wonder if that explosion is still an issue today.
> 
> Yes it is. That is exactly the issue I'm working on here.
> 
> It's just that AGP was replaced by internal GPU MMUs over time and so we don't use the old AGP code any more but just call get_free_pages() (or similar) directly.

Okay, I thought I slowly understood how it works, then I stumbled over 
the set_memory_uc / set_memory_wc implementation and now I am *all 
confused*.

I mean, that does perform a PAT reservation.

But when is that reservation ever freed again? :/

How can set_memory_wc() followed by set_memory_uc() possibly work? I am 
pretty sure I am missing a piece of the puzzle.

I think you mentioned that set_memory_uc() is avoided by drivers because 
of highmem mess, but what are drivers then using to modify the direct map?

-- 
Cheers

David / dhildenb

