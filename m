Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782BB372F8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 21:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49A210E6BC;
	Tue, 26 Aug 2025 19:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="kmYSypW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DCB10E6BD;
 Tue, 26 Aug 2025 19:21:32 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id CD0BB4621E;
 Tue, 26 Aug 2025 22:21:30 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id 0439447EF3;
 Tue, 26 Aug 2025 22:21:29 +0300 (EEST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 575131FE1B5;
 Tue, 26 Aug 2025 22:21:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756236088;
 bh=H3Uz9m/KaafJ/FXUHV5QZ/G1yZ++W/GZK45ngNUGgoo=;
 h=Received:From:Subject:To;
 b=kmYSypW8adHni43v7Zb/1UgVYFoe49KsQOJKmxexH4C5epfUQfpiis8Sk44kXqo9r
 pppcWw+QphI26Vr+jOCuoF6acglOWAMdCp+7E5tklWOX33/VUdGfPSbELj05MueiS+
 2I95bhYlESY6QP6vWxyfoxfSjjYfWrfMQeNcX+Uq0kbZVjZBMP5WCeZrmBXyLiPN2g
 i8dDn6yL2Goy6Loh3c8jROIJ8hmHkouo4vDrBaKXb/dpblYE9T+jGRHhP/jeNZ9GsJ
 aY/Rlkd+h8OGbu8rFhkpDTBQlfVVjuP7jfcOJbaNHzrH8eYow+SiQvIhL+AXkQJLFR
 Jg0Dxur1D0Iig==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3367144d196so25104981fa.3;
 Tue, 26 Aug 2025 12:21:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxldAYMeNP/ow1/KM7h0S+fBfjksKwZyEgkScDB44Xyj8DKpkUSd+1mF3I3Sxvsa3//DP505lf@lists.freedesktop.org,
 AJvYcCW7BFsE7hJVq4UzEumKTi54YeZLmeI/+UMaXiap+dJEmNctdd4DBpqsxu8FtF5fJAsu3iLj/CGOruZd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIIdluPa5qzJ8ObrflilnwnJqpGE42YH5/38psJ6CB+NYqytu7
 nd86roybBgaU1pwQix/V4WnE59lNzDqYuVLLMEfwIzTdiCmzAmJjjBQ+VK14AuEhouLsn7c6HFC
 t00SILGj3FSKwL2SWsRHjc9LwxMKGi4k=
X-Google-Smtp-Source: AGHT+IFXVfCr5mwAxM2Z4Px9RPaqCrDCgqTpJn53YM61c/10d+mmY8GcnoIVWZxeeC14kliuJcZbXRTPjpBb7qg4s7M=
X-Received: by 2002:a05:651c:1544:b0:335:40e6:d05a with SMTP id
 38308e7fff4ca-33650ffffc4mr48378511fa.44.1756236087706; Tue, 26 Aug 2025
 12:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
 <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
 <CAGwozwHm1vC-qVo8h6gL_m8L3ufOY_nrau=Xqp6HK=6ff-ap3A@mail.gmail.com>
 <03e5408a-dc5d-4259-a366-2090ef1df622@kernel.org>
 <CAGwozwFCXFGHtpDejq_kr-1JaQhgXc-fyuCHK5FX2k57eKWfmw@mail.gmail.com>
 <CADnq5_Ow4SCZz_jnaQ-Y4zUEnBEKbeW5um3HFyLQvYvOy9WsAw@mail.gmail.com>
 <4becb4f2-f1f8-41e5-a968-02fdbd97e337@kernel.org>
In-Reply-To: <4becb4f2-f1f8-41e5-a968-02fdbd97e337@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 26 Aug 2025 21:21:16 +0200
X-Gmail-Original-Message-ID: <CAGwozwErcHdA9UD4wr6xDow5C5+sh-D=1Y74fG-p=0E3en+BHg@mail.gmail.com>
X-Gm-Features: Ac12FXxVvJxyVZW3wusaqTA7mguvsu1rG3txNFvkIVsoHsGHVZVEgVGc0mCIVvY
Message-ID: <CAGwozwErcHdA9UD4wr6xDow5C5+sh-D=1Y74fG-p=0E3en+BHg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Mario Limonciello <superm1@kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Peyton Lee <peytolee@amd.com>, 
 Lang Yu <lang.yu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <175623608857.4169403.3054955308857804551@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

On Tue, 26 Aug 2025 at 21:19, Mario Limonciello <superm1@kernel.org> wrote:
>
> On 8/26/2025 8:41 AM, Alex Deucher wrote:
> > On Tue, Aug 26, 2025 at 3:49=E2=80=AFAM Antheas Kapenekakis <lkml@anthe=
as.dev> wrote:
> >>
> >> On Mon, 25 Aug 2025 at 03:38, Mario Limonciello <superm1@kernel.org> w=
rote:
> >>>
> >>>
> >>>
> >>> On 8/24/25 3:46 PM, Antheas Kapenekakis wrote:
> >>>> On Sun, 24 Aug 2025 at 22:16, Mario Limonciello <superm1@kernel.org>=
 wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 8/24/25 3:53 AM, Antheas Kapenekakis wrote:
> >>>>>> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% =
of the
> >>>>>> suspend resumes result in a soft lock around 1 second after the sc=
reen
> >>>>>> turns on (it freezes). This happens due to power gating VPE when i=
t is
> >>>>>> not used, which happens 1 second after inactivity.
> >>>>>>
> >>>>>> Specifically, the VPE gating after resume is as follows: an initia=
l
> >>>>>> ungate, followed by a gate in the resume process. Then,
> >>>>>> amdgpu_device_delayed_init_work_handler with a delay of 2s is sche=
duled
> >>>>>> to run tests, one of which is testing VPE in vpe_ring_test_ib. Thi=
s
> >>>>>> causes an ungate, After that test, vpe_idle_work_handler is schedu=
led
> >>>>>> with VPE_IDLE_TIMEOUT (1s).
> >>>>>>
> >>>>>> When vpe_idle_work_handler runs and tries to gate VPE, it causes t=
he
> >>>>>> SMU to hang and partially freezes half of the GPU IPs, with the th=
read
> >>>>>> that called the command being stuck processing it.
> >>>>>>
> >>>>>> Specifically, after that SMU command tries to run, we get the foll=
owing:
> >>>>>>
> >>>>>> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 =
to D3hot
> >>>>>> ...
> >>>>>> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3=
hot
> >>>>>> ...
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous =
command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> >>>>>> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe f=
ailed, ret =3D -62.
> >>>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done time=
d out
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous =
command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> >>>>>> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disab=
le jpeg failed, ret =3D -62.
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous =
command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> >>>>>> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret=
 =3D -62.
> >>>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0=
xd3
> >>>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0=
x5
> >>>>>> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to=
 D3hot
> >>>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done time=
d out
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous =
command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
> >>>>>>
> >>>>>> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is th=
e GPU.
> >>>>>> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.0=
0.5,
> >>>>>> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is=
 the
> >>>>>> PowerDownVpe(50) command which is the common failure point in all
> >>>>>> failed resumes.
> >>>>>>
> >>>>>> On a normal resume, we should get the following power gates:
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) pa=
ram: 0x00000000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) =
param: 0x00000000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) =
param: 0x00010000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) pa=
ram: 0x00010000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) pa=
ram: 0x00000000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) para=
m: 0x00000000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) para=
m: 0x00010000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) pa=
ram: 0x00000000, resp: 0x00000001
> >>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) pa=
ram: 0x00010000, resp: 0x00000001
> >>>>>>
> >>>>>> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increase=
s
> >>>>>> reliability from 4-25 suspends to 200+ (tested) suspends with a cy=
cle
> >>>>>> time of 12s sleep, 8s resume.
> >>>>>
> >>>>> When you say you reproduced with 12s sleep and 8s resume, was that
> >>>>> 'amd-s2idle --duration 12 --wait 8'?
> >>>>
> >>>> I did not use amd-s2idle. I essentially used the script below with a
> >>>> 12 on the wake alarm and 12 on the for loop. I also used pstore for
> >>>> this testing.
> >>>>
> >>>> for i in {1..200}; do
> >>>>     echo "Suspend attempt $i"
> >>>>     echo `date '+%s' -d '+ 60 seconds'` | sudo tee /sys/class/rtc/rt=
c0/wakealarm
> >>>>     sudo sh -c 'echo mem > /sys/power/state'
> >>>>
> >>>>     for j in {1..50}; do
> >>>>       # Use repeating sleep in case echo mem returns early
> >>>>       sleep 1
> >>>>     done
> >>>> done
> >>>
> >>> =F0=9F=91=8D
> >>>
> >>>>
> >>>>>> The suspected reason here is that 1s that
> >>>>>> when VPE is used, it needs a bit of time before it can be gated an=
d
> >>>>>> there was a borderline delay before, which is not enough for Strix=
 Halo.
