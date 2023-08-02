Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F776C2EB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEE110E486;
	Wed,  2 Aug 2023 02:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C4310E486
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 02:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690943518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcqUrB73EGo+CGDSoBboVKT2TpZHWRlR4nKAEmHOjEw=;
 b=YITBg9VsmJ+rxNhIaIKDk8hLD7nCvx2So2SJMjTd2MrwKnaoCrR865LA9zVWu4I0goD/KS
 X9fJodubcff9ZNan3gHsYFth2p7VK0xceiylzWXe5yvpJQZgZ+f0V0p5W/upVqQuBRcbG8
 LCrjxcvCLS4a/hc2gy3tv+WUQXSOTyg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-T60qv2FqOLm2eKJ22VtIPg-1; Tue, 01 Aug 2023 22:31:56 -0400
X-MC-Unique: T60qv2FqOLm2eKJ22VtIPg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9fa64dba8so13048781fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 19:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690943515; x=1691548315;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dcqUrB73EGo+CGDSoBboVKT2TpZHWRlR4nKAEmHOjEw=;
 b=II6xfqWn6nosUsdEGUJjg5+n2OpQX4ppZFBgUH6jCewkszkRRxoQm8q0JMBdjHpzhT
 kvCb4cMJOL81mNO10LVxa2Y5QnOYs5azaTiccGdtEctSW2Dp4mv61UBdTWamiyLNGByM
 3U+VnZG2+E8RBR3qixT438lAnWE2PSLnCh7ES8JK5NuLq/43aHcWc8Fh/RLk8h7ROyD4
 zLsOZBuv9/sHtNnT1Gn+WoJkBhlDMsJ1wlE1vS9Mt0Aqac9OzQ+cTlIUwh5tV6U4gzoD
 07COIRlwHC3swoJ4nPRfG20/sy8nKjw/g4SMVDWVjuR1DqdgNLK5/x2uQ5WQyRQKadLI
 jhKQ==
X-Gm-Message-State: ABy/qLZCFKzH2yxQ/+HaNPY/6cCXKe09Q/Xp8URl3g+aIZ2iIFMqmP+n
 DfwMbxzdwUxlBk0o5um6u1SjEmBpYmWHe3N+XxdirAYtBGgKLQI6Aw1HneTlBvFyMVpQQMH29Ee
 AIw96YckTo4UK4qelHcLTenDLiWSV
X-Received: by 2002:a2e:889a:0:b0:2b9:df53:4c2a with SMTP id
 k26-20020a2e889a000000b002b9df534c2amr4161922lji.20.1690943515289; 
 Tue, 01 Aug 2023 19:31:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFY6dxSp77KdBBhmMIfOGBR5VhOzJJ7uo4VtKoY6OdtNI5qlUW7S4XBRnOLnNvz9hN5D2dGGg==
X-Received: by 2002:a2e:889a:0:b0:2b9:df53:4c2a with SMTP id
 k26-20020a2e889a000000b002b9df534c2amr4161915lji.20.1690943514952; 
 Tue, 01 Aug 2023 19:31:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170906139500b00992dcae806bsm8438774ejc.5.2023.08.01.19.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 19:31:54 -0700 (PDT)
Message-ID: <156f9560-b219-7459-d06a-5a8fe07f24cf@redhat.com>
Date: Wed, 2 Aug 2023 04:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v14 02/12] drm/shmem-helper: Add pages_pin_count field
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-3-dmitry.osipenko@collabora.com>
 <20230725092709.51356f39@collabora.com>
 <20230725103234.0c8923f1@collabora.com>
 <4c5fa735-9bfd-f92a-8deb-888c7368f89e@collabora.com>
 <20230731153551.7365daa4@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230731153551.7365daa4@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/23 15:35, Boris Brezillon wrote:
> +Danilo, to confirm my understanding of the gpuva remap operation is
> correct.

Your understanding is correct.

Unfortunately, re-mapping things has such implications.

I'm currently working on tracking external GEM objects in the GPUVA 
manager, where, ideally, you'd want to add the extobj to the VM when the 
first mapping being backed by this GEM is created and removed when the 
last mapping being backed by this GEM is removed. Hence, extobjs need to 
be ref-counted based on how many mappings they back.

However, when re-mapping such a mapping, the reference counter might 
drop to 0 temporarily and the slot of the data structure tracking the 
extobj is cleaned up and needs to be re-allocated. Surely, we could just 
increase the reference count while re-mapping or for the whole 
transaction (job), but this would make the API kinda bulky.

