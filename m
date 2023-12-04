Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00A803A5E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4510E331;
	Mon,  4 Dec 2023 16:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB63B10E369
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:34:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8030F152B;
 Mon,  4 Dec 2023 08:35:43 -0800 (PST)
Received: from [10.57.74.48] (unknown [10.57.74.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC8CF3F6C4;
 Mon,  4 Dec 2023 08:34:53 -0800 (PST)
Message-ID: <8f7d0a66-c491-4fa4-87fe-0fd6b72509a8@arm.com>
Date: Mon, 4 Dec 2023 16:34:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231204114215.54575-1-angelogioacchino.delregno@collabora.com>
 <20231204114215.54575-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204114215.54575-4-angelogioacchino.delregno@collabora.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 11:42, AngeloGioacchino Del Regno wrote:
> To make sure that we don't unintentionally perform any unclocked and/or
> unpowered R/W operation on GPU registers, before turning off clocks and
> regulators we must make sure that no GPU, JOB or MMU ISR execution is
> pending: doing that requires to add a mechanism to synchronize the
> interrupts on suspend.
> 
> Add functions panfrost_{gpu,job,mmu}_suspend_irq() which will perform
> interrupts masking and ISR execution synchronization, and then call
> those in the panfrost_device_runtime_suspend() handler in the exact
> sequence of job (may require mmu!) -> mmu -> gpu.
> 
> As a side note, JOB and MMU suspend_irq functions needed some special
> treatment: as their interrupt handlers will unmask interrupts, it was
> necessary to add an `is_suspended` bitmap which is used to address the
> possible corner case of unintentional IRQ unmasking because of ISR
> execution after a call to synchronize_irq().
> 
> At resume, clear each is_suspended bit in the reset path of JOB/MMU
> to allow unmasking the interrupts.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_device.h |  8 +++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 18 +++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 26 ++++++++++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 22 +++++++++++++++---
>  drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
>  8 files changed, 71 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index c90ad5ee34e7..a45e4addcc19 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -421,6 +421,9 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>  		return -EBUSY;
>  
>  	panfrost_devfreq_suspend(pfdev);
> +	panfrost_job_suspend_irq(pfdev);
> +	panfrost_mmu_suspend_irq(pfdev);
> +	panfrost_gpu_suspend_irq(pfdev);
>  	panfrost_gpu_power_off(pfdev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 54a8aad54259..62f7e3527385 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -25,6 +25,13 @@ struct panfrost_perfcnt;
>  #define NUM_JOB_SLOTS 3
>  #define MAX_PM_DOMAINS 5
>  
> +enum panfrost_drv_comp_bits {
> +	PANFROST_COMP_BIT_GPU,
> +	PANFROST_COMP_BIT_JOB,
> +	PANFROST_COMP_BIT_MMU,
> +	PANFROST_COMP_BIT_MAX
> +};
> +
>  /**
>   * enum panfrost_gpu_pm - Supported kernel power management features
>   * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
> @@ -109,6 +116,7 @@ struct panfrost_device {
>  
>  	struct panfrost_features features;
>  	const struct panfrost_compatible *comp;
> +	DECLARE_BITMAP(is_suspended, PANFROST_COMP_BIT_MAX);
>  
>  	spinlock_t as_lock;
>  	unsigned long as_in_use_mask;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 7adc4441fa14..9063ce254642 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -22,9 +22,13 @@
>  static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
>  {
>  	struct panfrost_device *pfdev = data;
> -	u32 state = gpu_read(pfdev, GPU_INT_STAT);
> -	u32 fault_status = gpu_read(pfdev, GPU_FAULT_STATUS);
> +	u32 fault_status, state;
>  
> +	if (test_bit(PANFROST_COMP_BIT_GPU, pfdev->is_suspended))
> +		return IRQ_NONE;
> +
> +	fault_status = gpu_read(pfdev, GPU_FAULT_STATUS);
> +	state = gpu_read(pfdev, GPU_INT_STAT);
>  	if (!state)
>  		return IRQ_NONE;
>  
> @@ -61,6 +65,8 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>  	gpu_write(pfdev, GPU_INT_MASK, 0);
>  	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
>  
> +	clear_bit(PANFROST_COMP_BIT_GPU, pfdev->is_suspended);
> +
>  	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
>  		val, val & GPU_IRQ_RESET_COMPLETED, 10, 10000);
> @@ -452,6 +458,14 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  		dev_err(pfdev->dev, "l2 power transition timeout");
>  }
>  
> +void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev)
> +{
> +	set_bit(PANFROST_COMP_BIT_GPU, pfdev->is_suspended);
> +
> +	gpu_write(pfdev, GPU_INT_MASK, 0);
> +	synchronize_irq(pfdev->gpu_irq);
> +}
> +
>  int panfrost_gpu_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> index 876fdad9f721..d841b86504ea 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> @@ -15,6 +15,7 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
>  int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
>  void panfrost_gpu_power_on(struct panfrost_device *pfdev);
>  void panfrost_gpu_power_off(struct panfrost_device *pfdev);
> +void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
>  
>  void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
>  void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index f9446e197428..0c2dbf6ef2a5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -405,6 +405,8 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>  	int j;
>  	u32 irq_mask = 0;
>  
> +	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
> +
>  	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>  		irq_mask |= MK_JS_MASK(j);
>  	}
> @@ -413,6 +415,14 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>  	job_write(pfdev, JOB_INT_MASK, irq_mask);
>  }
>  
> +void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
> +{
> +	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
> +
> +	job_write(pfdev, JOB_INT_MASK, 0);
> +	synchronize_irq(pfdev->js->irq);
> +}
> +
>  static void panfrost_job_handle_err(struct panfrost_device *pfdev,
>  				    struct panfrost_job *job,
>  				    unsigned int js)
> @@ -792,17 +802,25 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>  	struct panfrost_device *pfdev = data;
>  
>  	panfrost_job_handle_irqs(pfdev);
> -	job_write(pfdev, JOB_INT_MASK,
> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +
> +	/* Enable interrupts only if we're not about to get suspended */
> +	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
> +		job_write(pfdev, JOB_INT_MASK,
> +			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> +			  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +
>  	return IRQ_HANDLED;
>  }
>  
>  static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  {
>  	struct panfrost_device *pfdev = data;
> -	u32 status = job_read(pfdev, JOB_INT_STAT);
> +	u32 status;
> +
> +	if (test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
> +		return IRQ_NONE;
>  
> +	status = job_read(pfdev, JOB_INT_STAT);
>  	if (!status)
>  		return IRQ_NONE;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index 17ff808dba07..ec581b97852b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -47,6 +47,7 @@ int panfrost_job_get_slot(struct panfrost_job *job);
>  int panfrost_job_push(struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
> +void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
>  int panfrost_job_is_idle(struct panfrost_device *pfdev);
>  
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index ac4296c1e54b..f38385fe76bb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -231,6 +231,8 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
>  {
>  	struct panfrost_mmu *mmu, *mmu_tmp;
>  
> +	clear_bit(PANFROST_COMP_BIT_MMU, pfdev->is_suspended);
> +
>  	spin_lock(&pfdev->as_lock);
>  
>  	pfdev->as_alloc_mask = 0;
> @@ -670,6 +672,9 @@ static irqreturn_t panfrost_mmu_irq_handler(int irq, void *data)
>  {
>  	struct panfrost_device *pfdev = data;
>  
> +	if (test_bit(PANFROST_COMP_BIT_MMU, pfdev->is_suspended))
> +		return IRQ_NONE;
> +
>  	if (!mmu_read(pfdev, MMU_INT_STAT))
>  		return IRQ_NONE;
>  
> @@ -744,9 +749,12 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  			status = mmu_read(pfdev, MMU_INT_RAWSTAT) & ~pfdev->as_faulty_mask;
>  	}
>  
> -	spin_lock(&pfdev->as_lock);
> -	mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
> -	spin_unlock(&pfdev->as_lock);
> +	/* Enable interrupts only if we're not about to get suspended */
> +	if (!test_bit(PANFROST_COMP_BIT_MMU, pfdev->is_suspended)) {
> +		spin_lock(&pfdev->as_lock);
> +		mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
> +		spin_unlock(&pfdev->as_lock);
> +	}
>  
>  	return IRQ_HANDLED;
>  };
> @@ -777,3 +785,11 @@ void panfrost_mmu_fini(struct panfrost_device *pfdev)
>  {
>  	mmu_write(pfdev, MMU_INT_MASK, 0);
>  }
> +
> +void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev)
> +{
> +	set_bit(PANFROST_COMP_BIT_MMU, pfdev->is_suspended);
> +
> +	mmu_write(pfdev, MMU_INT_MASK, 0);
> +	synchronize_irq(pfdev->mmu_irq);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> index cc2a0d307feb..022a9a74a114 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> @@ -14,6 +14,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping);
>  int panfrost_mmu_init(struct panfrost_device *pfdev);
>  void panfrost_mmu_fini(struct panfrost_device *pfdev);
>  void panfrost_mmu_reset(struct panfrost_device *pfdev);
> +void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev);
>  
>  u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
>  void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);

