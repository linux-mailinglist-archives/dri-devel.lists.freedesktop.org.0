Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D265A4562
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335AE10F109;
	Mon, 29 Aug 2022 08:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229810F101;
 Mon, 29 Aug 2022 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661762755; x=1693298755;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=a8jLSBWWtRNu9EdpAZu3tXdpY6u5/ihM3uO/PT27PBg=;
 b=IE3BfLMWZfCSnoaW2zld79UW+7leFjddJGKWLvU9dQ/FesC0ht0ZJ6jw
 xHxhEyt9ygi+ekI5DkbjW0UzUnoKwYXMU2TSui9DJWOmUo+iZtPlYnEcF
 RoXDfIfgKP4Gvc4KDLg61n2bsEGCPQ+eMp61oRj31Y+lIh6GKCjBcPb6y
 2zHjXPT4+2pqNF1mv5TosaVyqy4O3c9VRG7/8SInhQTNWsX2mx/eoSBgj
 cYp7pu99cXRetT0hMa5HIrq9TTEd5HjkqAMvpGtvvEyy1PyzM1Ch2np3d
 G6M2MCBYYGgVceKn7y6DipZal5i37udEwodR8+2zOB8abQpKJsoZu79Jy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="295622375"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="295622375"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:45:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="640857835"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:45:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 06/11] drm/edid: Extract drm_gtf2_mode()
In-Reply-To: <20220826213501.31490-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-7-ville.syrjala@linux.intel.com>
Date: Mon, 29 Aug 2022 11:45:46 +0300
Message-ID: <8735dfh1z9.fsf@intel.com>
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
> Extract the GTF vs. GTF2 logic into a separate function.
> We'll have a second user soon.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 47 ++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index b459fdf12b58..0c7cbe9b44f5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3113,6 +3113,35 @@ static int drm_mode_hsync(const struct drm_display=
_mode *mode)
>  	return DIV_ROUND_CLOSEST(mode->clock, mode->htotal);
>  }
>=20=20
> +static struct drm_display_mode *
> +drm_gtf2_mode(struct drm_device *dev,
> +	      const struct drm_edid *drm_edid,
> +	      int hsize, int vsize, int vrefresh_rate)
> +{
> +	struct drm_display_mode *mode;
> +
> +	/*
> +	 * This is potentially wrong if there's ever a monitor with
> +	 * more than one ranges section, each claiming a different
> +	 * secondary GTF curve.  Please don't do that.
> +	 */
> +	mode =3D drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
> +	if (!mode)
> +		return NULL;
> +
> +	if (drm_mode_hsync(mode) > drm_gtf2_hbreak(drm_edid)) {
> +		drm_mode_destroy(dev, mode);
> +		mode =3D drm_gtf_mode_complex(dev, hsize, vsize,
> +					    vrefresh_rate, 0, 0,
> +					    drm_gtf2_m(drm_edid),
> +					    drm_gtf2_2c(drm_edid),
> +					    drm_gtf2_k(drm_edid),
> +					    drm_gtf2_2j(drm_edid));
> +	}
> +
> +	return mode;
> +}
> +
>  /*
>   * Take the standard timing params (in this case width, aspect, and refr=
esh)
>   * and convert them into a real mode using CVT/GTF/DMT.
> @@ -3201,23 +3230,7 @@ static struct drm_display_mode *drm_mode_std(struc=
t drm_connector *connector,
>  		mode =3D drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
>  		break;
>  	case LEVEL_GTF2:
> -		/*
> -		 * This is potentially wrong if there's ever a monitor with
> -		 * more than one ranges section, each claiming a different
> -		 * secondary GTF curve.  Please don't do that.
> -		 */
> -		mode =3D drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
> -		if (!mode)
> -			return NULL;
> -		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(drm_edid)) {
> -			drm_mode_destroy(dev, mode);
> -			mode =3D drm_gtf_mode_complex(dev, hsize, vsize,
> -						    vrefresh_rate, 0, 0,
> -						    drm_gtf2_m(drm_edid),
> -						    drm_gtf2_2c(drm_edid),
> -						    drm_gtf2_k(drm_edid),
> -						    drm_gtf2_2j(drm_edid));
> -		}
> +		mode =3D drm_gtf2_mode(dev, drm_edid, hsize, vsize, vrefresh_rate);
>  		break;
>  	case LEVEL_CVT:
>  		mode =3D drm_cvt_mode(dev, hsize, vsize, vrefresh_rate, 0, 0,

--=20
Jani Nikula, Intel Open Source Graphics Center
