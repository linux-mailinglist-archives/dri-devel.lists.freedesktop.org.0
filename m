Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401EC35618
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 12:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1377A10E702;
	Wed,  5 Nov 2025 11:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="G1JtuQ8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7110E704
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 11:35:15 +0000 (UTC)
Received: from relay13 (localhost [127.0.0.1])
 by relay13.grserver.gr (Proxmox) with ESMTP id A11455E52B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 13:35:14 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay13.grserver.gr (Proxmox) with ESMTPS id E68395E530
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 13:35:12 +0200 (EET)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 930D2201BCB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 13:35:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1762342511;
 bh=2zPD0WBVf4i/ezq7b1QUKnCu2WljXyXeAe1e8dFi6io=;
 h=Received:From:Subject:To;
 b=G1JtuQ8JVr1EREbuGk5VZEdycPKzFzTsioXuA59AyiZRPQ+slrQm6QW5zDflIP/gp
 AYCSRQ8Mw0cAK/Q6jobF+6N7SysmXKm1nr0FXDzF+Y5Wa9Dh88Rlzsapvjl6+rQzV4
 Kv2u7V0DWN4RXjTkalXyshC58UMC/BMsfhTMC51pkwjYqaNhaGJWgwOkmaersfx+y4
 FHH57hYzk1lJYG0orFB7s28I6f77ElpqN/R7Nrx+3/4EgZOI1FVxTinYMTF0pouxsh
 YHfmHK3z3diAHuaA4F98Mx0FoGoRPssenlCuvOAWgkB/QXfQvF+VBjtkJMA3oAy9/3
 MZulBOPTrsCQA==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37a4e329a90so8814121fa.0
 for <dri-devel@lists.freedesktop.org>;
 Wed, 05 Nov 2025 03:35:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXmkaL0+nW90MYyPfWGkfvgQlV+sHKkQc39Jzv+7f7nyjEPYO9jXiTO4hllDFp2KnS61S6hangK0Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4yjo1spmapDSdCEsz9CGp43N9fUKCwNHoXbWvNTTLIv1M9pHw
 S+vyedSVp8uzYJ97i5LEGpGmFE2BFApHugE3dUZNh0IbGyTW6SzGfxtTNLKdFcAS8iKTdDsTPzF
 t9IERTGgHDXmIPO9pOZTUtgO4qETcMKw=
X-Google-Smtp-Source: AGHT+IHGQj4EZeUimtkbjgF1IeB2tetC4shdETjzwtgaULQ5O6waLgVlriowcbZfmBoH0NWumdnutXg5Frg7mKzgBN0=
X-Received: by 2002:a2e:a58d:0:b0:37a:584c:23ef with SMTP id
 38308e7fff4ca-37a584c24bbmr4808481fa.31.1762342510693; Wed, 05 Nov 2025
 03:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
 <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
 <13fd3b12-03a0-457f-a5da-fe018b032211@amd.com>
 <CAGwozwGLfcYdpetwTk=QH+k29u8SdroFxfkxb-KbAXh36sr1XQ@mail.gmail.com>
 <100c2f25-d1f4-5b82-4a76-a08394ece471@linux.intel.com>
 <fe9bb350-6dc5-4911-ad32-a95911251167@amd.com>
In-Reply-To: <fe9bb350-6dc5-4911-ad32-a95911251167@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 5 Nov 2025 12:34:59 +0100
X-Gmail-Original-Message-ID: <CAGwozwFRWiR4xQ422tp6H0R9knLjNkn4ewERyYtZgzOYfnJWxw@mail.gmail.com>
X-Gm-Features: AWmQ_bmwOsN6-7nnJfMI7_4qSh-nyTpW0WB_Wo9A0VaG9xskOZ9zDoHsNLjt4fc
Message-ID: <CAGwozwFRWiR4xQ422tp6H0R9knLjNkn4ewERyYtZgzOYfnJWxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <176234251185.480837.160016410023958496@linux3247.grserver.gr>
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

