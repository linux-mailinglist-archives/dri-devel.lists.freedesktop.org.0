Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8FBCFEE5E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 17:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382AC10E641;
	Wed,  7 Jan 2026 16:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688A910E641
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 16:35:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1vdWUn-00061q-3g; Wed, 07 Jan 2026 17:34:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1vdWUh-009XX9-1v;
 Wed, 07 Jan 2026 17:34:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
 (envelope-from <p.zabel@pengutronix.de>) id 1vdWUh-00000000FuG-1qqY;
 Wed, 07 Jan 2026 17:34:47 +0100
Message-ID: <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam	 <festevam@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Inki
 Dae <inki.dae@samsung.com>,  Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham	
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Date: Wed, 07 Jan 2026 17:34:47 +0100
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Mi, 2026-01-07 at 17:22 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/im=
x/ipuv3/dw_hdmi-imx.c
> index 07e5f96202d4..95f629d97bce 100644
> --- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
> @@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(hdmi->hdmi))
>  		return PTR_ERR(hdmi->hdmi);
> =20
> -	hdmi->bridge =3D of_drm_find_bridge(np);
> +	hdmi->bridge =3D of_drm_find_and_get_bridge(np);
>  	if (!hdmi->bridge) {
>  		dev_err(hdmi->dev, "Unable to find bridge\n");
>  		dw_hdmi_remove(hdmi->hdmi);

The component_add() error path below this is missing a
drm_bridge_put().

regards
Philipp
