Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225C6AB4B9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 03:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552E110E07F;
	Mon,  6 Mar 2023 02:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC010E07F;
 Mon,  6 Mar 2023 02:49:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13F36B80B92;
 Mon,  6 Mar 2023 02:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01FDC4339B;
 Mon,  6 Mar 2023 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678070962;
 bh=hqzVZLKdLlQfpgu3G+JQq3xBM/2QconnYnBBXL9CiYU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aQnjr8WIQGu/5hq1KYW5roztH3g4VTr5fXQtAxCSLprlmWhshbeVQ2uF2pZMC1RRZ
 1mNMyFIXG3fQbIsXLheF6mn1X58cEbDkFbJGA+OWj8T6XIuKO72ohtNy4f7nfzjfG9
 DK0ad6F2oEo5CQw2cqlbM6F+e0hhtSrQSdCxJizWtOQ0HsZCrQIMOw5EF/DVSdThYe
 FtxxiKC3SZYxS3JlbhPAHdo+7L1HeAZseiMzjDxiNXokQeLARvzZlvMcbodaZ8TB5P
 IE7l4iX6Btx7PkAIPPZFLM1jRhhRl7HldXk4tHnwhQ6dqF1JfDpsUYC0xYf4oNLTOc
 sR2K2WNZtjYDg==
Received: by mail-ed1-f51.google.com with SMTP id o12so32720080edb.9;
 Sun, 05 Mar 2023 18:49:22 -0800 (PST)
X-Gm-Message-State: AO0yUKXvxu4Eryt7RR1Q6WhnKxNgNUg+OiY7OuaGshqKWEjCv2deyvaF
 qDprtAQw+8OJYe3RLrTuKrfNDd76FkQv6xQSFzI=
X-Google-Smtp-Source: AK7set/jxg1xrRPDaepsTzCIeNFeNpb+n3b60YGmQ4bvdQeg9UIBkQ4Qm8D8UIzI9IhyefP6SHDhAY0O2HUGNG3SiQ0=
X-Received: by 2002:a50:cd81:0:b0:4af:6e08:30c with SMTP id
 p1-20020a50cd81000000b004af6e08030cmr4676731edi.4.1678070960916; Sun, 05 Mar
 2023 18:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20230305052137.4030323-1-chenhuacai@loongson.cn>
 <8554af4a-5592-2102-7c8c-21f4dec3aff2@amd.com>
In-Reply-To: <8554af4a-5592-2102-7c8c-21f4dec3aff2@amd.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Mar 2023 10:49:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H45Hpuyqhxr5EMOZRgapp6hWmG8jYDykXDVjbs1bLt-Jw@mail.gmail.com>
Message-ID: <CAAhV-H45Hpuyqhxr5EMOZRgapp6hWmG8jYDykXDVjbs1bLt-Jw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use uncached ioremap() for LoongArch
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 WANG Xuerui <kernel@xen0n.name>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

On Mon, Mar 6, 2023 at 12:40=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 05.03.23 um 06:21 schrieb Huacai Chen:
> > LoongArch maintains cache coherency in hardware, but its WUC attribute
> > (Weak-ordered UnCached, which is similar to WC) is out of the scope of
> > cache coherency machanism. This means WUC can only used for write-only
> > memory regions. So use uncached ioremap() for LoongArch in the amdgpu
> > driver.
>
> Well NAK. This is leaking platform dependencies into the driver code.
Then is it acceptable to let ioremap() depend on drm_arch_can_wc_memory()?

Huacai
>
> When you have a limitation that ioremap_wc() can't guarantee read/write
> ordering then that's pretty clearly a platform bug and you would need to
> apply this workaround to all drivers using ioremap_wc() which isn't
> really feasible.
>
> The x86 cache dependencies is because the GPU can also be part of the
> CPU in which case PCIe is not used to access the aperture base.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index c5ef7f7bdc15..c6888a58819a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1750,8 +1750,13 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
> >
> >       else
> >   #endif
> > +#ifdef CONFIG_LOONGARCH
> > +             adev->mman.aper_base_kaddr =3D ioremap(adev->gmc.aper_bas=
e,
> > +                             adev->gmc.visible_vram_size);
> > +#else
> >               adev->mman.aper_base_kaddr =3D ioremap_wc(adev->gmc.aper_=
base,
> >                               adev->gmc.visible_vram_size);
> > +#endif
> >   #endif
> >
> >       /*
>
