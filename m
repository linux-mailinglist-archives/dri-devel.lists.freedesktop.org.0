Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99D6961AB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7310E18B;
	Tue, 14 Feb 2023 11:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C0B10E18B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676372515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8b9p/fvt5+n9OOpxKgfeIj6wIuTrg7IC7U73UoDlpc0=;
 b=NQgiazIb55BbSQ6Q3FninV/EqDJjo1PH8RKd+5ltvcEb8lytXx/ZxGromFvBNTclJVS4Rd
 hCOU8nYq/HBiyS+7I5ChDTcCEmCqT4+XLLEfeG7BsEEkXaekHS6z3U58R14cIV4Jrbx+5n
 Y87YDVhrzUuEvqktxY9S6x6TWkAnqPA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-GG1QAURYO4qJQOeHZP1JeQ-1; Tue, 14 Feb 2023 06:01:54 -0500
X-MC-Unique: GG1QAURYO4qJQOeHZP1JeQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 fy3-20020a1709069f0300b008a69400909fso9618084ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 03:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8b9p/fvt5+n9OOpxKgfeIj6wIuTrg7IC7U73UoDlpc0=;
 b=oe4LLkMLxxx9po8BEOwpb9LAYKjQF5bssY3opVT7jCy+BKEiqRJpd1S6VHyYyttn8P
 WVToLA6d3osGrpxKQjVJPfMb1LcF0VwdkPqAg3faXhGmpKEz+hyvl8RIrb18kcXtNoFF
 56aDb8GqWzIMov4rBeyrRUHey15D8zXDMtv7gTyCrgP6vYvny9vVFFTt5Jr/64Stv6fl
 1Nj7GYHIuXecCoWgXHeMA8aYA66WpvgrIQt2YMbLHZAaaDmH0CiwhKwh7WkL1AczBk6E
 ByqHeXsWAFHpZ9jL4iuosCCsv4hunNuvpoK11u2HmypB0ZXNCIvyGhfGMAtUk/oYxyvn
 ZPrQ==
X-Gm-Message-State: AO0yUKXutEbAtDjuetUlzpNy7PSFvR2Fj0WZzPuOBwdOJHv74G3Tjd2M
 GcgqZ9+mSYVVqCmxUfQSDKvJuKjwx8XaHT2uIyeGAljw6PqHSqPykVIN+pK7KxBYF9CEt5+XGB4
 mW4ZALooZ+erexJ1Opr3A8JY4RP17
X-Received: by 2002:a17:907:11dc:b0:88f:13f0:4565 with SMTP id
 va28-20020a17090711dc00b0088f13f04565mr2090754ejb.69.1676372513023; 
 Tue, 14 Feb 2023 03:01:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+LAHCrVcn3GbZDnHJgOQ/w9D/ZDBvGVyEJ1AdGzJ5kjZPNNGppUGO0emHnnhI/wnJy39vNaA==
X-Received: by 2002:a17:907:11dc:b0:88f:13f0:4565 with SMTP id
 va28-20020a17090711dc00b0088f13f04565mr2090731ejb.69.1676372512713; 
 Tue, 14 Feb 2023 03:01:52 -0800 (PST)
Received: from redhat.com (host-90-235-85-221.mobileonline.telia.com.
 [90.235.85.221]) by smtp.gmail.com with ESMTPSA id
 u19-20020a1709067d1300b0088b93bfa765sm8082122ejo.138.2023.02.14.03.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 03:01:52 -0800 (PST)
Date: Tue, 14 Feb 2023 12:01:49 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <Y+tqHZQ/sg3u/VxR@redhat.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <Y+UAN7V+kA58yMfn@redhat.com> <Y+tTpH1nfHIG/Dxg@intel.com>
 <Y+taU+zDiTO9aA0U@redhat.com> <Y+tiXJglfpzgUEFD@intel.com>
