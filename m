Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0261817A7C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C4F10E2A1;
	Mon, 18 Dec 2023 19:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096D210E37F;
 Mon, 18 Dec 2023 19:00:54 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso41317725e9.1; 
 Mon, 18 Dec 2023 11:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702926052; x=1703530852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plG12lSDyDuxlkDPtZnEjC2S6Qb2QVgjcs0gVM2j3dA=;
 b=JeYQoVMFoNyM+PiiLnGIT29GI38zAIVSmY+xg9P58VM/HoBgCC04f7LkwfenTKY3em
 kz5rnpC6sY6vFszN/xvm4GsVPvKuSj2Eu4yfH0zFIFT85osUYHK5pQRaHT7nNdh2cV29
 moISG3KRVW2/NtUMC6Sggdu6qDlj2Wct/R2LPSUEc/Zj75+JFFKFuAUE2DhagqNRP1NV
 ge5dMpD7WNRQ4AP/Gom8c5mn+ENDQPQ22VzczB+jTNW3zogcRUmufqTFTtYT1HWilafl
 ed1t/Myp6ovH/PX+n/nA0T25+c4dTEEHlA4JXdXHz/QehZLFvo80dQGnWdGr+l59RtU7
 vFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702926052; x=1703530852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plG12lSDyDuxlkDPtZnEjC2S6Qb2QVgjcs0gVM2j3dA=;
 b=IiQJQBUt+Z0HFXmbTvgYCReUvjEFJuEmHMAmMA4qvbzjvKw/DefL0yZhqNi/uHprrQ
 UKl2e5CCQ4SAPbGdZ2+aZYuzjHUzBNYOFXeOccFlH03gf2osHpJFrqIEj1xmU6wn1xo3
 C5h0lDaesF25geNwNbEyPjvpDK+xuKzYJiIhGElTht+s9txUROgJJ6Mxfoqdt93Dsjof
 kd7Ny/8V1TzDmNjJjG5+h1hb3XNwCwEISILLhhDqOTub+epB+uEngUidDANfa6BWfwxT
 kMsZasrxtTBqz0Fr8vo7ldlaBwgIWX6xPXqA8K0dIY5okrPGzmjfkQRwrTvwxKbO4ydI
 OWww==
X-Gm-Message-State: AOJu0YyNPdJ0oiffyq2Kud6Aieil+K1gNknReG5d57n5FZJeVMwnzrIk
 T822VC5EEHAIaUezSb67xoEwnQHc9tNjJy3UQr7qJ87xjA5SCg==
X-Google-Smtp-Source: AGHT+IH3xTMpI6k/TuR+4b7fRy5zESV+Xlb4WnWxoLaqeTU9NjWTCyg/XMD9Un9QrZLQlht2/pzqYpmHGop0f1/gqoU=
X-Received: by 2002:a17:907:c9a2:b0:a23:3629:f7b9 with SMTP id
 uj34-20020a170907c9a200b00a233629f7b9mr493431ejc.90.1702867836730; Sun, 17
 Dec 2023 18:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20231214091215.2435-1-alban.browaeys@gmail.com>
In-Reply-To: <20231214091215.2435-1-alban.browaeys@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 18 Dec 2023 10:50:24 +0800
Message-ID: <CAKGbVbtkN+asaDWUs4WKqtjXg6iX40Dgk4cy50ysJ5TrnPGY5A@mail.gmail.com>
Subject: Re: [PATCH] RFC: drm/lima: fix calling drm_mm_init with an empty range
To: Alban Browaeys <alban.browaeys@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the fix. It could be done in a simpler way that swap the
va_start/va_end init/fini and empty_vm create/release.

