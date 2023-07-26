Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB504763E72
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814AD10E0FD;
	Wed, 26 Jul 2023 18:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3318510E0A2;
 Wed, 26 Jul 2023 18:29:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51e619bcbf9so79496a12.3; 
 Wed, 26 Jul 2023 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690396138; x=1691000938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qu9zNqX4VmDKwn332jpa0Ay8l+J8PiNno6QtiCjLIoY=;
 b=Li+Yi8yUhbUSXHxNjD53IFp6Sug0nk7tnqPcdex5l+y9JaZuSMVRjeOxmxs8WDAssl
 1u9JdL+ZQbnBRGfJiQhR8NHrqs8LP9qHfE8TO8sidb/tSFAoUDjqd4han9vcttdYy6jW
 cRm2kn+i19oAEJK0nGykh/8AK4UPrxARSTHl1uAceAkRIvlxE/mYDjOHlfWCoazZMydy
 1zeMVLWu6p6TCU29fOWIZOlzccO96B8FC77HaJsprAqWZIXjZqpkJG/jP1qkP0KdYG6Q
 6G3jARi2tdLbUbZm3og+U9Hfe9IsOdAy574NrCjmY2XqEhCeQLE5ccZ/a0g31O4rsvJ6
 TBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690396138; x=1691000938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qu9zNqX4VmDKwn332jpa0Ay8l+J8PiNno6QtiCjLIoY=;
 b=VCdZ8v5WZUacskR4kceLQB6nI/JsSwnH39Wr7sROgcwxP2WYBVGFyeEgGR3YXdxtTk
 nxlFNpxG39lgjp4ceOJE7zXTktgTtCBvYUZEwd956osOD++9ZJX9LPIcx5NVC8BDNVZE
 ZmXZdaOJclye+lDfOTTzaG6ScezU8JJ6S0Tw3P9SPEbuLlDjcJ3rZz92Yz4ELAEb/LZn
 qLsufqzBl5GIZYKJDXQxGlZ9RewuYC1Y2N5LWPFLPH1TjdbboxzfAgDYHBFEokj9O7Su
 qzJKn9f1YQZG454FVt3s6BCxkotAJ408AyLGaarhoR2c8deuCCVzziLqwHrw8IPdcOPe
 U6QQ==
X-Gm-Message-State: ABy/qLbyQ2NfNDfTEf3ZWGEcH0UZ8aNoF0CflImDuY1rsPtCQ2YkZ1X3
 EcmU5gueo6OyiP4GSG6S0bcPa/CAqcIMN2LgPXg=
X-Google-Smtp-Source: APBJJlEh7CL+MXt1w4kJadHNuDTm0TzdNmaywlkcOJBgicIvuHLY//zktJVSQtGZQxLwqW0MHg1lFEHfvxnq3nasqWc=
X-Received: by 2002:aa7:cd13:0:b0:522:27c4:3865 with SMTP id
 b19-20020aa7cd13000000b0052227c43865mr1912666edw.41.1690396138273; Wed, 26
 Jul 2023 11:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
 <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
In-Reply-To: <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jul 2023 11:28:45 -0700
Message-ID: <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 1:26=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote:
> >
> > On 07/07/2023 00:10, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > There are cases where there are differences due to SoC integration.
> > > Such as cache-coherency support, and (in the next patch) e-fuse to
> > > speedbin mappings.
> >
> > I have the feeling that we are trying to circumvent the way DT works. I=
'd
> > suggest adding explicit SoC-compatible strings to Adreno bindings and t=
hen
> > using of_device_id::data and then of_device_get_match_data().
> >
> Just thinking, then how about a unique compatible string which we match
> to identify gpu->info and drop chip-id check completely here?

Ok, I think we could do this, so something like:

  compatible =3D "qcom,sm4350-adreno-619.0", qcom,adreno-619.0", "qcom,adre=
no"

?

It looks like we don't have gpu dt bits upstream yet for either sm4350
or sm6375, so I suppose we could get away with this change

BR,
-R

> -Akhil
>
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++=
---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> > >   2 files changed, 31 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu=
/drm/msm/adreno/adreno_device.c
> > > index 3c531da417b9..e62bc895a31f 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] =3D {
> > >             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > >             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > >             .init =3D a6xx_gpu_init,
> > > +   }, {
> > > +           .machine =3D "qcom,sm4350",
> > > +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > +           .revn =3D 619,
> > > +           .fw =3D {
> > > +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > +           },
> > > +           .gmem =3D SZ_512K,
> > > +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > +           .init =3D a6xx_gpu_init,
> > > +           .zapfw =3D "a615_zap.mdt",
> > > +           .hwcg =3D a615_hwcg,
> > > +   }, {
> > > +           .machine =3D "qcom,sm6375",
> > > +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > +           .revn =3D 619,
> > > +           .fw =3D {
> > > +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > +           },
> > > +           .gmem =3D SZ_512K,
> > > +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > +           .init =3D a6xx_gpu_init,
> > > +           .zapfw =3D "a615_zap.mdt",
> > > +           .hwcg =3D a615_hwcg,
> > >     }, {
> > >             .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > >             .revn =3D 619,
> > > @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adre=
no_rev rev)
> > >     /* identify gpu: */
> > >     for (i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > >             const struct adreno_info *info =3D &gpulist[i];
> > > +           if (info->machine && !of_machine_is_compatible(info->mach=
ine))
> > > +                   continue;
> > >             if (adreno_cmp_rev(info->rev, rev))
> > >                     return info;
> > >     }
> > > @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct=
 device *master, void *data)
> > >             config.rev.minor, config.rev.patchid);
> > >     priv->is_a2xx =3D config.rev.core =3D=3D 2;
> > > +   priv->has_cached_coherent =3D
> > > +           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
> > >     gpu =3D info->init(drm);
> > >     if (IS_ERR(gpu)) {
> > > @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struc=
t device *master, void *data)
> > >     if (ret)
> > >             return ret;
> > > -   priv->has_cached_coherent =3D
> > > -           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > > -           !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > > -
> > >     return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.h
> > > index e08d41337169..d5335b99c64c 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a61=
5_hwcg[], a630_hwcg[], a640_h
> > >   extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
> > >   struct adreno_info {
> > > +   const char *machine;
> > >     struct adreno_rev rev;
> > >     uint32_t revn;
> > >     const char *fw[ADRENO_FW_MAX];
> >
> > --
> > With best wishes
> > Dmitry
> >
