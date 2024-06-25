Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F48916FBE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A8510E708;
	Tue, 25 Jun 2024 18:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OGBcRGwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6759810E1BE;
 Tue, 25 Jun 2024 18:03:56 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so5813056a12.1; 
 Tue, 25 Jun 2024 11:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719338634; x=1719943434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6601RBK+eocJf2ba8P+FLfSKXpn6mR5woMfwy6PoMIA=;
 b=OGBcRGweo1QOf3Y9CMAvjo1wD6zx7prtHwc8te0/jGUW5kWbq9MKw/rMI9+GSRCemB
 JmRY1ZamgllIPgi5+I6f+y7quJbjNn+h5XWnkpGOEqL9KWGpyfygdb6SXwF40WFb5Qk8
 kFkTwJ99UdHXsfjjpPLeaGT5Bs8zdraAtfcSZUUQ/lpZ7KJEI9kLJVb36IIjqf95iDBu
 vcUHjZ94WU7eekGQVs06/HwQ8XXib74BI+5MQGKHDq3fvALLSKRSoUdu3T+z9pDfPHvj
 /5pd7ZBWwgBJKHnJGiwuoVWvw2OHRj6AToQbLZhy3TuuV3KCHXjEJFrYhFez9EQOUMkb
 intg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719338634; x=1719943434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6601RBK+eocJf2ba8P+FLfSKXpn6mR5woMfwy6PoMIA=;
 b=fLdgntQF/plVowsgk9DNgEll3h9e41SNQBk6TRY24zuE7rk9aZ0xMef11fkI/3ZFdq
 nlft75tFpAESlXTKJyBf6XNbG83RXyS3MIbUQ/NS7nSe8xeI+hherN7H6SQIBg13VHaE
 1aK2r+4j+lpW+UtvKw5p5fSP6FCUwrtiRPj2op9mkubr9i6ftOJqPquNpxGRSBdiXrhw
 DTe5jBKtK0X95beAokmV5DhVPBg8B34TRcNTqStmu5BuxBJvDlF+mNGJFGnFXspORuk/
 TKM5Yc90LZOTg4Rgzwz+FblQX0St1n4wbplvJ+wJuIiYm3vEmBaFbMPWvtdPJq/MTx5f
 rkHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPTlGzkfyr5lp8L+YTHUM1rZf+zPELpDye2hTlxHngwwSphIF6uj+kjJP1csQc4TLwN1FqoVIlUZFgBCQcgRxbwCKpDcotiPFMFTIPr4O6JflRB8+7LGL/IhFUGP+vWJ1aJvcFRRE1+6aV/y2AHEYA
X-Gm-Message-State: AOJu0YzcJ0ejnMMrjKHNngh/z28wcb7IMD0LJxVDSZO1RetabkfrHO8i
 keIAnbOXbwmf8HX8QYvKgHgu8XMrmIJNsqw/cTEjEfrXSrP9Mpj0RBXpdE7Yzid9YAC0jRm9Mv+
 p+BcCxn7wfGtArMjm8OMVW67YVP4=
X-Google-Smtp-Source: AGHT+IHJedgwbLU61bzST1zWFY1JoWUlU7S5Qb8p5ldwdp6EHIf6sUA+bXFFcjhLptnoC+wGuGdU73R+N1AbZw60oSo=
X-Received: by 2002:a05:6402:1d52:b0:57d:5e33:371a with SMTP id
 4fb4d7f45d1cf-57d5e3337cfmr6987032a12.39.1719338634304; Tue, 25 Jun 2024
 11:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
 <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 11:03:42 -0700
