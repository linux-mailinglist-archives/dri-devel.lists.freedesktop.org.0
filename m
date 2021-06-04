Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC7939BEAA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEC76F648;
	Fri,  4 Jun 2021 17:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112CF6F645;
 Fri,  4 Jun 2021 17:26:51 +0000 (UTC)
IronPort-SDR: tWTVzyjj1JsqHL1upD1hPHNyRx1vZ4ucYw/hh11+rYmTLx6kdaOhtftozK/F2BShTVZ7Z1LLMG
 ENjT0baCPo+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="184705800"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="184705800"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 10:26:50 -0700
IronPort-SDR: hHxfs9zcgC2O6PZrXBqdGq+eSyydodxVXZvXVI2bKozhgASgx9bBU8+ndopyiwkqxP9Y2HmPs8
 GPnpR/h35PpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="439257354"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 04 Jun 2021 10:26:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Jun 2021 20:26:44 +0300
Date: Fri, 4 Jun 2021 20:26:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 2/4] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
Message-ID: <YLpiVFiBrgH29rki@intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-3-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210604171723.10276-3-wse@tuxedocomputers.com>
X-Patchwork-Hint: comment
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
Cc: amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 07:17:21PM +0200, Werner Sembach wrote:
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
> information available.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
>  drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       | 15 ++++++++++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 268bb69c2e2f..7ae4e40936b5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = 0;
>  	} else if (property == connector->max_bpc_property) {
>  		*val = state->max_requested_bpc;
> +	} else if (property == connector->active_bpc_property) {
> +		*val = state->active_bpc;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7631f76e7f34..5f42a5be5822 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * active bpc:
> + *	This read-only range property is used by userspace check the bit depth
> + *	actually applied by the GPU driver after evaluation all hardware
> + *	capabilities and max bpc. Drivers to use the function
> + *	drm_connector_attach_active_bpc_property() to create and attach the
> + *	property to the connector during initialization.
> + *
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
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
> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
> +					  int min, int max)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	prop = connector->active_bpc_property;
> +	if (!prop) {
> +		prop = drm_property_create_range(dev, 0, "active bpc", min, max);

Should be immutable.

Also wondering what the semantics of this should be when eg. DSC
is active?

> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_bpc_property = prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->active_bpc = 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
> +
>  /**
>   * drm_connector_set_vrr_capable_property - sets the variable refresh rate
>   * capable property for a connector
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b278ffad..c58cba2b6afe 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -781,6 +781,13 @@ struct drm_connector_state {
>  	 */
>  	u8 max_bpc;
>  
> +	/**
> +	 * @active_bpc: Read only property set by the GPU driver to the actually
> +	 * applied bit depth of the pixels after evaluating all hardware
> +	 * limitations.
> +	 */
> +	u8 active_bpc;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1380,6 +1387,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
>  
> +	/**
> +	 * @active_bpc_property: Default connector property for the active bpc
> +	 * to be driven out of the connector.
> +	 */
> +	struct drm_property *active_bpc_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>  	int width, int height);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  					  int min, int max);
> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
> +					  int min, int max);
>  
>  /**
>   * struct drm_tile_group - Tile group metadata
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
