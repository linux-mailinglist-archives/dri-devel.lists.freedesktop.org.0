Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F74CA4A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 13:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A12010E772;
	Wed,  2 Mar 2022 12:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07B910E88D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646223536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQIwtHkHzYTYJnngpsaoFGg2phTUpA1DDWldBn55VNw=;
 b=gpVasHvdXTdtCaNYJoh6jd5+tcAqAMFaBQPuKO2oPv5sHy4D6IDNka+Ibp6TscFwq295N+
 i+epoZAdZ9j8nPrBgvYJ4sW42bK7yaTgd+uYbI5t1patMclG4h8qwlYdHkdQE7Fttvx7l6
 Pa2OVXc1eXMrqwdjeqDqqfbEg9XfV7E=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-Y11NSBAzPF6OcdtXWvp69w-1; Wed, 02 Mar 2022 07:18:55 -0500
X-MC-Unique: Y11NSBAzPF6OcdtXWvp69w-1
Received: by mail-oo1-f69.google.com with SMTP id
 r4-20020a4abf04000000b0032030c12b39so1117084oop.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 04:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CQIwtHkHzYTYJnngpsaoFGg2phTUpA1DDWldBn55VNw=;
 b=kvEspifKnvnWqRpY7UNl2NBhJjLftmp8FbcwAPybmXrpH7HWt4NPlHvrbH+1gYAhD6
 RWeUVQOs4VSJJq6GdQ/1bFnwGXXa8JE7NPlByuWUurfTlzG9UDJ3gXz2Mxxw9Ij+xeJO
 /p9U/ZjVSJv3JNzNWLaLYccE3SoLvIOFEH+dHDt0eimfByTXr3LN5krOXSBTMYkXFxol
 o4zzbeP3e/QB4amv4hF6UB454bcx4X0H9B6KtCWtErw1V5KxXpWu62dhgf0mhTscPVMB
 uP6GFZe0PeRPr6ErPPpiyJWesXBql6Ape3E9TOhmRdIpRVrZtf721aUq0PnWrT5apnpT
 HBNQ==
X-Gm-Message-State: AOAM533ZZItpEFeDkPZRLwBEhslCCh/DO3GZ8tXWCNzK0WEo3tyjao5k
 EJRE4xGJp3oFRPjwqS6ERID0i1JcHOK5/MRsy8Tk0HeDJ6fOEvcji46Akaais4gjU38vCrEKYl9
 hf5ZIKLqvt60TmLOQtqkX3e241z2y
X-Received: by 2002:a05:6870:f71f:b0:d7:5f1b:534f with SMTP id
 ej31-20020a056870f71f00b000d75f1b534fmr3992865oab.109.1646223535155; 
 Wed, 02 Mar 2022 04:18:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwFSn9bq4J/gb3vPe90vs63pgMwy9LWUUx7VVubtpR9xkREKJT+AW/HBTh1TeSBX4HYb/3ww==
X-Received: by 2002:a05:6870:f71f:b0:d7:5f1b:534f with SMTP id
 ej31-20020a056870f71f00b000d75f1b534fmr3992844oab.109.1646223534882; 
 Wed, 02 Mar 2022 04:18:54 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 l8-20020a4ad9c8000000b0031bec309e0asm7480117oou.6.2022.03.02.04.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 04:18:54 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: cleanup comments
To: Steven Price <steven.price@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220301124339.264544-1-trix@redhat.com>
 <5263b251-53ee-aebd-80e3-79a8d47335eb@arm.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <6c598625-ff78-0fd5-3787-e59415751f4f@redhat.com>
Date: Wed, 2 Mar 2022 04:18:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5263b251-53ee-aebd-80e3-79a8d47335eb@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/2/22 1:09 AM, Steven Price wrote:
> On 01/03/2022 12:43, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> For spdx
>> change tab to space delimiter
>> Use // for *.c
>>
>> Replacements
>> commited to committed, use multiline comment style
>> regsiters to registers
>> initialze to initialize
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Thanks, most of the changes look reasonable (although I've never
> understood the reason for using // for SPDX comments), but there's one
> below that I think needs rethinking.
>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_drv.c          | 2 +-
>>   drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 2 +-
>>   drivers/gpu/drm/panfrost/panfrost_issues.h       | 6 ++++--
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c          | 2 +-
>>   drivers/gpu/drm/panfrost/panfrost_regs.h         | 2 +-
>>   5 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index 96bb5a4656278..94b6f0a19c83a 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -562,7 +562,7 @@ static int panfrost_probe(struct platform_device *pdev)
>>   
>>   	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
>>   
>> -	/* Allocate and initialze the DRM device. */
>> +	/* Allocate and initialize the DRM device. */
>>   	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
>>   	if (IS_ERR(ddev))
>>   		return PTR_ERR(ddev);
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> index b0142341e2235..77e7cb6d1ae3b 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> @@ -1,4 +1,4 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> +// SPDX-License-Identifier: GPL-2.0
>>   /* Copyright (C) 2019 Arm Ltd.
>>    *
>>    * Based on msm_gem_freedreno.c:
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
>> index 8e59d765bf19f..4e7cf979ee67a 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
>> @@ -13,8 +13,10 @@
>>    * to care about.
>>    */
>>   enum panfrost_hw_issue {
>> -	/* Need way to guarantee that all previously-translated memory accesses
>> -	 * are commited */
>> +	/*
>> +	 * Need way to guarantee that all previously-translated memory accesses
>> +	 * are committed
>> +	 */
> This file has a whole load of multiline comments that don't technically
> follow the coding style. Fixing just one comment makes the file
> inconsistent. Note we recently had a discussion about this[1] and
> decided to leave the comment style as is. And I have to admit in this
> instance avoiding the extra mostly-blank lines makes the list easier to
> read. The typo fix is obviously welcomed though!

I'll switch this back in a respin.

Thanks

Tom


>
> [1] https://lore.kernel.org/r/c7331489-ad04-0f35-224e-164f144fb819%40arm.com
>
>>   	HW_ISSUE_6367,
>>   
>>   	/* On job complete with non-done the cache is not flushed */
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 39562f2d11a47..d3f82b26a631d 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -1,4 +1,4 @@
>> -// SPDX-License-Identifier:	GPL-2.0
>> +// SPDX-License-Identifier: GPL-2.0
>>   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>   
>>   #include <drm/panfrost_drm.h>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
>> index 6c5a11ef1ee87..efe4b75149d35 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
>> @@ -292,7 +292,7 @@
>>   #define AS_FAULTADDRESS_LO(as)		(MMU_AS(as) + 0x20) /* (RO) Fault Address for address space n, low word */
>>   #define AS_FAULTADDRESS_HI(as)		(MMU_AS(as) + 0x24) /* (RO) Fault Address for address space n, high word */
>>   #define AS_STATUS(as)			(MMU_AS(as) + 0x28) /* (RO) Status flags for address space n */
>> -/* Additional Bifrost AS regsiters */
>> +/* Additional Bifrost AS registers */
>>   #define AS_TRANSCFG_LO(as)		(MMU_AS(as) + 0x30) /* (RW) Translation table configuration for address space n, low word */
>>   #define AS_TRANSCFG_HI(as)		(MMU_AS(as) + 0x34) /* (RW) Translation table configuration for address space n, high word */
>>   #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */

