Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546B8C47A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5210E2B7;
	Mon, 13 May 2024 19:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEb20Ad8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701C10E2B7;
 Mon, 13 May 2024 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715629162; x=1747165162;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lsDADFfxB22Hp20l8C2NIDdiTTMbTFBSt5MuUuglBFQ=;
 b=SEb20Ad87snN8JY4KqZPfRN6sat9dPoOs/2amXTL9CElEgJ6tnYcHGmi
 N7D55boIqvUAcnMFY6CtSLyFcZvdYpdqiC4HzioaSbbgAT8Puah0LcP9e
 7RmE67DuaAGlsJ9YRgzcPgHoKbhLxJXT1a+zJvVj8+dJIb9wF7sgG0n/4
 Eg3GQQnQ5qe6YrqSbmZPxKU65sMYpx2zICW+YDnOAEhtSGjHHiua3PjAq
 isPkQpTcognD9S0evTLFsskjlNWMjQ1bwyRiy5dkUjMdUNUOR0Y3ak/e9
 d8Cyvngb0vZROrJat1h5zkPgUd2ZO1mYwmPEUxrzsfJL5PT5ZIbXNZXPZ Q==;
X-CSE-ConnectionGUID: rbfVDIu5QvqWYkW4/i9evQ==
X-CSE-MsgGUID: E8GFrQRCRhO5nESvQ5DlSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22253294"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22253294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 12:39:22 -0700
X-CSE-ConnectionGUID: He0JF6ttRUy71dEK7yg2cw==
X-CSE-MsgGUID: slqA05MERkKkWz0RIJl6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30445046"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 12:39:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm: Rename drm_plane_check_pixel_format() to
 drm_plane_has_format()
In-Reply-To: <20240513175942.12910-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-2-ville.syrjala@linux.intel.com>
Date: Mon, 13 May 2024 22:39:17 +0300
Message-ID: <87o799ec2i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 13 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename drm_plane_check_pixel_format() to drm_plane_has_format()
> and change the return type accordingly. Allows one to write
> more natural code.
>
> Also matches drm_any_plane_has_format() better.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_atomic.c        |  7 ++-----
>  drivers/gpu/drm/drm_crtc.c          |  6 ++----
>  drivers/gpu/drm/drm_crtc_internal.h |  4 ++--
>  drivers/gpu/drm/drm_plane.c         | 22 ++++++++++------------
>  4 files changed, 16 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index a91737adf8e7..e22560213b8e 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -608,7 +608,6 @@ static int drm_atomic_plane_check(const struct drm_pl=
ane_state *old_plane_state,
>  	unsigned int fb_width, fb_height;
>  	struct drm_mode_rect *clips;
>  	uint32_t num_clips;
> -	int ret;
>=20=20
>  	/* either *both* CRTC and FB must be set, or neither */
>  	if (crtc && !fb) {
> @@ -635,14 +634,12 @@ static int drm_atomic_plane_check(const struct drm_=
plane_state *old_plane_state,
>  	}
>=20=20
>  	/* Check whether this plane supports the fb pixel format. */
> -	ret =3D drm_plane_check_pixel_format(plane, fb->format->format,
> -					   fb->modifier);
> -	if (ret) {
> +	if (!drm_plane_has_format(plane, fb->format->format, fb->modifier)) {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
>  			       plane->base.id, plane->name,
>  			       &fb->format->format, fb->modifier);
> -		return ret;
> +		return -EINVAL;
>  	}
>=20=20
>  	/* Give drivers some help against integer overflows */
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 483969b84a30..3488ff067c69 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -789,12 +789,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *=
data,
>  		 * case.
>  		 */
>  		if (!plane->format_default) {
> -			ret =3D drm_plane_check_pixel_format(plane,
> -							   fb->format->format,
> -							   fb->modifier);
> -			if (ret) {
> +			if (!drm_plane_has_format(plane, fb->format->format, fb->modifier)) {
>  				drm_dbg_kms(dev, "Invalid pixel format %p4cc, modifier 0x%llx\n",
>  					    &fb->format->format, fb->modifier);
> +				ret =3D -EINVAL;
>  				goto out;
>  			}
>  		}
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index 25aaae937ceb..898e0e8b51be 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -272,8 +272,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  /* drm_plane.c */
>  int drm_plane_register_all(struct drm_device *dev);
>  void drm_plane_unregister_all(struct drm_device *dev);
> -int drm_plane_check_pixel_format(struct drm_plane *plane,
> -				 u32 format, u64 modifier);
> +bool drm_plane_has_format(struct drm_plane *plane,
> +			  u32 format, u64 modifier);
>  struct drm_mode_rect *
>  __drm_plane_get_damage_clips(const struct drm_plane_state *state);
>=20=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 57662a1fd345..268aa2299df5 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -877,8 +877,8 @@ int drm_mode_getplane(struct drm_device *dev, void *d=
ata,
>  	return 0;
>  }
>=20=20
> -int drm_plane_check_pixel_format(struct drm_plane *plane,
> -				 u32 format, u64 modifier)
> +bool drm_plane_has_format(struct drm_plane *plane,
> +			  u32 format, u64 modifier)
>  {
>  	unsigned int i;
>=20=20
> @@ -887,24 +887,24 @@ int drm_plane_check_pixel_format(struct drm_plane *=
plane,
>  			break;
>  	}
>  	if (i =3D=3D plane->format_count)
> -		return -EINVAL;
> +		return false;
>=20=20
>  	if (plane->funcs->format_mod_supported) {
>  		if (!plane->funcs->format_mod_supported(plane, format, modifier))
> -			return -EINVAL;
> +			return false;
>  	} else {
>  		if (!plane->modifier_count)
> -			return 0;
> +			return true;
>=20=20
>  		for (i =3D 0; i < plane->modifier_count; i++) {
>  			if (modifier =3D=3D plane->modifiers[i])
>  				break;
>  		}
>  		if (i =3D=3D plane->modifier_count)
> -			return -EINVAL;
> +			return false;
>  	}
>=20=20
> -	return 0;
> +	return true;
>  }
>=20=20
>  static int __setplane_check(struct drm_plane *plane,
> @@ -924,12 +924,10 @@ static int __setplane_check(struct drm_plane *plane,
>  	}
>=20=20
>  	/* Check whether this plane supports the fb pixel format. */
> -	ret =3D drm_plane_check_pixel_format(plane, fb->format->format,
> -					   fb->modifier);
> -	if (ret) {
> +	if (!drm_plane_has_format(plane, fb->format->format, fb->modifier)) {
>  		DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
>  			      &fb->format->format, fb->modifier);
> -		return ret;
> +		return -EINVAL;
>  	}
>=20=20
>  	/* Give drivers some help against integer overflows */
> @@ -964,7 +962,7 @@ bool drm_any_plane_has_format(struct drm_device *dev,
>  	struct drm_plane *plane;
>=20=20
>  	drm_for_each_plane(plane, dev) {
> -		if (drm_plane_check_pixel_format(plane, format, modifier) =3D=3D 0)
> +		if (drm_plane_has_format(plane, format, modifier))
>  			return true;
>  	}

--=20
Jani Nikula, Intel
