Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E249BAF880
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 10:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7E10E6A1;
	Wed,  1 Oct 2025 08:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5PEvKz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B81810E6A1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759305762; x=1790841762;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=gQAZStyY4FfVbPYZBL0f800Vs+yN83GW4o8/+Qr9DS4=;
 b=J5PEvKz1BeVY6JNMbDyiVjkD0C9tifuRIw3JspEe1CjzytdMI11EqxiR
 tpnQf8MnhP6r+6uXIBp0mKdMTelYiPb5EuwmgUYrGcfGseVbfcvp8Ek3V
 in7u/rgr5ASChHUHbb/xZNyt36XWfFLB4AlELaWx//VXJ0B9vzi+SodNR
 NUjRxG80CypQgpnANDP8ao/1yNG+c3YxAgpqMmHU1Pof5UNlgcLF0hKcM
 XVMkguAfsCY14VjfjJ+ANGqyumZ/RCgyiEBUsPbQXblt826weClvnTQXR
 /Ka6nbR6QOr7bmIqxofh/8Sqh/hC0aArPGxWsqt6S/TBjVwQi30OPHD+l Q==;
X-CSE-ConnectionGUID: TYwg8tDqRgedHG7O1aFDcA==
X-CSE-MsgGUID: BdSEt2KqTK6d/J0jJyu9IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61680289"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61680289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:02:42 -0700
X-CSE-ConnectionGUID: KBb7X5/xSQeEY1gI9r7wqQ==
X-CSE-MsgGUID: sWA7E8Y7SLGoZZF8HmZI9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209443981"
Received: from unknown (HELO [10.102.88.152]) ([10.102.88.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:02:40 -0700
Message-ID: <7c9e0f75-2a25-434f-b021-548e0a8dc003@linux.intel.com>
Date: Wed, 1 Oct 2025 10:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Enable MCA ECC signalling based on MSR
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20250925145020.1446208-1-maciej.falkowski@linux.intel.com>
 <0afdf845-0ce0-45f2-85f3-5633987db268@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <0afdf845-0ce0-45f2-85f3-5633987db268@linux.intel.com>
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

Applied to drm-misc-next

On 10/1/2025 9:47 AM, Karol Wachowski wrote:
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> On 9/25/2025 4:50 PM, Maciej Falkowski wrote:
>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>
>> Add new boot parameter for NPU5+ that enables
>> ECC signalling for on-chip memory based on the value
>> of MSR_INTEGRITY_CAPS register.
>>
>> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/ivpu_fw.c |  4 ++++
>>  drivers/accel/ivpu/ivpu_hw.c | 23 +++++++++++++++++++++++
>>  drivers/accel/ivpu/ivpu_hw.h |  1 +
>>  3 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>> index b81bd143a285..be1290be77fd 100644
>> --- a/drivers/accel/ivpu/ivpu_fw.c
>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>> @@ -606,6 +606,8 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>>  		 boot_params->system_time_us);
>>  	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = 0x%x\n",
>>  		 boot_params->power_profile);
>> +	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_uses_ecc_mca_signal = 0x%x\n",
>> +		 boot_params->vpu_uses_ecc_mca_signal);
>>  }
>>  
>>  void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
>> @@ -708,6 +710,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
>>  	boot_params->d0i3_entry_vpu_ts = 0;
>>  	if (IVPU_WA(disable_d0i2))
>>  		boot_params->power_profile |= BIT(1);
>> +	boot_params->vpu_uses_ecc_mca_signal =
>> +		ivpu_hw_uses_ecc_mca_signal(vdev) ? VPU_BOOT_MCA_ECC_BOTH : 0;
>>  
>>  	boot_params->system_time_us = ktime_to_us(ktime_get_real());
>>  	wmb(); /* Flush WC buffers after writing bootparams */
>> diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
>> index 8dbf8780920a..d69cd0d93569 100644
>> --- a/drivers/accel/ivpu/ivpu_hw.c
>> +++ b/drivers/accel/ivpu/ivpu_hw.c
>> @@ -8,6 +8,8 @@
>>  #include "ivpu_hw_btrs.h"
>>  #include "ivpu_hw_ip.h"
>>  
>> +#include <asm/msr-index.h>
>> +#include <asm/msr.h>
>>  #include <linux/dmi.h>
>>  #include <linux/fault-inject.h>
>>  #include <linux/pm_runtime.h>
>> @@ -22,6 +24,8 @@ MODULE_PARM_DESC(fail_hw, "<interval>,<probability>,<space>,<times>");
>>  
>>  #define FW_SHARED_MEM_ALIGNMENT	SZ_512K /* VPU MTRR limitation */
>>  
>> +#define ECC_MCA_SIGNAL_ENABLE_MASK	0xff
>> +
>>  static char *platform_to_str(u32 platform)
>>  {
>>  	switch (platform) {
>> @@ -395,3 +399,22 @@ irqreturn_t ivpu_hw_irq_handler(int irq, void *ptr)
>>  	pm_runtime_mark_last_busy(vdev->drm.dev);
>>  	return IRQ_HANDLED;
>>  }
>> +
>> +bool ivpu_hw_uses_ecc_mca_signal(struct ivpu_device *vdev)
>> +{
>> +	unsigned long long msr_integrity_caps;
>> +	int ret;
>> +
>> +	if (ivpu_hw_ip_gen(vdev) < IVPU_HW_IP_50XX)
>> +		return false;
>> +
>> +	ret = rdmsrq_safe(MSR_INTEGRITY_CAPS, &msr_integrity_caps);
>> +	if (ret) {
>> +		ivpu_warn(vdev, "Error reading MSR_INTEGRITY_CAPS: %d", ret);
>> +		return false;
>> +	}
>> +
>> +	ivpu_dbg(vdev, MISC, "MSR_INTEGRITY_CAPS: 0x%llx\n", msr_integrity_caps);
>> +
>> +	return msr_integrity_caps & ECC_MCA_SIGNAL_ENABLE_MASK;
>> +}
>> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
>> index 511a1a29f7f6..b6d0f0d0dccc 100644
>> --- a/drivers/accel/ivpu/ivpu_hw.h
>> +++ b/drivers/accel/ivpu/ivpu_hw.h
>> @@ -63,6 +63,7 @@ void ivpu_irq_handlers_init(struct ivpu_device *vdev);
>>  void ivpu_hw_irq_enable(struct ivpu_device *vdev);
>>  void ivpu_hw_irq_disable(struct ivpu_device *vdev);
>>  irqreturn_t ivpu_hw_irq_handler(int irq, void *ptr);
>> +bool ivpu_hw_uses_ecc_mca_signal(struct ivpu_device *vdev);
>>  
>>  static inline u32 ivpu_hw_btrs_irq_handler(struct ivpu_device *vdev, int irq)
>>  {
