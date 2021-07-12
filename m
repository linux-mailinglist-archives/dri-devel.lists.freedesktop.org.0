Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29D3C4643
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5252089BF0;
	Mon, 12 Jul 2021 09:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F9389BC2;
 Mon, 12 Jul 2021 09:30:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id g12so3103622wme.2;
 Mon, 12 Jul 2021 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rzwaIY/VFnUyMfhzj59jkaDLBWOWqAzSRot24W2OwmU=;
 b=rJrdD4sMeRIFAwkMdefQQIbfhYvhHg2UNsHbMVop8KlbyPs6FvIGheUHE7WO6BsThe
 7tpa/t42yfLgUgK0OcqsUP8Wgu8Ab9UBGRGxHPS7A8XGN6NNnIRHvgVPaZVC7xZz4nhZ
 Z8W0bLuVcNUSZN2UiqIM4EqIy3ZjO25sgMF/PppAPTGM4fTyPsD7aUkIUcdL8FeMjM3u
 io27La5y6XaTmhXRfEgZdVv17PT4MjSXskJYfwRcVfwmlnTFn+9QkdRoC7Yv4e+TN53a
 Es6Bgfj7+dO+exGI1pJsRC0/Q/IK3jYUfZ6APLm9OQAILGyosjnv76+/B7bBrIzKx8U2
 M+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rzwaIY/VFnUyMfhzj59jkaDLBWOWqAzSRot24W2OwmU=;
 b=qurKoh79UlcaqWdF7tZmJI8dpIwujxbkV7u9rJKTbPndguskLM2SnFCmHjN6lY0BCH
 JxEeIa1sgvF0WBmOIrBhDO7WV8Paq10P/dQdLbexKBRFCS+skII5ZHznBkUKL1QUuAM9
 80XNvXdH+2Lz1/oB1H7+Pfaf/E4EgC3JZgTbF410zl2xEaofVqzveOA8xSYgKIcCNtJN
 sWOOC3RqF2Y10KH/Fbf/5nud5W24pG9x9JqEdrGhO7qP8K9NGJ+s0mUljHmgEjvCD323
 cyzPZArAAG9izRVZYMH9eGAyyUv4es05U+zYrjNLpHprfcRGXtOVuKsswZf7nWoEGz2I
 IuCw==
X-Gm-Message-State: AOAM533ujw6ZNOM3m0yIOSnCyJK5RZgO/Z2KieG/SxI+n99bG6Qygxiq
 OLViyJYF2MER9YctOwBeKvM=
X-Google-Smtp-Source: ABdhPJytvuapcHjuAGOsV/jc6SFcP3yDNgT3UnIYjc55uWsqkDGGI6jqr0tPEhI9q62xOuJlNVwl/Q==
X-Received: by 2002:a1c:de88:: with SMTP id v130mr30376086wmg.98.1626082232863; 
 Mon, 12 Jul 2021 02:30:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e521:a414:2ae6:6045?
 ([2a02:908:1252:fb60:e521:a414:2ae6:6045])
 by smtp.gmail.com with ESMTPSA id u12sm13854487wrt.50.2021.07.12.02.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 02:30:32 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/ttm: Fix COW check
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210710002837.366942-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <451bce41-9225-1582-d448-bc8ed4f70772@gmail.com>
Date: Mon, 12 Jul 2021 11:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710002837.366942-1-Felix.Kuehling@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.07.21 um 02:28 schrieb Felix Kuehling:
> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> is_cow_mapping returns true for these mappings. Add a check for
> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> PROT_NONE mappings.
>
> v2: protect against mprotect making a mapping writable after the fact
>
> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..9ad211ede611 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -542,17 +542,28 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_access);
>   
> +static int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> +			      unsigned long end, unsigned long newflags)
> +{
> +	/* Enforce no COW since would have really strange behavior with it. */
> +	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>   static const struct vm_operations_struct ttm_bo_vm_ops = {
>   	.fault = ttm_bo_vm_fault,
>   	.open = ttm_bo_vm_open,
>   	.close = ttm_bo_vm_close,
>   	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect,

The problem is most drivers implement their own copy of this structure.

You need to add this to those occasions as well, just search for 
references to ttm_bo_vm_open.

Regards,
Christian.

>   };
>   
>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>   {
>   	/* Enforce no COW since would have really strange behavior with it. */
> -	if (is_cow_mapping(vma->vm_flags))
> +	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>   		return -EINVAL;
>   
>   	ttm_bo_get(bo);

