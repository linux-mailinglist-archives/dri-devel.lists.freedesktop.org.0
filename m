Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B587378C884
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6665710E39C;
	Tue, 29 Aug 2023 15:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4896410E381
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693322643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FoaczId3AvxtRQ59qXDITQKv68yeRo4BI+wVycOHI1I=;
 b=MXZtJsnSaBuRPihZmyUB8ueFYI7Rcbh1iFk2hW1acWuT0u6Nk8c29zxsVv4PoRRZEPJnlK
 tsn9HEaBzMHs2XZ9eOPVygUM7UHBnJNaWo0M5bJrhYKlGkHP6nBmgeTt8rjTkbQcxiPMuF
 lN2xRFvs4KoWdW+sX/oGQWRDQNo0sAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-WUlZb0cZNPSG_y_edzh_Ww-1; Tue, 29 Aug 2023 11:24:02 -0400
X-MC-Unique: WUlZb0cZNPSG_y_edzh_Ww-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31ade95a897so3122043f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 08:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693322640; x=1693927440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoaczId3AvxtRQ59qXDITQKv68yeRo4BI+wVycOHI1I=;
 b=Tk9bJWoaslQkiKAC9vUkRDQu0FibPs4oOWxaabOYD6kgwv4C+zMTqthwQ8Ootus8Tg
 tmIy+LRhJfdtWrgstXAC80j9mFP2ly+kuRWfrgnECMVSLBOGedAD7jGd500kUqEonz1D
 h0JGiO4nfyXCAkgp7YUue4Td/P0O3z6KZvpJMa/i8U3Mj3Zfq1gehrmj5TOXLohnMfOE
 xnunBU1cW0xmzZQ+ntjMlOex7EtisnMERxoW5uClh4gHhU8y7QjtCh2554efxY6W52ew
 PpkUlCeEGklVRWPvAXQj/x0mUozIThHea40quhg7WJe7hQxUuD2IbhBmWtESagvJ3lob
 +N3w==
X-Gm-Message-State: AOJu0Yy1aVy/IvTntvybvV3ugXCSPmg65Sgtnw5Ip8USlijg85FSFKyO
 c8LtcOdSYCqOtcEAGUp1HlVF/urSW3eV3rjRh7JFv6LV5ax1K7MbzcIEh2U4S7sjs0lHOW7+TMF
 wa8N4a6ZQbXpxpifoSl/o4w3d7lC6
X-Received: by 2002:a5d:6382:0:b0:319:8bd0:d18c with SMTP id
 p2-20020a5d6382000000b003198bd0d18cmr20827086wru.52.1693322639817; 
 Tue, 29 Aug 2023 08:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKM/5RUEdU2op+akf1dybSWYcX+o2Dy79eBZvWDH3TVPUJBRVekfDfrKKa2F8dNkARcvLkrQ==
X-Received: by 2002:a5d:6382:0:b0:319:8bd0:d18c with SMTP id
 p2-20020a5d6382000000b003198bd0d18cmr20827053wru.52.1693322639416; 
 Tue, 29 Aug 2023 08:23:59 -0700 (PDT)
