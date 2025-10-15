Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA956BE0A60
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB9210E8E8;
	Wed, 15 Oct 2025 20:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WkMvNiZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5894310E8E8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 20:36:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB322492DE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 20:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B623C19424
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760560578;
 bh=md7oGPOSa0xnbd4TtXfgOqRdp4X3wI06jm34scplTI0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WkMvNiZrqpVASBo6Y1Jdsdj4XC1FXGpozd/+qYto2IZNCal5cyuVHZK7rxHe7TBjx
 bL0eH7NaNvXWbV9xasC5BT4SYDAUxQavXIy+kAfX4UZxSKLN2/c5dz3z81a3YbFbb4
 1es+lzfqXEthrncO03/AbmGAy5YYkfU8vewOs7XULwsNE3laMBwu3FSerJf9Q36eXS
 bcB8NiTsS8ZdPL0KlYuUXXqx3UKCbBJrAo9hi6kCo98o/RG9J5L1ua8IrRVp09bOtL
 UePKr5Ep5kGEINjmEAovqNGlr1mEo7Hr93UqhbNB/NpBWCyr0sVxgj66o50AIe58Zh
 DJQ79hXoT9RwA==
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b50206773adso245399166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxjI7WDiPJ7f8frsRRDXhftoicqf7yUprsd/oGW7LAJHllFZj9rgfFeyLS/jZTRXDGVRwktEmmjEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtOHGPnMc9OPnphPvxqWZO7qhF6IYLmal5iYXeTi/ZbcQLMxR5
 GoIhJDFtwGgauRwRK9KZDTx5QfB/PQH+vEWXkL29Irs7uL9tuSosi95rMD/2mymy86N/BvPmC1P
 SO66TdR0yucwtP9p4tgD+DPjqPhKuSw==
X-Google-Smtp-Source: AGHT+IHanfPp1aQvqSwf2sXxxoYj2/nZjpy0k09q6j9Kw3Drf0RM9sdzWliM8DjGkucRkyyEJ6rYMj8ZjfP4jDx5X8c=
X-Received: by 2002:a17:907:3e16:b0:b0e:83e7:f6e1 with SMTP id
 a640c23a62f3a-b60530575abmr191496666b.15.1760560577064; Wed, 15 Oct 2025
 13:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
 <20251015-ethos-v4-2-81025a3dcbf3@kernel.org>
 <aO/4cQ8+eLnwqFSh@lizhi-Precision-Tower-5810>
In-Reply-To: <aO/4cQ8+eLnwqFSh@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Oct 2025 15:36:05 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+L2RHgP9FaEpxzzVRybyjeNr84xgEBbU4KEyZtrz63FA@mail.gmail.com>
X-Gm-Features: AS18NWAQqPDQMMnqBwUDObugcrZ2Q-fcA0YRercJNknG6zrODakK3RAlBsIaPZY
Message-ID: <CAL_Jsq+L2RHgP9FaEpxzzVRybyjeNr84xgEBbU4KEyZtrz63FA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] accel: Add Arm Ethos-U NPU driver
To: Frank Li <Frank.li@nxp.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Wed, Oct 15, 2025 at 2:39=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Oct 15, 2025 at 12:47:40PM -0500, Rob Herring (Arm) wrote:
> > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > relatively simple interface with single command stream to describe
> > buffers, operation settings, and network operations. It supports up to =
8
> > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > for SRAM (like the downstream driver stack and compiler). Userspace
> > doesn't need access to the SRAM.
> >
> > The h/w has no MMU nor external IOMMU and is a DMA engine which can
> > read and write anywhere in memory without h/w bounds checks. The user
> > submitted command streams must be validated against the bounds of the
> > GEM BOs. This is similar to the VC4 design which validates shaders.
> >
> > The job submit is based on the rocket driver for the Rockchip NPU
> > utilizing the GPU scheduler. It is simpler as there's only 1 core rathe=
r
> > than 3.
> >
> > Tested on i.MX93 platform (U65) and FVP (U85) with WIP Mesa Teflon
> > support.
> >
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> How to test this driver?