MIME-Version: 1.0
In-Reply-To: <Y+tiXJglfpzgUEFD@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 12:28:44PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 14, 2023 at 10:54:27AM +0100, Jonas Ådahl wrote:
> > On Tue, Feb 14, 2023 at 11:25:56AM +0200, Ville Syrjälä wrote:
> > > On Thu, Feb 09, 2023 at 03:16:23PM +0100, Jonas Ådahl wrote:
> > > > On Wed, Feb 08, 2023 at 11:10:16PM +0200, Ville Syrjala wrote:
> > > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > 
> > > > > Add a new immutable plane property by which a plane can advertise
> > > > > a handful of recommended plane sizes. This would be mostly exposed
> > > > > by cursor planes as a slightly more capable replacement for
> > > > > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > > > > a one size fits all limit for the whole device.
> > > > > 
> > > > > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > > > > size via the cursor size caps. But always using the max sized
> > > > > cursor can waste a surprising amount of power, so a better
> > > > > stragey is desirable.
> > > > > 
> > > > > Most other drivers don't specify any cursor size at all, in
> > > > > which case the ioctl code just claims that 64x64 is a great
> > > > > choice. Whether that is actually true is debatable.
> > > > > 
> > > > > A poll of various compositor developers informs us that
> > > > > blindly probing with setcursor/atomic ioctl to determine
> > > > > suitable cursor sizes is not acceptable, thus the
> > > > > introduction of the new property to supplant the cursor
> > > > > size caps. The compositor will now be free to select a
> > > > > more optimal cursor size from the short list of options.
> > > > > 
> > > > > Note that the reported sizes (either via the property or the
> > > > > caps) make no claims about things such as plane scaling. So
> > > > > these things should only really be consulted for simple
> > > > > "cursor like" use cases.
> > > > > 
> > > > > v2: Try to add some docs
> > > > > 
> > > > > Cc: Simon Ser <contact@emersion.fr>
> > > > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_mode_config.c |  7 +++++
> > > > >  drivers/gpu/drm/drm_plane.c       | 48 +++++++++++++++++++++++++++++++
> > > > >  include/drm/drm_mode_config.h     |  5 ++++
> > > > >  include/drm/drm_plane.h           |  4 +++
> > > > >  include/uapi/drm/drm_mode.h       | 11 +++++++
> > > > >  5 files changed, 75 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > > index 87eb591fe9b5..21860f94a18c 100644
> > > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > > > @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> > > > >  		return -ENOMEM;
> > > > >  	dev->mode_config.modifiers_property = prop;
> > > > >  
> > > > > +	prop = drm_property_create(dev,
> > > > > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > > > > +				   "SIZE_HINTS", 0);
> > > > > +	if (!prop)
> > > > > +		return -ENOMEM;
> > > > > +	dev->mode_config.size_hints_property = prop;
> > > > > +
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > > > index 24e7998d1731..ae51b1f83755 100644
> > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > @@ -140,6 +140,21 @@
> > > > >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
> > > > >   *     various bugs in this area with inconsistencies between the capability
> > > > >   *     flag and per-plane properties.
> > > > > + *
> > > > > + * SIZE_HINTS:
> > > > > + *     Blob property which contains the set of recommended plane size
> > > > > + *     which can used for simple "cursor like" use cases (eg. no scaling).
> > > > > + *     Using these hints frees userspace from extensive probing of
> > > > > + *     supported plane sizes through atomic/setcursor ioctls.
> > > > > + *
> > > > > + *     For optimal usage userspace should pick the smallest size
> > > > > + *     that satisfies its own requirements.
> > > > > + *
> > > > > + *     The blob contains an array of struct drm_plane_size_hint.
> > > > > + *
> > > > > + *     Drivers should only attach this property to planes that
> > > > > + *     support a very limited set of sizes (eg. cursor planes
> > > > > + *     on typical hardware).
> > > > 
> > > > This is a bit awkward since problematic drivers would only expose
> > > > this property if they are new enough.
> > > > 
> > > > A way to avoid this is for all new drivers expose this property, but
> > > > special case the size 0x0 as "everything below the max limit goes". Then
> > > > userspace can do (ignoring the missing cap fallback).
> > > 
> > > I don't think there are any drivers that need that.
> > > So I'm thinking we can just ignore that for now.
> > 
> > None the less, userspace not seeing SIZE_HINTS will be required to
> > indefinitely use the existing "old" behavior using the size cap as the
> > buffer size with a fallback, and drivers without any size limitations
> > that, i.e. details that are hard to express with a set of accepted
> > sizes, will still use the inoptimal buffer sizes.
> > 
> > If I read [1] correctly, AMD has no particular size limitations other
> > than a size limit, but without a SIZE_HINTS, userspace still needs to
> > use the maximum size.
> 
> Simon pointed out they have pretty much the same exact limits as i915.
> Ie. only a few power of two sizes, and stride must match width.

How about various ARM drivers, where the cursor plane is a regular
overlay plane with an artificial 'cursor' stamp on it?

Either way, the documentation creates an impossible expectation -
drivers, existing of future, that does not "support for a very limited
set of sizes" but actually any size below a limit, can't communicate to
userspace that it can handle cursor buffers with an arbitrary sizes,
without userspace breaking on todays kernels.