> >>>>>> When the VPE is not used, such as on resume, gating it instantly d=
oes
> >>>>>> not seem to cause issues.
> >>>>>>
> >>>>>> Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
> >>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
> >>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_vpe.c
> >>>>>> index 121ee17b522b..24f09e457352 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> >>>>>> @@ -34,8 +34,8 @@
> >>>>>>     /* VPE CSA resides in the 4th page of CSA */
> >>>>>>     #define AMDGPU_CSA_VPE_OFFSET       (4096 * 3)
> >>>>>>
> >>>>>> -/* 1 second timeout */
> >>>>>> -#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(1000)
> >>>>>> +/* 2 second timeout */
> >>>>>> +#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(2000)
> >>>>>>
> >>>>>>     #define VPE_MAX_DPM_LEVEL                   4
> >>>>>>     #define FIXED1_8_BITS_PER_FRACTIONAL_PART   8
> >>>>>>
> >>>>>> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> >>>>>
> >>>>> 1s idle timeout has been used by other IPs for a long time.
> >>>>> For example JPEG, UVD, VCN all use 1s.
> >>>>>
> >>>>> Can you please confirm both your AGESA and your SMU firmware versio=
n?
> >>>>> In case you're not aware; you can get AGESA version from SMBIOS str=
ing
> >>>>> (DMI type 40).
> >>>>>
> >>>>> =E2=9D=AF sudo dmidecode | grep AGESA
> >>>>
> >>>> String: AGESA!V9 StrixHaloPI-FP11 1.0.0.0c
> >>>>
> >>>>> You can get SMU firmware version from this:
> >>>>>
> >>>>> =E2=9D=AF grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
> >>>>
> >>>> grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
> >>>> /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_fw_version:100.112=
.0
> >>>> /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_program:0
> >>>>
> >>>
> >>> Thanks, I'll get some folks to see if we match this AGESA version if =
we
> >>> can also reproduce it on reference hardware the same way you did.
> >>>
> >>>>> Are you on the most up to date firmware for your system from the
> >>>>> manufacturer?
> >>>>
> >>>> I updated my bios, pd firmware, and USB device firmware early August=
,
> >>>> when I was doing this testing.
> >>>>
> >>>>> We haven't seen anything like this reported on Strix Halo thus far =
and
> >>>>> we do internal stress testing on s0i3 on reference hardware.
> >>>>
> >>>> Cant find a reference for it on the bug tracker. I have four bug
> >>>> reports on the bazzite issue tracker, 2 about sleep wake crashes and=
 2
