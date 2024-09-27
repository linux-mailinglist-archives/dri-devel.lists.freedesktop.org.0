Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC169988911
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 18:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D37410E223;
	Fri, 27 Sep 2024 16:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ABMiTjVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F058F10E21B;
 Fri, 27 Sep 2024 16:30:10 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a0be4d803eso8373035ab.0; 
 Fri, 27 Sep 2024 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727454610; x=1728059410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvTgw6Pk9gBEviwsx0Cqlnka/Mthb1oy+t9pJwb6oKE=;
 b=ABMiTjVn4PMjkWOZuDmiKT6M+exFVNd9hRmENdWgBmr5D9EOoxtlf1EQ1120V3Fi2D
 btepkuPg4r4amuux35PZDUPzA+DSSmvcfk/0M/r9NJxDQRqhgV+eczhVoNkexwN4Dd9T
 t0uUcIoIfTg8mzFG1cDr3Lnd89cnXXixsYjPXn3jworyuTSf79QKxFTbdcwzItPHj873
 RBRxUar2pVF0dBLBGH8X4EK5l8OHpl1ocVYIbvUFUBziQH7K3dbk9cdFNIiCmrTzTXev
 A6TDpD5d4u4UPDanDZ4TkrbesaLaZc0RPXT2pP+oEV/56wqSaVuzUrn3fz1C3D2NYetx
 D5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727454610; x=1728059410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvTgw6Pk9gBEviwsx0Cqlnka/Mthb1oy+t9pJwb6oKE=;
 b=fqv9zsvQGlUE67nNlKnf6QaYREDb4DhkqaQ5MrqdUixKgyLDURvKEJ2tMqSenSqqz9
 G7RAp0VX9IfzL++Zu5QzEPmDoptq0WD0bgeEAAx/VvSR/hcOEc3QE/6+2Y6jcP112eAQ
 QZBLgSMnJFe9iTwq9juX6oJVf8TDpHphKYXhLL/Md3nmUHNeuhR4wre2Hnlu4TmQuwNs
 611rve+9uOMDq3m8bTKWr72TS1Kue2gytypFzUEL+F+ATYmDy4bQDVbOnCkD/q3QlOfU
 XdlCoi5swTizB4elGUUEAKMxPiqNEuh0el3FVu3IjGq+k7O7z/J+ydjibYsHXqtMivda
 LNLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWun/HqKU/2C3us25XeU+2HmhJ+Ug00EKPwbVDXw+489wK7ypTdSLEjNKM4lvPo15nDJrEm7fB1elw=@lists.freedesktop.org,
 AJvYcCWvK2YMAJ1zfkPM1PeL6JUmQLnPtUlHVOcU4oMk0wZ5hkTnn70yFDwlaofLxkTn+sVZAlcJ9D8N6Aav@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzflqvAqGh99e6Z2wf62XTc5/4eL1QhMxj9IDnNlEgt4XM0ID2K
 gdTrSdiKVruvkA4QBzTjP0YrW0bKn1Iw/aNbWHSR0j49+sWBYz1X3y6o/0UwfBv/wsfK/N8ClO7
 geRhThcFgNUYQphh0vo2ameeT+3o=
X-Google-Smtp-Source: AGHT+IHG8fZKXSPzJQdh8hWyj5jDzymKjpbFKeFVmqIY8B/+EwO1m/phqt/38c7UgSoytYslwNezKZlcY211D56O0qY=
X-Received: by 2002:a05:6e02:1564:b0:3a0:4df2:52e2 with SMTP id
 e9e14a558f8ab-3a34515ca34mr35037475ab.4.1727454609859; Fri, 27 Sep 2024
 09:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 27 Sep 2024 09:29:58 -0700
Message-ID: <CAF6AEGviMOLoZKHf4DX9mEj84Y5Xx2hH4tvrkRVLsYyQz35Bwg@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] drm/msm/a6xx: Implement preemption for a7xx
 targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
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

On Thu, Sep 26, 2024 at 2:17=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 283 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 +++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 377 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 825 insertions(+), 11 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 6e065500b64d6d95599d89c33e6703c92f210047..355a3e210335d60a5bed0ee28=
7912271c353402a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c

[snip]

> @@ -784,6 +1015,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>         }
>
> +       a6xx_gpu->pwrup_reglist_ptr =3D msm_gem_kernel_new(gpu->dev, PAGE=
_SIZE,
> +                                                        MSM_BO_WC  | MSM=
_BO_MAP_PRIV,
> +                                                        gpu->aspace, &a6=
xx_gpu->pwrup_reglist_bo,
> +                                                        &a6xx_gpu->pwrup=
_reglist_iova);

Couldn't this also be MSM_BO_GPU_READONLY?  And same for the
preempt_postamble_ptr, I assume?

Also, it looks like we are only writing the smmu_info from the
kernel.. is there any way that could be split out into a RO buffer?

BR,
-R

> +
> +       if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
> +               return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
> +
> +       msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_reglis=
t");
> +
>         return 0;
>  }
>