On Thu, Dec 14, 2023 at 5:04=E2=80=AFPM Alban Browaeys <alban.browaeys@gmai=
l.com> wrote:
>
> For the empty_vm initialization the range is empty which is not supported
> by drm_mm_init.
>
> With CONFIG_DRM_DEBUG_MM set, I get:
> ------------[ cut here ]------------
>  kernel BUG at drivers/gpu/drm/drm_mm.c:965!
>  Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>  Modules linked in: lima(+) drm_shmem_helper gpu_sched s5p_jpeg s5p_g2d
>  videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2
>  videobuf2_common s5p_cec tun fuse configfs auth_rpcgss sunrpc ip_tables
>  x_tables autofs4 btrfs lzo_compress zlib_deflate raid10 raid456
>  async_raid6_recov async_memcpy async_pq async_xor async_tx xor xor_neon
>  raid6_pq libcrc32c raid1 raid0 linear md_mod dm_mirror dm_region_hash
>  dm_log hid_logitech_hidpp hid_logitech_dj
>  CPU: 0 PID: 1033 Comm: systemd-udevd Not tainted 6.4.0-rc1-debug+ #230
>  Hardware name: Samsung Exynos (Flattened Device Tree)
>  PC is at drm_mm_init+0x94/0x98
>  LR is at 0x0
>  Flags: nZCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
>   drm_mm_init from lima_vm_create+0xcc/0x108 [lima]
>   lima_vm_create [lima] from lima_device_init+0xd8/0x4a0 [lima]
>   lima_device_init [lima] from lima_pdev_probe.part.0+0x6c/0x158 [lima]
>   lima_pdev_probe.part.0 [lima] from platform_probe+0x64/0xc0
>   platform_probe from call_driver_probe+0x2c/0x110
>
> The drm_mm.c line 965 is:
> drivers/gpu/drm/drm_mm.c
> void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
> {
>         DRM_MM_BUG_ON(start + size <=3D start);
>
> lima_vm_create is called with va_start and va_end both unset
> in lima_device_init line 371:
> ldev->empty_vm =3D lima_vm_create(ldev);
>
> Signed-off-by: Alban Browaeys <alban.browaeys@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_device.c |  2 +-
>  drivers/gpu/drm/lima/lima_drv.c    |  2 +-
>  drivers/gpu/drm/lima/lima_vm.c     | 10 +++++++---
>  drivers/gpu/drm/lima/lima_vm.h     |  3 ++-
>  4 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/li=
ma_device.c
> index 02cef0cea657..bd3afff0f44a 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -368,7 +368,7 @@ int lima_device_init(struct lima_device *ldev)
>         if (err)
>                 goto err_out0;
>
> -       ldev->empty_vm =3D lima_vm_create(ldev);
> +       ldev->empty_vm =3D lima_vm_create(ldev, false);
>         if (!ldev->empty_vm) {
>                 err =3D -ENOMEM;
>                 goto err_out1;
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 10fd9154cc46..ca09142e0ac1 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -219,7 +219,7 @@ static int lima_drm_driver_open(struct drm_device *de=
v, struct drm_file *file)
>         if (!priv)
>                 return -ENOMEM;
>
> -       priv->vm =3D lima_vm_create(ldev);
> +       priv->vm =3D lima_vm_create(ldev, true);
>         if (!priv->vm) {
>                 err =3D -ENOMEM;
>                 goto err_out0;
> diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_v=
m.c
> index 2b2739adc7f5..7f9775eefd78 100644
> --- a/drivers/gpu/drm/lima/lima_vm.c
> +++ b/drivers/gpu/drm/lima/lima_vm.c
> @@ -197,7 +197,7 @@ u32 lima_vm_get_va(struct lima_vm *vm, struct lima_bo=
 *bo)
>         return ret;
>  }
>
> -struct lima_vm *lima_vm_create(struct lima_device *dev)
> +struct lima_vm *lima_vm_create(struct lima_device *dev, bool has_drm_mm)
>  {
>         struct lima_vm *vm;
>
> @@ -221,7 +221,10 @@ struct lima_vm *lima_vm_create(struct lima_device *d=
ev)
>                         goto err_out1;
>         }
>
> -       drm_mm_init(&vm->mm, dev->va_start, dev->va_end - dev->va_start);
> +       if (has_drm_mm) {
> +               vm->has_drm_mm =3D true;
> +               drm_mm_init(&vm->mm, dev->va_start, dev->va_end - dev->va=
_start);
> +       }
>
>         return vm;
>
> @@ -237,7 +240,8 @@ void lima_vm_release(struct kref *kref)
>         struct lima_vm *vm =3D container_of(kref, struct lima_vm, refcoun=
t);
>         int i;
>
> -       drm_mm_takedown(&vm->mm);
> +       if (vm->has_drm_mm)
> +               drm_mm_takedown(&vm->mm);
>
>         for (i =3D 0; i < LIMA_VM_NUM_BT; i++) {
>                 if (vm->bts[i].cpu)
> diff --git a/drivers/gpu/drm/lima/lima_vm.h b/drivers/gpu/drm/lima/lima_v=
m.h
> index 3a7c74822d8b..e7443f410d6d 100644
> --- a/drivers/gpu/drm/lima/lima_vm.h
> +++ b/drivers/gpu/drm/lima/lima_vm.h
> @@ -30,6 +30,7 @@ struct lima_vm {
>         struct mutex lock;
>         struct kref refcount;
>
> +       bool has_drm_mm;
>         struct drm_mm mm;
>
>         struct lima_device *dev;
> @@ -43,7 +44,7 @@ void lima_vm_bo_del(struct lima_vm *vm, struct lima_bo =
*bo);
>
>  u32 lima_vm_get_va(struct lima_vm *vm, struct lima_bo *bo);
>
> -struct lima_vm *lima_vm_create(struct lima_device *dev);
> +struct lima_vm *lima_vm_create(struct lima_device *dev, bool has_drm_mm)=
;
>  void lima_vm_release(struct kref *kref);
>
>  static inline struct lima_vm *lima_vm_get(struct lima_vm *vm)
> --
> 2.39.2
>
