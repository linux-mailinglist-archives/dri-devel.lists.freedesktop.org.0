Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57206C1D1E3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC04C10E1FA;
	Wed, 29 Oct 2025 20:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exzCEFYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4FA10E1FA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761768149; x=1793304149;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2ZK4uGeXdJwOgsS9F07jxBmw5E1UYsyBrUyuQ1egEu4=;
 b=exzCEFYXvQsedcg0sxcdJelwux1Mx47LhX/xt7OzhN4nVRDjOR+W4fc+
 p9CTNPt+IOlSksxuXmXBcJ6+RV5xJU36J6mZsomM8aBzD0mXBQnoGxZCd
 VCY4JPtadn/qx9we6MGdAMarqI5PB/U1lbU5ikx4SEROeKhUOg0X9I3sP
 KkVAMh4GPRa6F9khv1fLwkt7ohRL7wHuPdoCduGc86aHA5oKh120niYfz
 mmJUI4+5Awq95wPKyxI4j20qMadZ55MzDR6VelQUYIllXN8Uca7W3AHB+
 lkEpohos0cqlpEKRsK5pecb05j6Tll1w8hSpiT4h47och3KKMCygpkNqs g==;
X-CSE-ConnectionGUID: j022BhGVQ7WO6OjZZkanZA==
X-CSE-MsgGUID: s9u7ANP5RUCVNcRNSUVx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="66517587"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="66517587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:02:29 -0700
X-CSE-ConnectionGUID: TBZ2kTrTSeyFEU3sRpkVYg==
X-CSE-MsgGUID: V9uMWKJiTRW1w2hKMmjuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185637770"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.94.253.106])
 ([10.94.253.106])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:02:26 -0700
Message-ID: <eafe034a-0c87-452e-b202-bd53fbdf12ac@linux.intel.com>
Date: Wed, 29 Oct 2025 21:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] accel/ivpu: replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20251029165642.364488-1-marco.crivellari@suse.com>
 <20251029165642.364488-3-marco.crivellari@suse.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251029165642.364488-3-marco.crivellari@suse.com>
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

On 10/29/2025 5:56 PM, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>
> This lack of consistency cannot be addressed without refactoring the API.
>
> system_wq should be the per-cpu workqueue, yet in this name nothing makes
> that clear, so replace system_wq with system_percpu_wq.
>
> The old wq (system_wq) will be kept for a few release cycles.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
>  drivers/accel/ivpu/ivpu_ipc.c     | 2 +-
>  drivers/accel/ivpu/ivpu_job.c     | 2 +-
>  drivers/accel/ivpu/ivpu_mmu.c     | 2 +-
>  drivers/accel/ivpu/ivpu_pm.c      | 3 ++-
>  5 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index afdb3b2aa72a..27a345f3befe 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -673,7 +673,7 @@ bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq)
>  
>  	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, SURV_ERR, status)) {
>  		ivpu_dbg(vdev, IRQ, "Survivability IRQ\n");
> -		queue_work(system_wq, &vdev->irq_dct_work);
> +		queue_work(system_percpu_wq, &vdev->irq_dct_work);
>  	}
>  
>  	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, FREQ_CHANGE, status)) {
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index 5f00809d448a..1f13bf95b2b3 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -459,7 +459,7 @@ void ivpu_ipc_irq_handler(struct ivpu_device *vdev)
>  		}
>  	}
>  
> -	queue_work(system_wq, &vdev->irq_ipc_work);
> +	queue_work(system_percpu_wq, &vdev->irq_ipc_work);
>  }
>  
>  void ivpu_ipc_irq_work_fn(struct work_struct *work)
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 060f1fc031d3..7a1f78b84b09 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -574,7 +574,7 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
>  		 * status and ensure both are handled in the same way
>  		 */
>  		job->file_priv->has_mmu_faults = true;
> -		queue_work(system_wq, &vdev->context_abort_work);
> +		queue_work(system_percpu_wq, &vdev->context_abort_work);
>  		return 0;
>  	}
>  
> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
> index 5ea010568faa..e1baf6b64935 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.c
> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> @@ -970,7 +970,7 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>  		}
>  	}
>  
> -	queue_work(system_wq, &vdev->context_abort_work);
> +	queue_work(system_percpu_wq, &vdev->context_abort_work);
>  }
>  
>  void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index ffa2ba7cafe2..9ecba05ce7db 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -226,7 +226,8 @@ void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
>  	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
>  
>  	/* No-op if already queued */
> -	queue_delayed_work(system_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
> +	queue_delayed_work(system_percpu_wq, &vdev->pm->job_timeout_work,
> +			   msecs_to_jiffies(timeout_ms));
>  }
>  
>  void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
