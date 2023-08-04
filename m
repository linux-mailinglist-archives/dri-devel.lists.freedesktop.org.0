Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328576FB0A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C9D10E696;
	Fri,  4 Aug 2023 07:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC2689CCE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691133828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X0SDuWX0PVJtjYbmSJGuOQKYEPGZD7rqG2wXMixgOng=;
 b=dQedoIMqRlDkMV380V9iemiV3qu0wJ2GbE89wk3Sz0Hr+CWtqf2sxA710QDCyteaF6DCxl
 spRxnBdx8KwfqXw+5+bLuLRDwdsZQS3/Bq5uCkzapYkUfNXSo5kfDK6RA4/0dY0G7W6NiB
 HWkfzo2SMNPj480KMPrtiObDGExz4NE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-lPnB6zkxND2LWa1QtlzJ7w-1; Fri, 04 Aug 2023 03:23:47 -0400
X-MC-Unique: lPnB6zkxND2LWa1QtlzJ7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3179f70a6bdso1049928f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 00:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691133826; x=1691738626;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X0SDuWX0PVJtjYbmSJGuOQKYEPGZD7rqG2wXMixgOng=;
 b=FbxjTmfUyCULjnTmrG0NuOO5yeLxC1qr5cxVXjErrZVWb8btitXPrdAuRSvau6eL+h
 DvyoWDGvEyLviJR5gp1jsDjZwuXz7fVS6XCrJQ6nzxTd0BeKZlMdcG71DzPvkix/O+8o
 WX5uQW1dA1VuaehWE8E31tf6ZNWb+4san4HB5MQ/cjvmUMOJ9xeijmETOTSFpBQj1pPl
 vooa5+2TLCmQbuQKCF1GAdZv5+fSMSBP6D7XZ6Vv+hamvMWZw/Mv/o3tAGDuHwJVkEQx
 JuYUq4XhM+b3gRdiiniRZ5tSpa844aRnKV2uNRdd0PZcLN/RfTlYRWKEc0XE3/0HHMn3
 eBKg==
X-Gm-Message-State: AOJu0YwwNP5BTFtniyb39mWaixlEAHQSbaYOkhiI/oD2B1/F/jbSVDFs
 kTvHkeWObrhGKBatnGV/Ea5AM12wC9BXL5cvjp8tfkMnExGfSD7y2GQ7V/VW9wtfL6XRmKQ2Kix
 k+YUDWRDySq6SIwuhGHirpqrMMX4J
X-Received: by 2002:a05:6000:10cc:b0:313:df08:7b7e with SMTP id
 b12-20020a05600010cc00b00313df087b7emr706548wrx.14.1691133826147; 
 Fri, 04 Aug 2023 00:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRwRNR51hbvYFIT6vOA55mQLzv8RpfVuaFFCwVgPE4ZVELsqeyAcuZh0skiXntG1j72b0zzQ==
X-Received: by 2002:a05:6000:10cc:b0:313:df08:7b7e with SMTP id
 b12-20020a05600010cc00b00313df087b7emr706537wrx.14.1691133825702; 
 Fri, 04 Aug 2023 00:23:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c724:5900:10b9:2373:11c6:216c?
 (p200300cbc724590010b9237311c6216c.dip0.t-ipconnect.de.
 [2003:cb:c724:5900:10b9:2373:11c6:216c])
 by smtp.gmail.com with ESMTPSA id
 k14-20020adfd84e000000b003177e9b2e64sm1741887wrl.90.2023.08.04.00.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 00:23:45 -0700 (PDT)
Message-ID: <ed332536-6ee0-df36-c42a-5a1b5b12c71b@redhat.com>
Date: Fri, 4 Aug 2023 09:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Alistair Popple <apopple@nvidia.com>
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
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
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
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.08.23 08:39, Kasireddy, Vivek wrote:
> Hi Alistair, David, Jason,
> 
>>>>>>>> Right, the "the zero pages are changed into writable pages" in your
>>>>>>>> above comment just might not apply, because there won't be any
>> page
>>>>>>>> replacement (hopefully :) ).
>>>>>>
>>>>>>> If the page replacement does not happen when there are new writes
>> to the
>>>>>>> area where the hole previously existed, then would we still get an
>>>>>> invalidate
>>>>>>> when this happens? Is there any other way to get notified when the
>> zeroed
>>>>>>> page is written to if the invalidate does not get triggered?
>>>>>>
>>>>>> What David is saying is that memfd does not use the zero page
>>>>>> optimization for hole punches. Any access to the memory, including
>>>>>> read-only access through hmm_range_fault() will allocate unique
>>>>>> pages. Since there is no zero page and no zero-page replacement there
>>>>>> is no issue with invalidations.
>>>>
>>>>> It looks like even with hmm_range_fault(), the invalidate does not get
>>>>> triggered when the hole is refilled with new pages because of writes.
>>>>> This is probably because hmm_range_fault() does not fault in any pages
>>>>> that get invalidated later when writes occur.
>>>> hmm_range_fault() returns the current content of the VMAs, or it
>>>> faults. If it returns pages then it came from one of these two places.
>>>> If your VMA is incoherent with what you are doing then you have
>>>> bigger
>>>> problems, or maybe you found a bug.
>>
>> Note it will only fault in pages if HMM_PFN_REQ_FAULT is specified. You
>> are setting that however you aren't setting HMM_PFN_REQ_WRITE which is
>> what would trigger a fault to bring in the new pages. Does setting that
>> fix the issue you are seeing?
> No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue.
> Although, I do not have THP enabled (or built-in), shmem does not evict
> the pages after hole punch as noted in the comment in shmem_fallocate():
>                  if ((u64)unmap_end > (u64)unmap_start)
>                          unmap_mapping_range(mapping, unmap_start,
>                                              1 + unmap_end - unmap_start, 0);
>                  shmem_truncate_range(inode, offset, offset + len - 1);
>                  /* No need to unmap again: hole-punching leaves COWed pages */
> 
> As a result, the pfn is still valid and the pte is pte_present() and pte_write().
> This is the reason why adding in HMM_PFN_REQ_WRITE does not help;

Just to understand your setup: you are definitely using a MAP_SHARED 
shmem mapping, and not accidentally a MAP_PRIVATE mapping?

-- 
Cheers,

David / dhildenb

