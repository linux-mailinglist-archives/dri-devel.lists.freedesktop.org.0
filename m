Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ED4AC5B35
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 22:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A0510E00C;
	Tue, 27 May 2025 20:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="2b7umvc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (unknown [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C61D10E537
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=+l1CShGqzt+9D2PPlurs5WyZsGLSUXWJX83KnmCBDvw=; b=2b7umvc4kxsjdWc42R/9hUS+Ja
 xQt3qo1sfFptrcKJLM5QXwV8PSlWjILYgSqlTpGvUobIN2AwD5FCKqNXFX8MgXhVUEKKHlNKyRHlT
 xPw4dLdJJACJWQqZzm2aA3Mf/nIicj90oR9E1aDNYmomLHFBN7/riREqHoPys19W8QzNCRLPhlLhp
 EiwiHOtHoLoD1DKttMsoAcVKFSAJiSEwNGyD9mSU1LCMhPRSEpmauw8Jv6u889f7jz3jAVAVuTNTU
 Sz0sSmllVRgII+TJbVtpdgFM0PBo5Hsr30OnNurSR8Xn/f5n1zucxTQzc0YH0mnot4O59xdlH60n3
 L7Aw2EUA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uK0WS-0000Xq-LL; Tue, 27 May 2025 22:03:40 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, l.stach@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v8] drm/bridge: analogix_dp: Remove the unnecessary calls
 to clk_disable_unprepare() during probing
Date: Tue, 27 May 2025 22:03:39 +0200
Message-ID: <2309383.iZASKD2KPV@diego>
In-Reply-To: <20250302083043.3197235-1-damon.ding@rock-chips.com>
References: <20250302083043.3197235-1-damon.ding@rock-chips.com>
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

Am Sonntag, 2. M=C3=A4rz 2025, 09:30:43 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Damon Ding:
> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"), the PM operations can help enable/disable the clock. The
> err_disable_clk label and clk_disable_unprepare() operations are no
> longer necessary because the analogix_dp_resume() will not be called
> during probing.
>=20
> Fixes: f37952339cc2 ("drm/bridge: analogix_dp: handle clock via runtime P=
M")
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

This patch seems to have fallen through the cracks?

dp->clock never gets enabled in analogix_dp_probe(), so reaching that
error handling code would create a enable-disable mismatch for the
dp>clock.


> ---
>=20
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D936932
>=20
> Changes in v8:
> - Fix the conflict because of commit 43c00fb1a518 ("drm/bridge:
>   analogix_dp: Use devm_platform_ioremap_resource()")
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f6e4bdc05ba0..817070613b03 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1605,10 +1605,8 @@ analogix_dp_probe(struct device *dev, struct analo=
gix_dp_plat_data *plat_data)
>  	}
> =20
>  	dp->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(dp->reg_base)) {
> -		ret =3D PTR_ERR(dp->reg_base);
> -		goto err_disable_clk;
> -	}
> +	if (IS_ERR(dp->reg_base))
> +		return ERR_CAST(dp->reg_base);
> =20
>  	dp->force_hpd =3D of_property_read_bool(dev->of_node, "force-hpd");
> =20
> @@ -1620,8 +1618,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>  	if (IS_ERR(dp->hpd_gpiod)) {
>  		dev_err(dev, "error getting HDP GPIO: %ld\n",
>  			PTR_ERR(dp->hpd_gpiod));
> -		ret =3D PTR_ERR(dp->hpd_gpiod);
> -		goto err_disable_clk;
> +		return ERR_CAST(dp->hpd_gpiod);
>  	}
> =20
>  	if (dp->hpd_gpiod) {
> @@ -1641,8 +1638,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
> =20
>  	if (dp->irq =3D=3D -ENXIO) {
>  		dev_err(&pdev->dev, "failed to get irq\n");
> -		ret =3D -ENODEV;
> -		goto err_disable_clk;
> +		return ERR_PTR(-ENODEV);
>  	}
> =20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, dp->irq,
> @@ -1651,15 +1647,11 @@ analogix_dp_probe(struct device *dev, struct anal=
ogix_dp_plat_data *plat_data)
>  					irq_flags, "analogix-dp", dp);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request irq\n");
> -		goto err_disable_clk;
> +		return ERR_PTR(ret);
>  	}
>  	disable_irq(dp->irq);
> =20
>  	return dp;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(dp->clock);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
> =20
>=20




