Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DD7679FD6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB7510E0B1;
	Tue, 24 Jan 2023 17:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F29D10E097;
 Tue, 24 Jan 2023 17:12:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id w11so20804255lfu.11;
 Tue, 24 Jan 2023 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaMXdjnUJV5FMTPJEaHUEHp8Nfb0QJomieUmnE2lH1k=;
 b=ew0+EO7FRpXgGYjZi553mAsftT25+g50Rw8EBVb8lhQBVydTBqFKZ3SdNE5v8M6PNv
 6P8scwE/xv9zZNvEwUf8ieSr4Ao8KeQXHdbtS/PwFMixNDvMW2noE2KusoZWfE3SH9iM
 XtolIxIBsTyXZBg3BTQJg5mqPcTG7s57CAdjh/96OKgT1oYe57Q3H42fhL0j0o5vGyMG
 CFbQM2eclQuJYT47AAMLknJguVCHEo2ZeSmLmJaJdczSWOPk+gK2YtBZEbUCj/I3T/mN
 ur1yeXtrWM+WJOvcqF0HMR9fYcvW6WgUPjXARoAk0yRlay9i3QdNfWTF7RUAO540cqCh
 E8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zaMXdjnUJV5FMTPJEaHUEHp8Nfb0QJomieUmnE2lH1k=;
 b=KgfvY+j0DLNo4PFc9o+yWC1KLQdhnpBPzEXi86y/BF2okXEVoBy+1Bj9GbzELHpB0i
 yjt7vsfTQTVZOR9cE4lk9ROoAcVM4uPl7I55gkQRMb1iXHxOt51ncId9c1P6ANqhUOsA
 9fuG/H0P6MCZJRlEqNf+mqnYHSGB9/zxDtc6etNfuzo3x91dANAY1k8RpgyLhYh9SjEj
 4/yOflQwcUaDdh6WCpHzFDDWzrq+YA+SJTTZZZS52U98sj8pGH1TGRPUu3xgSqQghwG0
 lO92QHgd5NZ7+pokqJ6BUr+Li/2LQrMkkpfjvJ0bvB+iABqhPvn8ffdW/0+IrhTfrE2N
 Pl9w==
X-Gm-Message-State: AFqh2krpqZ7tUS2V7sklS1d2sJZM0W0lVcViQKokMvDHiLKc9kr0BgTM
 ybzhccIAX+OD+Mv6fPCkkht2tR+yYH9s7rwbbJQ=
X-Google-Smtp-Source: AMrXdXs0c2UwMKktuIpp2U98/7lqyFM4RRV5BngNRiroCYzz91tCI0hc1C//RyYG0hisDJiQ/ptKk/Gqie2GfUAD8VA=
X-Received: by 2002:a05:6512:96d:b0:4c7:6601:e3b1 with SMTP id
 v13-20020a056512096d00b004c76601e3b1mr1320102lft.548.1674580327731; Tue, 24
 Jan 2023 09:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <20230124125726.13323-5-christian.koenig@amd.com>
In-Reply-To: <20230124125726.13323-5-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Jan 2023 17:11:40 +0000
Message-ID: <CAM0jSHM0bKVZhmJcx00Lum-5+o-JUTtVwQeOEQvN5Ur0z=1GOA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/ttm: replace busy placement with
 flags v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 at 12:57, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Instead of a list of separate busy placement add flags which indicate
> that a placement should only be used when there is room or if we need to
> evict.
>
> v2: add missing TTM_PL_FLAG_IDLE for i915
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---

<snip>

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index c2ec91cc845d..0ab24ca5f419 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -347,27 +347,6 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, in=
t align,
>         return 0;
>  }
>
> -static void
> -set_placement_list(struct ttm_place *pl, unsigned *n, uint32_t domain)
> -{
> -       *n =3D 0;
> -
> -       if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
> -               pl[*n].mem_type =3D TTM_PL_VRAM;
> -               pl[*n].flags =3D 0;
> -               (*n)++;
> -       }
> -       if (domain & NOUVEAU_GEM_DOMAIN_GART) {
> -               pl[*n].mem_type =3D TTM_PL_TT;
> -               pl[*n].flags =3D 0;
> -               (*n)++;
> -       }
> -       if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
> -               pl[*n].mem_type =3D TTM_PL_SYSTEM;
> -               pl[(*n)++].flags =3D 0;
> -       }
> -}
> -
>  static void
>  set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
>  {
> @@ -395,10 +374,6 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_=
t domain)
>                         nvbo->placements[i].fpfn =3D fpfn;
>                         nvbo->placements[i].lpfn =3D lpfn;
>                 }
> -               for (i =3D 0; i < nvbo->placement.num_busy_placement; ++i=
) {
> -                       nvbo->busy_placements[i].fpfn =3D fpfn;
> -                       nvbo->busy_placements[i].lpfn =3D lpfn;
> -               }
>         }
>  }
>
> @@ -406,15 +381,32 @@ void
>  nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
>                          uint32_t busy)
>  {
> -       struct ttm_placement *pl =3D &nvbo->placement;
> +       struct ttm_place *pl =3D nvbo->placements;
> +       unsigned *n =3D &nvbo->placement.num_placement;
>
> -       pl->placement =3D nvbo->placements;
> -       set_placement_list(nvbo->placements, &pl->num_placement, domain);
> +       domain |=3D busy;
>
> -       pl->busy_placement =3D nvbo->busy_placements;
> -       set_placement_list(nvbo->busy_placements, &pl->num_busy_placement=
,
> -                          domain | busy);
> +       *n =3D 0;
> +       if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
> +               pl[*n].mem_type =3D TTM_PL_VRAM;
> +               pl[*n].flags =3D busy & NOUVEAU_GEM_DOMAIN_VRAM ?
> +                       TTM_PL_FLAG_BUSY : 0;
> +               (*n)++;
> +       }
> +       if (domain & NOUVEAU_GEM_DOMAIN_GART) {
> +               pl[*n].mem_type =3D TTM_PL_TT;
> +               pl[*n].flags =3D busy & NOUVEAU_GEM_DOMAIN_GART ?
> +                       TTM_PL_FLAG_BUSY : 0;
> +               (*n)++;
> +       }
> +       if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
> +               pl[*n].mem_type =3D TTM_PL_SYSTEM;
> +               pl[*n].flags =3D busy & NOUVEAU_GEM_DOMAIN_CPU ?
> +                       TTM_PL_FLAG_BUSY : 0;
> +               (*n)++;
> +       }

Should this not be something like:

non_busy =3D domain;
domain |=3D busy;
....
if (domain & VRAM) {
     if (non_busy & VRAM)
         flags =3D 0
     else
        flags =3D FLAG_BUSY
}

Otherwise if VRAM is set in both "busy" and "domain", it will only try
VRAM when all non-busy first fails, which looks like a change in
behaviour?

The rest of the patch looks good to me, so with the above fixed or explaine=
d,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
