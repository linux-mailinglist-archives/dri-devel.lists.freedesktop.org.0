Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5DF3A879D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 19:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1E88E7E;
	Tue, 15 Jun 2021 17:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48588E7E;
 Tue, 15 Jun 2021 17:34:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 5AFD5C800AA;
 Tue, 15 Jun 2021 19:34:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id iIlhLzXEOa_i; Tue, 15 Jun 2021 19:34:01 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:3452:53ea:4253:eacd]
 (p200300e37f394900345253Ea4253eacD.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:3452:53ea:4253:eacd])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 0F120C800A8;
 Tue, 15 Jun 2021 19:34:00 +0200 (CEST)
Subject: Re: [PATCH v3 03/14] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20210615141426.6001-1-wse@tuxedocomputers.com>
 <20210615141426.6001-4-wse@tuxedocomputers.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <5a09c552-34ee-118f-7958-6ea7e8b17457@tuxedocomputers.com>
Date: Tue, 15 Jun 2021 19:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615141426.6001-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Am 15.06.21 um 16:14 schrieb Werner Sembach:
> Add a new general drm property "active bpc" which can be used by graphic drivers
> to report the applied bit depth per pixel back to userspace.
>
> While "max bpc" can be used to change the color depth, there was no way to check
> which one actually got used. While in theory the driver chooses the best/highest
> color depth within the max bpc setting a user might not be fully aware what his
> hardware is or isn't capable off. This is meant as a quick way to double check
> the setup.
>
> In the future, automatic color calibration for screens might also depend on this
> information being available.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/gpu/drm/drm_connector.c | 50 +++++++++++++++++++++++++++++++++
>   include/drm/drm_connector.h     |  8 ++++++
>   2 files changed, 58 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index da39e7ff6965..02c310c1ac2d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1197,6 +1197,14 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>    *	drm_connector_attach_max_bpc_property() to create and attach the
>    *	property to the connector during initialization.
>    *
> + * active bpc:
> + *	This read-only range property tells userspace the pixel color bit depth
> + *	actually used by the hardware display engine on "the cable" on a
> + *	connector. The chosen value depends on hardware capabilities, both
> + *	display engine and connected monitor, and the "max bpc" property.
> + *	Drivers shall use drm_connector_attach_active_bpc_property() to install
> + *	this property.
> + *
>    * Connectors also have one standardized atomic property:
>    *
>    * CRTC_ID:
> @@ -2152,6 +2160,48 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>   }
>   EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>   
> +/**
> + * drm_connector_attach_active_bpc_property - attach "active bpc" property
> + * @connector: connector to attach active bpc property on.
> + * @min: The minimum bit depth supported by the connector.
> + * @max: The maximum bit depth supported by the connector.
> + *
> + * This is used to check the applied bit depth on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->active_bpc_property) {
> +		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "active bpc", min, max);
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_bpc_property = prop;
> +		drm_object_attach_property(&connector->base, prop, 0);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
> +
> +/**
> + * drm_connector_set_active_bpc_property - sets the active bits per color property for a connector
> + * @connector: drm connector
> + * @active_bpc: bits per color for the connector currently active on "the cable"
> + *
> + * Should be used by atomic drivers to update the active bits per color over a connector.
> + */
> +void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc)
> +{
> +	drm_object_property_set_value(&connector->base, connector->active_bpc_property, active_bpc);
> +}
> +EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
> +
>   /**
>    * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>    * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 714d1a01c065..eee86de62a5f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1380,6 +1380,12 @@ struct drm_connector {
>   	 */
>   	struct drm_property *max_bpc_property;
>   
> +	/**
> +	 * @active_bpc_property: Default connector property for the active bpc
> +	 * to be driven out of the connector.
> +	 */
> +	struct drm_property *active_bpc_property;
> +
>   #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>   #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>   #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1702,6 +1708,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>   	int width, int height);
>   int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>   					  int min, int max);
> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max);
> +void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc);
>   
>   /**
>    * struct drm_tile_group - Tile group metadata

I looked into DSC:

In both the amd and intel implementation it's:

max_bpc >= uncompressed bpc >= dsc bpc

Currently the patch is setting active bpc to the uncompressed bpc.

I gave the DSC specification a (very brief) look and did not find any 
obvious mention of some kind bpc upsampling, so I guess the dsc bpc is 
what the user actually sees in the end.

=> In the next version, active bpc will be set to dsc bpc in the case 
dsc is active.

I did not look into dithering yet, but it's next on my list.

