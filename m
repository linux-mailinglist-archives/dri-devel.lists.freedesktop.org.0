Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2E89A485
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 21:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAC110E036;
	Fri,  5 Apr 2024 19:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="R/203oFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B4910E036
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 19:02:35 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-615038fc5baso26835447b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712343754; x=1712948554;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+9F5O8eIKV+7UGcG+VUym1A0vGBsTshQ13opkTXvdA=;
 b=R/203oFVrGYQm4RzMLfYnZVrULQVc8A2TTwgFEWMWJLKi76BQuuzHI/DkYSGoz+nXa
 6O56Tkaz7rjT1NCsK+dnnlfBJC+v76lkJ+tetYdkvT3FvtJUGQNifF2NWW2MUgt71wRm
 XXyBY6SzXziyxDoUCVrhmLo+tu8jhykkZSoGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712343754; x=1712948554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+9F5O8eIKV+7UGcG+VUym1A0vGBsTshQ13opkTXvdA=;
 b=Gh4QdACLxKonx9MUjBh0HKghjXCHE+6XUsIPBvfdpZo6aVqgRkoAYpbmWJXsI4jt/6
 9DRdiR7YZ8yhtWLL/j13fYNSOBB5PRrdzjd3AavrMei/yND0Royqe/OOYR4eJGmdI4UC
 cSgrw8WOPrOClpz3+QzEfzA+UHjhLtXL+9c/uC2QC4T+ITRfANEK46+SUyajow6s4hRI
 wTKToq+/CnDABHpUjZMVte/Wz/BoeVGucu2GXhgqspUDfi867jEFyZ3Y5nhhCRQ55jbk
 aUYCRT5tVDEH+9ZGJuE0XrEAsbezclUU7bLzFYY29aFfslYSOX3O6bBCWfr4hnOIuluc
 2O8A==
X-Gm-Message-State: AOJu0YxNO2eDVVnmuzEAi0fDEKyiZyYonrvzPAg4awkEzocqEJpgKfuU
 7OY7jmdXsIqUIbtC7u7PJo0iJf6+a9USpFFKJcJcxMSNqgwoGulY8dLLLK5LcjoGbBdXG5388QF
 CtDnRwQTNBoL04tqJwcHC/3hbPwVEU8coQsWp
X-Google-Smtp-Source: AGHT+IGD1q3YYuPont2fXr2FhDUReli6hVBqnrTA5X+DWnj57jYGh6Kk36EUxXxCC2IMV/sycWLTuEazqirLbZUNX3c=
X-Received: by 2002:a81:5c87:0:b0:615:184d:275 with SMTP id
 q129-20020a815c87000000b00615184d0275mr1889977ywb.47.1712343754017; Fri, 05
 Apr 2024 12:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-5-zack.rusin@broadcom.com>
In-Reply-To: <20240402232813.2670131-5-zack.rusin@broadcom.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 5 Apr 2024 14:02:25 -0500
Message-ID: <CAO6MGti8duxr3AqWnRCuv2igR=PN4NxoaGnErPxr5hpZzLctEw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: Fix crtc's atomic check conditional
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
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

Makes sense.

Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>

On Tue, Apr 2, 2024 at 6:28=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com>=
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
