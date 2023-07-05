Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009D747F9F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF210E2A6;
	Wed,  5 Jul 2023 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4B10E2A6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688545623; x=1720081623;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GDSoqbYT+uXGaoBM4vo4vjvU6qs8NXy5TgNfPHuU/gc=;
 b=cMaBWhv0xabaRg0SWavAs3qsb6T3rQIZ0wl/tARlBz+uGOt9/ZHqggTO
 /kRuspabWk3TiAjzWjc8xF/W4QUehlO2hdVkRaVsLcl+j/TXuGy1/POWM
 X4U/JilM/oJhoN7UabTPeKFyVP/0OfeOpShR12V6j9XxsGZxyE7Udvebd
 l17GucJDspskvID0wo0OTdUBg+gWsGO0D7FyIjCBjPz2QaZ8CKBOZVq1c
 XQqGrfMKXBZGwM4p0Yu7NbMHKUIRVScBwne8qCnY93bSJwQdS39ghUcMg
 rtFTZjknE1CXjBo29TjA8GilinZgk9++cgoFgVakTb530fTLcH9P/iBMw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="360758807"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="360758807"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 01:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="863644510"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="863644510"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.143.1])
 ([10.249.143.1])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 01:27:01 -0700
Message-ID: <273900af-6501-0675-4b73-1112c1019e71@linux.intel.com>
Date: Wed, 5 Jul 2023 10:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] accel/ivpu: Clear specific interrupt status bits on C0
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
 <20230703080725.2065635-2-stanislaw.gruszka@linux.intel.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230703080725.2065635-2-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 03.07.2023 10:07, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> MTL C0 stepping fixed issue related to butrress interrupt status clearing,
> to clear an interrupt status it is required to write 1 to specific
> status bit field. This allows to execute read, modify and write routine.
> 
> Writing 0 will not clear the interrupt and will cause interrupt storm.
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Cc: stable@vger.kernel.org # 6.3.x
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.h    |  1 +
>  drivers/accel/ivpu/ivpu_hw_mtl.c | 18 ++++++++++++------
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 315180dd72ce..8fe8cda2e39d 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -75,6 +75,7 @@ struct ivpu_wa_table {
>  	bool punit_disabled;
>  	bool clear_runtime_mem;
>  	bool d3hot_after_power_off;
> +	bool interrupt_clear_with_0;
>  };
>  
>  struct ivpu_hw_info;
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
> index d3ba633daaa0..f1211e74017d 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
> @@ -101,6 +101,9 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
>  	vdev->wa.punit_disabled = ivpu_is_fpga(vdev);
>  	vdev->wa.clear_runtime_mem = false;
>  	vdev->wa.d3hot_after_power_off = true;
> +
> +	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_MTL && ivpu_revision(vdev) < 4)
> +		vdev->wa.interrupt_clear_with_0 = true;
>  }
>  
>  static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
> @@ -962,12 +965,15 @@ static u32 ivpu_hw_mtl_irqb_handler(struct ivpu_device *vdev, int irq)
>  		schedule_recovery = true;
>  	}
>  
> -	/*
> -	 * Clear local interrupt status by writing 0 to all bits.
> -	 * This must be done after interrupts are cleared at the source.
> -	 * Writing 1 triggers an interrupt, so we can't perform read update write.
> -	 */
> -	REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, 0x0);
> +	/* This must be done after interrupts are cleared at the source. */
> +	if (IVPU_WA(interrupt_clear_with_0))
> +		/*
> +		 * Writing 1 triggers an interrupt, so we can't perform read update write.
> +		 * Clear local interrupt status by writing 0 to all bits.
> +		 */
> +		REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, 0x0);
> +	else
> +		REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, status);
>  
>  	/* Re-enable global interrupt */
>  	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x0);
