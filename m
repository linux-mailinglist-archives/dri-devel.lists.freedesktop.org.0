Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B4332173
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 09:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F66E20C;
	Tue,  9 Mar 2021 08:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCF36E8BA;
 Tue,  9 Mar 2021 08:58:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5827F650EC;
 Tue,  9 Mar 2021 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615280334;
 bh=bGrgYHxt1zWRljmNWdTWF89KwQPE/WC7bjxroFUZJHs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MDRPXWtVs3yMMI2osLWEdRXy9xiKGo9kAp4Cdr1VTzeHhbW/HPaPLJLaeX4AuzpZo
 zAc5ZHRcWCHSVB1NPZOowwzzf2l7TZ7yILtMOO44xoq3OSCSiQGv5XBjtqEu7XOtpa
 R11yFXYTUKGXauoGArGgeBKSPTEHU+mG0b1dyDTGqRRGjD12JLZW24sYpgULzT3x9X
 yfxFvPRwtbz6TAd/snAQtmYm5WNPDougT6CuJYx9K++8A9Q+7tw6b6EL4GZBzKG9oq
 i/7crnr+2//TOewdvwSDZxPApDyeCmEMil4R16x7Z7X0NUOVIO2BZMM7pp5neNQfBa
 mgoSQmGX1TDAw==
Received: by mail-oi1-f169.google.com with SMTP id u6so6813318oic.2;
 Tue, 09 Mar 2021 00:58:54 -0800 (PST)
X-Gm-Message-State: AOAM5331p6zvyPz4b6EHBnu3Sga1u7PitYkemND3nkk3Nh0qTpbBWsi9
 IUjTyhYPxcXnciMUk0hbDxumf4lyZVNrCoGN2d0=
X-Google-Smtp-Source: ABdhPJy7KwmLHvhrNLftroGyUGQ/t+PND67LUPNySsQX0tVy70CsU1/qFEJEzMXrNv8DMLGhBPueB6t1Sz6S4o59CIs=
X-Received: by 2002:aca:bf44:: with SMTP id p65mr1097765oif.11.1615280333519; 
 Tue, 09 Mar 2021 00:58:53 -0800 (PST)
MIME-Version: 1.0
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309032356.20800-1-Felix.Kuehling@amd.com>
In-Reply-To: <20210309032356.20800-1-Felix.Kuehling@amd.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 9 Mar 2021 09:58:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
Message-ID: <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: Felix Kuehling <Felix.Kuehling@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 9, 2021 at 4:23 AM Felix Kuehling <Felix.Kuehling@amd.com> wrote:
>
> Using 'imply AMD_IOMMU_V2' does not guarantee that the driver can link
> against the exported functions. If the GPU driver is built-in but the
> IOMMU driver is a loadable module, the kfd_iommu.c file is indeed
> built but does not work:
>
> x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_bind_process_to_device':
> kfd_iommu.c:(.text+0x516): undefined reference to `amd_iommu_bind_pasid'
> x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_unbind_process':
> kfd_iommu.c:(.text+0x691): undefined reference to `amd_iommu_unbind_pasid'
> x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_suspend':
> kfd_iommu.c:(.text+0x966): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
> x86_64-linux-ld: kfd_iommu.c:(.text+0x97f): undefined reference to `amd_iommu_set_invalid_ppr_cb'
> x86_64-linux-ld: kfd_iommu.c:(.text+0x9a4): undefined reference to `amd_iommu_free_device'
> x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_resume':
> kfd_iommu.c:(.text+0xa9a): undefined reference to `amd_iommu_init_device'
> x86_64-linux-ld: kfd_iommu.c:(.text+0xadc): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
> x86_64-linux-ld: kfd_iommu.c:(.text+0xaff): undefined reference to `amd_iommu_set_invalid_ppr_cb'
> x86_64-linux-ld: kfd_iommu.c:(.text+0xc72): undefined reference to `amd_iommu_bind_pasid'
> x86_64-linux-ld: kfd_iommu.c:(.text+0xe08): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
> x86_64-linux-ld: kfd_iommu.c:(.text+0xe26): undefined reference to `amd_iommu_set_invalid_ppr_cb'
> x86_64-linux-ld: kfd_iommu.c:(.text+0xe42): undefined reference to `amd_iommu_free_device'
>
> Use IS_REACHABLE to only build IOMMU-V2 support if the amd_iommu symbols
> are reachable by the amdkfd driver. Output a warning if they are not,
> because that may not be what the user was expecting.

This would fix the compile-time failure, but it still fails my CI
because you introduce
a compile-time warning. Can you change it into a runtime warning instead?

Neither type of warning is likely to actually reach the person trying
to debug the
problem, so you still end up with machines that don't do what they should,
but I can live with the runtime warning as long as the build doesn't break.

I think the proper fix would be to not rely on custom hooks into a particular
IOMMU driver, but to instead ensure that the amdgpu driver can do everything
it needs through the regular linux/iommu.h interfaces. I realize this
is more work,
but I wonder if you've tried that, and why it didn't work out.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
