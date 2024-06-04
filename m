Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A132B8FAF3C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 11:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0AA10E294;
	Tue,  4 Jun 2024 09:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="RIe/pMKA";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RV52ppSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F09910E294
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1717494573; x=1749030573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9Y6aHzRSX1M/okafM5XvVMjeFxqQ8Pr99V3yM1nuJw=;
 b=RIe/pMKATrxMPv5/KFqgFL639WoOWrhVq6RoymCraDYK7TyQaAoIglWa
 7hFP1Q8QZCLAUVqkKvZxcG/Fs+HQQNjlhH24eKev1CF4cePd+0LTeNFIJ
 JRlV8o8H1WjwoJTBJQe9zSj2M8AB+zaFmws588v4ZJQ3H6nIggAOO+gX2
 8QifQdEkz9Pha7QLygkprgYoHsDvnAP6w5NoVP97TeQyVOcz98/fErVZp
 ZVQNbnLWSY2DxE781kEocI80X2FQb2gu8iHXHa7dVY5KhMgNZg0yHSnlG
 r6BbmspLjV/i11eSZjpp/2z8v/GANrddyLbb3HZuMy2+zfYPz/2ZAZgj5 g==;
X-CSE-ConnectionGUID: Sz926JwiS86zQxa2TFptSA==
X-CSE-MsgGUID: XBYM67s5Rail7HPGo7JZhg==
X-IronPort-AV: E=Sophos;i="6.08,213,1712613600"; d="scan'208";a="37209046"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Jun 2024 11:49:31 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74B4917119C; Tue,  4 Jun 2024 11:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1717494567;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=D9Y6aHzRSX1M/okafM5XvVMjeFxqQ8Pr99V3yM1nuJw=;
 b=RV52ppSmdTYPddxBEmy0MyYN5N4ZMUCluhRtaum1yKFhQhhKTkHlr1FCSUjrXwrOu3vgLr
 A9Cj9vVyBIJvKgkgQQyL+Ez0egHsb3UxsYKLNdU4QrPYAVD5BRJ+cOGZXM0l5cN3YK2D08
 K26Nhmg6DudAUp9jKYYaaATdaoW+UuBxV9fAu4fqrzBT3gaLu5KPLNta1WrQ4VyooJiIEl
 fVTlUU3hT5got6E4Q5udHormbIm/hO0lCtFQIHyGMxn0TlPoTKoIwPc4VulUAYuCapeqgS
 vHbtSn9HFxv5Xz4qhJdR6GJHESD+fjQB34jX1jfsCautukq7ZKmFbGOypiqPKg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/bridge: tc358767: Add configurable default
 preemphasis
Date: Tue, 04 Jun 2024 11:49:26 +0200
Message-ID: <2272229.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240531204339.277848-2-marex@denx.de>
References: <20240531204339.277848-1-marex@denx.de>
 <20240531204339.277848-2-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Marek,

