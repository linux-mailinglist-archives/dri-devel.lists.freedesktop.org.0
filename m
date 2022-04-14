Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D0B500799
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F377210FC47;
	Thu, 14 Apr 2022 07:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090010FC45;
 Thu, 14 Apr 2022 07:52:30 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae8d7.dynamic.kabel-deutschland.de
 [95.90.232.215])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6B44061EA1928;
 Thu, 14 Apr 2022 09:52:27 +0200 (CEST)
Message-ID: <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
Date: Thu, 14 Apr 2022 09:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Richard Gong <richard.gong@amd.com>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Cc: -kernel test robot <lkp@intel.com>]

Dear Alex, dear Richard,


Am 13.04.22 um 15:00 schrieb Alex Deucher:
> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:

>> Thank you for sending out v4.
>>
>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't work
>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards as
>>> video/display output, Intel Alder Lake based systems will hang during
>>> suspend/resume.
>>
>> I am still not clear, what “hang during suspend/resume” means. I guess
>> suspending works fine? During resume (S3 or S0ix?), where does it hang?
>> The system is functional, but there are only display problems?
>>
>>> The issue was initially reported on one system (Dell Precision 3660 with
>>> BIOS version 0.14.81), but was later confirmed to affect at least 4 Alder
>>> Lake based systems.
>>>
>>> Add extra check to disable ASPM on Intel Alder Lake based systems.
>>>
>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
>>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> This tag is a little confusing. Maybe clarify that it was for an issue
>> in a previous patch iteration?
>>
>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>> ---
>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>       enhanced check logic
>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>       correct build error with W=1 option
>>> v2: correct commit description
>>>       move the check from chip family to problematic platform
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>    1 file changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>> @@ -81,6 +81,10 @@
>>>    #include "mxgpu_vi.h"
>>>    #include "amdgpu_dm.h"
>>>
>>> +#if IS_ENABLED(CONFIG_X86)
>>> +#include <asm/intel-family.h>
>>> +#endif
>>> +
>>>    #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK    0x00000001L
>>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK        0x00000002L
>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device *adev)
>>>                WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>    }
>>>
>>> +static bool aspm_support_quirk_check(void)
>>> +{
>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>> +
>>> +             return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>>> +     }
>>> +
>>> +     return true;
>>> +}
>>> +
>>>    static void vi_program_aspm(struct amdgpu_device *adev)
>>>    {
>>>        u32 data, data1, orig;
>>>        bool bL1SS = false;
>>>        bool bClkReqSupport = true;
>>>
>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>> +     if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_check())
>>>                return;
>>
>> Can users still forcefully enable ASPM with the parameter `amdgpu.aspm`?
>>
>>>
>>>        if (adev->flags & AMD_IS_APU ||
>>
>> If I remember correctly, there were also newer cards, where ASPM worked
>> with Intel Alder Lake, right? Can only the problematic generations for
>> WX3200 and RX640 be excluded from ASPM?
> 
> This patch only disables it for the generation that was problematic.

Could that please be made clear in the commit message summary, and message?

Loosely related, is there a public (or internal issue) to analyze how to 
get ASPM working for VI generation devices with Intel Alder Lake?


Kind regards,

Paul
