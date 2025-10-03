Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C6BB5AD4
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 02:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7810E85E;
	Fri,  3 Oct 2025 00:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RHFFjVDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FD510E85E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 00:31:39 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-635c9db8a16so1775114d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 17:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759451498; x=1760056298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4U5pnCPEOjyEvJTXMjyeqBkkPLwp0u6MFGFXx4Pna3U=;
 b=RHFFjVDXE/BS9nVJZguwCzewmxIMSpa/RcwsWsvkS3blEjVI7/5jG++XV3iz1Km5TP
 qCvyHVDCqD0LY1xt21x/OSc5PVKag1AMtYe+AJj0Deuq9yAcvY8EUYkWFacUsBstg5/V
 MCkGuF5Eh/fM2IY3A4uWPDufkiaEELv+LHDphecZKxHeRbTH0aze6FOW0ZtILthHLHcW
 vFTppkE/tP0/m+UpCpYyJC1BnnBM6pW5KEY8A1+YXl/or1Y2Iexlh0HntItCi6Qns+Ir
 W9tAkY2+QwE/DntqOe98mkCbVnTDlGftCt4UVyV/042hjUHEhRAOXNNL9jweXtofYNl0
 tiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759451498; x=1760056298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4U5pnCPEOjyEvJTXMjyeqBkkPLwp0u6MFGFXx4Pna3U=;
 b=Ja+bz231qVVYo9Q8V0zksbExFDOQIu1J7WbMq1lmft0BS1jCkp7GWIdSZ07+8n8vzw
 C2Y8XqE5BoTCVoxQS7vC21ZHHCPHMm0XG1PzLHC6BfF7son6VvQmQUA1fYEMsLyHMcNi
 3zENmLtpzqYz+7HXneslqkpczPLzHL8VOzy+EV9aNIIDrRT2iUZMAbkamqh4W17LBDSr
 72YnkohQWOreeowN14UdB8PdL9gFXlF03ozHdaYM1O4fzKujmK7yTjt8/vKA3nBME5/K
 FbwVaMOBHSGZZczsPZSlzjz5xHYJyEQKi4MdbJlDpT3+xmqvB+TVveRwxyDZIhbUlyip
 vX3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgZaZfiRPZPJxM8dgnT2HIxEwykPqRlc73gH5QGEiSxz6fI/fw3DO/5Po7QdfMpI/eJu6UGPhUIDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsLo6q+DbR3LTEQAI2p7L3M4nqa1U86eGo/HnvuYhTu57Irra3
 3+Rwx0alwqoKEyIkJEEJnBXFnf0+X+tRlM0SLDxud6PQslIpUB0pULEoYlM4h2UjgfFa1IZ6uIV
 tOhc4t7a01MOp7bV8zzrP9XK1FQ9m5NM=
X-Gm-Gg: ASbGncuHi3frjd422wBStEKjML47TVspgBwEuHj06RIJ4kjfVPV9ZNV7x4fwyecyEU4
 olTsCycuVc2Q46iSyJEFL0H20ZpheH+/U31E5P+SFS37Xvw5++YDxMgogPP8fVHbxhT7az7gJ1l
 5lz9BJ9vgkAzERsDNV/orIpP1BV1TVGQYf74xwHJ5FkDYfZZBlxL4+iI1ADmTIYh+DGrIBmkgZr
 4ZtsD2yItBR/0QWpMQh+mPnPJTB+M6D9AvdFBpCZ3i6GxsHDJnuQgBPjWuUr3bAbzIDohat3dwA
 KaFFQf8DVg8TeamK9AE+
X-Google-Smtp-Source: AGHT+IHSk85RSXIwuchkQqF0A/BvXRnC9Gw/LAQoBVBK/mn507GK9IZBmwwY+wHxNq7PYiIbBOsMUewMXpSTJIlxPWM=
X-Received: by 2002:a05:690e:159a:20b0:629:e2b6:1302 with SMTP id
 956f58d0204a3-63b9a07171emr1133628d50.17.1759451498517; Thu, 02 Oct 2025
 17:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-6-olvaffe@gmail.com>
 <ca22f80c-c233-4030-81d1-f425b8c1fb83@arm.com>
