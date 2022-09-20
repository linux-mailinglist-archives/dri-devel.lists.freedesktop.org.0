Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE75BDDA1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5F310E034;
	Tue, 20 Sep 2022 06:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B952010E034
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663656585; x=1695192585;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Ga6nRE/jkc5pIHVfSAAxkWn0zPeHKbCmh+vx3RF8DLI=;
 b=V7ikroEiIF9LyAP4ctE6OAk6gW9or3ai39fIvKCdTNS2Gbk1g8/Pb6me
 E0KL37Ry2WuPqDZiDq7wlGfD0rumRQGz9TRVQGXv0M1ULUCF+bYfOsSJe
 fkLDPolmVzo2tnWX/M/9z5Tj1410l4s5d8ajkvxIt9+dgc8M0Nrfbrj9M
 vBatx0OEZYvlax0Y4aL/XLIWR8YVkg9sbhgr29+J6CBUYZLFR+MlgN4F9
 qGDQEvThrHZkXjg3rt/duGd+tmBUxTCVi7KGgB1Rk814MI1DGJoIKieAq
 Ltr4NDBzOr4AACLR5SGTKQf9zgQ/VziTQooGWWvoC5Dr53GVL8rKC8T64 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298340034"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="298340034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 23:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="761186153"
Received: from icostanz-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.34.2])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 23:49:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: William Tseng <william.tseng@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-861-D
In-Reply-To: <20220920062316.43162-1-william.tseng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613122655.12432-1-william.tseng@intel.com>
 <20220920062316.43162-1-william.tseng@intel.com>
Date: Tue, 20 Sep 2022 09:49:27 +0300
Message-ID: <878rmepmko.fsf@intel.com>
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>, Wayne Lin <waynelin@amd.com>,
 William Tseng <william.tseng@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Sep 2022, William Tseng <william.tseng@intel.com> wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with higher v=
ic
> than what is defined in CEA-861-D.
>
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be
> displayed and the video format is indicated by both SVD (with vic 90 and
> picture aspect ratio 64:27) and DTD.  When connecting to such sink,
> source can't output the video format in SVD because an error is returned =
by
> drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the infoframe
> with picture aspect ratio 64:27 and the vic, which is originally 90 and is
> changed to 0 by drm_mode_cea_vic().
>
> To work around it, do not set the vic 0 so the corresponding mode may be
> accepted in drm_hdmi_avi_infoframe_from_display_mode() and be dispalyed.
>
> v1: initial version.
> v2: change the logic in drm_hdmi_avi_infoframe_from_display_mode().
> v3: fix typo.
> v4: add revision history.
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>

Please attach the offending EDID to the bug [1]. I won't ack this before
we see the EDID in question.


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/6153

> ---
>  drivers/gpu/drm/drm_edid.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index eaa819381281..3c6a4e09b2d6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6640,7 +6640,8 @@ static u8 drm_mode_hdmi_vic(const struct drm_connec=
tor *connector,
>  }
>=20=20
>  static u8 drm_mode_cea_vic(const struct drm_connector *connector,
> -			   const struct drm_display_mode *mode)
> +			   const struct drm_display_mode *mode,
> +			   bool is_hdmi2_sink)
>  {
>  	u8 vic;
>=20=20
> @@ -6660,7 +6661,7 @@ static u8 drm_mode_cea_vic(const struct drm_connect=
or *connector,
>  	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>  	 * have to make sure we dont break HDMI 1.4 sinks.
>  	 */
> -	if (!is_hdmi2_sink(connector) && vic > 64)
> +	if (!is_hdmi2_sink && vic > 64)
>  		return 0;
>=20=20
>  	return vic;
> @@ -6691,7 +6692,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdm=
i_avi_infoframe *frame,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		frame->pixel_repeat =3D 1;
>=20=20
> -	vic =3D drm_mode_cea_vic(connector, mode);
> +	vic =3D drm_mode_cea_vic(connector, mode, true);
>  	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
>=20=20
>  	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
> @@ -6735,7 +6736,8 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdm=
i_avi_infoframe *frame,
>  		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
>  	}
>=20=20
> -	frame->video_code =3D vic;
> +	frame->video_code =3D drm_mode_cea_vic(connector, mode,
> +						is_hdmi2_sink(connector));
>  	frame->picture_aspect =3D picture_aspect;
>  	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
>  	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;

--=20
Jani Nikula, Intel Open Source Graphics Center