You need to add the DT node to i.MX93 .dts like the example, build the
mesa ethosu branch, and then run tflite with it pointed to the mesa
delegate.

I can send an i.MX93 dts patch after this is merged.

> > v4:
> > - Use bulk clk API
> > - Various whitespace fixes mostly due to ethos->ethosu rename
> > - Drop error check on dma_set_mask_and_coherent()
> > - Drop unnecessary pm_runtime_mark_last_busy() call
> > - Move variable declarations out of switch (a riscv/clang build failure=
)
> > - Use lowercase hex in all defines
> > - Drop unused ethosu_device.coherent member
> > - Add comments on all locks
> >
> ...
> > diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethos=
u/ethosu_device.h
> > new file mode 100644
> > index 000000000000..69d610c5c2d7
> > --- /dev/null
> > +++ b/drivers/accel/ethosu/ethosu_device.h
> > @@ -0,0 +1,190 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only or MIT */
> > +/* Copyright 2025 Arm, Ltd. */
> > +
> > +#ifndef __ETHOSU_DEVICE_H__
> > +#define __ETHOSU_DEVICE_H__
> > +
> > +#include <linux/types.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/gpu_scheduler.h>
> > +
> > +#include <drm/ethosu_accel.h>
> > +
> > +struct clk;
> > +struct gen_pool;
>
> Supposed should include clk.h instead declear a struct.

Headers should only use a forward declaration if that's all they need.
It keeps the struct opaque for starters.

> ...
> > +
> > +static int ethosu_open(struct drm_device *ddev, struct drm_file *file)
> > +{
> > +     int ret =3D 0;
> > +     struct ethosu_file_priv *priv;
> > +
> > +     if (!try_module_get(THIS_MODULE))
> > +             return -EINVAL;
> > +
> > +     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > +     if (!priv) {
> > +             ret =3D -ENOMEM;
> > +             goto err_put_mod;
> > +     }
> > +     priv->edev =3D to_ethosu_device(ddev);
> > +
> > +     ret =3D ethosu_job_open(priv);
> > +     if (ret)
> > +             goto err_free;
> > +
> > +     file->driver_priv =3D priv;
>
> slice simple.
>
> struct ethosu_file_priv __free(kfree) *priv =3D NULL;
> ...
> priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);

Linus has voiced his opinion that the above should not be done. It
should be all one line *only*. But now we allow C99 declarations, so
we can move it down. We can't get rid of the goto for module_put(), so
it only marginally helps here.

> ...
>
> file->driver_priv =3D no_free_ptr(priv);
>
>
> > +     return 0;
> > +
> > +err_free:
> > +     kfree(priv);
> > +err_put_mod:
> > +     module_put(THIS_MODULE);
> > +     return ret;
> > +}
> > +
> ...
> > +
> > +
> > +static int ethosu_init(struct ethosu_device *ethosudev)
> > +{
> > +     int ret;
> > +     u32 id, config;
> > +
> > +     ret =3D devm_pm_runtime_enable(ethosudev->base.dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(ethosudev->base.dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > +     pm_runtime_use_autosuspend(ethosudev->base.dev);
> > +
> > +     /* If PM is disabled, we need to call ethosu_device_resume() manu=
ally. */
> > +     if (!IS_ENABLED(CONFIG_PM)) {
> > +             ret =3D ethosu_device_resume(ethosudev->base.dev);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> I think it should call ethosu_device_resume() unconditional before
> devm_pm_runtime_enable();
>
> ethosu_device_resume();
> pm_runtime_set_active();
> pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> devm_pm_runtime_enable();

Why do you think this? Does this do a get?

I don't think it is good to call the resume hook on our own, but we
have no choice with !CONFIG_PM. With CONFIG_PM, we should only use the
pm_runtime API.

Rob
