Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35780CD2478
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 01:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507EF10F11C;
	Sat, 20 Dec 2025 00:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GuUzmWct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52A110F11C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 00:45:28 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-6446c924f9eso2195303d50.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766191528; x=1766796328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLPI+6y1Cd274pWyRLM4LL7VX9uNyq+alqBEtAEYrvI=;
 b=GuUzmWctwLCAEBIhRtZYk5P8etGdcTYINrn3d6SSHWrsGHn/K/Q5BXq3rFeHwO43Sf
 BcdYO0uMW0Jy0MzTceZV01+3XFY/d++kEPdyLWX5k1jDfyrhA4+nc78s1VHnY+cvD1B7
 MIZqDtBG159VuqxI1hy6KetPCS51d6YQQrGxJ1d35HeJ/jTnSRQ/aNi0O+xroQsHkte+
 YB4i2+aJltvLtz4foAhksc0BsJUKLmQzD9ZyAKME0pfbgGbV6uyB+vuEJFFmXTvl/cQq
 XAKHuVR0IJCsg/tHKEpfZEWFgY+e8M3Ns74S7mvCKnroD1ivx7jdwlFVWd4FPCmo45cs
 quKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766191528; x=1766796328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DLPI+6y1Cd274pWyRLM4LL7VX9uNyq+alqBEtAEYrvI=;
 b=UdSBc378iNx5wdiRwoi851rM3Sb07XfWhhbcVisdMgOxttBJ9pXWRScKlpCBrk9TxK
 h8eMGwhGfjrJaX6X0OLzGo9oG46FMntobEd8fgGlyCcKAbU5QvNElA+rz8VaU35ndB6d
 FHFFK3A+yMsogzZdIaRhLoG3OFQu5P3o2ywgviQToZ61XW8wY4HBYL1dTvY25QavLg2I
 VqKOjt5Gr9l+yfDHEQRKXtO2yD8tbskGAGqZWSEGUh1W/Vf8M842gOFMudWHxK+KFpt0
 7BA/qqLpTMYgo9Tn6x4MYVrLDC0wvoSKLWz4v+RTQch8Hg38yCwQgnKvUUL0F0HXOhiV
 hQFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcwCBONAw5tiQhXo8cka6ElVZ2qwOr7O/BEzYZqWVIBFhGOkbLZUvRPYwlH0wssE57Pid2r6L+Rno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjYRfB2EXieoqShbn129548ZRBf2s2pG5Z2mx5ir1A3rzeY3gu
 fqpxyky3MbZ+OySnmog77yf5+eJR/xeclzd5qV3hiHByzWsF3p9xSV2JxVr1OWiOsqw9mG1764x
 kCE6oErJ0Of+/n81FXp+4P78LyIDi+MQ=
X-Gm-Gg: AY/fxX44crMG2pS253WeLx4NZPma5o6u1Wf8mu/+AEpwT6WktU3/h9bSudGTqvezw4i
 6VskwtuoxCKo2R1+NDVtkVcTeiNW9rUpZuNntVxA94C0V6z7nYOemtXigT+ywhEGk0lMoFdIC4G
 67lzxC0IZCaQ9sexFrY6m5jYHB4drDHCOhD6oFGXo6+w3Rv0dD9mP+h2nKexvhC5sGke0t6F2qz
 q5GfaFTii0iOUYU/6VNUa/kWow8CB1tRwVinZfD1GK0Fm2ypoo3BHrBKTp5kNUYSpkR9FrDZWFz
 tKVE0T797ZwTFW+sEbQjVN0vfZA2qco1EapA3s8=
X-Google-Smtp-Source: AGHT+IGxV5Pk9FDKr/Lj9KKxcmNH7Vilqojhd5iNKpIgV73bbfC+PbBJ47gDiQQYvtv+vvVB4r13+qOWvY++J5PPenk=
X-Received: by 2002:a53:6912:0:b0:645:5d62:dd8 with SMTP id
 956f58d0204a3-6466a8f31a3mr2853787d50.50.1766191527647; Fri, 19 Dec 2025
 16:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
 <bdf5b4f9-d6f5-419d-9465-4f722bac06ef@arm.com>
In-Reply-To: <bdf5b4f9-d6f5-419d-9465-4f722bac06ef@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 19 Dec 2025 16:45:16 -0800
X-Gm-Features: AQt7F2qLOWDeNcNuYDcamhHFDHG6i6Fg_mD7kZv-_AbDieajS4u9bPacZVvQHto
Message-ID: <CAPaKu7So4BeEyUGSS3ZAHi+Z=Sh6Kpy_W8eEtX4UQs=__MpPEA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/panthor: Implement reading shader_present from
 nvmem
To: Steven Price <steven.price@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
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

