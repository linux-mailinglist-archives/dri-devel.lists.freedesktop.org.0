Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F083C8C4836
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 22:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A2B10E96C;
	Mon, 13 May 2024 20:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HrKfrlGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F5310E96B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715632098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRV0/kZnsOYqLxnwJKcY0uUORkzrQGCo3ZM6tSiKRfg=;
 b=HrKfrlGMo1u4R2owh5QvHMN1vmVoHwMNM2BSFXK/G0ITivDKkEQWU6m+BYSsLs47xiOAc8
 OKqPHk/mJ4n40hla/yfo0z735+sudHRuG/8x5yKqgg23U7qs2siAMFXpOWTTQIR0J4QAc/
 R1ryX7Vt8q2CxDMl5LYuUL4WN9kzJkE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-S84mHzMAOqiFHx6CJnYbiA-1; Mon, 13 May 2024 16:28:17 -0400
X-MC-Unique: S84mHzMAOqiFHx6CJnYbiA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5222a0800f0so3219749e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715632095; x=1716236895;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRV0/kZnsOYqLxnwJKcY0uUORkzrQGCo3ZM6tSiKRfg=;
 b=ORmCVzWdYRj5EdPsBBXgjVBwPprG5JNZh+qcRxzay/4vXLc76BihDpQAncO2rBla69
 ++VuX9jYEJHTqAj+bOuQ/Z3Bab8NwnRh3Ukf9TTzNIa5U1HqmqpQQ2ebaJhAGmTjMj2M
 PXoDEghXhcwvRXwflfMe1LMBnI8k63wds0BnAzg+hmpmkMiGeRWN8GBiY2QuG2hemMSr
 29m1Grv0ftntA3eXZyLrma2m1DE+tztBkrTT1HCTrmOHr6c/WSLTOBC5zYvZ2lFWu4gR
 Q3r3Rwf3W8EWn8ZpJB3G4OjgSKtYHmcPBpUQFLh26fmaZlnZ92wnzQ61G6XEOM+xkorK
 a4vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0VaOJ/KtKU0uG3jKgX+rL1RP0CEsGc4P5vSYd91xlsor2cZ0FH0i4xVvX9LBzpgcUlWfFbOGJvQbxC5Mfxq3btpL9rKKl9XMofLyei2M
X-Gm-Message-State: AOJu0Yz8j69Qs2pBfJVKlYxO+yDmvFZf89xLJyQAPWJAW6nvHq4VzHwU
 8rRUOGq2dyBSWM2Q8zOC3P3Ra5E5hl82byoE+cHgWaH02PJcWEPxesXMEDNa/HOuQEG/Ix3TGvw
 tfIuiQO8cg5eXVhVXnjsbH1LCLuE3jhFxk9Y6wnha8ptZH/YiHli24T3SKm7feVk5N7O5rBeOuw
 ==
X-Received: by 2002:a05:6512:2f0:b0:51f:c112:9d7d with SMTP id
 2adb3069b0e04-5220fe7aa98mr9229216e87.41.1715632095156; 
 Mon, 13 May 2024 13:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfjBOcPm1uxEwEiepuGhg4/Px2qQuJrOChU0pegeoPZFZF+WPKV1u3aRLD4S//oDSUvs4zBg==
X-Received: by 2002:a05:6512:2f0:b0:51f:c112:9d7d with SMTP id
 2adb3069b0e04-5220fe7aa98mr9229198e87.41.1715632094681; 
 Mon, 13 May 2024 13:28:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1789242csm636903766b.66.2024.05.13.13.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 13:28:14 -0700 (PDT)
Message-ID: <3c074a02-15ad-4d16-a21b-39af24ffadc6@redhat.com>
Date: Mon, 13 May 2024 22:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, airlied@redhat.com,
 Faith Ekstrand <faith@gfxstrand.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mohamed,

Thank you for fixing this up!

On 5/9/24 22:43, Mohamed Ahmed wrote:
> Allows PTE kind and tile mode on BO create with VM_BIND,
> and adds a GETPARAM to indicate this change. This is needed to support

It's usually better to use imperative verb form for commit messages. No
need to send a new version though.

> modifiers in NVK and ensure correctness when dealing with the nouveau
> GL driver.
> 
> The userspace modifiers implementation this is for can be found here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24795
> 
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>

Applied to drm-misc-next-fixes.

Generally, please make sure to use scripts/get_maintainer.pl before sending
patches.

- Danilo

> ---
>   drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
>   drivers/gpu/drm/nouveau/nouveau_bo.c    | 44 +++++++++++--------------
>   include/uapi/drm/nouveau_drm.h          |  7 ++++
>   3 files changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 80f74ee0f..47e53e17b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>   		getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
>   		break;
>   	}
> +	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
> +		getparam->value = 1;
> +		break;
>   	default:
>   		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
>   		return -EINVAL;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index db8cbf615..186add400 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
>   	}
>   
>   	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
> -	if (!nouveau_cli_uvmm(cli) || internal) {
> -		/* for BO noVM allocs, don't assign kinds */
> -		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
> -			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
> -			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -				kfree(nvbo);
> -				return ERR_PTR(-EINVAL);
> -			}
>   
> -			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
> -		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> -			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
> -			nvbo->comp = (tile_flags & 0x00030000) >> 16;
> -			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -				kfree(nvbo);
> -				return ERR_PTR(-EINVAL);
> -			}
> -		} else {
> -			nvbo->zeta = (tile_flags & 0x00000007);
> +	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
> +		nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
> +		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +			kfree(nvbo);
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
> +	} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> +		nvbo->kind = (tile_flags & 0x00007f00) >> 8;
> +		nvbo->comp = (tile_flags & 0x00030000) >> 16;
> +		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +			kfree(nvbo);
> +			return ERR_PTR(-EINVAL);
>   		}
> -		nvbo->mode = tile_mode;
> +	} else {
> +		nvbo->zeta = (tile_flags & 0x00000007);
> +	}
> +	nvbo->mode = tile_mode;
>   
> +	if (!nouveau_cli_uvmm(cli) || internal) {
>   		/* Determine the desirable target GPU page size for the buffer. */
>   		for (i = 0; i < vmm->page_nr; i++) {
>   			/* Because we cannot currently allow VMM maps to fail
> @@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
>   		}
>   		nvbo->page = vmm->page[pi].shift;
>   	} else {
> -		/* reject other tile flags when in VM mode. */
> -		if (tile_mode)
> -			return ERR_PTR(-EINVAL);
> -		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
> -			return ERR_PTR(-EINVAL);
> -
>   		/* Determine the desirable target GPU page size for the buffer. */
>   		for (i = 0; i < vmm->page_nr; i++) {
>   			/* Because we cannot currently allow VMM maps to fail
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index cd84227f1..5402f77ee 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -68,6 +68,13 @@ extern "C" {
>    */
>   #define NOUVEAU_GETPARAM_VRAM_USED 19
>   
> +/*
> + * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
> + *
> + * Query whether tile mode and PTE kind are accepted with VM allocs or not.
> + */
> +#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20
> +
>   struct drm_nouveau_getparam {
>   	__u64 param;
>   	__u64 value;

