Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48AC7E716
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 21:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0910E053;
	Sun, 23 Nov 2025 20:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="0AH0Om+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9AA10E053
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 20:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=MnmGG9nEh7frLPdwa/7ggpTE5XrRCmztW7yfcEYjFvs=; b=0AH0Om+9N09YKSuVelLP113NER
 X+yQvvwN75XVz83o4XlPVZIbbM2rhaex6Wo4dSdUnK0VGDlp3enYiVuGDyNLOjApyNeFK7kG/3+4O
 jiR9wNg178NTLTngneKcL+L88TRwb65CYNTDmFR7JoRr5ZckUjDuPtYb1c2+DekA9n+hRG2dQMPNA
 aSgus7BBuJyGGXkfuxe6rMl1EpS6THsxa7J9YD3Q170RTXQM3ug33nOuoQ7VVQVtGo6UkHZRrXwZ5
 gSq2nLDvKtvYgKFxJcLwz2uYEa4pjgE1rFZCNa/K0NZuS38IBdGc+JFNNVVBEhNLJqUbhkwEYXhM+
 aNJG9uyg==;
Received: from i53875bd2.versanet.de ([83.135.91.210] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vNGel-0007bR-BM; Sun, 23 Nov 2025 21:25:59 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume
Date: Sun, 23 Nov 2025 21:25:58 +0100
Message-ID: <5028381.GXAFRqVoOG@diego>
In-Reply-To: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
References: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
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

Am Dienstag, 14. Oktober 2025, 18:00:57 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Sebastian Reichel:
> After resume from suspend to RAM, the following splash is generated if
> the HDMI driver is probed (independent of a connected cable):
>=20
> [ 1194.484052] irq 80: nobody cared (try booting with the "irqpoll" optio=
n)
> [ 1194.484074] CPU: 0 UID: 0 PID: 627 Comm: rtcwake Not tainted 6.17.0-rc=
7-g96f1a11414b3 #1 PREEMPT
> [ 1194.484082] Hardware name: Rockchip RK3576 EVB V10 Board (DT)
> [ 1194.484085] Call trace:
> [ 1194.484087]  ... (stripped)
> [ 1194.484283] handlers:
> [ 1194.484285] [<00000000bc363dcb>] dw_hdmi_qp_main_hardirq [dw_hdmi_qp]
> [ 1194.484302] Disabling IRQ #80
>=20
> Apparently the HDMI IP is losing part of its state while the system
> is suspended and generates spurious interrupts during resume. The
> bug has not yet been noticed, as system suspend does not yet work
> properly on upstream kernel with either the Rockchip RK3588 or RK3576
> platform.
>=20
> Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

so, just to say, to me this looks good and also I guess the changes to the
main bridge are not looking controversial and most likely the issue
should appear in all (future) dw-hdmi-qp variants.

So I'll give that a day or two more and then apply it.

Heiko

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  9 +++++++++
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 +++++++++++-
>  include/drm/bridge/dw_hdmi_qp.h                |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index 39332c57f2c5..c85eb340e5a3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -143,6 +143,7 @@ struct dw_hdmi_qp {
>  	} phy;
> =20
>  	struct regmap *regm;
> +	int main_irq;
> =20
>  	unsigned long tmds_char_rate;
>  };
> @@ -1068,6 +1069,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_=
device *pdev,
> =20
>  	dw_hdmi_qp_init_hw(hdmi);
> =20
> +	hdmi->main_irq =3D plat_data->main_irq;
>  	ret =3D devm_request_threaded_irq(dev, plat_data->main_irq,
>  					dw_hdmi_qp_main_hardirq, NULL,
>  					IRQF_SHARED, dev_name(dev), hdmi);
> @@ -1106,9 +1108,16 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform=
_device *pdev,
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_qp_bind);
> =20
> +void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi)
> +{
> +	disable_irq(hdmi->main_irq);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_qp_suspend);
> +
>  void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi)
>  {
>  	dw_hdmi_qp_init_hw(hdmi);
> +	enable_irq(hdmi->main_irq);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_qp_resume);
> =20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index ed6e8f036f4b..9ac45e7bc987 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -597,6 +597,15 @@ static void dw_hdmi_qp_rockchip_remove(struct platfo=
rm_device *pdev)
>  	component_del(&pdev->dev, &dw_hdmi_qp_rockchip_ops);
>  }
> =20
> +static int __maybe_unused dw_hdmi_qp_rockchip_suspend(struct device *dev)
> +{
> +	struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);
> +
> +	dw_hdmi_qp_suspend(dev, hdmi->hdmi);
> +
> +	return 0;
> +}
> +
>  static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);
> @@ -612,7 +621,8 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(=
struct device *dev)
>  }
> =20
>  static const struct dev_pm_ops dw_hdmi_qp_rockchip_pm =3D {
> -	SET_SYSTEM_SLEEP_PM_OPS(NULL, dw_hdmi_qp_rockchip_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_qp_rockchip_suspend,
> +				dw_hdmi_qp_rockchip_resume)
>  };
> =20
>  struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver =3D {
> diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi=
_qp.h
> index e9be6d507ad9..8955450663e5 100644
> --- a/include/drm/bridge/dw_hdmi_qp.h
> +++ b/include/drm/bridge/dw_hdmi_qp.h
> @@ -28,5 +28,6 @@ struct dw_hdmi_qp_plat_data {
>  struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>  				   struct drm_encoder *encoder,
>  				   const struct dw_hdmi_qp_plat_data *plat_data);
> +void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi);
>  void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi);
>  #endif /* __DW_HDMI_QP__ */
>=20
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251014-rockchip-hdmi-suspend-fix-e9bd48588453
>=20
> Best regards,
>=20




