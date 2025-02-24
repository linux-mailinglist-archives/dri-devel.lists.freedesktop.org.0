Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC430A42258
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116B910E429;
	Mon, 24 Feb 2025 14:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tteles.dev header.i=@tteles.dev header.b="KWhUHEwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 614 seconds by postgrey-1.36 at gabe;
 Mon, 24 Feb 2025 03:07:10 UTC
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD96D10E122;
 Mon, 24 Feb 2025 03:07:10 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
 by mail.w14.tutanota.de (Postfix) with ESMTP id 3A18463FF342;
 Mon, 24 Feb 2025 03:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740365814; 
 s=s1; d=tteles.dev;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
 bh=wzUKVUkOHIzDyVJlm1rH9UeIF+LuRtjapviN0QSZFyQ=;
 b=KWhUHEwM44VEvhrE6vB+ZBqV8Hp4DmWyDnc0qz0SVgYD5QktLpqIgE46C5T8dEvz
 c+EDs/necnTdztpB08PC9q64v1HvLDPW+ht+ykZVKozNLzqjxY80uQGKIhuupAijNjM
 Xo9ertfiW46x+M7gGU0sGLGs16pSrBt2R9ynbZaeJs2i/LB1OgdyLvcxsrU3SxmPxDv
 voPsnZ1YobRaPSKsa5J6u4eHxt+Hr6RasaylG1aXJwrdU6HpDhjUT493FR7RwdM4ZG/
 nzO7d8UjZWzF7DcMuq/vQ6JSFzWZfEm+Wy4BG9b14ldWFlAEJXsMXdUjTWagvBITZwX
 zraggt+WSw==
Date: Mon, 24 Feb 2025 03:56:54 +0100 (CET)
From: mail@tteles.dev
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Xinhui Pan <xinhui.pan@amd.com>, Airlied <airlied@gmail.com>,
 Simona <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Tzimmermann <tzimmermann@suse.de>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Ahmad Rehman <ahmad.rehman@amd.com>, Shaoyun Liu <shaoyun.liu@amd.com>,
 Ramesh Errabolu <ramesh.errabolu@amd.com>, Jun Ma2 <jun.ma2@amd.com>,
 Daniel <daniel@makrotopia.org>, Linux Firmware <linux-firmware@kernel.org>,
 Dri Devel <dri-devel@lists.freedesktop.org>,
 Amd Gfx <amd-gfx@lists.freedesktop.org>, Stable <stable@vger.kernel.org>
Message-ID: <OJpqNWx--F-9@tteles.dev>
In-Reply-To: <eabde17b-b5e5-456f-a499-cff132f1bf8a@amd.com>
References: <OJnZDtd----9@tteles.dev>
 <eabde17b-b5e5-456f-a499-cff132f1bf8a@amd.com>
Subject: Re: REGRESSION amdgpu 20241108 firmware breaks screen updating
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 24 Feb 2025 14:05:04 +0000
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


I can confirm=C2=A0amdgpu.dcdebugmask=3D0x200 fixes it, no more stutters.

