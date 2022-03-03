Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231104CBD40
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 13:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9B810E954;
	Thu,  3 Mar 2022 12:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B34F10E89C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 12:00:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4C8B1027;
 Thu,  3 Mar 2022 13:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646308819;
 bh=LINoj1eRyRokNcOfj+X8FwRZsCXkdmmejy92Uas5GdU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XDlkPf2KEpwYZpqnf7PS1Sg7y3BoTKE/Tl+epDasitGYnUsLafWqHupcmeniWzw5z
 0kWWg5M2EnhW0VVXS/J+UpTfnLLj+W0rMfRBHTzjCFkHlipmbEhkWjAnmCZuO9/VLB
 sJGS8Qs21XV0ZIeQkXuzYNzJZqfGGgMMv16y1spQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221171340.11113-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220221171340.11113-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm: rcar-du: Don't restart group when enabling plane
 on Gen3
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Thu, 03 Mar 2022 12:00:17 +0000
Message-ID: <164630881737.3471399.5762223685912960284@Monstersaurus>
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
Cc: linux-renesas-soc@vger.kernel.org, Michael Rodin <mrodin@de.adit-jv.com>,
 efriedrich@de.adit-jv.com, michael@rodin.online, erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2022-02-21 17:13:40)
> On Gen3 hardware enabling a VSP plane doesn't change any register that
> requires DRES to take effect. Avoid a group restart in that case.

This also makes it clear that the need_restart is due to the change
occuring in the VSP1 sink, so I think this is cleaner all round.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 9 ---------
>  2 files changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_plane.c
> index 9b058d6cb032..22aeeb1cc1fb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -560,6 +560,12 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgr=
p,
>                 if (rcdu->vspd1_sink !=3D vspd1_sink) {
>                         rcdu->vspd1_sink =3D vspd1_sink;
>                         rcar_du_set_dpad0_vsp1_routing(rcdu);
> +
> +                       /*
> +                        * Changes to the VSP1 sink take effect on DRES a=
nd thus
> +                        * need a restart of the group.
> +                        */
> +                       rgrp->need_restart =3D true;
>                 }
>         }
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar=
-du/rcar_du_vsp.c
> index b7fc5b069cbc..32530d698e75 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -84,15 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
> =20
>         __rcar_du_plane_setup(crtc->group, &state);
> =20
> -       /*
> -        * Ensure that the plane source configuration takes effect by req=
uesting
> -        * a restart of the group. See rcar_du_plane_atomic_update() for =
a more
> -        * detailed explanation.
> -        *
> -        * TODO: Check whether this is still needed on Gen3.
> -        */
> -       crtc->group->need_restart =3D true;
> -
>         vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
>  }
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
