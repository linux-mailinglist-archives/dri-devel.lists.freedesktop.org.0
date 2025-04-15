Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1AA89C2C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E3310E746;
	Tue, 15 Apr 2025 11:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12E7410E746
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:25:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A77715A1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:25:47 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 649EB3F66E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:25:48 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:25:46 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org,
 nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/panthor: Add 64-bit and poll register accessors
Message-ID: <Z_5COsTTuidPOa-a@e110455-lin.cambridge.arm.com>
References: <20250411164805.2015088-1-karunika.choo@arm.com>
 <20250411164805.2015088-2-karunika.choo@arm.com>
 <5cc385f1-11f6-4abd-9df9-20ea089461b0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cc385f1-11f6-4abd-9df9-20ea089461b0@arm.com>
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

On Mon, Apr 14, 2025 at 11:41:19AM +0100, Steven Price wrote:
> Hi Karunika,
> 
> Minor process thing: There's generally no need to resend a series just
> to add R-b tags - they'll get picked up when the series is merged.
> 
> On 11/04/2025 17:48, Karunika Choo wrote:
> > This patch adds 64-bit register accessors to simplify register access in
> > Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
> > 
> > This patch also updates Panthor to use the new 64-bit accessors and poll
> > functions.
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Karunika Choo <karunika.choo@arm.com>