It would be very beneficial to include the patch making this behavior defau=
lt (https://lore.kernel.org/amd-gfx/20250221160145.1730752-3-zaeem.mohamed@=
amd.com/T/#u)=C2=A0in the relevant linux-stable trees, as this is a major i=
ssue for affected systems.=C2=A0

I CC'd=C2=A0stable@vger.kernel.org=C2=A0and ask for the patch to be include=
d in linux-stable, even though it does not have a "Fixes:" tag, if the main=
tainers are okay with it.

Thank you for the quick response!
Tiago

Feb 23, 2025, 17:26 by mario.limonciello@amd.com:

> Hello,
>
> This sounds like to me a problem with PSR-SU.  There have been a variety =
of these being reported the past few months.  Enough so that the policy to =
enable it by default is being rolled back for now.
>
> https://lore.kernel.org/amd-gfx/20250221160145.1730752-3-zaeem.mohamed@am=
d.com/T/#u
>
> To confirm that's the root cause you can disable it with amdgpu.dcdebugma=
sk=3D0x200.
>
> Thanks,
>
> On 2/23/2025 10:08, mail@tteles.dev wrote:
>
>> Greetings,
>>
>> I wish to report a regression in amdgpu firmware introduced in commit c9=
9eeb4d0e13f5831ae77f7ec521162594385d5f, the problem persists until git HEAD=
, and reverting to the previous commit fixes the issues with no further cha=
nges to the environment.
>>
>> The issue appears on a Lenovo IdeaPad Pro 5, with a Ryzen 8845HS process=
or, using the 780M iGPU (1002:1900 I believe). The screen on this laptop is=
 120Hz 2800x1800, supporting HDR.
>> This was tested on Archlinux 6.13.3.arch1-1, with amdgpu drivers, on bot=
h Wayland (Gnome and Hyprland) and Xorg (i3wm). I'm using amd-pstate-epp sc=
aling driver, tested with both performance and powersave governers, to the =
same effect.
>>
>> I will list the symptoms and attempt to guess at what the issue may be.
>>
>> - The screen stops updating if no mouse input is given while watching lo=
w resolution video (wherever it is, Brave and mpv, regardless of software o=
r hw decoding).
>> =C2=A0 Low resolution matters here, I can play 4k video fine, 1080p with=
 mild stutters, but lower becomes very bad.
>> =C2=A0 Here is an example using mpv with 360p sample video, recorded on =
my phone as to not disturb the environment its running in. (https://youtu.b=
e/kYHqBjPxM2s You can tell it is very choppy, the original video https://ww=
w.youtube.com/watch?v=3D1HrXwe6s4W8 is not choppy)
>> =C2=A0 mpv did not report any dropped frames despite there obviously bei=
ng a huge amount.
>>
>> - In some programs, text does not get displayed instantly from when typi=
ng it, having to type 5 or 6 characters for the previous to finally show.
>> =C2=A0 All these new characters show up at the same time. This was extre=
mely noticeable with gnome's default "Console", it also happened in Brave B=
rowser's search bar, and Signal, it does not seem to happen with Ghostty.
>>
>> Constantly waving my cursor fixes all these issues. Connecting a seconda=
ry display seems to fix the issue on all displays.
>>
>> From my limited knowledge this seems like a bug in damage detection for =
eDP + power management, where low enough power levels don't trigger redraws=
.
>>
>> I am confident the issue was introduced in that commit since I bisected =
linux-firmware commits affecting amdgpu until the issue was no longer found=
.
>>
>>
>> Extra info:
>> # dmesg | grep amd
>> [=C2=A0=C2=A0=C2=A0 0.414396] perf/amd_iommu: Detected AMD IOMMU #0 (2 b=
anks, 4 counters/bank).
>> [=C2=A0=C2=A0=C2=A0 1.875492] [drm] amdgpu kernel modesetting enabled.
>> [=C2=A0=C2=A0=C2=A0 1.878563] amdgpu: Virtual CRAT table created for CPU
>> [=C2=A0=C2=A0=C2=A0 1.878573] amdgpu: Topology: Add CPU node
>> [=C2=A0=C2=A0=C2=A0 1.882607] amdgpu 0000:63:00.0: amdgpu: Fetched VBIOS=
 from VFCT
>> [=C2=A0=C2=A0=C2=A0 1.882610] amdgpu: ATOM BIOS: 113-PHXGENERIC-001
>> [=C2=A0=C2=A0=C2=A0 1.909536] amdgpu 0000:63:00.0: vgaarb: deactivate vg=
a console
>> [=C2=A0=C2=A0=C2=A0 1.909542] amdgpu 0000:63:00.0: amdgpu: Trusted Memor=
y Zone (TMZ) feature enabled
>> [=C2=A0=C2=A0=C2=A0 1.909612] amdgpu 0000:63:00.0: amdgpu: VRAM: 4096M 0=
x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
>> [=C2=A0=C2=A0=C2=A0 1.909614] amdgpu 0000:63:00.0: amdgpu: GART: 512M 0x=
00007FFF00000000 - 0x00007FFF1FFFFFFF
>> [=C2=A0=C2=A0=C2=A0 1.909829] [drm] amdgpu: 4096M of VRAM memory ready
>> [=C2=A0=C2=A0=C2=A0 1.909832] [drm] amdgpu: 13932M of GTT memory ready.
>> [=C2=A0=C2=A0=C2=A0 1.935030] amdgpu 0000:63:00.0: amdgpu: reserve 0x400=
0000 from 0x80f8000000 for PSP TMR
>> [=C2=A0=C2=A0=C2=A0 2.482626] amdgpu 0000:63:00.0: amdgpu: RAS: optional=
 ras ta ucode is not available
