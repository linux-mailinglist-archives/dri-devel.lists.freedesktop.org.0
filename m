Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43429BBBE6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 18:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0E910E008;
	Mon,  4 Nov 2024 17:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U1+njhmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1974510E008
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 17:29:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D773BA43194;
 Mon,  4 Nov 2024 17:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4221C4CECE;
 Mon,  4 Nov 2024 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730741392;
 bh=VIsm+vKuTiWLxy8wAD3WL4oTrYDz0+DlaUdFVPEaR6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1+njhmS9C1BnrW3KesZysOFKxuFALDbFR1vlBXfaD5I7h4iBZPIIkY4h1VvoQbPh
 cfMYVpEODRoCc08vE5388BaJKGrm1XAhcTSqvWGVtSGLCmH1mhp26WC2ALSW639Xxp
 EkwIVT3Ml1rrDaIS74t9EDDYEDq7Y9mS8Un2QOz9Ygg5MUEjhurM5QgTPOiVOAieN3
 wPulMMf+wmGO0evh0Dt4fi0fvv7Ds5JNLVpZwyQPqBmEM6ozf4oW6C2fgGkUQsB8JY
 mmcL1vYtMPRamsYCNVaoKKPy6lpWWuE6IfrN+qPWY2c0MSXiw/AaKXIR88x99+uWLe
 aClf85IRVrBPQ==
Date: Mon, 4 Nov 2024 10:29:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Algea Cao <algea.cao@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
Message-ID: <20241104172950.GA741087@thelio-3990X>
References: <20241018151016.3496613-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018151016.3496613-1-arnd@kernel.org>
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

On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Dividing a 64-bit integer prevents building this for 32-bit targets:
> 
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
> 
> As this function is not performance criticial, just Use the div_u64() helper.
> 
> Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can someone please pick this up? It is still broken in next-20241104...

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log

> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c796ee4c303..c8b362cc2b95 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
>  		 * comment in rk_hdptx_phy_power_on() from
>  		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>  		 */
> -		phy_set_bus_width(hdmi->phy, rate / 100);
> +		phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
>  	}
>  }
>  
> -- 
> 2.39.5
> 
