Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3A889C5A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2897C10E772;
	Mon, 25 Mar 2024 11:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16DEC10E79E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:17:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 580B91FB;
 Mon, 25 Mar 2024 04:17:56 -0700 (PDT)
Received: from [10.57.15.178] (unknown [10.57.15.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AECF33F67D;
 Mon, 25 Mar 2024 04:17:21 -0700 (PDT)
Message-ID: <d10e71ec-0c1f-4d32-b8f5-53abc3aeba9f@arm.com>
Date: Mon, 25 Mar 2024 11:17:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panthor: Actually suspend IRQs in the unplug path
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240325104111.3553712-1-boris.brezillon@collabora.com>
 <20240325104111.3553712-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240325104111.3553712-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 25/03/2024 10:41, Boris Brezillon wrote:
> panthor_xxx_irq_suspend() doesn't mask the interrupts if drm_dev_unplug()
> has been called, which is always the case when our panthor_xxx_unplug()
> helpers are called. Fix that by introducing a panthor_xxx_unplug() helper
> that does what panthor_xxx_irq_suspend() except it does it
> unconditionally.
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Found inadvertently while debugging another issue. I guess I managed to
> call rmmod during a PING and that led to the FW interrupt handler
> being executed after the device suspend happened.
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 8 ++++++++
>  drivers/gpu/drm/panthor/panthor_fw.c     | 2 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 2 +-
>  4 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 51c9d61b6796..ba43d5ea4e96 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -321,6 +321,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  	return ret;										\
>  }												\
>  												\
> +static inline void panthor_ ## __name ## _irq_unplug(struct panthor_irq *pirq)			\
> +{												\
> +	pirq->mask = 0;										\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> +	synchronize_irq(pirq->irq);								\
> +	atomic_set(&pirq->suspended, true);							\
> +}												\
> +												\

This does things in a different order to _irq_suspend, is there a good
reason?
I'd expect:

{
	atomic_set(&pirq->suspended, true);
	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);
	synchronize_irq(pirq->irq);
	pirq->mask = 0;
}

In particular I'm wondering if having the atomic_set after
synchronize_irq() could cause problems with an irq handler changing the
INT_MASK again (although AFAICT it should end up setting it to 0).

Otherwise this change looks good.

Thanks,

Steve

>  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
>  {												\
>  	int cookie;										\
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 33c87a59834e..7a9710a38c5f 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1128,7 +1128,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  
>  	/* Make sure the IRQ handler can be called after that point. */
>  	if (ptdev->fw->irq.irq)
> -		panthor_job_irq_suspend(&ptdev->fw->irq);
> +		panthor_job_irq_unplug(&ptdev->fw->irq);
>  
>  	panthor_fw_stop(ptdev);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 6dbbc4cfbe7e..b84c5b650fd9 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -174,7 +174,7 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
>  	unsigned long flags;
>  
>  	/* Make sure the IRQ handler is not running after that point. */
> -	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
> +	panthor_gpu_irq_unplug(&ptdev->gpu->irq);
>  
>  	/* Wake-up all waiters. */
>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index fdd35249169f..1f333cdded0f 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2622,7 +2622,7 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
>   */
>  void panthor_mmu_unplug(struct panthor_device *ptdev)
>  {
> -	panthor_mmu_irq_suspend(&ptdev->mmu->irq);
> +	panthor_mmu_irq_unplug(&ptdev->mmu->irq);
>  
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {

