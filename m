Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E391B5D4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 06:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EDA10E532;
	Fri, 28 Jun 2024 04:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="edX93eZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF7610E532
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 04:54:25 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-df4d5d0b8d0so154928276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719550464; x=1720155264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezxMtq5HuDjbK/JO7dm70NKoXN2tLtLjvvKClS4xB28=;
 b=edX93eZ2uwb3Yw30FKRi6St4iMNE8WF++nCKCeeVIWfJ7Ya7j8RyX/gYCELF8LF5o0
 Y/eXNeNtiyoKJxajg9U6W0xVGno1h6FbSgIFcli4fzDkOLeKwMbbtBUTDAf6bfBccZQq
 XK69ftyfPx58QM42s676JdODyfDJNl6AIZYNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719550464; x=1720155264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezxMtq5HuDjbK/JO7dm70NKoXN2tLtLjvvKClS4xB28=;
 b=YZJlR84L3fQPN3JpjAtpBKFGx7rYX7dcTBVc+Z9C6+ri3TVZpyHcBHhA4fEGcbhH9V
 v7/n2JgMphNUrXtwEs9jKcT9Lw/eC2GpCQG32OanoYw1PPba4Ch0/4g7LVXn1MQd18Yp
 l4qEm2Wq2pgle78JcafRGNgv+hMDsDCgIOjzicbKEb8WnsgmYUtinu7+Fq0r8sg/p/4q
 61btEm8EQvY5L9MD3CUPc/JVi+CP7dvAUxmc8RP6XdtrP21GxkoNk/vHYu3o2RFD86Kb
 XP5PRy85VdNkodphWZ7pWvAJIhfzrz0RFXiYyG+edCVgI0YJyuZ0UEOpSHd38kwLUO6M
 zZ5A==
X-Gm-Message-State: AOJu0YwFFSYJCyQPIodLiyqNOsNEgDjm1W7qx3kHpy7PWK0kNFnY8q9P
 1R2J00PWiDngZundTae6OQxL6w33n6P0icj+QfjBtGbnc05gqmrYSy/g3dpANdzNDEv0EYG1Dtl
 K9hkMhfDZhCfsdV66ALAC5fImweuk0Q4XITr2
X-Google-Smtp-Source: AGHT+IE8DzCVUsv2l1DpNmgzbVVX/JNs3P+BpVA3NTBCBvqs1RmTi3iEnxhJW1b7cHlX6kBCUuiF5KB7LLVU0ITJl38=
X-Received: by 2002:a25:bf92:0:b0:dfb:912:970f with SMTP id
 3f1490d57ef6-e03040188e8mr13620749276.63.1719550464093; Thu, 27 Jun 2024
 21:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
 <20240627053452.2908605-3-zack.rusin@broadcom.com>
 <CAKLwHdV98ERFMHB4-e8GZfcAX-GbiJb-Vm=JzYZrkaVoYqP2fg@mail.gmail.com>
In-Reply-To: <CAKLwHdV98ERFMHB4-e8GZfcAX-GbiJb-Vm=JzYZrkaVoYqP2fg@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 28 Jun 2024 00:54:13 -0400
Message-ID: <CABQX2QNvSTpKY+9+7hAsqWq3Kd5_eeagjh+fLNujrM69TaO9DQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/vmwgfx: Make sure the screen surface is ref
 counted
To: Martin Krastev <martin.krastev@broadcom.com>
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

On Thu, Jun 27, 2024 at 8:37=E2=80=AFAM Martin Krastev
<martin.krastev@broadcom.com> wrote:
>
> On Thu, Jun 27, 2024 at 8:34=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.c=
om> wrote:
> >
> > Fix races issues in virtual crc generation by making sure the surface
> > the code uses for crc computation is properly ref counted.
> >
> > Crc generation was trying to be too clever by allowing the surfaces
> > to go in and out of scope, with the hope of always having some kind
> > of screen present. That's not always the code, in particular during
> > atomic disable, so to make sure the surface, when present, is not
> > being actively destroyed at the same time, hold a reference to it.
> >
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
> > Cc: Zack Rusin <zack.rusin@broadcom.com>
> > Cc: Martin Krastev <martin.krastev@broadcom.com>
> > Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broa=
dcom.com>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 37 +++++++++++++++++-----------
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmw=
gfx/vmwgfx_vkms.c
> > index 3bfcf671fcd5..c35f7df99977 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> > @@ -130,22 +130,26 @@ crc_generate_worker(struct work_struct *work)
> >                 return;
> >
> >         spin_lock_irq(&du->vkms.crc_state_lock);
> > -       surf =3D du->vkms.surface;
> > +       surf =3D vmw_surface_reference(du->vkms.surface);
> >         spin_unlock_irq(&du->vkms.crc_state_lock);
> >
> > -       if (vmw_surface_sync(vmw, surf)) {
> > -               drm_warn(crtc->dev, "CRC worker wasn't able to sync the=
 crc surface!\n");
> > -               return;
> > +       if (surf) {
> > +               if (vmw_surface_sync(vmw, surf)) {
> > +                       drm_warn(
> > +                               crtc->dev,
> > +                               "CRC worker wasn't able to sync the crc=
 surface!\n");
> > +                       return;
> > +               }
> > +
> > +               ret =3D compute_crc(crtc, surf, &crc32);
> > +               if (ret)
> > +                       return;
> > +               vmw_surface_unreference(&surf);
>
> So compute_crc effectively never errs here, so the
> vmw_surface_unreference is a given, but
> wouldn't it correct to have the vmw_surface_unreference precede the
> error-check early-out?

Yes, good catch on both counts. I'll just make compute_crc return void
in v2 instead of unconditionally returning 0, this way we won't have
to deal with multiple unref paths.
z
