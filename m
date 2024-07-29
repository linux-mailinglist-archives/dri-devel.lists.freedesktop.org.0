Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E893FE21
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 21:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFC10E044;
	Mon, 29 Jul 2024 19:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SMXKYgLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A67910E044
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 19:16:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso2077509276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722280608; x=1722885408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0aSdBNepOuMwe3ip16SyZwC9x3sQ/b3cOtgS+xLwo54=;
 b=SMXKYgLp2Yc+kGj82y0mi0+xOcISZQBb3Sf1IdK8VL/C66HJD2oCMFUItqT/FHP7xq
 oXYbWdb8r8W/aO+OXDeqjbU6Pc7zxq5xp0B5PL+USG/SnvdbBY3GNPvxbM8NggxljUc3
 VpXnm4cvXWbCCRbw7/6PaCWRgvezMzJZasrwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722280608; x=1722885408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0aSdBNepOuMwe3ip16SyZwC9x3sQ/b3cOtgS+xLwo54=;
 b=dKujG76+pEKQvz7NHJMiwE+qFSOgODU0/OUPIfx5aMCj0BJ4QVgzt9F38xDxzSiUw+
 +GcVPZIMDNxLOos4vOCGiDN2yyVZVnCJIh7APyI3C3zTehc8r5FaLNPXAGGGZgKpIH48
 H9vsUS3rEFveyyzCJ+9SVNg5g7xCrh/HkZnUgP39MFQ2ikcubOJOKobATOUZhk412dEJ
 PkgmqbNrqzz3JATkvKZyLgLkA9P9/GM+miVuk7pyIjjpsebgUUd8gGDgA2h9ju6w7Evg
 vBYRiqvHj1Y+terRAeIYvU0stNqlNbyVg/kuqlLNa+w8Ol2uVP9oF1ljvRN1DRPnMUJl
 GaQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKf2ROtKg5D24nXG5WkqYe7reIlPgINHG8X17pHuWJnSuaszZTPSojV10CoaPrutKu/gaexHOwr1V9+wlZoA1iP4u25iQVY7eiwlvvGwal
X-Gm-Message-State: AOJu0Ywy1rcPTiKJ73ZFKRATN5rtKOJjUwyfrHZfJNReBtRAF2b764uQ
 sF0AHnsTmIdQhw54PEZT8mClh6IY5coVP83f+hg7iqUKk09LRa/O2ab6y8t26mAsfXhpZ0ciUGl
 i2FbD/eBngVhOnxQMTeZHkaLcgu/3RHxCO3W7
X-Google-Smtp-Source: AGHT+IGnAwXRu4C7Y+PVR0T60A7xON2fH9xIYdK2KzYMvBB0JclqD2TJEFzTtyWNuV59HkwKot/gKomKKo9k8ArfpBI=
X-Received: by 2002:a05:6902:704:b0:e05:fcef:c842 with SMTP id
 3f1490d57ef6-e0b54600502mr7711564276.44.1722280607875; Mon, 29 Jul 2024
 12:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <83d9bb89-1a16-4ca4-80b4-1965fca498c1@stanley.mountain>
In-Reply-To: <83d9bb89-1a16-4ca4-80b4-1965fca498c1@stanley.mountain>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 29 Jul 2024 15:16:37 -0400
Message-ID: <CABQX2QOoq3H=eHdM83_k5vgHiaMu9Zsto=H7S95QHxT-s16jEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

On Sat, Jul 27, 2024 at 1:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The drm_property_create_signed_range() function returns NULL on error,
> it doesn't return error pointers.  Change the IS_ERR() tests to check
> for NULL.
>
> Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_plane.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index a28b22fdd7a4..4fcb5d486de6 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -328,14 +328,14 @@ static int drm_plane_create_hotspot_properties(stru=
ct drm_plane *plane)
>
>         prop_x =3D drm_property_create_signed_range(plane->dev, 0, "HOTSP=
OT_X",
>                                                   INT_MIN, INT_MAX);
> -       if (IS_ERR(prop_x))
> -               return PTR_ERR(prop_x);
> +       if (!prop_x)
> +               return -ENOMEM;
>
>         prop_y =3D drm_property_create_signed_range(plane->dev, 0, "HOTSP=
OT_Y",
>                                                   INT_MIN, INT_MAX);
> -       if (IS_ERR(prop_y)) {
> +       if (!prop_y) {
>                 drm_property_destroy(plane->dev, prop_x);
> -               return PTR_ERR(prop_y);
> +               return -ENOMEM;
>         }
>
>         drm_object_attach_property(&plane->base, prop_x, 0);

Thanks, that looks good to me.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
