Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB346EEA1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955A10E8B9;
	Thu,  9 Dec 2021 16:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D2F89F2D;
 Thu,  9 Dec 2021 07:54:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id i12so3459163wmq.4;
 Wed, 08 Dec 2021 23:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YXJndMpjkY51R7vVxhqGqqKndMXB5liIkpS6VEDt38I=;
 b=FBh0aV1w/8jpXUnOqck3g5qcdQcjkQ5+P4oGSKoCNUNHcanQECIt0PZU84FU1m1fxZ
 BDieP60TWaq6GDSAPxgFEMvBZjtmPq5y8TziTF89NRHVBRYiNMAMhBi1Cu8JLpcv6ETb
 ptWcJpYF1RJL1+9Y/1ziJt+7WYVAEC4F55UYgpYWuCHY1bkA79mHtxu2UFJnR+t+gSf5
 MIWAS8VvEnwGMvlzHKXSAfZ80OzYRSKKmrn2HUWhIgOUggaggnYxBuSVJLMtXpHIcLbm
 85RN8E59RdB59YGyER4R9gKp9LevnKGsf7uGsQ2AArmy6wlQMhwKMykGaupASLzlrCb9
 dHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YXJndMpjkY51R7vVxhqGqqKndMXB5liIkpS6VEDt38I=;
 b=20G/bs8GXEqHf3cF/kupdxElAHXAPKXRMdJffj+5BdmJvTyzBb7oOk/318eHS97pAr
 sF6Hz9hPEPABbd9F6uFUsotC4f8zjozmKIZW8/9eQQFmm0GyQZZeNX9gJuPAEzbCIx7u
 VUtvHvLgUFgvJRcmnCxIZN35DGckwp3MrxiLyICRH36v1si40/GawJa1jYGYaE2pYueH
 wHLywv9p3S/dwBNHNB7pFJ4+T76XcvoGp23rGRj45BvV3lX90JjZ2PDCDoTAyUCb5E2D
 RlwbfEXOxz2Kf6jfzblokDQd8ZfA7MKO9F0hm3Dv8E5+lUODLNC5uWYZzfDzlq9+wJLq
 hR9Q==
X-Gm-Message-State: AOAM531EDKTirOLCwGDHFk1RhECEIjI9NuWfdl8b1ZbkPoRiGvpV8gVN
 7gGfvLFSvbpRdTud5puNi/qzbit48y8=
X-Google-Smtp-Source: ABdhPJxUoEToWNu7AxtQs8naW0HYkWKxi3yW2B9+xXmGB/t5RmIWALl4IWR1hiqGeQYiy+mya7XPIw==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr4885031wmf.149.1639036456059; 
 Wed, 08 Dec 2021 23:54:16 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:2e35:ddd6:f296:528?
 ([2a02:908:1252:fb60:2e35:ddd6:f296:528])
 by smtp.gmail.com with ESMTPSA id l5sm7784668wms.16.2021.12.08.23.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 23:54:15 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
Date: Thu, 9 Dec 2021 08:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
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
Cc: daniel.vetter@ffwll.ch, Felix Kuehling <Felix.Kuehling@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
> When an application having open file access to a node forks, its shared
> mappings also get reflected in the address space of child process even
> though it cannot access them with the object permissions applied. With the
> existing permission checks on the gem objects, it might be reasonable to
> also create the VMAs with VM_DONTCOPY flag so a user space application
> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
> system call to prevent the pages in the mapped range to appear in the
> address space of the child process. It also prevents the memory leaks
> due to additional reference counts on the mapped BOs in the child
> process that prevented freeing the memory in the parent for which we had
> worked around earlier in the user space inside the thunk library.
>
> Additionally, we faced this issue when using CRIU to checkpoint restore
> an application that had such inherited mappings in the child which
> confuse CRIU when it mmaps on restore. Having this flag set for the
> render node VMAs helps. VMAs mapped via KFD already take care of this so
> this is needed only for the render nodes.

Unfortunately that is most likely a NAK. We already tried something similar.

While it is illegal by the OpenGL specification and doesn't work for 
most userspace stacks, we do have some implementations which call fork() 
with a GL context open and expect it to work.

Regards,
Christian.

>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/drm_gem.c       | 3 ++-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 09c820045859..d9c4149f36dd 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>   			goto err_drm_gem_object_put;
>   		}
>   
> -		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
> +		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
> +				| VM_DONTDUMP | VM_DONTCOPY;
>   		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>   		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 33680c94127c..420a4898fdd2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>   
>   	vma->vm_private_data = bo;
>   
> -	vma->vm_flags |= VM_PFNMAP;
> +	vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>   	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>   	return 0;
>   }

