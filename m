Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FAF807612
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 18:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50110E126;
	Wed,  6 Dec 2023 17:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5410E126;
 Wed,  6 Dec 2023 17:08:53 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54c70c70952so2336a12.3; 
 Wed, 06 Dec 2023 09:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701882532; x=1702487332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F90E6ezWa81IqrXxI2Eyak+OrAR7RPFLzPfvvTuxnUc=;
 b=Dw6Vc/1DElxjlG27nbn11rRBK7T7q0FNX2tWZOHyZX5kNzYLiLjai7eI8fZafuELUn
 RBu69GwEFERfRES8mzUFTPp18pxJYQ7NZudFazwKL+Xfncea55U8FUMa5KWA+EqPqlNw
 3B/OZOleHKW7vUwX/T+4WiodHWv8RlY8orLNNqBCt3eUIBH7mNmq67+SfLwK32jhxo+h
 UTgzFINJymrUYaq4XzpBqLtZrevDDjv2X+EqvOaWnqv7NJ9bT1z5ry5U1VwrLmzVifjO
 Wx/Nl/qJQjhilg2qvTYf1o/XA69icvrsMArdadc+TLYMAwypo9SkFvN+ofCkIDC0e9Iu
 v6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701882532; x=1702487332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F90E6ezWa81IqrXxI2Eyak+OrAR7RPFLzPfvvTuxnUc=;
 b=d0lDvpadMu1H92/PNgrH9JVrFI9+NSdjXguf38Fb/uPAObANtjnGrY/F3nXsxO1FEd
 pAYakiBoc2ZO8HwU0eCiykbMixcmpoA2b4ML8V4AkUr5eH1UheyH+DyJ1I2oqsbPsdkR
 3Ioh+Jhi7A4fx/DkBcbBGjsr3Gq2v+zv7fj/X2lgV3M/ATTZVHg+llHlb2HxNcPyhBZq
 Z/WJ2+tpIWL9RJ0zHsojydUpJjlwGnY3OY9deHdIiOc16eDNR2QEz6J84Mmbtomz55fU
 zKD4q3AQZ8I8wyRN4ADO6mbIDshThp+GqEML2NBoI5IK5gB6UXXUx7fQm/DFALnrAWzg
 Qulg==
X-Gm-Message-State: AOJu0Yz+ntygGi0srY/Xwh1t3jP1qgxZ8giC5kM1SY5LqzihlCs0qhh6
 Zat4d9xAmffKHm2RpOIAXVmYQEifV1W/sJDTh48=
X-Google-Smtp-Source: AGHT+IH5K6GW3OveseugsaEQHvJYlONM4/Tq3vZlRzYGmYN1L7t9n1he6jC11LdbXJ+sBG2zT/ELd7BYkfzZTVJgjHk=
X-Received: by 2002:a50:871d:0:b0:54c:22bd:2385 with SMTP id
 i29-20020a50871d000000b0054c22bd2385mr597119edb.4.1701882532026; Wed, 06 Dec
 2023 09:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-2-robdclark@gmail.com>
 <19ca53ae-b180-4ec6-9294-dd45825af653@linaro.org>
In-Reply-To: <19ca53ae-b180-4ec6-9294-dd45825af653@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Dec 2023 09:08:40 -0800
Message-ID: <CAF6AEGtL5B3QrrsTiU9x8h4L7z0mjdw-WeAqoSEb-Xu+Q14fXQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/adreno: Split up giant device table
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 6, 2023 at 4:29=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 12/5/23 23:03, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Split into a separate table per generation, in preparation to move each
> > gen's device table to it's own file.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++--=
-
> >   1 file changed, 51 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 41b13dec9bef..36392801f929 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -20,7 +20,7 @@ bool allow_vram_carveout =3D false;
> >   MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in =
place of IOMMU");
> >   module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 06=
00);
> >
> > -static const struct adreno_info gpulist[] =3D {
> > +static const struct adreno_info a2xx_gpus[] =3D {
> >       {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x02000000),
> >               .family =3D ADRENO_2XX_GEN1,
> > @@ -55,6 +55,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a2xx_gpu_init,
> >       }, {
> > +             /* sentinal */
> sentinel?
>
> > +     }
> > +};
> > +
> > +static const struct adreno_info a3xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(
> >                       0x03000512,
> >                       0x03000520
> > @@ -110,6 +116,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a4xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x04000500),
> >               .family =3D ADRENO_4XX,
> >               .revn  =3D 405,
> > @@ -143,6 +155,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a4xx_gpu_init,
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a5xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x05000600),
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 506,
> > @@ -268,6 +286,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a540_zap.mdt",
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a6xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x06010000),
> >               .family =3D ADRENO_6XX_GEN1,
> >               .revn =3D 610,
> > @@ -493,6 +517,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .hwcg =3D a690_hwcg,
> >               .address_space_size =3D SZ_16G,
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a7xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x07030001),
> >               .family =3D ADRENO_7XX_GEN1,
> >               .fw =3D {
> > @@ -522,7 +552,18 @@ static const struct adreno_info gpulist[] =3D {
> >               .zapfw =3D "a740_zap.mdt",
> >               .hwcg =3D a740_hwcg,
> >               .address_space_size =3D SZ_16G,
> > -     },
> > +     }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info *gpulist[] =3D {
> > +     a2xx_gpus,
> > +     a3xx_gpus,
> > +     a4xx_gpus,
> > +     a5xx_gpus,
> > +     a6xx_gpus,
> > +     a7xx_gpus,
> >   };
> >
> >   MODULE_FIRMWARE("qcom/a300_pm4.fw");
> > @@ -557,12 +598,14 @@ static const struct adreno_info *adreno_info(uint=
32_t chip_id)
> >   {
> >       /* identify gpu: */
> >       for (int i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > -             const struct adreno_info *info =3D &gpulist[i];
> > -             if (info->machine && !of_machine_is_compatible(info->mach=
ine))
> > -                     continue;
> > -             for (int j =3D 0; info->chip_ids[j]; j++)
> I'm not sure using sentinels here is a good idea, it adds a
> whole lot of stack size. Perhaps gpulist could be a struct
> of array pointers and an array of sizes?

I guess you meant text size..

But with 30 devices currently, that array would be (30 + 7) * 8 =3D 296
bytes.. each sentinel is ~112 bytes (and arguably we could move a bit
more out of adreno_info).  So it isn't that big of a difference.

Being able to have aNxx_info subclass adreno_effort might be a more
compelling reason to go for an array of pointers.  I'd have to see how
awkward that looks.

BR,
-R
