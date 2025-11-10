Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC59C44C4C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 03:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A2310E290;
	Mon, 10 Nov 2025 02:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JKG0pyfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3664A10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 02:25:02 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-9371f7571cfso551038241.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 18:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762741501; x=1763346301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=;
 b=JKG0pyfxY8Q06SRJD+TUwnBaeMI492OlPlRiLfFOaDN/n5pu+N25uexDONs+zk55XE
 WdJo/JjCOf8XoRjRocrfVlMp9OrNVK0pm4vL40wCtgfFwPL9/RTih6jwmQ4WoZdpnL+K
 iA8W1zwA9Zo6jzBvQyTjZ7/ntTuDzg+On6yBgmlutJzy30YwlLoDdktQHLBjaoj17oJi
 kRNUoKjLrZFxDar6CRputO9XWdQEqvlOncTcL1Vv8GJmFymVt27uBnyhtjNZBh2VZXsK
 qe4GjEPhs0i78wf6dkIgFUaH+Y2/wGjPl8a3QBvzSVcN1a+kBhEUnlJr5aEYB/YEWL1X
 qGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762741501; x=1763346301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=;
 b=PBsckURi6WTeImAE1xctXzuSG8bENyTO1rZvGeIKyRqzKizMT2c1yRxJlrr+Q1LbTN
 6jvlItHZW4bvL4228SwMUlJ5oNA0FGCV9wwQL4KAVt9eXyFzpaCWJfPOPPr26+yFw7wv
 3AJMCM/T2Wz/0yK2KrzvgkTd1kd0aBnPO5Gksp42UoySef0PVjwN3NrAALr0oOkRlgxJ
 CNnuPhwMQQXSYhI5VwMwojpP/pgWprv8JrHeDZSCgj3wNNeFDLyGTo6qfrtghrAnzWcA
 bj5Vy4BogBNQUOzWHFC4ac5gjeoNFBM6m83aw/iKvX3m9QHsTs9P7KRhjg6JOZNtcY3v
 MNWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKH0qoXQyzjneD7dwuhi7OWsoqfC7DO1ekF2gzSwX1+Zqxlw3+xAKlRwXsVeUsNDGXI4c8WDvK1HM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcPSJ7I5XVr2SZmimHgxPPs5ZoKsfBJgNGmbsXZTQqC7ge2bGr
 FS9eIgcbtXby0pO1IJhzHr8R86w+VwKbHoGyq6fn/D3fSc76IszEoWSHqpo11bv27+mFUGAkarx
 sU6L1Ft4akXw6fatAU3c3aInWwEsVtGw=
X-Gm-Gg: ASbGncuIaD4FqpTytVoYDsTp2I4LqZ+biF4OMNxiUrSL7MjV8Va6wr16JpA2p31lfu6
 MOs5lKlTfLMNoRMivLardQQJ0gC722EfM8vf/sv+lVE+4fhUVMc9bMvfMQo/CbFgcW5xbq6qryR
 lnkaG7fCB0eIUwSOs59vc6jeiQNy4x67s+1yPc+CTek1hEgu3aMK4T/gHXuxFhkzUL3+tyllY3c
 LysX79AHJJmhRGOrfCegR2QetRlGh4WPL3phZ/nUgZHbjuiryhGWtaM5DY/5LjBHj+i2Q==
X-Google-Smtp-Source: AGHT+IF2EMlurBzuMt0qOjdQBCv2IFE0TWGHtCo4RfIbED7bE2bHbiRvxWtYQJUkcmfpI0qEQHMqGsLRQb6EJAlUMEM=
X-Received: by 2002:a05:6102:2ac7:b0:5db:fb4c:3a8f with SMTP id
 ada2fe7eead31-5ddc485e4edmr2017252137.39.1762741501079; Sun, 09 Nov 2025
 18:25:01 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 11:24:23 +0900
X-Gm-Features: AWmQ_bnpaBAd4D4AdmA6qBIjSKlXa89V9KyU_fLfaAFw_TI3ApflT_I8g0W-s48
Message-ID: <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

Thanks for contribution,

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:29, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Some configurations require additional actions when all windows are
> disabled to keep DECON operating correctly. Programming a zero-sized wind=
ow
> in ->atomic_update() leaves the plane logically enabled and can bypass
> those disable semantics.
>
> Treat a fully off-screen plane as not visible and take the explicit disab=
le
> path.
>
> Implementation details:
> - exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mark
>   state->visible =3D false and return early.
> - exynos_plane_atomic_check(): if !visible, skip further checks and
>   return 0.
> - exynos_plane_atomic_update(): if !visible, call ->disable_plane();
>   otherwise call ->update_plane().
>
> No functional change for visible planes; off-screen planes are now cleanl=
y
> disabled, ensuring the disable hooks run consistently.
>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 7c3aa77186d3..842974154d79 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct exynos_drm_pl=
ane_state *exynos_state)
>         actual_w =3D exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay=
);
>         actual_h =3D exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay=
);
>
> +       if (!actual_w || !actual_h) {
> +               state->visible =3D false;

The state->visible field in the DRM atomic framework is set to true
only when the following conditions are met:
- Both state->crtc and state->fb are present (having only one of them
results in an error).
- src_w/src_h and crtc_w/crtc_h are non-zero.
- The source rectangle does not exceed the framebuffer bounds (e.g.,
src_x + src_w <=3D fb->width).
- Rotation and clipping checks pass successfully.

However, this patch modifies the state->visible value within
vendor-specific code. Doing so can be problematic because it overrides
a field that is managed by the DRM atomic framework. Even if it
currently works, it may lead to unexpected behavior in the future.

For example, if the DRM atomic framework sets visible =3D true after
validating the above conditions and begins processing certain logic,
but the vendor driver later changes it to false, the framework may
still assume the variable remains true, resulting in inconsistent
states.

Turning off a plane when it doesn=E2=80=99t need to be displayed is a good
idea I think. You might consider contributing this behavior upstream
so it can be properly handled within the DRM atomic framework itself.

Thanks,
Inki Dae

> +               return;
> +       }
> +
>         if (crtc_x < 0) {
>                 if (actual_w)
>                         src_x +=3D ((-crtc_x) * exynos_state->h_ratio) >>=
 16;
> @@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struct drm_plane=
 *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> +       if (!new_plane_state->visible)
> +               return 0;
> +
>         ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
>         if (ret)
>                 return ret;
> @@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct drm_pl=
ane *plane,
>         if (!new_state->crtc)
>                 return;
>
> -       if (exynos_crtc->ops->update_plane)
> +       if (new_state->visible && exynos_crtc->ops->update_plane)
>                 exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane)=
;
> +       else if (exynos_crtc->ops->disable_plane)
> +               exynos_crtc->ops->disable_plane(exynos_crtc, exynos_plane=
);
>  }
>
>  static void exynos_plane_atomic_disable(struct drm_plane *plane,
> --
> 2.34.1
>
>
