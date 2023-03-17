Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EA6BF261
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B353E10E40B;
	Fri, 17 Mar 2023 20:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ACF10E40B;
 Fri, 17 Mar 2023 20:25:33 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17ab3a48158so6985734fac.1; 
 Fri, 17 Mar 2023 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7N/5SkdFbLDourlYidVecmvge10Le3raMprhkQ2YpI=;
 b=VKYuDQH8nPi9ya7zgAwmREN+GuwmAVAcLFUdKcKuppWfo4W1MxXwgAh5TxIE3ipYph
 qulB8Lq8oF57cs5SxV6TT4pei+7u7mjWdIYCZOEtWKyyuXAyvtfup5QV0LDM+CIZfzQa
 6DC3uhGNaOQyb8LnT79dM9pB4w0lJVJsin/Ti8XMn7meublIWqtWVRNUbJaDuR1mmJV8
 NJfhF5e5Ggj5lN8kXRTnRbrWuhBlyQyZnHh9USnlZvt0FLmtwdOxBEwZRHit0OyhbOFJ
 p6q9HXnsIX4LRuq9SeUEe86+qtI17axfn1AMvmA7hgaY718cXErGmJYNb+eDqfAv230b
 mwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7N/5SkdFbLDourlYidVecmvge10Le3raMprhkQ2YpI=;
 b=qWApy/EKqBKUaPuXSNlkttlcjMacgwmOWtYvj2tpnAGBoWjCD9PDP8Vu9/JEos/8ic
 glF8UhzLmJBBmL7yonwy3DsXnz5qPS9Ug8XU1FCJWy1o2tg0lvaybBDhMHUM4G82bq/p
 XDbLkgTEgBVEQIKxJ2KBGCY/k2JJWxwkjxuaZWpNyA66CYKFw94HF6QxZya7CxbMD5oK
 YwSeWlvTqzleUpZuxE58tS59O9t6cgzqa4m5hVK57cw/CLRv8Yu3WCBbE4qMU5U7A0H2
 zMmKxNh1nkM3X6zN1vVD2M/6oC71viJBRuGTYcngKKHvMDe7skgaIUfvBUt6qhtZjGW8
 cm9A==
X-Gm-Message-State: AO0yUKUwPp3RHBcckdTGtGxtkIAatPpUargJopAoMAwsl2yOzmFT+bZw
 nRMXSSOILMViAvaSeHOuh8AN5dmZvw8/+P5l2xg=
X-Google-Smtp-Source: AK7set+MWzHjggCWfkotzjv7c10QgriF3tPYiWRYjwRgLeeQB4ULOcZL6eJCrv4r5X2TND/7KeognxUSoxZqL1EgdHg=
X-Received: by 2002:a05:6870:1099:b0:17c:29d8:61ee with SMTP id
 25-20020a056870109900b0017c29d861eemr7614oaq.3.1679084732788; Fri, 17 Mar
 2023 13:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-18-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-18-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:25:21 -0400
Message-ID: <CADnq5_PTVrzPanSQznXLGWnnpKoRCjugBsExixkqEri+8i3r=Q@mail.gmail.com>
Subject: Re: [PATCH 17/37] drm/amd/amdgpu/amdgpu_mes: Ensure
 amdgpu_bo_create_kernel()'s return value is checked
To: Lee Jones <lee@kernel.org>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function =E2=80=98amdgpu_mes=
_ctx_alloc_meta_data=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1099:13: warning: variable =E2=
=80=98r=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jack Xiao <Jack.Xiao@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mes.c
> index 82e27bd4f0383..30cd72ca1eefd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1104,6 +1104,11 @@ int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_d=
evice *adev,
>                             &ctx_data->meta_data_obj,
>                             &ctx_data->meta_data_mc_addr,
>                             &ctx_data->meta_data_ptr);
> +       if (r) {
> +               dev_warn(adev->dev, "(%d) create CTX bo failed\n", r);
> +               return r;
> +       }
> +
>         if (!ctx_data->meta_data_obj)
>                 return -ENOMEM;
>
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
