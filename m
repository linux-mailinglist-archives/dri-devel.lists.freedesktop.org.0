Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3087AE2383
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 22:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0802E10E251;
	Fri, 20 Jun 2025 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDD310EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 20:24:51 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uSiI4-0007Ib-PE; Fri, 20 Jun 2025 22:24:48 +0200
Message-ID: <570f669916975dcc506a3103736e7f59f76d447d.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/6] drm/etnaviv: Add module parameter to force PPU
 flop reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gert.wollny@collabora.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 22:24:48 +0200
In-Reply-To: <20250618204400.21808-7-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250618204400.21808-7-gert.wollny@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 18.06.2025 um 22:43 +0200 schrieb Gert Wollny:
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_flop_reset.c
> index c33647e96636..bf4cae4be815 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> @@ -16,6 +16,9 @@ enum etnaviv_flop_reset_type {
>  	flop_reset_tp =3D 1 << 2
>  };
> =20
> +static int etnaviv_force_flop_reset =3D 0;
> +module_param_named(force_flop_reset, etnaviv_force_flop_reset, int , 0);
> +
>  #define PPU_IMAGE_STRIDE 64
>  #define PPU_IMAGE_XSIZE 64
>  #define PPU_IMAGE_YSIZE 6
> @@ -151,6 +154,12 @@ etnaviv_flop_reset_ppu_require(const struct etnaviv_=
chip_identity *chip_id)
>  			return (e->flags & flop_reset_ppu) !=3D 0;
>  	}
> =20
> +	if (etnaviv_force_flop_reset & flop_reset_ppu) {

This should at least check for chipFeatures_PIPE_3D, so you don't try
to run the flop reset on a 2D only GPU.

Regards,
Lucas

> +		pr_warn("Forcing flop reset for model: 0x%04x, revision: 0x%04x\n",
> +			chip_id->model, chip_id->revision);
> +		return true;
> +	}
> +
>  	return false;
>  }
> =20

