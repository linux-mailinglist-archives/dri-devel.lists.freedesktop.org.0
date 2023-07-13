Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29EA752CFC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 00:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBDC10E798;
	Thu, 13 Jul 2023 22:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A8B10E798;
 Thu, 13 Jul 2023 22:25:46 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-55b8f1c930eso869987eaf.3; 
 Thu, 13 Jul 2023 15:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689287145; x=1691879145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yrMgnrOq8YoZ1fyFC4X0GmYtJswdpvDYlmQRdE3Wk8=;
 b=ULr8ROoF3EzlQKdgTM1+tdy5qL4xxCoLrep4q98bPjBMQ4J8vKxsCV0blcN2dxfwvw
 7cTF7EjSB0V26cEDKHVBKh9PkqdVwJ7+358kEu/jCjSjRUtkcuBKkLyA+JYGHdNFg4YI
 OrZPX7sXMayO4LiZelj05x/Dcfnbcxy7MzmdSVqbn3gpz4kVF2p1AXyCA/rYq2mjkmJ1
 SDfjq3QW9MFFQZRLEGf2r193fUeyThuhP9/A+VnAxGeTkZvXjNoqNXdoOW+G26tPGgMe
 QNqroEmGmKc8yd8PMJChFdPfnMISLgdXDJpmZKms49/ZfMbWNE0WttAkrEcNYaTlJQMU
 SBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689287145; x=1691879145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yrMgnrOq8YoZ1fyFC4X0GmYtJswdpvDYlmQRdE3Wk8=;
 b=TUCnxW6E/WE/obmr/lC7qCRmB2gc6ia0fPmGk/spbs7toR2Py0zTTys6xBP5QkB0Qg
 wRdscP6WTixVbj3JfwUnRNgCjiV6yFqgAkvoZbRY1m5BIORyrVAnxr+6O5HFlTfcSBTb
 jzyIg6kHuQgoVcksOlKKSc+AhGJOCUi6ZjTEZQWBZXmjcqVA3LR8IH9n5ob1GvYznYKn
 0spHSo45sICz2izPQ6nFCG4cKmoAiDFg08A5tDA3q2MO6R8/3VmasXTJHg13IAd37RCp
 X73FdHTDTKyHNTJdcWv93Ax4O1NOMYFwUBkcV1syOxaY9zDTvauMrv/2YE/7Tw5ol0JR
 PHKQ==
X-Gm-Message-State: ABy/qLYZe/xKdO7fE/rxMuOKJnJSCsUqJ90LPpoYFW+PczrD4Ko/G6b/
 DvM6QW97BaMkzO/yfEQiIldmFYvmK3a+rEzUOjvzQ/Ol
X-Google-Smtp-Source: APBJJlF4GeNA7uSMYR+ZAhGDVDHH70LHyPYUnTmXGVAhOUnBYa3Enj9DVwAptUEyvE5jOXLOC5Re9jLDhrFxeeZopAs=
X-Received: by 2002:a05:6820:51:b0:566:b483:ee00 with SMTP id
 v17-20020a056820005100b00566b483ee00mr2862635oob.5.1689287145043; Thu, 13 Jul
 2023 15:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
 <m2r2klrcvgs2qiywx5eetcwwjph6suzjey4hhbon3bhqdsbg7t@lvwdvbhoaqaw>
In-Reply-To: <m2r2klrcvgs2qiywx5eetcwwjph6suzjey4hhbon3bhqdsbg7t@lvwdvbhoaqaw>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Jul 2023 15:25:33 -0700
Message-ID: <CAF6AEGt73GpN=7tdHnsytZM4=WqKXMU2WSHpdkTOxVqi+wH1zA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 1:06=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Thu, Jul 06, 2023 at 02:10:38PM -0700, Rob Clark wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > It is better to explicitly list it.  With the move to opaque chip-id's
> > for future devices, we should avoid trying to infer things like
> > generation from the numerical value.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >  2 files changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index f469f951a907..3c531da417b9 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >       }, {
> >               .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > @@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a615_zap.mdt",
> >               .hwcg =3D a615_hwcg,
> > @@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a630_zap.mdt",
> >               .hwcg =3D a630_hwcg,
> > @@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a640_zap.mdt",
> >               .hwcg =3D a640_hwcg,
> > @@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_128K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a650_zap.mdt",
> >               .hwcg =3D a650_hwcg,
> > @@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a660_zap.mdt",
> >               .hwcg =3D a660_hwcg,
> > @@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .hwcg =3D a660_hwcg,
> >               .address_space_size =3D SZ_16G,
> > @@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_2M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a640_zap.mdt",
> >               .hwcg =3D a640_hwcg,
> > @@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_4M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a690_zap.mdt",
> >               .hwcg =3D a690_hwcg,
> > @@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct d=
evice *master, void *data)
> >       if (ret)
> >               return ret;
> >
> > -     if (config.rev.core >=3D 6)
> > -             if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
> > -                     priv->has_cached_coherent =3D true;
> > +     priv->has_cached_coherent =3D
> > +             !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > +             !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> >
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index a7c4a2c536e3..e08d41337169 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -33,6 +33,7 @@ enum {
> >  #define ADRENO_QUIRK_FAULT_DETECT_MASK               BIT(1)
> >  #define ADRENO_QUIRK_LMLOADKILL_DISABLE              BIT(2)
> >  #define ADRENO_QUIRK_HAS_HW_APRIV            BIT(3)
> > +#define ADRENO_QUIRK_HAS_CACHED_COHERENT     BIT(4)
> a shorter ADRENO_IS_IOCOHERENT?

I prefer "HAS" to "IS".. maybe it is just me but "IS" sounds to me
like all dma is coherent, while in fact gpu mappings can be either
coherent or not.

I suppose it could be "HAS_IOCOHERENT" but we do use "CACHED_COHERENT"
elsewhere.

BR,
-R

>
> -Akhil
>
> >
> >  struct adreno_rev {
> >       uint8_t  core;
> > --
> > 2.41.0
> >