Message-ID: <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Kiarash Hajian <kiarash8112hajian@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Jun 25, 2024 at 10:59=E2=80=AFAM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On Fri, Jun 21, 2024 at 02:09:58PM -0700, Rob Clark wrote:
> > On Sat, Jun 8, 2024 at 8:44=E2=80=AFAM Kiarash Hajian
> > <kiarash8112hajian@gmail.com> wrote:
> > >
> > > The driver's memory regions are currently just ioremap()ed, but not
> > > reserved through a request. That's not a bug, but having the request =
is
> > > a little more robust.
> > >
> > > Implement the region-request through the corresponding managed
> > > devres-function.
> > >
> > > Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> > > ---
> > > Changes in v6:
> > >     -Fix compile error
> > >     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-866=
4f52fc2a1@gmail.com
> > >
> > > Changes in v5:
> > >     - Fix error hanlding problems.
> > >     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memor=
y-region-v4-1-3881a64088e6@gmail.com
> > >
> > > Changes in v4:
> > >     - Combine v3 commits into a singel commit
> > >     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memor=
y-region-v3-0-0a728ad45010@gmail.com
> > >
> > > Changes in v3:
> > >     - Remove redundant devm_iounmap calls, relying on devres for auto=
matic resource cleanup.
> > >
> > > Changes in v2:
> > >     - update the subject prefix to "drm/msm/a6xx:", to match the majo=
rity of other changes to this file.
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++--------------=
--------
> > >  1 file changed, 11 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gmu.c
> > > index 8bea8ef26f77..d26cc6254ef9 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *g=
mu)
> > >         bool pdc_in_aop =3D false;
> > >
> > >         if (IS_ERR(pdcptr))
> > > -               goto err;
> > > +               return;
> > >
> > >         if (adreno_is_a650(adreno_gpu) ||
> > >             adreno_is_a660_family(adreno_gpu) ||
> > > @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *g=
mu)
> > >         if (!pdc_in_aop) {
> > >                 seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> > >                 if (IS_ERR(seqptr))
> > > -                       goto err;
> > > +                       return;
> > >         }
> > >
> > >         /* Disable SDE clock gating */
> > > @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *=
gmu)
> > >         wmb();
> > >
> > >         a6xx_rpmh_stop(gmu);
> > > -
> > > -err:
> > > -       if (!IS_ERR_OR_NULL(pdcptr))
> > > -               iounmap(pdcptr);
> > > -       if (!IS_ERR_OR_NULL(seqptr))
> > > -               iounmap(seqptr);
> > >  }
> > >
> > >  /*
> > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct p=
latform_device *pdev,
> > >                 return ERR_PTR(-EINVAL);
> > >         }
> > >
> > > -       ret =3D ioremap(res->start, resource_size(res));
> > > +       ret =3D devm_ioremap_resource(&pdev->dev, res);
> >
> > So, this doesn't actually work, failing in __request_region_locked(),
> > because the gmu region partially overlaps with the gpucc region (which
> > is busy).  I think this is intentional, since gmu is controlling the
> > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > overlapping region.  Maybe Akhil knows more about GMU.
>
> We don't really need to map gpucc region from driver on behalf of gmu.
> Since we don't access any gpucc register from drm-msm driver, we can
> update the range size to correct this. But due to backward compatibility
> requirement with older dt, can we still enable region locking? I prefer
> it if that is possible.

Actually, when I reduced the region size to not overlap with gpucc,
the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.

So I guess that register is actually part of gpucc?

BR,
-R

> FYI, kgsl accesses gpucc registers to ensure gdsc has collapsed. So
> gpucc region has to be mapped by kgsl and that is reflected in the kgsl
> device tree.
>
> -Akhil
>
> >
> > BR,
> > -R
> >
> > >         if (!ret) {
> > >                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s regis=
ters\n", name);
> > >                 return ERR_PTR(-EINVAL);
> > > @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6=
xx_gpu, struct device_node *node)
> > >         gmu->mmio =3D a6xx_gmu_get_mmio(pdev, "gmu");
> > >         if (IS_ERR(gmu->mmio)) {
> > >                 ret =3D PTR_ERR(gmu->mmio);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
> > >         if (IS_ERR(gmu->cxpd)) {
> > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)=
) {
> > > @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx=
_gpu, struct device_node *node)
> > >         gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx");
> > >         if (IS_ERR(gmu->gxpd)) {
> > >                 ret =3D PTR_ERR(gmu->gxpd);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         gmu->initialized =3D true;
> > > @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx=
_gpu, struct device_node *node)
> > >  detach_cxpd:
> > >         dev_pm_domain_detach(gmu->cxpd, false);
> > >
> > > -err_mmio:
> > > -       iounmap(gmu->mmio);
> > > -
> > > +err_cleanup:
> > >         /* Drop reference taken in of_find_device_by_node */
> > >         put_device(gmu->dev);
> > >
> > > @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, st=
ruct device_node *node)
> > >                 gmu->rscc =3D a6xx_gmu_get_mmio(pdev, "rscc");
> > >                 if (IS_ERR(gmu->rscc)) {
> > >                         ret =3D -ENODEV;
> > > -                       goto err_mmio;
> > > +                       goto err_cleanup;
> > >                 }
> > >         } else {
> > >                 gmu->rscc =3D gmu->mmio + 0x23000;
> > > @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, =
struct device_node *node)
> > >
> > >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> > >                 ret =3D -ENODEV;
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx");
> > >         if (IS_ERR(gmu->cxpd)) {
> > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > -               goto err_mmio;
> > > +               goto err_cleanup;
> > >         }
> > >
> > >         link =3D device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNT=
IME);
> > > @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, s=
truct device_node *node)
> > >  detach_cxpd:
> > >         dev_pm_domain_detach(gmu->cxpd, false);
> > >
> > > -err_mmio:
> > > -       iounmap(gmu->mmio);
> > > -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"=
))
> > > -               iounmap(gmu->rscc);
> > > +err_cleanup:
> > >         free_irq(gmu->gmu_irq, gmu);
> > >         free_irq(gmu->hfi_irq, gmu);
> > >
> > >
> > > ---
> > > base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> > > change-id: 20240608-adreno-98c412bfdc03
> > >
> > > Best regards,
> > > --
> > > Kiarash Hajian <kiarash8112hajian@gmail.com>
> > >
