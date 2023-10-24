Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1597D4F97
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 14:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0F10E35D;
	Tue, 24 Oct 2023 12:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F18710E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698149768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMA3nzoLm4Zo8XrBBgJy6GrYCS5WEdUVH54F44RRqyw=;
 b=Ziy2GiPgD5ry/6nk5xNnkBMHw8XAG6FU0H5k1gvtAodKA/6BHL075BAAD1MMQoyjylSJqw
 FzMzBFhVHRDrneYDlKZGu+QrYgrTspVDVQQJ9NUK5CjqiEIkdnJUwfsG18wioS4aaNIB2U
 gtM5Hxe48vu7YysFN6XdJHOAN76PwCk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-L1gO1neFPDmHCloMoZjoeQ-1; Tue, 24 Oct 2023 08:16:07 -0400
X-MC-Unique: L1gO1neFPDmHCloMoZjoeQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53e3bfec5bdso2810665a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 05:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698149766; x=1698754566;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMA3nzoLm4Zo8XrBBgJy6GrYCS5WEdUVH54F44RRqyw=;
 b=WZri8zKDYsxrvuewMyUfhj/DME+G+clSTOtoKhCTETeW+B+vpO54sxOMpTXQUP3Q8o
 6CbqsYtkbixKtoxbYi2y0ShG3Ajfoza7um0rhrOVJwmY5A+NUXpoxs5FFwoaslyJCdG3
 CYZtRwTkRKq9WKIWOL5lL0Fmx+moUg286Y5+sIc/2cM6FmWntRa6ejFb88OEX6uByiba
 1WZKX9qvOmMETNCLPO4LJSO1gYf1WrOL+x6bG1BJflmGW/zQVh8GagPplXz84LKbA7Nl
 aZB43+Lwv4dZnYuj44RIhERF/k0rTiIor/eQvUGtA7fr4YfefTyZtoakCeF0glP8pK9k
 F8hQ==
X-Gm-Message-State: AOJu0Yy1jxnSj2kR0xAf+PWoMPfRbx1tjxcwYLg0CZsvAsTwhpZB6toK
 +5QbIkNgYbBIuQm3uV1OJIG+M0iL9fmszJPw6HllIXw1R4ftPyiwcYEnH0FHyh9p7SsujdHvaHK
 STm3OX6wgIkcNrg1N5ZU6FDLPsak3
X-Received: by 2002:a17:906:d555:b0:9be:fc31:8cd4 with SMTP id
 cr21-20020a170906d55500b009befc318cd4mr10849365ejc.18.1698149766099; 
 Tue, 24 Oct 2023 05:16:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP3ZiRrZ8PNj5rETkETCWrc5YAJTTRo0LXQ0p6e3PL/Qq3WPyfZjdF6HstdFGBqQFuFO4JQA==
X-Received: by 2002:a17:906:d555:b0:9be:fc31:8cd4 with SMTP id
 cr21-20020a170906d55500b009befc318cd4mr10849341ejc.18.1698149765668; 
 Tue, 24 Oct 2023 05:16:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a170906265200b009cb2fd85371sm2208086ejc.8.2023.10.24.05.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:16:05 -0700 (PDT)
Message-ID: <9fdadbf2-c6dd-4446-b25c-a4fc235fe0c6@redhat.com>
Date: Tue, 24 Oct 2023 14:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v7 1/7] drm/gpuvm: convert WARN() to
 drm_WARN() variants
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-2-dakr@redhat.com>
 <ca76ef68-5fa4-4a2a-9da2-0378dd7bc2cf@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ca76ef68-5fa4-4a2a-9da2-0378dd7bc2cf@amd.com>
