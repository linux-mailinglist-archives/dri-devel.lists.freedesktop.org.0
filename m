Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C87A06FEF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A6F10E0D9;
	Thu,  9 Jan 2025 08:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ar8wm7d2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCF710E0D9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411235; x=1767947235;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bg7o3XQ9oddKfafUHYvr4+kThMWj4Tftlz972IHstlQ=;
 b=Ar8wm7d2qBsDFLuThIehNYjemWi9KJHVHj881oLcE/yLfWz7hmjy69Cy
 GjDrh9XnoUaLZnrhejtNUnncLbYLCI48ucoqa1Wk+mcrpLiEJLG1xFmkW
 yfobO80t3xlo2ntLSIAa2WRntIKbuEf1aOLv0qVYy9PSS6DcrmWmrOPMS
 03WM57cjmJw/jRNEVwgSXaFg77y0Qxe+uW7aVbTJCuGQPjnkxxCMGxCEs
 NOTeBYaF1Hn+vkJu6jP+yqTUYRpyNhq1dYUJ77c5z5PNa4nE8+oUwFai+
 vG9e6cIG2213L0E1E6qGS1PFGZ04TEvIcK+5LmEITilnK5uNlrqPlKKPT A==;
X-CSE-ConnectionGUID: oznbaqFfR36Jt8CgIs1Xeg==
X-CSE-MsgGUID: hycBDizjT/Cq7f/WmVsXeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36819576"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36819576"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:27:15 -0800
X-CSE-ConnectionGUID: 3L+QnW47REiBzyno/Jihqg==
X-CSE-MsgGUID: at4P24MVQNGwwrndI8S7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="108320200"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:27:13 -0800
Message-ID: <f09b3a44-3b98-4b68-bfd3-3651960308cc@linux.intel.com>
Date: Thu, 9 Jan 2025 09:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] accel/ivpu: Move parts of MMU event IRQ handling to
 thread handler
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-8-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-8-maciej.falkowski@linux.intel.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> To prevent looping infinitely in MMU event handler we stop
> generating new events by removing 'R' (record) bit from context
> descriptor, but to ensure this change has effect KMD has to perform
> configuration invalidation followed by sync command.
> 
> Because of that move parts of the interrupt handler that can take longer
> to a thread not to block in interrupt handler for too long.
> This includes:
>  * disabling event queue for the time KMD updates MMU event queue consumer
>    to ensure proper synchronization between MMU and KMD
> 
>  * removal of 'R' (record) bit from context descriptor to ensure no more
>    faults are recorded until that context is destroyed
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c |  7 ++-
>  drivers/accel/ivpu/ivpu_mmu.c | 93 +++++++++++++++++++++++------------
>  drivers/accel/ivpu/ivpu_mmu.h |  2 +
>  3 files changed, 69 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index c678dcddb8d8..c55de9736d84 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -17,6 +17,7 @@
>  #include "ivpu_ipc.h"
>  #include "ivpu_job.h"
>  #include "ivpu_jsm_msg.h"
> +#include "ivpu_mmu.h"
>  #include "ivpu_pm.h"
>  #include "ivpu_trace.h"
>  #include "vpu_boot_api.h"
> @@ -366,6 +367,7 @@ void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
>  	unsigned long cmdq_id;
>  
>  	lockdep_assert_held(&file_priv->lock);
> +	ivpu_dbg(vdev, JOB, "Context ID: %u abort\n", file_priv->ctx.id);
>  
>  	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
>  		ivpu_cmdq_unregister(file_priv, cmdq);
> @@ -373,6 +375,9 @@ void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
>  	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_OS)
>  		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
>  
> +	ivpu_mmu_disable_ssid_events(vdev, file_priv->ctx.id);
> +	ivpu_mmu_discard_events(vdev);
> +
>  	file_priv->aborted = true;
>  }
>  
> @@ -939,8 +944,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  {
>  	struct ivpu_device *vdev = container_of(work, struct ivpu_device, context_abort_work);
>  	struct ivpu_file_priv *file_priv;
> -	unsigned long ctx_id;
>  	struct ivpu_job *job;
> +	unsigned long ctx_id;
>  	unsigned long id;
>  
>  	mutex_lock(&vdev->context_list_lock);
> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
> index 5ee4df892b3e..ae1dcd04051c 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.c
> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> @@ -20,6 +20,12 @@
>  #define IVPU_MMU_REG_CR0		      0x00200020u
>  #define IVPU_MMU_REG_CR0ACK		      0x00200024u
>  #define IVPU_MMU_REG_CR0ACK_VAL_MASK	      GENMASK(31, 0)
> +#define IVPU_MMU_REG_CR0_ATSCHK_MASK	      BIT(4)
> +#define IVPU_MMU_REG_CR0_CMDQEN_MASK	      BIT(3)
> +#define IVPU_MMU_REG_CR0_EVTQEN_MASK	      BIT(2)
> +#define IVPU_MMU_REG_CR0_PRIQEN_MASK	      BIT(1)
> +#define IVPU_MMU_REG_CR0_SMMUEN_MASK	      BIT(0)
> +
>  #define IVPU_MMU_REG_CR1		      0x00200028u
>  #define IVPU_MMU_REG_CR2		      0x0020002cu
>  #define IVPU_MMU_REG_IRQ_CTRL		      0x00200050u
> @@ -141,12 +147,6 @@
>  #define IVPU_MMU_IRQ_EVTQ_EN		BIT(2)
>  #define IVPU_MMU_IRQ_GERROR_EN		BIT(0)
>  
> -#define IVPU_MMU_CR0_ATSCHK		BIT(4)
> -#define IVPU_MMU_CR0_CMDQEN		BIT(3)
> -#define IVPU_MMU_CR0_EVTQEN		BIT(2)
> -#define IVPU_MMU_CR0_PRIQEN		BIT(1)
> -#define IVPU_MMU_CR0_SMMUEN		BIT(0)
> -
>  #define IVPU_MMU_CR1_TABLE_SH		GENMASK(11, 10)
>  #define IVPU_MMU_CR1_TABLE_OC		GENMASK(9, 8)
>  #define IVPU_MMU_CR1_TABLE_IC		GENMASK(7, 6)
> @@ -596,7 +596,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
>  	REGV_WR32(IVPU_MMU_REG_CMDQ_PROD, 0);
>  	REGV_WR32(IVPU_MMU_REG_CMDQ_CONS, 0);
>  
> -	val = IVPU_MMU_CR0_CMDQEN;
> +	val = REG_SET_FLD(IVPU_MMU_REG_CR0, CMDQEN, 0);
>  	ret = ivpu_mmu_reg_write_cr0(vdev, val);
>  	if (ret)
>  		return ret;
> @@ -617,12 +617,12 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
>  	REGV_WR32(IVPU_MMU_REG_EVTQ_PROD_SEC, 0);
>  	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, 0);
>  
> -	val |= IVPU_MMU_CR0_EVTQEN;
> +	val = REG_SET_FLD(IVPU_MMU_REG_CR0, EVTQEN, val);
>  	ret = ivpu_mmu_reg_write_cr0(vdev, val);
>  	if (ret)
>  		return ret;
>  
> -	val |= IVPU_MMU_CR0_ATSCHK;
> +	val = REG_SET_FLD(IVPU_MMU_REG_CR0, ATSCHK, val);
>  	ret = ivpu_mmu_reg_write_cr0(vdev, val);
>  	if (ret)
>  		return ret;
> @@ -631,7 +631,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
>  	if (ret)
>  		return ret;
>  
> -	val |= IVPU_MMU_CR0_SMMUEN;
> +	val = REG_SET_FLD(IVPU_MMU_REG_CR0, SMMUEN, val);
>  	return ivpu_mmu_reg_write_cr0(vdev, val);
>  }
>  
> @@ -870,7 +870,47 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
>  	return evt;
>  }
>  
> -static int ivpu_mmu_disable_events(struct ivpu_device *vdev, u32 ssid)
> +static int ivpu_mmu_evtq_set(struct ivpu_device *vdev, bool enable)
> +{
> +	u32 val = REGV_RD32(IVPU_MMU_REG_CR0);
> +
> +	if (enable)
> +		val = REG_SET_FLD(IVPU_MMU_REG_CR0, EVTQEN, val);
> +	else
> +		val = REG_CLR_FLD(IVPU_MMU_REG_CR0, EVTQEN, val);
> +	REGV_WR32(IVPU_MMU_REG_CR0, val);
> +
> +	return REGV_POLL_FLD(IVPU_MMU_REG_CR0ACK, VAL, val, IVPU_MMU_REG_TIMEOUT_US);
> +}
> +
> +static int ivpu_mmu_evtq_enable(struct ivpu_device *vdev)
> +{
> +	return ivpu_mmu_evtq_set(vdev, true);
> +}
> +
> +static int ivpu_mmu_evtq_disable(struct ivpu_device *vdev)
> +{
> +	return ivpu_mmu_evtq_set(vdev, false);
> +}
> +
> +void ivpu_mmu_discard_events(struct ivpu_device *vdev)
> +{
> +	/*
> +	 * Disable event queue (stop MMU from updating the producer)
> +	 * to allow synchronization of consumer and producer indexes
> +	 */
> +	ivpu_mmu_evtq_disable(vdev);
> +
> +	vdev->mmu->evtq.cons = REGV_RD32(IVPU_MMU_REG_EVTQ_PROD_SEC);
> +	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, vdev->mmu->evtq.cons);
> +	vdev->mmu->evtq.prod = REGV_RD32(IVPU_MMU_REG_EVTQ_PROD_SEC);
> +
> +	ivpu_mmu_evtq_enable(vdev);
> +
> +	drm_WARN_ON_ONCE(&vdev->drm, vdev->mmu->evtq.cons != vdev->mmu->evtq.prod);
> +}
> +
> +int ivpu_mmu_disable_ssid_events(struct ivpu_device *vdev, u32 ssid)
>  {
>  	struct ivpu_mmu_info *mmu = vdev->mmu;
>  	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
> @@ -890,6 +930,7 @@ static int ivpu_mmu_disable_events(struct ivpu_device *vdev, u32 ssid)
>  		clflush_cache_range(entry, IVPU_MMU_CDTAB_ENT_SIZE);
>  
>  	ivpu_mmu_cmdq_write_cfgi_all(vdev);
> +	ivpu_mmu_cmdq_sync(vdev);
>  
>  	return 0;
>  }
> @@ -897,38 +938,26 @@ static int ivpu_mmu_disable_events(struct ivpu_device *vdev, u32 ssid)
>  void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>  {
>  	struct ivpu_file_priv *file_priv;
> -	u32 last_ssid = -1;
>  	u32 *event;
>  	u32 ssid;
>  
>  	ivpu_dbg(vdev, IRQ, "MMU event queue\n");
>  
>  	while ((event = ivpu_mmu_get_event(vdev))) {
> -		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, event[0]);
> -
> -		if (ssid == last_ssid)
> -			continue;
> +		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, *event);
> +		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
> +			ivpu_mmu_dump_event(vdev, event);
> +			ivpu_pm_trigger_recovery(vdev, "MMU event");
> +			return;
> +		}
>  
> -		xa_lock(&vdev->context_xa);
>  		file_priv = xa_load(&vdev->context_xa, ssid);
>  		if (file_priv) {
> -			if (file_priv->has_mmu_faults) {
> -				event = NULL;
> -			} else {
> -				ivpu_mmu_disable_events(vdev, ssid);
> -				file_priv->has_mmu_faults = true;
> +			if (!READ_ONCE(file_priv->has_mmu_faults)) {
> +				ivpu_mmu_dump_event(vdev, event);
> +				WRITE_ONCE(file_priv->has_mmu_faults, true);
>  			}
>  		}
> -		xa_unlock(&vdev->context_xa);
> -
> -		if (event)
> -			ivpu_mmu_dump_event(vdev, event);
> -
> -		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
> -			ivpu_pm_trigger_recovery(vdev, "MMU event");
> -			return;
> -		}
> -		REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, vdev->mmu->evtq.cons);
>  	}
>  
>  	queue_work(system_wq, &vdev->context_abort_work);
> diff --git a/drivers/accel/ivpu/ivpu_mmu.h b/drivers/accel/ivpu/ivpu_mmu.h
> index 7afea9cd8731..1ce7529746ad 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.h
> +++ b/drivers/accel/ivpu/ivpu_mmu.h
> @@ -47,5 +47,7 @@ int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid);
>  void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev);
>  void ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev);
>  void ivpu_mmu_evtq_dump(struct ivpu_device *vdev);
> +void ivpu_mmu_discard_events(struct ivpu_device *vdev);
> +int ivpu_mmu_disable_ssid_events(struct ivpu_device *vdev, u32 ssid);
>  
>  #endif /* __IVPU_MMU_H__ */

