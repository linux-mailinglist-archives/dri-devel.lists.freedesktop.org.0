Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF90B373BF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 22:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853610E13F;
	Tue, 26 Aug 2025 20:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="UJ9ULFij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Tue, 26 Aug 2025 20:20:32 UTC
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D08810E132
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 20:20:32 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1756239193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEwl+km6rMqLNJM0Xam6ArNHJtprxb3IXhrjUZ0tkpU=;
 b=UJ9ULFijJ6iKjkULOf9yiOF/vfxYQdls29vmbMyrMhvS48FWz4pKZKzgVq/KyYYgWYVqc/
 tEd7Qy5S4QrP/tKe8ki3O6RAogykm7TOzcEVmzydG6Xl9TJz6ZZpdSC6HIE9buBrEY0WhU
 yOUSxocP1ViuhivWYHP4CKs1KCe/JMc=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <CAGwozwErcHdA9UD4wr6xDow5C5+sh-D=1Y74fG-p=0E3en+BHg@mail.gmail.com>
Date: Tue, 26 Aug 2025 13:12:46 -0700
Cc: Mario Limonciello <superm1@kernel.org>,
 Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Peyton Lee <peytolee@amd.com>, Lang Yu <lang.yu@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5CEB20FF-7D1A-42B3-BFD3-890EA44D15B7@linux.dev>
References: <20250824085351.454619-1-lkml@antheas.dev>
 <f2402154-b0af-439f-80e0-3a323f34bcbc@kernel.org>
 <CAGwozwHm1vC-qVo8h6gL_m8L3ufOY_nrau=Xqp6HK=6ff-ap3A@mail.gmail.com>
 <03e5408a-dc5d-4259-a366-2090ef1df622@kernel.org>
 <CAGwozwFCXFGHtpDejq_kr-1JaQhgXc-fyuCHK5FX2k57eKWfmw@mail.gmail.com>
 <CADnq5_Ow4SCZz_jnaQ-Y4zUEnBEKbeW5um3HFyLQvYvOy9WsAw@mail.gmail.com>
 <4becb4f2-f1f8-41e5-a968-02fdbd97e337@kernel.org>
 <CAGwozwErcHdA9UD4wr6xDow5C5+sh-D=1Y74fG-p=0E3en+BHg@mail.gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
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



