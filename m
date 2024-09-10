Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BD9742F7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 21:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4010E8FE;
	Tue, 10 Sep 2024 19:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="TVPqYnYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF6010E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ChL/YEahALI4OeYSLmEr7fBrkTltEQI0iMrMHT81QuU=; b=TVPqYnYthS2I29wCxwNXXM0YdA
 U1NvRPJPMQcaART58a7jWuA+lDhRIwnQe3C7R1Lwj9Vjo2FVA667DBIx902lcf40SnfF3OvWf629j
 +VFFytIrLhw2VxbkDoPoq0EF5ySWnV/x4V3thix2tixCliiQfhVFGyNT7thCwypi6AjkQ2mfG7AJC
 uOIA3yyQ1S9dRyXxbyjmApbcJHVwdF73Iy45QsSHaeUtP/31HJye/lWhxrmcQVL6DFIEot0SaJFSW
 As9ZP4Rhy6mNAs9eTQUuqBs2boAb+vMqbsoKRD+D0yndIAUVPBNhWYJxYUz25dz3pGTMZ772MW4pZ
 l8JWwkHw==;
Received: from i53875a02.versanet.de ([83.135.90.2] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1so6Ba-0007jv-So; Tue, 10 Sep 2024 21:05:58 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Date: Tue, 10 Sep 2024 21:08:26 +0200
Message-ID: <2376712.1SvkZsmPdQ@diego>
In-Reply-To: <20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb@collabora.com>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 6. September 2024, 03:17:42 CEST schrieb Cristian Ciocaltea:
> The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
> Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
> Samsung IP block.
> 
> Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
> without audio, CEC or any of the HDMI 2.1 specific features.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

[...]

> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
> index 3ff7b21c0414..3eab662a5a1d 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -11,6 +11,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_VOP) += rockchip_drm_vop.o rockchip_vop_reg.o

> +static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
> +				    void *data)
> +{
> +	static const char * const clk_names[] = {
> +		"pclk", "earc", "aud", "hdp", "hclk_vo1",
> +		"ref" /* keep "ref" last */
> +	};

[...]

> +	for (i = 0; i < ARRAY_SIZE(clk_names); i++) {
> +		clk = devm_clk_get_enabled(hdmi->dev, clk_names[i]);
> +
> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
> +			if (ret != -EPROBE_DEFER)
> +				drm_err(hdmi, "Failed to get %s clock: %d\n",
> +					clk_names[i], ret);
> +			return ret;
> +		}
> +	}
> +	hdmi->ref_clk = clk;

How about using devm_clk_bulk_get_all_enable() for everything except the
refclk and a separate call to devm_clk_get_enabled() for that refclk .

That hdmi->ref_clk just accidentially falls out of that loop at the end
looks somewhat strange, so getting and keeping that refclk
separately would make this look cleaner.


