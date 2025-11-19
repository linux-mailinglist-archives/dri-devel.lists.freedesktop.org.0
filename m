Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1AFC6CB1B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 05:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927B310E56A;
	Wed, 19 Nov 2025 04:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Avztu/6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EBB10E566;
 Wed, 19 Nov 2025 04:18:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 08E8FDD9;
 Wed, 19 Nov 2025 05:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763525770;
 bh=Co0SQdTL8Op1neOiTCduNOiGp6gu3Kt8Xc6qs6rJnZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Avztu/6TS5bq2e/sK12229OUVbG1IkQ3SJlt5Fqo3xPeyTSpPD8yNyN0X5siBD4en
 mW9jba6o5mX6EH5BjkWy76EjvT/FJ7O1k2YlK4EJ66NWd3pc5/gguO1iuq6F8EhpQ/
 g24tg3xmkJxc5vkin6RTxvPBT08bdLkKnWYztSDE=
Date: Wed, 19 Nov 2025 13:17:47 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 06/10] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
Message-ID: <20251119041747.GF10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
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

On Mon, Nov 17, 2025 at 08:11:50PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the supported_formats member in the
> dw-hdmi-qp platform data struct, drivers that have access to this
> information should now set it.
> 
> Set it in the rockchip dw_hdmi_qp glue driver, where such a bitmask of
> supported color formats already exists. It just needs to be converted to
> the appropriate HDMI_COLORSPACE_ mask.
> 
> This allows this information to be passed down to the dw-hdmi-qp core,
> which sets it in the bridge it creates, and consequently will allow the
> common HDMI bridge code to act on it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index c9fe6aa3e3e3..7c294751de19 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -468,6 +468,28 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
>  
> +static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
> +					  DRM_COLOR_FORMAT_RGB444 |
> +					  DRM_COLOR_FORMAT_YCBCR444;
> +
> +static unsigned int __pure drm_to_hdmi_fmts(const u32 fmt)
> +{
> +	unsigned int res = 0;
> +
> +	if (fmt & DRM_COLOR_FORMAT_AUTO)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_RGB444)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR444)
> +		res |= BIT(HDMI_COLORSPACE_YUV444);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR422)
> +		res |= BIT(HDMI_COLORSPACE_YUV422);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR420)
> +		res |= BIT(HDMI_COLORSPACE_YUV420);
> +
> +	return res;
> +}
> +

This would be greatly simplified by turning supported_formats into a
bitmask of DRM_MODE_COLOR_FORMAT_* values, as suggested in 05/10.

>  static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				    void *data)
>  {
> @@ -521,6 +543,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	plat_data.phy_data = hdmi;
>  	plat_data.max_bpc = 10;
>  
> +	plat_data.supported_formats = drm_to_hdmi_fmts(supported_colorformats);
> +
>  	encoder = &hdmi->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>  

-- 
Regards,

Laurent Pinchart
