Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE04BF899
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 13:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0062E10E4DA;
	Tue, 22 Feb 2022 12:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C859910E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 12:58:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D96F947F;
 Tue, 22 Feb 2022 13:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645534706;
 bh=uyI6fBbnCcdbca0OxsRFPqFypbYQeCHfBNrj8xa2Lgs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JG5stwn/09mSbJWAulrJJDHerbjBguLsHRBG5HjkBpfi17uEKzpoRaFs+HV2dzmiM
 d0JBCctbarGL2RxoaObSz9fJ98RtVMaWxDhhctr0ngz3UzhwrEMtlcYBhIXn7X9bsG
 4cV8GVwWNKOK+Cl9Crh95qWuwo6lB4SKEVzUvP68=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211129222813.28079-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211129222813.28079-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix CRTC timings when CMM is used
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 22 Feb 2022 12:58:25 +0000
Message-ID: <164553470517.3548538.7871098986791576958@Monstersaurus>
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-11-29 22:28:13)
> When the CMM is enabled, an offset of 25 pixels must be subtracted from
> the HDS (horizontal display start) and HDE (horizontal display end)
> registers. Fix the timings calculation, and take this into account in
> the mode validation.
>=20
> This fixes a visible horizontal offset in the image with VGA monitors.
> HDMI monitors seem to be generally more tolerant to incorrect timings,
> but may be affected too.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rca=
r-du/rcar_du_crtc.c
> index 5672830ca184..ee6ba74627a2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -215,6 +215,7 @@ static void rcar_du_crtc_set_display_timing(struct rc=
ar_du_crtc *rcrtc)
>         const struct drm_display_mode *mode =3D &rcrtc->crtc.state->adjus=
ted_mode;
>         struct rcar_du_device *rcdu =3D rcrtc->dev;
>         unsigned long mode_clock =3D mode->clock * 1000;
> +       unsigned int hdse_offset;
>         u32 dsmr;
>         u32 escr;
> =20
> @@ -298,10 +299,15 @@ static void rcar_du_crtc_set_display_timing(struct =
rcar_du_crtc *rcrtc)
>              | DSMR_DIPM_DISP | DSMR_CSPM;
>         rcar_du_crtc_write(rcrtc, DSMR, dsmr);
> =20

This looks like the kind of place that could do with a comment
explaining what is going on.

> +       hdse_offset =3D 19;
> +       if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
> +               hdse_offset +=3D 25;
> +
>         /* Display timings */
> -       rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start =
- 19);
> +       rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start -
> +                                       hdse_offset);
>         rcar_du_crtc_write(rcrtc, HDER, mode->htotal - mode->hsync_start +
> -                                       mode->hdisplay - 19);
> +                                       mode->hdisplay - hdse_offset);
>         rcar_du_crtc_write(rcrtc, HSWR, mode->hsync_end -
>                                         mode->hsync_start - 1);
>         rcar_du_crtc_write(rcrtc, HCR,  mode->htotal - 1);
> @@ -836,6 +842,7 @@ rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
>         struct rcar_du_crtc *rcrtc =3D to_rcar_crtc(crtc);
>         struct rcar_du_device *rcdu =3D rcrtc->dev;
>         bool interlaced =3D mode->flags & DRM_MODE_FLAG_INTERLACE;
> +       unsigned int min_sync_porch;
>         unsigned int vbp;
> =20
>         if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
> @@ -843,9 +850,14 @@ rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
> =20
>         /*
>          * The hardware requires a minimum combined horizontal sync and b=
ack
> -        * porch of 20 pixels and a minimum vertical back porch of 3 line=
s.
> +        * porch of 20 pixels (when CMM isn't used) or 45 pixels (when CM=
M is
> +        * used), and a minimum vertical back porch of 3 lines.
>          */
> -       if (mode->htotal - mode->hsync_start < 20)
> +       min_sync_porch =3D 20;
> +       if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
> +               min_sync_porch +=3D 25;
> +
> +       if (mode->htotal - mode->hsync_start < min_sync_porch)
>                 return MODE_HBLANK_NARROW;

Is the '19' in the hdse offset, this min_sync_port - 1 for position
correction? It looks something like that. And the rest seems ok.

With or without the additional optional comment suggestion above:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> =20
>         vbp =3D (mode->vtotal - mode->vsync_end) / (interlaced ? 2 : 1);
>=20
> base-commit: c18c8891111bb5e014e144716044991112f16833
> prerequisite-patch-id: dc9121a1b85ea05bf3eae2b0ac2168d47101ee87
> --=20
> Regards,
>=20
> Laurent Pinchart
>