On Wed, 5 Nov 2025 at 12:28, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wr=
ote:
>
> Hi Ilpo,
>
> On 11/5/2025 16:43, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 27 Oct 2025, Antheas Kapenekakis wrote:
> >
> >> On Mon, 27 Oct 2025 at 09:36, Shyam Sundar S K <Shyam-sundar.S-k@amd.c=
om> wrote:
> >>>
> >>>
> >>>
> >>> On 10/27/2025 13:52, Shyam Sundar S K wrote:
> >>>>
> >>>>
> >>>> On 10/24/2025 22:02, Mario Limonciello wrote:
> >>>>>
> >>>>>
> >>>>> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
> >>>>>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
> >>>>>> <mario.limonciello@amd.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> >>>>>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to=
 the
> >>>>>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a cr=
ash),
> >>>>>>>> this support was dropped by the Xbox Ally which only S0ix suspen=
d.
> >>>>>>>>
> >>>>>>>> Since the handler is missing here, this causes the device to not
> >>>>>>>> suspend
> >>>>>>>> and the AMD GPU driver to crash while trying to resume afterward=
s
> >>>>>>>> due to
> >>>>>>>> a power hang.
> >>>>>>>>
> >>>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> >>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>>> ---
> >>>>>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
> >>>>>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
> >>>>>>>>    2 files changed, 4 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
> >>>>>>>> platform/x86/amd/pmc/pmc.c
> >>>>>>>> index bd318fd02ccf..cae3fcafd4d7 100644
> >>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
> >>>>>>>> amd_pmc_dev *dev)
> >>>>>>>>        switch (dev->cpu_id) {
> >>>>>>>>        case AMD_CPU_ID_PCO:
> >>>>>>>>        case AMD_CPU_ID_RN:
> >>>>>>>> +     case AMD_CPU_ID_VG:
> >>>>>>>>        case AMD_CPU_ID_YC:
> >>>>>>>>        case AMD_CPU_ID_CB:
> >>>>>>>>                dev->num_ips =3D 12;
> >>>>>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
> >>>>>>>> amd_pmc_dev *dev)
> >>>>>>>>        case AMD_CPU_ID_PCO:
> >>>>>>>>                return MSG_OS_HINT_PCO;
> >>>>>>>>        case AMD_CPU_ID_RN:
> >>>>>>>> +     case AMD_CPU_ID_VG:
> >>>>>>>>        case AMD_CPU_ID_YC:
> >>>>>>>>        case AMD_CPU_ID_CB:
> >>>>>>>>        case AMD_CPU_ID_PS:
> >>>>>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
> >>>>>>>> pmc_pci_ids[] =3D {
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> >>>>>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
> >>>>>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
> >>>>>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> >>>>>>>>        { }
> >>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
> >>>>>>>> platform/x86/amd/pmc/pmc.h
> >>>>>>>> index 62f3e51020fd..fe3f53eb5955 100644
> >>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
> >>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> >>>>>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *=
dev);
> >>>>>>>>    #define AMD_CPU_ID_RN                       0x1630
> >>>>>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
> >>>>>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
> >>>>>>>> +#define AMD_CPU_ID_VG                        0x1645
> >>>>>>>
> >>>>>>> Can you see if 0xF14 gives you a reasonable value for the idle ma=
sk if
> >>>>>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
> >>>>>>> though,
> >>>>>>> it shouldn't use the same define as 0x1a platforms.
> >>>>>>
> >>>>>> It does not work. Reports 0. I also tested the other ones, but the
> >>>>>> 0x1a was the same as you said. All report 0x0.
> >>>>>
> >>>>> It's possible the platform doesn't report an idle mask.
> >>>>>
> >>>>> 0xF14 is where I would have expected it to report.
> >>>>>
> >>>>> Shyam - can you look into this to see if it's in a different place
> >>>>> than 0xF14 for Van Gogh?
> >>>>
> >>>> Van Gogh is before Cezzane? I am bit surprised that pmc is getting
> >>>> loaded there.
> >>>>
> >>>> Antheas - what is the output of
> >>>>
> >>>> #lspci -s 00:00.0
> >>>
> >>> OK. I get it from the diff.
> >>>
> >>> +#define AMD_CPU_ID_VG                        0x1645
> >>>
> >>> S0 its 0x1645 that indicates SoC is 17h family and 90h model.
> >>>
> >>> What is the PMFW version running on your system?
> >>> amd_pmc_get_smu_version() tells you that information.
> >>
> >> cat /sys/devices/platform/AMDI0005:00/smu_fw_version
> >> 63.18.0
> >> cat /sys/devices/platform/AMDI0005:00/smu_program
> >> 7
> >>
> >>> Can you see if you put the scratch information same as Cezzane and if
> >>> that works? i.e.
> >>>
> >>> AMD_PMC_SCRATCH_REG_CZN(0x94) instead of AMD_PMC_SCRATCH_REG_1AH(0xF1=
4)
> >>
> >> I tried all idle masks and they return 0
> >
> > Hi Shyam & Antheas,
> >
> > This discussion seems to have died down without clear indication what's
> > the best course of action here. Should I still wait?
> >
> > There's no particular hurry from my side but it seems Mario gave his
> > Reviewed-by already and there hasn't been any follow-ups between you tw=
o,
> > I'm left a bit unsure how to interpret that.
> >
>
> The thought process to was understand how do we debug the rest 5%
> failures when we do no not have idlemask concept, which got introduced
> after sometime. But both the patches should work independently, so I
> am ok with both patch 1/3 and 2/3.
>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>
>
> >
> > In addition, is the patch 3/3 entire independent from these two PMC one=
s?
> > (If yes, I don't know why they were submitted as a series as that just
> > manages to add a little bit of uncertainty when combined into a series.=
)
>
> I see a note from Mario on the cover letter that the patch 3/3 can be
> dropped from this series and a newer approach is being planned.

