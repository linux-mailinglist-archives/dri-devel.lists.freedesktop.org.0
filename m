Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6919BFF3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 13:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611156EA55;
	Thu,  2 Apr 2020 11:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047C6EA55
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 11:13:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f52so2959432otf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 04:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mLkSVYvq1S+xd0KBA7m5cNwx3upuFOpsltCvoBBzKng=;
 b=UVbD2kpJM7QX5SA74WYheDB6vtFMgpi4QVA6cwcNetpgCLvhFPeTYfRrVsEDQ4IdA0
 Oz2uENa/F7auryI8p62pRVJCJQVav7Y3zWA+/TieeI9XEQzurvMKX5Cm04+HgB9AWqgR
 G/PFe5lD8vISw/mYF6ohZ7QBlduOetbn/qf8jw/6PNq0G2unODWW5zeyCW0N3xRFwpLp
 W7/P6Pt/f4pL6l1T9AKya1ztt952NuggIq6XbchwAxxcQDkSB+UDGpqz/HFCGxEBcP+v
 mvylutq5AxEo2GYw7L1QVspbwGGTOArnLOVOKkYwFvhZWvrZ94QxebMdKGxuD14z5uhO
 yjVg==
X-Gm-Message-State: AGi0PuZJqPQpEIaulEexQDQcpYS+AbdSySFCr2CaQa7LQ/Knr6e6ERML
 /rqepeSZuOTNXbFuRduJF1Xk/a3kXk4TZygDrV0RcxbF
X-Google-Smtp-Source: APiQypIORc/Nv1n6rB0FStMIbY/Vcz0asLDfPslbCmgMGOigP/aw3H0kO+OumSt/995iGNxNyKQ/MgKapGLA+4potZc=
X-Received: by 2002:a05:6830:15c2:: with SMTP id
 j2mr1797111otr.107.1585825983045; 
 Thu, 02 Apr 2020 04:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Apr 2020 13:12:51 +0200
Message-ID: <CAMuHMdXwUEuct=Pr29aGJuj1cgDmCEZFDm1JEx5-+zP-02n+mw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary
 planes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomohito Esaki <etom@igel.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Apr 2, 2020 at 12:42 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> all the overlay planes, but leaves the primary plane without a zpos
> property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> of it the property is mandatory for all planes when exposed for some of
> the planes. Nonetheless, weston v8.0 has been reported to have trouble
> handling this situation.
>
> The DRM core offers support for immutable zpos properties. Creating an
> immutable zpos property set to 0 for the primary planes seems to be a
> good way forward, as it shouldn't introduce any regression, and can fix
> the issue. Do so.
>
> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -785,13 +785,15 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>
>                 drm_plane_create_alpha_property(&plane->plane);
>
> -               if (type == DRM_PLANE_TYPE_PRIMARY)
> -                       continue;
> -
> -               drm_object_attach_property(&plane->plane.base,
> -                                          rcdu->props.colorkey,
> -                                          RCAR_DU_COLORKEY_NONE);
> -               drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> +               if (type == DRM_PLANE_TYPE_PRIMARY) {
> +                       drm_plane_create_zpos_immutable_property(&plane->plane,
> +                                                                0);
> +               } else {
> +                       drm_object_attach_property(&plane->plane.base,
> +                                                  rcdu->props.colorkey,
> +                                                  RCAR_DU_COLORKEY_NONE);
> +                       drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> +               }
>         }
>
>         return 0;

This is very similar to Esaki-san's patch[*] posted yesterday.
However, there's one big difference: your patch doesn't update
rcar_du_vsp_init(). Isn't that needed?

[*] "[PATCH] drm: rcar-du: Set primary plane zpos immutably at initializing"
    https://lore.kernel.org/linux-renesas-soc/20200401061100.7379-1-etom@igel.co.jp/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
