Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD25AAE9A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 14:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B2010E81D;
	Fri,  2 Sep 2022 12:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB410E81D;
 Fri,  2 Sep 2022 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662121559; x=1693657559;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=aeA64hMJA/gJdR3f3l1l6Uujc6m+pQRcwKk/VANiLRY=;
 b=UaBlTU2U9SKyXlOS+qylxq98qe6c6veMyOsWb1Z8OFZtoP2+/SFrwqy0
 9RnqeP7CzbgjWKb7tB+cJP0DSoEuAVAJzMx91GxW1bxSwmm/J+/T2g7zR
 ddrZ5vL7SXsN6Hmmxrv9AT1u2vuuP9l8tRIeVYudGxP4xRo4HDH3k5tW0
 w9ecCxfmdxqovFYUYZNhG2M41Fmb6bbMxfs+ZJgve/QTZFztrM8BTQ7IE
 Tndtqvs01EWYcbIypH72BIuudQDXiKrbZwesfUWH2b/saw91lX5zYl2eT
 wVbq9mAGJo+BcpEXFHFL+hd31IaAykc+Y1Ex/HuDGVgh+ZGF7L5PSh32V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296750101"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296750101"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:25:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="590051533"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:25:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/edid: Use GTF2 for inferred modes
In-Reply-To: <20220826213501.31490-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-8-ville.syrjala@linux.intel.com>
Date: Fri, 02 Sep 2022 15:25:39 +0300
Message-ID: <87v8q6dku4.fsf@intel.com>
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
> For some resaon we only use the secondary GTF curve for the
> standard timings. Use it for inferred modes as well.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0c7cbe9b44f5..fed2bdd55c09 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3546,6 +3546,35 @@ static int drm_gtf_modes_for_range(struct drm_conn=
ector *connector,
>  	return modes;
>  }
>=20=20
> +static int drm_gtf2_modes_for_range(struct drm_connector *connector,
> +				    const struct drm_edid *drm_edid,
> +				    const struct detailed_timing *timing)
> +{
> +	int i, modes =3D 0;
> +	struct drm_display_mode *newmode;
> +	struct drm_device *dev =3D connector->dev;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(extra_modes); i++) {
> +		const struct minimode *m =3D &extra_modes[i];
> +
> +		newmode =3D drm_gtf2_mode(dev, drm_edid, m->w, m->h, m->r);
> +		if (!newmode)
> +			return modes;
> +
> +		drm_mode_fixup_1366x768(newmode);
> +		if (!mode_in_range(newmode, drm_edid, timing) ||
> +		    !valid_inferred_mode(connector, newmode)) {
> +			drm_mode_destroy(dev, newmode);
> +			continue;
> +		}
> +
> +		drm_mode_probed_add(connector, newmode);
> +		modes++;
> +	}
> +
> +	return modes;
> +}
> +
>  static int drm_cvt_modes_for_range(struct drm_connector *connector,
>  				   const struct drm_edid *drm_edid,
>  				   const struct detailed_timing *timing)
> @@ -3594,7 +3623,11 @@ do_inferred_modes(const struct detailed_timing *ti=
ming, void *c)
>  		return; /* GTF not defined yet */
>=20=20
>  	switch (range->flags) {
> -	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG: /* XXX could do more */
> +	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
> +		closure->modes +=3D drm_gtf2_modes_for_range(closure->connector,
> +							   closure->drm_edid,
> +							   timing);
> +		break;
>  	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:

Additionally, per spec:

* Default GTF supported if bit 0 in Feature Support Byte at address 18h =3D=
 1

* Secondary GTF supported --- requires support for Default GTF

So I guess both of these would need the edid->features &
DRM_EDID_FEATURE_DEFAULT_GTF check?

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>



>  		closure->modes +=3D drm_gtf_modes_for_range(closure->connector,
>  							  closure->drm_edid,

--=20
Jani Nikula, Intel Open Source Graphics Center
