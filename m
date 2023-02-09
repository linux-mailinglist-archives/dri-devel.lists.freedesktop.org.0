Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA75690991
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10B10EAC3;
	Thu,  9 Feb 2023 13:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0840710EAC2;
 Thu,  9 Feb 2023 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675948243; x=1707484243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O/vBPT8GM8Dr9BZ/ZfrdNmqBtCgatQbdkSLgfVSC1fs=;
 b=Qk6n8zied416q5k7j7sbe/jGBKeRMYApM29mzCJcwZLQyWhqcmVmJPql
 oC+tSyQu83H0U2gZpASlH8laOXlOl6U9oQCy+Tcw56FlC5wL5DHqWP4cW
 +YNlhXCcElBaXket/DU64OnHc/Suu8h30S6Kpl2A9RJDcEosmn5bCNjNo
 XKhqoiLbT0JJVmbylm64D0O5H6yyzHpI28/NudTjF2CLh77zRH4rpNb/w
 +WZkrX6tLgH4E2BrliXwBkdQGm4clTnmGw9nLvA3xPfUyyOKFEyUJzTJM
 Q5gegGiON7lm01Mch+U+60cK3jeKE7+NwKcohkWDd+sB1pNYl/U1OGKAk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416320982"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; d="scan'208";a="416320982"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 05:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="731263182"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; d="scan'208";a="731263182"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 09 Feb 2023 05:10:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Feb 2023 15:10:38 +0200
Date: Thu, 9 Feb 2023 15:10:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <Y+TwzhRCkFlo5U6S@intel.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <20230209135855.22cf1b32.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209135855.22cf1b32.pekka.paalanen@collabora.com>
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
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 01:58:55PM +0200, Pekka Paalanen wrote:
> On Wed,  8 Feb 2023 23:10:16 +0200
> Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> 
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
> > 
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Jonas Ådahl <jadahl@redhat.com>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_mode_config.c |  7 +++++
> >  drivers/gpu/drm/drm_plane.c       | 48 +++++++++++++++++++++++++++++++
> >  include/drm/drm_mode_config.h     |  5 ++++
> >  include/drm/drm_plane.h           |  4 +++
> >  include/uapi/drm/drm_mode.h       | 11 +++++++
> >  5 files changed, 75 insertions(+)
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
> > index 24e7998d1731..ae51b1f83755 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -140,6 +140,21 @@
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
> > + *     support a very limited set of sizes (eg. cursor planes
> > + *     on typical hardware).
> 
> Hi Ville,
> 
> sounds good. Maybe a minor nit about "typical hardware". Would e.g.
> "legacy PC hardware" be more accurate?

"legacy" doesn't feel quite right for current and upcoming hardware.

-- 
Ville Syrjälä
Intel
