Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9C538F59
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 12:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7B910F940;
	Tue, 31 May 2022 10:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1269310F936
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653994567; x=1685530567;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GaVql8UvaCGVCJUBDK1d9cDyJsVtR7m8Ymyx08Kjato=;
 b=IFfsNjV0AJz2FDH28hnpVhThsLfP73HOaJbExEBrIansEWIm5GoYTls9
 zwFXADAx1cL5b3gS06k/B97N66GZBOejWT45U/SpmjnT7HuAeB9YiwMTS
 bAWKautpBgf+howP5m5mEQt25q/ZpDW7I5BZ0k/9VNTg9SRfvmWQg8acc
 1F7p2NttNJcsYP1T82+c4v7lqe4RQmoIaeii3E0Z5AN5msqwWuGgszx8a
 eHAcRCiPS5R/bFLSqrxgKCjlIwuf9nDPA5OHoBRp1w43RDsnL1t5Wd7dD
 b/VS/SJ4sunFM0OpJyvuqFtGluYPCNSjiEj7kdwWy15sPCPHV2l/qq3AQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="257285742"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="257285742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 03:56:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="576351682"
Received: from rrudnick-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.138.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 03:56:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: William Tseng <william.tseng@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
In-Reply-To: <20220531103421.11363-1-william.tseng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220531103421.11363-1-william.tseng@intel.com>
Date: Tue, 31 May 2022 13:56:01 +0300
Message-ID: <87y1yiq8ce.fsf@intel.com>
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
Cc: Wayne Lin <waynelin@amd.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 William Tseng <william.tseng@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022, William Tseng <william.tseng@intel.com> wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with higher v=
ic
> than what is defined in CEA-861-D.
>
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be
> displayed and the video format is indicated by both SVD (with vic 90 and
> pictuure aspect ratio 64:27) and DTD.  When connecting to such sink,
> source can't output the video format in SVD because an error is returned =
by
> drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the infoframe
> with pictuure aspect ratio 64:27 and the vic, which is originally 90 and =
is
> changed to 0 by drm_mode_cea_vic().
>
> To work around it, this patch ignores such CEA modes in do_cea_modes() so
> the modes won't be processed in drm_hdmi_avi_infoframe_from_display_mode(=
).
> And only the video format in DTD can be dispalyed.
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 39 +++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bc43e1b32092..a93f68878bfd 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct drm_device *d=
ev,
>  }
>  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>=20=20
> +static bool is_hdmi2_sink(const struct drm_connector *connector)
> +{
> +	/*
> +	 * FIXME: sil-sii8620 doesn't have a connector around when
> +	 * we need one, so we have to be prepared for a NULL connector.
> +	 */
> +	if (!connector)
> +		return true;
> +
> +	return connector->display_info.hdmi.scdc.supported ||
> +		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
> +}
> +
>  static int
>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  {
> @@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector *connector, cons=
t u8 *db, u8 len)
>=20=20
>  		mode =3D drm_display_mode_from_vic_index(connector, db, len, i);
>  		if (mode) {
> +			u8 vic =3D svd_to_vic(db[i]);
> +
> +			if (!drm_valid_cea_vic(vic))
> +				continue;

drm_display_mode_from_vic_index() returns NULL in this case.

> +
> +			/*
> +			 * HDMI 1.4 VIC range: 1 <=3D VIC <=3D 64 (CEA-861-D) but
> +			 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
> +			 * have to make sure we dont break HDMI 1.4 sinks.
> +			 */
> +			if (!is_hdmi2_sink(connector) && vic > 64)
> +				continue;

I'll need to double check if this is the right thing to do... but I
guess the question becomes if this shouldn't be within
drm_display_mode_from_vic_index().

Duplicating the condition from drm_mode_cea_vic() is probably not a good
idea.

The continues in both above branches leak the mode.


BR,
Jani.


> +
>  			/*
>  			 * YCBCR420 capability block contains a bitmap which
>  			 * gives the index of CEA modes from CEA VDB, which
> @@ -5846,19 +5872,6 @@ void drm_set_preferred_mode(struct drm_connector *=
connector,
>  }
>  EXPORT_SYMBOL(drm_set_preferred_mode);
>=20=20
> -static bool is_hdmi2_sink(const struct drm_connector *connector)
> -{
> -	/*
> -	 * FIXME: sil-sii8620 doesn't have a connector around when
> -	 * we need one, so we have to be prepared for a NULL connector.
> -	 */
> -	if (!connector)
> -		return true;
> -
> -	return connector->display_info.hdmi.scdc.supported ||
> -		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
> -}
> -
>  static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>  			    const struct drm_display_mode *mode)
>  {

--=20
Jani Nikula, Intel Open Source Graphics Center
