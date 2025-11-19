Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92328C6CB0E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 05:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769210E567;
	Wed, 19 Nov 2025 04:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wMOj4w0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797F10E565;
 Wed, 19 Nov 2025 04:17:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CD2D7DD9;
 Wed, 19 Nov 2025 05:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763525749;
 bh=k9XgYvXg+wjYK9oGaaaJfHYNam3rcMc0Uh8RTTWVT5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wMOj4w0tcYckHL1uLbD4I68O4YFcO2oAUfrEyfyPHXv95KApnfu3oTyZkA9doTCeo
 erWWZqXi/ufzaUkv8FS2j3TTK85DVPRy1o9QOlpvvYkyxzlT4kIWWL643fEVn/wEwR
 8h4B0+K0SviyCdj7VEhSntQn2abmkr3QgVEjIQsY=
Date: Wed, 19 Nov 2025 13:17:26 +0900
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
Subject: Re: [PATCH v4 05/10] drm/bridge: dw-hdmi-qp: Set bridge
 supported_formats
Message-ID: <20251119041726.GE10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
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

On Mon, Nov 17, 2025 at 08:11:49PM +0100, Nicolas Frattaroli wrote:
> The drm_bridge "supported_formats" member stores a bitmask of supported
> HDMI output formats if the bridge is in fact an HDMI bridge.

It would be nice to convert the supported_formats field to a bitmask of
DRM_MODE_COLOR_FORMAT_* values.

> 
> However, until now, the synopsys dw-hdmi-qp driver did not set this
> member in the bridge it creates.
> 
> Set it based on the platform data's supported_formats member, and
> default to BIT(HDMI_COLORSPACE_RGB) if it's absent, which preserves the
> previous behaviour.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index fe4c026280f0..cf888236bd65 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1269,6 +1269,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>  		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
>  	}
>  
> +	if (plat_data->supported_formats)
> +		hdmi->bridge.supported_formats = plat_data->supported_formats;
> +	else
> +		hdmi->bridge.supported_formats = BIT(HDMI_COLORSPACE_RGB);
> +
>  	dw_hdmi_qp_init_hw(hdmi);
>  
>  	ret = devm_request_threaded_irq(dev, plat_data->main_irq,

-- 
Regards,

Laurent Pinchart
