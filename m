Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 734971A231F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 15:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DD46EA63;
	Wed,  8 Apr 2020 13:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5066EA62;
 Wed,  8 Apr 2020 13:35:59 +0000 (UTC)
IronPort-SDR: M6r4IyTVbanGIGsJJNCwpTNycE603aIOCK8TaroMROmlN/Yc4oK4KxeEtEv5b11tSYPiZAoQty
 hpEnNOa8TMiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 06:35:59 -0700
IronPort-SDR: 8IMh/o7yQaqcc1smZE/LaP58DUG2LoyXbvj9kC6TPiIe0XPdFBacZ18DwYHv367781OLmsPYAY
 4g7LOm663dug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; d="scan'208";a="361843103"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 08 Apr 2020 06:35:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Apr 2020 16:35:54 +0300
Date: Wed, 8 Apr 2020 16:35:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v3 1/5] drm: Introduce plane and CRTC scaling filter
 properties
Message-ID: <20200408133554.GR6112@intel.com>
References: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200330183857.13270-2-pankaj.laxminarayan.bharadiya@intel.com>
 <20200407172802.GJ6112@intel.com>
 <20200408094726.GA9393@plaxmina-desktop.iind.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408094726.GA9393@plaxmina-desktop.iind.intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniels@collabora.com, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 03:17:27PM +0530, Bharadiya,Pankaj wrote:
> On Tue, Apr 07, 2020 at 08:28:02PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Tue, Mar 31, 2020 at 12:08:53AM +0530, Pankaj Bharadiya wrote:
> > > Introduce per-plane and per-CRTC scaling filter properties to allow
> > > userspace to select the driver's default scaling filter or
> > > Nearest-neighbor(NN) filter for upscaling operations on CRTC and
> > > plane.
> > > =

> > > Drivers can set up this property for a plane by calling
> > > drm_plane_create_scaling_filter() and for a CRTC by calling
> > > drm_crtc_create_scaling_filter().
> > > =

> > > NN filter works by filling in the missing color values in the upscaled
> > > image with that of the coordinate-mapped nearest source pixel value.
> > > =

> > > NN filter for integer multiple scaling can be particularly useful for
> > > for pixel art games that rely on sharp, blocky images to deliver their
> > > distinctive look.
> > > =

> > > changes since v2:
> > > * Create per-plane and per-CRTC scaling filter property (Ville)
> > > changes since v1:
> > > * None
> > > changes since RFC:
> > > * Add separate properties for plane and CRTC (Ville)
> > > =

> > > Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.=
com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++
> > >  drivers/gpu/drm/drm_crtc.c        | 78 +++++++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/drm_plane.c       | 78 +++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_crtc.h            | 16 +++++++
> > >  include/drm/drm_plane.h           | 21 +++++++++
> > >  5 files changed, 201 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> > > index a1e5e262bae2..ac7dabbf0bcf 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -469,6 +469,8 @@ static int drm_atomic_crtc_set_property(struct dr=
m_crtc *crtc,
> > >  			return -EFAULT;
> > >  =

> > >  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
> > > +	} else if (property =3D=3D crtc->scaling_filter_property) {
> > > +		state->scaling_filter =3D val;
> > >  	} else if (crtc->funcs->atomic_set_property) {
> > >  		return crtc->funcs->atomic_set_property(crtc, state, property, val=
);
> > >  	} else {
> > > @@ -503,6 +505,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crt=
c,
> > >  		*val =3D (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> > >  	else if (property =3D=3D config->prop_out_fence_ptr)
> > >  		*val =3D 0;
> > > +	else if (property =3D=3D crtc->scaling_filter_property)
> > =

> > Random side observation: Why do we have two different styles to naming
> > these things (prop_foo vs. foo_property)? Would be nice to unify this
> > one way or the other.
> =

> Need to handle this separately.
> =

> All per-plane props follow foo_property convention and we have mixed =

> conventions for properties in struct drm_mode_config with majority being
> foo_property.
> =

> > =

> > > +		*val =3D state->scaling_filter;
> > >  	else if (crtc->funcs->atomic_get_property)
> > >  		return crtc->funcs->atomic_get_property(crtc, state, property, val=
);
> > >  	else
> > > @@ -583,6 +587,8 @@ static int drm_atomic_plane_set_property(struct d=
rm_plane *plane,
> > >  					sizeof(struct drm_rect),
> > >  					&replaced);
> > >  		return ret;
> > > +	} else if (property =3D=3D plane->scaling_filter_property) {
> > > +		state->scaling_filter =3D val;
> > >  	} else if (plane->funcs->atomic_set_property) {
> > >  		return plane->funcs->atomic_set_property(plane, state,
> > >  				property, val);
> > > @@ -641,6 +647,8 @@ drm_atomic_plane_get_property(struct drm_plane *p=
lane,
> > >  	} else if (property =3D=3D config->prop_fb_damage_clips) {
> > >  		*val =3D (state->fb_damage_clips) ?
> > >  			state->fb_damage_clips->base.id : 0;
> > > +	} else if (property =3D=3D plane->scaling_filter_property) {
> > > +		*val =3D state->scaling_filter;
> > >  	} else if (plane->funcs->atomic_get_property) {
> > >  		return plane->funcs->atomic_get_property(plane, state, property, v=
al);
> > >  	} else {
> > > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > > index 4936e1080e41..95502c88966b 100644
> > > --- a/drivers/gpu/drm/drm_crtc.c
> > > +++ b/drivers/gpu/drm/drm_crtc.c
> > > @@ -748,3 +748,81 @@ int drm_mode_crtc_set_obj_prop(struct drm_mode_o=
bject *obj,
> > >  =

> > >  	return ret;
> > >  }
> > > +
> > > +/**
> > > + * DOC: CRTC scaling filter property
> > > + *
> > > + * SCALING_FILTER:
> > > + *
> > > + *	Indicates scaling filter to be used for CRTC scaler
> > > + *
> > > + *	The value of this property can be one of the following:
> > > + *	Default:
> > > + *		Driver's default scaling filter
> > > + *	Nearest Neighbor:
> > > + *		Nearest Neighbor scaling filter
> > > + *
> > > + * Drivers can set up this property for a CRTC by calling
> > > + * drm_crtc_create_scaling_filter_property
> > > + */
> > > +
> > > +/**
> > > + * drm_crtc_create_scaling_filter_property - create a new scaling fi=
lter
> > > + * property
> > > + *
> > > + * @crtc: drm CRTC
> > > + * @supported_filters: bitmask of supported scaling filters, must in=
clude
> > > + *		       BIT(DRM_SCALING_FILTER_DEFAULT).
> > > + *
> > > + * This function lets driver to enable the scaling filter property o=
n a given
> > > + * CRTC.
> > > + *
> > > + * RETURNS:
> > > + * Zero for success or -errno
> > > + */
> > > +int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
> > > +					    unsigned int supported_filters)
> > > +{
> > > +	struct drm_device *dev =3D crtc->dev;
> > > +	struct drm_property *prop;
> > > +	static const struct drm_prop_enum_list props[] =3D {
> > > +		{ DRM_SCALING_FILTER_DEFAULT, "Default" },
> > > +		{ DRM_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> > > +	};
> > > +	unsigned int valid_mode_mask =3D BIT(DRM_SCALING_FILTER_DEFAULT) |
> > > +				       BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR);
> > > +	int i;
> > > +
> > > +	if (WARN_ON((supported_filters & ~valid_mode_mask) ||
> > > +		    ((supported_filters & BIT(DRM_SCALING_FILTER_DEFAULT)) =3D=3D =
0)))
> > > +		return -EINVAL;
> > > +
> > > +	prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM,
> > > +				   "SCALING_FILTER",
> > > +				   hweight32(supported_filters));
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(props); i++) {
> > > +		int ret;
> > > +
> > > +		if (!(BIT(props[i].type) & supported_filters))
> > > +			continue;
> > > +
> > > +		ret =3D drm_property_add_enum(prop, props[i].type,
> > > +					    props[i].name);
> > > +
> > > +		if (ret) {
> > > +			drm_property_destroy(dev, prop);
> > > +
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	drm_object_attach_property(&crtc->base, prop,
> > > +				   DRM_SCALING_FILTER_DEFAULT);
> > =

> > Everything up to here is identical between the crtc and plane. Needs a
> > refactoring. In fact this whole thing seems pretty generic.
> =

> How about spliting code like below -
> =

> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -72,6 +72,9 @@ int drm_crtc_force_disable(struct drm_crtc *crtc);
>  =

>  struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
>  =

> +struct drm_property *
> +drm_prepare_scaling_filter_prop(struct drm_device *dev,
> +				unsigned int supported_filters);

s/prepare/create/
with that seems good enough.

>  /* IOCTLs */
>  int drm_mode_getcrtc(struct drm_device *dev,
>  		     void *data, struct drm_file *file_priv);
> =

> =

> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index d6ad60ab0d38..e63614fe3eed 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1221,3 +1221,93 @@ int drm_mode_page_flip_ioctl(struct drm_device *de=
v,
>  =

>  	return ret;
>  }
> +
> +struct drm_property *
> +drm_prepare_scaling_filter_prop(struct drm_device *dev,
> +				unsigned int supported_filters)
> +{
> +	struct drm_property *prop;
> +	static const struct drm_prop_enum_list props[] =3D {
> +		{ DRM_SCALING_FILTER_DEFAULT, "Default" },
> +		{ DRM_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +	};
> +	unsigned int valid_mode_mask =3D BIT(DRM_SCALING_FILTER_DEFAULT) |
> +				       BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR);
> +	int i;
> +
> +	if (WARN_ON((supported_filters & ~valid_mode_mask) ||
> +		    ((supported_filters & BIT(DRM_SCALING_FILTER_DEFAULT)) =3D=3D 0)))
> +		return ERR_PTR(-EINVAL);
> +
> +	prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +				   "SCALING_FILTER",
> +				   hweight32(supported_filters));
> +	if (!prop)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(props); i++) {
> +		int ret;
> +
> +		if (!(BIT(props[i].type) & supported_filters))
> +			continue;
> +
> +		ret =3D drm_property_add_enum(prop, props[i].type,
> +					    props[i].name);
> +
> +		if (ret) {
> +			drm_property_destroy(dev, prop);
> +
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	return prop;
> +}
> +
> +/**
> + * drm_plane_create_scaling_filter_property - create a new scaling filter
> + * property
> + *
> + * @plane: drm plane
> + * @supported_filters: bitmask of supported scaling filters, must include
> + *		       BIT(DRM_SCALING_FILTER_DEFAULT).
> + *
> + * This function lets driver to enable the scaling filter property on a =
given
> + * plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> +					     unsigned int supported_filters)
> +{
> +	struct drm_property *prop =3D
> +		drm_prepare_scaling_filter_prop(plane->dev, supported_filters);
> +
> +	if (IS_ERR(prop))
> +		return PTR_ERR(prop);
> +
> +	drm_object_attach_property(&plane->base, prop,
> +				   DRM_SCALING_FILTER_DEFAULT);
> +	plane->scaling_filter_property =3D prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> =

> index 4936e1080e41..b48e0bce8f60 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> =

> +int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
> +					    unsigned int supported_filters)
> +{
> +	struct drm_property *prop =3D
> +		drm_prepare_scaling_filter_prop(crtc->dev, supported_filters);
> +
> +	if (IS_ERR(prop))
> +		return PTR_ERR(prop);
> +
> +	drm_object_attach_property(&crtc->base, prop,
> +				   DRM_SCALING_FILTER_DEFAULT);
> +	crtc->scaling_filter_property =3D prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> =

> =

> > Should probably think about just adding that bitmask to
> > drm_property_create_enum(). I suppose we could try to avoid having to
> > change all the existing callers by keeping the current thing without the
> > bitmask (though it could probably internally just call the version which
> > takes the bitmask, assuming our enum values aren't too big for that.
> =

> As more filters can be added in future and different hardwares can have
> different capabilities, I think it make sense to provide a bitmask to the
> callers so that drivers can expose *only* filters which they support.
> =

> What do you think?

I was musing about something like =


drm_property_create_enum(...
+	supported_bitmask
	);

Nothing specifically about the scaling filter prop.

>  =

> Thanks,
> Pankaj
> =

> > =

> > Otherwise the patch seems reasonable.
> > =

> > > +	crtc->scaling_filter_property =3D prop;
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> =

> [snip]
> >  					state->fb_damage_clips->data : NULL);
> > >  }
> > >  =

> > > +int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> > > +					     unsigned int supported_filters);
> > > +
> > >  #endif
> > > -- =

> > > 2.23.0
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
