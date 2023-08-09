Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A269A776BF5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 00:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0AD10E124;
	Wed,  9 Aug 2023 22:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA4E10E124;
 Wed,  9 Aug 2023 22:09:48 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bc886d1504so294334a34.0; 
 Wed, 09 Aug 2023 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691618988; x=1692223788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wgDVu8p3LAXBRMLjZ335uEuofYsZ1H4TbcKoyLUoLo=;
 b=pBH+yh35EtrJKvrb5fnLJvRLVaPCRGUT+7HvV1ZWoRkfAESNpFgDP7h54DHz9p4/r6
 a42WOpxmxSXlV07+ptDJs5MVekWkF+X5zFZqlIHm6lJYfFo8GxvjhGOCojqzOzy0nI34
 iYFp/PT+g1fAF95MVMeBHGOHnj/AZ3xZfKljJVBalSsAU0LqTCfPVKsnOwegpZY2VS9F
 2CgpUwUTP71Ex2B71oEmlOWAN4IfsVCFDXOJK2dIdpC7B/xgDoFoLDd8/m+fXTj4k99o
 ene6pQH7hMtdKATN1DDzHcdbmLD59ChvMCA1GUJDcKV8IOW5u0/iLIuykZGxayGiaaLH
 4h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691618988; x=1692223788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wgDVu8p3LAXBRMLjZ335uEuofYsZ1H4TbcKoyLUoLo=;
 b=CwFWVVWqCXHZRsuq9996cHr/PchVEWmsRAn4dWHgWuf1r6OAbrpM8EjPSuDbqbqDJU
 Dwt7ajsZ99dkAydKN4QEN3fDTBzUpgApKNstdgDJiUurMBnwmua2Mkggeuzr9fD4gJWv
 c491VQYkmCs9vwt3qqnH8VxLmMVpbBarhVauxmGkw/B8xCOuCe4t1eNCnPUzjr9Dt5Tv
 HNzmGTm7H8iQYr+q3LN2Ub6TsC3Pz/Ef5BJ8mL881FgQci2dKXCenW6EJNGNkOonW4jH
 DZzMneS/Shv4m5gSXogaw97XHC0f0bqFxmNMA1QqW3+VqhCYRaE0JRdXFENr67x8OkIA
 tbMA==
X-Gm-Message-State: AOJu0YxiwQiAjgxe0XIxaIPdsCCtsw71rM7yL5v7r5lf93dQr3RTHMT1
 y5FL3SRzx1+aJhMMI/m3qGw2FBuxrh8YRnakFpg=
X-Google-Smtp-Source: AGHT+IGaFK09aQLRrcthM3O+uleFc4gf7oGBkgSQRy/BXP3AlJBxiNZU18R3ecPf1q5NWrORzYwZ8vWUHy/MM9WtzuY=
X-Received: by 2002:a05:6870:970e:b0:1bb:b025:3e87 with SMTP id
 n14-20020a056870970e00b001bbb0253e87mr688950oaq.58.1691618987999; Wed, 09 Aug
 2023 15:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230703150135.5784-1-ubizjak@gmail.com>
In-Reply-To: <20230703150135.5784-1-ubizjak@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Aug 2023 18:09:36 -0400
Message-ID: <CADnq5_MCquO_Sh0RUVYATbLwS1+h2UrLHoUkCXYeF7=R4kZmDg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use local64_try_cmpxchg in amdgpu_perf_read
To: Uros Bizjak <ubizjak@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jul 3, 2023 at 7:16=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> Use local64_try_cmpxchg instead of local64_cmpxchg (*ptr, old, new) =3D=
=3D old
> in amdgpu_perf_read.  x86 CMPXCHG instruction returns success in ZF flag,
> so this change saves a compare after cmpxchg (and related move instructio=
n
> in front of cmpxchg).
>
> Also, try_cmpxchg implicitly assigns old *ptr value to "old" when cmpxchg
> fails. There is no need to re-read the value in the loop.
>
> No functional change intended.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_pmu.c
> index 71ee361d0972..6e91ea1de5aa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> @@ -276,9 +276,8 @@ static void amdgpu_perf_read(struct perf_event *event=
)
>             (!pe->adev->df.funcs->pmc_get_count))
>                 return;
>
> +       prev =3D local64_read(&hwc->prev_count);
>         do {
> -               prev =3D local64_read(&hwc->prev_count);
> -
>                 switch (hwc->config_base) {
>                 case AMDGPU_PMU_EVENT_CONFIG_TYPE_DF:
>                 case AMDGPU_PMU_EVENT_CONFIG_TYPE_XGMI:
> @@ -289,7 +288,7 @@ static void amdgpu_perf_read(struct perf_event *event=
)
>                         count =3D 0;
>                         break;
>                 }
> -       } while (local64_cmpxchg(&hwc->prev_count, prev, count) !=3D prev=
);
> +       } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, count));
>
>         local64_add(count - prev, &event->count);
>  }
> --
> 2.41.0
>
