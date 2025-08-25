Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B68B34D34
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335E510E565;
	Mon, 25 Aug 2025 21:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="IfCbuxvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E7710E565;
 Mon, 25 Aug 2025 21:00:27 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id 337D246DE1;
 Tue, 26 Aug 2025 00:00:25 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id D5C1346C89;
 Tue, 26 Aug 2025 00:00:23 +0300 (EEST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 2008F2066B8;
 Tue, 26 Aug 2025 00:00:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756155623;
 bh=D8ifD12m19pxSkPj+MjJNcpSuPpQyZX3/Aoffcw+wLc=;
 h=Received:From:Subject:To;
 b=IfCbuxvx6ZRXXfPOild/vJ8o5gjLbLOmr/g9DFbRiJKcsOZOzl1sCFeWWRDmIZ19G
 Erm88DVQ/9eb9kHkWc1UPhX/fuBLmDR9X3biTqE2/cff71+zKa/4JAKNhf39XYKjaS
 QNB6dd0mrx6RZuxr4ZDkpVlY9/XzTdVze9RnRl/gs7P0jXrSG+3sk7uv8fsm6zY2J4
 PlSDdDLv0u0D5Sg2LU6J2Lgn1sWX0yBro/A7wzyslNladqIshry+2yQBd3KlTRWzNP
 nPczIj87I7+5G9NEslTnMBO0BsIfoY05p067DOP1D0Q+FX6horyQ5ecZ3Zif4Qvop0
 s0NS23/oU0f1A==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-333f92a69d4so35506611fa.2;
 Mon, 25 Aug 2025 14:00:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV18EPxEvBaIdxyaV2n36MAW/kwYQiqRRD7BBpHc1kr5cK4bvBK/ikcYAViOYAJwvnHfhlBXJ4NHJyH@lists.freedesktop.org,
 AJvYcCWjZbF7YWJsnDuCuQ70p+J6bmJN4jj7MC3yVnroFAkb5510HUlgEjE1GQpYFukQ3W1yG2q5Nj/H@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxajeK41b2ZwMy+eHFa+UqX8Weg8TSL0UNZhY/9uKTmhTN3bhEX
 C3A5dpt2kmB5pV1oP79DW7RfGRAMVkAgWD4iOK5PEH3OhSyY4Lgpb2ZuOn0dOIboWdTJL93FSg1
 zOc+iQkNcOpApPfKLlug7qeEiaVXpGx8=
X-Google-Smtp-Source: AGHT+IERDdc4cuaeqaeEoP6lBRc2LBCb+njMj/3wEbhTSDngQdBT7xq2OL7FygmjAFEfwtTTTMJNxulrEjvcqsG4xXo=
X-Received: by 2002:a2e:ae16:0:b0:334:d4b:4965 with SMTP id
 38308e7fff4ca-33650ffde38mr32898911fa.31.1756155622487; Mon, 25 Aug 2025
 14:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
 <CADnq5_MEhMha47V25SK4cZkd8TLcizR_y0si2n9jSDjJTXeoRQ@mail.gmail.com>
 <CAGwozwF=UKhG0HU_cxaY8957rscY=W4_VK+z==3vkKJJWZehzQ@mail.gmail.com>
 <CAGwozwFmfBrnZBO6JRZPnPyHLrKycdnoMRtOkK+KpwkdQ4Fw=w@mail.gmail.com>
 <425162fe-aeb7-4ff5-9a84-e7f6da20225e@kernel.org>
In-Reply-To: <425162fe-aeb7-4ff5-9a84-e7f6da20225e@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 25 Aug 2025 23:00:11 +0200
X-Gmail-Original-Message-ID: <CAGwozwHdQu0K-dgnh72P=ms-ory2bZr-6rtCtWM2QP0u8NqXng@mail.gmail.com>
X-Gm-Features: Ac12FXyzqiebyPhIvIZHh18pCxRjmJRazAsv4y3o_K7o71Is36skq1VQ6cWjOak
Message-ID: <CAGwozwHdQu0K-dgnh72P=ms-ory2bZr-6rtCtWM2QP0u8NqXng@mail.gmail.com>
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
 Peyton Lee <peytolee@amd.com>, Lang Yu <lang.yu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <175615562334.2864339.5517262997455263356@linux3247.grserver.gr>
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

On Mon, 25 Aug 2025 at 18:41, Mario Limonciello <superm1@kernel.org> wrote:
>
> On 8/25/2025 9:01 AM, Antheas Kapenekakis wrote:
> > On Mon, 25 Aug 2025 at 15:33, Antheas Kapenekakis <lkml@antheas.dev> wr=
ote:
> >>
> >> On Mon, 25 Aug 2025 at 15:20, Alex Deucher <alexdeucher@gmail.com> wro=
te:
> >>>
> >>> On Mon, Aug 25, 2025 at 3:13=E2=80=AFAM Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:
> >>>>
> >>>> On the Asus Z13 2025, which uses a Strix Halo platform, around 8% of=
 the
> >>>> suspend resumes result in a soft lock around 1 second after the scre=
en
> >>>> turns on (it freezes). This happens due to power gating VPE when it =
is
> >>>> not used, which happens 1 second after inactivity.
> >>>>
> >>>> Specifically, the VPE gating after resume is as follows: an initial
> >>>> ungate, followed by a gate in the resume process. Then,
> >>>> amdgpu_device_delayed_init_work_handler with a delay of 2s is schedu=
led
> >>>> to run tests, one of which is testing VPE in vpe_ring_test_ib. This
> >>>> causes an ungate, After that test, vpe_idle_work_handler is schedule=
d
> >>>> with VPE_IDLE_TIMEOUT (1s).
> >>>>
> >>>> When vpe_idle_work_handler runs and tries to gate VPE, it causes the
> >>>> SMU to hang and partially freezes half of the GPU IPs, with the thre=
ad
> >>>> that called the command being stuck processing it.
> >>>>
> >>>> Specifically, after that SMU command tries to run, we get the follow=
ing:
> >>>>
> >>>> snd_hda_intel 0000:c4:00.1: Refused to change power state from D0 to=
 D3hot
> >>>> ...
> >>>> xhci_hcd 0000:c4:00.4: Refused to change power state from D0 to D3ho=
t
> >>>> ...
> >>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous co=
mmand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VPE!
> >>>> [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm disable vpe fai=
led, ret =3D -62.
> >>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:93:crtc-0] flip_done timed =
out
> >>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous co=
mmand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate JPEG!
> >>>> [drm:jpeg_v4_0_5_set_powergating_state [amdgpu]] *ERROR* Dpm disable=
 jpeg failed, ret =3D -62.
> >>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous co=
mmand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 0!
> >>>> [drm:vcn_v4_0_5_stop [amdgpu]] *ERROR* Dpm disable uvd failed, ret =
=3D -62.
> >>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 1 from 0xd=
3
> >>>> thunderbolt 0000:c6:00.5: 0: timeout reading config space 2 from 0x5
> >>>> thunderbolt 0000:c6:00.5: Refused to change power state from D0 to D=
3hot
> >>>> amdgpu 0000:c4:00.0: [drm] *ERROR* [CRTC:97:crtc-1] flip_done timed =
out
> >>>> amdgpu 0000:c4:00.0: amdgpu: SMU: I'm not done with your previous co=
mmand: SMN_C2PMSG_66:0x00000032 SMN_C2PMSG_82:0x00000000
> >>>> amdgpu 0000:c4:00.0: amdgpu: Failed to power gate VCN instance 1!
> >>>>
> >>>> In addition to e.g., kwin errors in journalctl. 0000:c4.00.0 is the =
GPU.
> >>>> Interestingly, 0000:c4.00.6, which is another HDA block, 0000:c4.00.=
5,
> >>>> a PCI controller, and 0000:c4.00.2, resume normally. 0x00000032 is t=
he
> >>>> PowerDownVpe(50) command which is the common failure point in all
> >>>> failed resumes.
> >>>>
> >>>> On a normal resume, we should get the following power gates:
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVpe(50) para=
m: 0x00000000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg0(33) pa=
ram: 0x00000000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownJpeg1(38) pa=
ram: 0x00010000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn1(4) para=
m: 0x00010000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerDownVcn0(6) para=
m: 0x00000000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn0(7) param:=
 0x00000000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpVcn1(5) param:=
 0x00010000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg0(34) para=
m: 0x00000000, resp: 0x00000001
> >>>> amdgpu 0000:c4:00.0: amdgpu: smu send message: PowerUpJpeg1(39) para=
m: 0x00010000, resp: 0x00000001
> >>>>
> >>>> To fix this, increase VPE_IDLE_TIMEOUT to 2 seconds. This increases
> >>>> reliability from 4-25 suspends to 200+ (tested) suspends with a cycl=
e
> >>>> time of 12s sleep, 8s resume. The suspected reason here is that 1s t=
hat
> >>>> when VPE is used, it needs a bit of time before it can be gated and
> >>>> there was a borderline delay before, which is not enough for Strix H=
alo.
> >>>> When the VPE is not used, such as on resume, gating it instantly doe=
s
> >>>> not seem to cause issues.
> >>>
> >>> This doesn't make much sense.  The VPE idle timeout is arbitrary.  Th=
e
> >>> VPE idle work handler checks to see if the block is idle before it
> >>> powers gates the block. If it's not idle, then the delayed work is
> >>> rescheduled so changing the timing should not make a difference.  We
> >>> are no powering down VPE while it still has active jobs.  It sounds
> >>> like there is some race condition somewhere else.
> >>
> >> On resume, the vpe is ungated and gated instantly, which does not
> >> cause any crashes, then the delayed work is scheduled to run two
> >> seconds later. Then, the tests run and finish, which start the gate
> >> timer. After the timer lapses and the kernel tries to gate VPE, it
> >> crashes. I logged all SMU commands and there is no difference between
> >> the ones in a crash and not, other than the fact the VPE gate command
> >> failed. Which becomes apparent when the next command runs. I will also
> >> note that until the idle timer lapses, the system is responsive
> >>
> >> Since the VPE is ungated to run the tests, I assume that in my setup
> >> it is not used close to resume.
> >
> > I should also add that I forced a kernel panic and dumped all CPU
> > backtraces in multiple logs. After the softlock, CPUs were either
> > parked in the scheduler, powered off, or stuck executing an SMU
> > command by e.g., a userspace usage sensor graph. So it is not a
> > deadlock.
> >
>
> Can you please confirm if you are on the absolute latest linux-firmware
> when you reproduced this issue?

I was on the latest at the time built from source. I think it was
commit 08ee93ff8ffa. There was an update today though it seems.


> Can you please share the debugfs output for amdgpu_firmware_info.

Here is the information from it:
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 35, firmware version: 0x0000001f
PFP feature version: 35, firmware version: 0x0000002c
CE feature version: 0, firmware version: 0x00000000
RLC feature version: 1, firmware version: 0x11530505
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
RLCP feature version: 1, firmware version: 0x11530505
RLCV feature version: 0, firmware version: 0x00000000
MEC feature version: 35, firmware version: 0x0000001f
IMU feature version: 0, firmware version: 0x0b352300
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 553648366, firmware version: 0x210000ee
TA XGMI feature version: 0x00000000, firmware version: 0x00000000
TA RAS feature version: 0x00000000, firmware version: 0x00000000
TA HDCP feature version: 0x00000000, firmware version: 0x17000044
TA DTM feature version: 0x00000000, firmware version: 0x12000018
TA RAP feature version: 0x00000000, firmware version: 0x00000000
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x00647000 (100.112.0=
)
SDMA0 feature version: 60, firmware version: 0x0000000e
VCN feature version: 0, firmware version: 0x0911800b
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x09002600
TOC feature version: 0, firmware version: 0x0000000b
MES_KIQ feature version: 6, firmware version: 0x0000006c
MES feature version: 1, firmware version: 0x0000007c
VPE feature version: 60, firmware version: 0x00000016
VBIOS version: 113-STRXLGEN-001

I see there was an update today though

Antheas
>

