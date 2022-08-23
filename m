Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263059E8E5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 19:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A57510E184;
	Tue, 23 Aug 2022 17:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3352710E149;
 Tue, 23 Aug 2022 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661274954; x=1692810954;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oiAV1RwepXSe9Io6bX6GBUzq1NIILs2Gga9AQHIcC4I=;
 b=md89K0KNA7Jrqplk/mrzEMBrpehXv3ir67fKJASJ9rAn8zDu0urc39+S
 pX16Q0IFQtC1RfPZ5SPk9W9F/FXFtJYXY7bTvdTumrWRobVyEpwXjfU4m
 VPN+caPTdZqSkLtOp2eQqkmPsQ/Cqv+BmUGuZd6Fzblielbp4HgV4vdoq
 f/JcwR7EjA9MGDNCTnr4jyMrEZw9k8DZj8BDxvwKimwLkIH0ny2aryifD
 aWOAfSYIbT9jp5PXmSYqRwgl8J85/1H0SQJ1rM1W0/DoMORyAKbYPbcVG
 kkFXXlg+uG4thDn4JE9tRYZcMf35WK2Wz2Dy0RYhIMcysZICAkGZ6WpZi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="357725562"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="357725562"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 10:15:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="670124517"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.51.100])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 10:15:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Handle EDID 1.4 range descriptor h/vfreq offsets
In-Reply-To: <20220819092728.14753-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220819092728.14753-1-ville.syrjala@linux.intel.com>
Date: Tue, 23 Aug 2022 20:15:48 +0300
Message-ID: <87mtbukhiz.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> EDID 1.4 introduced some extra flags in the range
> descriptor to support min/max h/vfreq >=3D 255. Consult them
> to correctly parse the vfreq limits.
>
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6519
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++++------
>  include/drm/drm_edid.h     |  5 +++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 90a5e26eafa8..4005dab6147d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6020,12 +6020,14 @@ static void drm_parse_cea_ext(struct drm_connecto=
r *connector,
>  }
>=20=20
>  static
> -void get_monitor_range(const struct detailed_timing *timing,
> -		       void *info_monitor_range)
> +void get_monitor_range(const struct detailed_timing *timing, void *c)
>  {
> -	struct drm_monitor_range_info *monitor_range =3D info_monitor_range;
> +	struct detailed_mode_closure *closure =3D c;
> +	struct drm_display_info *info =3D &closure->connector->display_info;
> +	struct drm_monitor_range_info *monitor_range =3D &info->monitor_range;
>  	const struct detailed_non_pixel *data =3D &timing->data.other_data;
>  	const struct detailed_data_monitor_range *range =3D &data->data.range;
> +	const struct edid *edid =3D closure->drm_edid->edid;
>=20=20
>  	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
>  		return;
> @@ -6041,18 +6043,28 @@ void get_monitor_range(const struct detailed_timi=
ng *timing,
>=20=20
>  	monitor_range->min_vfreq =3D range->min_vfreq;
>  	monitor_range->max_vfreq =3D range->max_vfreq;
> +
> +	if (edid->revision >=3D 4) {
> +		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
> +			monitor_range->min_vfreq +=3D 255;
> +		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
> +			monitor_range->max_vfreq +=3D 255;
> +	}

Nitpick, a combo where min vertical range has +255 offset but max
doesn't shouldn't be okay. But then, what are we going to do in that
case anyway? I guess the generic check would be min <=3D max. Also, the
+255 offset range is 256..510, not 256..(255+255). Again, what to do if
that's what the EDID has? *shrug*.

Anyway, what's broken here (and probably impacts the testing in the
referenced bug) is that the struct drm_monitor_range_info members are u8
and this overflows.

With that fixed, whether or not you decide to do anything about the
nitpicks,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


Side note, git grep for monitor_range reveals amdgpu are doing their own
thing for the parsing. *sigh*.


>  }
>=20=20
>  static void drm_get_monitor_range(struct drm_connector *connector,
>  				  const struct drm_edid *drm_edid)
>  {
> -	struct drm_display_info *info =3D &connector->display_info;
> +	const struct drm_display_info *info =3D &connector->display_info;
> +	struct detailed_mode_closure closure =3D {
> +		.connector =3D connector,
> +		.drm_edid =3D drm_edid,
> +	};
>=20=20
>  	if (!version_greater(drm_edid, 1, 1))
>  		return;
>=20=20
> -	drm_for_each_detailed_block(drm_edid, get_monitor_range,
> -				    &info->monitor_range);
> +	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
>=20=20
>  	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
>  		      info->monitor_range.min_vfreq,
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 2181977ae683..d81da97cad6e 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -92,6 +92,11 @@ struct detailed_data_string {
>  	u8 str[13];
>  } __attribute__((packed));
>=20=20
> +#define DRM_EDID_RANGE_OFFSET_MIN_VFREQ (1 << 0)
> +#define DRM_EDID_RANGE_OFFSET_MAX_VFREQ (1 << 1)
> +#define DRM_EDID_RANGE_OFFSET_MIN_HFREQ (1 << 2)
> +#define DRM_EDID_RANGE_OFFSET_MAX_HFREQ (1 << 3)
> +
>  #define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
>  #define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
>  #define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02

--=20
Jani Nikula, Intel Open Source Graphics Center
