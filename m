Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C8C21135
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3F710E9F6;
	Thu, 30 Oct 2025 16:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGiyhoJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32D810E9F6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761840030; x=1793376030;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w2qiHt8EEq7Myb43sN5XT6AcoQr/FHqZnRkVrOu9ABI=;
 b=EGiyhoJT6a47/nvcyboIqV/8YlakD4B273w9XgCf4/hSmCAr7KbKBImL
 FwANCx3sya64YRWyrhvd2iceElQ89Oh9T71NcpuOyafyNF5/LnK1r4in6
 F2tr7dHxTUfEbLaiRgY88eygATCg2HvkS+imemtgw9cY4eimepix8Ql6Z
 l6zlIoWUxHXhcoJMAxmWlaqwDrFGahw3/+q5Gh+daufgfrI9QWtqf8PEg
 UZsmrezQw33nItkdGtPn9Onpy0fqfexFRKGdbmwpSofe4XSLZinNFFhiw
 uDLJi8LiUIulNGakWFqjgw+ZSmsqhPsXkQlmAjPOQCGvq6RVsx1scv7Pm Q==;
X-CSE-ConnectionGUID: yg/D0kxhQyaSjaADYyUxBQ==
X-CSE-MsgGUID: Ny30orxRQ+yndFtNWe4qVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89453980"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="89453980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:00:30 -0700
X-CSE-ConnectionGUID: cs5DdlIfTrSqxg/1jgUzRA==
X-CSE-MsgGUID: xjJ9NKqsQJCY15W6J4+jdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190333954"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.226])
 ([10.246.16.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:00:29 -0700
Message-ID: <9d8ea728-da34-43c8-b149-2305ec16a96c@linux.intel.com>
Date: Thu, 30 Oct 2025 17:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Wait for CDYN de-assertion during power
 down sequence
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20251030091700.293341-1-karol.wachowski@linux.intel.com>
 <72d53da3-b974-4951-b172-7cf0cd3007b6@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <72d53da3-b974-4951-b172-7cf0cd3007b6@linux.intel.com>
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

On 10/30/2025 4:56 PM, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 10/30/2025 10:17 AM, Karol Wachowski wrote:
>> During power down, pending DVFS operations may still be in progress
>> when the NPU reset is asserted after CDYN=0 is set. Since the READY
>> bit may already be deasserted at this point, checking only the READY
>> bit is insufficient to ensure all transactions have completed.
>>
>> Add an explicit check for CDYN de-assertion after the READY bit check
>> to guarantee no outstanding transactions remain before proceeding.
>>
>> Fixes: 550f4dd2cedd ("accel/ivpu: Add support for Nova Lake's NPU")
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>> Changes in v2:
>>   - Add Fixes tag
>> ---
>>   drivers/accel/ivpu/ivpu_hw_btrs.c         | 16 ++++++++++++++++
>>   drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  3 +++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c
>> b/drivers/accel/ivpu/ivpu_hw_btrs.c
>> index 2085edbfd40a..06e65c592618 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
>> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
>> @@ -321,6 +321,14 @@ static int wait_for_pll_lock(struct ivpu_device
>> *vdev, bool enable)
>>       return REGB_POLL_FLD(VPU_HW_BTRS_MTL_PLL_STATUS, LOCK, exp_val,
>> PLL_TIMEOUT_US);
>>   }
>>   +static int wait_for_cdyn_deassert(struct ivpu_device *vdev)
>> +{
>> +    if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
>> +        return 0;
>> +
>> +    return REGB_POLL_FLD(VPU_HW_BTRS_LNL_CDYN, CDYN, 0,
>> PLL_TIMEOUT_US);
>> +}
>> +
>>   int ivpu_hw_btrs_wp_drive(struct ivpu_device *vdev, bool enable)
>>   {
>>       struct wp_request wp;
>> @@ -354,6 +362,14 @@ int ivpu_hw_btrs_wp_drive(struct ivpu_device
>> *vdev, bool enable)
>>           return ret;
>>       }
>>   +    if (!enable) {
>> +        ret = wait_for_cdyn_deassert(vdev);
>> +        if (ret) {
>> +            ivpu_err(vdev, "Timed out waiting for CDYN deassert\n");
>> +            return ret;
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>>   diff --git a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
>> b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
>> index fff2ef2cada6..a81a9ba540fa 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
>> +++ b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
>> @@ -74,6 +74,9 @@
>>   #define VPU_HW_BTRS_LNL_PLL_FREQ                0x00000148u
>>   #define VPU_HW_BTRS_LNL_PLL_FREQ_RATIO_MASK            GENMASK(15, 0)
>>   +#define VPU_HW_BTRS_LNL_CDYN                    0x0000014cu
>> +#define VPU_HW_BTRS_LNL_CDYN_CDYN_MASK                GENMASK(15, 0)
>> +
>>   #define VPU_HW_BTRS_LNL_TILE_FUSE                0x00000150u
>>   #define VPU_HW_BTRS_LNL_TILE_FUSE_VALID_MASK            BIT_MASK(0)
>>   #define VPU_HW_BTRS_LNL_TILE_FUSE_
>> CONFIG_MASK            GENMASK(6, 1) 

Thanks,
Pushed to drm-misc-next.

-Karol