>> [=C2=A0=C2=A0=C2=A0 2.491068] amdgpu 0000:63:00.0: amdgpu: RAP: optional=
 rap ta ucode is not available
>> [=C2=A0=C2=A0=C2=A0 2.491071] amdgpu 0000:63:00.0: amdgpu: SECUREDISPLAY=
: securedisplay ta ucode is not available
>> [=C2=A0=C2=A0=C2=A0 2.521960] amdgpu 0000:63:00.0: amdgpu: SMU is initia=
lized successfully!
>> [=C2=A0=C2=A0=C2=A0 2.601611] kfd kfd: amdgpu: Allocated 3969056 bytes o=
n gart
>> [=C2=A0=C2=A0=C2=A0 2.601628] kfd kfd: amdgpu: Total number of KFD nodes=
 to be created: 1
>> [=C2=A0=C2=A0=C2=A0 2.602048] amdgpu: Virtual CRAT table created for GPU
>> [=C2=A0=C2=A0=C2=A0 2.602191] amdgpu: Topology: Add dGPU node [0x1900:0x=
1002]
>> [=C2=A0=C2=A0=C2=A0 2.602193] kfd kfd: amdgpu: added device 1002:1900
>> [=C2=A0=C2=A0=C2=A0 2.602206] amdgpu 0000:63:00.0: amdgpu: SE 1, SH per =
SE 2, CU per SH 6, active_cu_number 12
>> [=C2=A0=C2=A0=C2=A0 2.602212] amdgpu 0000:63:00.0: amdgpu: ring gfx_0.0.=
0 uses VM inv eng 0 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602215] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0=
.0 uses VM inv eng 1 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602216] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1=
.0 uses VM inv eng 4 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602217] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2=
.0 uses VM inv eng 6 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602219] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3=
.0 uses VM inv eng 7 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602220] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0=
.1 uses VM inv eng 8 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602221] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1=
.1 uses VM inv eng 9 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602222] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2=
.1 uses VM inv eng 10 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602223] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3=
.1 uses VM inv eng 11 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602224] amdgpu 0000:63:00.0: amdgpu: ring sdma0 us=
es VM inv eng 12 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.602225] amdgpu 0000:63:00.0: amdgpu: ring vcn_unif=
ied_0 uses VM inv eng 0 on hub 8
>> [=C2=A0=C2=A0=C2=A0 2.602226] amdgpu 0000:63:00.0: amdgpu: ring jpeg_dec=
 uses VM inv eng 1 on hub 8
>> [=C2=A0=C2=A0=C2=A0 2.602227] amdgpu 0000:63:00.0: amdgpu: ring mes_kiq_=
3.1.0 uses VM inv eng 13 on hub 0
>> [=C2=A0=C2=A0=C2=A0 2.609481] amdgpu 0000:63:00.0: amdgpu: Runtime PM no=
t available
>> [=C2=A0=C2=A0=C2=A0 2.610787] [drm] Initialized amdgpu 3.60.0 for 0000:6=
3:00.0 on minor 1
>> [=C2=A0=C2=A0=C2=A0 2.617618] fbcon: amdgpudrmfb (fb0) is primary device
>> [=C2=A0=C2=A0=C2=A0 3.788332] amdgpu 0000:63:00.0: [drm] fb0: amdgpudrmf=
b frame buffer device
>> [=C2=A0=C2=A0=C2=A0 5.120419] kvm_amd: TSC scaling supported
>> [=C2=A0=C2=A0=C2=A0 5.120426] kvm_amd: Nested Virtualization enabled
>> [=C2=A0=C2=A0=C2=A0 5.120428] kvm_amd: Nested Paging enabled
>> [=C2=A0=C2=A0=C2=A0 5.120430] kvm_amd: LBR virtualization supported
>> [=C2=A0=C2=A0=C2=A0 5.120443] kvm_amd: Virtual GIF supported
>> [=C2=A0=C2=A0=C2=A0 5.120444] kvm_amd: Virtual NMI enabled
>> [=C2=A0=C2=A0=C2=A0 5.170720] snd_hda_intel 0000:63:00.1: bound 0000:63:=
00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
>> [=C2=A0=C2=A0=C2=A0 5.191443] amd_atl: AMD Address Translation Library i=
nitialized
>>
>>
>> Thank you for your time,
>> Tiago Teles
>>

