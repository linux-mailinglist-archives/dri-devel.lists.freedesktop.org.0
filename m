Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D680561E374
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 17:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A03010E1A2;
	Sun,  6 Nov 2022 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AD310E0A2;
 Sun,  6 Nov 2022 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvIoHrgTbnCEFp2E+kqwZys718brKkUvKx2E8FVdXAU=; b=R0x9zXTEOsbViJfXz+FCNC4vM3
 uFqtwGLxzOd05dS01ItMXMP1PPK45WYw0O3lAe0JvWH4jhQd5w7yknQd5EMIzdRq4pWLf0sLQXd3n
 JfW+NRF49EsvmwA1jx8HJELNOcqT2nm9zpgUEpsEaro8rbYSf1gY+OqXYUpLms78UlIC6lFvBuMgh
 9Vxf31BusF+P5+REG7+8UaSW79q1f9bhf8pGPyT3npoch3IMrFxnuBTyN0BDmNSjdIRhJCbuUOA6q
 /qpAcBNRJyyNF7XLQFEQ/iE8RbIs5xs094+4T8TWzq+HX/IXWpVBiVlAZ2oiQOaMQNRubMHGbVgdN
 ZHDbPCNA==;
Received: from [2a01:799:95a:cb00:fd97:29ff:d72a:349e] (port=50711)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oriap-0005uQ-6b; Sun, 06 Nov 2022 17:33:55 +0100
Message-ID: <842076aa-8d7c-96d6-ba46-d0e66dacd2df@tronnes.org>
Date: Sun, 6 Nov 2022 17:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 16/23] drm/probe-helper: Provide a TV get_modes helper
To: maxime@cerno.tech, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 26.10.2022 17.33, skrev maxime@cerno.tech:
> Most of the TV connectors will need a similar get_modes implementation
> that will, depending on the drivers' capabilities, register the 480i and
> 576i modes.
> 
> That implementation will also need to set the preferred flag and order
> the modes based on the driver and users preferrence.
> 
> This is especially important to guarantee that a userspace stack such as
> Xorg can start and pick up the preferred mode while maintaining a
> working output.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v6:
> - New patch
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 97 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_probe_helper.h     |  1 +
>  2 files changed, 98 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 69b0b2b9cc1c..4a60575f5c66 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1147,3 +1147,100 @@ int drm_connector_helper_get_modes(struct drm_connector *connector)
>  	return count;
>  }
>  EXPORT_SYMBOL(drm_connector_helper_get_modes);
> +
> +static bool tv_mode_supported(struct drm_connector *connector,
> +			      enum drm_connector_tv_mode mode)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *property = dev->mode_config.tv_mode_property;
> +

Superfluous linebreak

> +	unsigned int i;
> +
> +	for (i = 0; i < property->num_values; i++)
> +		if (property->values[i] == mode)
> +			return true;
> +
> +	return false;
> +}
> +
> +/**
> + * drm_connector_helper_tv_get_modes - Fills the modes availables to a TV connector

availables -> available

> + * @connector: The connector
> + *
> + * Fills the available modes for a TV connector based on the supported
> + * TV modes, and the default mode expressed by the kernel command line.
> + *
> + * This can be used as the default TV connector helper .get_modes() hook
> + * if the driver does not need any special processing.
> + *
> + * Returns:
> + * The number of modes added to the connector.
> + */
> +int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
> +	struct drm_display_mode *tv_modes[2] = {};
> +	struct drm_display_mode *mode;
> +	unsigned int first_mode_idx;
> +	unsigned int count = 0;
> +	uint64_t default_mode;
> +	int ret;
> +
> +	if (!dev->mode_config.tv_mode_property)
> +		return 0;
> +
> +	if (tv_mode_supported(connector, DRM_MODE_TV_MODE_NTSC) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_NTSC_443) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_NTSC_J) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL_M)) {
> +		mode = drm_mode_analog_ntsc_480i(connector->dev);

Nit: You can use the dev variable here and below.

> +		if (!mode)
> +			return 0;
> +
> +		tv_modes[count++] = mode;
> +	}
> +
> +	if (tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL_N) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_SECAM)) {
> +		mode = drm_mode_analog_pal_576i(connector->dev);
> +		if (!mode)
> +			return 0;

You leak the ntsc mode when returning (possibly).

> +
> +		tv_modes[count++] = mode;
> +	}
> +

Maybe check for count being zero here?

> +	if (count == 1) {
> +		mode->type |= DRM_MODE_TYPE_PREFERRED;
> +		drm_mode_probed_add(connector, mode);
> +		return count;
> +	}
> +
> +	ret = drm_object_property_get_default_value(&connector->base,
> +						    dev->mode_config.tv_mode_property,
> +						    &default_mode);
> +	if (ret)
> +		return 0;

You leak both modes when returning here. Maybe move this up before
allocation to simplify error handling.

> +
> +	if (cmdline->tv_mode_specified)
> +		default_mode = cmdline->tv_mode;

I realised that we don't verify tv_mode coming from the command line,
not here and not in the reset helper. Should we do that? A driver should
be programmed defensively to handle an illegal/unsupported value, but it
doesn't feel right to allow an illegal enum value coming through the
core/helpers.

> +
> +	if ((default_mode == DRM_MODE_TV_MODE_NTSC) ||
> +	    (default_mode == DRM_MODE_TV_MODE_NTSC_443) ||
> +	    (default_mode == DRM_MODE_TV_MODE_NTSC_J) ||
> +	    (default_mode == DRM_MODE_TV_MODE_PAL_M))
> +		first_mode_idx = 0;
> +	else
> +		first_mode_idx = 1;
> +
> +	mode = tv_modes[first_mode_idx];
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	mode = first_mode_idx ? tv_modes[0] : tv_modes[1];
> +	drm_mode_probed_add(connector, mode);
> +
> +	return count;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);

I know this is not expensive, but you're looping over the property
values 7 times. An alternative solution is to rebuild the supported bitmask:

int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
{
...
	unsigned int ntsc_modes = BIT(DRM_MODE_TV_MODE_NTSC) |
				  BIT(DRM_MODE_TV_MODE_NTSC_443) |
				  BIT(DRM_MODE_TV_MODE_NTSC_J) |
				  BIT(DRM_MODE_TV_MODE_PAL_M);
	unsigned int pal_modes = BIT(DRM_MODE_TV_MODE_PAL) |
				 BIT(DRM_MODE_TV_MODE_PAL_N) |
				 BIT(DRM_MODE_TV_MODE_SECAM);
	unsigned int supported_tv_modes = 0;

...
	for (i = 0; i < property->num_values; i++)
		supported_tv_modes |= BIT(property->values[i]);

	if (supported_tv_modes & ntsc_modes)
...
	if (supported_tv_modes & pal_modes)
...

	if (BIT(default_mode) & ntsc_modes)
		first_mode_idx = 0;
	else
		first_mode_idx = 1;


Up to you if you want to do this.

Noralf.
