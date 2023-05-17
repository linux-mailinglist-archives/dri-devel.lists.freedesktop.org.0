Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718FA706C08
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62C10E43F;
	Wed, 17 May 2023 15:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9311010E433;
 Wed, 17 May 2023 15:02:29 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-39462726590so603693b6e.1; 
 Wed, 17 May 2023 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684335748; x=1686927748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKbmhk5mhG7z3c3GAxFFuhJB73vX3ZYT4E6sRw2hPow=;
 b=TZctVmK4SsezfrFblmqY4kNM+2qKf4p7EtidnfmNRpw5VxHTGl4l17tTIRgcFVDVn5
 UJc44Cvq9A6Clc2qwpTAA5CX7NABaFRjmcFJwo0PFuvoXtdP6pqmkQuJrC6G4Fzj9Av1
 TFTmEmbmYbHVQU9fgtrq5uXwwf0LofM0lCKU3tHmFYqoxtkp8V9N+bSLj5cf4OjzcpRD
 shT3WIPsPurmjQvrsDFEvNgTFTG1ZP10cfFF04jMe+zuMSTfYcY70NKu+aDaNXKLe5tQ
 oso/tR8vRUm7OIYHOg4iSvol8YiZRHqnH22nlfOvkPKNKiyraLpLeJvOH5zwZC4ctXeJ
 psRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335748; x=1686927748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKbmhk5mhG7z3c3GAxFFuhJB73vX3ZYT4E6sRw2hPow=;
 b=NWDEzmYyDMrhzGrki9BF8JnU1uFmFEZXPyQyvptIJhf5Vs133/iIqvxirGbnJZursu
 oPUsK0YqyR6+9OY0XnB7hP2tnGIy+jnhGRdmGXAEVZfwnEIVmteywh9los6Tu+JrX7Rc
 CUa7hMCcmy6v+3htbmgYCCrxJ+7ljJmuI0xLZaE4yGOyazMOmCpBGo7cizVNInevNni3
 O75wCT2NHXNdAbT1X76BmbMyHXaQZNcgnhVyj6z5d46rujtaodBmH1J0WwTz7fowplo4
 Yg2iU8XYHb8jE6be7HQjkl5Wllr0EUDYfcJw74OGOtfS5qwv5f/PlyFKpa9t5jA2jZUZ
 s7Lg==
X-Gm-Message-State: AC+VfDxN/tpcZJncqIoUgc7FLDUF7HH/XpnATVWDtoUUgB1OAgRL9XSE
 TL20LFaLu68B6G3QMdophYJSd7nN9LEdU0aKGZo=
X-Google-Smtp-Source: ACHHUZ7aekQb1x9F9rvCDp8f4Co46L85wUPMG2eUHozGqDTVgXG17TiuLqwkS7GGKNHVH5ueX5ugwwp+hC9sSyt+NbQ=
X-Received: by 2002:a05:6870:5383:b0:192:b208:bc96 with SMTP id
 h3-20020a056870538300b00192b208bc96mr21573960oan.4.1684335748295; Wed, 17 May
 2023 08:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230509102239.2935744-1-zhenguo.yin@amd.com>
 <20230509102239.2935744-2-zhenguo.yin@amd.com>
In-Reply-To: <20230509102239.2935744-2-zhenguo.yin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 May 2023 11:02:17 -0400
Message-ID: <CADnq5_NbpWOhUWcKB8_4xdzs5gjMONQMYyuX7sfwvXjb=5TRyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/scheduler: avoid infinite loop if entity's
 dependency is a scheduled error fence
To: ZhenGuo Yin <zhenguo.yin@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: monk.liu@amd.com, jingwen.chen@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel for scheduler

On Tue, May 9, 2023 at 6:23=E2=80=AFAM ZhenGuo Yin <zhenguo.yin@amd.com> wr=
ote:
>
> [Why]
> drm_sched_entity_add_dependency_cb ignores the scheduled fence and return=
 false.
> If entity's dependency is a schedulerd error fence and drm_sched_stop is =
called
> due to TDR, drm_sched_entity_pop_job will wait for the dependency infinit=
ely.
>
> [How]
> Do not wait or ignore the scheduled error fence, add drm_sched_entity_wak=
eup
> callback for the dependency with scheduled error fence.
>
> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index d3f4ada6a68e..96e173b0a6c6 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -384,7 +384,7 @@ static bool drm_sched_entity_add_dependency_cb(struct=
 drm_sched_entity *entity)
>         }
>
>         s_fence =3D to_drm_sched_fence(fence);
> -       if (s_fence && s_fence->sched =3D=3D sched &&
> +       if (!fence->error && s_fence && s_fence->sched =3D=3D sched &&
>             !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
>
>                 /*
> --
> 2.35.1
>
