Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B84BC4E1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D87010E183;
	Sat, 19 Feb 2022 02:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58EA10E183
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645238088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLSRXD4oabvT1hZcyTh/jopmei8mV6oK1K/s3P1srU8=;
 b=atG7kMY5NthZOigp49uuoT8klRkn9tyVdU/rNtVXF8uFDJAb2iucEehNFkpIIMm0rUUuOa
 jsxC1p1RgIi+2D3MwivgRIZtSUX/RYZbzpwBWrNVd6WtnSUlXoegFEjVnsNYNtMw/V3VFR
 7Sc28xBgopw79oPKrIF2R/JSMSIPkqI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-ch8gT7HgN9qyED4_BxgExA-1; Fri, 18 Feb 2022 21:34:45 -0500
X-MC-Unique: ch8gT7HgN9qyED4_BxgExA-1
Received: by mail-qk1-f200.google.com with SMTP id
 i189-20020a3786c6000000b00646d7b30998so1545740qkd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 18:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dLSRXD4oabvT1hZcyTh/jopmei8mV6oK1K/s3P1srU8=;
 b=hF+OAvUtEXDiVK7ggrHf0BdO/zooDFWXVmKbYGKCmc5mUShh2RFOlD1B7w7nhXbKvQ
 Z6NhaR5//uC/QT+0Cj9nRy1/TXz9ojE4L8uzry6FEZvbLK8IlwI69m1/H3cy8XMDUlcl
 3PUNFHn4Y16ChajUlBgZqtQjXfVfkznk0V/8OCkjdMdrtGnlptGG0x/UNE3YYysHcixM
 OzHxPUOujb9IshhGIgrTW4LYAUv5Xswv0wcOzq8J7vsHTvcXnSPr9mUjyQUjO3KenSpE
 3f+7NsdEjaS+RJJTMTpo/Tzc99WikjFPG35eRlBSJLOMkSPdMVQ/UV4zVX39rw/D/y1H
 NKmw==
X-Gm-Message-State: AOAM5324a+bej3hmgpjIoFgE/N8yNU7+HIzvJYRDa1xnCwrOzzbdkG8r
 OgnPpApZyn0CPJMaRVJgNFkmgnhVJonXhKN+gqJo9IhBdL3wa5yqH1sywiy5ekT4sADaKFx9oXf
 Kz/qytpm9vwKgNd0U5rBrL2dODZuc
X-Received: by 2002:a05:622a:255:b0:2dd:2295:e6cc with SMTP id
 c21-20020a05622a025500b002dd2295e6ccmr9237072qtx.399.1645238085425; 
 Fri, 18 Feb 2022 18:34:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycI8i/Dj3TSf78qpp+mi+i6jw4nt8X0/VpHah9pqOsogHlS9ItFFm2kFqJ/p1eOKjjqDzKmw==
X-Received: by 2002:a05:622a:255:b0:2dd:2295:e6cc with SMTP id
 c21-20020a05622a025500b002dd2295e6ccmr9237062qtx.399.1645238085204; 
 Fri, 18 Feb 2022 18:34:45 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id f14sm23160886qko.117.2022.02.18.18.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 18:34:44 -0800 (PST)
Subject: Re: [PATCH] drm/amdkfd: rework criu_restore_bos error handling
To: Felix Kuehling <felix.kuehling@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 david.yatsin@amd.com, rajneesh.bhardwaj@amd.com
References: <20220218173913.3376948-1-trix@redhat.com>
 <b98981f4-358b-ebdd-dade-4027c57a1a7e@amd.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <4ca24c08-9014-3380-b8cc-dc0ed9a01a73@redhat.com>
Date: Fri, 18 Feb 2022 18:34:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b98981f4-358b-ebdd-dade-4027c57a1a7e@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/18/22 10:35 AM, Felix Kuehling wrote:
> Am 2022-02-18 um 12:39 schrieb trix@redhat.com:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this problem
>> kfd_chardev.c:2327:2: warning: 1st function call argument
>>    is an uninitialized value
>>    kvfree(bo_privs);
>>    ^~~~~~~~~~~~~~~~
>>
>> If the copy_from_users(bo_buckets, ...) fails, there is a jump to
>> the generic error handler at exit:.  The freeing of bo_privs and
>> unwinding of the dmabuf_fd loop do not need to be done.
>>
>> Add some specific labels for the early failures.
>> Reorder the frees to be the reverse of their allocs.
>>
>> Move the initialize of 'i' back to the loop.
>> The problem with the early frees predates the loop
>> unwinding problem.
>
> I think the existing error handling strategy in this function is fine. 
> Having only one exit label avoids potential issues when using the 
> wrong label. Freeing NULL pointers is not a problem. The loop becomes 
> a noop if i==0 (this was fixed by you in a previous patch). The only 
> real problem I see is that bo_privs is not initialized. So this should 
> really be a one-line or maybe two-line fix:
>
>     struct kfd_criu_bo_bucket *bo_buckets = NULL;
>     struct kfd_criu_bo_priv_data *bo_privs = NULL;

This is the other way I considered to fix the problem. So it will work.

Tom

>
> Regards,
>   Felix
>
>
>>
>> Fixes: 73fa13b6a511 ("drm/amdkfd: CRIU Implement KFD restore ioctl")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index 965af2a08bc0..1d5f41ac3832 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -2102,7 +2102,7 @@ static int criu_restore_bos(struct kfd_process *p,
>>       const bool criu_resume = true;
>>       bool flush_tlbs = false;
>>       int ret = 0, j = 0;
>> -    uint32_t i = 0;
>> +    uint32_t i;
>>         if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > 
>> max_priv_data_size)
>>           return -EINVAL;
>> @@ -2119,13 +2119,13 @@ static int criu_restore_bos(struct 
>> kfd_process *p,
>>       if (ret) {
>>           pr_err("Failed to copy BOs information from user\n");
>>           ret = -EFAULT;
>> -        goto exit;
>> +        goto free_buckets;
>>       }
>>         bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), 
>> GFP_KERNEL);
>>       if (!bo_privs) {
>>           ret = -ENOMEM;
>> -        goto exit;
>> +        goto free_buckets;
>>       }
>>         ret = copy_from_user(bo_privs, (void __user *)args->priv_data 
>> + *priv_offset,
>> @@ -2133,12 +2133,12 @@ static int criu_restore_bos(struct 
>> kfd_process *p,
>>       if (ret) {
>>           pr_err("Failed to copy BOs information from user\n");
>>           ret = -EFAULT;
>> -        goto exit;
>> +        goto free_privs;
>>       }
>>       *priv_offset += args->num_bos * sizeof(*bo_privs);
>>         /* Create and map new BOs */
>> -    for (; i < args->num_bos; i++) {
>> +    for (i = 0; i < args->num_bos; i++) {
>>           struct kfd_criu_bo_bucket *bo_bucket;
>>           struct kfd_criu_bo_priv_data *bo_priv;
>>           struct kfd_dev *dev;
>> @@ -2323,8 +2323,11 @@ static int criu_restore_bos(struct kfd_process 
>> *p,
>>           if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
>>               close_fd(bo_buckets[i].dmabuf_fd);
>>       }
>> -    kvfree(bo_buckets);
>> +free_privs:
>>       kvfree(bo_privs);
>> +free_buckets:
>> +    kvfree(bo_buckets);
>> +
>>       return ret;
>>   }
>

