Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770B4AF080
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9406910E1C4;
	Wed,  9 Feb 2022 12:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C201810E1C4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:01:29 +0000 (UTC)
Date: Wed, 09 Feb 2022 12:01:16 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v13 5/9] drm/synopsys+ingenic: repair hot plug detection
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <4ED17R.TVHQS4U654LE@crapouillou.net>
In-Reply-To: <08fb9549042d35c1904fd977e68aa52f74f755b0.1643819482.git.hns@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
 <08fb9549042d35c1904fd977e68aa52f74f755b0.1643819482.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mer., f=E9vr. 2 2022 at 17:31:19 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> so that it calls drm_kms_helper_hotplug_event().
>=20
> We need to set .poll_enabled but that struct component
> can only be accessed in the core code. Hence we add a public
> setter function.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 2 ++
>  include/drm/bridge/dw_hdmi.h              | 1 +
>  3 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c=20
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f5..52e7cd2e020d3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3216,6 +3216,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi=20
> *hdmi)
>  	return 0;
>  }
>=20
> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
> +{
> +	if (hdmi->bridge.dev)
> +		hdmi->bridge.dev->mode_config.poll_enabled =3D enable;
> +	else
> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
> +
>  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  			      const struct dw_hdmi_plat_data *plat_data)
>  {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c=20
> b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> index 34e986dd606cf..90547a28dc5c7 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -55,6 +55,8 @@ ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi,=20
> void *data,
>  	if (mode->clock > 216000)
>  		return MODE_CLOCK_HIGH;
>=20
> +	dw_hdmi_enable_poll(hdmi, true);
> +

It would be a better idea to move this patch before the patch that=20
creates ingenic-dw-hdmi.c. Then you wouldn't have to patch a file that=20
was just introduced.

As for the patch itself, I guess it's fine, but is that really needed?=20
My understanding is that it's the hdmi-connector's job to poll.

Cheers,
-Paul

>  	return MODE_OK;
>  }
>=20
> diff --git a/include/drm/bridge/dw_hdmi.h=20
> b/include/drm/bridge/dw_hdmi.h
> index 2a1f85f9a8a3f..963960794b40e 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -196,5 +196,6 @@ enum drm_connector_status=20
> dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>  void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>  			    bool force, bool disabled, bool rxsense);
>  void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>=20
>  #endif /* __IMX_HDMI_H__ */
> --
> 2.33.0
>=20


