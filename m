Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA63B4738
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E56A6EE08;
	Fri, 25 Jun 2021 16:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B79F66EE08
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:10:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21FB1063;
 Fri, 25 Jun 2021 09:10:26 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74323F719;
 Fri, 25 Jun 2021 09:10:25 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] drm/panfrost: Disable the AS on unhandled page
 faults
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-12-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6301ae2a-56fc-9f1a-d22d-3524dfc6886a@arm.com>
Date: Fri, 25 Jun 2021 17:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625133327.2598825-12-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2021 14:33, Boris Brezillon wrote:
> If we don't do that, we have to wait for the job timeout to expire
> before the fault jobs gets killed.
> 
> v3:
> * Make sure the AS is re-enabled when new jobs are submitted to the
>   context
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 34 ++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index bfe32907ba6b..efe9a675b614 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -96,6 +96,7 @@ struct panfrost_device {
>  	spinlock_t as_lock;
>  	unsigned long as_in_use_mask;
>  	unsigned long as_alloc_mask;
> +	unsigned long as_faulty_mask;
>  	struct list_head as_lru_list;
>  
>  	struct panfrost_job_slot *js;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index b4f0c673cd7f..65e98c51cb66 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -154,6 +154,7 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>  	as = mmu->as;
>  	if (as >= 0) {
>  		int en = atomic_inc_return(&mmu->as_count);
> +		u32 mask = BIT(as) | BIT(16 + as);
>  
>  		/*
>  		 * AS can be retained by active jobs or a perfcnt context,
> @@ -162,6 +163,18 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>  		WARN_ON(en >= (NUM_JOB_SLOTS + 1));
>  
>  		list_move(&mmu->list, &pfdev->as_lru_list);
> +
> +		if (pfdev->as_faulty_mask & mask) {
> +			/* Unhandled pagefault on this AS, the MMU was
> +			 * disabled. We need to re-enable the MMU after
> +			 * clearing+unmasking the AS interrupts.
> +			 */
> +			mmu_write(pfdev, MMU_INT_CLEAR, mask);
> +			mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
> +			pfdev->as_faulty_mask &= ~mask;
> +			panfrost_mmu_enable(pfdev, mmu);
> +		}
> +
>  		goto out;
>  	}
>  
> @@ -211,6 +224,7 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
>  	spin_lock(&pfdev->as_lock);
>  
>  	pfdev->as_alloc_mask = 0;
> +	pfdev->as_faulty_mask = 0;
>  
>  	list_for_each_entry_safe(mmu, mmu_tmp, &pfdev->as_lru_list, list) {
>  		mmu->as = -1;
> @@ -662,7 +676,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  		if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
>  			ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
>  
> -		if (ret)
> +		if (ret) {
>  			/* terminal fault, print info about the fault */
>  			dev_err(pfdev->dev,
>  				"Unhandled Page fault in AS%d at VA 0x%016llX\n"
> @@ -680,14 +694,28 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  				access_type, access_type_name(pfdev, fault_status),
>  				source_id);
>  
> +			spin_lock(&pfdev->as_lock);
> +			/* Ignore MMU interrupts on this AS until it's been
> +			 * re-enabled.
> +			 */
> +			pfdev->as_faulty_mask |= mask;
> +
> +			/* Disable the MMU to kill jobs on this AS. */
> +			panfrost_mmu_disable(pfdev, as);
> +			spin_unlock(&pfdev->as_lock);
> +		}
> +
>  		status &= ~mask;
>  
>  		/* If we received new MMU interrupts, process them before returning. */
>  		if (!status)
> -			status = mmu_read(pfdev, MMU_INT_RAWSTAT);
> +			status = mmu_read(pfdev, MMU_INT_RAWSTAT) & ~pfdev->as_faulty_mask;
>  	}
>  
> -	mmu_write(pfdev, MMU_INT_MASK, ~0);
> +	spin_lock(&pfdev->as_lock);
> +	mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
> +	spin_unlock(&pfdev->as_lock);
> +
>  	return IRQ_HANDLED;
>  };
>  
> 

