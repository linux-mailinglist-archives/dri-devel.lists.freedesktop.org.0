Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28C696505
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC5F10E0E4;
	Tue, 14 Feb 2023 13:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759E010E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676382179; x=1707918179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aaMwux03jBEKJ1Pb/onCryTf/9UpBBkIzGoSYw5GpeI=;
 b=HG/8piWwoZ8DDtZOXeUdTYQ/CNGZBts/ZCf9vC28XoC62fjHmCDE/ixQ
 kwzoFuUW9x4Zfdu7DtvSU9m2RmQ0KNStcf8gQkI9MOOU6AKpHAfTfcRst
 DtQRrEmBs/moWilA9CUHm9PNiT9Crevr3AYncGM1F7KGSddUQFNPF+aZ/
 sVFuTMBQDsmhl04Kw0oREe9d76iBfc+Nj7eM6/0IoS3LDLeSEIeqYEBYI
 M04nvZKRVIslmYtuEVLwZRIE+S3kzztR6VIzpE5gxXvWGeGntI1MKVuBz
 mp9dUn5dV7FX5YHoTG/1yN/P7mRp7svWPu6AEw8G3w4AY55vcKQO0Ofe/ A==;
X-IronPort-AV: E=Sophos;i="5.97,296,1669071600"; d="scan'208";a="29074823"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 14 Feb 2023 14:42:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 14 Feb 2023 14:42:57 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 14 Feb 2023 14:42:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676382177; x=1707918177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aaMwux03jBEKJ1Pb/onCryTf/9UpBBkIzGoSYw5GpeI=;
 b=GsADJs99Y9ppRaYXXd2lREIqu5lN2jlfn9CmE8pm11/CJpaQENd2fpcK
 NzA3gNtyhjBgQn0+p9JMCJuZW4TIcb3GM6Q+foYWN//E7c4kkmqbjKaYG
 0s8tTiyptcZ23qZRWUPAgN/+lrmKB/8TeCjEQcAv9gcd6iKf6gEJPfl9+
 /QOfQBSsn1uOhNDoRhg012S4dR9MRGCHhRlYc6CJD6w/sec5pp7V6woFl
 xjl4di0TCn49FDfZCnRZm40vIuurGWRzjOKJ3OhBeWnR3I240PBpvOJkh
 OdHtynAehxAMIa0SKfAQkMVze79BLpxGgt0T4fLoP8VRwou9SqMFpHISX A==;
X-IronPort-AV: E=Sophos;i="5.97,296,1669071600"; d="scan'208";a="29074821"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 14 Feb 2023 14:42:57 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B1F1C280056;
 Tue, 14 Feb 2023 14:42:56 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Date: Tue, 14 Feb 2023 14:42:54 +0100
Message-ID: <10229432.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230213085612.1026538-3-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-3-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

thanks for the update.

Am Montag, 13. Februar 2023, 09:56:08 CET schrieb Liu Ying:
> A valid bridge is already found in lcdif_attach_bridge() and set
> to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
> the unnecessary NULL pointer check in KMS stage.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * No change.
>=20
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)
>=20
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 33 +++++++++++--------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index 262bc43b1079..e54200a9fcb9 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -394,7 +394,7 @@ static void lcdif_crtc_mode_set_nofb(struct
> lcdif_drm_private *lcdif, struct drm_display_mode *m =3D
> &lcdif->crtc.state->adjusted_mode;
>  	u32 bus_flags =3D 0;
>=20
> -	if (lcdif->bridge && lcdif->bridge->timings)
> +	if (lcdif->bridge->timings)
>  		bus_flags =3D lcdif->bridge->timings->input_bus_flags;
>  	else if (bridge_state)
>  		bus_flags =3D bridge_state->input_bus_cfg.flags;
> @@ -463,30 +463,21 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc
> *crtc, struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
>  	struct drm_bridge_state *bridge_state =3D NULL;
>  	struct drm_device *drm =3D lcdif->drm;
> -	u32 bus_format =3D 0;
> +	u32 bus_format;
>  	dma_addr_t paddr;
>=20
> -	/* If there is a bridge attached to the LCDIF, use its bus format */
> -	if (lcdif->bridge) {
> -		bridge_state =3D
> -			drm_atomic_get_new_bridge_state(state,
> -							lcdif-
>bridge);
> -		if (!bridge_state)
> -			bus_format =3D MEDIA_BUS_FMT_FIXED;
> -		else
> -			bus_format =3D bridge_state->input_bus_cfg.format;
> -
> -		if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> -			dev_warn_once(drm->dev,
> -				      "Bridge does not provide bus=20
format, assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" -				     =20
"Please fix bridge driver by
> handling atomic_get_input_bus_fmts.\n"); -		=09
bus_format =3D
> MEDIA_BUS_FMT_RGB888_1X24;
> -		}
> -	}
> +	bridge_state =3D drm_atomic_get_new_bridge_state(state, lcdif-
>bridge);
> +	if (!bridge_state)
> +		bus_format =3D MEDIA_BUS_FMT_FIXED;
> +	else
> +		bus_format =3D bridge_state->input_bus_cfg.format;
>=20
> -	/* If all else fails, default to RGB888_1X24 */
> -	if (!bus_format)
> +	if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> +		dev_warn_once(drm->dev,
> +			      "Bridge does not provide bus format,=20
assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" +			      "Please fix=20
bridge driver by
> handling atomic_get_input_bus_fmts.\n"); bus_format =3D
> MEDIA_BUS_FMT_RGB888_1X24;
> +	}
>=20
>  	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);


LGTM.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


