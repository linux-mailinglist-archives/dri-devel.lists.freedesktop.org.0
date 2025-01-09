Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BEA06FEC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5D10ED13;
	Thu,  9 Jan 2025 08:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVpyqRP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3C710ED0C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411195; x=1767947195;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EfRXrqBDrtd080Kn6yHQKDaLyGSZlOex1tAgOl9ZRDY=;
 b=EVpyqRP8XHbOpPIZ37B0l9vwZxCmh8YLWEJHkqafWnilyWvsLi99KRWu
 UXglfunGDk/DqWkHDPT31phFYlraCr+uKlYvzLUFXw+4mSZZ+WfqS3qSF
 Bp0x7GONPlBxLEQTAoM5JqHdxAppL1PuMKTIG61PTWXxuaCcx47FPcfPS
 G5Z5lUpnr4GrCUhGOUb+VwZxDyyXnYN6cmS6EmlfErHkGX3hj3bE/S5g+
 qH3zn0UhK9/YFtfsfo6u8fnsRdPSyhXlnPUFv5k8PbFPyKd4qv/pnIPUT
 7uo4Y23R1PwuaSeQ0EogILLMSXyE2TbR74aEChxichIdotxJdZWMMHxSo g==;
X-CSE-ConnectionGUID: 4vmbGibATOy9W5FzgfxTzg==
X-CSE-MsgGUID: 8bIKqaYoQUmBh2+qHA5paA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="62037640"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="62037640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:26:35 -0800
X-CSE-ConnectionGUID: XgKHJ6iZRbOGA/bfK68oPA==
X-CSE-MsgGUID: yBbGTnLNRkOr14PIOpTJpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134231942"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:26:33 -0800
Message-ID: <4c851df7-978c-4201-8dc6-d7e88ae614bd@linux.intel.com>
Date: Thu, 9 Jan 2025 09:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] accel/ivpu: Use workqueue for IRQ handling
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-6-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-6-maciej.falkowski@linux.intel.com>
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
> Convert IRQ bottom half from the thread handler into workqueue.
> This increases a stability in rare scenarios where driver on
> debugging/hardening kernels processes IRQ too slow and misses
> some interrupts due to it.
> Workqueue handler also gives a very minor performance increase.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c     | 39 ++++++++-----------------------
>  drivers/accel/ivpu/ivpu_drv.h     |  5 +++-
>  drivers/accel/ivpu/ivpu_hw.c      |  5 ----
>  drivers/accel/ivpu/ivpu_hw.h      |  9 -------
>  drivers/accel/ivpu/ivpu_hw_btrs.c |  3 +--
>  drivers/accel/ivpu/ivpu_ipc.c     |  7 +++---
>  drivers/accel/ivpu/ivpu_ipc.h     |  2 +-
>  drivers/accel/ivpu/ivpu_job.c     |  2 +-
>  drivers/accel/ivpu/ivpu_job.h     |  2 +-
>  drivers/accel/ivpu/ivpu_pm.c      |  3 ++-
>  drivers/accel/ivpu/ivpu_pm.h      |  2 +-
>  11 files changed, 24 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 300eea8c305f..9b0d99873fb3 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/workqueue.h>
>  #include <generated/utsrelease.h>
>  
>  #include <drm/drm_accel.h>
> @@ -421,6 +422,9 @@ void ivpu_prepare_for_reset(struct ivpu_device *vdev)
>  {
>  	ivpu_hw_irq_disable(vdev);
>  	disable_irq(vdev->irq);
> +	cancel_work_sync(&vdev->irq_ipc_work);
> +	cancel_work_sync(&vdev->irq_dct_work);
> +	cancel_work_sync(&vdev->context_abort_work);
>  	ivpu_ipc_disable(vdev);
>  	ivpu_mmu_disable(vdev);
>  }
> @@ -465,31 +469,6 @@ static const struct drm_driver driver = {
>  	.major = 1,
>  };
>  
> -static irqreturn_t ivpu_irq_thread_handler(int irq, void *arg)
> -{
> -	struct ivpu_device *vdev = arg;
> -	u8 irq_src;
> -
> -	if (kfifo_is_empty(&vdev->hw->irq.fifo))
> -		return IRQ_NONE;
> -
> -	while (kfifo_get(&vdev->hw->irq.fifo, &irq_src)) {
> -		switch (irq_src) {
> -		case IVPU_HW_IRQ_SRC_IPC:
> -			ivpu_ipc_irq_thread_handler(vdev);
> -			break;
> -		case IVPU_HW_IRQ_SRC_DCT:
> -			ivpu_pm_dct_irq_thread_handler(vdev);
> -			break;
> -		default:
> -			ivpu_err_ratelimited(vdev, "Unknown IRQ source: %u\n", irq_src);
> -			break;
> -		}
> -	}
> -
> -	return IRQ_HANDLED;
> -}
> -
>  static int ivpu_irq_init(struct ivpu_device *vdev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
> @@ -501,12 +480,16 @@ static int ivpu_irq_init(struct ivpu_device *vdev)
>  		return ret;
>  	}
>  
> +	INIT_WORK(&vdev->irq_ipc_work, ivpu_ipc_irq_work_fn);
> +	INIT_WORK(&vdev->irq_dct_work, ivpu_pm_irq_dct_work_fn);
> +	INIT_WORK(&vdev->context_abort_work, ivpu_context_abort_work_fn);
> +
>  	ivpu_irq_handlers_init(vdev);
>  
>  	vdev->irq = pci_irq_vector(pdev, 0);
>  
> -	ret = devm_request_threaded_irq(vdev->drm.dev, vdev->irq, ivpu_hw_irq_handler,
> -					ivpu_irq_thread_handler, IRQF_NO_AUTOEN, DRIVER_NAME, vdev);
> +	ret = devm_request_irq(vdev->drm.dev, vdev->irq, ivpu_hw_irq_handler,
> +			       IRQF_NO_AUTOEN, DRIVER_NAME, vdev);
>  	if (ret)
>  		ivpu_err(vdev, "Failed to request an IRQ %d\n", ret);
>  
> @@ -599,8 +582,6 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>  	vdev->db_limit.min = IVPU_MIN_DB;
>  	vdev->db_limit.max = IVPU_MAX_DB;
>  
> -	INIT_WORK(&vdev->context_abort_work, ivpu_context_abort_thread_handler);
> -
>  	ret = drmm_mutex_init(&vdev->drm, &vdev->context_list_lock);
>  	if (ret)
>  		goto err_xa_destroy;
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index ebfcf3e42a3d..b57d878f2fcd 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -137,12 +137,15 @@ struct ivpu_device {
>  	struct mutex context_list_lock; /* Protects user context addition/removal */
>  	struct xarray context_xa;
>  	struct xa_limit context_xa_limit;
> -	struct work_struct context_abort_work;
>  
>  	struct xarray db_xa;
>  	struct xa_limit db_limit;
>  	u32 db_next;
>  
> +	struct work_struct irq_ipc_work;
> +	struct work_struct irq_dct_work;
> +	struct work_struct context_abort_work;
> +
>  	struct mutex bo_list_lock; /* Protects bo_list */
>  	struct list_head bo_list;
>  
> diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
> index 4e1054f3466e..1b691375ee4d 100644
> --- a/drivers/accel/ivpu/ivpu_hw.c
> +++ b/drivers/accel/ivpu/ivpu_hw.c
> @@ -285,8 +285,6 @@ void ivpu_hw_profiling_freq_drive(struct ivpu_device *vdev, bool enable)
>  
>  void ivpu_irq_handlers_init(struct ivpu_device *vdev)
>  {
> -	INIT_KFIFO(vdev->hw->irq.fifo);
> -
>  	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
>  		vdev->hw->irq.ip_irq_handler = ivpu_hw_ip_irq_handler_37xx;
>  	else
> @@ -300,7 +298,6 @@ void ivpu_irq_handlers_init(struct ivpu_device *vdev)
>  
>  void ivpu_hw_irq_enable(struct ivpu_device *vdev)
>  {
> -	kfifo_reset(&vdev->hw->irq.fifo);
>  	ivpu_hw_ip_irq_enable(vdev);
>  	ivpu_hw_btrs_irq_enable(vdev);
>  }
> @@ -327,8 +324,6 @@ irqreturn_t ivpu_hw_irq_handler(int irq, void *ptr)
>  	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
>  	ivpu_hw_btrs_global_int_enable(vdev);
>  
> -	if (!kfifo_is_empty(&vdev->hw->irq.fifo))
> -		return IRQ_WAKE_THREAD;
>  	if (ip_handled || btrs_handled)
>  		return IRQ_HANDLED;
>  	return IRQ_NONE;
> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
> index fc4dbfc980c8..fbef9816b9d0 100644
> --- a/drivers/accel/ivpu/ivpu_hw.h
> +++ b/drivers/accel/ivpu/ivpu_hw.h
> @@ -6,18 +6,10 @@
>  #ifndef __IVPU_HW_H__
>  #define __IVPU_HW_H__
>  
> -#include <linux/kfifo.h>
> -
>  #include "ivpu_drv.h"
>  #include "ivpu_hw_btrs.h"
>  #include "ivpu_hw_ip.h"
>  
> -#define IVPU_HW_IRQ_FIFO_LENGTH 1024
> -
> -#define IVPU_HW_IRQ_SRC_IPC 1
> -#define IVPU_HW_IRQ_SRC_MMU_EVTQ 2
> -#define IVPU_HW_IRQ_SRC_DCT 3
> -
>  struct ivpu_addr_range {
>  	resource_size_t start;
>  	resource_size_t end;
> @@ -27,7 +19,6 @@ struct ivpu_hw_info {
>  	struct {
>  		bool (*btrs_irq_handler)(struct ivpu_device *vdev, int irq);
>  		bool (*ip_irq_handler)(struct ivpu_device *vdev, int irq);
> -		DECLARE_KFIFO(fifo, u8, IVPU_HW_IRQ_FIFO_LENGTH);
>  	} irq;
>  	struct {
>  		struct ivpu_addr_range global;
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index 3212c99f3682..3753b00ed2d6 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -630,8 +630,7 @@ bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq)
>  
>  	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, SURV_ERR, status)) {
>  		ivpu_dbg(vdev, IRQ, "Survivability IRQ\n");
> -		if (!kfifo_put(&vdev->hw->irq.fifo, IVPU_HW_IRQ_SRC_DCT))
> -			ivpu_err_ratelimited(vdev, "IRQ FIFO full\n");
> +		queue_work(system_wq, &vdev->irq_dct_work);
>  	}
>  
>  	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, FREQ_CHANGE, status))
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index 01ebf88fe6ef..0e096fd9b95d 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -459,13 +459,12 @@ void ivpu_ipc_irq_handler(struct ivpu_device *vdev)
>  		}
>  	}
>  
> -	if (!list_empty(&ipc->cb_msg_list))
> -		if (!kfifo_put(&vdev->hw->irq.fifo, IVPU_HW_IRQ_SRC_IPC))
> -			ivpu_err_ratelimited(vdev, "IRQ FIFO full\n");
> +	queue_work(system_wq, &vdev->irq_ipc_work);
>  }
>  
> -void ivpu_ipc_irq_thread_handler(struct ivpu_device *vdev)
> +void ivpu_ipc_irq_work_fn(struct work_struct *work)
>  {
> +	struct ivpu_device *vdev = container_of(work, struct ivpu_device, irq_ipc_work);
>  	struct ivpu_ipc_info *ipc = vdev->ipc;
>  	struct ivpu_ipc_rx_msg *rx_msg, *r;
>  	struct list_head cb_msg_list;
> diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
> index b4dfb504679b..b524a1985b9d 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.h
> +++ b/drivers/accel/ivpu/ivpu_ipc.h
> @@ -90,7 +90,7 @@ void ivpu_ipc_disable(struct ivpu_device *vdev);
>  void ivpu_ipc_reset(struct ivpu_device *vdev);
>  
>  void ivpu_ipc_irq_handler(struct ivpu_device *vdev);
> -void ivpu_ipc_irq_thread_handler(struct ivpu_device *vdev);
> +void ivpu_ipc_irq_work_fn(struct work_struct *work);
>  
>  void ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>  			   u32 channel, ivpu_ipc_rx_callback_t callback);
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 7fed3c8406ee..c678dcddb8d8 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -935,7 +935,7 @@ void ivpu_job_done_consumer_fini(struct ivpu_device *vdev)
>  	ivpu_ipc_consumer_del(vdev, &vdev->job_done_consumer);
>  }
>  
> -void ivpu_context_abort_thread_handler(struct work_struct *work)
> +void ivpu_context_abort_work_fn(struct work_struct *work)
>  {
>  	struct ivpu_device *vdev = container_of(work, struct ivpu_device, context_abort_work);
>  	struct ivpu_file_priv *file_priv;
> diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
> index fef8aed1fc88..ff77ee1fcee2 100644
> --- a/drivers/accel/ivpu/ivpu_job.h
> +++ b/drivers/accel/ivpu/ivpu_job.h
> @@ -72,7 +72,7 @@ void ivpu_cmdq_abort_all_jobs(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id)
>  
>  void ivpu_job_done_consumer_init(struct ivpu_device *vdev);
>  void ivpu_job_done_consumer_fini(struct ivpu_device *vdev);
> -void ivpu_context_abort_thread_handler(struct work_struct *work);
> +void ivpu_context_abort_work_fn(struct work_struct *work);
>  
>  void ivpu_jobs_abort_all(struct ivpu_device *vdev);
>  
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 6821051dfa3a..f41b3bfe40af 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -452,8 +452,9 @@ int ivpu_pm_dct_disable(struct ivpu_device *vdev)
>  	return 0;
>  }
>  
> -void ivpu_pm_dct_irq_thread_handler(struct ivpu_device *vdev)
> +void ivpu_pm_irq_dct_work_fn(struct work_struct *work)
>  {
> +	struct ivpu_device *vdev = container_of(work, struct ivpu_device, irq_dct_work);
>  	bool enable;
>  	int ret;
>  
> diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
> index b70efe6c36e4..89b264cc0e3e 100644
> --- a/drivers/accel/ivpu/ivpu_pm.h
> +++ b/drivers/accel/ivpu/ivpu_pm.h
> @@ -45,6 +45,6 @@ void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev);
>  int ivpu_pm_dct_init(struct ivpu_device *vdev);
>  int ivpu_pm_dct_enable(struct ivpu_device *vdev, u8 active_percent);
>  int ivpu_pm_dct_disable(struct ivpu_device *vdev);
> -void ivpu_pm_dct_irq_thread_handler(struct ivpu_device *vdev);
> +void ivpu_pm_irq_dct_work_fn(struct work_struct *work);
>  
>  #endif /* __IVPU_PM_H__ */

