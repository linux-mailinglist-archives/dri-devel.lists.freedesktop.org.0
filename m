Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A27D7C78
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 07:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0510E085;
	Thu, 26 Oct 2023 05:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC11910E085
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698299353; x=1729835353;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hmJ3SQDatWRJ9B1u39RzjnIsZYc5/pxKB9xuA/Lcuac=;
 b=RSl4C1FvtXl81KXPQ66GEDr1H7+UbauQdeeOqAIYoHkdX2aIB4UmHSSz
 osLj4hQ5/yl1bKedmQm6mdfQ8WDICgLxIo62oiWL0iZS6fYcQ3OTdwgns
 WcECJmY2Z7acsyvQgOfwJ1nMTaKv5sBGG6B4A11XTQZReUfwGKy0pLjRU
 8U/EVKt9iaw28vNks503+jb9+J69WbBR+J9E1cGGQ1yUm8qlM7hm1QwLY
 BNFY3B3U3k/SCjrUbkvypxXsfMXsEiTUj7idZhFxjg8eorBwFCCbpGV/e
 MTJDaYaOBgJzptsQJ3vcoo792hoFUTY3vaRwZxpph8UozUiYMO9aGe602 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="256605"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="256605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 22:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="7130229"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 22:49:01 -0700
Date: Thu, 26 Oct 2023 07:49:08 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/ivpu/37xx: Fix missing VPUIP interrupts
Message-ID: <20231026054908.GA741663@linux.intel.com>
References: <20231024161952.759914-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024161952.759914-1-stanislaw.gruszka@linux.intel.com>
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
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 06:19:52PM +0200, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Move sequence of masking and unmasking global interrupts from buttress
> interrupt handler to generic one that handles both VPUIP and BTRS
> interrupts. Unmasking global interrupts will re-trigger MSI for any
> pending interrupts.
> 
> Lack of this sequence will cause the driver to miss any
> VPUIP interrupt that comes after reading VPU_37XX_HOST_SS_ICB_STATUS_0
> and before clearing all active interrupt sources.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Added:

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Cc: stable@vger.kernel.org

and applied to drm-misc-fixes

Thanks
Stanislaw

> ---
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 7e4e87aa7602..5c0246b9e522 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -906,9 +906,6 @@ static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
>  	if (status == 0)
>  		return 0;
>  
> -	/* Disable global interrupt before handling local buttress interrupts */
> -	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
> -
>  	if (REG_TEST_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
>  		ivpu_dbg(vdev, IRQ, "FREQ_CHANGE irq: %08x",
>  			 REGB_RD32(VPU_37XX_BUTTRESS_CURRENT_PLL));
> @@ -940,9 +937,6 @@ static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
>  	else
>  		REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, status);
>  
> -	/* Re-enable global interrupt */
> -	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
> -
>  	if (schedule_recovery)
>  		ivpu_pm_schedule_recovery(vdev);
>  
> @@ -954,9 +948,14 @@ static irqreturn_t ivpu_hw_37xx_irq_handler(int irq, void *ptr)
>  	struct ivpu_device *vdev = ptr;
>  	u32 ret_irqv, ret_irqb;
>  
> +	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
> +
>  	ret_irqv = ivpu_hw_37xx_irqv_handler(vdev, irq);
>  	ret_irqb = ivpu_hw_37xx_irqb_handler(vdev, irq);
>  
> +	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
> +	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
> +
>  	return IRQ_RETVAL(ret_irqb | ret_irqv);
>  }
>  
> -- 
> 2.25.1
> 
