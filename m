Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18B81A101
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 15:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB54710E140;
	Wed, 20 Dec 2023 14:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82510E140;
 Wed, 20 Dec 2023 14:21:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336755f1688so1480111f8f.0; 
 Wed, 20 Dec 2023 06:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703082105; x=1703686905; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JxbXEbSocFDzoaHH/J7pkiKajtGxggwex6rm+kId5JA=;
 b=T0osXfyniCvlXv6aYHdxxMX4T5uk9JIqhFjJDFDgDw6GdAWw+Kzs48UfFJsfCHzH3q
 vaBeIyI8WoYBqEyr9/vUuT4r+5xoS7+rdHZrEmS5ioJYkSNqCPj5GtoQJDo9GEjhOL68
 K0m29UCjvU4WpxkkmntfT4qdIy+t5PMFaWyFHnvQUltvyAoanvICKcLfyS9cM3Mw+mnx
 fyyF6G3xmyY09jPXy0Hig5w0d06uj49lNr0VLyki5L6NxcfTiw5CeyUNF8ixYOOcGYTd
 5zYu+zdgcjwjzQI9SESfQ53g1bbMVLqUXjzXDAY5C68pIAjUVaI1DWC8ivn40/t76YDp
 CMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703082105; x=1703686905;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JxbXEbSocFDzoaHH/J7pkiKajtGxggwex6rm+kId5JA=;
 b=K27ewGN887GupvlxkqqLCc5GyFJzhJEbs9ojePCgAxDoFCXULpZCpRIAdron/BLolZ
 BwtgISFveC1geaBGS1/fg0D6XkU9iejspTBqtcbS+0KWM39ngsLyd4md/zVsRK7VnKGb
 S73sQpHMiYVcsbxnZufZNmixGF8HcXAhsJn4UP2b1lOcYLwYNIKJOpdPLvPI7jEMEKQJ
 +gLHT40j/Ipd81vJd3krp0xbXyyyMGJVqGaf6i0ugolZzrNSeDhVASn/SqMbXPvkisRb
 D70tfQoQzRnZNfdimH5zlvrXspWe7UtWeVAflGXTIB3UQN4VVr9sRQeEL2seX0GvU1lI
 S1wg==
X-Gm-Message-State: AOJu0YyiGy0R5Rq3zSk7banSNQD/jmhu4scpaK9Iia1+IBNDE9uifXh9
 ZAManKvD3wqI69U81Am3tmjrxuSzJN/Yfwe4
X-Google-Smtp-Source: AGHT+IE1Txlhb6IqpE2VMlGD9cEZkAwPfqJOHX9qCWv76vm9q4yNOmfxYyUCxyFVFxcY5KEhintABg==
X-Received: by 2002:adf:ee4a:0:b0:336:5f35:f4b0 with SMTP id
 w10-20020adfee4a000000b003365f35f4b0mr3596478wro.26.1703082104255; 
 Wed, 20 Dec 2023 06:21:44 -0800 (PST)
