Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F23A0FEE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 12:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED36E51D;
	Wed,  9 Jun 2021 10:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B10DD6E084
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 10:07:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8891B11FB;
 Wed,  9 Jun 2021 03:07:27 -0700 (PDT)
Received: from [10.57.6.115] (unknown [10.57.6.115])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18C933F719;
 Wed,  9 Jun 2021 03:07:26 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/panfrost: remove spamming to syslog
To: Eero Lehtinen <debiangamer2@gmail.com>, dri-devel@lists.freedesktop.org
References: <CAHS3B0Fuffcs+25vs7M9FM022thvdy2KNLLq9TZA=JE_5LyD7A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <02ddc80c-9104-c426-dfd3-3ea86f25687b@arm.com>
Date: Wed, 9 Jun 2021 11:07:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHS3B0Fuffcs+25vs7M9FM022thvdy2KNLLq9TZA=JE_5LyD7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 2021-06-08 18:18, Eero Lehtinen wrote:
> This patch removes Panfrost spamming messages to syslog that causes a
> poor performance and crashes of the Xfce desktop with a Amlogic S912
> TV box. See the old bug in:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143

There is certainly an argument for demoting the shrinker messages to a 
debug feature, if we're happy that our memory management is mature 
enough that memory pressure issues are no longer a common thing to need 
to spot easily (and especially since msm, from whence that was copied, 
has now taken a similar route with commit fdf38426cda6). The rest, 
however, represent genuine error conditions, so hiding them is 
nonsensical. If the GPU is faulting or locked up, 99% of the time it's 
because the userspace driver has done *something* wrong (for incredibly 
many values of "something"), but there's still the possibility of things 
going wrong in the kernel too. Either way, the bugs only have a hope of 
getting fixed if we know they're happening.

Taking the "this is fine" approach of wilfully ignoring significant 
errors because your particular use-case happens to be able to limp along 
in spite of them might be OK as a local hack, but it is not reasonable 
for the mainline kernel.

Thanks,
Robin.

> Signed-off-by: Eero Lehtinen <debiangamer2 at gmail.com>
> 
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -36,8 +36,8 @@
>       ret = readl_relaxed_poll_timeout_atomic(pfdev->iomem + AS_STATUS(as_nr),
>           val, !(val & AS_STATUS_AS_ACTIVE), 10, 1000);
> 
> -    if (ret)
> -        dev_err(pfdev->dev, "AS_ACTIVE bit stuck\n");
> +    //if (ret)
> +    //    dev_err(pfdev->dev, "AS_ACTIVE bit stuck\n");
> 
>       return ret;
>   }
> 
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -292,8 +292,8 @@
>           prot |= IOMMU_NOEXEC;
> 
>       sgt = drm_gem_shmem_get_pages_sgt(obj);
> -    if (WARN_ON(IS_ERR(sgt)))
> -        return PTR_ERR(sgt);
> +    //if (WARN_ON(IS_ERR(sgt)))
> +    //    return PTR_ERR(sgt);
> 
>       mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
>              prot, sgt);
> 
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -660,7 +660,7 @@
>           ret = -1;
>           if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
>               ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
> -
> +#if 0
>           if (ret)
>               /* terminal fault, print info about the fault */
>               dev_err(pfdev->dev,
> @@ -678,7 +678,7 @@
>                   exception_type, panfrost_exception_name(pfdev, exception_type),
>                   access_type, access_type_name(pfdev, fault_status),
>                   source_id);
> -
> +#endif
>           status &= ~mask;
> 
>           /* If we received new MMU interrupts, process them before returning. */
> 
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -85,8 +85,8 @@
> 
>       mutex_unlock(&pfdev->shrinker_lock);
> 
> -    if (freed > 0)
> -        pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
> +    // if (freed > 0)
> +        // pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
> 
>       return freed;
>   }
> 
