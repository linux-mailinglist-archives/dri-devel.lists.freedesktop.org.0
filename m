Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2445AAEEE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 14:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9025A10E825;
	Fri,  2 Sep 2022 12:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7EE10E825;
 Fri,  2 Sep 2022 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662121914; x=1693657914;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=IuiSPA2Vod5Okb6hXPyaRmII69cYstSbavpo0ayfOuE=;
 b=PCmlWVlxqS68IOHioaMAYVl5wsyZ/29Xab6yu6GVLaLqWsnM3DWqayH6
 Zr+36c5B5eBZDZctmwVT9VPCWdeHLjxAbUts+0tLUUmB7gBb7owNrhm1g
 L8HD7jLk+9cWQq/CEZB8POb+OMcM22mdTD2JTDZSnH8KpuuauvjhiSqaK
 bPilywY2ILVy2GznXrd6OOiakaEXsiP1nix0+j/9gSyd/ZFezOG/3kUkX
 dRVPnXcKFVgC89c8VU+biSMI3qpzmUQx2rEGpPbiEn1ejQMe7P4rZ4jU8
 4VhpildYUH9xocr/Kth5m2O6GAnD2uFm5OK2EiKQtc3aTqkrQNg2vt2wM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278986052"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="278986052"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:31:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="941274686"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:31:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 10/11] drm/edid: Make version checks less convoluted
In-Reply-To: <20220826213501.31490-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-11-ville.syrjala@linux.intel.com>
Date: Fri, 02 Sep 2022 15:31:39 +0300
Message-ID: <87pmgedkk4.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Get rid of the confusing version_greater() stuff and
> simply compare edid->revision directly everwhere. Half
> the places already did it this way, and since we actually
> reject any EDID with edid->version!=3D1 it's a perfectly
> sane thing to do.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0fe06e5fd6e0..e7f46260dfe7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1572,15 +1572,6 @@ struct drm_edid {
>  	const struct edid *edid;
>  };
>=20=20
> -static bool version_greater(const struct drm_edid *drm_edid,
> -			    u8 version, u8 revision)
> -{
> -	const struct edid *edid =3D drm_edid->edid;
> -
> -	return edid->version > version ||
> -		(edid->version =3D=3D version && edid->revision > revision);
> -}
> -
>  static int edid_hfeeodb_extension_block_count(const struct edid *edid);
>=20=20
>  static int edid_hfeeodb_block_count(const struct edid *edid)
> @@ -3652,7 +3643,7 @@ do_inferred_modes(const struct detailed_timing *tim=
ing, void *c)
>  						  closure->drm_edid,
>  						  timing);
>=20=20
> -	if (!version_greater(closure->drm_edid, 1, 1))
> +	if (closure->drm_edid->edid->revision < 2)
>  		return; /* GTF not defined yet */
>=20=20
>  	switch (range->flags) {
> @@ -3667,7 +3658,7 @@ do_inferred_modes(const struct detailed_timing *tim=
ing, void *c)
>  							  timing);
>  		break;
>  	case DRM_EDID_CVT_SUPPORT_FLAG:
> -		if (!version_greater(closure->drm_edid, 1, 3))
> +		if (closure->drm_edid->edid->revision < 4)
>  			break;
>=20=20
>  		closure->modes +=3D drm_cvt_modes_for_range(closure->connector,
> @@ -3688,7 +3679,7 @@ static int add_inferred_modes(struct drm_connector =
*connector,
>  		.drm_edid =3D drm_edid,
>  	};
>=20=20
> -	if (version_greater(drm_edid, 1, 0))
> +	if (drm_edid->edid->revision >=3D 1)
>  		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
>=20=20
>  	return closure.modes;
> @@ -3765,7 +3756,7 @@ static int add_established_modes(struct drm_connect=
or *connector,
>  		}
>  	}
>=20=20
> -	if (version_greater(drm_edid, 1, 0))
> +	if (edid->revision >=3D 1)
>  		drm_for_each_detailed_block(drm_edid, do_established_modes,
>  					    &closure);
>=20=20
> @@ -3820,7 +3811,7 @@ static int add_standard_modes(struct drm_connector =
*connector,
>  		}
>  	}
>=20=20
> -	if (version_greater(drm_edid, 1, 0))
> +	if (drm_edid->edid->revision >=3D 1)
>  		drm_for_each_detailed_block(drm_edid, do_standard_modes,
>  					    &closure);
>=20=20
> @@ -3900,7 +3891,7 @@ add_cvt_modes(struct drm_connector *connector, cons=
t struct drm_edid *drm_edid)
>  		.drm_edid =3D drm_edid,
>  	};
>=20=20
> -	if (version_greater(drm_edid, 1, 2))
> +	if (drm_edid->edid->revision >=3D 3)
>  		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
>=20=20
>  	/* XXX should also look for CVT codes in VTB blocks */
> @@ -3955,7 +3946,7 @@ static int add_detailed_modes(struct drm_connector =
*connector,
>  		.quirks =3D quirks,
>  	};
>=20=20
> -	if (version_greater(drm_edid, 1, 3))
> +	if (drm_edid->edid->revision >=3D 4)
>  		closure.preferred =3D true; /* first detailed timing is always preferr=
ed */
>  	else
>  		closure.preferred =3D
> @@ -6144,7 +6135,7 @@ static void drm_get_vrr_range(struct drm_connector =
*connector,
>  		.drm_edid =3D drm_edid,
>  	};
>=20=20
> -	if (!version_greater(drm_edid, 1, 3))
> +	if (drm_edid->edid->revision < 4)
>  		return;
>=20=20
>  	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))

--=20
Jani Nikula, Intel Open Source Graphics Center
