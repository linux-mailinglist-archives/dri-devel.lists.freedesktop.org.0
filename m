Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA29C4188
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 16:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4FF10E2DF;
	Mon, 11 Nov 2024 15:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8QVQtuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CA010E1F2;
 Mon, 11 Nov 2024 15:08:42 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3a6e960fa2dso18264775ab.0; 
 Mon, 11 Nov 2024 07:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731337721; x=1731942521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqDjKD0MpVgCKxlaiJrPGJcWbnb48b/VsDJVF/AEcyY=;
 b=h8QVQtuYL//MWjuYhECfr9YBoBgT3lklVxq/DdWSi0kXNisEHclRsrNyvjPqFfAHnO
 SBr4YHa9JE5hybZr40x/5O4kqDnsnib+dmY+sPyLCjhBxnBpgsNCmF/WAWw+oGFGtdyf
 tI+N0KU3M0yOnDFzfHHLZ1Xa3atIs+PcUqjivOUxiAEVp/kL2qqT5g2m6afz+uWSLbZN
 m4+r1Yvb4XEudU9VrHKIbV0Dhu4P3NJoXb10yZif4rePef/ZqJyovdI4/bfeCY7Frk7c
 sv0BICPGEjWolLgUpQzhWVJlig8BsyMJKV8Q3NpDMiwYT0rVO3unADzbgCsZO+BqaIZ2
 wZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731337721; x=1731942521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqDjKD0MpVgCKxlaiJrPGJcWbnb48b/VsDJVF/AEcyY=;
 b=e0xm36IScwq5Msmvv/CO/N+rkIJHVcR9Vz86aCkZ5xzEDnG/dUi0Fzg3d7sfrEB0nx
 N8CbwQ5xfmcT1ipOlRXdJmXPmhOD7EXLyYdRT4VvL0Q7Jrxtt+oZeWAv8KZiFJcqgUUM
 fS6Sx4iCaQbRps7Wn221auhQYh/QSok2igbv+tB7TwKaS7tkLaxfpEEoezT8DS0C2lRz
 wNN6GVGldPRU15+NXtSuJ4TyCcSxOGx9ikfJW87pm2u3thnl7lm84SS3i+DVwBTppVE1
 8t7x4jiA0HiynU1dIjGg3IWIDxXUyh1UbwbouJxwFBC6x1CrKb2wvRh7bp7Id5CJlCyx
 4xuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0tfkl5xszoG0cSyy9puN75unDM/p6RivsXWj5PzmFmNcwvwI5WtUb/xJEmiZ8BQyQMPHhiIJPTFk=@lists.freedesktop.org,
 AJvYcCXv74ieEi6BvpJvEdV9jIQ98bhbckVRSnX+2Q4d1lA8Lz5mul7spi+TDgFTFsKKMtL9hMQoLq08+iJ2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGtDDrpG12XeAa6BhiOGGvy2XVKQhPus2iLz1tvG+1zCztl8mM
 xCnTMEJ68P018Ga82V75EY0wXjcrT3PIx3njQxzufN8YHuDmgwBrP95nXF7AsHSjiWjqInlxHAR
 aZ11/9ybz8htfPztPjKmu2pHHIqs=
X-Google-Smtp-Source: AGHT+IH2DqHNH1lAaBPMKHfZf8DIZICij4huNrVtkaYHzbXzeXmfugxejRRHAtF2NyamwSTWbJkMJPmJyjEc/FaMe+0=
X-Received: by 2002:a05:6e02:160b:b0:3a3:4164:eec9 with SMTP id
 e9e14a558f8ab-3a6f1a15cb8mr141413625ab.14.1731337721225; Mon, 11 Nov 2024
 07:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 Nov 2024 07:08:29 -0800
Message-ID: <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Sun, Nov 10, 2024 at 9:31=E2=80=AFAM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:
>
> Support for per-process page tables requires the SMMU aparture to be
> setup such that the GPU can make updates with the SMMU. On some targets
> this is done statically in firmware, on others it's expected to be
> requested in runtime by the driver, through a SCM call.
>
> One place where configuration is expected to be done dynamically is the
> QCS6490 rb3gen2.
>
> The downstream driver does this unconditioanlly on any A6xx and newer,

nit, s/unconditioanlly/unconditionally/

> so follow suite and make the call.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 076be0473eb5..75f5367e73ca 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct ms=
m_gpu *gpu,
>
>  int adreno_hw_init(struct msm_gpu *gpu)
>  {
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       int ret;
> +
>         VERB("%s", gpu->name);
>
> +       if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN1 &&
> +           qcom_scm_set_gpu_smmu_aperture_is_available()) {
> +               /* We currently always use context bank 0, so hard code t=
his */
> +               ret =3D qcom_scm_set_gpu_smmu_aperture(0);
> +               if (ret)
> +                       DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU =
aperture: %d\n", ret);
> +       }
> +
>         for (int i =3D 0; i < gpu->nr_rings; i++) {
>                 struct msm_ringbuffer *ring =3D gpu->rb[i];
>
>
> --
> 2.45.2
>
