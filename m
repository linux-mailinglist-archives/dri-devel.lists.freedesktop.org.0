Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37DDC2735F
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 00:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BB510E0F9;
	Fri, 31 Oct 2025 23:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mhrQ62bX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9BD10E0F9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 23:43:36 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-63bcfcb800aso3146893d50.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761954216; x=1762559016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgO/DWOmuj6w8q58zdaOU7zMQCVZmvikJjSVWAUKf5k=;
 b=mhrQ62bXN0rt4LEkVTE63r0XmItReUatoGSBSCgKs02ttJQKBZV8j3zkhxinepIHMw
 6wwVtEq2m1zARCAP9iWfFihjO46O2VF8pDiZ9STsVzGPCEDVDt9wzGaCbIibiYaxWLfS
 DeG/hSrd6iNvvbsawXZkMs+NvS5VLdDxX1YGNYEh0/k8J7JA71iPGYtOHypkKuubyf/z
 Ouy2m2v1FJwb7CNiunRAbwy3iasaXxyzkTJryiPLLD0IwSWbfw5CUiK4/m+38YyM38HT
 Ww/id0u9laY0RgL9dPITj2kNlw/ldK37xCPuAdY0tgNvvmP/tR3/VwxCi10yktXuyTRj
 yG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761954216; x=1762559016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgO/DWOmuj6w8q58zdaOU7zMQCVZmvikJjSVWAUKf5k=;
 b=S/ocI5LpE4M6Ke20n7fe37aE1na4Vblt+lp+Cad4d715x8Zhumw3yeyEuCtBif2DC1
 pU8yKLJnHRhY+IDo873UmP0tRiiyJnXD8qclrNZSaAoGviWbulODIJr5sZWkm+TfwVbW
 2R7DdwL9xA/xJxacACArzYxZFy12T6Ja4CPe03Nji79XTNCDz57F5u+5sO/3Fwm5h9As
 DATJvogBtAT1OzpeE4kZzQELNd6vRDtRdvbYiSzkG8EDo4uCR7CNI9OEJvwcaIR5lqw1
 pMWnWS4Lfx/PNx5rP6zHbRPAdeUj1cdjfSolfoOrGRPJJB/Jn3O3VjgeRtYFPljXfE16
 k0qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTxtkDfQNYSlQNzhBEWRaP/5pcrjWAa0RxioH/ULO1lttoejDvJVEz3rqiiaSQVBRZbfiamNDbF/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw87lAevvDrm8aWnSOwkB5CvFLSVW8VUUYQkiQTOn1rBpnx/vGC
 C9Ha5k868YjUrGfTdbZP8C35HW+LRFkHow1jFhad4DHosasAuOJEpllY7LJSOJ6O/siXAJeRi8q
 /J+dy2lYtA/cVca619w1nYLhMcf+oUj0=
X-Gm-Gg: ASbGncvdJd9SOXFefejv91stM7ESO4cI1Xjk7Pt00OflYkUTqqz8W/E8UiCQDlDXPvh
 OHLWkuXCfEit6uGyaVk8p2IUUdekQmI2Ey0sIJRmHZH44W1sZn6O/cS5fTjQDpTbVUtXEKs4Ak/
 3fh//sf8TmvtZQld08ieYylJax6avIKIvHHvR3QyAKI1NLQ/LM65rNPtOK77yanuK9jqcFUh6X6
 1bqGGqqP3wV7CaATat2w7i6gZK8bNWjg4T6wK/14VH/f+Wr8uvVVccs6rNqbW7DfV5BRpivSlU1
 xjNVc7HEq9nPFUmVHA==
X-Google-Smtp-Source: AGHT+IFK5Mg3P3wWGK+GySaVQXlBC0Ubey7TBZYaOxffUY/BqMs0ME8D/+JRN26TZyPOSuTMs+miZG2jn3GWI721SSE=
X-Received: by 2002:a05:690e:d8b:b0:63f:9f4a:3ea with SMTP id
 956f58d0204a3-63f9f4a0557mr1762776d50.19.1761954215782; Fri, 31 Oct 2025
 16:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 31 Oct 2025 16:43:25 -0700
X-Gm-Features: AWmQ_blqeY-HldrhXd9X3mz1P5MLF3t6WOznNDOk6v6bu4NoTLrVvav3xvoKWiY
Message-ID: <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
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