Jonas

> 
> > 
> > [1] https://gitlab.freedesktop.org/drm/intel/-/issues/7687#note_1760865
> > 
> > 
> > Jonas
> > 
> > > 
> > > > 
> > > >     if (has(SIZE_HINTS))
> > > >         size = figure_out_size(SIZE_HINTS,
> > > > 	                       DRM_CAP_CURSOR_WIDTH,
> > > > 			       DRM_CAP_CURSOR_HEIGHT,
> > > > 			       preferred_size);
> > > >     else
> > > >         size = DRM_CAP_CURSOR_WIDTH x DRM_CAP_CURSOR_WIDTH;
> > > > 
> > > > With `figure_out_size()` knowing how to deal with 0x0 in the size hints
> > > > to use `preferred_size` directly.
> > > > 
> > > > 
> > > > Jonas
> > > > 
> > > > >   */
> > > > >  
> > > > >  static unsigned int drm_num_planes(struct drm_device *dev)
> > > > > @@ -1582,3 +1597,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> > > > >  	return 0;
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> > > > > +
> > > > > +/**
> > > > > + * drm_plane_add_size_hint_property - create a size hint property
> > > > > + *
> > > > > + * @plane: drm plane
> > > > > + * @hints: size hints
> > > > > + * @num_hints: number of size hints
> > > > > + *
> > > > > + * Create a size hints property for the plane.
> > > > > + *
> > > > > + * RETURNS:
> > > > > + * Zero for success or -errno
> > > > > + */
> > > > > +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> > > > > +				      const struct drm_plane_size_hint *hints,
> > > > > +				      int num_hints)
> > > > > +{
> > > > > +	struct drm_device *dev = plane->dev;
> > > > > +	struct drm_mode_config *config = &dev->mode_config;
> > > > > +	struct drm_property_blob *blob;
> > > > > +
> > > > > +	blob = drm_property_create_blob(dev,
> > > > > +					array_size(sizeof(hints[0]), num_hints),
> > > > > +					hints);
> > > > > +	if (IS_ERR(blob))
> > > > > +		return PTR_ERR(blob);
> > > > > +
> > > > > +	drm_object_attach_property(&plane->base, config->size_hints_property,
> > > > > +				   blob->base.id);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
> > > > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > > > > index e5b053001d22..5bc8aed9b445 100644
> > > > > --- a/include/drm/drm_mode_config.h
> > > > > +++ b/include/drm/drm_mode_config.h
> > > > > @@ -949,6 +949,11 @@ struct drm_mode_config {
> > > > >  	 */
> > > > >  	struct drm_property *modifiers_property;
> > > > >  
> > > > > +	/**
> > > > > +	 * @size_hints_propertty: Plane SIZE_HINTS property.
> > > > > +	 */
> > > > > +	struct drm_property *size_hints_property;
> > > > > +
> > > > >  	/* cursor size */
> > > > >  	uint32_t cursor_width, cursor_height;
> > > > >  
> > > > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > > > index 51291983ea44..1997d7d64b69 100644
> > > > > --- a/include/drm/drm_plane.h
> > > > > +++ b/include/drm/drm_plane.h
> > > > > @@ -32,6 +32,7 @@
> > > > >  #include <drm/drm_util.h>
> > > > >  
> > > > >  struct drm_crtc;
> > > > > +struct drm_plane_size_hint;
> > > > >  struct drm_printer;
> > > > >  struct drm_modeset_acquire_ctx;
> > > > >  
> > > > > @@ -945,5 +946,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
> > > > >  
> > > > >  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> > > > >  					     unsigned int supported_filters);
> > > > > +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> > > > > +				      const struct drm_plane_size_hint *hints,
> > > > > +				      int num_hints);
> > > > >  
> > > > >  #endif
> > > > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > > > index 46becedf5b2f..9d7c5967264f 100644
> > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > @@ -849,6 +849,17 @@ struct drm_color_lut {
> > > > >  	__u16 reserved;
> > > > >  };
> > > > >  
> > > > > +/**
> > > > > + * struct drm_plane_size_hint - Plane size hints
> > > > > + *
> > > > > + * The plane SIZE_HINTS property blob contains an
> > > > > + * array of struct drm_plane_size_hint.
> > > > > + */
> > > > > +struct drm_plane_size_hint {
> > > > > +	__u16 width;
> > > > > +	__u16 height;
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
> > > > >   *
> > > > > -- 
> > > > > 2.39.1
> > > > > 
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> > > 
> 
> -- 
> Ville Syrjälä
> Intel
> 

