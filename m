Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312376BE82B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 12:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06D910EEE8;
	Fri, 17 Mar 2023 11:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A35B10E0F6;
 Fri, 17 Mar 2023 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679052809; x=1710588809;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zHqvE2PAo7WGrXK/KlWhkNCIGR1qSPXYRrD1ERtPA60=;
 b=nCC5vxWcrTdcn0eNXfpIjWoxeYJEodz6Eb+zaew2PCYJI5Sz+Y7FUDPO
 lErboPViYFXkMgZYsod3GfDkuD9t28/TUfsDQUqovtlAmgmGUH0BjPsrI
 BusaM4cDgNFPRv3OE9HcFL8z8fN/QBaVHJ7yXjvGVnfm4M0M9wOO65GhG
 t7gCccEMCoM02GwI+KyE6S4jV2kv4W9WP/vYKz2CRJ8+pnpklYo5FYG8o
 oq4iSq8j3xDWy9X/RPqHVeXkyF9i471xwwv86SWNmdl16bRVP5HLXmpEr
 FBD4zTLAngKdvy2CJSAl3jPHUlKwPRRTp+Gyx7rcHmO5MwkgOTE8wTFE2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340603082"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="340603082"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 04:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823639543"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="823639543"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 17 Mar 2023 04:33:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Mar 2023 13:33:25 +0200
Date: Fri, 17 Mar 2023 13:33:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <ZBRQBfuEZS+2ieIM@intel.com>
References: <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <20230313163311.11379-1-ville.syrjala@linux.intel.com>
 <ZBRCKIl+jdkohbVB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBRCKIl+jdkohbVB@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 11:34:16AM +0100, Jonas Ådahl wrote:
> On Mon, Mar 13, 2023 at 06:33:11PM +0200, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Add a new immutable plane property by which a plane can advertise
> > a handful of recommended plane sizes. This would be mostly exposed
> > by cursor planes as a slightly more capable replacement for
> > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > a one size fits all limit for the whole device.
> > 
> > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > size via the cursor size caps. But always using the max sized
> > cursor can waste a surprising amount of power, so a better
> > stragey is desirable.
> > 
> > Most other drivers don't specify any cursor size at all, in
> > which case the ioctl code just claims that 64x64 is a great
> > choice. Whether that is actually true is debatable.
> > 
> > A poll of various compositor developers informs us that
> > blindly probing with setcursor/atomic ioctl to determine
> > suitable cursor sizes is not acceptable, thus the
> > introduction of the new property to supplant the cursor
> > size caps. The compositor will now be free to select a
> > more optimal cursor size from the short list of options.
> > 
> > Note that the reported sizes (either via the property or the
> > caps) make no claims about things such as plane scaling. So
> > these things should only really be consulted for simple
> > "cursor like" use cases.
> > 
> > v2: Try to add some docs
> > v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
> >     Drop the note about typical hardware (Pekka)
> > 
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Jonas Ådahl <jadahl@redhat.com>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_mode_config.c |  7 ++++
> >  drivers/gpu/drm/drm_plane.c       | 53 +++++++++++++++++++++++++++++++
> >  include/drm/drm_mode_config.h     |  5 +++
> >  include/drm/drm_plane.h           |  4 +++
> >  include/uapi/drm/drm_mode.h       | 11 +++++++
> >  5 files changed, 80 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 87eb591fe9b5..21860f94a18c 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> >  		return -ENOMEM;
> >  	dev->mode_config.modifiers_property = prop;
> >  
> > +	prop = drm_property_create(dev,
> > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > +				   "SIZE_HINTS", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.size_hints_property = prop;
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index 24e7998d1731..d2a6fdff1a57 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -140,6 +140,26 @@
> >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
> >   *     various bugs in this area with inconsistencies between the capability
> >   *     flag and per-plane properties.
> > + *
> > + * SIZE_HINTS:
> > + *     Blob property which contains the set of recommended plane size
> > + *     which can used for simple "cursor like" use cases (eg. no scaling).
> > + *     Using these hints frees userspace from extensive probing of
> > + *     supported plane sizes through atomic/setcursor ioctls.
> > + *
> > + *     For optimal usage userspace should pick the smallest size
> > + *     that satisfies its own requirements.
> > + *
> > + *     The blob contains an array of struct drm_plane_size_hint.
> > + *
> > + *     Drivers should only attach this property to planes that
> > + *     support a very limited set of sizes.
> > + *
> > + *     Note that property value 0 (ie. no blob) is reserved for potential
> > + *     future use. Current userspace is expected to ignore the property
> > + *     if the value is 0, and fall back to some other means (eg.
> > + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> > + *     the appropriate plane size to use.
> 
> Does this intend to mean userspace has the kernel's blessing on choosing
> an arbitrary size as long as it's smaller than &DRM_CAP_CURSOR_WIDTH x
> &DRM_CAP_CURSOR_HEIGHT?
> 
> It's a bit to vague for me to make a confident interpretation whether I
> can, or whether I should pretend I didn't see SIZE_HINTS and apply the
> old logic, meaning only using the exact cap size.

Using the exact cap size is the only thing more or less
guaranteed to work. But other approaches (such as probing
the size with atomic/cursor ioctls) can also be used.

-- 
Ville Syrjälä
Intel
