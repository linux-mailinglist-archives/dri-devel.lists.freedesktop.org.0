Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72167BE93
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D307810E8C3;
	Wed, 25 Jan 2023 21:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF66A10E8C3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674682302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSxmHZVNeGrABJqMX95+POySFXojlhEkw/Pux7y6COc=;
 b=aewZMsd/8xaBM4WRqsWP8H4z31H628hlqvp7OWrgAFHdXER0TC67u16TTQBrb9BzrQ4/S3
 QgEfgwBasbXVl5r48Zzm8pT4URfvq6bamZdO5JGSsnDbI7M/w7A2OhE+w2+peSoA/Aw9BF
 P88sEzkJc2CPazmqTlDe0L65Sk0mYVU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-zfxpjL62PIK7vKH6-Q81GA-1; Wed, 25 Jan 2023 16:31:41 -0500
X-MC-Unique: zfxpjL62PIK7vKH6-Q81GA-1
Received: by mail-qk1-f199.google.com with SMTP id
 u10-20020a05620a0c4a00b00705e77d6207so28285qki.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qRS2ehMggqO+o2eZ0zGKoRgHGdALNRhCshcFwwykUYU=;
 b=hmtT0LdRVJWIuabxXq5TV/sOiYjX4DsqlOM2wMffk/SjFy3N8w+Ic0d6/Zv5LXJqw6
 hAk40nsg033FFSoAeunsr+qtQZOt1VpNmFHF03NN0/sYoggdH/U7JyTTTpdtBJfOWY27
 mMKCplcJB1jOBn0gweKDYSPWODGM7SrNSpWRkez+OIKaTD3Xk+KB1NTOUFwINWvgVYpE
 Uz53wL7hIms6NvYMyKqBXD/nxfl5OX8DfDtFwJpl386CFjD7J2sri1KE4zvrMct4p/J/
 lhWFEQGh4+imlgWNSFeboJ9Ao7fCIqku3LqiCaPqBNo4gqus3ggsPm5qVfqEcAccJHmd
 5kAQ==
X-Gm-Message-State: AFqh2kqyYDinDPt1u7MZtWip+xjkhAM6aYf97ZIFB1RQ/LWlVr38hvxT
 NyO7NX4vFEJWiWy9fN9S4g17TJ6EKwOy0HQHsVzv8/qpkeyErNIAk6L4bk5d9ZlLZQ02s3gjP8L
 IDgzc0o5/Lpd7En5BYSc7l7qZu7bh
X-Received: by 2002:ac8:688d:0:b0:3b6:2fba:3d46 with SMTP id
 m13-20020ac8688d000000b003b62fba3d46mr51528070qtq.42.1674682301033; 
 Wed, 25 Jan 2023 13:31:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCi56dy8VVfBpgc75HmZZNf+4zqovM2MEt4ZNej0KIGvI9+NrOEyIFXQRXqAzTofmmCkZO/g==
X-Received: by 2002:ac8:688d:0:b0:3b6:2fba:3d46 with SMTP id
 m13-20020ac8688d000000b003b62fba3d46mr51528040qtq.42.1674682300678; 
 Wed, 25 Jan 2023 13:31:40 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 i2-20020ac813c2000000b003b635a5d56csm3972925qtj.30.2023.01.25.13.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:31:40 -0800 (PST)
