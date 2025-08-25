Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8517BB347C7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33E110E508;
	Mon, 25 Aug 2025 16:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HSGDBsPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0897810E503;
 Mon, 25 Aug 2025 16:41:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 275686023B;
 Mon, 25 Aug 2025 16:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25097C4CEED;
 Mon, 25 Aug 2025 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756140093;
 bh=tpfX/lA3dGCrBKJQHkc8usErWdClA2dUkf10uj9Qg5k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HSGDBsPA2XQ84GbKtBQ0ER0HD6dV/SFAa8JV08L1Ou294P4xFlD5N/7B6cizBBbUp
 2WgB1OKGQujA/bMPnlLDyOmtZx3QaiVFw41b4H4vHI5dJchw+UGmloz/G0xJ1+D+jU
 4XxxaOmbln8vwPr+xZ02xZwsF/zzZ5dSSI9Z+Azx4hDkfcsBGyMXNNPFjSUpzlfFb8
 pmuuJFXMckr3r1Ds5vabUp3U+IIHLm/mcgddfSHTWxJC4DCnPzuPR8C+3lYGISIp5K
 Si4khxkmUVPmdxR0T1GWEcju5LlUAd5LzuO2NlUOng9cGtWsgaR/NnN/qw+SMOUqVy
 nfLpdVhQ9VSjA==
Message-ID: <425162fe-aeb7-4ff5-9a84-e7f6da20225e@kernel.org>
Date: Mon, 25 Aug 2025 11:41:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Peyton Lee <peytolee@amd.com>,
 Lang Yu <lang.yu@amd.com>
References: <20250824085351.454619-1-lkml@antheas.dev>
 <CADnq5_MEhMha47V25SK4cZkd8TLcizR_y0si2n9jSDjJTXeoRQ@mail.gmail.com>
 <CAGwozwF=UKhG0HU_cxaY8957rscY=W4_VK+z==3vkKJJWZehzQ@mail.gmail.com>
 <CAGwozwFmfBrnZBO6JRZPnPyHLrKycdnoMRtOkK+KpwkdQ4Fw=w@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAGwozwFmfBrnZBO6JRZPnPyHLrKycdnoMRtOkK+KpwkdQ4Fw=w@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/25/2025 9:01 AM, Antheas Kapenekakis wrote:
> On Mon, 25 Aug 2025 at 15:33, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>
>> On Mon, 25 Aug 2025 at 15:20, Alex Deucher <alexdeucher@gmail.com> wrote:
>>>
>>> On Mon, Aug 25, 2025 at 3:13 AM Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>
>>>> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of the
>>>> suspend resumes result in a soft lock around 1 second after the screen
>>>> turns on (it freezes). This happens due to power gating VPE when it is
>>>> not used, which happens 1 second after inactivity.
>>>>
>>>> Specifically, the VPE gating after resume is as follows: an initial
>>>> ungate, followed by a gate in the resume process. Then,
>>>> amdgpu_device_delayed_init_work_handler with a delay of 2s is scheduled
>>>> to run tests, one of which is testing VPE in vpe_ring_test_ib. This
>>>> causes an ungate, After that test, vpe_idle_work_handler is scheduled
>>>> with VPE_IDLE_TIMEOUT (1s).
>>>>
>>>> When vpe_idle_work_handler runs and tries to gate VPE, it causes the
>>>> SMU to hang and partially freezes half of the GPU IPs, with the thread
>>>> that called the command being stuck processing it.
>>>>
>>>> Specifically, after that SMU command tries to run, we get the following:
>>>>
>>>> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to D3hot
>>>> ...
>>>> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3hot
>>>> ...
>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
>>>> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe failed, ret = -62.
>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed out
>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
>>>> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable jpeg failed, ret = -62.
>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
>>>> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret = -62.
>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd3
>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
>>>> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D3hot
>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed out
>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
>>>>
>>>> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the GPU.
>>>> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.5,
>>>> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is the
>>>> PowerDownVpe(50) command which is the common failure point in all
>>>> failed resumes.
>>>>
>>>> On a normal resume, we should get the following power gates:
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) param: 0x00000000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) param: 0x00000000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) param: 0x00010000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) param: 0x00010000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) param: 0x00000000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param: 0x00000000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param: 0x00010000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) param: 0x00000000, resp: 0x00000001
>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) param: 0x00010000, resp: 0x00000001
>>>>
>>>> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
>>>> reliability from 4-25 suspends to 200+ (tested) suspends with a cycle
>>>> time of 12s sleep, 8s resume. The suspected reason here is that 1s that
>>>> when VPE is used, it needs a bit of time before it can be gated and
>>>> there was a borderline delay before, which is not enough for Strix Halo.
>>>> When the VPE is not used, such as on resume, gating it instantly does
>>>> not seem to cause issues.
>>>
>>> This doesn't make much sense.  The VPE idle timeout is arbitrary.  The
>>> VPE idle work handler checks to see if the block is idle before it
>>> powers gates the block. If it's not idle, then the delayed work is
>>> rescheduled so changing the timing should not make a difference.  We
>>> are no powering down VPE while it still has active jobs.  It sounds
>>> like there is some race condition somewhere else.
>>
>> On resume, the vpe is ungated and gated instantly, which does not
>> cause any crashes, then the delayed work is scheduled to run two
>> seconds later. Then, the tests run and finish, which start the gate
>> timer. After the timer lapses and the kernel tries to gate VPE, it
>> crashes. I logged all SMU commands and there is no difference between
>> the ones in a crash and not, other than the fact the VPE gate command
>> failed. Which becomes apparent when the next command runs. I will also
>> note that until the idle timer lapses, the system is responsive
>>
>> Since the VPE is ungated to run the tests, I assume that in my setup
>> it is not used close to resume.
> 
> I should also add that I forced a kernel panic and dumped all CPU
> backtraces in multiple logs. After the softlock, CPUs were either
> parked in the scheduler, powered off, or stuck executing an SMU
> command by e.g., a userspace usage sensor graph. So it is not a
> deadlock.
> 

Can you please confirm if you are on the absolute latest linux-firmware 
when you reproduced this issue?

Can you please share the debugfs output for amdgpu_firmware_info.

