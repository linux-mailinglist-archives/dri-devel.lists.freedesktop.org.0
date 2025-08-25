Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66EEB34279
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1FC10E262;
	Mon, 25 Aug 2025 14:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Gz6bTryg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE54C10E262;
 Mon, 25 Aug 2025 14:01:17 +0000 (UTC)
Received: from relay11 (localhost.localdomain [127.0.0.1])
 by relay11.grserver.gr (Proxmox) with ESMTP id 9200AC66D0;
 Mon, 25 Aug 2025 17:01:16 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay11.grserver.gr (Proxmox) with ESMTPS id C8901C66D3;
 Mon, 25 Aug 2025 17:01:14 +0300 (EEST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 4D1FE2065C4;
 Mon, 25 Aug 2025 17:01:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756130474;
 bh=jUm2cs0MxLstzqDw/bvRmVyb9uCYh++AUfp1YcHAGdU=;
 h=Received:From:Subject:To;
 b=Gz6bTrygMp695Wmad6nnOfB3u5p1zJ+Sxou0/9kdnBWvxIRVVjN3CbGrrhxHaLsAn
 3hAcC6gD0e/Q2Mym/MjdqD/ciZ3SJsslju2jyw7VTFhNCgzZOAr7Qp82P/GI12G8qI
 TiuU2EYAKo66isnRsSWlNPV6eY/oGqhE1YThDw3za3jV0s0PNLlCYEoNHR6+QLAHEz
 h4yzUPc2mXtjwJfwjm3JmCUL8oCy2TcHpvUt21N0d7ouR3U7AoPqk9Xr1aRvQz2StQ
 0imNIJ9aUhRtx0tW9SGYK///44PMN5xoEyQZsTsjLsltwYPBjlpaammHI/nQhyoQyJ
 vGn+h+NTmtjcA==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-33682342180so2131811fa.0;
 Mon, 25 Aug 2025 07:01:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Gepe/JdioCpIL7XXUO/4nDRXNUpplZNvhN7P1RbubmyllZ1A/cODTbgSK/s7H6h55kctswMSQSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEJN857KIaQwyQT2gKUAXtj0+uQi+8/4qSQ6N0OLbIxWGEoekC
 GuYNZkxn8DoYxGY/72Dftf9Oi4YLbn95zgkPlRxhg5AywCXJXVpFH1Kq80D3ZLdGBxO5bFXleZx
 TiQB1tKTs6Ouhx8aN7823QnER9OZRoRQ=
X-Google-Smtp-Source: AGHT+IEgIFu2a7sSoFRT1MWLt6wWj0nqliXMoBwBzszCtWscNMu9jYuezQU31rkuIloH/F6+esORXsebg9pTT8CGEEQ=
X-Received: by 2002:a2e:bc02:0:b0:336:527a:5b4d with SMTP id
 38308e7fff4ca-336527a5f6bmr35365301fa.19.1756130473726; Mon, 25 Aug 2025
 07:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
 <CADnq5_MEhMha47V25SK4cZkd8TLcizR_y0si2n9jSDjJTXeoRQ@mail.gmail.com>
 <CAGwozwF=UKhG0HU_cxaY8957rscY=W4_VK+z==3vkKJJWZehzQ@mail.gmail.com>
In-Reply-To: <CAGwozwF=UKhG0HU_cxaY8957rscY=W4_VK+z==3vkKJJWZehzQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 25 Aug 2025 16:01:00 +0200
X-Gmail-Original-Message-ID: <CAGwozwFmfBrnZBO6JRZPnPyHLrKycdnoMRtOkK+KpwkdQ4Fw=w@mail.gmail.com>
X-Gm-Features: Ac12FXyQXp39OEOxY06bF-IxIMDwCeQYQShgDJkivBsTcvO9jU_0oGLfwxsrQbI
Message-ID: <CAGwozwFmfBrnZBO6JRZPnPyHLrKycdnoMRtOkK+KpwkdQ4Fw=w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/amdgpu/vpe: increase VPE_IDLE_TIMEOUT to fix
 hang on Strix Halo
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Peyton Lee <peytolee@amd.com>, 
 Lang Yu <lang.yu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <175613047452.1417582.490837104863436972@linux3247.grserver.gr>
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

On Mon, 25 Aug 2025 at 15:33, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Mon, 25 Aug 2025 at 15:20, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Mon, Aug 25, 2025 at 3:13=E2=80=AFAM Antheas Kapenekakis <lkml@anthe=
as.dev> wrote:
> > >
> > > On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of =
the
> > > suspend resumes result in a soft lock around 1 second after the scree=
n
> > > turns on (it freezes). This happens due to power gating VPE when it i=
s
> > > not used, which happens 1 second after inactivity.
> > >
> > > Specifically, the VPE gating after resume is as follows: an initial
> > > ungate, followed by a gate in the resume process. Then,
> > > amdgpu_device_delayed_init_work_handler with a delay of 2s is schedul=
ed
> > > to run tests, one of which is testing VPE in vpe_ring_test_ib. This
> > > causes an ungate, After that test, vpe_idle_work_handler is scheduled
> > > with VPE_IDLE_TIMEOUT (1s).
> > >
> > > When vpe_idle_work_handler runs and tries to gate VPE, it causes the
> > > SMU to hang and partially freezes half of the GPU IPs, with the threa=
d
> > > that called the command being stuck processing it.
> > >
> > > Specifically, after that SMU command tries to run, we get the followi=
ng:
> > >
> > > snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to =
D3hot
> > > ...
> > > xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3hot
> > > ...
> > > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous com=
mand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> > > [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe fail=
ed, ret =3D -62.
> > > amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed o=
ut
> > > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous com=
mand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> > > [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable =
jpeg failed, ret =3D -62.
> > > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous com=
mand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> > > [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret =
=3D -62.
> > > thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd3
> > > thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
> > > thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D3=
hot
> > > amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed o=
ut
> > > amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous com=
mand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> > > amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
> > >
> > > In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the G=
PU.
> > > Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.5=
,
> > > a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is th=
e
> > > PowerDownVpe(50) command which is the common failure point in all
> > > failed resumes.
> > >
> > > On a normal resume, we should get the following power gates:
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) param=
: 0x00000000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) par=
am: 0x00000000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) par=
am: 0x00010000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) param=
: 0x00010000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) param=
: 0x00000000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param: =
0x00000000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param: =
0x00010000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) param=
: 0x00000000, resp: 0x00000001
> > > amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) param=
: 0x00010000, resp: 0x00000001
> > >
> > > To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
> > > reliability from 4-25 suspends to 200+ (tested) suspends with a cycle
> > > time of 12s sleep, 8s resume. The suspected reason here is that 1s th=
at
> > > when VPE is used, it needs a bit of time before it can be gated and
> > > there was a borderline delay before, which is not enough for Strix Ha=
lo.
> > > When the VPE is not used, such as on resume, gating it instantly does
> > > not seem to cause issues.
> >
> > This doesn't make much sense.  The VPE idle timeout is arbitrary.  The
> > VPE idle work handler checks to see if the block is idle before it
> > powers gates the block. If it's not idle, then the delayed work is
> > rescheduled so changing the timing should not make a difference.  We
> > are no powering down VPE while it still has active jobs.  It sounds
> > like there is some race condition somewhere else.
>
> On resume, the vpe is ungated and gated instantly, which does not
> cause any crashes, then the delayed work is scheduled to run two
> seconds later. Then, the tests run and finish, which start the gate
> timer. After the timer lapses and the kernel tries to gate VPE, it
> crashes. I logged all SMU commands and there is no difference between
> the ones in a crash and not, other than the fact the VPE gate command
> failed. Which becomes apparent when the next command runs. I will also
> note that until the idle timer lapses, the system is responsive
>
> Since the VPE is ungated to run the tests, I assume that in my setup
> it is not used close to resume.

I should also add that I forced a kernel panic and dumped all CPU
backtraces in multiple logs. After the softlock, CPUs were either
parked in the scheduler, powered off, or stuck executing an SMU
command by e.g., a userspace usage sensor graph. So it is not a
deadlock.

Antheas

> Antheas
>
> > Alex
> >
> > >
> > > Fixes: 5f82a0c90cca ("drm/amdgpu/vpe: enable vpe dpm")
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vpe.c
> > > index 121ee17b522b..24f09e457352 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> > > @@ -34,8 +34,8 @@
> > >  /* VPE CSA resides in the 4th page of CSA */
> > >  #define AMDGPU_CSA_VPE_OFFSET  (4096 * 3)
> > >
> > > -/* 1 second timeout */
> > > -#define VPE_IDLE_TIMEOUT       msecs_to_jiffies(1000)
> > > +/* 2 second timeout */
> > > +#define VPE_IDLE_TIMEOUT       msecs_to_jiffies(2000)
> > >
> > >  #define VPE_MAX_DPM_LEVEL                      4
> > >  #define FIXED1_8_BITS_PER_FRACTIONAL_PART      8
> > >
> > > base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> > > --
> > > 2.50.1
> > >
> > >
> >