Am Freitag, 31. Mai 2024, 22:42:04 CEST schrieb Marek Vasut:
> Make the default DP port preemphasis configurable via new DT property
> "toshiba,pre-emphasis". This is useful in case the DP link properties
> are known and starting link training from preemphasis setting of 0 dB
> is not useful. The preemphasis can be set separately for both DP lanes
> in range 0=3D0dB, 1=3D3.5dB, 2=3D6dB .
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 49 ++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 1243918320a7d..32639865fea07 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -241,6 +241,10 @@
> =20
>  /* Link Training */
>  #define DP0_SRCCTRL		0x06a0
> +#define DP0_SRCCTRL_PRE1		GENMASK(29, 28)
> +#define DP0_SRCCTRL_SWG1		GENMASK(25, 24)
> +#define DP0_SRCCTRL_PRE0		GENMASK(21, 20)
> +#define DP0_SRCCTRL_SWG0		GENMASK(17, 16)
>  #define DP0_SRCCTRL_SCRMBLDIS		BIT(13)
>  #define DP0_SRCCTRL_EN810B		BIT(12)
>  #define DP0_SRCCTRL_NOTP		(0 << 8)
> @@ -278,6 +282,8 @@
>  #define AUDIFDATA6		0x0720	/* DP0 Audio Info Frame Bytes 27 to 24 */
> =20
>  #define DP1_SRCCTRL		0x07a0	/* DP1 Control Register */
> +#define DP1_SRCCTRL_PRE			GENMASK(21, 20)
> +#define DP1_SRCCTRL_SWG			GENMASK(17, 16)
> =20
>  /* PHY */
>  #define DP_PHY_CTRL		0x0800
> @@ -369,6 +375,7 @@ struct tc_data {
> =20
>  	u32			rev;
>  	u8			assr;
> +	u8			pre_emphasis[2];
> =20
>  	struct gpio_desc	*sd_gpio;
>  	struct gpio_desc	*reset_gpio;
> @@ -1090,13 +1097,17 @@ static int tc_main_link_enable(struct tc_data *tc)
>  			return ret;
>  	}
> =20
> -	ret =3D regmap_write(tc->regmap, DP0_SRCCTRL, tc_srcctrl(tc));
> +	ret =3D regmap_write(tc->regmap, DP0_SRCCTRL,
> +			   tc_srcctrl(tc) |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
>  	if (ret)
>  		return ret;
>  	/* SSCG and BW27 on DP1 must be set to the same as on DP0 */
>  	ret =3D regmap_write(tc->regmap, DP1_SRCCTRL,
>  		 (tc->link.spread ? DP0_SRCCTRL_SSCG : 0) |
> -		 ((tc->link.rate !=3D 162000) ? DP0_SRCCTRL_BW27 : 0));
> +		 ((tc->link.rate !=3D 162000) ? DP0_SRCCTRL_BW27 : 0) |
> +		 FIELD_PREP(DP1_SRCCTRL_PRE, tc->pre_emphasis[1]));
>  	if (ret)
>  		return ret;
> =20
> @@ -1188,8 +1199,10 @@ static int tc_main_link_enable(struct tc_data *tc)
>  		goto err_dpcd_write;
> =20
>  	/* Reset voltage-swing & pre-emphasis */
> -	tmp[0] =3D tmp[1] =3D DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
> -			  DP_TRAIN_PRE_EMPH_LEVEL_0;
> +	tmp[0] =3D DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
> +		 FIELD_PREP(DP_TRAIN_PRE_EMPHASIS_MASK, tc->pre_emphasis[0]);
> +	tmp[1] =3D DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
> +		 FIELD_PREP(DP_TRAIN_PRE_EMPHASIS_MASK, tc->pre_emphasis[1]);
>  	ret =3D drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_SET, tmp, 2);
>  	if (ret < 0)
>  		goto err_dpcd_write;
> @@ -1213,7 +1226,9 @@ static int tc_main_link_enable(struct tc_data *tc)
>  	ret =3D regmap_write(tc->regmap, DP0_SRCCTRL,
>  			   tc_srcctrl(tc) | DP0_SRCCTRL_SCRMBLDIS |
>  			   DP0_SRCCTRL_AUTOCORRECT |
> -			   DP0_SRCCTRL_TP1);
> +			   DP0_SRCCTRL_TP1 |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
>  	if (ret)
>  		return ret;
> =20
> @@ -1248,7 +1263,9 @@ static int tc_main_link_enable(struct tc_data *tc)
>  	ret =3D regmap_write(tc->regmap, DP0_SRCCTRL,
>  			   tc_srcctrl(tc) | DP0_SRCCTRL_SCRMBLDIS |
>  			   DP0_SRCCTRL_AUTOCORRECT |
> -			   DP0_SRCCTRL_TP2);
> +			   DP0_SRCCTRL_TP2 |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
>  	if (ret)
>  		return ret;
> =20
> @@ -1274,7 +1291,9 @@ static int tc_main_link_enable(struct tc_data *tc)
> =20
>  	/* Clear Training Pattern, set AutoCorrect Mode =3D 1 */
>  	ret =3D regmap_write(tc->regmap, DP0_SRCCTRL, tc_srcctrl(tc) |
> -			   DP0_SRCCTRL_AUTOCORRECT);
> +			   DP0_SRCCTRL_AUTOCORRECT |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
> +			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
>  	if (ret)
>  		return ret;
> =20
> @@ -2346,6 +2365,7 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_d=
ata *tc)
>  static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>  {
>  	struct device *dev =3D tc->dev;
> +	struct device_node *port;
>  	struct drm_panel *panel;
>  	int ret;
> =20
> @@ -2372,6 +2392,21 @@ static int tc_probe_edp_bridge_endpoint(struct tc_=
data *tc)
>  		tc->bridge.ops |=3D DRM_BRIDGE_OP_DETECT;
>  	tc->bridge.ops |=3D DRM_BRIDGE_OP_EDID;
> =20
> +	port =3D of_graph_get_port_by_id(dev->of_node, 2);
> +	if (!port)
> +		return 0;
> +
> +	of_property_read_u8_array(port, "toshiba,pre-emphasis",
> +				  tc->pre_emphasis,
> +				  ARRAY_SIZE(tc->pre_emphasis));

This doesn't match the bindings. Bindings say it's a property of the
endpoint, not the port. Additionally it's uint32-array, not uint8-array.

Best regards,
Alexander

> +	of_node_put(port);
> +
> +	if (tc->pre_emphasis[0] < 0 || tc->pre_emphasis[0] > 2 ||
> +	    tc->pre_emphasis[1] < 0 || tc->pre_emphasis[1] > 2) {
> +		dev_err(dev, "Incorrect Pre-Emphasis setting, use either 0=3D0dB 1=3D3=
=2E5dB 2=3D6dB\n");
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


