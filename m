Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E335AAEB1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 14:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1065110E822;
	Fri,  2 Sep 2022 12:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261A10E823;
 Fri,  2 Sep 2022 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662121679; x=1693657679;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xEwub+bDCVNMXU4dXKK8mDCWrRISO1zl7rEi+q+Kai8=;
 b=NQhuPp6zR85YXWUwsLgqg7X/RKi+whBwQ43JEJN/UywPPCVcqvrYmgvT
 hJO0v4DrCpXKr9IeiLdR4d5BW7xHrVJCUTeb9kN1wA5J3CDHGucMrDEre
 QW8zdqoyzGma63FYYGLl1D3Q7FIO4q1PP2xRK3P7tVBySvWvdvsL5NsL8
 lUf6iBSsTYMx9jyvFHzlKU35Ku9DqmNiYRas1AuHuFp7SEIbCHi2G1UEp
 wT4cmwmsJlb6l0AY2NRFXzW4kgg2TwOA6WWDZgBnrLKLlWlx9pqS17vXF
 WMAkDf0J4u5rrBDirouUT/cr89v0L47PIQyfXkiQMT5BpERF8z+63bHHI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278985273"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="278985273"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:27:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674338274"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:27:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 09/11] drm/edid: Unconfuse preferred timing stuff a bit
In-Reply-To: <20220826213501.31490-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-10-ville.syrjala@linux.intel.com>
Date: Fri, 02 Sep 2022 15:27:46 +0300
Message-ID: <87sfladkql.fsf@intel.com>
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
> For EDID 1.4 the first detailed timing is always preferred,
> for older EDIDs there was a feature flag to indicate the same.
> While correct, the code setting that up is rather confusing.
> Restate it in a slightly more straightforward manner.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c1c85b9e1208..0fe06e5fd6e0 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3952,13 +3952,14 @@ static int add_detailed_modes(struct drm_connecto=
r *connector,
>  	struct detailed_mode_closure closure =3D {
>  		.connector =3D connector,
>  		.drm_edid =3D drm_edid,
> -		.preferred =3D true,
>  		.quirks =3D quirks,
>  	};
>=20=20
> -	if (closure.preferred && !version_greater(drm_edid, 1, 3))
> +	if (version_greater(drm_edid, 1, 3))
> +		closure.preferred =3D true; /* first detailed timing is always preferr=
ed */
> +	else
>  		closure.preferred =3D
> -		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
> +			drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING;
>=20=20
>  	drm_for_each_detailed_block(drm_edid, do_detailed_mode, &closure);

--=20
Jani Nikula, Intel Open Source Graphics Center
