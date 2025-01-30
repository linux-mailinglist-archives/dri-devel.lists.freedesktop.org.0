Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE26A22AA5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 10:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202010E914;
	Thu, 30 Jan 2025 09:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GSnV41cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997E110E914
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738230457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3tgvPZEERiL1tHCnAfaPJMbuWTkpMOsYmhb0/sgbxVU=;
 b=GSnV41cgE/qY8Nm6TDFkKpVD7LcRBV+2NK4SgN34AFtf2ti8MlO10SO65rxfiOtzLj5aPp
 4K861jmZhHaX7S9haXXT5rj9HwabN9YXzSwS01/cJ4LcUJJVOyUtuDxUjpAX6zblXeMPEe
 pkm7cdcHnF9kda8GmPvyiN+3hz77L70=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-b6MryMRyOLKBSIZxbGRWgw-1; Thu, 30 Jan 2025 04:47:36 -0500
X-MC-Unique: b6MryMRyOLKBSIZxbGRWgw-1
X-Mimecast-MFC-AGG-ID: b6MryMRyOLKBSIZxbGRWgw
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4675c482d6cso12650661cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 01:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738230456; x=1738835256;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3tgvPZEERiL1tHCnAfaPJMbuWTkpMOsYmhb0/sgbxVU=;
 b=AesFXfwrUNzcxN4vJHy9jLv0Pe99uaekdJr+oOcINoax2anZsAnRaAB5YL90HF/7gW
 k5ZLPNxSv+UGFmKQCK0NU6QlG1KSwyEwx9wG30FiwJ76I5HBZviVXfhg1yNpdWjQaTkV
 eDJgYq/mJfMZxpPsGf+GFvorSRYuG7hWDsaqhH9PmJYyZc6kbws4Ut2XiaouT1kqOjuM
 eP1zFz6KCYSC+MhHrkftxW5fk0/Vmeg81mwFz34jFzv1l/+ID1EPj7TSl5zpvVhCA6dD
 BVj2uJOL13ApxTzT3wHeRz2w7JKj7Fi94Ub1+kVvGhXY6Ht0mPH7JKU3pDEZRDQvgkJV
 OdpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFi+1GgfpbvNEL1i5PC/vPdjmNAPGY2PznHJCt7UswZ+jnrSu8y7uaFht0JDJvYccX8tRDuOIpFaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMzQ36ubZ9XR6bIK9/SZbMsX6z51Roywn+0JslTelj9yqcCU+E
 MrfydMgpK/hLInj6VPEHDyMLDEI+IblLQxare3ykLdZQjRzLvpLkVc0Y6Mh59T+sNYjms3Aum2R
 IqsjmcLMWRgJqZ/Bh4D29smVp30QOOpO8Ck+5+va6WSc+hwPD0opqck8B0J6up3GYEg==
X-Gm-Gg: ASbGncucLKBAmof6NF8NH8YGfaAyWsAb7AH6on+bNCKDgqbcm/myWAvgqgxPhjIes1e
 nN5Aj5KY7Unl/P4jxOXnsSg8MKEVUisSUgEJ63ne0VzzAjRYDQkGDV1erYhPxvbREitChWtn3gl
 WYacQ+IkFwOvmzYM92GtWmyRfWgXVg4oYzkJtiBJ/APRds5oyOASWEr42ewoKCyUCnbkgRfKZgv
 YhFruiaki96RpYrQlybb/m3XN1P0CJmuRAHYuVx8Ze19cLg3xN3zlZ3I9RmVQ7WBgulenHWiY1e
 kuG5lmbDnRtAqAL6UdLOzCJGDGDsFfpwqgHCNmZzDj+R
X-Received: by 2002:a05:622a:153:b0:467:674d:237f with SMTP id
 d75a77b69052e-46fd0a8121fmr108527321cf.11.1738230455771; 
 Thu, 30 Jan 2025 01:47:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfoVmfV9L/dUj62WVXyzB9/XgoL2b7oI4Y1FhwX7oSrpT5QuJ8lixP75AtkjM8IAwib664fw==
X-Received: by 2002:a05:622a:153:b0:467:674d:237f with SMTP id
 d75a77b69052e-46fd0a8121fmr108526991cf.11.1738230455378; 
 Thu, 30 Jan 2025 01:47:35 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41?
 ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46fdf0e0d18sm5360991cf.40.2025.01.30.01.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 01:47:34 -0800 (PST)
Message-ID: <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
Date: Thu, 30 Jan 2025 10:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
To: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1DobMIdI3z6x_MMz0oNzYyzDXOqEj62yQ4YVbGQoLvY_1738230456
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

On 30.01.25 10:40, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 05:11:49PM +1100, Alistair Popple wrote:
>> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
>>> We require a writable PTE and only support anonymous folio: we can only
>>> have exactly one PTE pointing at that page, which we can just lookup
>>> using a folio walk, avoiding the rmap walk and the anon VMA lock.
>>>
>>> So let's stop doing an rmap walk and perform a folio walk instead, so we
>>> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
>>>
>>> We now effectively work on a single PTE instead of multiple PTEs of
>>> a large folio, allowing for conversion of individual PTEs from
>>> non-exclusive to device-exclusive -- note that the other way always
>>> worked on single PTEs.
>>>
>>> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
>>> that is not required: GUP will already take care of the
>>> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
>>> entry) when not finding a present PTE and having to trigger a fault and
>>> ending up in remove_device_exclusive_entry().
>>
>> I will have to look at this a bit more closely tomorrow but this doesn't seem
>> right to me. We may be transitioning from a present PTE (ie. a writable
>> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
>> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
>> update their copies of the PTE. So I think the notifier call is needed.
> 
> I guess this is a question of semantics we want, for multiple gpus do we
> require that device-exclusive also excludes other gpus or not. I'm leaning
> towards agreeing with you here.

See my reply, it's also relevant for non-device, such as KVM. So it's 
the right thing to do.

> 
>>> Note that the PTE is
>>> always writable, and we can always create a writable-device-exclusive
>>> entry.
>>>
>>> With this change, device-exclusive is fully compatible with THPs /
>>> large folios. We still require PMD-sized THPs to get PTE-mapped, and
>>> supporting PMD-mapped THP (without the PTE-remapping) is a different
>>> endeavour that might not be worth it at this point.
> 
> I'm not sure we actually want hugepages for device exclusive, since it has
> an impact on what's allowed and what not. If we only ever do 4k entries
> then userspace can assume that as long atomics are separated by a 4k page
> there's no issue when both the gpu and cpu hammer on them. If we try to
> keep thp entries then suddenly a workload that worked before will result
> in endless ping-pong between gpu and cpu because the separate atomic
> counters (or whatever) now all sit in the same 2m page.

Agreed. And the conversion + mapping into the device gets trickier.

> 
> So going with thp might result in userspace having to spread out atomics
> even more, which is just wasting memory and not saving any tlb entries
> since often you don't need that many.
> 
> tldr; I think not supporting thp entries for device exclusive is a
> feature, not a bug.

So, you agree with my "different endeavour that might not be worth it" 
statement?

-- 
Cheers,

David / dhildenb

