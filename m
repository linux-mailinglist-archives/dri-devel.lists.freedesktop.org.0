Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69B96B492
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063BA10E190;
	Wed,  4 Sep 2024 08:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF910E190
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:31:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sllQX-0008Au-5Q; Wed, 04 Sep 2024 10:31:45 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sllQV-005PKS-T7; Wed, 04 Sep 2024 10:31:43 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sllQV-0004ZM-2b;
 Wed, 04 Sep 2024 10:31:43 +0200
Message-ID: <095a4f602ebf408a90070d6ac0bea1f187420948.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/imx/ipuv3: ipuv3-plane: Round up plane width for
 IPUV3_CHANNEL_MEM_DC_SYNC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Paul Pu <hui.pu@gehealthcare.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lucas Stach
 <l.stach@pengutronix.de>
Cc: HuanWang@gehealthcare.com, taowang@gehealthcare.com, 
 sebastian.reichel@collabora.com, ian.ray@gehealthcare.com, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 04 Sep 2024 10:31:43 +0200
In-Reply-To: <20240904075417.53-1-hui.pu@gehealthcare.com>
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
 <20240904075417.53-1-hui.pu@gehealthcare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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

On Mi, 2024-09-04 at 10:54 +0300, Paul Pu wrote:
> This changes the judgement of if needing to round up the width or not,
> from using the `dp_flow` to the plane's type.
>=20
> The `dp_flow` can be -22(-EINVAL) even if the plane is a PRIMARY one.
> See `client_reg[]` in `ipu-common.c`.
>=20
> [    0.605141] [drm:ipu_plane_init] channel 28, dp flow -22, possible_crt=
cs=3D0x0
>=20
> Per the commit message in commit: 4333472f8d7b, using the plane type for
> judging if rounding up is needed is correct.
>=20
> This fixes HDMI cannot work for odd screen resolutions, e.g. 1366x768.
>=20
> Fixes: 4333472f8d7b ("drm/imx: ipuv3-plane: Fix overlay plane width")
> Cc: stable@vger.kernel.org # 5.15+
> Signed-off-by: Paul Pu <hui.pu@gehealthcare.com>
> ---
> v1 -> v2: Fixed addressed review comments
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/im=
x/ipuv3/ipuv3-plane.c
> index 704c549750f9..3ef8ad7ab2a1 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> @@ -614,7 +614,7 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  		break;
>  	}
> =20
> -	if (ipu_plane->dp_flow =3D=3D IPU_DP_FLOW_SYNC_BG)
> +	if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  		width =3D ipu_src_rect_width(new_state);
>  	else
>  		width =3D drm_rect_width(&new_state->src) >> 16;
>=20
> base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
