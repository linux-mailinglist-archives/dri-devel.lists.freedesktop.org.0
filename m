Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BBB84B50C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72329112B45;
	Tue,  6 Feb 2024 12:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHBqIP1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948C112B45
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707222149; x=1738758149;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=DZ8sXrB+iyH43x7pXen9w9vjRWTUYPjTfwVVUgu3GUc=;
 b=bHBqIP1Ole2u64GhtTUw9Lc5csqFYP3rTqWa8K7SQX775UpWyFyqhtPi
 7pHQZe3CAbtXM3A5qVLmg8R85ThIaCkv5ssD60MfBIbqrnLrpt27JwC+Z
 Mx7g27pShiXcd0niFfKPqqq20PXRSSw0uQnDArqdE8tEyEP5U+/ctjT9i
 yK4e4HRyvTa4aHHHgtL5AIkZfwA5ke6e4v2QunC0jMdm4Pp4R0UF+lzql
 Ut+/Fp8Oq3w9Vz2D2pRsuOBn7IvCELAy2Tzgx7zniIrnDomSv5dYx3n2e
 Qub8glcYlEIMJ3HPXpILjsdHv7Dpj6gLQ6lid0t5FT64mzVTswGSmQgB3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18156209"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="18156209"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909624554"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="909624554"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.82])
 ([10.217.160.82])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:22:27 -0800
Message-ID: <6f102565-70a0-456d-97fb-43af8c9f0fb9@linux.intel.com>
Date: Tue, 6 Feb 2024 13:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] accel/ivpu: Gracefully shutdown NPU before reset
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
 <20240126122804.2169129-5-jacek.lawrynowicz@linux.intel.com>
 <e1c84571-431c-a8ae-eedb-cc0306fff99b@quicinc.com>
 <db4a3b14-3fc1-4687-ba18-a52f9bc0db82@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <db4a3b14-3fc1-4687-ba18-a52f9bc0db82@linux.intel.com>
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

On 05.02.2024 09:39, Jacek Lawrynowicz wrote:
> On 26.01.2024 19:23, Jeffrey Hugo wrote:
>> On 1/26/2024 5:28 AM, Jacek Lawrynowicz wrote:
>>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>>
>>> Replace forceful disable of power domains with requests to disable
>>> TOP NOC CPU_CTRL and HOSTIF_L2CACHE through QREQN.
>>>
>>> In case of failure retry multiple times following HAS sequence of
>>> checking both QACCEPN and QDENYN registers.
>>>
>>> This fixes VPU hangs with PCODE released in January 2024 onwards.
>>>
>>> Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
>>> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>   drivers/accel/ivpu/ivpu_hw_37xx.c | 122 +++++++++++++++---------------
>>>   1 file changed, 60 insertions(+), 62 deletions(-)
>>>

...

>>>   static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
>>>   {
>>>       u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
>>> @@ -618,19 +617,18 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>>>     static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>>>   {
>>> -    int ret = 0;
>>> +    int retries = 100;
>>>   -    if (ivpu_boot_pwr_domain_disable(vdev)) {
>>> -        ivpu_err(vdev, "Failed to disable power domain\n");
>>> -        ret = -EIO;
>>> -    }
>>> +    while (ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(vdev) && --retries > 0)
>>> +        ivpu_warn(vdev, "Retrying to disable CPU control, retries left: %d\n", retries);
>>>   -    if (ivpu_pll_disable(vdev)) {
>>> -        ivpu_err(vdev, "Failed to disable PLL\n");
>>> -        ret = -EIO;
>>> -    }
>>> +    while (ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(vdev) && --retries > 0)
>>> +        ivpu_warn(vdev, "Retrying to disable HostIf L2 Cache, retries left: %d\n", retries);
>>>   -    return ret;
>>> +    while (ivpu_pll_disable(vdev) && --retries > 0)
>>> +        ivpu_warn(vdev, "Retrying to disable PLL, retries left: %d\n", retries);
>>> +
>>> +    return retries > 0 ? 0 : -EIO;
>>
>> It seems weird that retries is never reset between operations.  Why is that?
> 
> This is intentional.
> Retries are shared among all operations as we don't exacly know max number of retries for each of them.

We found a better solution to our stability issues. I will drop this patch and submit a new one.