X-Mimecast-Spam-Score: 0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/23 10:45, Christian König wrote:
> 
> 
> Am 23.10.23 um 22:16 schrieb Danilo Krummrich:
>> Use drm_WARN() and drm_WARN_ON() variants to indicate drivers the
>> context the failing VM resides in.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 32 ++++++++++++++------------
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
>>   include/drm/drm_gpuvm.h                |  7 ++++++
>>   3 files changed, 26 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index 08c088319652..d7367a202fee 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -614,12 +614,12 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>   static void __drm_gpuva_remove(struct drm_gpuva *va);
>>   static bool
>> -drm_gpuvm_check_overflow(u64 addr, u64 range)
>> +drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
>>   {
>>       u64 end;
>> -    return WARN(check_add_overflow(addr, range, &end),
>> -            "GPUVA address limited to %zu bytes.\n", sizeof(end));
>> +    return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
>> +            "GPUVA address limited to %zu bytes.\n", sizeof(end));
>>   }
>>   static bool
>> @@ -647,7 +647,7 @@ static bool
>>   drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>>                 u64 addr, u64 range)
>>   {
>> -    return !drm_gpuvm_check_overflow(addr, range) &&
>> +    return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
>>              drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
>>              !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
> 
> When those parameters come from userspace you don't really want a warning in the system log in the first place.
> 
> Otherwise userspace can trivially spam the system log with warnings. The usual approach is to make this debug level severity instead.

Currently, this function isn't exported and hence the driver should do the relevant
sanity checks before attempting to insert the mapping. However, I think it would make
sense to export this function and remove the WARN() and instead WARN() in drm_gpuvm_init()
explicitly.

> 
> Regards,
> Christian.
> 
>>   }
>> @@ -656,6 +656,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>>    * drm_gpuvm_init() - initialize a &drm_gpuvm
>>    * @gpuvm: pointer to the &drm_gpuvm to initialize
>>    * @name: the name of the GPU VA space
>> + * @drm: the &drm_device this VM resides in
>>    * @start_offset: the start offset of the GPU VA space
>>    * @range: the size of the GPU VA space
>>    * @reserve_offset: the start of the kernel reserved GPU VA area
>> @@ -668,8 +669,8 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>>    * &name is expected to be managed by the surrounding driver structures.
>>    */
>>   void
>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>> -           const char *name,
>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>> +           struct drm_device *drm,
>>              u64 start_offset, u64 range,
>>              u64 reserve_offset, u64 reserve_range,
>>              const struct drm_gpuvm_ops *ops)
>> @@ -677,20 +678,20 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>       gpuvm->rb.tree = RB_ROOT_CACHED;
>>       INIT_LIST_HEAD(&gpuvm->rb.list);
>> -    drm_gpuvm_check_overflow(start_offset, range);
>> -    gpuvm->mm_start = start_offset;
>> -    gpuvm->mm_range = range;
>> -
>>       gpuvm->name = name ? name : "unknown";
>>       gpuvm->ops = ops;
>> +    gpuvm->drm = drm;
>> -    memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
>> +    drm_gpuvm_check_overflow(gpuvm, start_offset, range);
>> +    gpuvm->mm_start = start_offset;
>> +    gpuvm->mm_range = range;
>> +    memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
>>       if (reserve_range) {
>>           gpuvm->kernel_alloc_node.va.addr = reserve_offset;
>>           gpuvm->kernel_alloc_node.va.range = reserve_range;
>> -        if (likely(!drm_gpuvm_check_overflow(reserve_offset,
>> +        if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
>>                                reserve_range)))
>>               __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>>       }
>> @@ -712,8 +713,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>       if (gpuvm->kernel_alloc_node.va.range)
>>           __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>> -    WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>> -         "GPUVA tree is not empty, potentially leaking memory.");
>> +    drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>> +         "GPUVA tree is not empty, potentially leaking memory.\n");
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>> @@ -795,7 +796,8 @@ drm_gpuva_remove(struct drm_gpuva *va)
>>       struct drm_gpuvm *gpuvm = va->vm;
>>       if (unlikely(va == &gpuvm->kernel_alloc_node)) {
>> -        WARN(1, "Can't destroy kernel reserved node.\n");
>> +        drm_WARN(gpuvm->drm, 1,
>> +             "Can't destroy kernel reserved node.\n");
>>           return;
>>       }
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> index 5cf892c50f43..aaf5d28bd587 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> @@ -1808,6 +1808,7 @@ int
>>   nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>>             u64 kernel_managed_addr, u64 kernel_managed_size)
>>   {
>> +    struct drm_device *drm = cli->drm->dev;
>>       int ret;
>>       u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
>> @@ -1836,7 +1837,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>>       uvmm->kernel_managed_addr = kernel_managed_addr;
>>       uvmm->kernel_managed_size = kernel_managed_size;
>> -    drm_gpuvm_init(&uvmm->base, cli->name,
>> +    drm_gpuvm_init(&uvmm->base, cli->name, drm,
>>                  NOUVEAU_VA_SPACE_START,
>>                  NOUVEAU_VA_SPACE_END,
>>                  kernel_managed_addr, kernel_managed_size,
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index bdfafc4a7705..687fd5893624 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -29,6 +29,7 @@
>>   #include <linux/rbtree.h>
>>   #include <linux/types.h>
>> +#include <drm/drm_device.h>
>>   #include <drm/drm_gem.h>
>>   struct drm_gpuvm;
>> @@ -201,6 +202,11 @@ struct drm_gpuvm {
>>        */
>>       const char *name;
>> +    /**
>> +     * @drm: the &drm_device this VM lives in
>> +     */
>> +    struct drm_device *drm;
>> +
>>       /**
>>        * @mm_start: start of the VA space
>>        */
>> @@ -241,6 +247,7 @@ struct drm_gpuvm {
>>   };
>>   void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>> +            struct drm_device *drm,
>>               u64 start_offset, u64 range,
>>               u64 reserve_offset, u64 reserve_range,
>>               const struct drm_gpuvm_ops *ops);
> 

