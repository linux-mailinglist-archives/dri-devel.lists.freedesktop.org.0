Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C7BDF74D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D760510E847;
	Wed, 15 Oct 2025 15:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="VT7Jvr/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69710E847
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Z3Pe//Qk7uVwriRUdY4wfxnM3En9QGZArVfkpKWTETw=; b=VT7Jvr/JW5SCZv7ZUvwOgcbo/g
 2x2kVvVveSt62dZgaSzTtz/ZFXzdFZ+IsI0zH/pXxedf0xetmuqojHfkO8pNYhQlFsAEorXt0WzHv
 OIelmGR8D9Ez1vEk+XTrL444HjScJR1LEjc2DrsVf+T+FfPKX4zx93he2kOpYKQRx8F2vZSjq0FRW
 iEmh+xDa2o0twA3Wm6o8fMubNruHKE3XQ3Abf767QyBwY9aYjXAGASi4Jy0tJgSid5t0HP2HYtdCb
 9tHuH5aH4kwG6+WjbDuk+kVdcN1/is0dZwZk9Zo9uIaAeSVFm5JMwYX9I7IuDMl8h2MNlPpSKmYWJ
 pQSvBPpw==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v93fX-0000Ye-0q; Wed, 15 Oct 2025 17:44:03 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
Date: Wed, 15 Oct 2025 17:44:01 +0200
Message-ID: <2753758.X9hSmTKtgW@diego>
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-2-fa25163c4b08@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <20250903-rk3588-hdmi-cec-v4-2-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Mittwoch, 3. September 2025, 20:51:00 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> Currently the TIMER_BASE_CONFIG0 register gets initialized to a fixed
> value as initially found in vendor driver code supporting the RK3588
> SoC.  As a matter of fact the value matches the rate of the HDMI TX
> reference clock, which is roughly 428.57 MHz.
>=20
> However, on RK3576 SoC that rate is slightly lower, i.e. 396.00 MHz, and
> the incorrect register configuration breaks CEC functionality.
>=20
> Set the timer base according to the actual reference clock rate that
> shall be provided by the platform driver.  Otherwise fallback to the
> vendor default.
>=20
> While at it, also drop the unnecessary empty lines in
> dw_hdmi_qp_init_hw().
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

This _does_ look ok to me, but as that touches the main bridge, could
we get a 2nd set of eyes?

Thanks
Heiko

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++++++---
>  include/drm/bridge/dw_hdmi_qp.h              |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index fc98953672b6fb388d05201e280d24b8f214498a..4ba7b339eff62592aa748429a=
3bfca82494679d1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -161,6 +161,7 @@ struct dw_hdmi_qp {
>  		void *data;
>  	} phy;
> =20
> +	unsigned long ref_clk_rate;
>  	struct regmap *regm;
> =20
>  	unsigned long tmds_char_rate;
> @@ -1210,13 +1211,11 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp =
*hdmi)
>  {
>  	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_0_INT_MASK_N);
>  	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_1_INT_MASK_N);
> -	dw_hdmi_qp_write(hdmi, 428571429, TIMER_BASE_CONFIG0);
> +	dw_hdmi_qp_write(hdmi, hdmi->ref_clk_rate, TIMER_BASE_CONFIG0);
> =20
>  	/* Software reset */
>  	dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
> -
>  	dw_hdmi_qp_write(hdmi, 0x085c085c, I2CM_FM_SCL_CONFIG0);
> -
>  	dw_hdmi_qp_mod(hdmi, 0, I2CM_FM_EN, I2CM_INTERFACE_CONTROL0);
> =20
>  	/* Clear DONE and ERROR interrupts */
> @@ -1262,6 +1261,13 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform=
_device *pdev,
>  	hdmi->phy.ops =3D plat_data->phy_ops;
>  	hdmi->phy.data =3D plat_data->phy_data;
> =20
> +	if (plat_data->ref_clk_rate) {
> +		hdmi->ref_clk_rate =3D plat_data->ref_clk_rate;
> +	} else {
> +		hdmi->ref_clk_rate =3D 428571429;
> +		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
> +	}
> +
>  	dw_hdmi_qp_init_hw(hdmi);
> =20
>  	ret =3D devm_request_threaded_irq(dev, plat_data->main_irq,
> diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi=
_qp.h
> index b4a9b739734ec7b67013b683fe6017551aa19172..76ecf31301997718604a05f70=
ce9eab8695e26b5 100644
> --- a/include/drm/bridge/dw_hdmi_qp.h
> +++ b/include/drm/bridge/dw_hdmi_qp.h
> @@ -24,6 +24,7 @@ struct dw_hdmi_qp_plat_data {
>  	void *phy_data;
>  	int main_irq;
>  	int cec_irq;
> +	unsigned long ref_clk_rate;
>  };
> =20
>  struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>=20
>=20




