Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49991B386F4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDBF10E86A;
	Wed, 27 Aug 2025 15:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="pHkKo3Ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Wed, 27 Aug 2025 15:49:33 UTC
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BC110E868
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:49:33 +0000 (UTC)
Message-ID: <dbdc85d9-7864-4a0d-ba55-fbb2a6eb8621@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1756309386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbsP8JvwlpYFDToqr0ItrsSWvEssqsb89C/j334T1Y8=;
 b=pHkKo3YeLLfPpsb1kI5mZb58/6Nk2onPK3NHCp7nFeKivtfH3uC0fOsYTfG+aXGDAg++rE
 0u3ga1lAR8c5JDBgZql0kZk9WSJfPiw6T2gEij0v4zXXz3YCIQHexVvUxVIEF7FQcDR6g3
 WyxjrFEIMrEJ0nFZ4Tz2/3LdLjTWVFI=
Date: Wed, 27 Aug 2025 08:42:55 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: "Lee, Peyton" <Peyton.Lee@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>
Cc: Mario Limonciello <superm1@kernel.org>,
 Alex Deucher <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Yu, Lang"
 <Lang.Yu@amd.com>
References: <20250824085351.454619-1-lkml@antheas.dev>
 <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
 <CAGwozwHm1vC-qVo8h6gL_m8L3ufOY_nrau=Xqp6HK=6ff-ap3A@mail.gmail.com>
 <03e5408a-dc5d-4259-a366-2090ef1df622@kernel.org>
 <CAGwozwFCXFGHtpDejq_kr-1JaQhgXc-fyuCHK5FX2k57eKWfmw@mail.gmail.com>
 <CADnq5_Ow4SCZz_jnaQ-Y4zUEnBEKbeW5um3HFyLQvYvOy9WsAw@mail.gmail.com>
 <4becb4f2-f1f8-41e5-a968-02fdbd97e337@kernel.org>
 <CAGwozwErcHdA9UD4wr6xDow5C5+sh-D=1Y74fG-p=0E3en+BHg@mail.gmail.com>
 <5CEB20FF-7D1A-42B3-BFD3-890EA44D15B7@linux.dev>
 <CAGwozwHAPOsZRydPxhTUm+wmSv57RqaO-agiT9k+10cMO6H1pg@mail.gmail.com>
 <3263a967-6b45-444c-9c8b-e2474e83821f@linux.dev>
 <MN2PR12MB43736AAF6E8166AD962843F48638A@MN2PR12MB4373.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <MN2PR12MB43736AAF6E8166AD962843F48638A@MN2PR12MB4373.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On 8/26/25 7:37 PM, Lee, Peyton wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> I recently encountered a similar issue on Strix.
> 
> What I found was that the root cause was GFX failing during hw_init.
> 
> Here’s the situation:
> Linux AMDGPU boot-up flow:
> 
>   1.
> sw_init — This stage initializes the software for each IP block (GFX, VCN, VPE, etc.), and powers them on.
>   2.
> hw_init — This stage calls the hardware initialization of each IP block. At this point, VPE begins loading its firmware and configuring hardware.
> 
> The issue:
> When the problem occurs, the GFX block fails during hw_init. As a result, it requests the SMU to power off all IP blocks.
> However, at that point, the VPE firmware hasn’t been loaded yet, so it cannot respond to the SMU's power-off request.
> This causes the system to hang during boot.
> 
> Previously, my approach was to remove all the calls to VPE power off (both in the VPE driver and in the SMU deinit function) to help locate the issue. Maybe you could try the same.

Thanks, I tried both Antheas' patch and your suggestion, and I was still able to trigger the issue with both of them.

On Mario's suggestion, I updated from linux-firmware 20250808 to linux-firmware from git. With this new amdgpu_firmware_info:

VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 35, firmware version: 0x0000001f
PFP feature version: 35, firmware version: 0x0000002c
CE feature version: 0, firmware version: 0x00000000
RLC feature version: 1, firmware version: 0x11530506
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
RLCP feature version: 1, firmware version: 0x11530506
RLCV feature version: 0, firmware version: 0x00000000
MEC feature version: 35, firmware version: 0x0000001f
IMU feature version: 0, firmware version: 0x0b352300
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 553648371, firmware version: 0x210000f3
TA XGMI feature version: 0x00000000, firmware version: 0x00000000
TA RAS feature version: 0x00000000, firmware version: 0x00000000
TA HDCP feature version: 0x00000000, firmware version: 0x17000046
TA DTM feature version: 0x00000000, firmware version: 0x12000019
TA RAP feature version: 0x00000000, firmware version: 0x00000000
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x00647000 (100.112.0)
SDMA0 feature version: 60, firmware version: 0x00000011
VCN feature version: 0, firmware version: 0x09118011
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x09002a00
TOC feature version: 0, firmware version: 0x0000000b
MES_KIQ feature version: 6, firmware version: 0x0000006c
MES feature version: 1, firmware version: 0x0000007e
VPE feature version: 60, firmware version: 0x00000017
VBIOS version: 113-STRXLGEN-001

I have not been able to trigger any amdgpu failures after 200 cycles on an unpatched 6.17-rc3 kernel.

Thanks,
Matt