Received: from hermes.prahal.homelinux.net (91-175-163-178.subs.proxad.net.
 [91.175.163.178]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4009000000b0033677a4e0d6sm2701998wrp.13.2023.12.20.06.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:21:43 -0800 (PST)
Message-ID: <857e5eeada6720b0cbcb8a28bb7619eca69a8c72.camel@gmail.com>
Subject: Re: [PATCH] RFC: drm/lima: fix calling drm_mm_init with an empty range
From: Alban Browaeys <alban.browaeys@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Date: Wed, 20 Dec 2023 15:21:42 +0100
In-Reply-To: <CAKGbVbtkN+asaDWUs4WKqtjXg6iX40Dgk4cy50ysJ5TrnPGY5A@mail.gmail.com>
References: <20231214091215.2435-1-alban.browaeys@gmail.com>
 <CAKGbVbtkN+asaDWUs4WKqtjXg6iX40Dgk4cy50ysJ5TrnPGY5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2-1 
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lundi 18 d=C3=A9cembre 2023 =C3=A0 10:50 +0800, Qiang Yu a =C3=A9crit=C2=
=A0:
> Thanks for the fix. It could be done in a simpler way that swap the
> va_start/va_end init/fini and empty_vm create/release.

The thing is I do not get what you suggest by swaping :-/

Do you mean I should check for "dev->va_end - dev->va_start"  not to be
zero instead of passing a boolean and setting a flag on the structure?

PS: This was an RFC to raise the issue, that would be fine to me if you
take it further.


Alban

> On Thu, Dec 14, 2023 at 5:04=E2=80=AFPM Alban Browaeys
> <alban.browaeys@gmail.com> wrote:
> >=20
> > For the empty_vm initialization the range is empty which is not
> > supported
> > by drm_mm_init.
> >=20
> > With CONFIG_DRM_DEBUG_MM set, I get:
> > ------------[ cut here ]------------
> > =C2=A0kernel BUG at drivers/gpu/drm/drm_mm.c:965!
> > =C2=A0Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> > =C2=A0Modules linked in: lima(+) drm_shmem_helper gpu_sched s5p_jpeg
> > s5p_g2d
> > =C2=A0videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2
> > =C2=A0videobuf2_common s5p_cec tun fuse configfs auth_rpcgss sunrpc
> > ip_tables
> > =C2=A0x_tables autofs4 btrfs lzo_compress zlib_deflate raid10 raid456
> > =C2=A0async_raid6_recov async_memcpy async_pq async_xor async_tx xor
> > xor_neon
> > =C2=A0raid6_pq libcrc32c raid1 raid0 linear md_mod dm_mirror
> > dm_region_hash
> > =C2=A0dm_log hid_logitech_hidpp hid_logitech_dj
> > =C2=A0CPU: 0 PID: 1033 Comm: systemd-udevd Not tainted 6.4.0-rc1-debug+
> > #230
> > =C2=A0Hardware name: Samsung Exynos (Flattened Device Tree)
> > =C2=A0PC is at drm_mm_init+0x94/0x98
> > =C2=A0LR is at 0x0
> > =C2=A0Flags: nZCv=C2=A0 IRQs on=C2=A0 FIQs off=C2=A0 Mode SVC_32=C2=A0 =
ISA ARM=C2=A0 Segment none
> > =C2=A0 drm_mm_init from lima_vm_create+0xcc/0x108 [lima]
> > =C2=A0 lima_vm_create [lima] from lima_device_init+0xd8/0x4a0 [lima]
> > =C2=A0 lima_device_init [lima] from lima_pdev_probe.part.0+0x6c/0x158
> > [lima]
> > =C2=A0 lima_pdev_probe.part.0 [lima] from platform_probe+0x64/0xc0
> > =C2=A0 platform_probe from call_driver_probe+0x2c/0x110
> >=20
> > The drm_mm.c line 965 is:
> > drivers/gpu/drm/drm_mm.c
> > void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_MM_BUG_ON(start + size <=
=3D start);
> >=20
> > lima_vm_create is called with va_start and va_end both unset
> > in lima_device_init line 371:
> > ldev->empty_vm =3D lima_vm_create(ldev);
> >=20
> > Signed-off-by: Alban Browaeys <alban.browaeys@gmail.com>
> > ---
> > =C2=A0drivers/gpu/drm/lima/lima_device.c |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/lima/lima_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/lima/lima_vm.c=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++=
++---
> > =C2=A0drivers/gpu/drm/lima/lima_vm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 =
++-
> > =C2=A04 files changed, 11 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/lima/lima_device.c
> > b/drivers/gpu/drm/lima/lima_device.c
> > index 02cef0cea657..bd3afff0f44a 100644
> > --- a/drivers/gpu/drm/lima/lima_device.c
> > +++ b/drivers/gpu/drm/lima/lima_device.c
> > @@ -368,7 +368,7 @@ int lima_device_init(struct lima_device *ldev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto err_out0;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldev->empty_vm =3D lima_vm_create=
(ldev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldev->empty_vm =3D lima_vm_create=
(ldev, false);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ldev->empty_vm) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 err =3D -ENOMEM;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto err_out1;
> > diff --git a/drivers/gpu/drm/lima/lima_drv.c
> > b/drivers/gpu/drm/lima/lima_drv.c
> > index 10fd9154cc46..ca09142e0ac1 100644
> > --- a/drivers/gpu/drm/lima/lima_drv.c
> > +++ b/drivers/gpu/drm/lima/lima_drv.c
> > @@ -219,7 +219,7 @@ static int lima_drm_driver_open(struct
> > drm_device *dev, struct drm_file *file)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!priv)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->vm =3D lima_vm_create(ldev)=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->vm =3D lima_vm_create(ldev,=
 true);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!priv->vm) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 err =3D -ENOMEM;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto err_out0;
> > diff --git a/drivers/gpu/drm/lima/lima_vm.c
> > b/drivers/gpu/drm/lima/lima_vm.c
> > index 2b2739adc7f5..7f9775eefd78 100644
> > --- a/drivers/gpu/drm/lima/lima_vm.c
> > +++ b/drivers/gpu/drm/lima/lima_vm.c
> > @@ -197,7 +197,7 @@ u32 lima_vm_get_va(struct lima_vm *vm, struct
> > lima_bo *bo)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > =C2=A0}
> >=20
> > -struct lima_vm *lima_vm_create(struct lima_device *dev)
> > +struct lima_vm *lima_vm_create(struct lima_device *dev, bool
> > has_drm_mm)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct lima_vm *vm;
> >=20
> > @@ -221,7 +221,10 @@ struct lima_vm *lima_vm_create(struct
> > lima_device *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
err_out1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mm_init(&vm->mm, dev->va_star=
t, dev->va_end - dev-
> > >va_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (has_drm_mm) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vm->has_drm_mm =3D true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 drm_mm_init(&vm->mm, dev->va_start, dev->va_end -
> > dev->va_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return vm;
> >=20
> > @@ -237,7 +240,8 @@ void lima_vm_release(struct kref *kref)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct lima_vm *vm =3D conta=
iner_of(kref, struct lima_vm,
> > refcount);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mm_takedown(&vm->mm);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vm->has_drm_mm)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 drm_mm_takedown(&vm->mm);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < LIMA_VM_NU=
M_BT; i++) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (vm->bts[i].cpu)
> > diff --git a/drivers/gpu/drm/lima/lima_vm.h
> > b/drivers/gpu/drm/lima/lima_vm.h
> > index 3a7c74822d8b..e7443f410d6d 100644
> > --- a/drivers/gpu/drm/lima/lima_vm.h
> > +++ b/drivers/gpu/drm/lima/lima_vm.h
> > @@ -30,6 +30,7 @@ struct lima_vm {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex lock;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kref refcount;
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_drm_mm;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mm mm;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct lima_device *dev;
> > @@ -43,7 +44,7 @@ void lima_vm_bo_del(struct lima_vm *vm, struct
> > lima_bo *bo);
> >=20
> > =C2=A0u32 lima_vm_get_va(struct lima_vm *vm, struct lima_bo *bo);
> >=20
> > -struct lima_vm *lima_vm_create(struct lima_device *dev);
> > +struct lima_vm *lima_vm_create(struct lima_device *dev, bool
> > has_drm_mm);
> > =C2=A0void lima_vm_release(struct kref *kref);
> >=20
> > =C2=A0static inline struct lima_vm *lima_vm_get(struct lima_vm *vm)
> > --
> > 2.39.2
> >=20

