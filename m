Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F3849583
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426BC10E67A;
	Mon,  5 Feb 2024 08:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQ/v4q2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B5A10E67A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707122357; x=1738658357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NgSzXsmm68jgrEfeE4r8V0JqG+NTAFAFdF74qGLOS70=;
 b=hQ/v4q2ZWfDSrSd2s2TqcPQxbEBdiitRdoPIDCS6zhR2QtL5lAXLDcBD
 NAujD/Iwa1TM2cWI2mFlOG/PXRNBCz/GF+CcdWAK5KejWsjGfsXgO/ls5
 fR5UXs2Hm0AA7qC3VGRGXS6UKCRhHVekI+rC9xmFseMj6rQYHw9gR6UgR
 QnVQfU9tJv0sq/VE/nXcgBxcqLBRre/obZgojof9e5GehlB5i/8pfZyuG
 gqYQYrDJthQ/tYR3OrsdkRj+hHN8eHCWqKdhlBozjvO6j3hRvm2DX5Rli
 7+eAcAwYikRQgMEV9tFraQ4dMix178rvKrIuvRmnTTAJbo3xMWm96oLEh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="25921646"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="25921646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 00:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5288672"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 00:39:15 -0800
Message-ID: <db4a3b14-3fc1-4687-ba18-a52f9bc0db82@linux.intel.com>
Date: Mon, 5 Feb 2024 09:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] accel/ivpu: Gracefully shutdown NPU before reset
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
 <20240126122804.2169129-5-jacek.lawrynowicz@linux.intel.com>
 <e1c84571-431c-a8ae-eedb-cc0306fff99b@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e1c84571-431c-a8ae-eedb-cc0306fff99b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 26.01.2024 19:23, Jeffrey Hugo wrote:
> On 1/26/2024 5:28 AM, Jacek Lawrynowicz wrote:
>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>
>> Replace forceful disable of power domains with requests to disable
>> TOP NOC CPU_CTRL and HOSTIF_L2CACHE through QREQN.
>>
>> In case of failure retry multiple times following HAS sequence of
>> checking both QACCEPN and QDENYN registers.
>>
>> This fixes VPU hangs with PCODE released in January 2024 onwards.
>>
>> Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
>> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_hw_37xx.c | 122 +++++++++++++++---------------
>>   1 file changed, 60 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
>> index 77accd029c4a..b1a3a19c8986 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
>> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
>> @@ -332,28 +332,6 @@ static int ivpu_boot_top_noc_qrenqn_check(struct ivpu_device *vdev, u32 exp_val)
>>       return 0;
>>   }
>>   -static int ivpu_boot_top_noc_qacceptn_check(struct ivpu_device *vdev, u32 exp_val)
>> -{
>> -    u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN);
>> -
>> -    if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, CPU_CTRL, exp_val, val) ||
>> -        !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, HOSTIF_L2CACHE, exp_val, val))
>> -        return -EIO;
>> -
>> -    return 0;
>> -}
>> -
>> -static int ivpu_boot_top_noc_qdeny_check(struct ivpu_device *vdev, u32 exp_val)
>> -{
>> -    u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY);
>> -
>> -    if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, CPU_CTRL, exp_val, val) ||
>> -        !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, HOSTIF_L2CACHE, exp_val, val))
>> -        return -EIO;
>> -
>> -    return 0;
>> -}
>> -
>>   static int ivpu_boot_host_ss_configure(struct ivpu_device *vdev)
>>   {
>>       ivpu_boot_host_ss_rst_clr_assert(vdev);
>> @@ -396,37 +374,68 @@ static int ivpu_boot_host_ss_axi_enable(struct ivpu_device *vdev)
>>       return ivpu_boot_host_ss_axi_drive(vdev, true);
>>   }
>>   -static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable)
>> +static int ivpu_boot_host_ss_top_noc_qacceptn_check(struct ivpu_device *vdev, bool enable, u32 mask)
>> +{
>> +    u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN) & mask;
>> +
>> +    if (enable && val == mask)
>> +        return 0;
>> +
>> +    if (!enable && val == 0)
>> +        return 0;
>> +
>> +    ivpu_dbg(vdev, PM, "Failed qacceptn check 0x%x (mask 0x%x enable %d)\n", val, mask, enable);
>> +    return -EIO;
>> +}
>> +
>> +static int ivpu_boot_host_ss_top_noc_qdeny_check(struct ivpu_device *vdev, u32 mask)
>> +{
>> +    u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY) & mask;
>> +
>> +    if (val) {
>> +        ivpu_dbg(vdev, PM, "Failed qdeny check 0x%x (mask 0x%x)\n", val, mask);
>> +        return -EIO;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable, u32 mask)
>>   {
>> -    int ret;
>>       u32 val;
>>         val = REGV_RD32(VPU_37XX_TOP_NOC_QREQN);
>> -    if (enable) {
>> -        val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
>> -        val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
>> -    } else {
>> -        val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
>> -        val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
>> -    }
>> -    REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val);
>> +    if (enable)
>> +        REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val | mask);
>> +    else
>> +        REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val & ~mask);
>>   -    ret = ivpu_boot_top_noc_qacceptn_check(vdev, enable ? 0x1 : 0x0);
>> -    if (ret) {
>> -        ivpu_err(vdev, "Failed qacceptn check: %d\n", ret);
>> -        return ret;
>> -    }
>> +    if (!ivpu_boot_host_ss_top_noc_qacceptn_check(vdev, enable, mask))
>> +        return 0;
>>   -    ret = ivpu_boot_top_noc_qdeny_check(vdev, 0x0);
>> -    if (ret)
>> -        ivpu_err(vdev, "Failed qdeny check: %d\n", ret);
>> +    if (!enable && ivpu_boot_host_ss_top_noc_qdeny_check(vdev, mask))
>> +        REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val | mask);
>>   -    return ret;
>> +    return -EIO;
>>   }
>>     static int ivpu_boot_host_ss_top_noc_enable(struct ivpu_device *vdev)
>>   {
>> -    return ivpu_boot_host_ss_top_noc_drive(vdev, true);
>> +    return ivpu_boot_host_ss_top_noc_drive(vdev, true,
>> +                           VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK |
>> +                           VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK);
>> +}
>> +
>> +static int ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(struct ivpu_device *vdev)
>> +{
>> +    return ivpu_boot_host_ss_top_noc_drive(vdev, false,
>> +                           VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK);
>> +}
>> +
>> +static int ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(struct ivpu_device *vdev)
>> +{
>> +    return ivpu_boot_host_ss_top_noc_drive(vdev, false,
>> +                           VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK);
>>   }
>>     static void ivpu_boot_pwr_island_trickle_drive(struct ivpu_device *vdev, bool enable)
>> @@ -510,16 +519,6 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
>>       return ret;
>>   }
>>   -static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
>> -{
>> -    ivpu_boot_dpu_active_drive(vdev, false);
>> -    ivpu_boot_pwr_island_isolation_drive(vdev, true);
>> -    ivpu_boot_pwr_island_trickle_drive(vdev, false);
>> -    ivpu_boot_pwr_island_drive(vdev, false);
>> -
>> -    return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
>> -}
>> -
>>   static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
>>   {
>>       u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
>> @@ -618,19 +617,18 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>>     static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>>   {
>> -    int ret = 0;
>> +    int retries = 100;
>>   -    if (ivpu_boot_pwr_domain_disable(vdev)) {
>> -        ivpu_err(vdev, "Failed to disable power domain\n");
>> -        ret = -EIO;
>> -    }
>> +    while (ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(vdev) && --retries > 0)
>> +        ivpu_warn(vdev, "Retrying to disable CPU control, retries left: %d\n", retries);
>>   -    if (ivpu_pll_disable(vdev)) {
>> -        ivpu_err(vdev, "Failed to disable PLL\n");
>> -        ret = -EIO;
>> -    }
>> +    while (ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(vdev) && --retries > 0)
>> +        ivpu_warn(vdev, "Retrying to disable HostIf L2 Cache, retries left: %d\n", retries);
>>   -    return ret;
>> +    while (ivpu_pll_disable(vdev) && --retries > 0)
>> +        ivpu_warn(vdev, "Retrying to disable PLL, retries left: %d\n", retries);
>> +
>> +    return retries > 0 ? 0 : -EIO;
> 
> It seems weird that retries is never reset between operations.  Why is that?

This is intentional.
Retries are shared among all operations as we don't exacly know max number of retries for each of them.


