Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D63AB8A33
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F0710E8DD;
	Thu, 15 May 2025 15:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VlHWVk82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC61310E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747321472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Be4KEquqHLgMFgrTaQhow/F5UFD9Qx8DOcirjEfZuRY=;
 b=VlHWVk82ZjREgfvC5+sOX+BRwe1bqTWRR63M84+aeWRmcj+IR75XFaClxaPRKgoa5KAALH
 Ul5YzqzpWwxfJZVwMygIB+aEz4+FEzPa6V+66Mh/TONx4t0v03SSu9v6wEJdfq4wwMFIms
 hYTLFuqLtSHEhkLjrPpWKXs23CBtGXI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-6MwUclcXNPyXv1mbVeYDWQ-1; Thu, 15 May 2025 11:04:30 -0400
X-MC-Unique: 6MwUclcXNPyXv1mbVeYDWQ-1
X-Mimecast-MFC-AGG-ID: 6MwUclcXNPyXv1mbVeYDWQ_1747321470
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4769a8d15afso16890611cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747321470; x=1747926270;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Be4KEquqHLgMFgrTaQhow/F5UFD9Qx8DOcirjEfZuRY=;
 b=JdYe569TGzS3Xz68A/9KPEoMo5RZBV5ae8eVpFdgf4LwMhDqldJitD0Si799I8qpJZ
 CDUIDiUWb5PP0QYU6NlTCb4Kiop4ylkhCkizQYALJHZOeCCbeIREHq+PljsU4updM9GI
 XYpTI5RAeG4eg5xveumN9P0EuSGW7+KSHL1BczcbKrMIe1aoaPbECiVFy0qlZqBh0dRF
 MfZP8xtwDCkrHX3EW2qTw2nRTBA2qeHpF+7heWSkW1BbfzTrDKDWRlTnsSFXFQ8U4/ST
 r8y3mrUdKl6fLudwbi/4G/XMvxM1yfAa078KLDHFvqs8VsTXqhHMKU6U3g24jhNCZ/bH
 t68w==
X-Gm-Message-State: AOJu0YwRraKYRa5KCBWcE6fI2r/RYhTT8CkSYlBpmu8hBL3QllLSTn48
 66m3GezKI4+sNaIbfP61ACClkvJ7rH2ItbqmDEOlwUpBWIyPI5DjPGwE7sVxy0IVGMhXzooMGnh
 3s2ZEt90L950l42cgdX+bUm/rAnrFpbgBmupEO1swnsysrWsqT0hKb6fE/q1vNBGhFw==
X-Gm-Gg: ASbGnctLRYJ7SCRjjJzWhCfDhVQH45Ecl/+CRd0nvMEbBIhv7d7VDrmMDm/y0nirjw9
 qKJrUYhnaKtosI1WhOuQkJcTlG9HKa7YhBkglpXomkkUcNEFqpx++j0J7Lcd/Jw7jKGH8opg4GS
 n5xYEBTmyA9L7uorbKHHTd5uCl3dENiQDbOyh2t2xY9ECwbcgF8l2zstV65ZQ3pbsFuV5GtnMZb
 zSW2p3DLCcMduCxXmd+VdvA0hwqcC9MgxCC2TRCKce3RRHkmAadSJDUC6xfy5xllawPWAs25kzd
 HhbtFEJx3UCH0MZgf+wpBbFRiRVbLlZmHFBcEE6+3MEYYdDZfSIYRP9TQw==
X-Received: by 2002:a05:622a:22a6:b0:48a:6af8:58a5 with SMTP id
 d75a77b69052e-49495cf9359mr115871591cf.29.1747321470141; 
 Thu, 15 May 2025 08:04:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw/c5TKHyoij8GGYCAmY2jQxbRtsvyzNfyutXVO25tG8IdumpngugYMLx+TE/G1RpwhKqcYw==
X-Received: by 2002:a05:622a:22a6:b0:48a:6af8:58a5 with SMTP id
 d75a77b69052e-49495cf9359mr115871051cf.29.1747321469430; 
 Thu, 15 May 2025 08:04:29 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba?
 ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08c024fsm234256d6.65.2025.05.15.08.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:04:28 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <4ec2dd5a-3cdb-48cf-a459-4d384a48c671@redhat.com>
Date: Thu, 15 May 2025 11:04:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
In-Reply-To: <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fvNpeMx6gervn1YMUYLlRq1MlSGMiJMxbcsrBaGDxcA_1747321470
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

On 5/15/25 4:55 AM, Christian König wrote:
> On 5/15/25 05:02, Dave Airlie wrote:
>>> I have to admit I'm pretty clueless about the gpu driver internals and
>>> can't really judge how feasible this is. But from a cgroup POV, if you
>>> want proper memory isolation between groups, it seems to me that's the
>>> direction you'd have to take this in.
>> Thanks for this insight, I think you have definitely shown me where
>> things need to go here, and I agree that the goal should be to make
>> the pools and the shrinker memcg aware is the proper answer,
>> unfortunately I think we are long way from that at the moment, but
>> I'll need to do a bit more research. I wonder if we can agree on some
>> compromise points in order to move things forward from where they are
>> now.
>>
>> Right now we have 0 accounting for any system memory allocations done
>> via GPU APIs, never mind the case where we have pools and evictions.
>>
>> I think I sort of see 3 stages:
>> 1. Land some sort of accounting so you can at least see the active GPU
>> memory usage globally, per-node and per-cgroup - this series mostly
>> covers that, modulo any other feedback I get.
>> 2. Work on making the ttm subsystem cgroup aware and achieve the state
>> where we can shrink inside the cgroup first.
>> 3. Work on what to do with evicted memory for VRAM allocations, and
>> how best to integrate with dmem to possibly allow userspace to define
>> policy for this.
>>
>>> Ah, no need to worry about it. The name is just a historical memcgism,
>>> from back when we first started charging "kernel" allocations, as
>>> opposed to the conventional, pageable userspace memory. It's no longer
>>> a super meaningful distinction, tbh.
>>>
>>> You can still add a separate counter for GPU memory.
>> Okay that's interesting, so I guess the only question vs the bespoke
>> ones is whether we use __GFP_ACCOUNT and whether there is benefit in
>> having page->memcg set.
>>
>>> I agree this doesn't need to be a goal in itself. It would just be a
>>> side effect of charging through __GFP_ACCOUNT and uncharging inside
>>> __free_pages(). What's more important is that the charge lifetime is
>>> correlated with the actual memory allocation.
>> How much flexibility to do we have to evolve here, like if we start
>> with where the latest series I posted gets us (maybe with a CONFIG
>> option), then work on memcg aware shrinkers for the pools, then with
>> that in place it might make more sense to account across the complete
>> memory allocation. I think I'm also not sure if passing __GFP_ACCOUNT
>> to the dma allocators is supported, which is also something we need to
>> do, and having the bespoke API allows that to be possible.
> Stop for a second.
>
> As far as I can see the shrinker for the TTM pool should *not* be memcg aware. Background is that pages who enter the pool are considered freed by the application.
>
> The only reason we have the pool is to speed up allocation of uncached and write combined pages as well as work around for performance problems of the coherent DMA API.
>
> The shrinker makes sure that the pages can be given back to the core memory management at any given time.

I think what Johannes is suggesting that we can have a separate cgroup 
just for the memory pool so that if the system is running into global 
memory pressure, the shrinker can force the uncached pool to release 
memory back into the system.

Cheers,
Longman

