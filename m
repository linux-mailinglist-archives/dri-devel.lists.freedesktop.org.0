Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1D5AB1CE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61A10E842;
	Fri,  2 Sep 2022 13:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB99B10E842;
 Fri,  2 Sep 2022 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662126109; x=1693662109;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=klaQMe7OechxFlN46KfLkCUbOMT+zsY5YizLG9zpMSc=;
 b=Yy0Wv9Vpf0x56uCCUPhiIW+a/S1Bg8YJA5lxfJRocZdzDGEJ4eAUJBer
 48uDI7CjuCKObGpebYP3Axn/8D8o2KKoG5qoek2iUb3HN05mi5hK2GhGe
 od/SWnf4IwYwBVQsOtg9Nl0ooFPS+oFQBVhT1raB2+2oVRFb9HQvAWQoF
 Xv0IF7T2DjwhdEtgfjVy02bAOsJTM65j33wukbRTfRcnZDfrQcwCVsdQb
 7Cy3eTZfH+C29J84bSg+m2Z6ZJ8kc2mRb8g34C4pzbES7uddloUPy9vNu
 SOQadoGyCEw0+lf8t2JkpZsZMH7iQCv7sDRot8s9oAKFV/U5fzAeOs1lG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359939926"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="359939926"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:41:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674358442"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:41:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 08/11] drm/edid: Use the correct formula for
 standard timings
In-Reply-To: <20220826213501.31490-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-9-ville.syrjala@linux.intel.com>
Date: Fri, 02 Sep 2022 16:41:36 +0300
Message-ID: <87edwtevvz.fsf@intel.com>
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
> Prefer the timing formula indicated by the range
> descriptor for generating the non-DMT standard timings.
>
> Previously we just used CVT for all EDID 1.4 continuous
> frequency displays without even checking if the range
> descriptor indicates otherwise. Now we check the range
> descriptor first, and fall back to CVT if nothing else
> was indicated. EDID 1.4 more or less deprecates GTF/GTF2
> but there are still a lot of 1.4 EDIDs out there that
> don't advertise CVT support, so seems safer to use the
> formula the EDID actually reports as supported.
>
> For EDID 1.3 we use GTF2 if indicated (as before), and for
> EDID 1.2+ we now just use GTF without even checking the
> feature flag. There seem to be quite a few EDIDs out there that
> don't set the GTF feature flag but still include a GTF range
> descriptor and non-DMT standard timings.
>
> This to me seems to be roughly what appendix B of EDID 1.4
> suggests should be done.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 49 +++++++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fed2bdd55c09..c1c85b9e1208 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3077,20 +3077,53 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
>  	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2=
.j : 0;
>  }
>=20=20
> +static void
> +get_timing_level(const struct detailed_timing *descriptor, void *data)
> +{
> +	int *res =3D data;
> +
> +	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
> +		return;
> +
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.f=
lags) !=3D 10);
> +
> +	switch (descriptor->data.other_data.data.range.flags) {
> +	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
> +		*res =3D LEVEL_GTF;
> +		break;
> +	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
> +		*res =3D LEVEL_GTF2;
> +		break;
> +	case DRM_EDID_CVT_SUPPORT_FLAG:
> +		*res =3D LEVEL_CVT;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  /* Get standard timing level (CVT/GTF/DMT). */
>  static int standard_timing_level(const struct drm_edid *drm_edid)
>  {
>  	const struct edid *edid =3D drm_edid->edid;
>=20=20
> -	if (edid->revision >=3D 2) {
> -		if (edid->revision >=3D 4 && (edid->features & DRM_EDID_FEATURE_DEFAUL=
T_GTF))
> -			return LEVEL_CVT;
> -		if (drm_gtf2_hbreak(drm_edid))
> -			return LEVEL_GTF2;
> -		if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
> -			return LEVEL_GTF;
> +	if (edid->revision >=3D 4) {
> +		/*
> +		 * If the range descriptor doesn't
> +		 * indicate otherwise default to CVT
> +		 */
> +		int ret =3D LEVEL_CVT;
> +
> +		drm_for_each_detailed_block(drm_edid, get_timing_level, &ret);

Please remind me why it's okay to iterate all of them and pick the last?
I mean ret gets overwritten by the last block.

Otherwise it all seems okay to me, though I admit my confidence level in
this review is considerably lower than for the other patches.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +
> +		return ret;
> +	} else if (edid->revision >=3D 3 && drm_gtf2_hbreak(drm_edid)) {
> +		return LEVEL_GTF2;
> +	} else if (edid->revision >=3D 2) {
> +		return LEVEL_GTF;
> +	} else {
> +		return LEVEL_DMT;
>  	}
> -	return LEVEL_DMT;
>  }
>=20=20
>  /*

--=20
Jani Nikula, Intel Open Source Graphics Center
