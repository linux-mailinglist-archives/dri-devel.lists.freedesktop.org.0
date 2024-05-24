Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF68CE23E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 10:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C433310E106;
	Fri, 24 May 2024 08:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="QPc2lvSj";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="Oha+eVIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [46.30.211.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F370910E1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=WDsnsc5BF7LaWXnzxviI75o6u35R944PtHEiU+AMfa4=;
 b=QPc2lvSjvTvdM3EZ82lwNLtg7w2CmIEfMPBxOJrRMFhDEqPbHJRGlJE1DLaVqEP0Vz/LLVy/YFj2Y
 +byA/49C0hSpmJqWDTLWYwnG2cXTQPh6adWaXvdhEV4mAfFcQAzUGQhqZ7/UVjMzopzH1LHE2Qi9f0
 2rWXyACTZh5kEvwu8ezDmZfB/csRMp9TVx8R8Y4shJX4zqoejaEZNQXtfL18/j/plZen2QchXfl34H
 Sd2PCC+OnU5K3mTBmJBITMSjQ3Tf92bYeL2h9JEjDtcI+ZDIkNZxToRtI5rW4pxjBsdhKYZHi4TNJA
 dqh5i8Y28aDjhqvZr7HNipFkm8huJag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=WDsnsc5BF7LaWXnzxviI75o6u35R944PtHEiU+AMfa4=;
 b=Oha+eVIqCjGc1bf3/x4uLgjogbGIpBgq47NGEZQuPvo3uIX3ttkciDviTBQ3792h0lIYiUgQmPpFg
 NLSRcORAw==
X-HalOne-ID: 30760f29-19a6-11ef-a05e-2778176e2c98
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 30760f29-19a6-11ef-a05e-2778176e2c98;
 Fri, 24 May 2024 08:18:26 +0000 (UTC)
Date: Fri, 24 May 2024 10:18:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com
Subject: Re: [PATCH v2 1/2] drm/bridge: sii902x: Fix mode_valid hook
Message-ID: <20240524081824.GA615138@ravnborg.org>
References: <20240524073305.107293-1-j-choudhary@ti.com>
 <20240524073305.107293-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524073305.107293-2-j-choudhary@ti.com>
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

On Fri, May 24, 2024 at 01:03:04PM +0530, Jayesh Choudhary wrote:
> Currently, mode_valid hook returns all mode as valid and it is
> defined only in drm_connector_helper_funcs. With the introduction of
> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
> bridge_attach call for cases when the encoder has this flag enabled.
> So add the mode_valid hook in drm_bridge_funcs as well with proper
> clock checks for maximum and minimum pixel clock supported by the
> bridge.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 38 ++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 2fbeda9025bf..ef7c3ab3386c 100644
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
> @@ -310,12 +318,26 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  	return num;
>  }
>  
> +static enum
> +drm_mode_status sii902x_validate(struct sii902x *sii902x,
> +				 const struct drm_display_mode *mode)
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
>  static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>  					       struct drm_display_mode *mode)
>  {
> -	/* TODO: check mode */
> +	struct sii902x *sii902x = connector_to_sii902x(connector);
> +	const struct drm_display_mode *mod = mode;
>  
> -	return MODE_OK;
> +	return sii902x_validate(sii902x, mod);
>  }
>  
>  static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
> @@ -499,11 +521,22 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
>  	 * There might be flags negotiation supported in future but
>  	 * set the bus flags in atomic_check statically for now.
>  	 */
> +
>  	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;

If you spin a v2 then drop the above change as you delete the line again
in the next patch.

	Sam
