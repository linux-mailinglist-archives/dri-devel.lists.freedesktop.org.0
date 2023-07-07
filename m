Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D674B4EA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 18:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFFB10E5BD;
	Fri,  7 Jul 2023 16:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C1510E5BD;
 Fri,  7 Jul 2023 16:08:40 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a1ebb79579so1660911b6e.3; 
 Fri, 07 Jul 2023 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688746119; x=1691338119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46PmY42cuc6IEH0uBVZPS1nuV/dcnfnTIqgf5ZnhKtw=;
 b=o95CWNnbw/3RTeJhQ2RkpxnUHzbdnB1Xv1L/rUNwcShHAaVlAj4qjP/daP+yP6rKKW
 7EwAkwxyZT8B7LS/YD7pmly+YH3pd8l8Oa2abVtxoof87ZLNtsSesjEnhLaWnI84aQoZ
 3WZAbAdrMP3uUUBl6Y7OINYtEc9jjN62549vSwY1zS7ZRAed4tnGAAhRonPrONYCCIZG
 +cvkS9pzOz62XiMbC1xMrso4Glb5JvRj1gLyUagCnLhfq0vOBeFQv0hT0mnNJyxnvPWw
 Nqrubl1CgFj5WMlHv1n+MP/Vt53Ia14KCt1EZKBDS6L5Ll/nukXsDfa+i/pSKWzL7c7r
 zCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688746119; x=1691338119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46PmY42cuc6IEH0uBVZPS1nuV/dcnfnTIqgf5ZnhKtw=;
 b=BQLIxgjKGWp2HLE8ncj0OgFWVAXcL7NovHtXst+GYq46dDahAkW8+jlwRtVGQ1dMht
 fLX9g81dUfkgy9CF5WtPUQcxHDQw65JwIwSfYWEzKwZBD/KveEDMRPaB0q4u9NZAudIE
 jigGq936c90Yhhpq1gb3usPruA4sMAeNy/KDprrXcRX1qTfS8P+GGTx+J9fg7tEDScxu
 BHONijYCRJXAKYWXrb+elcVmWAisAMiDB4eVhsmP6K7Dzrr/9nj47L5umJbuAzdSiQrV
 OfDcj2/BWSYPON32SSF+3Am5T4XuaT7pVx87fxTzxmORJiVBELcyk0pMZaCgyIDRrPuG
 et7Q==
X-Gm-Message-State: ABy/qLaGyqchNgoEk4z/37Zy/CNwcHVz2TZQBOfUPqpfKCsRVMgps7kT
 GmJdlN0I6XbiuuPcn+raxXeLHmj7ufAZdPB+TGg=
X-Google-Smtp-Source: APBJJlGDDnttmi/yPMMjoOVu1acz3ZNo1wqNmQdt8bfnRQ+I0RPS+4qlqy6TQgHaOx1gPB+Y16DhCKo9VvGGtn9ZEHA=
X-Received: by 2002:a54:4484:0:b0:3a1:d210:27e6 with SMTP id
 v4-20020a544484000000b003a1d21027e6mr4699394oiv.15.1688746118876; Fri, 07 Jul
 2023 09:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <4cdceddb-033a-6301-163e-89d27152e242@linaro.org>