With the changes that Steven suggested:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
> >  drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
> >  drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
> >  drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
> >  drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
> >  5 files changed, 124 insertions(+), 138 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index da6574021664..40b935fcc1f4 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> >  
> >  extern struct workqueue_struct *panthor_cleanup_wq;
> >  
> > +static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
> > +{
> > +	writel(data, ptdev->iomem + reg);
> > +}
> > +
> > +static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
> > +{
> > +	return readl(ptdev->iomem + reg);
> > +}
> > +
> > +static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
> > +{
> > +	return readl_relaxed(ptdev->iomem + reg);
> > +}
> > +
> > +static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
> > +{
> > +	gpu_write(ptdev, reg, lower_32_bits(data));
> > +	gpu_write(ptdev, reg + 4, upper_32_bits(data));
> > +}
> > +
> > +static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
> > +{
> > +	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
> > +}
> > +
> > +static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
> > +{
> > +	return (gpu_read_relaxed(ptdev, reg) |
> > +		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
> > +}
> > +
> > +static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
> > +{
> > +	u32 lo, hi1, hi2;
> > +	do {
> > +		hi1 = gpu_read(ptdev, reg + 4);
> > +		lo = gpu_read(ptdev, reg);
> > +		hi2 = gpu_read(ptdev, reg + 4);
> > +	} while (hi1 != hi2);
> > +	return lo | ((u64)hi2 << 32);
> > +}
> > +
> > +#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
> > +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
> > +			  dev, reg)
> > +
> > +#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
> > +				     timeout_us)				\
> > +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
> > +				 false, dev, reg)
> > +
> > +#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
> > +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
> > +			  dev, reg)
> > +
> > +#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
> > +				       timeout_us)				\
> > +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
> > +				 false, dev, reg)
> > +
> > +#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us,	\
> > +					     timeout_us)			\
> > +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
> > +				 timeout_us, false, dev, reg)
> > +
> > +#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,		\
> > +					timeout_us)				\
> > +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
> > +			  false, dev, reg)
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 0f52766a3120..ecfbe0456f89 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
> >  	u32 status;
> >  
> >  	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
> > -	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> > -			       status == MCU_STATUS_DISABLED, 10, 100000))
> > +	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
> > +				  status == MCU_STATUS_DISABLED, 10, 100000))
> >  		drm_err(&ptdev->base, "Failed to stop MCU");
> >  }
> >  
> > @@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
> >  
> >  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
> >  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> > -		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> > -					status == MCU_STATUS_HALT, 10, 100000)) {
> > +		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
> > +					   status == MCU_STATUS_HALT, 10,
> > +					   100000)) {
> >  			ptdev->reset.fast = true;
> >  		} else {
> >  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
> > diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> > index 671049020afa..fd09f0928019 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> > @@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
> >  
> >  	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
> >  
> > -	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
> > -	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
> > -
> > -	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
> > -	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
> > -
> > -	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
> > -	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
> > +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
> > +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
> > +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> >  
> >  	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> >  	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> > @@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
> >  {
> >  	if (status & GPU_IRQ_FAULT) {
> >  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
> > -		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
> > -			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
> > +		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
> >  
> >  		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> >  			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
> > @@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
> >  				u32 pwroff_reg, u32 pwrtrans_reg,
> >  				u64 mask, u32 timeout_us)
> >  {
> > -	u32 val, i;
> > +	u32 val;
> >  	int ret;
> >  
> > -	for (i = 0; i < 2; i++) {
> > -		u32 mask32 = mask >> (i * 32);
> > -
> > -		if (!mask32)
> > -			continue;
> > -
> > -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> > -						 val, !(mask32 & val),
> > -						 100, timeout_us);
> > -		if (ret) {
> > -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> > -				blk_name, mask);
> > -			return ret;
> > -		}
> > +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> > +					      100, timeout_us);
> 
> You're ignoring "mask" here, so there's a change in behaviour. I think
> you want:
> 
> ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
> 				      !(mask & val),
> 				      100, timeout_us);
> 
> (although I doubt it makes much difference in reality)
> 
> > +	if (ret) {
> > +		drm_err(&ptdev->base,
> > +			"timeout waiting on %s:%llx power transition", blk_name,
> > +			mask);
> > +		return ret;
> >  	}
> >  
> > -	if (mask & GENMASK(31, 0))
> > -		gpu_write(ptdev, pwroff_reg, mask);
> > -
> > -	if (mask >> 32)
> > -		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
> > -
> > -	for (i = 0; i < 2; i++) {
> > -		u32 mask32 = mask >> (i * 32);
> > +	gpu_write64(ptdev, pwroff_reg, mask);
> >  
> > -		if (!mask32)
> > -			continue;
> > -
> > -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> > -						 val, !(mask32 & val),
> > -						 100, timeout_us);
> > -		if (ret) {
> > -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> > -				blk_name, mask);
> > -			return ret;
> > -		}
> > +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> > +					      100, timeout_us);
> 
> Same here and two more below.
> 
> > +	if (ret) {
> > +		drm_err(&ptdev->base,
> > +			"timeout waiting on %s:%llx power transition", blk_name,
> > +			mask);
> > +		return ret;
> >  	}
> >  
> >  	return 0;
> > @@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
> >  			       u32 pwron_reg, u32 pwrtrans_reg,
> >  			       u32 rdy_reg, u64 mask, u32 timeout_us)
> >  {
> > -	u32 val, i;
> > +	u32 val;
> >  	int ret;
> >  
> > -	for (i = 0; i < 2; i++) {
> > -		u32 mask32 = mask >> (i * 32);
> > -
> > -		if (!mask32)
> > -			continue;
> > -
> > -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> > -						 val, !(mask32 & val),
> > -						 100, timeout_us);
> > -		if (ret) {
> > -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> > -				blk_name, mask);
> > -			return ret;
> > -		}
> > +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> > +					      100, timeout_us);
> > +	if (ret) {
> > +		drm_err(&ptdev->base,
> > +			"timeout waiting on %s:%llx power transition", blk_name,
> > +			mask);
> > +		return ret;
> >  	}
> >  
> > -	if (mask & GENMASK(31, 0))
> > -		gpu_write(ptdev, pwron_reg, mask);
> > -
> > -	if (mask >> 32)
> > -		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
> > -
> > -	for (i = 0; i < 2; i++) {
> > -		u32 mask32 = mask >> (i * 32);
> > +	gpu_write64(ptdev, pwron_reg, mask);
> >  
> > -		if (!mask32)
> > -			continue;
> > -
> > -		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
> > -						 val, (mask32 & val) == mask32,
> > -						 100, timeout_us);
> > -		if (ret) {
> > -			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
> > -				blk_name, mask);
> > -			return ret;
> > -		}
> > +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> > +					      100, timeout_us);
> > +	if (ret) {
> > +		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
> > +			blk_name, mask);
> > +		return ret;
> >  	}
> >  
> >  	return 0;
> > @@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
> >  	panthor_gpu_l2_power_on(ptdev);
> >  }
> >  
> > -/**
> > - * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
> > - * @ptdev: Device.
> > - * @reg: The offset of the register to read.
> > - *
> > - * Return: The counter value.
> > - */
> > -static u64
> > -panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
> > -{
> > -	u32 hi, lo;
> > -
> > -	do {
> > -		hi = gpu_read(ptdev, reg + 0x4);
> > -		lo = gpu_read(ptdev, reg);
> > -	} while (hi != gpu_read(ptdev, reg + 0x4));
> > -
> > -	return ((u64)hi << 32) | lo;
> > -}
> > -
> >  /**
> >   * panthor_gpu_read_timestamp() - Read the timestamp register.
> >   * @ptdev: Device.
> > @@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
> >   */
> >  u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
> >  {
> > -	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
> > +	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
> >  }
> >  
> >  /**
> > @@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
> >   */
> >  u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
> >  {
> > -	u32 hi, lo;
> > -
> > -	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
> > -	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
> > -
> > -	return ((u64)hi << 32) | lo;
> > +	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
> >  }
> 
> We might as well drop this function and inline the gpu_read64() call.
> 
> Thanks,
> Steve
> 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 12a02e28f50f..a0a79f19bdea 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
> >  	/* Wait for the MMU status to indicate there is no active command, in
> >  	 * case one is pending.
> >  	 */
> > -	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
> > -						val, !(val & AS_STATUS_AS_ACTIVE),
> > -						10, 100000);
> > +	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
> > +						   !(val & AS_STATUS_AS_ACTIVE),
> > +						   10, 100000);
> >  
> >  	if (ret) {
> >  		panthor_device_schedule_reset(ptdev);
> > @@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
> >  	region = region_width | region_start;
> >  
> >  	/* Lock the region that needs to be updated */
> > -	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
> > -	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
> > +	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
> >  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
> >  }
> >  
> > @@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
> >  	if (ret)
> >  		return ret;
> >  
> > -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
> > -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
> > -
> > -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
> > -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
> > -
> > -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
> > -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
> > +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
> > +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
> > +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
> >  
> >  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> >  }
> > @@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
> >  	if (ret)
> >  		return ret;
> >  
> > -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
> > -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
> > -
> > -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
> > -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
> > -
> > -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
> > -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
> > +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
> > +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
> > +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
> >  
> >  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> >  }
> > @@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> >  		u32 source_id;
> >  
> >  		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
> > -		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
> > -		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
> > +		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
> >  
> >  		/* decode the fault status */
> >  		exception_type = fault_status & 0xFF;
> > diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> > index a3ced0177535..6fd39a52f887 100644
> > --- a/drivers/gpu/drm/panthor/panthor_regs.h
> > +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> > @@ -232,10 +232,4 @@
> >  #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
> >  #define CSF_GLB_DOORBELL_ID				0
> >  
> > -#define gpu_write(dev, reg, data) \
> > -	writel(data, (dev)->iomem + (reg))
> > -
> > -#define gpu_read(dev, reg) \
> > -	readl((dev)->iomem + (reg))
> > -
> >  #endif
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
