Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CC2C357
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A20893CB;
	Tue, 28 May 2019 09:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985C893CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:37:04 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5E56240006;
 Tue, 28 May 2019 09:37:00 +0000 (UTC)
Date: Tue, 28 May 2019 11:38:09 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190528093809.wc5ic54rdtq7xdck@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190511210702.18394-8-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0519936525=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0519936525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wli7rl74fk3gmni5"
Content-Disposition: inline


--wli7rl74fk3gmni5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

HI Laurent,

On Sun, May 12, 2019 at 12:06:59AM +0300, Laurent Pinchart wrote:
> In dual-link LVDS mode, the LVDS1 encoder is used as a companion for
> LVDS0, and both encoders transmit data from DU0. The LVDS1 output of DU1
> can't be used in that case, don't create an encoder and connector for
> it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 6c91753af7bc..fe046d194944 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -16,6 +16,7 @@
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
>  #include "rcar_du_kms.h"
> +#include "rcar_lvds.h"
>
>  /* -----------------------------------------------------------------------------
>   * Encoder
> @@ -97,6 +98,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  		}
>  	}
>
> +	/*
> +	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> +	 * companion for LVDS0 in dual-link mode.
> +	 */
> +	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> +		if (bridge && rcar_lvds_dual_link(bridge)) {

If you get here, 'bridge' is guaranteed to be valid.

> +			ret = -ENOLINK;
> +			goto done;
> +		}
> +	}
> +
>  	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index f8f7fff34dff..95c81e59e2f1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -378,7 +378,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
>  	}
>
>  	ret = rcar_du_encoder_init(rcdu, output, entity);
> -	if (ret && ret != -EPROBE_DEFER)
> +	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)

Apart from the minor above
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>  		dev_warn(rcdu->dev,
>  			 "failed to initialize encoder %pOF on output %u (%d), skipping\n",
>  			 entity, output, ret);
> --
> Regards,
>
> Laurent Pinchart
>

--wli7rl74fk3gmni5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztAYEACgkQcjQGjxah
Vjyq0g/8C2exgxofwQOMCQxurH/9KUeFG07l7JeN8CBxJXqfB98yP3E0x5KHK997
3Z5dsna5tromo3PxDkRA6hpIGODmYbqPcXX2d5TZEehy96vmHjzC5883fWrJ70lE
+LIY2MGRvr+A0ytJirLUY9BcTWGMYSKp13DgqFJIJTDp0Xge+HHyJLXF4/ZnMzUg
c64Ul2qY8NMp70SofkezKtOb8XDEpKxKz8CHlCUWCGVvhUWxVCwfQrhSrAgIT/Ct
qv8V0Blj1NP2RGmDoD2VxTO3FBAaxw1rrkXSQG0Ie2RiHdFe+meNfPgkJwWdaCoe
NUuUmuPnI/CjBg/KtnWxOrQBgUwwtUnXJnMKbe0d+BSyFi2vwtONwbNK6BGzakX4
n4dUPsxnukwAFt/gailT9HT3+2tU7uxR3gwtVQ5enPgjUyyl4MAl14BmtX4tu/5/
KAPQ9wOLwnpp0VLff9UbuRZLxm9GvA3wXxtvZKtP2YmLY34gMH/y/LHqCjOOVL/L
0e1JnpfeRKyedpsPf6AzEzCEOvbWRwqvhilMzXug19WJ1p5d1y+WBvjInH646BsP
w9v4XOwDK45xJsH7rq1QQZV5TraGOwpW4q4T67MBH+EXRWkk3Z/oT4+EuP3Flozg
cLwU2cJwGtnce+gEChXg/647djZvmIDtsfRHwmv/GC2T9jw9pEI=
=hPFR
-----END PGP SIGNATURE-----

--wli7rl74fk3gmni5--

--===============0519936525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0519936525==--