> >>>> for runtime crashes, where the culprit would be this. IE runtime gat=
es
> >>>> VPE and causes a crash.
> >>>
> >>> All on Strix Halo and all tied to VPE?  At runtime was VPE in use?  B=
y
> >>> what software?
> >>>
> >>> BTW - Strix and Kraken also have VPE.
> >>
> >> All on the Z13. Not tied to VPE necessarily. I just know that I get
> >> reports of crashes on the Z13, and with this patch they are fixed for
> >> me. It will be part of the next bazzite version so I will get feedback
> >> about it.
> >>
> >> I don't think software that is using the VPE is relevant. Perhaps for
> >> the runtime crashes it is and this patch helps in that case as well.
> >> But in my case, the crash is caused after the ungate that runs the
> >> tests on resume on the delayed handler.
> >>
> >> The Z13 also has some other quirks with spurious wakeups when
> >> connected to a charger. So, if systemd is configured to e.g., sleep
> >> after 20m, combined with this crash if it stays plugged in overnight
> >> in the morning it has crashed.
> >>
> >>>>
> >>>>> To me this seems likely to be a platform firmware bug; but I would =
like
> >>>>> to understand the timing of the gate vs ungate on good vs bad.
> >>>>
> >>>> Perhaps it is. It is either something like that or silicon quality.
> >>>>
> >>>>> IE is it possible the delayed work handler
> >>>>> amdgpu_device_delayed_init_work_handler() is causing a race with
> >>>>> vpe_ring_begin_use()?
> >>>>
> >>>> I don't think so. There is only a single ungate. Also, the crash
> >>>> happens on the gate. So what happens is the device wakes up, the
> >>>> screen turns on, kde clock works, then after a second it freezes,
> >>>> there is a softlock, and the device hangs.
> >>>>
> >>>> The failed command is always the VPE gate that is triggered after 1s=
 in idle.
> >>>>
> >>>>> This should be possible to check without extra instrumentation by u=
sing
> >>>>> ftrace and looking at the timing of the 2 ring functions and the in=
it
> >>>>> work handler and checking good vs bad cycles.
> >>>>
> >>>> I do not know how to use ftrace. I should also note that after the
> >>>> device freezes around 1/5 cycles will sync the fs, so it is also not=
 a
