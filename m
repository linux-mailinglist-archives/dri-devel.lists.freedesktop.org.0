Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05686B6DE7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 04:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579E510E0B4;
	Mon, 13 Mar 2023 03:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFF810E0B4;
 Mon, 13 Mar 2023 03:19:39 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id x33so1396491uaf.12;
 Sun, 12 Mar 2023 20:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678677578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CBzKOAoVsQ0Am8mlT1jHXzf8az9DxCgFAJOcWtAcSc=;
 b=TZj/meOTUwSnXbzkQn+RIvQLo3eH50QtMJKvzchI1mMAb5f+Sa0hdGEZIAB/oTqV19
 6X17jVhONyQvG9f9mL4RdoX+njPO1DYk9uNHirGzShNwARJmpiKjg/W+HEf3TXlplZM4
 aCrEs2eQkEftlHMLCgufcOXtbER0qK/ayNev3zUCpvXWMu/9+Op8I93KPbTiv+wnaTEe
 3dG6JSgunxw1A1MGY0SkmyR+0e3bez02Pq7Oc7cc/ciI2A18Vj7ZRUEh6MSyXYi08Z8q
 CmEw0ts6R/+l2CRow6U3sjXtrhN4lyaUz1AWmslx0n8LWev8x1spsRVXL+N8SMYAIuq3
 vrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678677578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CBzKOAoVsQ0Am8mlT1jHXzf8az9DxCgFAJOcWtAcSc=;
 b=760DG3ceNyjf3cSfa4GCMR2I/WnTDvYZWtVL9diUjwXxDkS1c3ASmxsyytAo9VO0sK
 8Wta2dySwJuyIBGfFMeTp5oaNS8M/6R4uyoXIHHhjO/3/Q/v/6JjvZGjkfISkTvwByNr
 tpJdUh2fXj5tk6SPgPP2brrjsC0uD6KvQrW3CXgnnwgIaxwinf4jlkq6d1NJVRnNglrd
 VanT7XeVfjPRYbBgF6rRw89PHn6j7kwcQ7F2KSQVEfa83O8frclLn3gK7mx+NIdSbkOY
 WP3C3FIwxAIzHnWZuneuAf4BsXagxay4HqxV50bGuIN/5YzsUyv7d+SVCm4G2aPVwU4o
 m3hw==
X-Gm-Message-State: AO0yUKX+jQRtbp3BP1DFuH/qblIAg7ofL9wgK86ZOfPIZd0AkmllYi7B
 WVw8ymbnxHvQxVbPxRT33UbDRN8ZTaArRWZaz9E=
X-Google-Smtp-Source: AK7set+IT4ESRy7R0eRjEecC/IgyCezMd2n9zrYkSOOv33MMlHY7E7J8AQDoCNjNPaecdgdG37JsI9O7T8CNnOWsxXo=
X-Received: by 2002:a1f:4507:0:b0:42d:5ea6:bd58 with SMTP id
 s7-20020a1f4507000000b0042d5ea6bd58mr10716118vka.3.1678677578595; Sun, 12 Mar
 2023 20:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230224214133.411966-1-mcanal@igalia.com>
In-Reply-To: <20230224214133.411966-1-mcanal@igalia.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 13 Mar 2023 11:19:27 +0800
Message-ID: <CAKGbVbu-9j4jeAUp7WUbjeE7YCwcNYF3-Dks8Q_97dTm==tgPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/lima: Use drm_sched_job_add_syncobj_dependency()
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
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
Cc: freedreno@lists.freedesktop.org, lima@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Sat, Feb 25, 2023 at 5:41=E2=80=AFAM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> As lima_gem_add_deps() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in Lima in order to simply use the DRM function.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/lima/lima_gem.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 0f1ca0b0db49..10252dc11a22 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -277,21 +277,13 @@ static int lima_gem_add_deps(struct drm_file *file,=
 struct lima_submit *submit)
>         int i, err;
>
>         for (i =3D 0; i < ARRAY_SIZE(submit->in_sync); i++) {
> -               struct dma_fence *fence =3D NULL;
> -
>                 if (!submit->in_sync[i])
>                         continue;
>
> -               err =3D drm_syncobj_find_fence(file, submit->in_sync[i],
> -                                            0, 0, &fence);
> +               err =3D drm_sched_job_add_syncobj_dependency(&submit->tas=
k->base, file,
> +                                                          submit->in_syn=
c[i], 0);
>                 if (err)
>                         return err;
> -
> -               err =3D drm_sched_job_add_dependency(&submit->task->base,=
 fence);
> -               if (err) {
> -                       dma_fence_put(fence);
> -                       return err;
> -               }
>         }
>
>         return 0;
> --
> 2.39.2
>
