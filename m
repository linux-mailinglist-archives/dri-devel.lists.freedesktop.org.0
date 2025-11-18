Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A472C6A719
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2355010E4ED;
	Tue, 18 Nov 2025 15:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UFKTkVzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D6010E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:56:27 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-297e2736308so5498555ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763481387; x=1764086187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=;
 b=UFKTkVzqPQt/WCVkZPaYByLl5H9lw2HKN47ppcn3/XRjaR04R/54y3ptII6K+TFO72
 qP44vOcl3E7imXYMObr/5KY4UQSsBOlwiRBleD9Vb03FogB86dhYafQ4e9qm33/Jfz8R
 HLTF9Nb+5Z5mJabK5onq6ZYarQC2iaPeXA13ea/SuXsRmPBKoCXuas5LSxu8Pj+6FZM5
 4M5JkssqucrxyBs101wyqimn9xdkOfZVIeIx6HSUmrZMaQKHATbUt2xHMrxhaw4dvSm1
 SsJ6XDocJWngLh3CFYd+nnZ/EjvxtCTFyXXu4QGjoSTLrLrY9grepxZ50Ge8kph7UNRN
 jEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763481387; x=1764086187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=;
 b=FNFBTLQFdDGzriu5oPm555Jb3eEzHaYJyqyCiBf2W84mg7EW2G9fU942N35ZF23bpk
 EIeW/abRZpE00x5GEMDWn9m/JUtia7MduKa+fLZ+PonaohXNoZRKdS3k8Y5uRdLXOMzU
 kspAE5Fycv3fXRhlZhq5uWjASx7tCgQhnUWqxtHKY/ZlGDeEJf/qwzmHEf0SvcqmJWSx
 4M929yfwH0ilsMLUMxW41MdFeMwLi+IMb8RZCoMhOpZfmFQnxg1eGCJZgF5OehzmzJUV
 2FQs2VQSu5SGfkVlKHgHzCO3GPaGIkMPgqixAW78nKTtTSfP8J8RXSMWvIm+NqafKAFp
 P7Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2D1CZUxJhEmmKd2gg4g8jqGzC9P+v8qU1ty4nA3YsNWryIk/E37jnpi0fAbVSuzTyEkXNuhTOTS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMSbr1TEWgMxaCyuNQw1zLAoG4BXcipjdBj2eVA58epv8oLkPe
 zC0atvG5ZwIbMPXbuphVtcSI1NHUK6Nj1M8eMS+y5TvloQXc2nZz6mEpZoHM4MdZq04dgzLuyGf
 aJP5DRNnFYsZ1TLNgJsTgbhlXUueHHUU=
X-Gm-Gg: ASbGnctN8LjwQ/lEcYWgueBcFMCUWFtWhca2/ZYoGv1+PP0wUDBSWBP02skopBLQL+r
 4j8Hk0IKqNphp/bvzJv+fz05DvrbGjOzyZGJ6fWoIbhGJLdH78l+fA+L7E1GnuuLP0VnJ6aKscL
 jXsZ1x0YrVr8tEfnSs1X+/bn4zpwrrnKVnEImKlwA3d3LnuzjxdQC6m4uCa/iTz+su4vXN4Xqt+
 sjV+rHa5ZCSdNcNdjVsGqwGp9I0YB4z3Q3YTOhxRbuHMRmmMn3bHZzN/1xNPPsIqiILGtu47oRc
 WADnPS5HOKbu9dg1
X-Google-Smtp-Source: AGHT+IE8t1o/EHIJG7uVd/X+qmNh/IfoMFCfRZRkp7Xo8e8ghyzgHnHIC3pizFSaKdc3W9ZzA4z9Bd0F68Sq2swtnFU=
X-Received: by 2002:a17:90b:1b01:b0:341:b5a2:3e78 with SMTP id
 98e67ed59e1d1-343fa74f0bfmr9250914a91.3.1763481387271; Tue, 18 Nov 2025
 07:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 18 Nov 2025 10:56:16 -0500
X-Gm-Features: AWmQ_bmdki1r5-87hufvE1VD2aBWZ9nuG-r_2OiqIAnZ7-v6leUi15c6-xeP3Cc
Message-ID: <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org
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

On Tue, Nov 18, 2025 at 3:53=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
>
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.

I guess the plan is to expose MSM_PARAM_AQE later once preemption
records are in place and for now just load the firmware to ensure that
people have it?

The interrupt error handling is still missing, but I guess that can be
handled later if that's the plan.

Connor

>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 810b64b909f5..9a643bcccdcf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 }
>         }
>
> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +               a6xx_gpu->aqe_bo =3D adreno_fw_create_bo(gpu,
> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iov=
a);
> +
> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +                       int ret =3D PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +                       a6xx_gpu->aqe_bo =3D NULL;
> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
> +                               "Could not allocate AQE ucode: %d\n", ret=
);
> +
> +                       return ret;
> +               }
> +
> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
> +       }
> +
>         /*
>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>          * privileged buffer to store the RPTR shadow
> @@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>                 drm_gem_object_put(a6xx_gpu->sqe_bo);
>         }
>
> +       if (a6xx_gpu->aqe_bo) {
> +               msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +               drm_gem_object_put(a6xx_gpu->aqe_bo);
> +       }
> +
>         if (a6xx_gpu->shadow_bo) {
>                 msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
>                 drm_gem_object_put(a6xx_gpu->shadow_bo);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index e6218b0b9732..3a054fcdeb4a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -59,6 +59,8 @@ struct a6xx_gpu {
>
>         struct drm_gem_object *sqe_bo;
>         uint64_t sqe_iova;
> +       struct drm_gem_object *aqe_bo;
> +       uint64_t aqe_iova;
>
>         struct msm_ringbuffer *cur_ring;
>         struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a8xx_gpu.c
> index c9cd7546024a..e011e80ceb50 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
>                 goto out;
>
>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +       if (a6xx_gpu->aqe_iova)
> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->=
aqe_iova);
> +
>         /* Set the ringbuffer address */
>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index c496b63ffd41..0aca222c46bc 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -27,6 +27,7 @@ enum {
>         ADRENO_FW_PFP =3D 1,
>         ADRENO_FW_GMU =3D 1, /* a6xx */
>         ADRENO_FW_GPMU =3D 2,
> +       ADRENO_FW_AQE =3D 3,
>         ADRENO_FW_MAX,
>  };
>
>
> --
> 2.51.0
>
