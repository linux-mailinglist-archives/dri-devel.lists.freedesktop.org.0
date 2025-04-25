Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A0A9CAF2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 15:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F34B10E2D5;
	Fri, 25 Apr 2025 13:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="TDP8TXou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Fri, 25 Apr 2025 13:58:59 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E24110E136;
 Fri, 25 Apr 2025 13:58:59 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4ZkZ3f06PTzDqKZ;
 Fri, 25 Apr 2025 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1745589022; bh=7CqMt7D2Ad0OtcbJ1KHWSMCb8AnEr8Q/w8mxHLM8Iq0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TDP8TXouRJvmjkbDW0zM2MYo8wbQeIbhhopfc2AquK3PaIlEalj7HWSGq05WDh4zw
 wOTyPwVxb0MOltnpnrNUOntEYq9oi1sUKAMBiT4PxdeYHgPEF/Lmibw34uqkIpAP9x
 4smaVArG5jbXPL7o3rp5xcKjifTqEsF75sVisS2U=
X-Riseup-User-ID: CFB9761A7B9478EF00DD78B6ADCE1D1E1118B035738A5D013E1345A46ECCA270
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4ZkZ3V09HPzJstx;
 Fri, 25 Apr 2025 13:50:13 +0000 (UTC)
Message-ID: <e03200db-3e24-49e6-87d4-a9253401c494@riseup.net>
Date: Fri, 25 Apr 2025 10:50:07 -0300
MIME-Version: 1.0
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
Content-Language: en-US
From: Leandro Ribeiro <leandrohr@riseup.net>
In-Reply-To: <20250326234748.2982010-41-alex.hung@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/26/25 20:47, Alex Hung wrote:
> It is to be used to enable HDR by allowing userpace to create and pass
> 3D LUTs to kernel and hardware.
> 
> new drm_colorop_type: DRM_COLOROP_3D_LUT.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> v8:
>  - Fix typo in subject (Simon Ser)
>  - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
>  - Delete empty lines (Simon Ser)
> 
> v7:
>  - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)
> 
>  drivers/gpu/drm/drm_atomic.c      |  6 +++
>  drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
>  drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         | 21 +++++++++
>  include/uapi/drm/drm_mode.h       | 33 ++++++++++++++
>  5 files changed, 138 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 0efb0ead204a..ef47a06344f3 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>  	case DRM_COLOROP_MULTIPLIER:
>  		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
>  		break;
> +	case DRM_COLOROP_3D_LUT:
> +		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
> +		drm_printf(p, "\tinterpolation=%s\n",
> +			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
> +		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 947c18e8bf9b..d5d464b4d0f6 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -719,6 +719,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>  	case DRM_COLOROP_CTM_3X4:
>  		size = sizeof(struct drm_color_ctm_3x4);
>  		break;
> +	case DRM_COLOROP_3D_LUT:
> +		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
> +		       sizeof(struct drm_color_lut);
> +		break;
>  	default:
>  		/* should never get here */
>  		return -EINVAL;
> @@ -771,6 +775,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>  		*val = state->multiplier;
>  	} else if (property == colorop->lut_size_property) {
>  		*val = colorop->lut_size;
> +	} else if (property == colorop->lut3d_interpolation_property) {
> +		*val = colorop->lut3d_interpolation;
>  	} else if (property == colorop->data_property) {
>  		*val = (state->data) ? state->data->base.id : 0;
>  	} else {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index e03706e7179b..224c6be237d2 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>  	{ DRM_COLOROP_1D_LUT, "1D LUT" },
>  	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>  	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
> +	{ DRM_COLOROP_3D_LUT, "3D LUT"},
>  };
>  
>  static const char * const colorop_curve_1d_type_names[] = {
> @@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
>  	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
>  };
>  
> +
> +static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
> +	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
> +};
> +
>  /* Init Helpers */
>  
>  static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> @@ -349,6 +355,51 @@ int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>  }
>  EXPORT_SYMBOL(drm_colorop_mult_init);
>  
> +int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			   struct drm_plane *plane,
> +			   uint32_t lut_size,
> +			   enum drm_colorop_lut3d_interpolation_type interpolation,
> +			   bool allow_bypass)
> +{
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, allow_bypass);
> +	if (ret)
> +		return ret;
> +
> +	/* LUT size */
> +	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
> +					 "SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->lut_size_property = prop;
> +	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
> +	colorop->lut_size = lut_size;
> +
> +	/* interpolation */
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT3D_INTERPOLATION",
> +					drm_colorop_lut3d_interpolation_list,
> +					ARRAY_SIZE(drm_colorop_lut3d_interpolation_list));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->lut3d_interpolation_property = prop;
> +	drm_object_attach_property(&colorop->base, prop, interpolation);
> +	colorop->lut3d_interpolation = interpolation;
> +
> +	/* data */
> +	ret = drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_3dlut_init);
> +
>  static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
>  							struct drm_colorop_state *state)
>  {
> @@ -441,7 +492,13 @@ static const char * const colorop_type_name[] = {
>  	[DRM_COLOROP_1D_LUT] = "1D LUT",
>  	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
>  	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
> +	[DRM_COLOROP_3D_LUT] = "3D LUT",
>  };
> +
> +static const char * const colorop_lu3d_interpolation_name[] = {
> +	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
> +};
> +
>  static const char * const colorop_lut1d_interpolation_name[] = {
>  	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
>  };
> @@ -477,6 +534,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
>  	return colorop_lut1d_interpolation_name[type];
>  }
>  
> +/**
> + * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
> + * @type: interpolation type to compute name of
> + *
> + * In contrast to the other drm_get_*_name functions this one here returns a
> + * const pointer and hence is threadsafe.
> + */
> +const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
> +{
> +	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
> +		return "unknown";
> +
> +	return colorop_lu3d_interpolation_name[type];
> +}
> +
>  /**
>   * drm_colorop_set_next_property - sets the next pointer
>   * @colorop: drm colorop
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index c89d5eb44856..e999d5ceb8a5 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -281,6 +281,14 @@ struct drm_colorop {
>  	 */
>  	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
>  
> +	/**
> +	 * @lut3d_interpolation:
> +	 *
> +	 * Read-only
> +	 * Interpolation for DRM_COLOROP_3D_LUT
> +	 */
> +	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
> +
>  	/**
>  	 * @lut1d_interpolation_property:
>  	 *
> @@ -309,6 +317,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *lut_size_property;
>  
> +	/**
> +	 * @lut3d_interpolation_property:
> +	 *
> +	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
> +	 */
> +	struct drm_property *lut3d_interpolation_property;
> +
>  	/**
>  	 * @data_property:
>  	 *
> @@ -362,6 +377,11 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
>  			     struct drm_plane *plane, bool allow_bypass);
>  int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			      struct drm_plane *plane, bool allow_bypass);
> +int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			   struct drm_plane *plane,
> +			   uint32_t lut_size,
> +			   enum drm_colorop_lut3d_interpolation_type interpolation,
> +			   bool allow_bypass);
>  
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> @@ -412,6 +432,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
>   */
>  const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
>  const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
> +const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
>  
>  void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
>  
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d76c8ffe5408..88fafbdeb2a2 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -930,6 +930,39 @@ enum drm_colorop_type {
>  	 * property.
>  	 */
>  	DRM_COLOROP_MULTIPLIER,
> +
> +	/**
> +	 * @DRM_COLOROP_3D_LUT:
> +	 *
> +	 * enum string "3D LUT"
> +	 *
> +	 * A 3D LUT of &drm_color_lut entries,
> +	 * packed into a blob via the DATA property. The driver's expected
> +	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
> +	 * 17x17x17 entries will have SIZE set to 17.
> +	 *
> +	 * The DATA blob is a 3D array of struct drm_color_lut with dimension
> +	 * length of "lut_size".
> +	 * The LUT elements are traversed like so:
> +	 *
> +	 *   for R in range 0..n
> +	 *     for G in range 0..n
> +	 *       for B in range 0..n
> +	 *         color = lut3d[R][G][B]
> +	 */
> +	DRM_COLOROP_3D_LUT,
> +};

