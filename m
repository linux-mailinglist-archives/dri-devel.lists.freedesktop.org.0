Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4D664976
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D28310E134;
	Tue, 10 Jan 2023 18:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A63610E134
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 18:21:52 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pFJFu-0004H9-Ju; Tue, 10 Jan 2023 19:21:50 +0100
Message-ID: <b26742b98dfaf06e49426f36cd62f7f6dfa611db.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: reuse local variable height in
 atomic_update
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Date: Tue, 10 Jan 2023 19:21:49 +0100
In-Reply-To: <20221220094430.3469811-1-p.zabel@pengutronix.de>
References: <20221220094430.3469811-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 20.12.2022 um 10:44 +0100 schrieb Philipp Zabel:
> Use the already existing local variable height =3D drm_rect_height() >> 1=
6
> to replace other occurrences of the same value.
>=20
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/im=
x/ipuv3/ipuv3-plane.c
> index 80142d9a4a55..dade8b59feae 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> @@ -618,6 +618,7 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  		width =3D ipu_src_rect_width(new_state);
>  	else
>  		width =3D drm_rect_width(&new_state->src) >> 16;
> +	height =3D drm_rect_height(&new_state->src) >> 16;
> =20
>  	eba =3D drm_plane_state_to_eba(new_state, 0);
> =20
> @@ -628,9 +629,9 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  	if (ipu_state->use_pre) {
>  		axi_id =3D ipu_chan_assign_axi_id(ipu_plane->dma);
>  		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
> -					  drm_rect_height(&new_state->src) >> 16,
> -					  fb->pitches[0], fb->format->format,
> -					  fb->modifier, &eba);
> +					  height, fb->pitches[0],
> +					  fb->format->format, fb->modifier,
> +					  &eba);
>  	}
> =20
>  	if (!old_state->fb ||
> @@ -684,7 +685,6 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
> =20
>  	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, width);
> =20
> -	height =3D drm_rect_height(&new_state->src) >> 16;
>  	info =3D drm_format_info(fb->format->format);
>  	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
>  			     &burstsize, &num_bursts);
> @@ -747,8 +747,7 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  		ipu_cpmem_set_burstsize(ipu_plane->ipu_ch, 16);
> =20
>  		ipu_cpmem_zero(ipu_plane->alpha_ch);
> -		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width,
> -					 drm_rect_height(&new_state->src) >> 16);
> +		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width, height);
>  		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
>  		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
>  		ipu_idmac_set_double_buffer(ipu_plane->alpha_ch, 1);
>=20
> base-commit: 4b6cb2b67da883bc5095ee6d77f951f1cd7a1c24