Message-ID: <c1bb4fa6cea38493e6ccff21f5f5fea39a0393e6.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/devinit: Convert function disable() to be void
From: Lyude Paul <lyude@redhat.com>
To: Deepak R Varma <drv@mailo.com>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Wed, 25 Jan 2023 16:31:39 -0500
In-Reply-To: <Y9FFoooIXjlr+UP1@ubun2204.myguest.virtualbox.org>
References: <Y9FFoooIXjlr+UP1@ubun2204.myguest.virtualbox.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Wed, 2023-01-25 at 20:37 +0530, Deepak R Varma wrote:
> The current design of callback function disable() of struct
> nvkm_devinit_func is defined to return a u64 value. In its implementation
> in the driver modules, the function always returns a fixed value 0. Hence
> the design and implementation of this function should be enhanced to retu=
rn
> void instead of a fixed value. This change also eliminates untouched
> return variables.
>=20
> The change is identified using the returnvar.cocci Coccinelle semantic
> patch script.
>=20
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Please note: The change is compile build tested only.
>=20
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c  | 3 ++-
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c   | 5 +----
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c   | 4 +---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 4 +---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 4 +---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c | 4 +---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c | 4 +---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c  | 5 +----
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h  | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h  | 2 +-
>  10 files changed, 11 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
> index dd4981708fe4..3d9319c319c6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
> @@ -51,7 +51,8 @@ u64
>  nvkm_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09if (init && init->func->disable)
> -=09=09return init->func->disable(init);
> +=09=09init->func->disable(init);
> +
>  =09return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/devinit/g84.c
> index c224702b7bed..00df7811dd10 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c
> @@ -26,13 +26,12 @@
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
> =20
> -static u64
> +static void
>  g84_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
>  =09u32 r001540 =3D nvkm_rd32(device, 0x001540);
>  =09u32 r00154c =3D nvkm_rd32(device, 0x00154c);
> -=09u64 disable =3D 0ULL;
> =20
>  =09if (!(r001540 & 0x40000000)) {
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_MPEG, 0);
> @@ -47,8 +46,6 @@ g84_devinit_disable(struct nvkm_devinit *init)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_BSP, 0);
>  =09if (!(r00154c & 0x00000040))
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_CIPHER, 0);
> -
> -=09return disable;
>  }
> =20
>  static const struct nvkm_devinit_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> index 8977483a9f42..54bee499b982 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> @@ -26,7 +26,7 @@
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
> =20
> -static u64
> +static void
>  g98_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
> @@ -45,8 +45,6 @@ g98_devinit_disable(struct nvkm_devinit *init)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_MSVLD, 0);
>  =09if (!(r00154c & 0x00000040))
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_SEC, 0);
> -
> -=09return 0ULL;
>  }
> =20
>  static const struct nvkm_devinit_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> index 5b7cb1fe7897..5368e705e7fd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> @@ -63,7 +63,7 @@ gf100_devinit_pll_set(struct nvkm_devinit *init, u32 ty=
pe, u32 freq)
>  =09return ret;
>  }
> =20
> -static u64
> +static void
>  gf100_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
> @@ -85,8 +85,6 @@ gf100_devinit_disable(struct nvkm_devinit *init)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
>  =09if (r022500 & 0x00000200)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 1);
> -
> -=09return 0ULL;
>  }
> =20
>  void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> index 8955af2704c7..7bcbc4895ec2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> @@ -26,7 +26,7 @@
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
> =20
> -u64
> +void
>  gm107_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
> @@ -39,8 +39,6 @@ gm107_devinit_disable(struct nvkm_devinit *init)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 2);
>  =09if (r021c04 & 0x00000001)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
> -
> -=09return 0ULL;
>  }
> =20
>  static const struct nvkm_devinit_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> index 3d0ab86c3115..dbca92318baf 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> @@ -62,7 +62,7 @@ gt215_devinit_pll_set(struct nvkm_devinit *init, u32 ty=
pe, u32 freq)
>  =09return ret;
>  }
> =20
> -static u64
> +static void
>  gt215_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
> @@ -80,8 +80,6 @@ gt215_devinit_disable(struct nvkm_devinit *init)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_MSVLD, 0);
>  =09if (!(r00154c & 0x00000200))
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
> -
> -=09return 0ULL;
>  }
> =20
>  static u32
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
> index a9cdf2411187..a24bd2e7d7ce 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
> @@ -26,7 +26,7 @@
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
> =20
> -static u64
> +static void
>  mcp89_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
> @@ -46,8 +46,6 @@ mcp89_devinit_disable(struct nvkm_devinit *init)
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_VIC, 0);
>  =09if (!(r00154c & 0x00000200))
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
> -
> -=09return 0;
>  }
> =20
>  static const struct nvkm_devinit_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c
> index 380995d398b1..07ed8fd778b2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c
> @@ -77,17 +77,14 @@ nv50_devinit_pll_set(struct nvkm_devinit *init, u32 t=
ype, u32 freq)
>  =09return 0;
>  }
> =20
> -static u64
> +static void
>  nv50_devinit_disable(struct nvkm_devinit *init)
>  {
>  =09struct nvkm_device *device =3D init->subdev.device;
>  =09u32 r001540 =3D nvkm_rd32(device, 0x001540);
> -=09u64 disable =3D 0ULL;
> =20
>  =09if (!(r001540 & 0x40000000))
>  =09=09nvkm_subdev_disable(device, NVKM_ENGINE_MPEG, 0);
> -
> -=09return disable;
>  }
> =20
>  void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h b/drivers=
/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
> index 987a7f478b84..8de409c084c1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
> @@ -23,7 +23,7 @@ int  gf100_devinit_ctor(struct nvkm_object *, struct nv=
km_object *,
>  int  gf100_devinit_pll_set(struct nvkm_devinit *, u32, u32);
>  void gf100_devinit_preinit(struct nvkm_devinit *);
> =20
> -u64  gm107_devinit_disable(struct nvkm_devinit *);
> +void  gm107_devinit_disable(struct nvkm_devinit *);
> =20
>  int gm200_devinit_post(struct nvkm_devinit *, bool);
>  void gm200_devinit_preos(struct nv50_devinit *, bool);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h b/drivers=
/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
> index dd8b038a8cee..a648482d06e9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
> @@ -12,7 +12,7 @@ struct nvkm_devinit_func {
>  =09u32  (*mmio)(struct nvkm_devinit *, u32);
>  =09void (*meminit)(struct nvkm_devinit *);
>  =09int  (*pll_set)(struct nvkm_devinit *, u32 type, u32 freq);
> -=09u64  (*disable)(struct nvkm_devinit *);
> +=09void (*disable)(struct nvkm_devinit *);
>  };
> =20
>  void nvkm_devinit_ctor(const struct nvkm_devinit_func *, struct nvkm_dev=
ice *,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

