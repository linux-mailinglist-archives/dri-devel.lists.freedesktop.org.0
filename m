Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E87B14252
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 21:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E1910E579;
	Mon, 28 Jul 2025 19:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z2A6LA4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0629D10E115;
 Mon, 28 Jul 2025 19:00:04 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-31305ee3281so832214a91.0; 
 Mon, 28 Jul 2025 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753729203; x=1754334003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=792xtkrYp7OZUy5hQGv4RxDDeHC0XpoWykXKX6CRRTw=;
 b=Z2A6LA4pg1sZ0ah8o2SQPCxngkvvrTi1rh8K256DdTE2CpI4rx6yc4LBG3VIXvbJeh
 sUmljSJ6iqTthr52igtnZvVvElEhqQ7u9ZxKcrTUO5hwU0BNZ5XKLF6l7gjJpgzzaclx
 irNYG1+wNKkOEo2IMVwW0XJ1Al/bddbLinYml424zhEvGxbFDzXkfkOCcFC6PgFThg+x
 g8CPFmwhLeki4tiTu/v19UyDSa83tn56+t3yzXTzCukO+OKwvLLzR5aTxZYnqsmzy91w
 15ReX7UqtRoswh3JP+5KDFJ1rP4g+b4JJILvMzSeDPBCZ/2MAfh2p0fqPZu3WuQRo4Pn
 GwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753729203; x=1754334003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=792xtkrYp7OZUy5hQGv4RxDDeHC0XpoWykXKX6CRRTw=;
 b=aJoTU2rKNP6tvL1N6/BdXzWSGUwK048G+74MJVx4Wiv6pDbWlJjAfOMkIeNCK92C9Q
 zxHw/107UpDAveMxbIy/vWmW2TqdQMQ7zTC3oZSiOuzn7RWLEpTfBmpcnCcfj5XTawLZ
 9M5RihUFJVdSvT/ldXMTWACZi+0YQqHEo3RYldJgiez87sRtxFVy2YXO0GEVAVPO/KXL
 Tt7SdkW0WeMveO5RyFC8u8jb5qIi0LNuMv5YSRzYoHlozs6cLxB1X/u+TaNqLsteJgGq
 +GahPkX6uHF5wmDCmoaDgHIHG35XlFF1r6TvF4q0+rG8f9+nWYYUwB2W4RLywrEf9+Xx
 Cu7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQzuNRNOfS6hF4Nd7N7C7sVN/t+LXcRB8QktDLNMw1ssSbcXrjWBF0EViJUU1sFtbolLMWO01i7qd7@lists.freedesktop.org,
 AJvYcCXbjnam30Y8htkIZryWb4Kqa5uNs8rbO/ZPdAzYYDoomCOmskxcPQidN1QLdCqBL+iFAZSVFePp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3OxEvAIJPy8xHKyckHG9ftTP5YeytfLwO+9/w2VppgiQ90Uq1
 H89rcl2bpZkTv0qVKu1jZ1pa51Pttlfw3Nt7BT9QsU4boxcdMnB5Ha1tpcOihxtrfeoPEX6X/Y8
 Fx0eWDVNLYcmTzagV6F9WF0nRlL1KyXx4gonZ
X-Gm-Gg: ASbGncsqo/bvGGAT1PsT2cGmdnbAHAC4/p9q9GmXQ6A9b7fRPz9vl1IuI7dP7NNMhnz
 QSjOwBYsJkoNbEZPEr9uNmtJmPCygax3yUoLNeRG2bUScuSFahVIf7lzzAyBgtqP3YqxIyaQdKa
 tTXywQ08RVq/BSHP2ubv2R0eGkuoQZZ2BgzLOlNuPcmBMKoEOuOPwXKm/pXHRQe660G5+yP3v77
 b3ZGHMqeLMoYIuuTm0=
X-Google-Smtp-Source: AGHT+IGFm3moI3UuhrPTIo1Lg58c/ZD/U793M1bbpvRAWpy2YY8+vOgaFI1Lrsirg0q20qYXKUVFwMXxGu8l1wBJu9g=
X-Received: by 2002:a17:90b:1643:b0:31e:ff94:3fae with SMTP id
 98e67ed59e1d1-31eff94428emr2178709a91.4.1753729203370; Mon, 28 Jul 2025
 12:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250723150413.18445-1-xaver.hugl@kde.org>
In-Reply-To: <20250723150413.18445-1-xaver.hugl@kde.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Jul 2025 14:59:50 -0400
X-Gm-Features: Ac12FXyXoO8sn11pncGgTJJepQEbvDB4NsJQnmXugnEIJgJSm8HaW80pExvCIns
Message-ID: <CADnq5_PPr0_1WRQyETishNFk1EAYWLxa3YAQb4iMukJeB6tdNw@mail.gmail.com>
Subject: Re: [PATCH] drm: don't run atomic_async_check for disabled planes
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, andrealmeid@igalia.com, chris@kode54.net, 
 naveen1.kumar@intel.com, ville.syrjala@linux.intel.com, mdaenzer@redhat.com,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
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

On Wed, Jul 23, 2025 at 11:08=E2=80=AFAM Xaver Hugl <xaver.hugl@kde.org> wr=
ote:
>
> It's entirely valid and correct for compositors to include disabled
> planes in the atomic commit, and doing that should not prevent async
> flips from working. To fix that, this commit skips the async checks
> if the plane was and still is not visible.
>
> Fixes: fd40a63c drm/atomic: Let drivers decide which planes to async flip

This should be:
Fixes: fd40a63c63a1 ("drm/atomic: Let drivers decide which planes to
async flip")

> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263
>
> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index c2726af6698e..2e62561fd94d 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1066,6 +1066,7 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>         }
>         case DRM_MODE_OBJECT_PLANE: {
>                 struct drm_plane *plane =3D obj_to_plane(obj);
> +               struct drm_plane_state *old_plane_state;
>                 struct drm_plane_state *plane_state;
>                 struct drm_mode_config *config =3D &plane->dev->mode_conf=
ig;
>                 const struct drm_plane_helper_funcs *plane_funcs =3D plan=
e->helper_private;
> @@ -1086,8 +1087,15 @@ int drm_atomic_set_property(struct drm_atomic_stat=
e *state,
>                                 ret =3D drm_atomic_check_prop_changes(ret=
, old_val, prop_value, prop);
>                         }
>
> +                       old_plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
> +                       if (IS_ERR(old_plane_state)) {
> +                               ret =3D PTR_ERR(plane_state);
> +                               break;
> +                       }
> +
>                         /* ask the driver if this non-primary plane is su=
pported */
> -                       if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> +                       if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY &&
> +                                       (plane_state->visible || old_plan=
e_state->visible)) {
>                                 ret =3D -EINVAL;
>
>                                 if (plane_funcs && plane_funcs->atomic_as=
ync_check)
> --
> 2.50.1
>