> On Aug 26, 2025, at 12:21=E2=80=AFPM, Antheas Kapenekakis =
<lkml@antheas.dev> wrote:
>=20
> On Tue, 26 Aug 2025 at 21:19, Mario Limonciello <superm1@kernel.org> =
wrote:
>>=20
>> On 8/26/2025 8:41 AM, Alex Deucher wrote:
>>> On Tue, Aug 26, 2025 at 3:49=E2=80=AFAM Antheas Kapenekakis =
<lkml@antheas.dev> wrote:
>>>>=20
>>>> On Mon, 25 Aug 2025 at 03:38, Mario Limonciello =
<superm1@kernel.org> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 8/24/25 3:46 PM, Antheas Kapenekakis wrote:
>>>>>> On Sun, 24 Aug 2025 at 22:16, Mario Limonciello =
<superm1@kernel.org> wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>>=20
>>>>>>> On 8/24/25 3:53 AM, Antheas Kapenekakis wrote:
>>>>>>>> On the Asus Z13 2025, which uses a Strix Halo platform, around =
8% of the
>>>>>>>> suspend resumes result in a soft lock around 1 second after the =
screen
>>>>>>>> turns on (it freezes). This happens due to power gating VPE =
when it is
>>>>>>>> not used, which happens 1 second after inactivity.
>>>>>>>>=20
>>>>>>>> Specifically, the VPE gating after resume is as follows: an =
initial
>>>>>>>> ungate, followed by a gate in the resume process. Then,
>>>>>>>> amdgpu_device_delayed_init_work_handler with a delay of 2s is =
scheduled
>>>>>>>> to run tests, one of which is testing VPE in vpe_ring_test_ib. =
This
>>>>>>>> causes an ungate, After that test, vpe_idle_work_handler is =
scheduled
>>>>>>>> with VPE_IDLE_TIMEOUT (1s).
>>>>>>>>=20
>>>>>>>> When vpe_idle_work_handler runs and tries to gate VPE, it =
causes the
>>>>>>>> SMU to hang and partially freezes half of the GPU IPs, with the =
thread
>>>>>>>> that called the command being stuck processing it.
>>>>>>>>=20
>>>>>>>> Specifically, after that SMU command tries to run, we get the =
following:
>>>>>>>>=20
>>>>>>>> snd_hda_intel 0000:c4:00.1: Refused to change power state from =
D0 to D3hot
>>>>>>>> ...
>>>>>>>> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to =
D3hot
>>>>>>>> ...
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your =
previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
>>>>>>>> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable =
vpe failed, ret =3D -62.
>>>>>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done =
timed out
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your =
previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
>>>>>>>> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm =
disable jpeg failed, ret =3D -62.
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your =
previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance =
0!
>>>>>>>> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, =
ret =3D -62.
>>>>>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 =
from 0xd3
>>>>>>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 =
from 0x5
>>>>>>>> thunderbolt 0000:c6:00.5: Refused to change power state from D0 =
to D3hot
>>>>>>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done =
timed out
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your =
previous command: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance =
1!
>>>>>>>>=20
>>>>>>>> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is =
the GPU.
>>>>>>>> Interestingly, 0000:c4.00.6, which is another HDA block, =
0000:c4.00.5,
>>>>>>>> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 =
is the
>>>>>>>> PowerDownVpe(50) command which is the common failure point in =
all
>>>>>>>> failed resumes.
>>>>>>>>=20
>>>>>>>> On a normal resume, we should get the following power gates:
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) =
param: 0x00000000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: =
PowerDownJpeg0(33) param: 0x00000000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: =
PowerDownJpeg1(38) param: 0x00010000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) =
param: 0x00010000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) =
param: 0x00000000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) =
param: 0x00000000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) =
param: 0x00010000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) =
param: 0x00000000, resp: 0x00000001
>>>>>>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) =
param: 0x00010000, resp: 0x00000001
>>>>>>>>=20
>>>>>>>> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This =
increases
>>>>>>>> reliability from 4-25 suspends to 200+ (tested) suspends with a =
cycle
>>>>>>>> time of 12s sleep, 8s resume.
>>>>>>>=20
>>>>>>> When you say you reproduced with 12s sleep and 8s resume, was =
that
>>>>>>> 'amd-s2idle --duration 12 --wait 8'?
>>>>>>=20
>>>>>> I did not use amd-s2idle. I essentially used the script below =
with a
>>>>>> 12 on the wake alarm and 12 on the for loop. I also used pstore =
for
>>>>>> this testing.
>>>>>>=20
>>>>>> for i in {1..200}; do
>>>>>>   echo "Suspend attempt $i"
>>>>>>   echo `date '+%s' -d '+ 60 seconds'` | sudo tee =
/sys/class/rtc/rtc0/wakealarm
>>>>>>   sudo sh -c 'echo mem > /sys/power/state'
>>>>>>=20
>>>>>>   for j in {1..50}; do
>>>>>>     # Use repeating sleep in case echo mem returns early
>>>>>>     sleep 1
>>>>>>   done
>>>>>> done
>>>>>=20
>>>>> =F0=9F=91=8D
>>>>>=20
>>>>>>=20
>>>>>>>> The suspected reason here is that 1s that
>>>>>>>> when VPE is used, it needs a bit of time before it can be gated =
and
>>>>>>>> there was a borderline delay before, which is not enough for =
Strix Halo.
>>>>>>>> When the VPE is not used, such as on resume, gating it =
instantly does
>>>>>>>> not seem to cause issues.
>>>>>>>>=20
>>>>>>>> Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
>>>>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>=20
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>>>>>>>> index 121ee17b522b..24f09e457352 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>>>>>>>> @@ -34,8 +34,8 @@
>>>>>>>>   /* VPE CSA resides in the 4th page of CSA */
>>>>>>>>   #define AMDGPU_CSA_VPE_OFFSET       (4096 * 3)
>>>>>>>>=20
>>>>>>>> -/* 1 second timeout */
>>>>>>>> -#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(1000)
>>>>>>>> +/* 2 second timeout */
>>>>>>>> +#define VPE_IDLE_TIMEOUT     msecs_to_jiffies(2000)
>>>>>>>>=20
>>>>>>>>   #define VPE_MAX_DPM_LEVEL                   4
>>>>>>>>   #define FIXED1_8_BITS_PER_FRACTIONAL_PART   8
>>>>>>>>=20
>>>>>>>> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
>>>>>>>=20
>>>>>>> 1s idle timeout has been used by other IPs for a long time.
>>>>>>> For example JPEG, UVD, VCN all use 1s.
>>>>>>>=20
>>>>>>> Can you please confirm both your AGESA and your SMU firmware =
version?
>>>>>>> In case you're not aware; you can get AGESA version from SMBIOS =
string
>>>>>>> (DMI type 40).
>>>>>>>=20
>>>>>>> =E2=9D=AF sudo dmidecode | grep AGESA
>>>>>>=20
>>>>>> String: AGESA!V9 StrixHaloPI-FP11 1.0.0.0c
>>>>>>=20
>>>>>>> You can get SMU firmware version from this:
>>>>>>>=20
>>>>>>> =E2=9D=AF grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
>>>>>>=20
>>>>>> grep . /sys/bus/platform/drivers/amd_pmc/*/smu_*
>>>>>> =
/sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_fw_version:100.112.0
>>>>>> /sys/bus/platform/drivers/amd_pmc/AMDI000B:00/smu_program:0
>>>>>>=20
>>>>>=20
>>>>> Thanks, I'll get some folks to see if we match this AGESA version =
if we
>>>>> can also reproduce it on reference hardware the same way you did.
>>>>>=20
>>>>>>> Are you on the most up to date firmware for your system from the
>>>>>>> manufacturer?
>>>>>>=20
>>>>>> I updated my bios, pd firmware, and USB device firmware early =
August,
>>>>>> when I was doing this testing.
>>>>>>=20
>>>>>>> We haven't seen anything like this reported on Strix Halo thus =
far and
>>>>>>> we do internal stress testing on s0i3 on reference hardware.
>>>>>>=20
>>>>>> Cant find a reference for it on the bug tracker. I have four bug
>>>>>> reports on the bazzite issue tracker, 2 about sleep wake crashes =
and 2
>>>>>> for runtime crashes, where the culprit would be this. IE runtime =
gates
>>>>>> VPE and causes a crash.
>>>>>=20
>>>>> All on Strix Halo and all tied to VPE?  At runtime was VPE in use? =
 By
>>>>> what software?
>>>>>=20
>>>>> BTW - Strix and Kraken also have VPE.
>>>>=20
>>>> All on the Z13. Not tied to VPE necessarily. I just know that I get
>>>> reports of crashes on the Z13, and with this patch they are fixed =
for
>>>> me. It will be part of the next bazzite version so I will get =
feedback
>>>> about it.
>>>>=20
>>>> I don't think software that is using the VPE is relevant. Perhaps =
for
>>>> the runtime crashes it is and this patch helps in that case as =
well.
>>>> But in my case, the crash is caused after the ungate that runs the
>>>> tests on resume on the delayed handler.
>>>>=20
>>>> The Z13 also has some other quirks with spurious wakeups when
>>>> connected to a charger. So, if systemd is configured to e.g., sleep
>>>> after 20m, combined with this crash if it stays plugged in =
overnight
>>>> in the morning it has crashed.
>>>>=20
>>>>>>=20
>>>>>>> To me this seems likely to be a platform firmware bug; but I =
would like
>>>>>>> to understand the timing of the gate vs ungate on good vs bad.
>>>>>>=20
>>>>>> Perhaps it is. It is either something like that or silicon =
quality.
>>>>>>=20
>>>>>>> IE is it possible the delayed work handler
>>>>>>> amdgpu_device_delayed_init_work_handler() is causing a race with
>>>>>>> vpe_ring_begin_use()?
>>>>>>=20
>>>>>> I don't think so. There is only a single ungate. Also, the crash
>>>>>> happens on the gate. So what happens is the device wakes up, the
>>>>>> screen turns on, kde clock works, then after a second it freezes,
>>>>>> there is a softlock, and the device hangs.
>>>>>>=20
>>>>>> The failed command is always the VPE gate that is triggered after =
1s in idle.
>>>>>>=20
>>>>>>> This should be possible to check without extra instrumentation =
by using
>>>>>>> ftrace and looking at the timing of the 2 ring functions and the =
init
>>>>>>> work handler and checking good vs bad cycles.
>>>>>>=20
>>>>>> I do not know how to use ftrace. I should also note that after =
the
>>>>>> device freezes around 1/5 cycles will sync the fs, so it is also =
not a
>>>>>> very easy thing to diagnose. The device just stops working. A lot =
of
>>>>>> the logs I got were in pstore by forcing a kernel panic.
>>>>>=20
>>>>> Here's how you capture the timing of functions.  Each time the =
function
>>>>> is called there will be an event in the trace buffer.
>>>>>=20
>>>>> =E2=9D=AF sudo trace-cmd record -p function -l
>>>>> amdgpu_device_delayed_init_work_handler -l vpe_idle_work_handler =
-l
>>>>> vpe_ring_begin_use -l vpe_ring_end_use -l amdgpu_pmops_suspend -l
>>>>> amdgpu_pmops_resume
>>>>>=20
>>>>> Here's how you would review the report:
>>>>>=20
>>>>> =E2=9D=AF trace-cmd report
>>>>> cpus=3D24
>>>>>   kworker/u97:37-18051 [001] ..... 13655.970108: function:
>>>>> amdgpu_pmops_suspend <-- pci_pm_suspend
>>>>>   kworker/u97:21-18036 [002] ..... 13666.290715: function:
>>>>> amdgpu_pmops_resume <-- dpm_run_callback
>>>>>   kworker/u97:21-18036 [015] ..... 13666.308295: function:
>>>>> vpe_ring_begin_use <-- amdgpu_ring_alloc
>>>>>   kworker/u97:21-18036 [015] ..... 13666.308298: function:
>>>>> vpe_ring_end_use <-- vpe_ring_test_ring
>>>>>     kworker/15:1-12285 [015] ..... 13666.960191: function:
>>>>> amdgpu_device_delayed_init_work_handler <-- process_one_work
>>>>>     kworker/15:1-12285 [015] ..... 13666.963970: function:
>>>>> vpe_ring_begin_use <-- amdgpu_ring_alloc
>>>>>     kworker/15:1-12285 [015] ..... 13666.965481: function:
>>>>> vpe_ring_end_use <-- amdgpu_ib_schedule
>>>>>     kworker/15:4-16354 [015] ..... 13667.981394: function:
>>>>> vpe_idle_work_handler <-- process_one_work
>>>>>=20
>>>>> I did this on a Strix system just now to capture that.
>>>>>=20
>>>>> You can see that basically the ring gets used before the delayed =
init
>>>>> work handler, and then again from the ring tests.  My concern is =
if the
>>>>> sequence ever looks different than the above.  If it does; we do =
have a
>>>>> driver race condition.
>>>>>=20
>>>>> It would also be helpful to look at the function_graph tracer.
>>>>>=20
>>>>> Here's some more documentation about ftrace and trace-cmd.
>>>>> https://www.kernel.org/doc/html/latest/trace/ftrace.html
>>>>> https://lwn.net/Articles/410200/
>>>>>=20
>>>>> You can probably also get an LLM to help you with building =
commands if
>>>>> you're not familiar with it.
>>>>>=20
>>>>> But if you're hung so bad you can't flush to disk that's going to =
be a
>>>>> problem without a UART.  A few ideas:
>>>>=20
>>>> Some times it flushes to disk
>>>>=20
>>>>> 1) You can use CONFIG_PSTORE_FTRACE
>>>>=20
>>>> I can look into that
>>>>=20
>>>>> 2) If you add "tp_printk" to the kernel command line it should =
make the
>>>>> trace ring buffer flush to kernel log ring buffer.  But be warned =
this
>>>>> is going to change the timing, the issue might go away entirely or =
have
>>>>> a different failure rate.  So hopefully <1> works.
>>>>>>=20
>>>>>> If you say that all IP blocks use 1s, perhaps an alternative =
solution
>>>>>> would be to desync the idle times so they do not happen
>>>>>> simultaneously. So 1000, 1200, 1400, etc.
>>>>>>=20
>>>>>> Antheas
>>>>>>=20
>>>>>=20
>>>>> I don't dobut your your proposal of changing the timing works.  I =
just
>>>>> want to make sure it's the right solution because otherwise we =
might
>>>>> change the timing or sequence elsewhere in the driver two years =
from now
>>>>> and re-introduce the problem unintentionally.
>>>>=20
>>>> If there are other idle timers and only this one changes to 2s, I =
will
>>>> agree and say that it would be peculiar. Although 1s seems =
arbitrary
>>>> in any case.
>>>=20
>>> All of these timers are arbitrary.  Their point is just to provide a
>>> future point where we can check if the engine is idle.  The idle =
work
>>> handler will either power down the IP if it is idle or re-schedule =
in
>>> the future and try again if there is still work.  Making the value
>>> longer will use more power as it will wait longer before checking if
>>> the engine is idle.  Making it shorter will save more power, but =
adds
>>> extra overhead in that the engine will be powered up/down more =
often.
>>> In most cases, the jobs should complete in a few ms.  The timer is
>>> there to avoid the overhead of powering up/down the block too
>>> frequently when applications are using the engine.
>>>=20
>>> Alex
>>=20
>> We had a try internally with both 6.17-rc2 and 6.17-rc3 and 1001b or
>> 1001c AGESA on reference system but unfortunately didn't reproduce =
the
>> issue with a 200 cycle attempt on either kernel or either BIOS (so we
>> had 800 cycles total).
>=20
> I think I did 6.12, 6.15, and a 6.16rc stock. I will have to come back
> to you with 6.17-rc3.

I can reproduce the hang on a stock 6.17-rc3 kernel on my own Flow Z13, =
froze within 10 cycles with Antheas=E2=80=99 script. I will setup pstore =
to get logs from it since nothing appears in my journal after force =
rebooting.

Matt

>=20
>> Was your base a bazzite kernel or was it an upstream kernel?  I know
>> there are some other patches in bazzite especially relevant to =
suspend,
>> so I wonder if they could be influencing the timing.
>>=20
>> Can you repo on 6.17-rc3?
>>=20
>=20
>=20

