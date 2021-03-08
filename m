Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805533175D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 20:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DC46E874;
	Mon,  8 Mar 2021 19:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0741E892D5;
 Mon,  8 Mar 2021 19:33:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C70A5652AD;
 Mon,  8 Mar 2021 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615232031;
 bh=DM0rKDaLb7B/JShd7XPcETbrdwDndqNLTREc2OMkJWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KDRj/mXQmuAt4KfsI9B52LLS2Kp5PIsmOyUCzyzXEON6+rFu9lKtul/CmcHloxTtB
 A+7dZYUsagSvQUE1TBI4rMBXZ27zBbv0rDH/tU0MQzf/LZlVUivtqtVSTc2ixqKh8d
 IXhfMObEfuvpwDxUiTyY2pBj2uBePEDOBiQMurZ09BYMIndseWmYtyTeV9Dy1vwHoD
 Rxnl2zgKB5UU33zye7TQBpXg7HZY4txRhC1bs4tE5Cbcglt1UkVsazPFfUoBRvOUXV
 Q9Eqlr9g3ruRYcr9vPC6Z6Ly7d+wjTh80RaxG0z97BJOGGFmQC0C+SR1bLbNJHE7MT
 hI4quyeUkAKLg==
Received: by mail-ot1-f54.google.com with SMTP id r24so2261354otp.12;
 Mon, 08 Mar 2021 11:33:51 -0800 (PST)
X-Gm-Message-State: AOAM532/HIipAW8KFw3xwWYiAuhWqY/NBUq462O2JE2vx6vjzZBpPHq7
 dtB497Hw15g7sQumXpgkP32PhBzxugdUNAkbuWw=
X-Google-Smtp-Source: ABdhPJx2iehk1VgS7ag9nTJiTmLtuyCadIeJmEJ4CBdyRKvl5jJisQ7/TsKYnLdY99mC500mvmJStI3bl+HkwR1kRXc=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr3450789otq.251.1615232031118; 
 Mon, 08 Mar 2021 11:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20210308153359.2513446-1-arnd@kernel.org>
 <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
 <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
 <92a6c999-c20a-2311-4e31-209a2d9229ed@amd.com>
In-Reply-To: <92a6c999-c20a-2311-4e31-209a2d9229ed@amd.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Mar 2021 20:33:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1SRubvaPzn2020Nc_SsL8xBW7ODGOGtF_4UYASGqTq-w@mail.gmail.com>
Message-ID: <CAK8P3a1SRubvaPzn2020Nc_SsL8xBW7ODGOGtF_4UYASGqTq-w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Philip Yang <philip.yang@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 8, 2021 at 8:11 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> Am 2021-03-08 um 2:05 p.m. schrieb Arnd Bergmann:
> > On Mon, Mar 8, 2021 at 5:24 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
> >> The driver build should work without IOMMUv2. In amdkfd/Makefile, we
> >> have this condition:
> >>
> >> ifneq ($(CONFIG_AMD_IOMMU_V2),)
> >> AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
> >> endif
> >>
> >> In amdkfd/kfd_iommu.h we define inline stubs of the functions that are
> >> causing your link-failures if IOMMU_V2 is not enabled:
> >>
> >> #if defined(CONFIG_AMD_IOMMU_V2_MODULE) || defined(CONFIG_AMD_IOMMU_V2)
> >> ... function declarations ...
> >> #else
> >> ... stubs ...
> >> #endif
> > Right, that is the problem I tried to explain in my patch description.
> >
> > Should we just drop the 'imply' then and add a proper dependency like this?
> >
> >       depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
> >       depends on AMD_IOMMU_V2=y || DRM_AMDGPU=m
> >
> > I can send a v2 after some testing if you prefer this version.
>
> No. My point is, there should not be a hard dependency. The build should
> work without CONFIG_AMD_IOMMU_V2. I don't understand why it's not
> working for you. It looks like you're building kfd_iommu.o, which should
> not be happening when AMD_IOMMU_V2 is not enabled. The condition in
> amdkfd/Makefile should make sure that kfd_iommu.o doesn't get built with
> your kernel config.

Again, as I explained in the changelog text, AMD_IOMMU_V2 configured as
a loadable module, while AMDGPU is configured as built-in.

The causes a link failure for the vmlinux file, because the linker cannot
resolve addresses of loadable modules at compile time -- they have
not been loaded yet.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
