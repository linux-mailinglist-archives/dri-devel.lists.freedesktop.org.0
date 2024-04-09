Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7098989DE2E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633D112D76;
	Tue,  9 Apr 2024 15:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="TErLucOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516C811296E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:12:24 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6ea1189de94so1817316a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712675543; x=1713280343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkgbrKSauyCf/3PInxYz8jAVnMgt0m3ACMNsW0viOZ8=;
 b=TErLucOKqz/l9iYe3SxQnKqUNQAWkCo2VOyUYjwKWJzi2DGtlwCf2XX1fD7DAH/Mrx
 sUoaP07585g73ZkNVoAlkQ9nIi32IWV28gPxZiiLg1vvghcH1cL5UJFcGwpqmNhjsRSL
 tpNKU1udVAWLTWZWN/2fd8U/TXbRLnmNLWVZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712675543; x=1713280343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkgbrKSauyCf/3PInxYz8jAVnMgt0m3ACMNsW0viOZ8=;
 b=gofbc3v4vXN0+XajC78CUsViRcG82PD0JMjFDd4T2CEXHQLGJVduDPyGws6zNfsAnb
 ooAQwH7WfFSaduL3BTGUBh0AjPZJUuQwO1wl993Ddc9Pjocw14DsNGDTMRpJfyUvt/86
 1erZng5aYiPAheBFkaqh/mjdte8G8stRJe0yKffo2MTrT4m+7+Wsl3Y/WRuDR/WS9RMQ
 H+7TltzakCf1w2c0+nwmp2hr+Hv+l8p383nO8dKeEtO8PjolqRAQpoBE259zZBU1zms2
 sjYj1VrvjHy9naK3QV517hjcNha1vF2R3JRosB70rR2jWcWniSQ6Z6ElB8kLycJR+uOZ
 N+Gw==
X-Gm-Message-State: AOJu0YzM54yEOAeNHvGwhGqy7cr6L9R3GT3i4o4cXcc9e4lS65dPxTQ3
 +qu2eBuYm63oR8aXt22RxlN4Mw8IX6WLzSedMKD00PqRvFsHYXGTtKD6IwR5wop5Ak82tw+fCWl
 Go/3bPN5ip706ClYcWA+Vknf66uF/53H25weH
X-Google-Smtp-Source: AGHT+IECKU1EPnNzb6lDQEeMoJ4Wz9rQUce2PyviuJOfmoaRaDNhK6tPPDrV21C7KSRv5dYJyZugNQnzC08W1FGtU3M=
X-Received: by 2002:a05:6808:219:b0:3c5:f87b:684 with SMTP id
 l25-20020a056808021900b003c5f87b0684mr4495529oie.15.1712675543217; Tue, 09
 Apr 2024 08:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-5-zack.rusin@broadcom.com>
In-Reply-To: <20240402232813.2670131-5-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Tue, 9 Apr 2024 18:12:11 +0300
Message-ID: <CAKLwHdVWS4sVQuoi7MUzZVMQiGniOkAfApbWj__TjL9EJqi4EQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: Fix crtc's atomic check conditional
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

On Wed, Apr 3, 2024 at 2:28=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> The conditional was supposed to prevent enabling of a crtc state
> without a set primary plane. Accidently it also prevented disabling
> crtc state with a set primary plane. Neither is correct.
>
> Fix the conditional and just driver-warn when a crtc state has been
> enabled without a primary plane which will help debug broken userspace.
>
> Fixes IGT's kms_atomic_interruptible and kms_atomic_transition tests.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 06ec41909e31 ("drm/vmwgfx: Add and connect CRTC helper functions")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.12+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index e33e5993d8fc..13b2820cae51 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -931,6 +931,7 @@ int vmw_du_cursor_plane_atomic_check(struct drm_plane=
 *plane,
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
>                              struct drm_atomic_state *state)
>  {
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
>         struct drm_crtc_state *new_state =3D drm_atomic_get_new_crtc_stat=
e(state,
>                                                                          =
crtc);
>         struct vmw_display_unit *du =3D vmw_crtc_to_du(new_state->crtc);
> @@ -938,9 +939,13 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
>         bool has_primary =3D new_state->plane_mask &
>                            drm_plane_mask(crtc->primary);
>
> -       /* We always want to have an active plane with an active CRTC */
> -       if (has_primary !=3D new_state->enable)
> -               return -EINVAL;
> +       /*
> +        * This is fine in general, but broken userspace might expect
> +        * some actual rendering so give a clue as why it's blank.
> +        */
> +       if (new_state->enable && !has_primary)
> +               drm_dbg_driver(&vmw->drm,
> +                              "CRTC without a primary plane will be blan=
k.\n");
>
>
>         if (new_state->connector_mask !=3D connector_mask &&
> --
> 2.40.1
>

LGTM!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
