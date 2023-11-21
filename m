Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728127F2779
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E010E284;
	Tue, 21 Nov 2023 08:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41FE10E284
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700555437; x=1732091437;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=W4Ue5y90Kh57Vmwk33u3OCYCYSDgFulLZFsAGMq+Dlw=;
 b=bP/98H8sQDtXoeP2K92M0xsNOa8y1dRjsg8BPpsraIgyo+tFKbLWczvc
 Azu1+VDIu4zVl5OACB2bt05Y9K/rkoCW2N3ISfk5ZSwc8hjxzbDtPyXeA
 1STodDgnToD5oWfX4mlO8es/IW2iH1V5ppDar8/KWMzDithvB964XU5vL
 LDv2i2W/w7H58AxrdvvKrWpopwnOxJC3yl4tnebghF0EIGQjTVcPPLFeW
 6i+nabc7RYFGRKCT/4AlE+lG32Giqal9QP7JAX3sKkGuZk0B7d4k1rI+1
 ZubDlnrl+NYbmy4MtMJFamZpLhOpRvFEVln9zyosp6zl9PS1xv7oWQHw8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422892306"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="422892306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832567117"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="832567117"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.78])
 ([10.217.160.78])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:30:36 -0800
Message-ID: <4c0f9f02-ad15-420d-8fdb-42f56ff11c7a@linux.intel.com>
Date: Tue, 21 Nov 2023 09:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu/37xx: Fix hangs related to MMIO reset
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231115111004.1304092-1-jacek.lawrynowicz@linux.intel.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231115111004.1304092-1-jacek.lawrynowicz@linux.intel.com>
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

On 15.11.2023 12:10, Jacek Lawrynowicz wrote:
> There is no need to call MMIO reset using VPU_37XX_BUTTRESS_VPU_IP_RESET
> register. IP will be reset by FLR or by entering d0i3. Also IP reset
> during power_up is not needed as the VPU is already in reset.
> 
> Removing MMIO reset improves stability as it a partial device reset
> that is not safe in some corner cases.
> 
> This change also brings back ivpu_boot_pwr_domain_disable() that
> helps to properly power down VPU when it is hung by a buggy workload.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Fixes: 828d63042aec ("accel/ivpu: Don't enter d0i3 during FLR")
> ---
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 46 +++++++++++++++----------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 5c0246b9e522..4ccf1994b97a 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -502,6 +502,16 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
>  	return ret;
>  }
>  
> +static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
> +{
> +	ivpu_boot_dpu_active_drive(vdev, false);
> +	ivpu_boot_pwr_island_isolation_drive(vdev, true);
> +	ivpu_boot_pwr_island_trickle_drive(vdev, false);
> +	ivpu_boot_pwr_island_drive(vdev, false);
> +
> +	return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
> +}
> +
>  static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
>  {
>  	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
> @@ -600,25 +610,17 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>  
>  static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>  {
> -	int ret;
> -	u32 val;
> -
> -	if (IVPU_WA(punit_disabled))
> -		return 0;
> +	int ret = 0;
>  
> -	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
> -	if (ret) {
> -		ivpu_err(vdev, "Timed out waiting for TRIGGER bit\n");
> -		return ret;
> +	if (ivpu_boot_pwr_domain_disable(vdev)) {
> +		ivpu_err(vdev, "Failed to disable power domain\n");
> +		ret = -EIO;
>  	}
>  
> -	val = REGB_RD32(VPU_37XX_BUTTRESS_VPU_IP_RESET);
> -	val = REG_SET_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, val);
> -	REGB_WR32(VPU_37XX_BUTTRESS_VPU_IP_RESET, val);
> -
> -	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
> -	if (ret)
> -		ivpu_err(vdev, "Timed out waiting for RESET completion\n");
> +	if (ivpu_pll_disable(vdev)) {
> +		ivpu_err(vdev, "Failed to disable PLL\n");
> +		ret = -EIO;
> +	}
>  
>  	return ret;
>  }
> @@ -651,10 +653,6 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> -	ret = ivpu_hw_37xx_reset(vdev);
> -	if (ret)
> -		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
> -
>  	ret = ivpu_hw_37xx_d0i3_disable(vdev);
>  	if (ret)
>  		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
> @@ -722,11 +720,11 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
>  {
>  	int ret = 0;
>  
> -	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_reset(vdev))
> -		ivpu_err(vdev, "Failed to reset the VPU\n");
> +	if (!ivpu_hw_37xx_is_idle(vdev))
> +		ivpu_warn(vdev, "VPU not idle during power down\n");
>  
> -	if (ivpu_pll_disable(vdev)) {
> -		ivpu_err(vdev, "Failed to disable PLL\n");
> +	if (ivpu_hw_37xx_reset(vdev)) {
> +		ivpu_err(vdev, "Failed to reset VPU\n");
>  		ret = -EIO;
>  	}
>  