In-Reply-To: <4cdceddb-033a-6301-163e-89d27152e242@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Jul 2023 09:08:27 -0700
Message-ID: <CAF6AEGvtMRnWBQz_KOi5b1p40HjvAAHYdd64kiR3KsKWPBO+bg@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying
 GPU
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 5:25=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> On 6.07.2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Since the revision becomes an opaque identifier with future GPUs, move
> > away from treating different ranges of bits as having a given meaning.
> > This means that we need to explicitly list different patch revisions in
> > the device table.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> [...]
>
> >
> > -     if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
> > +     /*
> > +      * Note that we wouldn't have been able to get this far if there =
is not
> > +      * a device table entry for this chip_id
> > +      */
> Why error-check it then?
>
> > +     info =3D adreno_find_info(config->chip_id);
> > +     if (WARN_ON(!info))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     if (info->revn =3D=3D 510)
> >               nr_rings =3D 1;
> [...]
>
> >
> > -     chipid =3D adreno_gpu->rev.core << 24;
> > -     chipid |=3D adreno_gpu->rev.major << 16;
> > -     chipid |=3D adreno_gpu->rev.minor << 12;
> > -     chipid |=3D adreno_gpu->rev.patchid << 8;
> > +     /* Note that the GMU has a slightly different layout for
>
> /*
>  * Note
>
> You've almost joined the good side :D
> > +      * chip_id, for whatever reason, so a bit of massaging
> > +      * is needed.  The upper 16b are the same, but minor and
> > +      * patchid are packed in four bits each with the lower
> > +      * 8b unused:
> > +      */
> [...]
>
> > -             .rev   =3D ADRENO_REV(3, 0, 5, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x03000500),
>
> 0x03000512 for msm8226-v2
> 0x03000520 for msm8610
>
> >               .family =3D ADRENO_3XX,
> >               .revn  =3D 305,
> >               .fw =3D {
> > @@ -66,7 +66,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(3, 0, 6, 0),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x03000600),
> >               .family =3D ADRENO_3XX,
> >               .revn  =3D 307,        /* because a305c is revn=3D=3D306 =
*/
> >               .fw =3D {
> > @@ -77,7 +77,11 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(3, 2, ANY_ID, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(
> > +                     0x03020000,
> > +                     0x03020001,
> > +                     0x03020002
> > +             ),
> >               .family =3D ADRENO_3XX,
> >               .revn  =3D 320,
> >               .fw =3D {
> > @@ -88,7 +92,11 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(3, 3, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(
> > +                     0x03030000,
> drop, prototype broken hw
> (I think there are also some specific codepaths for that junk,
> let's rid them too)
>
> > +                     0x03030001,
> v2 prod
>
> > +                     0x03030002
> msm8974pro
>
> > +             ),
> >               .family =3D ADRENO_3XX,
> >               .revn  =3D 330,
> >               .fw =3D {
> > @@ -99,7 +107,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(4, 0, 5, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x04000500),
> 0x04000500 msm8939
> 0x04000510 msm8952 (unsupported today)
>
> >               .family =3D ADRENO_4XX,
> >               .revn  =3D 405,
> >               .fw =3D {
> > @@ -110,7 +118,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a4xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(4, 2, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x04020000),
> msm8992, ok
>
> >               .family =3D ADRENO_4XX,
> >               .revn  =3D 420,
> >               .fw =3D {
> > @@ -121,7 +129,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a4xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(4, 3, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x04030000),
> 0x04030002 msm8994-v2.1, earlier revs are probably trash piles held
> together with duct tape knowing the track record of that soc
>
> >               .family =3D ADRENO_4XX,
> >               .revn  =3D 430,
> >               .fw =3D {
> > @@ -132,7 +140,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a4xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(5, 0, 6, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05000600),
> msm8953 ok
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 506,
> >               .fw =3D {
> > @@ -150,7 +158,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a506_zap.mdt",
> >       }, {
> > -             .rev   =3D ADRENO_REV(5, 0, 8, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05000800),
> 630 ok
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 508,
> >               .fw =3D {
> > @@ -167,7 +175,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a508_zap.mdt",
> >       }, {
> > -             .rev   =3D ADRENO_REV(5, 0, 9, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05000900),
> 636 ok
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 509,
> >               .fw =3D {
> > @@ -185,7 +193,7 @@ static const struct adreno_info gpulist[] =3D {
> >               /* Adreno 509 uses the same ZAP as 512 */
> >               .zapfw =3D "a512_zap.mdt",
> >       }, {
> > -             .rev   =3D ADRENO_REV(5, 1, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05010000),
> 8976 ok
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 510,
> >               .fw =3D {
> > @@ -200,7 +208,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .inactive_period =3D 250,
> >               .init =3D a5xx_gpu_init,
> >       }, {
> > -             .rev   =3D ADRENO_REV(5, 1, 2, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05010200),
> 660 ok
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 512,
> >               .fw =3D {
> > @@ -217,7 +225,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a512_zap.mdt",
> >       }, {
> > -             .rev =3D ADRENO_REV(5, 3, 0, 2),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05030002),
> 8996 final
>
> 0x05030004 8996pro
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 530,
> >               .fw =3D {
> > @@ -236,7 +244,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a530_zap.mdt",
> >       }, {
> > -             .rev =3D ADRENO_REV(5, 4, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x05040001),
> 8998 final ok
>
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 540,
> >               .fw =3D {
> > @@ -254,7 +262,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a540_zap.mdt",
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 1, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06010000),
> sm6125 ok
> sm6115 ok
>
> [...]
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 3, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06030002),
> my sources say that it should end in 1 for sdm845-v2 and newer
>
> >               .family =3D ADRENO_6XX_GEN1,
> >               .revn =3D 630,
> >               .fw =3D {
> > @@ -370,7 +378,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .zapfw =3D "a630_zap.mdt",
> >               .hwcg =3D a630_hwcg,
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 4, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06040001),
> 8150 ok
>
> >               .family =3D ADRENO_6XX_GEN2,
> >               .revn =3D 640,
> >               .fw =3D {
> > @@ -388,7 +396,7 @@ static const struct adreno_info gpulist[] =3D {
> >                       1, 1
> >               ),
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 5, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06050002),
> 8250-v2.1 ok
>
> >               .family =3D ADRENO_6XX_GEN3,
> >               .revn =3D 650,
> >               .fw =3D {
> > @@ -410,7 +418,7 @@ static const struct adreno_info gpulist[] =3D {
> >                       3, 2
> >               ),
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 6, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06060001),
> 8350-v2 ok
>
> >               .family =3D ADRENO_6XX_GEN4,
> >               .revn =3D 660,
> >               .fw =3D {
> > @@ -426,7 +434,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .hwcg =3D a660_hwcg,
> >               .address_space_size =3D SZ_16G,
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06030500),
> 7280 ok
>
> >               .family =3D ADRENO_6XX_GEN4,
> >               .fw =3D {
> >                       [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> > @@ -445,7 +453,7 @@ static const struct adreno_info gpulist[] =3D {
> >                       190, 1
> >               ),
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 8, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06080000),
> 8180 probably ok
>
> >               .family =3D ADRENO_6XX_GEN2,
> >               .revn =3D 680,
> >               .fw =3D {
> > @@ -459,7 +467,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .zapfw =3D "a640_zap.mdt",
> >               .hwcg =3D a640_hwcg,
> >       }, {
> > -             .rev =3D ADRENO_REV(6, 9, 0, ANY_ID),
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x06090000),
> 8280 probably ok
>
> >               .family =3D ADRENO_6XX_GEN4,
> >               .fw =3D {
> >                       [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> > @@ -494,31 +502,16 @@ MODULE_FIRMWARE("qcom/a630_sqe.fw");
> >  MODULE_FIRMWARE("qcom/a630_gmu.bin");
> >  MODULE_FIRMWARE("qcom/a630_zap.mbn");
> >
> [...]
>
> > @@ -612,32 +604,34 @@ static int find_chipid(struct device *dev, struct=
 adreno_rev *rev)
> >
> >               if (sscanf(compat, "qcom,adreno-%u.%u", &r, &patch) =3D=
=3D 2 ||
> >                   sscanf(compat, "amd,imageon-%u.%u", &r, &patch) =3D=
=3D 2) {
> > -                     rev->core =3D r / 100;
> > +                     uint32_t core, major, minor;
> > +
> > +                     core =3D r / 100;
> >                       r %=3D 100;
> > -                     rev->major =3D r / 10;
> > +                     major =3D r / 10;
> >                       r %=3D 10;
> > -                     rev->minor =3D r;
> > -                     rev->patchid =3D patch;
> > +                     minor =3D r;
> > +
> > +                     *chipid =3D (core << 24) |
> > +                             (major << 16) |
> > +                             (minor << 8) |
> > +                             patch;
> I think a define macro would be nice here

hmm, a macro would just encourage thinking about chip-id as having
bitfields, which is what I'm trying to get away from ;-)

> >
> >                       return 0;
> >               }
> > +
> > +             if (sscanf(compat, "qcom,adreno-%08x", chipid) =3D=3D 1)
> > +                     return 0;
> >       }
> >
> [...]
>
> >  static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
> >  {
> > -     /* The order of args is important here to handle ANY_ID correctly=
 */
> > -     return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
> > +     return gpu->info->chip_ids[0] =3D=3D 0x06030500;
> >  }
> I'm sorry, but this screams trouble.. and doesn't sound very maintainable=
 :/
>

why? It is intentionally checking the first chip-id so that nothing
breaks if later chip-ids are added

> Apart from all these comments, I don't really see the point of this patch=
,
> other than trying to tie together Qualcomm's almost-meaningless chipids o=
n
> a7xx into the picture..
>
> Since they can't even be read back from the hardware, I don't think tryin=
g
> to force them into the upstream kernel makes any sense.

Sure, we _could_ pick our own arbitrary identifiers, we don't have to
align with kgsl.  But that would be a super huge PITA for mesa, which
has support for both kernels.

> On a different note, I think we could try to blockify Adreno definitions =
a
> bit by splitting things into:
>
> - Core GPU propeties (revision, fw name, GMEM size)
>
> - G(P)MU properties
>
> - Family data (quirks, reg presets in some config struct which could be a
>   union of config structs per generation, hwcg, maybe protected regs ptr
>   should also be moved there)

We do something like this on the mesa side.  But we also get to use
python tricks to generate code as part of the build process which
makes things a bit more elegant.

Fwiw, I was already thinking about splitting the gpu "hw catalog" from
a flat table, to probably something more like a table of tables, so
that we can split a2xx/a3xx/a4xx/a5xx/a6xx tables into separate files.
And then we could move hwcg/protect/etc tables into the same file.
But I thought that might be a bit too conflicty for the a7xx series so
was thinking to wait until after that landed.. unless you don't think
it will be a problem.

BR,
-R

> - Generation data (init function, a2xx and a6xx specifics)
>
> - Speedbin LUTs matched against socid
>
>
> or something like that.. there's a whole lot of duplicated data atm
>
> Konrad
> >
> >  static inline int adreno_is_a660(const struct adreno_gpu *gpu)
> > @@ -358,8 +364,7 @@ static inline int adreno_is_a680(const struct adren=
o_gpu *gpu)
> >
> >  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
> >  {
> > -     /* The order of args is important here to handle ANY_ID correctly=
 */
> > -     return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
> > +     return gpu->info->chip_ids[0] =3D=3D 0x06090000;
> >  };
> >  /* check for a615, a616, a618, a619 or any a630 derivatives */
> >  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