On Fri, Dec 19, 2025 at 7:31=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 17/12/2025 17:03, Nicolas Frattaroli wrote:
> > On some platforms, notably MediaTek MT8196, the shader_present bitmask
> > in the Mali GPU register for it has cores enabled that may be faulty.
> > The true shader_present bitmask is found in an efuse instead.
> >
> > Implement reading shader_present from an nvmem cell if one is present,
> > falling back to the Mali register if it's absent. The error codes are
> > trickled up through to the probe function so that probe deferral works.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> [Although I really hope other vendors don't do this - the hardware is
> broken!]
>
> Although one NIT below if you respin for other reasons...
>
> > ---
> >  drivers/gpu/drm/panthor/panthor_hw.c | 63 ++++++++++++++++++++++++++++=
++++----
> >  1 file changed, 57 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/pan=
thor/panthor_hw.c
> > index 87ebb7ae42c4..eb44c8b108aa 100644
> > --- a/drivers/gpu/drm/panthor/panthor_hw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0 or MIT
> >  /* Copyright 2025 ARM Limited. All rights reserved. */
> >
> > +#include <linux/nvmem-consumer.h>
> >  #include <drm/drm_print.h>
> >
> >  #include "panthor_device.h"
> > @@ -109,7 +110,52 @@ static char *get_gpu_model_name(struct panthor_dev=
ice *ptdev)
> >       return "(Unknown Mali GPU)";
> >  }
> >
> > -static void panthor_gpu_info_init(struct panthor_device *ptdev)
> > +static int overload_shader_present(struct panthor_device *ptdev)
> > +{
> > +     struct device *dev =3D ptdev->base.dev;
> > +     struct nvmem_cell *cell =3D nvmem_cell_get(dev, "shader-present")=
;
> > +     ssize_t len;
> > +     void *buf;
> > +     int ret;
> > +
> > +     if (IS_ERR(cell)) {
> > +             /* On platforms without this cell, use the Mali register =
*/
> > +             if (PTR_ERR(cell) =3D=3D -ENOENT)
> > +                     return 0;
> > +
> > +             return dev_err_probe(dev, PTR_ERR(cell),
> > +                                  "Failed to get shader-present nvmem =
cell\n");
> > +     }
> > +
> > +     buf =3D nvmem_cell_read(cell, &len);
> > +     if (IS_ERR(buf)) {
> > +             ret =3D dev_err_probe(dev, PTR_ERR(buf),
> > +                                 "Failed to read shader-present nvmem =
cell\n");
> > +             goto err_put_cell;
> > +     }
> > +
> > +     if (!len || len > 8) {
> > +             ret =3D dev_err_probe(dev, -EINVAL, "shader-present cell =
can't be length %ld\n",
> > +                                 len);
> > +             goto err_free;
> > +     }
> > +
> > +     memcpy(&ptdev->gpu_info.shader_present, buf, len);
When len is 4, this is neither overriding nor masking. I might suggest
switching to nvmem_cell_read_variable_le_u64 for simplicity.

Either way, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>


> > +
> > +     kfree(buf);
> > +     nvmem_cell_put(cell);
> > +
> > +     return 0;
> > +
> > +err_free:
> > +     kfree(buf);
> > +err_put_cell:
> > +     nvmem_cell_put(cell);
> > +
> > +     return ret;
> > +}
>
> Rather than repeating the clean up, you can do something like:
>
> {
>         void *buf =3D NULL;
>         int ret =3D 0
>
>         if (IS_ERR(cell)) {
>                 ret =3D dev_err_probe(...);
>                 goto out;
>         }
>
>         buf =3D nvmem_cell_read();
>         if (IS_ERR(buf)) {
>                 ret =3D dev_err_probe(...);
>                 goto out;
>         }
>
>         if (!len || len > 8) {
>                 ret =3D dev_err_probe(...);
>                 goto out;
>         }
>
>         memcpy();
>
> out:
>         if (!IS_ERR(buf))
>                 kfree(buf);
>         if (!IS_ERR(cell))
>                 nvmem_cell_put(cell);
>
>         return ret;
> }
>
> That avoids mistakes when adding a new operation into the sequence. Or
> you can use the fancy new cleanup helpers, but that feels overkill here.
> But equally I'm ok if you leave the code as is - it's simple enough and
> the conversation can be done later if we need it.
>
> Thanks,
> Steve
>
> > +
> > +static int panthor_gpu_info_init(struct panthor_device *ptdev)
> >  {
> >       unsigned int i;
> >
> > @@ -143,13 +189,18 @@ static void panthor_gpu_info_init(struct panthor_=
device *ptdev)
> >               ptdev->gpu_info.tiler_present =3D gpu_read64(ptdev, GPU_T=
ILER_PRESENT);
> >               ptdev->gpu_info.l2_present =3D gpu_read64(ptdev, GPU_L2_P=
RESENT);
> >       }
> > +
> > +     return overload_shader_present(ptdev);
> >  }
> >
> > -static void panthor_hw_info_init(struct panthor_device *ptdev)
> > +static int panthor_hw_info_init(struct panthor_device *ptdev)
> >  {
> >       u32 major, minor, status;
> > +     int ret;
> >
> > -     panthor_gpu_info_init(ptdev);
> > +     ret =3D panthor_gpu_info_init(ptdev);
> > +     if (ret)
> > +             return ret;
> >
> >       major =3D GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> >       minor =3D GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> > @@ -172,6 +223,8 @@ static void panthor_hw_info_init(struct panthor_dev=
ice *ptdev)
> >                "shader_present=3D0x%0llx l2_present=3D0x%0llx tiler_pre=
sent=3D0x%0llx",
> >                ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_prese=
nt,
> >                ptdev->gpu_info.tiler_present);
> > +
> > +     return 0;
> >  }
> >
> >  static int panthor_hw_bind_device(struct panthor_device *ptdev)
> > @@ -218,7 +271,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
> >       if (ret)
> >               return ret;
> >
> > -     panthor_hw_info_init(ptdev);
> > -
> > -     return 0;
> > +     return panthor_hw_info_init(ptdev);
> >  }
> >
>