On Mon, Sep 8, 2025 at 1:28=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 +++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 79 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b27f=
08a5b1eeb08dced 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] =
=3D {
>
>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>
> +/* Applicable for X185, A750 */
> +static const u32 a750_ifpc_reglist_regs[] =3D {
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +       REG_A6XX_TPL1_NC_MODE_CNTL,
> +       REG_A6XX_SP_NC_MODE_CNTL,
> +       REG_A6XX_CP_DBG_ECO_CNTL,
> +       REG_A6XX_CP_PROTECT_CNTL,
> +       REG_A6XX_CP_PROTECT(0),
> +       REG_A6XX_CP_PROTECT(1),
> +       REG_A6XX_CP_PROTECT(2),
> +       REG_A6XX_CP_PROTECT(3),
> +       REG_A6XX_CP_PROTECT(4),
> +       REG_A6XX_CP_PROTECT(5),
> +       REG_A6XX_CP_PROTECT(6),
> +       REG_A6XX_CP_PROTECT(7),
> +       REG_A6XX_CP_PROTECT(8),
> +       REG_A6XX_CP_PROTECT(9),
> +       REG_A6XX_CP_PROTECT(10),
> +       REG_A6XX_CP_PROTECT(11),
> +       REG_A6XX_CP_PROTECT(12),
> +       REG_A6XX_CP_PROTECT(13),
> +       REG_A6XX_CP_PROTECT(14),
> +       REG_A6XX_CP_PROTECT(15),
> +       REG_A6XX_CP_PROTECT(16),
> +       REG_A6XX_CP_PROTECT(17),
> +       REG_A6XX_CP_PROTECT(18),
> +       REG_A6XX_CP_PROTECT(19),
> +       REG_A6XX_CP_PROTECT(20),
> +       REG_A6XX_CP_PROTECT(21),
> +       REG_A6XX_CP_PROTECT(22),
> +       REG_A6XX_CP_PROTECT(23),
> +       REG_A6XX_CP_PROTECT(24),
> +       REG_A6XX_CP_PROTECT(25),
> +       REG_A6XX_CP_PROTECT(26),
> +       REG_A6XX_CP_PROTECT(27),
> +       REG_A6XX_CP_PROTECT(28),
> +       REG_A6XX_CP_PROTECT(29),
> +       REG_A6XX_CP_PROTECT(30),
> +       REG_A6XX_CP_PROTECT(31),
> +       REG_A6XX_CP_PROTECT(32),
> +       REG_A6XX_CP_PROTECT(33),
> +       REG_A6XX_CP_PROTECT(34),
> +       REG_A6XX_CP_PROTECT(35),
> +       REG_A6XX_CP_PROTECT(36),
> +       REG_A6XX_CP_PROTECT(37),
> +       REG_A6XX_CP_PROTECT(38),
> +       REG_A6XX_CP_PROTECT(39),
> +       REG_A6XX_CP_PROTECT(40),
> +       REG_A6XX_CP_PROTECT(41),
> +       REG_A6XX_CP_PROTECT(42),
> +       REG_A6XX_CP_PROTECT(43),
> +       REG_A6XX_CP_PROTECT(44),
> +       REG_A6XX_CP_PROTECT(45),
> +       REG_A6XX_CP_PROTECT(46),
> +       REG_A6XX_CP_PROTECT(47),
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> +
>  static const struct adreno_info a7xx_gpus[] =3D {
>         {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
>                           ADRENO_QUIRK_HAS_HW_APRIV |
> -                         ADRENO_QUIRK_PREEMPTION,
> +                         ADRENO_QUIRK_PREEMPTION |
> +                         ADRENO_QUIRK_IFPC,
>                 .init =3D a6xx_gpu_init,
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a740_hwcg,
>                         .protect =3D &a730_protect,
>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
>                         .gmu_chipid =3D 0x7050001,
>                         .gmu_cgc_mode =3D 0x00020202,
>                 },
> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .protect =3D &a730_protect,
>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
>                         .gmu_chipid =3D 0x7090100,
>                         .gmu_cgc_mode =3D 0x00020202,
>                         .bcms =3D (const struct a6xx_bcm[]) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172ef=
dd7255165f3c04a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu=
 *gpu)
>         u32 *dest =3D (u32 *)&lock->regs[0];
>         int i;
>
> -       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> -
>         lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> -       lock->ifpc_list_len =3D 0;
> -       lock->preemption_list_len =3D reglist->count;
> +
> +       reglist =3D adreno_gpu->info->a6xx->ifpc_reglist;
This is NULL on X1-45 and causes

  [    8.795603] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000008

> +       lock->ifpc_list_len =3D reglist->count;
>
>         /*
>          * For each entry in each of the lists, write the offset and the =
current
> @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu =
*gpu)
>                 *dest++ =3D gpu_read(gpu, reglist->regs[i]);
>         }
>
> +       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> +       lock->preemption_list_len =3D reglist->count;
> +
> +       for (i =3D 0; i < reglist->count; i++) {
> +               *dest++ =3D reglist->regs[i];
> +               *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> +       }
> +
>         /*
>          * The overall register list is composed of
>          * 1. Static IFPC-only registers
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4269a=
e7783ed3578e40e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -45,6 +45,7 @@ struct a6xx_info {
>         const struct adreno_reglist *hwcg;
>         const struct adreno_protect *protect;
>         const struct adreno_reglist_list *pwrup_reglist;
> +       const struct adreno_reglist_list *ifpc_reglist;
>         u32 gmu_chipid;
>         u32 gmu_cgc_mode;
>         u32 prim_fifo_threshold;
>
> --
> 2.50.1
>
