Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C944CBD39
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 12:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237AF10E40C;
	Thu,  3 Mar 2022 11:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E5410E40C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 11:58:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C64D1885;
 Thu,  3 Mar 2022 12:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646308703;
 bh=3C6f/ycPKmaoNmqT3yx0OSWwR8z9czYHKLD2+cA2AYs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HcLMrzMg6twNzw8rD492xF5XNVV1mCMsrMN/SEs+LencIyjq2MBgzdsNW/6s3V8p0
 juinAG1e0BwGkteKqRZy/QXaWO13t4W74+0e/TZ84q4sUUkRLIe09O/Bo8DS8fkkK0
 mLgiPFGA1Bwew4vE7dTJHfK0f6SJMLUnXFVzIdgU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221171340.11113-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220221171340.11113-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: Don't select VSP1 sink on Gen3
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Thu, 03 Mar 2022 11:58:21 +0000
Message-ID: <164630870160.3471399.12354976589425521185@Monstersaurus>
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

Quoting Laurent Pinchart (2022-02-21 17:13:39)
> The VSP1 sink selection through register DEFR8 is only available on Gen2
> hardware. Skip it on Gen3.

aha, interesting, and I see how this leads into the second patch.

Looks fine on it's own too though:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_plane.c
> index 862197be1e01..9b058d6cb032 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -549,8 +549,10 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgr=
p,
>                 rcar_du_plane_setup_format(rgrp, (state->hwindex + 1) % 8,
>                                            state);
> =20
> -       if (rcdu->info->gen < 3)
> -               rcar_du_plane_setup_scanout(rgrp, state);
> +       if (rcdu->info->gen >=3D 3)
> +               return;
> +
> +       rcar_du_plane_setup_scanout(rgrp, state);
> =20
>         if (state->source =3D=3D RCAR_DU_PLANE_VSPD1) {
>                 unsigned int vspd1_sink =3D rgrp->index ? 2 : 0;
> --=20
> Regards,
>=20
> Laurent Pinchart
>
