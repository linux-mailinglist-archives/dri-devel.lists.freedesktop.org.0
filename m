Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B2342B57
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 09:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168F6EB44;
	Sat, 20 Mar 2021 08:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs4.siol.net [185.57.226.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251DE6EB44
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 08:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 7F459522642;
 Sat, 20 Mar 2021 09:50:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id TFlOfe2HhvAr; Sat, 20 Mar 2021 09:50:14 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id ED9D0522B55;
 Sat, 20 Mar 2021 09:50:13 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 869D3522642;
 Sat, 20 Mar 2021 09:50:11 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/3] drm/connector: Create a helper to attach the
 hdr_output_metadata property
Date: Sat, 20 Mar 2021 09:50:11 +0100
Message-ID: <2023558.j0O6qmYYxO@jernej-laptop>
In-Reply-To: <20210319124922.144726-1-maxime@cerno.tech>
References: <20210319124922.144726-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne petek, 19. marec 2021 ob 13:49:20 CET je Maxime Ripard napisal(a):
> All the drivers that implement HDR output call pretty much the same
> function to initialise the hdr_output_metadata property, and while the
> creation of that property is in a helper, every driver uses the same
> code to attach it.
> 
> Provide a helper for it as well
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  3 +--
>  drivers/gpu/drm/drm_connector.c               | 21 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  3 +--
>  include/drm/drm_connector.h                   |  1 +
>  5 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c index
> 22124f76d0b5..06908a3cee0f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7017,9 +7017,7 @@ void amdgpu_dm_connector_init_helper(struct
> amdgpu_display_manager *dm, if (connector_type == DRM_MODE_CONNECTOR_HDMIA
> ||
>  	    connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
>  	    connector_type == DRM_MODE_CONNECTOR_eDP) {
> -		drm_object_attach_property(
> -			&aconnector->base.base,
> -			dm->ddev-
>mode_config.hdr_output_metadata_property, 0);
> +		
drm_connector_attach_hdr_output_metadata_property(&aconnector->base);
> 
>  		if (!aconnector->mst_port)
>  			
drm_connector_attach_vrr_capable_property(&aconnector->base);
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> dda4fa9a1a08..f24bbb840dbf 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2492,8 +2492,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi
> *hdmi) drm_connector_attach_max_bpc_property(connector, 8, 16);
> 
>  	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
> -		drm_object_attach_property(&connector->base,
> -			connector->dev-
>mode_config.hdr_output_metadata_property, 0);
> +		
drm_connector_attach_hdr_output_metadata_property(connector);
> 
>  	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
> 
> diff --git a/drivers/gpu/drm/drm_connector.c
> b/drivers/gpu/drm/drm_connector.c index 98b6ec45ef96..e25248e23e18 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2149,6 +2149,27 @@ int drm_connector_attach_max_bpc_property(struct
> drm_connector *connector, }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> 
> +/**
> + * drm_connector_attach_hdr_output_metadata_property - attach
> "HDR_OUTPUT_METADA" property + * @connector: connector to attach the
> property on.
> + *
> + * This is used to allow the userspace to send HDR Metadata to the
> + * driver.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_hdr_output_metadata_property(struct drm_connector
> *connector) +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop = dev-
>mode_config.hdr_output_metadata_property;
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
> +
>  /**
>   * drm_connector_set_vrr_capable_property - sets the variable refresh rate
>   * capable property for a connector
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c index
> c5959590562b..52c051efb7b7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2958,8 +2958,7 @@ intel_hdmi_add_properties(struct intel_hdmi
> *intel_hdmi, struct drm_connector *c
> drm_connector_attach_content_type_property(connector);
> 
>  	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
> -		drm_object_attach_property(&connector->base,
> -			connector->dev-
>mode_config.hdr_output_metadata_property, 0);
> +		
drm_connector_attach_hdr_output_metadata_property(connector);
> 
>  	if (!HAS_GMCH(dev_priv))
>  		drm_connector_attach_max_bpc_property(connector, 8, 
12);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b278ffad..32172dab8427 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1671,6 +1671,7 @@ int drm_connector_attach_scaling_mode_property(struct
> drm_connector *connector, u32 scaling_mode_mask);
>  int drm_connector_attach_vrr_capable_property(
>  		struct drm_connector *connector);
> +int drm_connector_attach_hdr_output_metadata_property(struct drm_connector
> *connector); int drm_mode_create_aspect_ratio_property(struct drm_device
> *dev); int drm_mode_create_hdmi_colorspace_property(struct drm_connector
> *connector); int drm_mode_create_dp_colorspace_property(struct
> drm_connector *connector);

For bridge part:
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
