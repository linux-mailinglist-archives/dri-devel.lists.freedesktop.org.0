Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D87EA4FF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F7110E030;
	Mon, 13 Nov 2023 20:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5BB10E030
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 20:42:19 +0000 (UTC)
Received: from i5e861935.versanet.de ([94.134.25.53] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r2dl0-0003qR-St; Mon, 13 Nov 2023 21:42:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Wolfram Sang <wsa@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC
 support
Date: Mon, 13 Nov 2023 21:42:05 +0100
Message-ID: <6269120.1IzOArtZ34@diego>
In-Reply-To: <20231113112344.719-2-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-2-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 13. November 2023, 12:23:25 CET schrieb Heiner Kallweit:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> 
> ---
>  drivers/gpu/drm/rockchip/inno_hdmi.c   |    1 -
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c |    1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index 6e5b922a1..a7739b27c 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -793,7 +793,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
>  	init_completion(&i2c->cmp);
>  
>  	adap = &i2c->adap;
> -	adap->class = I2C_CLASS_DDC;
>  	adap->owner = THIS_MODULE;
>  	adap->dev.parent = hdmi->dev;
>  	adap->dev.of_node = hdmi->dev->of_node;
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> index fa6e592e0..7a3f71aa2 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -725,7 +725,6 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
>  	init_completion(&i2c->cmpltn);
>  
>  	adap = &i2c->adap;
> -	adap->class = I2C_CLASS_DDC;
>  	adap->owner = THIS_MODULE;
>  	adap->dev.parent = hdmi->dev;
>  	adap->dev.of_node = hdmi->dev->of_node;
> 
> 




