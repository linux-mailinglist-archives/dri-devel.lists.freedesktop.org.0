Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8A509197
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471B910E3CD;
	Wed, 20 Apr 2022 20:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3FE10E3BB;
 Wed, 20 Apr 2022 20:48:33 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae925.dynamic.kabel-deutschland.de
 [95.90.233.37])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id F1A5061CCD7D8;
 Wed, 20 Apr 2022 22:48:31 +0200 (CEST)
Message-ID: <295e7882-21a2-f50f-6bfa-b0bae1d0fa12@molgen.mpg.de>
Date: Wed, 20 Apr 2022 22:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <CADnq5_NGTbTjn87tAsTJAMOKZ9niS7Mb=JDmjUH4KJXfDH_p_g@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CADnq5_NGTbTjn87tAsTJAMOKZ9niS7Mb=JDmjUH4KJXfDH_p_g@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Richard Gong <richard.gong@amd.com>,
 Xinhui Pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Alex,


Am 20.04.22 um 22:40 schrieb Alex Deucher:
> On Wed, Apr 20, 2022 at 4:29 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:

>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
>>
>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
>>>> [Cc: -kernel test robot <lkp@intel.com>]
>>
>> […]
>>
>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>>>>
>>>>>> Thank you for sending out v4.
>>>>>>
>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
>>>>>>> Active State Power Management (ASPM) feature is enabled since
>>>>>>> kernel 5.14.
>>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't
>>>>>>> work
>>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX
>>>>>>> cards as
>>>>>>> video/display output, Intel Alder Lake based systems will hang during
>>>>>>> suspend/resume.
>>
>> [Your email program wraps lines in cited text for some reason, making
>> the citation harder to read.]
>>
>>>>>>
>>>>>> I am still not clear, what “hang during suspend/resume” means. I guess
>>>>>> suspending works fine? During resume (S3 or S0ix?), where does it hang?
>>>>>> The system is functional, but there are only display problems?
>>> System freeze after suspend/resume.
>>
>> But you see certain messages still? At what point does it freeze
>> exactly? In the bug report you posted Linux messages.
>>
>>>>>>> The issue was initially reported on one system (Dell Precision 3660
>>>>>>> with
>>>>>>> BIOS version 0.14.81), but was later confirmed to affect at least 4
>>>>>>> Alder
>>>>>>> Lake based systems.
>>>>>>>
>>>>>>> Add extra check to disable ASPM on Intel Alder Lake based systems.
>>>>>>>
>>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>>>>>>> Link:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=04%7C01%7Crichard.gong%40amd.com%7Ce7febed5d6a441c3a58008da1debb99c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637855195670542145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7cEnE%2BSM9e5IGFxSLloCLtCOxovBpaPz0Ns0Ta2vVlc%3D&amp;reserved=0
>>
>> Thank you Microsoft Outlook for keeping us safe. :(
>>
>>>>>>>
>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>
>>>>>> This tag is a little confusing. Maybe clarify that it was for an issue
>>>>>> in a previous patch iteration?
>>>
>>> I did describe in change-list version 3 below, which corrected the build
>>> error with W=1 option.
>>>
>>> It is not good idea to add the description for that to the commit
>>> message, this is why I add descriptions on change-list version 3.
>>
>> Do as you wish, but the current style is confusing, and readers of the
>> commit are going to think, the kernel test robot reported the problem
>> with AMD VI ASICs and Intel Alder Lake systems.
>>
>>>>>>
>>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>>>>>> ---
>>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
>>>>>>>        enhanced check logic
>>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>>>>>>>        correct build error with W=1 option
>>>>>>> v2: correct commit description
>>>>>>>        move the check from chip family to problematic platform
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>>>>>>     1 file changed, 16 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>>>>>> @@ -81,6 +81,10 @@
>>>>>>>     #include "mxgpu_vi.h"
>>>>>>>     #include "amdgpu_dm.h"
>>>>>>>
>>>>>>> +#if IS_ENABLED(CONFIG_X86)
>>>>>>> +#include <asm/intel-family.h>
>>>>>>> +#endif
>>>>>>> +
>>>>>>>     #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>>>>>>     #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
>>>>>>> 0x00000001L
>>>>>>>     #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
>>>>>>> 0x00000002L
>>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
>>>>>>> amdgpu_device *adev)
>>>>>>>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>>>>>>     }
>>>>>>>
>>>>>>> +static bool aspm_support_quirk_check(void)
>>>>>>> +{
>>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
>>>>>>> +             struct cpuinfo_x86 *c = &cpu_data(0);
>>>>>>> +
>>>>>>> +             return !(c->x86 == 6 && c->x86_model ==
>>>>>>> INTEL_FAM6_ALDERLAKE);
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     return true;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static void vi_program_aspm(struct amdgpu_device *adev)
>>>>>>>     {
>>>>>>>         u32 data, data1, orig;
>>>>>>>         bool bL1SS = false;
>>>>>>>         bool bClkReqSupport = true;
>>>>>>>
>>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
>>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) ||
>>>>>>> !aspm_support_quirk_check())
>>>>>>>                 return;
>>>>>>
>>>>>> Can users still forcefully enable ASPM with the parameter
>>>>>> `amdgpu.aspm`?
>>>>>>
>>> As Mario mentioned in a separate reply, we can't forcefully enable ASPM
>>> with the parameter 'amdgpu.aspm'.
>>
>> That would be a regression on systems where ASPM used to work. Hmm. I
>> guess, you could say, there are no such systems.
>>
>>>>>>>
>>>>>>>         if (adev->flags & AMD_IS_APU ||
>>>>>>
>>>>>> If I remember correctly, there were also newer cards, where ASPM worked
>>>>>> with Intel Alder Lake, right? Can only the problematic generations for
>>>>>> WX3200 and RX640 be excluded from ASPM?
>>>>>
>>>>> This patch only disables it for the generatioaon that was problematic.
>>>>
>>>> Could that please be made clear in the commit message summary, and
>>>> message?
>>>
>>> Are you ok with the commit messages below?
>>
>> Please change the commit message summary. Maybe:
>>
>> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
>>
>>> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
>>>
>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't work
>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards as
>>> video/display output, Intel Alder Lake based systems will freeze after
>>> suspend/resume.
>>
>> Something like:
>>
>> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic
>> Islands (VI) cards, like WX3200 and RX640, graphics don’t initialize
>> when resuming from S0ix(?).
>>
>>
>>> The issue was initially reported on one system (Dell Precision 3660 with
>>> BIOS version 0.14.81), but was later confirmed to affect at least 4 Alder
>>> Lake based systems.
>>
>> Which ones?
>>
>>> Add extra check to disable ASPM on Intel Alder Lake based systems with
>>> problematic generation GFX cards.
>>
>> … with the problematic Volcanic Islands GFX cards.
>>
>>>>
>>>> Loosely related, is there a public (or internal issue) to analyze how
>>>> to get ASPM working for VI generation devices with Intel Alder Lake?
>>>
>>> As Alex mentioned, we need support from Intel. We don't have any update
>>> on that.
>>
>> It’d be great to get that fixed properly.
>>
>> Last thing, please don’t hate me, does Linux log, that ASPM is disabled?
> 
> I'm not sure what gets logged at the platform level with respect to
> ASPM, but whether or not the driver enables ASPM is tied to whether
> ASPM is allowed at the platform level or not so if the platform
> indicates that ASPM is not supported, the driver won't enable it.  The
> driver does not log whether ASPM is enabled or not if that is what you
> are asking.  As to whether or not it should, it comes down to how much
> stuff is worth indiciating in the log.  The driver is already pretty
> chatty by driver standards.

I specifically mean, Linux should log the quirks it applies. (As a 
normal user, I’d also expect ASPM to work nowadays, so a message, that 
it’s disabled would help a lot.)


Kind regards,

Paul
