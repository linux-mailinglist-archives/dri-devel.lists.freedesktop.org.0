Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC26B5167
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 21:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8AE10E336;
	Fri, 10 Mar 2023 20:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D977210E336
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678478821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbWktnKIf2P4TvXCV62Olk42Buree+tecJxAeWz28rI=;
 b=OcBS5kr7tE/+6Ct/GblogGeIB3s3eD37c25U5GHrUuKKySMKsh+u/ODdcFpoZIXQVoAaO3
 0BYGiNB60r8ss4OlFthoPoE5fGxUf9Ur4USw1MO+yz+YKeIwx1RqJzb58R8R25uysTikyR
 isTDbF42zbSHTPQBajgtJdT2xyWFnPs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-eCDCmuspMum93XaywuyTkA-1; Fri, 10 Mar 2023 15:06:57 -0500
X-MC-Unique: eCDCmuspMum93XaywuyTkA-1
Received: by mail-ed1-f72.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so9168693eda.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678478816;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pbWktnKIf2P4TvXCV62Olk42Buree+tecJxAeWz28rI=;
 b=hW+CM01yh7/bhSC4m7OUgOYcIxkhNYyv1ndN1da9W10CedFTfW/VwxIQskAzfv6vDS
 Km3iZRwBRycQ+3FdMIgOn01kta0dboJWv1FPtKCCmJDvGmu8Djf2UZteAJof4LyRFThT
 Wq5GGAYqW6fNP6uqNU8irCoJijti/aj2KONuflytOSWq6JSPspCdyosTNtvue9/p28oo
 aOv6LJHjE3xEJyndn5gUlfCZD/ph7Bv+EZ3LODzmuvL9R+DagS9hMnHjT4lxIPEq3Uvs
 7kLLAOuU3oaMfQmwk6rOPKu6XGBOcFUJveWjibnWbLAs8ILUv1PVWL1CR+dCUag8YTdm
 yOXQ==
X-Gm-Message-State: AO0yUKUh7rSFDDdzvL4VcBaeoJ4++xIQlQWLkG7CEYn61RoznY4OicUM
 8OYIGmjCa+yLWdCjEkGmRgmp/TL8kRpKDoIgsK9z+oNZyzS+rW+W0H7SUCsd8T3J8CBSfsJT1RV
 aIbDGcQCs4QyWB4Ly/p6IrKVC5BGI
X-Received: by 2002:aa7:d856:0:b0:4bf:5295:ba0e with SMTP id
 f22-20020aa7d856000000b004bf5295ba0emr21307705eds.41.1678478816177; 
 Fri, 10 Mar 2023 12:06:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/04Ww2URZyxcrVnn+BOVIBwqWJSPCfubZMMJCHj+xbnHonAHgF8D8cE2q+F9tPWeyJOJhDMw==
X-Received: by 2002:aa7:d856:0:b0:4bf:5295:ba0e with SMTP id
 f22-20020aa7d856000000b004bf5295ba0emr21307685eds.41.1678478815848; 
 Fri, 10 Mar 2023 12:06:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 vv7-20020a170907a68700b008b1b86bf668sm255915ejc.4.2023.03.10.12.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 12:06:55 -0800 (PST)
Message-ID: <c33db2d3-a15e-24bc-87d5-0b31ee468b52@redhat.com>
Date: Fri, 10 Mar 2023 21:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH drm-next v2 00/16] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230309101243.1150506f@collabora.com>
 <20230309104841.7c03d5b4@collabora.com>
 <d0e59837-703b-964a-877e-38c244f58a85@redhat.com>
 <20230310182536.571315f3@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230310182536.571315f3@collabora.com>
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
Cc: matthew.brost@intel.com, bagasdotme@gmail.com, corbet@lwn.net,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, willy@infradead.org, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, christian.koenig@amd.com, jason@jlekstrand.net,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/23 18:25, Boris Brezillon wrote:
> Hi Danilo,
> 
> On Fri, 10 Mar 2023 17:45:58 +0100
> Danilo Krummrich <dakr@redhat.com> wrote:
>> Hi Boris,
>>
>>> On Thu, 9 Mar 2023 10:12:43 +0100
>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>
>>> Ok, so I just noticed you only have one bind queue per drm_file
>>> (cli->sched_entity), and jobs are executed in-order on a given queue,
>>> so I guess that allows you to modify the VA space at submit time
>>> without risking any modifications to the VA space coming from other
>>> bind-queues targeting the same VM. And, if I'm correct, synchronous
>>> bind/unbind ops take the same path, so no risk for those to modify the
>>> VA space either (just wonder if it's a good thing to have to sync
>>> bind/unbind operations waiting on async ones, but that's a different
>>> topic).
>>
>> Yes, that's all correct.
>>
>> The page table allocation happens through nouveau_uvmm_vmm_get() which
>> either allocates the corresponding page tables or increases the
>> reference count, in case they already exist, accordingly.
>> The call goes all the way through nvif into the nvkm layer (not the
>> easiest to follow the call chain) and ends up in nvkm_vmm_ptes_get().
>>
>> There are multiple reasons for updating the VA space at submit time in
>> Nouveau.
>>
>> 1) Subsequent EXEC ioctl() calls would need to wait for the bind jobs
>> they depend on within the ioctl() rather than in the scheduler queue,
>> because at the point of time where the ioctl() happens the VA space
>> wouldn't be up-to-date.
> 
> Hm, actually that's what explicit sync is all about, isn't it? If you
> have async binding ops, you should retrieve the bind-op out-fences and
> pass them back as in-fences to the EXEC call, so you're sure all the
> memory mappings you depend on are active when you execute those GPU
> jobs. And if you're using sync binds, the changes are guaranteed to be
> applied before the ioctl() returns. Am I missing something?
> 