Received: from toolbox ([2001:9e8:898c:cd00:3d7e:40e1:d773:8f52])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a5d6144000000b00316eb7770b8sm14208017wrt.5.2023.08.29.08.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 08:23:59 -0700 (PDT)
Date: Tue, 29 Aug 2023 17:23:57 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 02/10] drm: Introduce solid fill DRM plane property
Message-ID: <20230829152250.GA258687@toolbox>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-2-a820efcce852@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20230828-solid-fill-v6-2-a820efcce852@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 05:05:08PM -0700, Jessica Zhang wrote:
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
> 
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
> 
> struct drm_mode_solid_fill {
> 	u32 r, g, b;
> };
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 26 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 36 +++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h               | 24 +++++++++++++++++++++
>  6 files changed, 126 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 01638c51ce0a..86fb876efbe6 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -254,6 +254,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>  	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>  	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>  
> +	if (plane_state->solid_fill_blob) {
> +		drm_property_blob_put(plane_state->solid_fill_blob);
> +		plane_state->solid_fill_blob = NULL;
> +	}
> +
>  	if (plane->color_encoding_property) {
>  		if (!drm_object_property_get_default_value(&plane->base,
>  							   plane->color_encoding_property,
> @@ -336,6 +341,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>  	if (state->fb)
>  		drm_framebuffer_get(state->fb);
>  
> +	if (state->solid_fill_blob)
> +		drm_property_blob_get(state->solid_fill_blob);
> +
>  	state->fence = NULL;
>  	state->commit = NULL;
>  	state->fb_damage_clips = NULL;
> @@ -385,6 +393,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>  		drm_crtc_commit_put(state->commit);
>  
>  	drm_property_blob_put(state->fb_damage_clips);
> +	drm_property_blob_put(state->solid_fill_blob);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 454f980e16c9..1cae596ab693 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -316,6 +316,20 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>  }
>  EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>  
> +static void drm_atomic_set_solid_fill_prop(struct drm_plane_state *state)
> +{
> +	struct drm_mode_solid_fill *user_info;
> +
> +	if (!state->solid_fill_blob)
> +		return;
> +
> +	user_info = (struct drm_mode_solid_fill *)state->solid_fill_blob->data;
> +
> +	state->solid_fill.r = user_info->r;
> +	state->solid_fill.g = user_info->g;
> +	state->solid_fill.b = user_info->b;
> +}
> +
>  static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>  				   struct drm_crtc *crtc, s32 __user *fence_ptr)
>  {
> @@ -546,6 +560,15 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  		state->src_h = val;
>  	} else if (property == plane->pixel_source_property) {
>  		state->pixel_source = val;
> +	} else if (property == plane->solid_fill_property) {
> +		ret = drm_atomic_replace_property_blob_from_id(dev,
> +				&state->solid_fill_blob,
> +				val, sizeof(struct drm_mode_solid_fill),
> +				-1, &replaced);
> +		if (ret)
> +			return ret;
> +
> +		drm_atomic_set_solid_fill_prop(state);
>  	} else if (property == plane->alpha_property) {
>  		state->alpha = val;
>  	} else if (property == plane->blend_mode_property) {
> @@ -620,6 +643,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = state->src_h;
>  	} else if (property == plane->pixel_source_property) {
>  		*val = state->pixel_source;
> +	} else if (property == plane->solid_fill_property) {
> +		*val = state->solid_fill_blob ?
> +			state->solid_fill_blob->base.id : 0;
>  	} else if (property == plane->alpha_property) {
>  		*val = state->alpha;
>  	} else if (property == plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index c3c57bae06b7..273021cc21c8 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -200,6 +200,10 @@
>   *	"FB":
>   *		Framebuffer source set by the "FB_ID" property.
>   *
> + * solid_fill:
> + *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
> + *	contains pixel data that drivers can use to fill a plane.
> + *
>   * Note that all the property extensions described here apply either to the
>   * plane or the CRTC (e.g. for the background color, which currently is not
>   * exposed and assumed to be black).
> @@ -705,3 +709,29 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> +
> +/**
> + * drm_plane_create_solid_fill_property - create a new solid_fill property
> + * @plane: drm plane
> + *
> + * This creates a new property blob that holds pixel data for solid fill planes.
> + * The property is exposed to userspace as a property blob called "solid_fill".
> + *
> + * For information on what the blob contains, see `drm_mode_solid_fill`.
> + */
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create(plane->dev,
> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
> +			"solid_fill", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +	plane->solid_fill_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 122bbfbaae33..e7158fbee389 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -60,4 +60,5 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>  					 unsigned int supported_modes);
>  int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>  					   unsigned long extra_sources);
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 89508b4dea4a..a38e18bfb43e 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -46,6 +46,18 @@ enum drm_plane_pixel_source {
>  	DRM_PLANE_PIXEL_SOURCE_MAX
>  };
>  
> +/**
> + * struct solid_fill_property - RGB values for solid fill plane
> + *
> + * TODO: Add solid fill source and corresponding pixel source
> + *       that supports RGBA color
> + */
> +struct drm_solid_fill {
> +	uint32_t r;
> +	uint32_t g;
> +	uint32_t b;
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -130,6 +142,23 @@ struct drm_plane_state {
>  	 */
>  	enum drm_plane_pixel_source pixel_source;
>  
> +	/**
> +	 * @solid_fill_blob:
> +	 *
> +	 * Blob containing relevant information for a solid fill plane
> +	 * including pixel format and data. See

Pixel format is not part of the blob anymore.

> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_property_blob *solid_fill_blob;
> +
> +	/**
> +	 * @solid_fill:
> +	 *
> +	 * Pixel data for solid fill planes. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_solid_fill solid_fill;
> +
>  	/**
>  	 * @alpha:
>  	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -720,6 +749,13 @@ struct drm_plane {
>  	 */
>  	struct drm_property *pixel_source_property;
>  
> +	/**
> +	 * @solid_fill_property:
> +	 * Optional solid_fill property for this plane. See
> +	 * drm_plane_create_solid_fill_property().
> +	 */
> +	struct drm_property *solid_fill_property;
> +
>  	/**
>  	 * @alpha_property:
>  	 * Optional alpha property for this plane. See
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 43691058d28f..1fd92886d66c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>  	char name[DRM_DISPLAY_MODE_LEN];
>  };
>  
> +/**
> + * struct drm_mode_solid_fill - User info for solid fill planes
> + *
> + * This is the userspace API solid fill information structure.
> + *
> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
> + * color and setting the pixel source to "SOLID_FILL".
> + *
> + * For information on the plane property, see drm_plane_create_solid_fill_property()
> + *
> + * @r: Red color value of single pixel
> + * @g: Green color value of single pixel
> + * @b: Blue color value of single pixel
> + * @pad: padding
> + */
> +struct drm_mode_solid_fill {
> +	__u32 r;
> +	__u32 g;
> +	__u32 b;
> +	__u32 pad;
> +};
> +
> +
>  struct drm_mode_card_res {
>  	__u64 fb_id_ptr;
>  	__u64 crtc_id_ptr;
> 
> -- 
> 2.42.0
> 

