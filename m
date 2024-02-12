Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B33850E57
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3B810E388;
	Mon, 12 Feb 2024 08:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXIAXEkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6EB10E388
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707724805; x=1739260805;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3sGaZO8HV8Zzt8xMp5IOJG4/Dcgj99TlWig/2+004t8=;
 b=PXIAXEkn7DB/AyHYaKrPWO9HVa6xG0qX/1qoTfttLAYVFq8UHRc8HwOR
 8MfMHadM5Zcj02MP551ggsQCNcLkCYU3t1Du3Jvycm3T12Ng/76QXTu0J
 Hq51GB85lD9IzS7m4i5Ud2ngxLHSWNqfuX8seepfVyqHdS6yOSNcymmNh
 LUlPwPD+KeUi1tFKZXtwpAVsovajMgRVMHbUUUoge28FgdfA+Z9pjDgcS
 MInU/UmvdCATsUgzS1qyjaY9Vo4QCOW0lcYh+Qne2k57xYpdhHh1b/HNg
 ySgAvA+pefEscCGjWHQkbvEQvMi8sHRDTS/IvwGsUWU23xlt3rJ0kwFmP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="13063033"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; d="scan'208";a="13063033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2024 23:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2481443"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.168.63])
 ([10.217.168.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2024 23:59:57 -0800
Message-ID: <cea9a3ca-c481-49a4-b16f-35a6376ba3f4@linux.intel.com>
Date: Mon, 12 Feb 2024 08:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Fix DevTLB errors on suspend/resume and
 recovery
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com
References: <20240206151927.2925585-1-jacek.lawrynowicz@linux.intel.com>
 <20240207102446.3126981-1-jacek.lawrynowicz@linux.intel.com>
 <304ed6e4-945c-0c2c-e0ac-63cc33fdb55b@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <304ed6e4-945c-0c2c-e0ac-63cc33fdb55b@quicinc.com>
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

Hi,

On 09.02.2024 16:39, Jeffrey Hugo wrote:
> On 2/7/2024 3:24 AM, Jacek Lawrynowicz wrote:
>> Issue IP reset before shutdown in order to
>> complete all upstream requests to the SOC.
>> Without this DevTLB is complaining about
>> incomplete transactions and NPU cannot resume from
>> suspend.
>> This problem is only happening on recent IFWI
>> releases.
>>
>> IP reset in rare corner cases can mess up PCI
>> configuration, so save it before the reset.
>> After this happens it is also impossible to
>> issue PLL requests and D0->D3->D0 cycle is needed
>> to recover the NPU. Add WP 0 request on power up,
>> so the PUNIT is always notified about NPU reset.
>>
>> Use D0/D3 cycle for recovery as it can recover
>> from failed IP reset and FLR cannot.
>>
>> Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Nit below
> 

>>       ret = ivpu_shutdown(vdev);
>> -    if (ret) {
>> +    if (ret)
>>           ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
> 
> In the two logs you add in this change, the log has "NPU".  Here, there is "VPU".  As far as I understand VPU is the old term and NPU is the new term therefore it seems like all the logs should be updated to use the new term for consistency.  Outside of scope for this change though.

Ok, I will fix this in next patchset.

Thanks,
Jacek
