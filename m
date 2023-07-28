Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86737670D7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FF410E723;
	Fri, 28 Jul 2023 15:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D6010E723;
 Fri, 28 Jul 2023 15:43:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so3883297e87.3; 
 Fri, 28 Jul 2023 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690558997; x=1691163797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qUegsQd5geq70uC9trjOu0ai6s0gUokUruDL+wWW60=;
 b=IzSt+uVpLJLxvCeinHyisgxbG7dY9Sc0QMF3eimu9y0phKbWKT9sK+lLaQf9GVJJkh
 Um2v8FwF6AO0vbHNdsxGdeSyKArDFRPiS5476j/GBnuwCetn+EPk3uccSHgUyzorrj0/
 QSsBdrdIBtpzEdKM89Xv2i2+u1iRW2QGO76hLchm/5dmnhtwpbaaHZjhe5qthJZDZQk2
 MijUMOhkXvDXbeShDX9OtoGIk9HUsFL09vx363Xw5emoPB18LozFV2NWR0Fe6yHaJsZj
 uwaEULgufFqYfa+6pGCWxarAg393oHmX7pCifWh9wXhltwNwQdiv/NwKOmWwJAlNfRD8
 fY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690558997; x=1691163797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qUegsQd5geq70uC9trjOu0ai6s0gUokUruDL+wWW60=;
 b=cbeW9KyMPtO5axjTrONT0u74ejyUMwiV7nBxC4I1pcGlFHvSOB18o/L71t9DYkKjxr
 ecf2sFgIf7mHXufcUaZAaqqhzhrXZQjM7+NfWGEd3SrlujJV+RazRpGd/3cwF2m1Kep6
 U2m113K8vLoLH42yXU9k9i8p54qpUMcHx6uFmNSaVABJju3JV0NDBb0/ggFgD8B9zedl
 pQBaYwvNSV09vnVJUIfallqgwlvESpoKCxINqcsQffD9sw/BW01GGIZK2r0/wHPM6b8/
 iYFqir4J/rKB2bzaaLHD/Ftcwp/tpWPxwnd0UDM978JE07RcojQArdbZrmt2nfT13e2u
 GKxQ==
X-Gm-Message-State: ABy/qLaT4V/yo+HO3GPhYeYgTHMwc70nr59o2N5Q21WuyU7J1w35J3ls
 33lY2jptmhemw91qhvHVxW4jLRHFQQscOXi0yS4=
X-Google-Smtp-Source: APBJJlEj5oxZrJF1ebawGSqL1PKm40oC6dlbNJR2YWsyY+WH36f4S34nP+xeFeDa7vGG+CS2r0Ye4ZNKEJHihbUadpg=
X-Received: by 2002:a05:6512:3caa:b0:4f9:607a:6508 with SMTP id
 h42-20020a0565123caa00b004f9607a6508mr2580891lfv.50.1690558997327; Fri, 28
 Jul 2023 08:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-7-robdclark@gmail.com>
 <CAA8EJposUxVoqApJwx0g5D_6Zw0DOs=OVmYwoUNXWYue7w2PQg@mail.gmail.com>
In-Reply-To: <CAA8EJposUxVoqApJwx0g5D_6Zw0DOs=OVmYwoUNXWYue7w2PQg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jul 2023 08:43:05 -0700
Message-ID: <CAF6AEGth6STq8EtS=PX8vybV9_sDb0YTytJG10UxGGFjYc2rsw@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] drm/msm/adreno: Allow SoC specific gpu device
 table entries
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 3:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > There are cases where there are differences due to SoC integration.
> > Such as cache-coherency support, and (in the next patch) e-fuse to
> > speedbin mappings.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >  2 files changed, 31 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 3c531da417b9..e62bc895a31f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] =3D {
> >                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >                 .init =3D a6xx_gpu_init,
> > +       }, {
> > +               .machine =3D "qcom,sm4350",
> > +               .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > +               .revn =3D 619,
> > +               .fw =3D {
> > +                       [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > +                       [ADRENO_FW_GMU] =3D "a619_gmu.bin",
>
> If those are GMU-less platforms, do we need the ADRENO_FW_GMU firmware?

ahh, good point, fixed that locally

> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

thanks

BR,
-R

> > +               },
> > +               .gmem =3D SZ_512K,
> > +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +               .init =3D a6xx_gpu_init,
> > +               .zapfw =3D "a615_zap.mdt",
> > +               .hwcg =3D a615_hwcg,
> > +       }, {
> > +               .machine =3D "qcom,sm6375",
> > +               .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > +               .revn =3D 619,
> > +               .fw =3D {
> > +                       [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > +                       [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > +               },
> > +               .gmem =3D SZ_512K,
> > +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +               .init =3D a6xx_gpu_init,
> > +               .zapfw =3D "a615_zap.mdt",
> > +               .hwcg =3D a615_hwcg,
> >         }, {
> >                 .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> >                 .revn =3D 619,
> > @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno=
_rev rev)
> >         /* identify gpu: */
> >         for (i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> >                 const struct adreno_info *info =3D &gpulist[i];
> > +               if (info->machine && !of_machine_is_compatible(info->ma=
chine))
> > +                       continue;
> >                 if (adreno_cmp_rev(info->rev, rev))
> >                         return info;
> >         }
> > @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct d=
evice *master, void *data)
> >                 config.rev.minor, config.rev.patchid);
> >
> >         priv->is_a2xx =3D config.rev.core =3D=3D 2;
> > +       priv->has_cached_coherent =3D
> > +               !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
> >
> >         gpu =3D info->init(drm);
> >         if (IS_ERR(gpu)) {
> > @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct =
device *master, void *data)
> >         if (ret)
> >                 return ret;
> >
> > -       priv->has_cached_coherent =3D
> > -               !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > -               !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > -
> >         return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index e08d41337169..d5335b99c64c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_=
hwcg[], a630_hwcg[], a640_h
> >  extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
> >
> >  struct adreno_info {
> > +       const char *machine;
> >         struct adreno_rev rev;
> >         uint32_t revn;
> >         const char *fw[ADRENO_FW_MAX];
> > --
> > 2.41.0
> >
>
>
> --
> With best wishes
> Dmitry