To be more specific, patch 3 became two separate patches that went through =
drm.

For the rare failure, it would be an additional patch (if appropriate)
that does not affect 1 and 2.

Do you have any idea of where the failure for the other 5% of cases
comes from? I noticed that after I hibernated my device and it booted
up, it would never go into LPS0, the OS hint stopped working, would
that be a hint?

Antheas

> So, 1/3 and 2/3 of this series can be taken.
>
> Thanks,
> Shyam
> >
> > Thanks in advance,
> >
> > --
> >  i.
> >
> >> Antheas
> >>
> >>> Thanks,
> >>> Shyam
> >>>
> >>>
> >>>>
> >>>> 0xF14 index is meant for 1Ah (i.e. Strix and above)
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Any idea why the OS hint only works 90% of the time?
> >>>>
> >>>> What is the output of amd_pmc_dump_registers() when 10% of the time
> >>>> when the OS_HINT is not working?
> >>>>
> >>>> What I can surmise is, though pmc driver is sending the hint PMFW is
> >>>> not taking any action (since the support in FW is missing)
> >>>>
> >>>>>
> >>>>> If we get the idle mask reporting working we would have a better id=
ea
> >>>>> if that is what is reported wrong.
> >>>>>
> >>>>
> >>>> IIRC, The concept of idlemask came only after cezzane that too after=
 a
> >>>> certain PMFW version. So I am not sure if idlemask actually exists.
> >>>>
> >>>>
> >>>>> If I was to guess though; maybe GFX is still active.
> >>>>>
> >>>>> Depending upon what's going wrong smu_fw_info might have some more
> >>>>> information too.
> >>>>
> >>>> That's a good point to try it out.
> >>>>
> >>>> Thanks,
> >>>> Shyam
> >>>>
> >>>
> >>>
> >>
> >>
> >
>
>