> 
> On Mon, 31 Jul 2023 15:27:31 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 7/25/23 11:32, Boris Brezillon wrote:
>>>> Can we make it an atomic_t, so we can avoid taking the lock when the
>>>> GEM has already been pinned. That's something I need to be able to grab
>>>> a pin-ref in a path where the GEM resv lock is already held[1]. We could
>>>> of course expose the locked version,
>>> My bad, that's actually not true. The problem is not that I call
>>> drm_gem_shmem_pin() with the resv lock already held, but that I call
>>> drm_gem_shmem_pin() in a dma-signaling path where I'm not allowed to
>>> take a resv lock. I know for sure pin_count > 0, because all GEM objects
>>> mapped to a VM have their memory pinned right now, and this should
>>> stand until we decide to add support for live-GEM eviction, at which
>>> point we'll probably have a way to detect when a GEM is evicted, and
>>> avoid calling drm_gem_shmem_pin() on it.
>>>
>>> TLDR; I can't trade the atomic_t for a drm_gem_shmem_pin_locked(),
>>> because that wouldn't solve my problem. The other solution would be to
>>> add an atomic_t at the driver-GEM level, and only call
>>> drm_gem_shmem_[un]pin() on 0 <-> 1 transitions, but I thought using an
>>> atomic at the GEM-shmem level, to avoid locking when we can, would be
>>> beneficial to the rest of the eco-system. Let me know if that's not an
>>> option, and I'll go back to the driver-specific atomic_t.
>>
>> Could you please explain why do you need to pin GEM in a signal handler?
>> This is not something drivers usually do or need to do. You likely also
>> shouldn't need to detect that GEM is evicted in yours driver. I'd expect
>> that Panthor shouldn't differ from Panfrost in regards to how GEM memory
>> management is done and Panfrost doesn't need to do anything special.
> 
> Panthor VM management is completely different, and the case I'm
> referring to is 'asynchronous VM_BIND': mapping a GEM object to a GPU VM
> asynchronously, so we can make it depend on other operations, encoded as
> syncobjs passed to the VM_BIND operation.
> 
> Here is the workflow we have for this use case:
> 
> 1. Create + push a VM_BIND job to the VM_BIND queue (a drm_sched_entity
> that's taking care of asynchronous VM map/unmap operations). Because
> this operation is asynchronous, and the execution itself happens in a
> dma-signaling path (drm_sched::run_job()), we need to pre-allocate the
> MMU page tables for the worst case scenario, and make sure the GEM pages
> are pinned at job creation time.
> 
> 2. The VM operation itself is executed when all dependencies are met
> (drm_sched calls run_job()). In case of a map operation, we call
> drm_gpuva_sm_map(), which might split the map operation into
> remap+unamp+map ones if the region being mapped is covering a region
> that was previously mapped to a different GEM object or a different
> portion of the same GEM object (see the gpuva_mgr doc [1]). A
> remap operation is just a way to split an existing mapping in 2 mappings
> covering the left/right side of the previous mapping, plus a hole in
> the middle. This means that our VM mapping object (drm_gpuva), which
> was pointing to a GEM object that had its pages pinned, is now turned
> into 2 mapping objects, and we need to make sure those 2 mappings own a
> reference to the pages, otherwise we'll have an unbalanced refcount
> when we release those 2 mappings further down the road.
> 
> 3. Release resources attached to mappings that were removed (that
> includes releasing the ref we had on GEM pages) and free the mapping
> objects. We do that asynchronously, outside of the dma-signaling path.
> 
>>
>> Note that patch #14 makes locked pin/unpin functions public and turns
>> the unlocked variants into helpers, you'll be able to experiment with
>> these funcs in the Panthor driver.
> 
> Unfortunately, those won't help. I really need a way to increment the
> refcount without holding the lock, because we're in a dma-signaling
> path when we call drm_gpuva_sm_map(). Note that I could live with a
> drm_shmem_gem_pin_if_already_pinned() variant that would return NULL if
> pin_count == 0 instead of trying to acquire the lock, but I'd still
> need this refcount to be an atomic_t.
> 
> As I said, an alternative to this approach would be to have a separate
> atomic refcount at the panthor_gem_object level, but I feel like we'd
> just be duplicating something that exists already.
> 
> [1]https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuva_mgr.c#n67
> 

