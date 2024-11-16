Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD239D00A5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 20:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD210E066;
	Sat, 16 Nov 2024 19:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="ObsehuB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 629 seconds by postgrey-1.36 at gabe;
 Sat, 16 Nov 2024 19:23:30 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5010E066
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1731785006;
 bh=dmE8MJeWTk8bxqfJVKrL0wXJqPiElWsvJ7UCb/1ffyQ=;
 b=ObsehuB0tgOeLCNvSEaU0X+7Y8jzT2d81lT77o6mhOh/HVLdtXxZYGghSTkadjk80Sx+JHfme
 CeL2+VSXkUuwonMWw/B3uk5eyvHq+bRiughYphGB3J40MCy5DRkpSonOHk4pnKShUy4ZfpZEkpm
 NIsRmrOSMaW2UKThr/CE2pZDGR1BfrTtG9iRDVg4etjjRfHWcMOnC0FHAr8ARy86Lq/eDNyqQkN
 fHsSuowizrWidtHLzlyQNP1uiJEPGJLkFlQG5L4Ir8AvpKjD9O3lXjfcZeuobHtOYsL2qLyLMtc
 lxn5yF5XeZ09nHedWkpDxtzGwDXBUDl2lo/TghZiMQoQ==
Message-ID: <c79c1878-370d-45fa-a802-1d175498bb1c@kwiboo.se>
Date: Sat, 16 Nov 2024 20:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/rockchip: vop2: Improve display modes handling on
 RK3588 HDMI0
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
 <20241116-vop2-hdmi0-disp-modes-v1-3-2bca51db4898@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20241116-vop2-hdmi0-disp-modes-v1-3-2bca51db4898@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 6738ee9c127e0383f31a82d6
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

Hi Cristian,

On 2024-11-16 19:22, Cristian Ciocaltea wrote:
> The RK3588 specific implementation is currently quite limited in terms
> of handling the full range of display modes supported by the connected
> screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are just a
> few of them.
> 
> Additionally, it doesn't cope well with non-integer refresh rates like
> 59.94, 29.97, 23.98, etc.
> 
> Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
> all display modes up to 4K@60Hz.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 3e4c1cfd0bac6fa90f4cab85e27c2a69b86fc9aa..dfe1a50132d596f036430d7db3631398d0802972 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -158,6 +158,7 @@ struct vop2_video_port {
>  	struct drm_crtc crtc;
>  	struct vop2 *vop2;
>  	struct clk *dclk;
> +	struct clk *dclk_src;
>  	unsigned int id;
>  	const struct vop2_video_port_data *data;
>  
> @@ -212,6 +213,7 @@ struct vop2 {
>  	struct clk *hclk;
>  	struct clk *aclk;
>  	struct clk *pclk;
> +	struct clk *pll_hdmiphy0;
>  
>  	/* optional internal rgb encoder */
>  	struct rockchip_rgb *rgb;
> @@ -220,6 +222,8 @@ struct vop2 {
>  	struct vop2_win win[];
>  };
>  
> +#define VOP2_MAX_DCLK_RATE		600000 /* kHz */
> +
>  #define vop2_output_if_is_hdmi(x)	((x) == ROCKCHIP_VOP2_EP_HDMI0 || \
>  					 (x) == ROCKCHIP_VOP2_EP_HDMI1)
>  
> @@ -1103,6 +1107,9 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
>  
> +	if (vp->dclk_src)
> +		clk_set_parent(vp->dclk, vp->dclk_src);
> +
>  	clk_disable_unprepare(vp->dclk);
>  
>  	vop2->enable_count--;
> @@ -2192,6 +2199,27 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
>  
> +	/*
> +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
> +	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
> +	 */
> +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <= VOP2_MAX_DCLK_RATE) {
> +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> +			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> +
> +			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
> +				if (!vp->dclk_src)
> +					vp->dclk_src = clk_get_parent(vp->dclk);
> +
> +				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> +				if (ret < 0)
> +					drm_warn(vop2->drm,
> +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> +				break;
> +			}
> +		}
> +	}

Why do we need to do this dynamically here?

The device tree set PLL_HPLL as parent:

&vop {
	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
	status = "okay";
};

Could this not just be changed to assign hdptxphy_hdmi0 as parent?

&vop {
	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
	assigned-clock-parents = <&hdptxphy_hdmi0>, <&cru PLL_VPLL>;
	status = "okay";
};

or something similar?

For RK3328 the vop dclk parent is assigned to hdmiphy using DT.

Regards,
Jonas

> +
>  	clk_set_rate(vp->dclk, clock);
>  
>  	vop2_post_config(crtc);
> @@ -3355,6 +3383,12 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  		return PTR_ERR(vop2->pclk);
>  	}
>  
> +	vop2->pll_hdmiphy0 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy0");
> +	if (IS_ERR(vop2->pll_hdmiphy0)) {
> +		drm_err(vop2->drm, "failed to get pll_hdmiphy0\n");
> +		return PTR_ERR(vop2->pll_hdmiphy0);
> +	}
> +
>  	vop2->irq = platform_get_irq(pdev, 0);
>  	if (vop2->irq < 0) {
>  		drm_err(vop2->drm, "cannot find irq for vop2\n");
> 

