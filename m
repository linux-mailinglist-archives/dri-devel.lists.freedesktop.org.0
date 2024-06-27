Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26F91A6A9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 14:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BE510E05F;
	Thu, 27 Jun 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IwSs3PCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B86110E05F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 12:37:31 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-379c2d0a7bbso1379695ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719491850; x=1720096650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwkwHWxRAd+DH8ZE9VyUYC3ry47e8WY6DSXQ/UkvlpU=;
 b=IwSs3PCxcigstAj/sHDqAjkz/qdeZJPSctMuytPeFExqw8JOaBcq1pErmlg4WqOMNP
 ZlJ0p5w5ZbSLC6ZF5cTKPSJLK0cwFm9sdsTEureQHxeQ+E8zHHj8QUHFFhBTJUydx8du
 ruKQitDTYCVv9ZXE3oeeYLz94EvreUNazxOg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719491850; x=1720096650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwkwHWxRAd+DH8ZE9VyUYC3ry47e8WY6DSXQ/UkvlpU=;
 b=hkz4ZsGpU6o7mre6BMS+ACIkfvWlVYvuapXxz42j95XO+D7gLmr15t5CJrBqPbSsol
 9IeMozqEzJ9m8/8YlvSUTYcIO0EfOWwdHulOAk+tDluEUEEkXB7WGf4+ak2+dDzvzxtN
 /wgBPd13dishqREkdD7r1fSThDSFSd5fMNMMAze3Srcue8PZkAvQ4vK4ZOi9q16NM1am
 tMvKaM/pvYRH3YFBrLaNO8nbyBKnfowJb8x9PrlIn6i1Ml0tvEOC7RtQ5nOGnW3Irzs4
 KzFaNsUeBbEZUQjPgil3eeS8cpZ232eeFPYadLYu2c5XfpvGgWvWWU9FysNN7Zwa7ba1
 JF5A==
X-Gm-Message-State: AOJu0Yz+L8gGNzxh0+jOuiJRoTYpw/I7AJl8Mn70oiuR3pbRmBAtDzt0
 +8CZWgvfc5F/hTD1GqPckfgOVbQ3R3JhPyrxQK1qer/OZEPr4iqAuM+Cb745D6d+m9845Vkb7VI
 rEZbjGVPfPCq+nbP7Mp7f2NLFoAMN4ozJGOb3
X-Google-Smtp-Source: AGHT+IFidY1918ToJKV5zQDYt2o8Pt8o4Jgxqkv+EWtryxfRlPTUx12y66fAj5fcP/aDl4VpYvf7+BpoW+REVQXX8Vg=
X-Received: by 2002:a92:d6cf:0:b0:376:21d8:3b87 with SMTP id
 e9e14a558f8ab-37998f7f6f4mr9047885ab.9.1719491850556; Thu, 27 Jun 2024
 05:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
 <20240627053452.2908605-3-zack.rusin@broadcom.com>
In-Reply-To: <20240627053452.2908605-3-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Thu, 27 Jun 2024 15:37:19 +0300
Message-ID: <CAKLwHdV98ERFMHB4-e8GZfcAX-GbiJb-Vm=JzYZrkaVoYqP2fg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/vmwgfx: Make sure the screen surface is ref
 counted
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
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

On Thu, Jun 27, 2024 at 8:34=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> Fix races issues in virtual crc generation by making sure the surface
> the code uses for crc computation is properly ref counted.
>
> Crc generation was trying to be too clever by allowing the surfaces
> to go in and out of scope, with the hope of always having some kind
> of screen present. That's not always the code, in particular during
> atomic disable, so to make sure the surface, when present, is not
> being actively destroyed at the same time, hold a reference to it.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 37 +++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_vkms.c
> index 3bfcf671fcd5..c35f7df99977 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> @@ -130,22 +130,26 @@ crc_generate_worker(struct work_struct *work)
>                 return;
>
>         spin_lock_irq(&du->vkms.crc_state_lock);
> -       surf =3D du->vkms.surface;
> +       surf =3D vmw_surface_reference(du->vkms.surface);
>         spin_unlock_irq(&du->vkms.crc_state_lock);
>
> -       if (vmw_surface_sync(vmw, surf)) {
> -               drm_warn(crtc->dev, "CRC worker wasn't able to sync the c=
rc surface!\n");
> -               return;
> +       if (surf) {
> +               if (vmw_surface_sync(vmw, surf)) {
> +                       drm_warn(
> +                               crtc->dev,
> +                               "CRC worker wasn't able to sync the crc s=
urface!\n");
> +                       return;
> +               }
> +
> +               ret =3D compute_crc(crtc, surf, &crc32);
> +               if (ret)
> +                       return;
> +               vmw_surface_unreference(&surf);

So compute_crc effectively never errs here, so the
vmw_surface_unreference is a given, but
wouldn't it correct to have the vmw_surface_unreference precede the
error-check early-out?

>         }
>
> -       ret =3D compute_crc(crtc, surf, &crc32);
> -       if (ret)
> -               return;
> -
>         spin_lock_irq(&du->vkms.crc_state_lock);
>         frame_start =3D du->vkms.frame_start;
>         frame_end =3D du->vkms.frame_end;
> -       crc_pending =3D du->vkms.crc_pending;
>         du->vkms.frame_start =3D 0;
>         du->vkms.frame_end =3D 0;
>         du->vkms.crc_pending =3D false;
> @@ -164,7 +168,7 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
>         struct vmw_display_unit *du =3D container_of(timer, struct vmw_di=
splay_unit, vkms.timer);
>         struct drm_crtc *crtc =3D &du->crtc;
>         struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> -       struct vmw_surface *surf =3D NULL;
> +       bool has_surface =3D false;
>         u64 ret_overrun;
>         bool locked, ret;
>
> @@ -179,10 +183,10 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
>         WARN_ON(!ret);
>         if (!locked)
>                 return HRTIMER_RESTART;
> -       surf =3D du->vkms.surface;
> +       has_surface =3D du->vkms.surface !=3D NULL;
>         vmw_vkms_unlock(crtc);
>
> -       if (du->vkms.crc_enabled && surf) {
> +       if (du->vkms.crc_enabled && has_surface) {
>                 u64 frame =3D drm_crtc_accurate_vblank_count(crtc);
>
>                 spin_lock(&du->vkms.crc_state_lock);
> @@ -336,6 +340,8 @@ vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
>  {
>         struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
>
> +       if (du->vkms.surface)
> +               vmw_surface_unreference(&du->vkms.surface);
>         WARN_ON(work_pending(&du->vkms.crc_generator_work));
>         hrtimer_cancel(&du->vkms.timer);
>  }
> @@ -497,9 +503,12 @@ vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
>         struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
>         struct vmw_private *vmw =3D vmw_priv(crtc->dev);
>
> -       if (vmw->vkms_enabled) {
> +       if (vmw->vkms_enabled && du->vkms.surface !=3D surf) {
>                 WARN_ON(atomic_read(&du->vkms.atomic_lock) !=3D VMW_VKMS_=
LOCK_MODESET);
> -               du->vkms.surface =3D surf;
> +               if (du->vkms.surface)
> +                       vmw_surface_unreference(&du->vkms.surface);
> +               if (surf)
> +                       du->vkms.surface =3D vmw_surface_reference(surf);
>         }
>  }
>
> --
> 2.40.1
>

Otherwise LGTM.
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
