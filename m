Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37615727743
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 08:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ED910E58A;
	Thu,  8 Jun 2023 06:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552410E593
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 06:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686205862; x=1717741862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Eh8YyZ5wqzQOSWU6BPagtOC0CorxRe/dvdgAnnYI6k8=;
 b=EqeT05Ht9yBnBVP8airnwXbRFx/yibPB6LiP5UerpFpxDGvlVE/g9i68
 DwWqXq+xoAr9yfAIM3li4mYWxIMIHuWQM+DMbvNi4YacTfL2BjGMF7zvl
 UHuuLhQSlZxP1MDcQZ9Ph3SXbT+sWdCOt9r69szGTRtButNT5C5uWadK0
 LFqxmWd2Uq/Qx9CxpxpjvTjEYdfYeWeOSpZFNho5mhnKz9Tuxi/iggvuh
 4RX8zo/rkbEwiknIfZdwnI3ccHdRGQ32QJSL2QuxBJNwJNwND+V1j6d1V
 K3P56rEFTCxU8ShktugoMVlIGPM3kGaScRtZxlBuCjvkVxZHVBSHYhjnx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443589949"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="443589949"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712987791"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="712987791"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:30:59 -0700
Date: Thu, 8 Jun 2023 08:30:57 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/ivpu: Fix sporadic VPU boot failure
Message-ID: <20230608063057.GH324119@linux.intel.com>
References: <20230607094502.388489-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607094502.388489-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 11:45:02AM +0200, Stanislaw Gruszka wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> Wait for AON bit in HOST_SS_CPR_RST_CLR to return 0 before
> starting VPUIP power up sequence, otherwise the VPU device
> may sporadically fail to boot.
> 
> An error in power up sequence is propagated to the runtime
> power management - the device will be in an error state
> until the VPU driver is reloaded.
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Cc: stable@vger.kernel.org # 6.3.x
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Applied to drm-misc-fixes

Thanks
Stanislaw

> ---
>  drivers/accel/ivpu/ivpu_hw_mtl.c     | 13 ++++++++++++-
>  drivers/accel/ivpu/ivpu_hw_mtl_reg.h |  1 +
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
> index 382ec127be8e..efae679d7b7a 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
> @@ -197,6 +197,11 @@ static void ivpu_pll_init_frequency_ratios(struct ivpu_device *vdev)
>  	hw->pll.pn_ratio = clamp_t(u8, fuse_pn_ratio, hw->pll.min_ratio, hw->pll.max_ratio);
>  }
>  
> +static int ivpu_hw_mtl_wait_for_vpuip_bar(struct ivpu_device *vdev)
> +{
> +	return REGV_POLL_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, AON, 0, 100);
> +}
> +
>  static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
>  {
>  	struct ivpu_hw_info *hw = vdev->hw;
> @@ -239,6 +244,12 @@ static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
>  			ivpu_err(vdev, "Timed out waiting for PLL ready status\n");
>  			return ret;
>  		}
> +
> +		ret = ivpu_hw_mtl_wait_for_vpuip_bar(vdev);
> +		if (ret) {
> +			ivpu_err(vdev, "Timed out waiting for VPUIP bar\n");
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> @@ -256,7 +267,7 @@ static int ivpu_pll_disable(struct ivpu_device *vdev)
>  
>  static void ivpu_boot_host_ss_rst_clr_assert(struct ivpu_device *vdev)
>  {
> -	u32 val = REGV_RD32(MTL_VPU_HOST_SS_CPR_RST_CLR);
> +	u32 val = 0;
>  
>  	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, TOP_NOC, val);
>  	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, DSS_MAS, val);
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl_reg.h b/drivers/accel/ivpu/ivpu_hw_mtl_reg.h
> index d83ccfd9a871..593b8ff07417 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl_reg.h
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl_reg.h
> @@ -91,6 +91,7 @@
>  #define MTL_VPU_HOST_SS_CPR_RST_SET_MSS_MAS_MASK			BIT_MASK(11)
>  
>  #define MTL_VPU_HOST_SS_CPR_RST_CLR					0x00000098u
> +#define MTL_VPU_HOST_SS_CPR_RST_CLR_AON_MASK				BIT_MASK(0)
>  #define MTL_VPU_HOST_SS_CPR_RST_CLR_TOP_NOC_MASK			BIT_MASK(1)
>  #define MTL_VPU_HOST_SS_CPR_RST_CLR_DSS_MAS_MASK			BIT_MASK(10)
>  #define MTL_VPU_HOST_SS_CPR_RST_CLR_MSS_MAS_MASK			BIT_MASK(11)
> -- 
> 2.25.1
> 
