Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD5906784
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B527610E9BC;
	Thu, 13 Jun 2024 08:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="EOkUcu5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E229F10E99A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:50:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45D8o1hh105500;
 Thu, 13 Jun 2024 03:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718268602;
 bh=ChnWdPKf1jQd19t1eqZ7k3wiY14doCijOomIL3s14so=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=EOkUcu5styHyvyFqFQqR2OcbE3Y5NdJIC0j1iVs8FCfbxfJHffXa9v81svRHuPjkt
 14/OMi4lZV9cbm+BJyHpFGKxymrCF+u8njSDkiFZ0TVhka4u/gz2d/Nzddk09avLaO
 W7JI53ZYcNIdJn9gvPi8zJfkGG6rbA6QMf+RtmVc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45D8o1FQ076207
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Jun 2024 03:50:01 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 03:50:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 03:50:01 -0500
Received: from [10.249.129.248] ([10.249.129.248])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45D8ntev089041;
 Thu, 13 Jun 2024 03:49:56 -0500
Message-ID: <5aaf6d52-eaea-4de9-a53e-a6b61cbef35d@ti.com>
Date: Thu, 13 Jun 2024 14:19:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/bridge: sii902x: Fix mode_valid hook
To: Jayesh Choudhary <j-choudhary@ti.com>, <linux-kernel@vger.kernel.org>,
 <dmitry.baryshkov@linaro.org>, <sui.jingfeng@linux.dev>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <mripard@kernel.org>, <sam@ravnborg.org>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <20240613083805.439337-1-j-choudhary@ti.com>
 <20240613083805.439337-2-j-choudhary@ti.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240613083805.439337-2-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Jayesh,

Thanks for the patches!

On 13-Jun-24 14:08, Jayesh Choudhary wrote:
> Currently, mode_valid is defined only in drm_connector_helper_funcs.
> When the bridge is attached with the 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
> flag, the connector is not initialized, and so is the mode_valid
> hook under connector helper funcs.
> It also returns MODE_OK for all modes without actually checking the
> modes.
> So move the mode_valid hook to drm_bridge_funcs with proper clock
> checks for maximum and minimum pixel clock supported by the bridge.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 2fbeda9025bf..6a6055a4ccf9 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -163,6 +163,14 @@
>  
>  #define SII902X_AUDIO_PORT_INDEX		3
>  
> +/*
> + * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
> + * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
> + * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
> + */
> +#define SII902X_MIN_PIXEL_CLOCK_KHZ		25000
> +#define SII902X_MAX_PIXEL_CLOCK_KHZ		165000
> +
>  struct sii902x {
>  	struct i2c_client *i2c;
>  	struct regmap *regmap;
> @@ -310,17 +318,8 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  	return num;
>  }
>  
> -static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
> -					       struct drm_display_mode *mode)
> -{
> -	/* TODO: check mode */
> -
> -	return MODE_OK;
> -}
> -
>  static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
>  	.get_modes = sii902x_get_modes,
> -	.mode_valid = sii902x_mode_valid,
>  };
>  
>  static void sii902x_bridge_disable(struct drm_bridge *bridge)
> @@ -504,6 +503,20 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
>  	return 0;
>  }
>  
> +static enum drm_mode_status
> +sii902x_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
> +			  const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.attach = sii902x_bridge_attach,
>  	.mode_set = sii902x_bridge_mode_set,
> @@ -516,6 +529,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
>  	.atomic_check = sii902x_bridge_atomic_check,
> +	.mode_valid = sii902x_bridge_mode_valid,
>  };
>  
>  static int sii902x_mute(struct sii902x *sii902x, bool mute)

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

-- 
Regards
Aradhya