> >>>> very easy thing to diagnose. The device just stops working. A lot of
> >>>> the logs I got were in pstore by forcing a kernel panic.
> >>>
> >>> Here's how you capture the timing of functions.  Each time the functi=
on
> >>> is called there will be an event in the trace buffer.
> >>>
> >>> =E2=9D=AF sudo trace-cmd record -p function -l
> >>> amdgpu_device_delayed_init_work_handler -l vpe_idle_work_handler -l
> >>> vpe_ring_begin_use -l vpe_ring_end_use -l amdgpu_pmops_suspend -l
> >>> amdgpu_pmops_resume
> >>>
> >>> Here's how you would review the report:
> >>>
> >>> =E2=9D=AF trace-cmd report
> >>> cpus=3D24
> >>>     kworker/u97:37-18051 [001] ..... 13655.970108: function:
> >>> amdgpu_pmops_suspend <-- pci_pm_suspend
> >>>     kworker/u97:21-18036 [002] ..... 13666.290715: function:
> >>> amdgpu_pmops_resume <-- dpm_run_callback
> >>>     kworker/u97:21-18036 [015] ..... 13666.308295: function:
> >>> vpe_ring_begin_use <-- amdgpu_ring_alloc
> >>>     kworker/u97:21-18036 [015] ..... 13666.308298: function:
> >>> vpe_ring_end_use <-- vpe_ring_test_ring
> >>>       kworker/15:1-12285 [015] ..... 13666.960191: function:
> >>> amdgpu_device_delayed_init_work_handler <-- process_one_work
> >>>       kworker/15:1-12285 [015] ..... 13666.963970: function:
> >>> vpe_ring_begin_use <-- amdgpu_ring_alloc
> >>>       kworker/15:1-12285 [015] ..... 13666.965481: function:
> >>> vpe_ring_end_use <-- amdgpu_ib_schedule
> >>>       kworker/15:4-16354 [015] ..... 13667.981394: function:
> >>> vpe_idle_work_handler <-- process_one_work
> >>>
> >>> I did this on a Strix system just now to capture that.
> >>>
> >>> You can see that basically the ring gets used before the delayed init
> >>> work handler, and then again from the ring tests.  My concern is if t=
he
> >>> sequence ever looks different than the above.  If it does; we do have=
 a
> >>> driver race condition.
> >>>
> >>> It would also be helpful to look at the function_graph tracer.
> >>>
> >>> Here's some more documentation about ftrace and trace-cmd.
> >>> https://www.kernel.org/doc/html/latest/trace/ftrace.html
> >>> https://lwn.net/Articles/410200/
> >>>
> >>> You can probably also get an LLM to help you with building commands i=
f
> >>> you're not familiar with it.
> >>>
> >>> But if you're hung so bad you can't flush to disk that's going to be =
a
> >>> problem without a UART.  A few ideas:
> >>
> >> Some times it flushes to disk
> >>
> >>> 1) You can use CONFIG_PSTORE_FTRACE
> >>
> >> I can look into that
> >>
> >>> 2) If you add "tp_printk" to the kernel command line it should make t=
he
> >>> trace ring buffer flush to kernel log ring buffer.  But be warned thi=
s
> >>> is going to change the timing, the issue might go away entirely or ha=
ve
> >>> a different failure rate.  So hopefully <1> works.
> >>>>
> >>>> If you say that all IP blocks use 1s, perhaps an alternative solutio=
n
> >>>> would be to desync the idle times so they do not happen
> >>>> simultaneously. So 1000, 1200, 1400, etc.
> >>>>
> >>>> Antheas
> >>>>
> >>>
> >>> I don't dobut your your proposal of changing the timing works.  I jus=
t
> >>> want to make sure it's the right solution because otherwise we might
> >>> change the timing or sequence elsewhere in the driver two years from =
now
> >>> and re-introduce the problem unintentionally.
> >>
> >> If there are other idle timers and only this one changes to 2s, I will
> >> agree and say that it would be peculiar. Although 1s seems arbitrary
> >> in any case.
> >
> > All of these timers are arbitrary.  Their point is just to provide a
> > future point where we can check if the engine is idle.  The idle work
> > handler will either power down the IP if it is idle or re-schedule in
> > the future and try again if there is still work.  Making the value
> > longer will use more power as it will wait longer before checking if
> > the engine is idle.  Making it shorter will save more power, but adds
> > extra overhead in that the engine will be powered up/down more often.
> > In most cases, the jobs should complete in a few ms.  The timer is
> > there to avoid the overhead of powering up/down the block too
> > frequently when applications are using the engine.
> >
> > Alex
>
> We had a try internally with both 6.17-rc2 and 6.17-rc3 and 1001b or
> 1001c AGESA on reference system but unfortunately didn't reproduce the
> issue with a 200 cycle attempt on either kernel or either BIOS (so we
> had 800 cycles total).

I think I did 6.12, 6.15, and a 6.16rc stock. I will have to come back
to you with 6.17-rc3.

> Was your base a bazzite kernel or was it an upstream kernel?  I know
> there are some other patches in bazzite especially relevant to suspend,
> so I wonder if they could be influencing the timing.
>
> Can you repo on 6.17-rc3?
>