Hi,

I'm experimenting with V7 of the this API on Weston, using the AMD driver,
and I'm seeing issues with the usage of 3D LUT's: channels R and B being
swapped.
On Weston, the 3D LUT is constructed as:

for B in range 0..n
    for G in range 0..n
       for R in range 0..n
           index = R + n * (G + n * B)
           lut[index].red   = foo
           lut[index].green = foo
           lut[index].blue  = foo

To map that to DRM_COLOROP_3D_LUT, we do:

for B in range 0..n
    for G in range 0..n
       for R in range 0..n
           index_weston = R + n * (G + n * B)
           index_kernel = B + n * (G + n * R)
           lut_kernel[index_kernel].red   = lut[index_weston].red
           lut_kernel[index_kernel].green = lut[index_weston].green
           lut_kernel[index_kernel].blue  = lut[index_weston].blue

If I ignore the documentation and use the same indices, everything works
fine regarding the color channels.

Maybe there's a bug in our Weston code, but writing this just to confirm
that the documentation and the AMD driver are matching.

Thanks,
Leandro

> +
> +/**
> + * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
> + */
> +enum drm_colorop_lut3d_interpolation_type {
> +	/**
> +	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
> +	 *
> +	 * Tetrahedral 3DLUT interpolation
> +	 */
> +	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  };
>  
>  /**

