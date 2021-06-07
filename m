Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80F39D9DC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08CF6E3B2;
	Mon,  7 Jun 2021 10:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6D56E3B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:37:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c9so8322782wrt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=21/TgqfW8C5BR2/gbvmwEmQNwprc3UPV4NtxlfmGbWs=;
 b=RHfyewd+vUgw2BZSAwBoXsV7J90rzaREOWnspld2iDWXJBzW7DgMlI4p8zbwhCBrdF
 LB8tiQ8AzjvmZUzu2wxtB5xAFNTUb2EGpo8AGT7G5zT9IXwQCb31YakaQI5zXEkpURBK
 0Z716Zxsi3GwwtO+SDZ7Hccwj2p3SPK5bhtfpLMIlNhQxC4LtWCz+up6il+NfMA85JeE
 Da3hvAVIVuypGEbAVUVcG5UrlW0LwkFX3zvOdt1CbzXsD5fLzwKjW6S5rouuZ1jS8ZAk
 +tA+Ep3iKKTtpEERqlWi/8+m5nb1uyPVtl1TURxqNKFp/F+eGj9YcsTLnTO3BwYbi0Ub
 jong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=21/TgqfW8C5BR2/gbvmwEmQNwprc3UPV4NtxlfmGbWs=;
 b=tmhREhJXEuuyae8gR9MoJIktS1Popqr54Njl5gJWmNNH3+Ep1p0W2zxZu72FVNE9ur
 1KIG49XmDji3zVSX/VZrfLVArX6qe+DViVbS548lg8jRrlLt9zQ0qN8sH+lUOD8Yxjhv
 hFoN5srp9fQmhqCcNziDwX6OBa+kHfY6/ssinCpXUkleqBFhjuN5GmFwpUxCfzK4rKXW
 2VUOi3ddFPNUepb67yUEYAc2b091kyBRqJJMipc7Dh9c8AWZMWleA/khQqr85L8ToMqL
 QvmwwsVhMi5lbExIsf+rkd49zzBLrJO3g1FPgLlRu3644eUx+MBtGlwu0fuD2+aedmnA
 WFdw==
X-Gm-Message-State: AOAM533nHDSbGm3LwSVRMMOPA1eQu3GQai7Ogwy1GQr8It85I/+EIqbD
 gtL5VGCuDw8qW4umkCAwgIKLgFX00eU=
X-Google-Smtp-Source: ABdhPJyHNh4k5CQ9Z/Fog1VxO2zmtP4dkix1pcBc83UtD2tT4kEktkC2CCsneIqXl2plhn2CAe4z4A==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr16482034wru.212.1623062265276; 
 Mon, 07 Jun 2021 03:37:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id y26sm6820736wma.33.2021.06.07.03.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 03:37:43 -0700 (PDT)
Subject: Re: [PATCH 10/10] drm/ttm: flip the switch for driver allocated
 resources v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-10-christian.koenig@amd.com>
 <c7163102-61e7-435d-f10a-83ee1926fe1f@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6c2ccd57-73bb-fcc5-a22c-0e6b5be12566@gmail.com>
Date: Mon, 7 Jun 2021 12:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c7163102-61e7-435d-f10a-83ee1926fe1f@shipmail.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.06.21 um 12:15 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 12:09 PM, Christian König wrote:
>> Instead of both driver and TTM allocating memory finalize embedding the
>> ttm_resource object as base into the driver backends.
>>
>> v2: fix typo in vmwgfx grid mgr and double init in amdgpu_vram_mgr.c
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 44 ++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 60 +++++++++----------
>>   drivers/gpu/drm/drm_gem_vram_helper.c         |  3 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 +--
>>   drivers/gpu/drm/nouveau/nouveau_mem.c         | 11 ++--
>>   drivers/gpu/drm/nouveau/nouveau_mem.h         | 14 ++---
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         | 32 +++++-----
>>   drivers/gpu/drm/ttm/ttm_range_manager.c       | 23 +++----
>>   drivers/gpu/drm/ttm/ttm_resource.c            | 18 +-----
>>   drivers/gpu/drm/ttm/ttm_sys_manager.c         | 12 ++--
>>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 24 ++++----
>>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 27 ++++-----
>>   include/drm/ttm/ttm_range_manager.h           |  3 +-
>>   include/drm/ttm/ttm_resource.h                | 43 ++++++-------
>>   16 files changed, 140 insertions(+), 189 deletions(-)
> ...
>>   diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> index ce5d07ca384c..c32e1aee2481 100644
>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -58,7 +58,7 @@ to_range_manager(struct ttm_resource_manager *man)
>>   static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>>                      struct ttm_buffer_object *bo,
>>                      const struct ttm_place *place,
>> -                   struct ttm_resource *mem)
>> +                   struct ttm_resource **res)
>>   {
>>       struct ttm_range_manager *rman = to_range_manager(man);
>>       struct ttm_range_mgr_node *node;
>> @@ -83,37 +83,30 @@ static int ttm_range_man_alloc(struct 
>> ttm_resource_manager *man,
>>         spin_lock(&rman->lock);
>>       ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
>> -                      mem->num_pages, bo->page_alignment, 0,
>> +                      node->base.num_pages,
>> +                      bo->page_alignment, 0,
>>                         place->fpfn, lpfn, mode);
>>       spin_unlock(&rman->lock);
>>   -    if (unlikely(ret)) {
>> +    if (unlikely(ret))
>>           kfree(node);
>> -    } else {
>> -        mem->mm_node = &node->mm_nodes[0];
>> -        mem->start = node->mm_nodes[0].start;
>> -    }
>> +    else
>> +        node->base.start = node->mm_nodes[0].start;
>>         return ret;
>>   }
>
> Looks like this patch forgets to assign *@res. Null pointer derefs 
> when testing i915.

I should really CC the Intel list for TTM patches as well. The CI system 
should have spotted that.

>
> BTW shouldn't we return the struct ttm_resource ptr here rather than 
> passing it as an argument?

Yeah, good idea.

Thanks for the report,
Christian.

>
> /Thomas
>
>

