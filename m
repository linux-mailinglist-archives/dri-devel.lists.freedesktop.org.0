Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6AB33290
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 22:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046E10E29E;
	Sun, 24 Aug 2025 20:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CcWwceon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879B010E29D;
 Sun, 24 Aug 2025 20:16:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 743C65C5686;
 Sun, 24 Aug 2025 20:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD05AC4CEEB;
 Sun, 24 Aug 2025 20:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756066613;
 bh=brgqjqPdkymYwpxzprU5bp5+t5tdiecqn0pw7qpUigw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CcWwceonoipEmlzT938DSWR3TqgImWZJ/CcohfHGL6ZTcksO/HtJD/KmWpTPyhq+H
 EZHkQh2gIH+xQX9RV+yqPfjPa2zPrcqP1BN0nU0f2p/TnQ0hFXcFyusrVfYS9eu/dP
 B1eRLXf/HTWHCONxhtCUnzlFU8CG6c+J5c5yDr9Ri4r1pQpaA0nAQ7NVlt0/r9zGFq
 Xd2QaZiuWslYu64/viSlTMwcTLtD93/PTnE9DYrHyNacd4Ggdi/3VSEkGt0tissMtm
 nEs+kHpfiWY2W36WL5mXVq+bgBMs4Sm5o4A9Hq+hEuXRgPjl5rX4jN5xCbDQmMIBMm
 k8Dsn8DGlAcWw==
Message-ID: <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
Date: Sun, 24 Aug 2025 15:16:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Peyton Lee
 <peytolee@amd.com>, Lang Yu <lang.yu@amd.com>
References: <20250824085351.454619-1-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
Autocrypt: addr=superm1@gmail.com; keydata=
 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
In-Reply-To: <20250824085351.454619-1-lkml@antheas.dev>
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



On 8/24/25 3:53 AM, Antheas Kapenekakis wrote:
> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of the
> suspend resumes result in a soft lock around 1 second after the screen
> turns on (it freezes). This happens due to power gating VPE when it is
> not used, which happens 1 second after inactivity.
> 
> Specifically, the VPE gating after resume is as follows: an initial
> ungate, followed by a gate in the resume process. Then,
> amdgpu_device_delayed_init_work_handler with a delay of 2s is scheduled
> to run tests, one of which is testing VPE in vpe_ring_test_ib. This
> causes an ungate, After that test, vpe_idle_work_handler is scheduled
> with VPE_IDLE_TIMEOUT (1s).
> 
> When vpe_idle_work_handler runs and tries to gate VPE, it causes the
> SMU to hang and partially freezes half of the GPU IPs, with the thread
> that called the command being stuck processing it.
> 
> Specifically, after that SMU command tries to run, we get the following:
> 
> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to D3hot
> ...
> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3hot
> ...
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe failed, ret = -62.
> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed out
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable jpeg failed, ret = -62.
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret = -62.
> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd3
> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D3hot
> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed out
> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
> 
> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the GPU.
> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.5,
> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is the
> PowerDownVpe(50) command which is the common failure point in all
> failed resumes.
> 
> On a normal resume, we should get the following power gates:
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) param: 0x00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) param: 0x00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) param: 0x00010000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) param: 0x00010000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) param: 0x00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param: 0x00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param: 0x00010000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) param: 0x00000000, resp: 0x00000001
> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) param: 0x00010000, resp: 0x00000001
> 
> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
> reliability from 4-25 suspends to 200+ (tested) suspends with a cycle
> time of 12s sleep, 8s resume. 

When you say you reproduced with 12s sleep and 8s resume, was that 
'amd-s2idle --duration 12 --wait 8'?

> The suspected reason here is that 1s that
> when VPE is used, it needs a bit of time before it can be gated and
> there was a borderline delay before, which is not enough for Strix Halo.
> When the VPE is not used, such as on resume, gating it instantly does
> not seem to cause issues.
> 
> Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> index 121ee17b522b..24f09e457352 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> @@ -34,8 +34,8 @@
>   /* VPE CSA resides in the 4th page of CSA */
>   #define AMDGPU_CSA_VPE_OFFSET 	(4096 * 3)
>   
> -/* 1 second timeout */
> -#define VPE_IDLE_TIMEOUT	msecs_to_jiffies(1000)
> +/* 2 second timeout */
> +#define VPE_IDLE_TIMEOUT	msecs_to_jiffies(2000)
>   
>   #define VPE_MAX_DPM_LEVEL			4
>   #define FIXED1_8_BITS_PER_FRACTIONAL_PART	8
> 
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9

1s idle timeout has been used by other IPs for a long time.
For example JPEG, UVD, VCN all use 1s.

Can you please confirm both your AGESA and your SMU firmware version? 
In case you're not aware; you can get AGESA version from SMBIOS string 
(DMI type 40).

❯ sudo dmidecode | grep AGESA

You can get SMU firmware version from this:

❯ grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*

Are you on the most up to date firmware for your system from the 
manufacturer?

We haven't seen anything like this reported on Strix Halo thus far and 
we do internal stress testing on s0i3 on reference hardware.

To me this seems likely to be a platform firmware bug; but I would like 
to understand the timing of the gate vs ungate on good vs bad.

IE is it possible the delayed work handler 
amdgpu_device_delayed_init_work_handler() is causing a race with 
vpe_ring_begin_use()?

This should be possible to check without extra instrumentation by using 
ftrace and looking at the timing of the 2 ring functions and the init 
work handler and checking good vs bad cycles.
