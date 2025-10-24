Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECFFC07315
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106F110EAD1;
	Fri, 24 Oct 2025 16:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="N2VWvPMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D156510EAD1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:09:03 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id 2F9A1BD9E5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:09:02 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 60F11BDAB2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:09:01 +0300 (EEST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id D2867200A35
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:09:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1761322141;
 bh=c6HxS6Zvm7NRv10KSWFGgdQGO5/rBFIB+mc4eI/omCg=;
 h=Received:From:Subject:To;
 b=N2VWvPMy5WWk5h+E/90v3LL/yF3BWhlMqBM6M8XbYvN9DhfiNy5iB9xBxklqGtWZY
 ePnYdIvIaeqPcDZvlBsnhfYq+uy/6/O2XpMTS5Sx81xNW3FPuLi4YVxKQ9OhRQUUac
 AQWpkysX0T4GqvE1/tkGMkze5PN3h9H13f5BTPttNciGI5C/zxBVd2vqpmk8eJA8U4
 LFPFRXmenxlOUhnZQcKWjCDK4s614bpOYWqUD0QD+1AtzBvMY6gztNkp9Uck8L4qx1
 bpzLDjOtqf0wbBCrqSy4n0EiSbox9g3+pP6N60b2K30PzV4CrMwSG5J/aP5bt++kBS
 3bkHUdFVOmOug==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3717780ea70so30695151fa.1
 for <dri-devel@lists.freedesktop.org>;
 Fri, 24 Oct 2025 09:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+H9E1vGTX92FOWYUxwZYJNwpA4GGuOEOZs5FZxS64LukmwYoSzVpEP+Ok7CCHKscJ8RvRtYybJ8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvPvkIkfE3g2P1YMlUwv6CzFAdPs2f0KPcA3L5Z+aqd3on6oxE
 5VJEjcucqKU0XfarTavZmnjJF9HJEpGbHCcbAzy5bAcKOwIgiuzGJhjPZO+J6dB7qDK0Tzg7Q9Y
 kMADnhN48M2X0tu+EsuA2/b5haUEw8vM=
X-Google-Smtp-Source: AGHT+IGrtGMUbTKY3EJtLEoExINvTxhF1uNJ6b9fMUw+NXU6QFCVEzK+bhBzwXzHYYPoTCBgDT/ICF7dvjwKtksorfc=
X-Received: by 2002:a05:651c:1a08:b0:336:df0e:f4ac with SMTP id
 38308e7fff4ca-377979febaemr77151861fa.25.1761322140301; Fri, 24 Oct 2025
 09:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
In-Reply-To: <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 18:08:49 +0200
X-Gmail-Original-Message-ID: <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
X-Gm-Features: AWmQ_bluSFRZs0j2QGdMRmJXJE4ND_MPKG9XbmD0AYwluvNUVV_Hqb-0t8edzEA
Message-ID: <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <176132214105.2528009.14157154785230470999@linux3247.grserver.gr>
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

On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> > The ROG Xbox Ally (non-X) SoC features a similar architecture to the
> > Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
> > this support was dropped by the Xbox Ally which only S0ix suspend.
> >
> > Since the handler is missing here, this causes the device to not suspend
> > and the AMD GPU driver to crash while trying to resume afterwards due to
> > a power hang.
> >
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
> >   drivers/platform/x86/amd/pmc/pmc.h | 1 +
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> > index bd318fd02ccf..cae3fcafd4d7 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc.c
> > +++ b/drivers/platform/x86/amd/pmc/pmc.c
> > @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> >       switch (dev->cpu_id) {
> >       case AMD_CPU_ID_PCO:
> >       case AMD_CPU_ID_RN:
> > +     case AMD_CPU_ID_VG:
> >       case AMD_CPU_ID_YC:
> >       case AMD_CPU_ID_CB:
> >               dev->num_ips = 12;
> > @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
> >       case AMD_CPU_ID_PCO:
> >               return MSG_OS_HINT_PCO;
> >       case AMD_CPU_ID_RN:
> > +     case AMD_CPU_ID_VG:
> >       case AMD_CPU_ID_YC:
> >       case AMD_CPU_ID_CB:
> >       case AMD_CPU_ID_PS:
> > @@ -717,6 +719,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> >       { }
> > diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> > index 62f3e51020fd..fe3f53eb5955 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc.h
> > +++ b/drivers/platform/x86/amd/pmc/pmc.h
> > @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
> >   #define AMD_CPU_ID_RN                       0x1630
> >   #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
> >   #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
> > +#define AMD_CPU_ID_VG                        0x1645
>
> Can you see if 0xF14 gives you a reasonable value for the idle mask if
> you add it to amd_pmc_idlemask_read()?  Make a new define for it though,
> it shouldn't use the same define as 0x1a platforms.

It does not work. Reports 0. I also tested the other ones, but the
0x1a was the same as you said. All report 0x0.

Any idea why the OS hint only works 90% of the time?

> >   #define AMD_CPU_ID_YC                       0x14B5
> >   #define AMD_CPU_ID_CB                       0x14D8
> >   #define AMD_CPU_ID_PS                       0x14E8
>
>

