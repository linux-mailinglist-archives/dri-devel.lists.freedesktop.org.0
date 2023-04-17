Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359276E48EC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8B310E4B3;
	Mon, 17 Apr 2023 12:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F9A510E4A9;
 Mon, 17 Apr 2023 12:59:46 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:55930.1095974768
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id E813C10028A;
 Mon, 17 Apr 2023 20:59:39 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 25616508114342569af24e7cf09d6c0c for l.stach@pengutronix.de; 
 Mon, 17 Apr 2023 20:59:42 CST
X-Transaction-ID: 25616508114342569af24e7cf09d6c0c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <1b9c2895-3200-22dd-9708-cd718ce5ac99@189.cn>
Date: Mon, 17 Apr 2023 20:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/etnaviv: fix dumping of active MMU context
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230414143810.572237-1-l.stach@pengutronix.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230414143810.572237-1-l.stach@pengutronix.de>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well, this patch looks good to me!

On 2023/4/14 22:38, Lucas Stach wrote:
> gpu->mmu_context is the MMU context of the last job in the HW queue, which
> isn't necessarily the same as the context from the bad job. Dump the MMU
> context from the scheduler determined bad submit to make it work as intended.
>
> Fixes: 17e4660ae3d7 ("drm/etnaviv: implement per-process address spaces on MMUv2")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_dump.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> index 44b5f3c35aab..898f84a0fc30 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -130,9 +130,9 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
>   		return;
>   	etnaviv_dump_core = false;
>   
> -	mutex_lock(&gpu->mmu_context->lock);
> +	mutex_lock(&submit->mmu_context->lock);
>   
> -	mmu_size = etnaviv_iommu_dump_size(gpu->mmu_context);
> +	mmu_size = etnaviv_iommu_dump_size(submit->mmu_context);
>   
>   	/* We always dump registers, mmu, ring, hanging cmdbuf and end marker */
>   	n_obj = 5;
> @@ -162,7 +162,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
>   	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
>   			__GFP_NORETRY);
>   	if (!iter.start) {
> -		mutex_unlock(&gpu->mmu_context->lock);
> +		mutex_unlock(&submit->mmu_context->lock);
>   		dev_warn(gpu->dev, "failed to allocate devcoredump file\n");
>   		return;
>   	}
> @@ -174,18 +174,18 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
>   	memset(iter.hdr, 0, iter.data - iter.start);
>   
>   	etnaviv_core_dump_registers(&iter, gpu);
> -	etnaviv_core_dump_mmu(&iter, gpu->mmu_context, mmu_size);
> +	etnaviv_core_dump_mmu(&iter, submit->mmu_context, mmu_size);
>   	etnaviv_core_dump_mem(&iter, ETDUMP_BUF_RING, gpu->buffer.vaddr,
>   			      gpu->buffer.size,
>   			      etnaviv_cmdbuf_get_va(&gpu->buffer,
> -					&gpu->mmu_context->cmdbuf_mapping));
> +					&submit->mmu_context->cmdbuf_mapping));
>   
>   	etnaviv_core_dump_mem(&iter, ETDUMP_BUF_CMD,
>   			      submit->cmdbuf.vaddr, submit->cmdbuf.size,
>   			      etnaviv_cmdbuf_get_va(&submit->cmdbuf,
> -					&gpu->mmu_context->cmdbuf_mapping));
> +					&submit->mmu_context->cmdbuf_mapping));
>   
> -	mutex_unlock(&gpu->mmu_context->lock);
> +	mutex_unlock(&submit->mmu_context->lock);
>   
>   	/* Reserve space for the bomap */
>   	if (n_bomap_pages) {
