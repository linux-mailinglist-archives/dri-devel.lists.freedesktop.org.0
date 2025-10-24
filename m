Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E5C07083
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA88910E205;
	Fri, 24 Oct 2025 15:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="CV/Y5VNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Fri, 24 Oct 2025 15:43:42 UTC
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F2610EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:43:42 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id 812C9BCF37
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 18:38:20 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 9992BBDC90
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 18:38:19 +0300 (EEST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 2555E1FFC11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 18:38:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1761320299;
 bh=eE7WOkDVyRJiHeSEMjNbildsHJzwmYxdrSeSojss7+I=;
 h=Received:From:Subject:To;
 b=CV/Y5VNSHKOo6Za1GSNeYhblgs6PpOMPgTIfbQQvpRiw1aVv1OPA3n1yV124DKSos
 7BFKBGyI6KHqGljQ7h7QSi/TKBMVRVKIhfcWhnyVHa984XVFutskHmNBJkOWNcOUXp
 W6YnUB7cMpuvEdzcznEGXDEOsqgzB8oX346nN7hkv17uykZbbAtjs5nCiTfOMQb+pX
 SAkF2b4TK82mKxZyW0fbOaEbyUwmKZGNZCrghwuUL48J2qCT3EXhutZ6S9azMhGajC
 hvK3w/AWQGpbuKSY7rrZ9D+4g6egHEcVU1RXpfAq+ryz8QPh/z7YwF9Fw1i0NR8h71
 AZBsSTJy7jnmA==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.182) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f182.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-362e291924aso19166931fa.1
 for <dri-devel@lists.freedesktop.org>;
 Fri, 24 Oct 2025 08:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVarnJtRT8XM01zuOudswJwWMs00zNSZOU+TJ027N3rbmGqKop/MiZwEqGNqCACs3vNql4YxqFqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6CmIgw0hWzaKDGXmG1OJIvJMiSephdn0g9H4M75qi0unwSP93
 d0JLjzedANQ5ilt5QBbkIPGy/QKlIU/62xV9i/f8s4hs/rnN1FWKLHNi7k+OeCq5PqOhrt1azVO
 JXA9b2pNlvbbIppRXjtw3HBMY2+NMob0=
X-Google-Smtp-Source: AGHT+IHxSuFU8jGxWLfAcRJMzub8OItIQWU18+63KmTH6NWzOau5ckGJVk7oQpzgy0uOuN89F0gjkZf/h8PYxxtz6I4=
X-Received: by 2002:a2e:bd05:0:b0:378:e12f:e5ed with SMTP id
 38308e7fff4ca-378e12fe7d7mr12930301fa.39.1761320298675; Fri, 24 Oct 2025
 08:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <c71c3ee5-e101-440f-9533-508d37d05d04@amd.com>
In-Reply-To: <c71c3ee5-e101-440f-9533-508d37d05d04@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 17:38:07 +0200
X-Gmail-Original-Message-ID: <CAGwozwG_uU_sA0npzj6u3Aet2exxMOWdJEi5GX72CSFZJWvyeQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnGAPB1e1DIOoCXwc5AzboX6ZyXgVQP0rByT5pDDuJuAElRJgJRdq7RFTM
Message-ID: <CAGwozwG_uU_sA0npzj6u3Aet2exxMOWdJEi5GX72CSFZJWvyeQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] platform/x86/amd: Add S0ix support to the Xbox Ally
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <176132029936.2412197.7903575725371367331@linux3247.grserver.gr>
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

On Fri, 24 Oct 2025 at 17:32, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> > The Xbox Ally features a Van Gogh SoC that on the Steam Deck uses S3.
> > Therefore, kernel support for S0ix was previously absent. Introduce
> > this support in three patches:
> >
> > 1) Add Van Gogh to AMD PMC driver
> > 2) Enable spurious_8042 quirk, as it is common in those generations
> > 3) Adjust the Van Gogh init logic to avoid powering down the rlc
> >     and tweak post init
> >
>
> Just to be clear - there is no need for all 3 patches to go to one tree
> or another.  The PMC patches should go platform-x86 and the DRM patch
> should go through drm.

Perhaps someone wants to test out all three. I will resend only the
first two next time.

> > This allows the Xbox Ally to properly enter and exit S0ix suspend.
> > Perhaps it also allows the Steam Deck to use s2idle without crashing,
> > note it is not currently possible [1].
>
> FWIW I don't anticipate this series actually gets Steam deck into a
> hardware sleep state because you need firmware support as well.
> But the drm patch will probably will help the hang that was observed
> which lead to the patch you've linked below.

That's what I think too

Antheas

> >
> > Currently, around 1/10 times the SoC misses the PMC hint and does not
> > enter S0ix, so perhaps 1 or 3 need tweaking further. It wakes up always,
> > however.
> >
> > @Alex: I tweaked the text on patch 3 a bit. You can resend it separately
> > after the issue with 1/10 failures is fixed.
> >
> > [1]: https://github.com/evlaV/linux-integration/commit/5ab73e9069017aa1b5351f91513ba540ce5905fb
> >
> > Alex Deucher (1):
> >    drm/amdgpu: only send the SMU RLC notification on S3
> >
> > Antheas Kapenekakis (2):
> >    platform/x86/amd/pmc: Add support for Van Gogh SoC
> >    platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
> >   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
> >   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
> >   drivers/platform/x86/amd/pmc/pmc-quirks.c        | 8 ++++++++
> >   drivers/platform/x86/amd/pmc/pmc.c               | 3 +++
> >   drivers/platform/x86/amd/pmc/pmc.h               | 1 +
> >   6 files changed, 26 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
>
>

