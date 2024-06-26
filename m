Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF359179CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EAE10E79F;
	Wed, 26 Jun 2024 07:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="aGYMLsTv";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UEnA1V5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306F210E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719387371; x=1750923371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8ZWPITAV4BVFXhLX83ZUdLQbrWkmuEHynQtO0CvwUE=;
 b=aGYMLsTvPgABCRIb5S8EIimXo+wi9F4wDm9qeRQxZIHtCu4bZoBSm1xl
 ChToYGXmVCMkYNc0jeeEdTDy36aBNa0Lfu+DRvIJfq2DuxeE6EN8DPq27
 UH+22nWzxg7Cr9GiUTZV6gDoYSdSKN/SOOUqiM50mKInKqZ7AFchgYUpp
 HY6aUBRt9IHaq1SpoDVtLRsaMPwayVZjnAnmucW3P5gE5qB/dxA/n7Qzm
 gpzDEZxM4qcd5Essu9vNqvvlbYjzJmXBKWnl0+jd+xboXVAP04IZInIdf
 ZUeK6u0yp+P3fKA3WRrl8m2bjc86IGlZA/tmMuRM7MUHOVisDuLR3oX8g A==;
X-CSE-ConnectionGUID: T3ef1K60TsmKdKCtk2/4pg==
X-CSE-MsgGUID: wX6UFoD3TOqNEsW+E5RIgw==
X-IronPort-AV: E=Sophos;i="6.08,266,1712613600"; d="scan'208";a="37591305"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Jun 2024 09:36:09 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CEF0516361F; Wed, 26 Jun 2024 09:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719387364;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w8ZWPITAV4BVFXhLX83ZUdLQbrWkmuEHynQtO0CvwUE=;
 b=UEnA1V5cm9unZEOZ67we5C2V0xRBushkfydC8VQcA+rfxT6FsxRJKYI8X2qCFu+1ZVj4hR
 E/SXZL4jYkmg2PYvHifwN8JONRArq065VsQqCI+9hPuGRlfMjO6QxF0/WRm5oclKBc8aSu
 ZUylOVNwCO0rv96JA925lPXou4ziOWUvKK2iY6sWUOdvDDlGX8Tlszsk6o67+7GskwQLE7
 XswzRt+ZRCrqhYwrn41TaoQBOhcVKLAmVi+/33PKDKri5FQI5jaDklvvtgqu1/YunhpO6W
 89+SiLcxSJf3FnKoozDcZly7kfa6KtqP6+gINJs8NHo2G4dP82FjDh4DrxnwLA==
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
Subject: Re: [PATCH v3 2/2] drm/bridge: tc358767: Add configurable default
 preemphasis
Date: Wed, 26 Jun 2024 09:36:03 +0200
Message-ID: <3293850.oiGErgHkdL@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240625120552.145389-2-marex@denx.de>
References: <20240625120552.145389-1-marex@denx.de>
 <20240625120552.145389-2-marex@denx.de>
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

thanks for patch.

Am Dienstag, 25. Juni 2024, 14:05:15 CEST schrieb Marek Vasut:
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
> V2: - Parse toshiba,pre-emphasis property out of an endpoint of port 2 (t=
he DP port)
> V3: - No change
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 45 ++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index dde1b2734c98a..257fe15080099 100644
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
> @@ -2435,6 +2454,18 @@ static int tc_probe_bridge_endpoint(struct tc_data=
 *tc)
>  			return -EINVAL;
>  		}
>  		mode |=3D BIT(endpoint.port);
> +		if (endpoint.port !=3D 2)
> +			continue;
> +

Mh, I know currently there are not other port-specific properties. But
maybe it's easier to read if 'if (endpoint.port =3D=3D 2) {' is used.

But either way, this looks good.
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> +		of_property_read_u8_array(node, "toshiba,pre-emphasis",
> +					  tc->pre_emphasis,
> +					  ARRAY_SIZE(tc->pre_emphasis));
> +
> +		if (tc->pre_emphasis[0] < 0 || tc->pre_emphasis[0] > 2 ||
> +		    tc->pre_emphasis[1] < 0 || tc->pre_emphasis[1] > 2) {
> +			dev_err(dev, "Incorrect Pre-Emphasis setting, use either 0=3D0dB 1=3D=
3.5dB 2=3D6dB\n");
> +			return -EINVAL;
> +		}
>  	}
> =20
>  	if (mode =3D=3D mode_dpi_to_edp || mode =3D=3D mode_dpi_to_dp) {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


