Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F050E8CB183
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8EF10E15D;
	Tue, 21 May 2024 15:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JbcXK/z3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F232D10E2C8;
 Tue, 21 May 2024 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=COb2kmr3gM5P1kCCxQjsjSUfGcP4aWSoaPzMlKcB/L8=; b=JbcXK/z3Nq36K/+EuLL0nfDGOA
 ebWB0fHqW0z1MkCZKwS12jr3lqHcl0O2J3JJcj9gC020eU+/JqqM7hx5Ag2YUbYS8Oon4EJtrWgVO
 JDbeZ+41MCBIislX6ItvPLvb4yq5eBc5K8Yn8QysoCVvYu2Aqs0p1YATjMOoigM4X99GXNRR9tgcV
 k2QokQbhdlLnkWDdpQio1J+SJ/R6tYta2eNqPpKtap3dV8J6iQpt4X/QV8ZRHesQ5y8ZMVD87AvPx
 SW9CCYGWxkUbbiUgxKOOJrFvZTtRBOpNmF27Sd/7A+ED1UFj3snkiX4DVRVtuhCCmk7zrUa+bRH/y
 kPrxv4TA==;
Received: from [192.168.13.219] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9RZN-00Ahzh-Pl; Tue, 21 May 2024 17:38:29 +0200
Date: Tue, 21 May 2024 17:38:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>
Subject: Re: [RFC PATCH v4 41/42] drm/colorop: Add mutliplier type
Message-ID: <36ye5xqrcgxqwhiqiylfjuuz3mzb4agfsqlimt74iildgd2k2p@tsithai6xhh3>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-42-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-42-harry.wentland@amd.com>
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

On 02/26, Harry Wentland wrote:
> From: Alex Hung <alex.hung@amd.com>
> 
> This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.
> 
> It's a simple multiplier to all pixel values. The value is
> specified via a S31.32 fixed point provided via the
> "MULTIPLIER" property.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  3 +++
>  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>  drivers/gpu/drm/drm_colorop.c     | 29 +++++++++++++++++++++++++++--
>  include/drm/drm_colorop.h         | 16 ++++++++++++++++
>  include/uapi/drm/drm_mode.h       |  1 +
>  5 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index f7d51839ca03..af0b6338a55c 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -806,6 +806,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>  	case DRM_COLOROP_CTM_3X4:
>  		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
>  		break;
> +	case DRM_COLOROP_MULTIPLIER:
> +		drm_printf(p, "\tmultiplier=%u\n", state->multiplier);

Compiler complains of unsigned int instead of llu.

> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 6bfe857720cd..b4ecda563728 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -727,6 +727,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>  		state->bypass = val;
>  	} else if (property == colorop->curve_1d_type_property) {
>  		state->curve_1d_type = val;
> +	} else if (property == colorop->multiplier_property) {
> +		state->multiplier = val;
>  	} else if (property == colorop->data_property) {
>  		return drm_atomic_color_set_data_property(colorop,
>  					state, property, val);
> @@ -752,6 +754,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>  		*val = state->bypass;
>  	} else if (property == colorop->curve_1d_type_property) {
>  		*val = state->curve_1d_type;
> +	} else if (property == colorop->multiplier_property) {
> +		*val = state->multiplier;
>  	} else if (property == colorop->size_property) {
>  		*val = state->size;
>  	} else if (property == colorop->data_property) {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4452eaeeb242..c6cdd743de51 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -35,7 +35,8 @@
>  static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>  	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
>  	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
> -	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
> +	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
> +	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
>  };
>  
>  static const char * const colorop_curve_1d_type_names[] = {
> @@ -231,6 +232,29 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
>  }
>  EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
>  
> +int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			      struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
> +	if (ret)
> +		return ret;
> +
> +	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->multiplier_property = prop;
> +	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_mult_init);
> +
>  static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
>  							struct drm_colorop_state *state)
>  {
> @@ -333,7 +357,8 @@ EXPORT_SYMBOL(drm_colorop_reset);
>  static const char * const colorop_type_name[] = {
>  	[DRM_COLOROP_1D_CURVE] = "1D Curve",
>  	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
> -	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
> +	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
> +	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
>  };
>  
>  /**
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 8adc7ece3bd1..f9f83644cc9f 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -64,6 +64,13 @@ struct drm_colorop_state {
>  	 */
>  	enum drm_colorop_curve_1d_type curve_1d_type;
>  
> +	/**
> +	 * @multiplier:
> +	 *
> +	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
> +	 */
> +	uint64_t multiplier;
> +
>  	/**
>  	 * @size:
>  	 *
> @@ -186,6 +193,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *curve_1d_type_property;
>  
> +	/**
> +	 * @multiplier_property:
> +	 *
> +	 * Multiplier property for plane gain
> +	 */
> +	struct drm_property *multiplier_property;
> +
>  	/**
>  	 * @size_property:
>  	 *
> @@ -246,6 +260,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
>  				  struct drm_plane *plane, uint32_t lut_size);
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane);
> +int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			      struct drm_plane *plane);
>  
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 07fd66dc477c..754fd4c48123 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -876,6 +876,7 @@ enum drm_colorop_type {
>  	DRM_COLOROP_1D_CURVE,
>  	DRM_COLOROP_1D_LUT,
>  	DRM_COLOROP_CTM_3X4,
> +	DRM_COLOROP_MULTIPLIER,
>  };
>  
>  /**
> -- 
> 2.44.0
> 
