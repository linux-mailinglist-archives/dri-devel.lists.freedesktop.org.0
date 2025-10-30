Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A457FC2110E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED410EA09;
	Thu, 30 Oct 2025 15:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/geq2Ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C45810EA04
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761839839; x=1793375839;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K2Ktrh+OX7Nhj68wQFAh8a0ekTu23ZTcGuwfsdNz2Vk=;
 b=k/geq2AeRM3k+Fz97O+5JRt+kjlbBlE5fbovjAJXOv/sNWKJU45d30pC
 EECPlgpbnKResAd1xR9sjA2AR6ZaiYmB1scROZ8d9psCPTPFa82orRkSn
 MUCKIr8O9rvt7vfEpWJsgjIEFgmVK2Boq4d726i1Loogpx927J6wcxjuh
 J/V8X8a405/i4Ye7pbmUEbg/MWb+XO1mBTDpDpj/43lswrqF9UbznM8hE
 ECN3TwACFlmjHGlY6mjKUizejQxPU/8tVBezUnPszguFp76++LtMG7iGA
 pZqk9IzwqZLZTKyMLD0PzTg7oc24vGI9ep/8B/YLETN5ZFsseQEAjxUXI A==;
X-CSE-ConnectionGUID: 9wuJoKy3Sp2zHEVz/mi9wA==
X-CSE-MsgGUID: 7Cr+Lkh+Qs6Oi7x1WGgoLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81403481"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="81403481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:56:50 -0700
X-CSE-ConnectionGUID: zhrdOQ1HRfySuUDHRDrmHQ==
X-CSE-MsgGUID: 7I0Pk0MmTb+/jN5G4Sd3Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185253883"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.115])
 ([10.246.17.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:56:48 -0700
Message-ID: <72d53da3-b974-4951-b172-7cf0cd3007b6@linux.intel.com>
Date: Thu, 30 Oct 2025 16:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Wait for CDYN de-assertion during power
 down sequence
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20251030091700.293341-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251030091700.293341-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 10/30/2025 10:17 AM, Karol Wachowski wrote:
> During power down, pending DVFS operations may still be in progress
> when the NPU reset is asserted after CDYN=0 is set. Since the READY
> bit may already be deasserted at this point, checking only the READY
> bit is insufficient to ensure all transactions have completed.
>
> Add an explicit check for CDYN de-assertion after the READY bit check
> to guarantee no outstanding transactions remain before proceeding.
>
> Fixes: 550f4dd2cedd ("accel/ivpu: Add support for Nova Lake's NPU")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
> Changes in v2:
>   - Add Fixes tag
> ---
>   drivers/accel/ivpu/ivpu_hw_btrs.c         | 16 ++++++++++++++++
>   drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  3 +++
>   2 files changed, 19 insertions(+)
>
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index 2085edbfd40a..06e65c592618 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -321,6 +321,14 @@ static int wait_for_pll_lock(struct ivpu_device *vdev, bool enable)
>   	return REGB_POLL_FLD(VPU_HW_BTRS_MTL_PLL_STATUS, LOCK, exp_val, PLL_TIMEOUT_US);
>   }
>   
> +static int wait_for_cdyn_deassert(struct ivpu_device *vdev)
> +{
> +	if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
> +		return 0;
> +
> +	return REGB_POLL_FLD(VPU_HW_BTRS_LNL_CDYN, CDYN, 0, PLL_TIMEOUT_US);
> +}
> +
>   int ivpu_hw_btrs_wp_drive(struct ivpu_device *vdev, bool enable)
>   {
>   	struct wp_request wp;
> @@ -354,6 +362,14 @@ int ivpu_hw_btrs_wp_drive(struct ivpu_device *vdev, bool enable)
>   		return ret;
>   	}
>   
> +	if (!enable) {
> +		ret = wait_for_cdyn_deassert(vdev);
> +		if (ret) {
> +			ivpu_err(vdev, "Timed out waiting for CDYN deassert\n");
> +			return ret;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
> index fff2ef2cada6..a81a9ba540fa 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
> @@ -74,6 +74,9 @@
>   #define VPU_HW_BTRS_LNL_PLL_FREQ				0x00000148u
>   #define VPU_HW_BTRS_LNL_PLL_FREQ_RATIO_MASK			GENMASK(15, 0)
>   
> +#define VPU_HW_BTRS_LNL_CDYN					0x0000014cu
> +#define VPU_HW_BTRS_LNL_CDYN_CDYN_MASK				GENMASK(15, 0)
> +
>   #define VPU_HW_BTRS_LNL_TILE_FUSE				0x00000150u
>   #define VPU_HW_BTRS_LNL_TILE_FUSE_VALID_MASK			BIT_MASK(0)
>   #define VPU_HW_BTRS_LNL_TILE_FUSE_CONFIG_MASK			GENMASK(6, 1)
