Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3EB850E7B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D7010E69A;
	Mon, 12 Feb 2024 08:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGRgZPHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1246F10E69A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707725041; x=1739261041;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Cl/9lMDTj/JkU/Mo7PlVHBVUW25RG6HKnU5Bt0KgqbQ=;
 b=PGRgZPHUpMPaJqZlUCyRR2doAJZIVUbZGGIK+IkKs2eQA6mzNlVEX5Ld
 7+jTkrK8FTY8pnZLJ6rQv2aRZihWhhUF8td2VSGAroQQs84wqJ/myT+Ej
 hY2NB+gpSSsxYdulqdH2XyRRmesQAcdJtZSa6ROzrkMrUjSwKcccTL4u0
 ImalSV7chPtnZlsOxAl/BVdFdBS+2GlV+q7WL7M4j88qvlxpgjWNW+d3G
 6pdtpzU/K4GB9KWwXzLWqS2xYQPWwEsTXntjLaAhDdB7Fx6MUdROxpqV6
 wO2QVs0V+fAxy6YybpcPmJmudFF4Jdpw93XNM2gdYmLMA2fP3R0fDhfIB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="13068393"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; d="scan'208";a="13068393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 00:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935012799"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; d="scan'208";a="935012799"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.168.63])
 ([10.217.168.63])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 00:02:14 -0800
Message-ID: <d29625c2-f348-41e3-b13c-a2f1dfd2d076@linux.intel.com>
Date: Mon, 12 Feb 2024 09:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix DevTLB errors on suspend/resume
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240206151927.2925585-1-jacek.lawrynowicz@linux.intel.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240206151927.2925585-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 06.02.2024 16:19, Jacek Lawrynowicz wrote:
> Issue IP reset before shutdown in order to
> complete all upstream requests to the SOC.
> Without this DevTLB is complaining about
> incomplete transactions and NPU cannot resume from
> suspend.
> This problem is only happening on recent IFWI
> releases.
> 
> IP reset in rare corner cases can mess up PCI
> configuration, so save it before the reset.
> After this happens it is also impossible to
> issue PLL requests and D0->D3->D0 cycle is needed
> to recover the NPU. Add WP 0 request on power up,
> so the PUNIT is always notified about NPU reset.
> 
> Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 44 ++++++++++++++++++++++---------
>  drivers/accel/ivpu/ivpu_pm.c      | 12 ++++-----
>  2 files changed, 38 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 77accd029c4a..89af1006df55 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -510,16 +510,6 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
>  	return ret;
>  }
>  
> -static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
> -{
> -	ivpu_boot_dpu_active_drive(vdev, false);
> -	ivpu_boot_pwr_island_isolation_drive(vdev, true);
> -	ivpu_boot_pwr_island_trickle_drive(vdev, false);
> -	ivpu_boot_pwr_island_drive(vdev, false);
> -
> -	return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
> -}
> -
>  static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
>  {
>  	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
> @@ -616,12 +606,37 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>  	return 0;
>  }
>  
> +static int ivpu_hw_37xx_ip_reset(struct ivpu_device *vdev)
> +{
> +	int ret;
> +	u32 val;
> +
> +	if (IVPU_WA(punit_disabled))
> +		return 0;
> +
> +	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
> +	if (ret) {
> +		ivpu_err(vdev, "Timed out waiting for TRIGGER bit\n");
> +		return ret;
> +	}
> +
> +	val = REGB_RD32(VPU_37XX_BUTTRESS_VPU_IP_RESET);
> +	val = REG_SET_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, val);
> +	REGB_WR32(VPU_37XX_BUTTRESS_VPU_IP_RESET, val);
> +
> +	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
> +	if (ret)
> +		ivpu_err(vdev, "Timed out waiting for RESET completion\n");
> +
> +	return ret;
> +}
> +
>  static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>  {
>  	int ret = 0;
>  
> -	if (ivpu_boot_pwr_domain_disable(vdev)) {
> -		ivpu_err(vdev, "Failed to disable power domain\n");
> +	if (ivpu_hw_37xx_ip_reset(vdev)) {
> +		ivpu_err(vdev, "Failed to reset NPU\n");
>  		ret = -EIO;
>  	}
>  
> @@ -661,6 +676,11 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> +	/* PLL requests may fail when powering down, so issue WP 0 here */
> +	ret = ivpu_pll_disable(vdev);
> +	if (ret)
> +		ivpu_warn(vdev, "Failed to disable PLL: %d\n", ret);
> +
>  	ret = ivpu_hw_37xx_d0i3_disable(vdev);
>  	if (ret)
>  		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index f501f27ebafd..fcc319ee0018 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -58,11 +58,14 @@ static int ivpu_suspend(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> +	/* Save PCI state before powering down as it sometimes gets corrupted if NPU hangs */
> +	pci_save_state(to_pci_dev(vdev->drm.dev));
> +
>  	ret = ivpu_shutdown(vdev);
> -	if (ret) {
> +	if (ret)
>  		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
> -		return ret;
> -	}
> +
> +	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
>  
>  	return ret;
>  }
> @@ -200,9 +203,6 @@ int ivpu_pm_suspend_cb(struct device *dev)
>  	ivpu_suspend(vdev);
>  	ivpu_pm_prepare_warm_boot(vdev);
>  
> -	pci_save_state(to_pci_dev(dev));
> -	pci_set_power_state(to_pci_dev(dev), PCI_D3hot);
> -
>  	ivpu_dbg(vdev, PM, "Suspend done.\n");
>  
>  	return 0;