> 
> 
> 
> ________________________________
> 寄件者: Matthew Schwartz <matthew.schwartz@linux.dev>
> 已傳送: 星期三, 2025 年 8 月 27 日 08:50
> 收件者: Antheas Kapenekakis <lkml@antheas.dev>
> 副本: Mario Limonciello <superm1@kernel.org>; Alex Deucher <alexdeucher@gmail.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Wentland, Harry <Harry.Wentland@amd.com>; Rodrigo Siqueira <siqueira@igalia.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; Lee, Peyton <Peyton.Lee@amd.com>; Yu, Lang <Lang.Yu@amd.com>
> 主旨: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix hang on Strix Halo
> 
> On 8/26/25 1:58 PM, Antheas Kapenekakis wrote:
>> On Tue, 26 Aug 2025 at 22:13, Matthew Schwartz
>> <matthew.schwartz@linux.dev> wrote:
>>>
>>>
>>>
>>>> On Aug 26, 2025, at 12:21 PM, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>
>>>> On Tue, 26 Aug 2025 at 21:19, Mario Limonciello <superm1@kernel.org> wrote:
>>>>>
>>>>> On 8/26/2025 8:41 AM, Alex Deucher wrote:
>>>>>> On Tue, Aug 26, 2025 at 3:49 AM Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>>>>
>>>>>>> On Mon, 25 Aug 2025 at 03:38, Mario Limonciello <superm1@kernel.org> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 8/24/25 3:46 PM, Antheas Kapenekakis wrote:
>>>>>>>>> On Sun, 24 Aug 2025 at 22:16, Mario Limonciello <superm1@kernel.org> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 8/24/25 3:53 AM, Antheas Kapenekakis wrote:
>>>>>>>>>>> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of the
>>>>>>>>>>> suspend resumes result in a soft lock around 1 second after the screen
>>>>>>>>>>> turns on (it freezes). This happens due to power gating VPE when it is
>>>>>>>>>>> not used, which happens 1 second after inactivity.
>>>>>>>>>>>
>>>>>>>>>>> Specifically, the VPE gating after resume is as follows: an initial
>>>>>>>>>>> ungate, followed by a gate in the resume process. Then,
>>>>>>>>>>> amdgpu_device_delayed_init_work_handler with a delay of 2s is scheduled
>>>>>>>>>>> to run tests, one of which is testing VPE in vpe_ring_test_ib. This
>>>>>>>>>>> causes an ungate, After that test, vpe_idle_work_handler is scheduled
>>>>>>>>>>> with VPE_IDLE_TIMEOUT (1s).
>>>>>>>>>>>
>>>>>>>>>>> When vpe_idle_work_handler runs and tries to gate VPE, it causes the
>>>>>>>>>>> SMU to hang and partially freezes half of the GPU IPs, with the thread
>>>>>>>>>>> that called the command being stuck processing it.
>>>>>>>>>>>
>>>>>>>>>>> Specifically, after that SMU command tries to run, we get the following:
>>>>>>>>>>>
>>>>>>>>>>> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to D3hot
>>>>>>>>>>> ...
>>>>>>>>>>> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3hot
>>>>>>>>>>> ...
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
>>>>>>>>>>> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe failed, ret = -62.
>>>>>>>>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed out
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
>>>>>>>>>>> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable jpeg failed, ret = -62.
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
>>>>>>>>>>> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret = -62.
>>>>>>>>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd3
>>>>>>>>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
>>>>>>>>>>> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D3hot
>>>>>>>>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed out
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
>>>>>>>>>>>
>>>>>>>>>>> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the GPU.
>>>>>>>>>>> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.5,
>>>>>>>>>>> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is the
>>>>>>>>>>> PowerDownVpe(50) command which is the common failure point in all
>>>>>>>>>>> failed resumes.
>>>>>>>>>>>
>>>>>>>>>>> On a normal resume, we should get the following power gates:
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) param: 0x00000000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) param: 0x00000000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) param: 0x00010000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) param: 0x00010000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) param: 0x00000000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param: 0x00000000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param: 0x00010000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) param: 0x00000000, resp: 0x00000001
>>>>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) param: 0x00010000, resp: 0x00000001
>>>>>>>>>>>
>>>>>>>>>>> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
>>>>>>>>>>> reliability from 4-25 suspends to 200+ (tested) suspends with a cycle
>>>>>>>>>>> time of 12s sleep, 8s resume.
>>>>>>>>>>
>>>>>>>>>> When you say you reproduced with 12s sleep and 8s resume, was that
>>>>>>>>>> 'amd-s2idle --duration 12 --wait 8'?
>>>>>>>>>
>>>>>>>>> I did not use amd-s2idle. I essentially used the script below with a
>>>>>>>>> 12 on the wake alarm and 12 on the for loop. I also used pstore for
>>>>>>>>> this testing.
>>>>>>>>>
>>>>>>>>> for i in {1..200}; do
>>>>>>>>>   echo "Suspend attempt $i"
>>>>>>>>>   echo `date '+%s' -d '+ 60 seconds'` | sudo tee /sys/class/rtc/rtc0/wakealarm
>>>>>>>>>   sudo sh -c 'echo mem > /sys/power/state'
>>>>>>>>>
>>>>>>>>>   for j in {1..50}; do
>>>>>>>>>     # Use repeating sleep in case echo mem returns early
>>>>>>>>>     sleep 1
>>>>>>>>>   done
>>>>>>>>> done
>>>>>>>>
>>>>>>>> 👍
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> The suspected reason here is that 1s that
>>>>>>>>>>> when VPE is used, it needs a bit of time before it can be gated and
>>>>>>>>>>> there was a borderline delay before, which is not enough for Strix Halo.
>>>>>>>>>>> When the VPE is not used, such as on resume, gating it instantly does
>>>>>>>>>>> not seem to cause issues.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
>>>>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>>>>>>> ---
>>>>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
>>>>>>>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>>>>>>>>>>> index 121ee17b522b..24f09e457352 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>>>>>>>>>>> @@ -34,8 +34,8 @@
>>>>>>>>>>>   /* VPE CSA resides in the 4th page of CSA */
>>>>>>>>>>>   #define AMDGPU_CSA_VPE_OFFSET       (4096 * 3)
>>>>>>>>>>>
>>>>>>>>>>> -/* 1 second timeout */
>>>>>>>>>>> -#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(1000)
>>>>>>>>>>> +/* 2 second timeout */
>>>>>>>>>>> +#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(2000)
>>>>>>>>>>>
>>>>>>>>>>>   #define VPE_MAX_DPM_LEVEL                   4
>>>>>>>>>>>   #define FIXED1_8_BITS_PER_FRACTIONAL_PART   8
>>>>>>>>>>>
>>>>>>>>>>> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
>>>>>>>>>>
>>>>>>>>>> 1s idle timeout has been used by other IPs for a long time.
>>>>>>>>>> For example JPEG, UVD, VCN all use 1s.
>>>>>>>>>>
>>>>>>>>>> Can you please confirm both your AGESA and your SMU firmware version?
>>>>>>>>>> In case you're not aware; you can get AGESA version from SMBIOS string
>>>>>>>>>> (DMI type 40).
>>>>>>>>>>
>>>>>>>>>> ❯ sudo dmidecode | grep AGESA
>>>>>>>>>
>>>>>>>>> String: AGESA!V9 StrixHaloPI-FP11 1.0.0.0c
>>>>>>>>>
>>>>>>>>>> You can get SMU firmware version from this:
>>>>>>>>>>
>>>>>>>>>> ❯ grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
>>>>>>>>>
>>>>>>>>> grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
>>>>>>>>> /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_fw_version:100.112.0
>>>>>>>>> /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_program:0
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks, I'll get some folks to see if we match this AGESA version if we
>>>>>>>> can also reproduce it on reference hardware the same way you did.
>>>>>>>>
>>>>>>>>>> Are you on the most up to date firmware for your system from the
>>>>>>>>>> manufacturer?
>>>>>>>>>
>>>>>>>>> I updated my bios, pd firmware, and USB device firmware early August,
>>>>>>>>> when I was doing this testing.
>>>>>>>>>
>>>>>>>>>> We haven't seen anything like this reported on Strix Halo thus far and
>>>>>>>>>> we do internal stress testing on s0i3 on reference hardware.
>>>>>>>>>
>>>>>>>>> Cant find a reference for it on the bug tracker. I have four bug
>>>>>>>>> reports on the bazzite issue tracker, 2 about sleep wake crashes and 2
>>>>>>>>> for runtime crashes, where the culprit would be this. IE runtime gates
>>>>>>>>> VPE and causes a crash.
>>>>>>>>
>>>>>>>> All on Strix Halo and all tied to VPE?  At runtime was VPE in use?  By
>>>>>>>> what software?
>>>>>>>>
>>>>>>>> BTW - Strix and Kraken also have VPE.
>>>>>>>
>>>>>>> All on the Z13. Not tied to VPE necessarily. I just know that I get
>>>>>>> reports of crashes on the Z13, and with this patch they are fixed for
>>>>>>> me. It will be part of the next bazzite version so I will get feedback
>>>>>>> about it.
>>>>>>>
>>>>>>> I don't think software that is using the VPE is relevant. Perhaps for
>>>>>>> the runtime crashes it is and this patch helps in that case as well.
>>>>>>> But in my case, the crash is caused after the ungate that runs the
>>>>>>> tests on resume on the delayed handler.
>>>>>>>
>>>>>>> The Z13 also has some other quirks with spurious wakeups when
>>>>>>> connected to a charger. So, if systemd is configured to e.g., sleep
>>>>>>> after 20m, combined with this crash if it stays plugged in overnight
>>>>>>> in the morning it has crashed.
>>>>>>>
>>>>>>>>>
>>>>>>>>>> To me this seems likely to be a platform firmware bug; but I would like
>>>>>>>>>> to understand the timing of the gate vs ungate on good vs bad.
>>>>>>>>>
>>>>>>>>> Perhaps it is. It is either something like that or silicon quality.
>>>>>>>>>
>>>>>>>>>> IE is it possible the delayed work handler
>>>>>>>>>> amdgpu_device_delayed_init_work_handler() is causing a race with
>>>>>>>>>> vpe_ring_begin_use()?
>>>>>>>>>
>>>>>>>>> I don't think so. There is only a single ungate. Also, the crash
>>>>>>>>> happens on the gate. So what happens is the device wakes up, the
>>>>>>>>> screen turns on, kde clock works, then after a second it freezes,
>>>>>>>>> there is a softlock, and the device hangs.
>>>>>>>>>
>>>>>>>>> The failed command is always the VPE gate that is triggered after 1s in idle.
>>>>>>>>>
>>>>>>>>>> This should be possible to check without extra instrumentation by using
>>>>>>>>>> ftrace and looking at the timing of the 2 ring functions and the init
>>>>>>>>>> work handler and checking good vs bad cycles.
>>>>>>>>>
>>>>>>>>> I do not know how to use ftrace. I should also note that after the
>>>>>>>>> device freezes around 1/5 cycles will sync the fs, so it is also not a
>>>>>>>>> very easy thing to diagnose. The device just stops working. A lot of
>>>>>>>>> the logs I got were in pstore by forcing a kernel panic.
>>>>>>>>
>>>>>>>> Here's how you capture the timing of functions.  Each time the function
>>>>>>>> is called there will be an event in the trace buffer.
>>>>>>>>
>>>>>>>> ❯ sudo trace-cmd record -p function -l
>>>>>>>> amdgpu_device_delayed_init_work_handler -l vpe_idle_work_handler -l
>>>>>>>> vpe_ring_begin_use -l vpe_ring_end_use -l amdgpu_pmops_suspend -l
>>>>>>>> amdgpu_pmops_resume
>>>>>>>>
>>>>>>>> Here's how you would review the report:
>>>>>>>>
>>>>>>>> ❯ trace-cmd report
>>>>>>>> cpus=24
>>>>>>>>   kworker/u97:37-18051 [001] ..... 13655.970108: function:
>>>>>>>> amdgpu_pmops_suspend <-- pci_pm_suspend
>>>>>>>>   kworker/u97:21-18036 [002] ..... 13666.290715: function:
>>>>>>>> amdgpu_pmops_resume <-- dpm_run_callback
>>>>>>>>   kworker/u97:21-18036 [015] ..... 13666.308295: function:
>>>>>>>> vpe_ring_begin_use <-- amdgpu_ring_alloc
>>>>>>>>   kworker/u97:21-18036 [015] ..... 13666.308298: function:
>>>>>>>> vpe_ring_end_use <-- vpe_ring_test_ring
>>>>>>>>     kworker/15:1-12285 [015] ..... 13666.960191: function:
>>>>>>>> amdgpu_device_delayed_init_work_handler <-- process_one_work
>>>>>>>>     kworker/15:1-12285 [015] ..... 13666.963970: function:
>>>>>>>> vpe_ring_begin_use <-- amdgpu_ring_alloc
>>>>>>>>     kworker/15:1-12285 [015] ..... 13666.965481: function:
>>>>>>>> vpe_ring_end_use <-- amdgpu_ib_schedule
>>>>>>>>     kworker/15:4-16354 [015] ..... 13667.981394: function:
>>>>>>>> vpe_idle_work_handler <-- process_one_work
>>>>>>>>
>>>>>>>> I did this on a Strix system just now to capture that.
>>>>>>>>
>>>>>>>> You can see that basically the ring gets used before the delayed init
>>>>>>>> work handler, and then again from the ring tests.  My concern is if the
>>>>>>>> sequence ever looks different than the above.  If it does; we do have a
>>>>>>>> driver race condition.
>>>>>>>>
>>>>>>>> It would also be helpful to look at the function_graph tracer.
>>>>>>>>
>>>>>>>> Here's some more documentation about ftrace and trace-cmd.
>>>>>>>> https://www.kernel.org/doc/html/latest/trace/ftrace.html
>>>>>>>> https://lwn.net/Articles/410200/
>>>>>>>>
>>>>>>>> You can probably also get an LLM to help you with building commands if
>>>>>>>> you're not familiar with it.
>>>>>>>>
>>>>>>>> But if you're hung so bad you can't flush to disk that's going to be a
>>>>>>>> problem without a UART.  A few ideas:
>>>>>>>
>>>>>>> Some times it flushes to disk
>>>>>>>
>>>>>>>> 1) You can use CONFIG_PSTORE_FTRACE
>>>>>>>
>>>>>>> I can look into that
>>>>>>>
>>>>>>>> 2) If you add "tp_printk" to the kernel command line it should make the
>>>>>>>> trace ring buffer flush to kernel log ring buffer.  But be warned this
>>>>>>>> is going to change the timing, the issue might go away entirely or have
>>>>>>>> a different failure rate.  So hopefully <1> works.
>>>>>>>>>
>>>>>>>>> If you say that all IP blocks use 1s, perhaps an alternative solution
>>>>>>>>> would be to desync the idle times so they do not happen
>>>>>>>>> simultaneously. So 1000, 1200, 1400, etc.
>>>>>>>>>
>>>>>>>>> Antheas
>>>>>>>>>
>>>>>>>>
>>>>>>>> I don't dobut your your proposal of changing the timing works.  I just
>>>>>>>> want to make sure it's the right solution because otherwise we might
>>>>>>>> change the timing or sequence elsewhere in the driver two years from now
>>>>>>>> and re-introduce the problem unintentionally.
>>>>>>>
>>>>>>> If there are other idle timers and only this one changes to 2s, I will
>>>>>>> agree and say that it would be peculiar. Although 1s seems arbitrary
>>>>>>> in any case.
>>>>>>
>>>>>> All of these timers are arbitrary.  Their point is just to provide a
>>>>>> future point where we can check if the engine is idle.  The idle work
>>>>>> handler will either power down the IP if it is idle or re-schedule in
>>>>>> the future and try again if there is still work.  Making the value
>>>>>> longer will use more power as it will wait longer before checking if
>>>>>> the engine is idle.  Making it shorter will save more power, but adds
>>>>>> extra overhead in that the engine will be powered up/down more often.
>>>>>> In most cases, the jobs should complete in a few ms.  The timer is
>>>>>> there to avoid the overhead of powering up/down the block too
>>>>>> frequently when applications are using the engine.
>>>>>>
>>>>>> Alex
>>>>>
>>>>> We had a try internally with both 6.17-rc2 and 6.17-rc3 and 1001b or
>>>>> 1001c AGESA on reference system but unfortunately didn't reproduce the
>>>>> issue with a 200 cycle attempt on either kernel or either BIOS (so we
>>>>> had 800 cycles total).
>>>>
>>>> I think I did 6.12, 6.15, and a 6.16rc stock. I will have to come back
>>>> to you with 6.17-rc3.
>>>
>>> I can reproduce the hang on a stock 6.17-rc3 kernel on my own Flow Z13, froze within 10 cycles with Antheas’ script. I will setup pstore to get logs from it since nothing appears in my journal after force rebooting.
>>>
>>> Matt
>>
>> Mine does not want to get reproduced right now. I will have to try later.
>>
>> You will need these kernel arguments:
>> efi_pstore.pstore_disable=0 pstore.kmsg_bytes=200000
>>
>> Here are some logging commands before the for loop
>> # clear pstore
>> sudo bash -c "rm -rf /sys/fs/pstore/*"
>>
>> # https://www.ais.com/understanding-pstore-linux-kernel-persistent-storage-file-system/
>>
>> # Runtime logs
>> # echo 1 | sudo tee
>> /sys/kernel/debug/tracing/events/power/power_runtime_suspend/enable
>> # echo 1 | sudo tee
>> /sys/kernel/debug/tracing/events/power/power_runtime_resume/enable
>> # echo 1 | sudo tee /sys/kernel/debug/tracing/tracing_on
>>
>> # Enable panics on lockups
>> echo 255 | sudo tee /proc/sys/kernel/sysrq
>> echo 1 | sudo tee /proc/sys/kernel/softlockup_panic
>> echo 1 | sudo tee /proc/sys/kernel/hardlockup_panic
>> echo 1 | sudo tee /proc/sys/kernel/panic_on_oops
>> echo 5 | sudo tee /proc/sys/kernel/panic
>> # echo 64 | sudo tee /proc/sys/kernel/panic_print
>>
>> # Enable these for hangs, shows Thread on hangs
>> # echo 1 | sudo tee /proc/sys/kernel/softlockup_all_cpu_backtrace
>> # echo 1 | sudo tee /proc/sys/kernel/hardlockup_all_cpu_backtrace
>>
>> # Enable pstore logging on panics
>> # Needs kernel param:
>> # efi_pstore.pstore_disable=0 pstore.kmsg_bytes=100000
>> # First enables, second sets the size to fit all cpus in case of a panic
>> echo Y | sudo tee /sys/module/kernel/parameters/crash_kexec_post_notifiers
>> echo Y | sudo tee /sys/module/printk/parameters/always_kmsg_dump
>>
>> # Enable dynamic debug for various kernel components
>> sudo bash -c "cat > /sys/kernel/debug/dynamic_debug/control" << EOF
>> file drivers/acpi/x86/s2idle.c +p
>> file drivers/pinctrl/pinctrl-amd.c +p
>> file drivers/platform/x86/amd/pmc.c +p
>> file drivers/pci/pci-driver.c +p
>> file drivers/input/serio/* +p
>> file drivers/gpu/drm/amd/pm/* +p
>> file drivers/gpu/drm/amd/pm/swsmu/* +p
>> EOF
>> # file drivers/acpi/ec.c +p
>> # file drivers/gpu/drm/amd/* +p
>> # file drivers/gpu/drm/amd/display/dc/core/* -p
>>
>> # Additional debugging for suspend/resume
>> echo 1 | sudo tee /sys/power/pm_debug_messages
> 
> So I ran the commands that you gave above while connected over ssh, and I could actually still interact with the system after the amdgpu failures started.
> Your suspend script also kept running for a while because of this, and pstore was not necessary.
> 
> My dmesg looks very similar to the snippet you posted in the patch contents.
> Full dmesg is here: https://gist.github.com/matte-schwartz/9ad4b925866d9228923e909618d045d9
> 
> I was able to run trace-cmd as Mario suggested, but nothing seemed out of order:
> 
> ❯ trace-cmd report
> 
>     kworker/22:6-9326  [022] .....  4003.204988: function:             amdgpu_device_delayed_init_work_handler <-- process_one_work
>     kworker/22:6-9326  [022] .....  4003.209383: function:             vpe_ring_begin_use <-- amdgpu_ring_alloc
>     kworker/22:6-9326  [022] .....  4003.210152: function:             vpe_ring_end_use <-- amdgpu_ib_schedule
>     kworker/22:6-9326  [022] .....  4004.263841: function:             vpe_idle_work_handler <-- process_one_work
>   kworker/u129:6-530   [001] .....  4053.545634: function:             amdgpu_pmops_suspend <-- pci_pm_suspend
>  kworker/u129:18-4060  [002] .....  4114.908515: function:             amdgpu_pmops_resume <-- dpm_run_callback
>  kworker/u129:18-4060  [023] .....  4114.931055: function:             vpe_ring_begin_use <-- amdgpu_ring_alloc
>  kworker/u129:18-4060  [023] .....  4114.931057: function:             vpe_ring_end_use <-- vpe_ring_test_ring
>      kworker/7:5-5733  [007] .....  4115.198936: function:             amdgpu_device_delayed_init_work_handler <-- process_one_work
>      kworker/7:5-5733  [007] .....  4115.203185: function:             vpe_ring_begin_use <-- amdgpu_ring_alloc
>      kworker/7:5-5733  [007] .....  4115.204141: function:             vpe_ring_end_use <-- amdgpu_ib_schedule
>      kworker/7:0-7950  [007] .....  4116.253971: function:             vpe_idle_work_handler <-- process_one_work
>  kworker/u129:41-4083  [001] .....  4165.539388: function:             amdgpu_pmops_suspend <-- pci_pm_suspend
>  kworker/u129:58-4100  [001] .....  4226.906561: function:             amdgpu_pmops_resume <-- dpm_run_callback
>  kworker/u129:58-4100  [022] .....  4226.927900: function:             vpe_ring_begin_use <-- amdgpu_ring_alloc
>  kworker/u129:58-4100  [022] .....  4226.927902: function:             vpe_ring_end_use <-- vpe_ring_test_ring
>      kworker/7:0-7950  [007] .....  4227.193678: function:             amdgpu_device_delayed_init_work_handler <-- process_one_work
>      kworker/7:0-7950  [007] .....  4227.197604: function:             vpe_ring_begin_use <-- amdgpu_ring_alloc
>      kworker/7:0-7950  [007] .....  4227.201691: function:             vpe_ring_end_use <-- amdgpu_ib_schedule
>      kworker/7:0-7950  [007] .....  4228.240479: function:             vpe_idle_work_handler <-- process_one_work
> 
> I have not tested the kernel patch yet, so that will be my next step.
> 
>>
>> Here is how to reconstruct the log:
>> rm -rf crash && mkdir crash
>> sudo bash -c "cp /sys/fs/pstore/dmesg-efi_pstore-* crash"
>> sudo bash -c "rm -rf /sys/fs/pstore/*"
>> cat $(find crash/ -name "dmesg-*" | tac) > crash.txt
>>
>> Antheas
>>>>
>>>>> Was your base a bazzite kernel or was it an upstream kernel?  I know
>>>>> there are some other patches in bazzite especially relevant to suspend,
>>>>> so I wonder if they could be influencing the timing.
>>>>>
>>>>> Can you repo on 6.17-rc3?
>>>>>
>>>>
>>>>
>>>
>>>
>>
> 