No, you're right and this is exactly how I implemented it. The 
difference is where to wait for the bind jobs out-fences.

In the EXEC ioctl() we need to validate the GEM objects backing the 
dependent mappings and add the jobs fence to the GEMs DMA reservation. 
If the VA space isn't up-to-date we might not be able to look up the 
relevant GEMs and miss them.

If the VA space change happens in the bind jobs submit path (ioctl()), 
it is guaranteed that the view of the VA space is up-to-date (actually 
it might even be ahead of the actual current state) when the EXEC 
ioctl() is called. Hence, I can just pass the out-fences of the binds 
jobs the EXEC depends on to the job scheduler and return from the 
ioctl(). The job scheduler will then wait for the actual mappings being 
populated before executing the EXEC job.

If the VA space change is done when the bind job executes on the 
scheduler we would need to wait for the bind jobs out-fences in the EXEC 
ioctl() itself.

>>
>> 2) Let's assume a new mapping is requested and within it's range other
>> mappings already exist. Let's also assume that those existing mappings
>> aren't contiguous, such that there are gaps between them. In such a case
>> I need to allocate page tables only for the gaps between the existing
>> mappings, or alternatively, allocate them for the whole range of the new
>> mapping, but free / decrease the reference count of the page tables for
>> the ranges of the previously existing mappings afterwards.
>> In the first case I need to know the gaps to allocate page tables for
>> when submitting the job, which means the VA space must be up-to-date. In
>> the latter one I must save the ranges of the previously existing
>> mappings somewhere in order to clean them up, hence I need to allocate
>> memory to store this information. Since I can't allocate this memory in
>> the jobs run() callback (fence signalling critical section) I need to do
>> it when submitting the job already and hence the VA space must be
>> up-to-date again.
> 
> Yep that makes perfect sense, and that explains how the whole thing can
> work. When I initially read the patch series, I had more complex use
> cases in mind, with multiple bind queues targeting the same VM, and
> synchronous bind taking a fast path (so they don't have to wait on
> async binds which can in turn wait on external deps). This model makes
> it hard to predict what the VA space will look like when an async bind
> operation gets to be executed, thus making page table allocation more
> complex, or forcing us to over-estimate the amount of pages we need for
> this update (basically one page per MMU level, except maybe the top
> level, plus the number of pages you'll always need for the bind
> operation itself).
> 
>> However, this is due to how page table management currently works in
>> Nouveau and we might change that in the future.
> 
> I'm curious to hear about that if you have a bit of time. I'm starting
> from scratch with pancsf, and I might consider going for something
> similar to what you plan to do next.

There is no concrete plan yet. However, with the current implementation 
there are a few shortcomings (also in handling sparse ranges) that I'd 
like to address in the future.

> 
>>
>> Synchronous binds/unbinds taking the same path through the scheduler is
>> a downside of this approach.
> 
> Indeed. I mean, I can probably live with this limitation, but I'm
> curious to know if the pg table management changes you're considering
> for the future would solve that problem.

As mentioned above, I have a few ideas, but I did not think through them 
entirely yet.

A few thoughts though: If running synchronous binds/unbinds through the 
job scheduler is a concern I think it could be beneficial to 
(pre-)allocate page tables for newly requested mappings without the need 
to know whether there are existing mappings within this range already 
(ideally without tracking page table allocations separate from GPUVAs), 
such that we can update the VA space at job execution time. Same thing 
for freeing page tables for a range that only partially contains 
mappings at all. For that, reference counting page tables per mapping 
wouldn't really work.

On the other hand we need to consider that freeing page tables for a 
given range and allocating new page tables for the same or an 
overlapping range would need to be ordered in order to avoid races.

> 
> Anyway, thanks for taking the time to answer my question, things are
> much clearer now.

I'm happy to discuss this. Feel free to also reach out in IRC, my nick 
is 'dakr'.

> 
> Boris
> 

