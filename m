Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E0DA0BF90
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 19:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEADF10E77F;
	Mon, 13 Jan 2025 18:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="FObDngWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDFF10E780
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736791716; x=1737050916;
 bh=FfBgOmNfQPC+tl/cV9rGq9cV65PoWh1uMa1V3V+L/DY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=FObDngWY/DMHtfCCSJyQOYj5AIQcYZPD3nSSvbKIsBnnYqvoulY389ufnGvR7dWXg
 YU8bzGWMZ6AoS1ScsluFBWz5N2mS8uc3JNSB0YwFf6ogn8k68YOoi/vH4C5DbcBw3h
 +hcpMeI5aMJihlYl4wKxHhmU+KXq1rK4Ptr0k1QXP3YWFWkw5NhINC/RR1FSJiLVFY
 UlRSzTL+VubZUYR+tMGroyCiRwOZET27/ldAWBVmdnWbAxJPTupHi2TXLD2SxYnQTk
 l/0Y/M6vhpgaaVIPxuqzI0xkTkuulhnsKlORLPsDl4ZqbEmyaSFUHwGRtZIHAZWNG2
 Su/xh7Pyqx0Gg==
Date: Mon, 13 Jan 2025 18:08:30 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 12/45] drm/plane: Add COLOR PIPELINE property
Message-ID: <q-fYAOq_DOAPI26SCzlowl13g2bPey2xHgeQt_KXXQbgy1E8bEs0mEo4CuoiLEcEi_GCvZa_Xew437XEsMfhqJvjSK5AhgatnACVNym1mhk=@emersion.fr>
In-Reply-To: <20241220043410.416867-13-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-13-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 876d45e4d8a0dcefe09c9b62fbddb24f6e564bcd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

> +int
> +drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
> +=09=09=09=09 struct drm_plane *plane)
> +{
> +=09struct drm_colorop *colorop;
> +=09struct drm_colorop_state *colorop_state;
> +
> +=09WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
> +
> +=09drm_dbg_atomic(plane->dev,
> +=09=09       "Adding all current colorops for [plane:%d:%s] to %p\n",
> +=09=09       plane->base.id, plane->name, state);

Nit: we use upper-case "[PLANE:%d:%s]" when pretty-printing.

> +#define MAX_COLOR_PIPELINES 5

Is this kind of arbitrary, or is there a real reason behind this?

This is not strictly the max number of color pipelines, since a driver can
create more. This is the max number of choices for the COLOR_PIPELINE prope=
rty.
Should this be renamed to e.g. MAX_COLOR_PIPLINE_PROP_ENTRIES?

> +/**
> + * drm_plane_create_color_pipeline_property - create a new color pipelin=
e
> + * property
> + *
> + * @plane: drm plane
> + * @pipelines: list of pipelines
> + * @num_pipelines: number of pipelines
> + *
> + * Create the COLOR_PIPELINE plane property to specific color pipelines =
on
> + * the plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
> +=09=09=09=09=09     struct drm_prop_enum_list *pipelines,

Nit: this argument can be const.

> +=09=09=09=09=09     int num_pipelines)
> +{
> +=09struct drm_prop_enum_list all_pipelines[MAX_COLOR_PIPELINES];
> +=09int len =3D 0;
> +=09int i;
> +=09struct drm_property *prop;
> +
> +=09if (num_pipelines > (MAX_COLOR_PIPELINES - 1))
> +=09=09return -EINVAL;

Probably this should be a drm_WARN_ON?
