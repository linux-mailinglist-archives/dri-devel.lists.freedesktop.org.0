Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BEB627768
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DD210E27B;
	Mon, 14 Nov 2022 08:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC6010E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668414081; x=1699950081;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GWL1Zdg8VM0L4az7SdmVEV/OAhYP09tb0bBONmyWxYo=;
 b=i8wWvFvmkThk9lbcYi5yKb96AU+dHmf/jhOGtjXTxsl/b8os4ul0RdIg
 pD56Q/9xnDReoUzKAYh7D+Ps7oi8AIrq/A6nyr7MQX/QrExFRLT3oSNul
 4lBtBXP0gyJ13GOtl/qsHbpsBSBQrhzz8AzKoCO1A0Aa0YooExwvw2XVy
 ooupA2dPCM5Ms+gMm28dIILL5IYh6IYDEBn86lmTh5u7wjmc/iGWUEE6O
 npr1zTnTjf59hhNtZKugsORvQGVvwdz2Gx8wa7/wD4rFDNasq0sx+tcnk
 3/F4EwdZmEXiZ98eEVmAeShDxtjDI87w9b9OtJvPiGZV8Br28y+KMaWuQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="299430235"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="299430235"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 00:21:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="669552903"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="669552903"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.143.213])
 ([10.249.143.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 00:21:18 -0800
Message-ID: <9a9755b9-ad60-2f00-6845-00e0083579b8@linux.intel.com>
Date: Mon, 14 Nov 2022 09:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 5/7] drm/ivpu: Implement firmware parsing and booting
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-6-jacek.lawrynowicz@linux.intel.com>
 <1ba0151e-daf8-04ef-ffad-63973f85ecbc@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1ba0151e-daf8-04ef-ffad-63973f85ecbc@suse.de>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/2022 11:08 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.09.22 um 17:11 schrieb Jacek Lawrynowicz:
>> Read, parse and boot VPU firmware image.
>>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ivpu/Makefile       |   1 +
>>   drivers/gpu/drm/ivpu/ivpu_drv.c     | 122 +++++++-
>>   drivers/gpu/drm/ivpu/ivpu_drv.h     |  10 +
>>   drivers/gpu/drm/ivpu/ivpu_fw.c      | 422 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_fw.h      |  38 +++
>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl.c  |  11 +
>>   drivers/gpu/drm/ivpu/vpu_boot_api.h | 241 ++++++++++++++++
>>   include/uapi/drm/ivpu_drm.h         |  21 ++
>>   8 files changed, 865 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_fw.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_fw.h
>>   create mode 100644 drivers/gpu/drm/ivpu/vpu_boot_api.h
>>

>> diff --git a/drivers/gpu/drm/ivpu/ivpu_fw.c b/drivers/gpu/drm/ivpu/ivpu_fw.c
>> new file mode 100644
>> index 000000000000..d55f13f2daed
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ivpu/ivpu_fw.c
>> @@ -0,0 +1,422 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright © 2020-2022 Intel Corporation
>> + */
>> +
>> +#include <linux/firmware.h>
>> +#include <linux/highmem.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/pci.h>
>> +
>> +#include "vpu_boot_api.h"
>> +#include "ivpu_drv.h"
>> +#include "ivpu_fw.h"
>> +#include "ivpu_gem.h"
>> +#include "ivpu_hw.h"
>> +#include "ivpu_ipc.h"
>> +
>> +#define FW_MAX_NAMES        3
>> +#define FW_GLOBAL_MEM_START    (2ull * SZ_1G)
>> +#define FW_GLOBAL_MEM_END    (3ull * SZ_1G)
>> +#define FW_SHARED_MEM_SIZE    SZ_256M /* Must be aligned to FW_SHARED_MEM_ALIGNMENT */
>> +#define FW_SHARED_MEM_ALIGNMENT    SZ_128K /* VPU MTRR limitation */
>> +#define FW_RUNTIME_MAX_SIZE    SZ_512M
>> +#define FW_SHAVE_NN_MAX_SIZE    SZ_2M
>> +#define FW_RUNTIME_MIN_ADDR    (FW_GLOBAL_MEM_START)
>> +#define FW_RUNTIME_MAX_ADDR    (FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
>> +#define FW_VERSION_HEADER_SIZE    SZ_4K
>> +#define FW_FILE_IMAGE_OFFSET    (VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
>> +
>> +#define WATCHDOG_MSS_REDIRECT    32
>> +#define WATCHDOG_NCE_REDIRECT    33
>> +
>> +#define ADDR_TO_L2_CACHE_CFG(addr) ((addr) >> 31)
>> +
>> +#define IVPU_FW_CHECK_API(vdev, fw_hdr, name) ivpu_fw_check_api(vdev, fw_hdr, #name, \
>> +                                  VPU_##name##_API_VER_INDEX, \
>> +                                  VPU_##name##_API_VER_MAJOR, \
>> +                                  VPU_##name##_API_VER_MINOR)
>> +
>> +static char *ivpu_firmware;
>> +module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
>> +MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
>> +
>> +static int ivpu_fw_request(struct ivpu_device *vdev)
>> +{
>> +    const char *fw_names[FW_MAX_NAMES] = {
>> +        ivpu_firmware,
>> +        "mtl_vpu.bin",
>> +        "intel/vpu/mtl_vpu_v0.0.bin"
>> +    };
>> +    int ret = -ENOENT;
>> +    int i;
>> +
>> +    for (i = 0; i < FW_MAX_NAMES; i++) {
> 
> Better remove the constant FW_MAX_NAMES entirely and use ARRAY_SIZE(fw_names) here.

OK

Regards,
Jacek
