Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76351AA7454
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 16:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2826D10E93B;
	Fri,  2 May 2025 14:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UWIqJ38B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D12910E1C8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746194498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QZz4S4cWzt2EIgPINY74wc3mL272EL4YYNP4eiS6Ss=;
 b=UWIqJ38BsjdFaG6pArNUc30CSegZHYqpPPVgeeZrPK4taIiI2QxNMGimPeeWIcisvf2988
 KnS1H5ba0hdjy0qzQ7H2u5W8ysaJA7/pekpr3EtVXQgF+2+V+t78JVgHjQw4c41CcnaJIr
 +5ND1FKGN667n2HvAvpJmH930wwK6M0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-GqbdVwNqP72CqhJShPAcKA-1; Fri, 02 May 2025 10:01:36 -0400
X-MC-Unique: GqbdVwNqP72CqhJShPAcKA-1
X-Mimecast-MFC-AGG-ID: GqbdVwNqP72CqhJShPAcKA_1746194496
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so314942385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 07:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746194496; x=1746799296;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6QZz4S4cWzt2EIgPINY74wc3mL272EL4YYNP4eiS6Ss=;
 b=DbAnqRaNJRV3NCL1K2GWpNFg/p4Ttu7GsHJfM0mPvrhWx1SlY+0U6JsRlqmmTwc1Py
 VKcYCnsykWPDq2KhqNHj5c3A9lLROdlyvpGt/pD8aBYQoBOE1NQmwT9uwKFka0KEdzNt
 lZl+QHzU4px0cq1YeZnz5+iWnW8xKkzJc1jzEJDHjPJHBuaKNOrVGAWyjMHYWFTlFoe3
 yBH/BEiX0xsT1nkbGyslJeRw82xyfSdoUHjV3Eg+O/J46Ex3FVTYHQrtARwqox2m+EIq
 yoPmsplAAA0FNQeumxBn0t5m4Y+jC8zCpSj0CnXKZy3vNjEkul35ttPoENnvNQrfe/GW
 +kxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjNWMp0y6hP454E4vikdjjpFMbHl5qTT2EzENpoSDjTpfmHO2oKTf8Vd/AHcs7d850sUVpDPISFik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXYhcnX4QiinUT1UTNXguMmzP9qe3zbX3yyr8eErvGEQKGBy6P
 ixd4mDTiMl0aLyLNUCgVvdHH5nP2JqUkvJd0wWHm9KUINDFa79TjrwX5ml7a1mPMpnDgeUNsOnF
 /lYD3eWvT/UWpx6Zdv+LiV+2gPLda6VU7Pfh/CIRw0dumTBCH+VpWvfT7NkoWP8Yfog==
X-Gm-Gg: ASbGncuGDAQ1Gxgfeud2lUT4Zvphy6uhDKf1UuH95sGeKWpBYaPVj8bfknkfUS6sP86
 51cxjFZtGjM4DlFHsVxkcH0H58c4eg7lOyJaIfD6QwR9BFiNFuyjQYNX8HcbZRJdyg5J5/QaoFe
 yXLF3qXtBobq8pvyJLh2h8rxrouGahbHmzFrXfrY+XCRWahLEUTfhkxPajXFnbEAmkj/8jKg8cG
 PBQkkZ5811T1eVe5Ou6zoYijfhgjB7gzejgRWUPMn63yCBojZ6si5kLRSZJXL6cPpbZTxcpdqsz
 +bzHcuF6fqtftHf9gZfqw72cyUIijD+kEGMZ+tBzfnAIM9yt6ne2XiRjkQ==
X-Received: by 2002:a05:620a:3903:b0:7c5:5cc4:ca5c with SMTP id
 af79cd13be357-7cad5b37f5fmr399937085a.14.1746194495624; 
 Fri, 02 May 2025 07:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvvZC6v/MZkMsfWnuLwYoRrddDSebhNb7DaQhU9zKCm8hvUk3PXEZuMy15QDCTf23j4GNgWg==
X-Received: by 2002:a05:620a:3903:b0:7c5:5cc4:ca5c with SMTP id
 af79cd13be357-7cad5b37f5fmr399932385a.14.1746194495083; 
 Fri, 02 May 2025 07:01:35 -0700 (PDT)
