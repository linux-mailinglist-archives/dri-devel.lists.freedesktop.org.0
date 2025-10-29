Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F51C1D1DD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E15010E82C;
	Wed, 29 Oct 2025 20:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQviwWrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA3A10E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761768117; x=1793304117;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nZH8k01WM1ZD2QNw1i3V/qcFjBnvGzd/8+qBO/Q6O30=;
 b=VQviwWrKluXOsia9LVpsmPWm05YvKrXxCsnBeLw5SaCI5m90K70yp7yw
 SCZX5neYn4lJ3urJP8I7EAd3I1BzqXZW++5UP0arhtCMtMmqHVv+pfgPc
 5GauXN5LkdenCnVncVwwXeXQgK/CfhCd0R5lfypqxKhn/Ftj/ObvdCLo2
 rYSqPAQ8aw4eTgdIvi5taKNXP55Sf139trUtZApa+Odsv+Ut8n3Py8PTG
 KE+4Qd941/6CP6NZKpmKugrCnrQXwiDSZa93Fn4REEPnzTWxi4nse20D5
 I4T9+Ivalrvssd4D9U333T7LTlz+bWXH7GhqgyPQNIHOKSuczvSPgc21P g==;
X-CSE-ConnectionGUID: l3FWsZAkTBe5XnPci3gAkw==
X-CSE-MsgGUID: 1aS/qu5wSJCa64DkUqv6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67552705"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="67552705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:01:56 -0700
X-CSE-ConnectionGUID: fF+KWoEfRmG05aLCyMW3hg==
X-CSE-MsgGUID: oeLCM16MQgy8fJPLkQg0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185637674"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.94.253.106])
 ([10.94.253.106])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:01:52 -0700
Message-ID: <f18e26c0-f4f3-4221-ba92-218698ec088e@linux.intel.com>
Date: Wed, 29 Oct 2025 21:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] accel/ivpu: replace use of system_unbound_wq with
 system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20251029165642.364488-1-marco.crivellari@suse.com>
 <20251029165642.364488-2-marco.crivellari@suse.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251029165642.364488-2-marco.crivellari@suse.com>
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
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
>
> Adding system_dfl_wq to encourage its use when unbound work should be used.
>
> The old system_unbound_wq will be kept for a few release cycles.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/accel/ivpu/ivpu_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 475ddc94f1cf..ffa2ba7cafe2 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -186,7 +186,7 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
>  	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
>  		ivpu_hw_diagnose_failure(vdev);
>  		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
> -		queue_work(system_unbound_wq, &vdev->pm->recovery_work);
> +		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
>  	}
>  }
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>  
