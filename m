Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4DB933EE1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163D10E176;
	Wed, 17 Jul 2024 14:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJV32CyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431FD10E142
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:53:23 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3d9de9f8c8dso203359b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721228002; x=1721832802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YB+N7qYDFec1drbFyae8wEt4ZWnAtFry0tkfZxagcLM=;
 b=cJV32CyIBxhOrX/sloZBmAexwHAJtR0/PtoJYrY6j0fVF2AbTX24vN4uu2D8uWb5RE
 korbMDg0MlnBhH7HiG5CmvjrtkFA+ktMoPPVldzcSy9rXvaR2mf+Br6RSUehbsXdMvkQ
 d3JPeElNPDq9nBf9Og2rZTRNebAS/suJPmqMJmV1Go9DtbD3zF+SEo1WMEsvbj8YhMWK
 qtYMPJAZaUXkOjza8wDUVSbbwLiybSt+INoy5fjInjONAUSoTfwGzMGnGRRryzDK0SYX
 rwQbRH9znvmcfdMo6a/s+D+BblI0tvA+D+tdoHUXqxInN+AQFakDA1RkvxFAzVt/IcIb
 sy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228002; x=1721832802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YB+N7qYDFec1drbFyae8wEt4ZWnAtFry0tkfZxagcLM=;
 b=iu2ZjggoZCIZDEHsP42ZulRoYZtoKStUKJpq9plkSZ7c1G26Z3oPpOphAfLTscXCeY
 l3wrK+tTvj+mY4V4DHnYoIW7kktCUhQBle0gndkEc31VXdWvOvoNpUDnRB5wEu8KAbXV
 be4ZDw+AI5duzj8GzHMGC2buIlU94xsAKrKoB+Kxtf2Cl/fbtwY9tCuly04x3Ntwu7ze
 FjwJEPVVYVvZqkOX+DAvFUBmzTYMS5MeqK0E7MdyZ+fnOI4IeLdP7qZ5DwOe1ZOWeCfr
 790YKXf594s6sTOJ2IfDGwIrSeJNvphdQUvxFQ8+FJwjdjvzpcguGu8fBUoJwIu+Jsyn
 UKEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB3tIFcFKgpdcWp/2MF5YPOb7IAuMzdQJ9nEnoJ1LQ6HT/pmH7RWKOAaCeF8kNBfaLAJlUtJFlDOTya7F0Osp03x5acBb0cLwco5P9hCaN
X-Gm-Message-State: AOJu0YzDdKplZgC5f3JTQkSit0YidbWV/PJaMHsL76ktjtlqAy08OADl
 zla8ztn4eFLUKAPy6Bo1z7Y/EDCfCx9SmVs2LRjkfp5dJZAvYPyf
X-Google-Smtp-Source: AGHT+IHOg8VuJOMZYey7XrFLaVW7duqkVnqK3uQGysfc2SN6w00e7y9bY2ARSJHTxdbCTX5s2N+nBQ==
X-Received: by 2002:a05:6808:10c8:b0:3d9:2ab5:c697 with SMTP id
 5614622812f47-3dad1f36098mr2116211b6e.20.1721228002167; 
 Wed, 17 Jul 2024 07:53:22 -0700 (PDT)
Received: from [10.254.92.243] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a160b98ccdsm409299485a.7.2024.07.17.07.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 07:53:21 -0700 (PDT)
Message-ID: <e4349837-8b5c-48f4-899e-814aede79679@gmail.com>
Date: Wed, 17 Jul 2024 16:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/amdgpu: use GEM references instead of TTMs
To: Matthew Brost <matthew.brost@intel.com>
Cc: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-2-christian.koenig@amd.com>
 <ZpbrxAyVTdhkJZ9O@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZpbrxAyVTdhkJZ9O@DUT025-TGLU.fm.intel.com>
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

Am 16.07.24 um 23:53 schrieb Matthew Brost:
> On Tue, Jul 16, 2024 at 02:35:11PM +0200, Christian König wrote:
>> Instead of a TTM reference grab a GEM reference whenever necessary.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 7 ++-----
>>   2 files changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 67c234bcf89f..6be3d7cd1c51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -87,11 +87,11 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>>   
>>   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>   {
>> -	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
>> +	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>>   
>> -	if (robj) {
>> -		amdgpu_hmm_unregister(robj);
>> -		amdgpu_bo_unref(&robj);
>> +	if (aobj) {
>> +		amdgpu_hmm_unregister(aobj);
>> +		ttm_bo_put(&aobj->tbo);
> So, this relates to my comment in patch number #9 about dropping the TTM
> ref count. If TTM only uses the GEM ref count, could we convert this
> ttm_bo_put to something like ttm_bo_fini here (also in Xe and any other
> drivers with code like this)?

That's exactly what I was planning to do as a follow up.

Regards,
Christian.

>
> I think that might be cleaner.
>
> Matt
>
>>   	}
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 8d8c39be6129..6c187e310034 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -853,7 +853,7 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
>>   	if (bo == NULL)
>>   		return NULL;
>>   
>> -	ttm_bo_get(&bo->tbo);
>> +	drm_gem_object_get(&bo->tbo.base);
>>   	return bo;
>>   }
>>   
>> @@ -865,13 +865,10 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
>>    */
>>   void amdgpu_bo_unref(struct amdgpu_bo **bo)
>>   {
>> -	struct ttm_buffer_object *tbo;
>> -
>>   	if ((*bo) == NULL)
>>   		return;
>>   
>> -	tbo = &((*bo)->tbo);
>> -	ttm_bo_put(tbo);
>> +	drm_gem_object_get(&(*bo)->tbo.base);
>>   	*bo = NULL;
>>   }
>>   
>> -- 
>> 2.34.1
>>