Received: from ?IPV6:2601:188:c102:9c40:1f42:eb97:44d3:6e9a?
 ([2601:188:c102:9c40:1f42:eb97:44d3:6e9a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cad23b5c40sm185824585a.23.2025.05.02.07.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 07:01:34 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <e33a6df8-bfa6-4a67-a7f1-21a91a0dd9db@redhat.com>
Date: Fri, 2 May 2025 10:01:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] amdgpu: add support for memcg integration
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com, Johannes Weiner
 <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250502034046.1625896-5-airlied@gmail.com>
In-Reply-To: <20250502034046.1625896-5-airlied@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ojpluWvyYe3BpADf66lEcAl_PyRq7cAVS_JkEXS_jc_1746194496
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

On 5/1/25 11:36 PM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> This adds the memcg object for any user allocated object,
> and adds account_op to necessary paths which might populate
> a tt object.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     |  7 ++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 14 +++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
>   4 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 82df06a72ee0..1a275224b4a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -787,6 +787,7 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = true,
>   		.no_wait_gpu = false,
> +		.account_op = true,
>   		.resv = bo->tbo.base.resv
>   	};
>   	uint32_t domain;
> @@ -839,7 +840,11 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   				union drm_amdgpu_cs *cs)
>   {
>   	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
> -	struct ttm_operation_ctx ctx = { true, false };
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = true,
> +		.no_wait_gpu = false,
> +		.account_op = true,
> +	};
>   	struct amdgpu_vm *vm = &fpriv->vm;
>   	struct amdgpu_bo_list_entry *e;
>   	struct drm_gem_object *obj;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 69429df09477..bdad9a862ed3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -89,6 +89,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>   	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>   
>   	amdgpu_hmm_unregister(aobj);
> +	mem_cgroup_put(aobj->tbo.memcg);
>   	ttm_bo_put(&aobj->tbo);
>   }
>   
> @@ -116,6 +117,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   	bp.domain = initial_domain;
>   	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>   	bp.xcp_id_plus1 = xcp_id_plus1;
> +	bp.memcg = get_mem_cgroup_from_mm(current->mm);
>   
>   	r = amdgpu_bo_create_user(adev, &bp, &ubo);
>   	if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 0b9987781f76..777cf05ebac8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -632,6 +632,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = (bp->type != ttm_bo_type_kernel),
>   		.no_wait_gpu = bp->no_wait_gpu,
> +		.account_op = true,
>   		/* We opt to avoid OOM on system pages allocations */
>   		.gfp_retry_mayfail = true,
>   		.allow_res_evict = bp->type != ttm_bo_type_kernel,
> @@ -657,16 +658,21 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   		size = ALIGN(size, PAGE_SIZE);
>   	}
>   
> -	if (!amdgpu_bo_validate_size(adev, size, bp->domain))
> +	if (!amdgpu_bo_validate_size(adev, size, bp->domain)) {
> +		mem_cgroup_put(bp->memcg);
You should clear bp->memcg after mem_cgroup_put() to avoid stalled 
reference as memcg can go away after that.
>   		return -ENOMEM;
> +	}
>   
>   	BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo));
>   
>   	*bo_ptr = NULL;
>   	bo = kvzalloc(bp->bo_ptr_size, GFP_KERNEL);
> -	if (bo == NULL)
> +	if (bo == NULL) {
> +		mem_cgroup_put(bp->memcg);

Ditto.

Cheers,
Longman

>   		return -ENOMEM;
> +	}
>   	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
> +	bo->tbo.memcg = bp->memcg;
>   	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
>   	bo->vm_bo = NULL;
>   	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
> @@ -1341,7 +1347,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
> -	struct ttm_operation_ctx ctx = { false, false };
> +	struct ttm_operation_ctx ctx = { .interruptible = false,
> +					 .no_wait_gpu = false,
> +					 .account_op = true };
>   	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>   	int r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 375448627f7b..9a4c506cfb76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -55,6 +55,7 @@ struct amdgpu_bo_param {
>   	enum ttm_bo_type		type;
>   	bool				no_wait_gpu;
>   	struct dma_resv			*resv;
> +	struct mem_cgroup               *memcg;
>   	void				(*destroy)(struct ttm_buffer_object *bo);
>   	/* xcp partition number plus 1, 0 means any partition */
>   	int8_t				xcp_id_plus1;