In-Reply-To: <ca22f80c-c233-4030-81d1-f425b8c1fb83@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 2 Oct 2025 17:31:27 -0700
X-Gm-Features: AS18NWAjq-5mQlMvXdR4W6e9qPj0GEnhhIeXGsj7lk4Tej78VBVZlV1t3dCSgZk
Message-ID: <CAPaKu7RKDwpSqJ6u8mjcc4G0Z-T7G1LxFw2rXQtxgSW=1_-jkw@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/panthor: rename and document
 mmu_hw_do_operation_locked
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 2, 2025 at 3:41=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 16/09/2025 22:08, Chia-I Wu wrote:
> > Rename mmu_hw_do_operation_locked to mmu_hw_flush_caches.
>
> This is confusing, you've renamed the _locked variant and left the
> wrapper mmu_hw_do_operation() with the old name.
The commit message says "rename and document", and I try to stay true
to it. I could certainly squash some of the commits to make this
series less confusing.

>
> I agree "do operation" isn't a great name, although "flush caches"
> sounds to me like it's a function which does the whole cache flush dance
> in one go, but it's still the same "one part of a cache flush operation"
> code.
It gets the name from being a wrapper for panthor_gpu_flush_caches.
Which part of "cache flush operation" is missing?

>
> Thanks,
> Steve
>
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> > index 727339d80d37e..7d1645a24129d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -622,8 +622,20 @@ static void mmu_hw_cmd_unlock(struct panthor_devic=
e *ptdev, u32 as_nr)
> >       write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
> >  }
> >
> > -static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, in=
t as_nr,
> > -                                   u64 iova, u64 size, u32 op)
> > +/**
> > + * mmu_hw_cmd_flush_caches() - Flush and invalidate L2/MMU/LSC caches
> > + * @ptdev: Device.
> > + * @as_nr: AS to issue command to.
> > + * @iova: Start of the region.
> > + * @size: Size of the region.
> > + * @op: AS_COMMAND_FLUSH_*
> > + *
> > + * Issue LOCK/GPU_FLUSH_CACHES/UNLOCK commands in order to flush and
> > + * invalidate L2/MMU/LSC caches for a region.
> > + *
> > + * Return: 0 on success, a negative error code otherwise.
> > + */
> > +static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr=
, u64 iova, u64 size, u32 op)
> >  {
> >       const u32 l2_flush_op =3D CACHE_CLEAN | CACHE_INV;
> >       u32 lsc_flush_op;
> > @@ -680,7 +692,7 @@ static int mmu_hw_do_operation(struct panthor_vm *v=
m,
> >       int ret;
> >
> >       mutex_lock(&ptdev->mmu->as.slots_lock);
> > -     ret =3D mmu_hw_do_operation_locked(ptdev, vm->as.id, iova, size, =
op);
> > +     ret =3D mmu_hw_flush_caches(ptdev, vm->as.id, iova, size, op);
> >       mutex_unlock(&ptdev->mmu->as.slots_lock);
> >
> >       return ret;
> > @@ -691,7 +703,7 @@ static int panthor_mmu_as_enable(struct panthor_dev=
ice *ptdev, u32 as_nr,
> >  {
> >       int ret;
> >
> > -     ret =3D mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COM=
MAND_FLUSH_MEM);
> > +     ret =3D mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FL=
USH_MEM);
> >       if (ret)
> >               return ret;
> >
> > @@ -702,7 +714,7 @@ static int panthor_mmu_as_disable(struct panthor_de=
vice *ptdev, u32 as_nr)
> >  {
> >       int ret;
> >
> > -     ret =3D mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COM=
MAND_FLUSH_MEM);
> > +     ret =3D mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FL=
USH_MEM);
> >       if (ret)
> >               return ret;
> >
>
