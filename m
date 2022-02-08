Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 769434AD832
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC5E899BE;
	Tue,  8 Feb 2022 12:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18107899BE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 12:16:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30151A04;
 Tue,  8 Feb 2022 13:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644322563;
 bh=/GjjOJT4Zd/yjR14F3vzx2OEgv5DVvS++eiwwIpsgp8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YHcLbg2g9OgWFlm4ZhjhS1A+Ossx/2xqFz2PV6wKWq42D8pMK2doeq4NniO88aIOf
 rePI9uum4QzGdRmApy4oCNCKIYhvKajFZExspZuCsD/oNfr43F00mviLwt3D8DDyl9
 2ADY6LdwbGUrkCGd34Up29KYNbTJ2WROrvPfxals=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220207163515.1038648-17-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-17-maxime@cerno.tech>
Subject: Re: [PATCH 16/23] drm/rcar: plane: Remove redundant zpos
 initialisation
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>
Date: Tue, 08 Feb 2022 12:16:00 +0000
Message-ID: <164432256019.2921404.17702222253648308632@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-02-07 16:35:08)
> The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
>=20
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.

Sounds helpful ;-)

> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_plane.c
> index 862197be1e01..9dda5e06457d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -696,7 +696,6 @@ static void rcar_du_plane_reset(struct drm_plane *pla=
ne)
>         state->hwindex =3D -1;
>         state->source =3D RCAR_DU_PLANE_MEMORY;
>         state->colorkey =3D RCAR_DU_COLORKEY_NONE;
> -       state->state.zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY ?=
 0 : 1;
>  }
> =20
>  static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar=
-du/rcar_du_vsp.c
> index b7fc5b069cbc..719c60034952 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -362,7 +362,6 @@ static void rcar_du_vsp_plane_reset(struct drm_plane =
*plane)
>                 return;
> =20
>         __drm_atomic_helper_plane_reset(plane, &state->state);
> -       state->state.zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY ?=
 0 : 1;
>  }
> =20
>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs =3D {
> --=20
> 2.34.1
>
