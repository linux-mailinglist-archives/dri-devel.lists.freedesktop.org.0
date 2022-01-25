Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567E549B127
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 11:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAB210EDFF;
	Tue, 25 Jan 2022 10:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699B510EF3C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643105136; x=1674641136;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=UVtpW3LpdPND5fPQY4jRK7UamvBuB0hpELsNbgR2jQg=;
 b=OLOD6RhVVXNX9hwS/8JfJyogEx1Z0eapGABNY1UO48/522ZE2omuhwYt
 FtA4ujTJIz9F9wqCX1mRAIz6m2qS1390JIUbwmVw5mvm00k+B1YedjF9b
 yGzimqNqOLp0b/B0FsOTcuV2Qkk919UrcuUlhh5jDspGG+fsXtrnAnu41
 kVrt4kX6FMAEa5kWLRL7lEIyhV+D39u3Mle7yHOfgkdqTrdduvyBIkmM3
 83k9mGcI8PeURxFnVF8nFyybxpILEYpB1k3ALV3K99Xw0xXl2pJG4Wcnl
 fuQzY+jXpiDIrnnz8WyQcIx8uGpAbDfyTULXqhe117ShN339TI2U9dKkn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245103416"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="245103416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 02:05:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="520327764"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 02:05:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/edid: Clear EDID Deep Color Modes in
 drm_reset_display_info()
In-Reply-To: <20220125093251.594772-1-maxime@cerno.tech>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220125093251.594772-1-maxime@cerno.tech>
Date: Tue, 25 Jan 2022 12:05:17 +0200
Message-ID: <87a6fk1676.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> Even though we have the other drm_display_info fields reset, the DC
> modes are missing.
>
> This shouldn't be an issue since it's explicitely reset every time a new
> EDID is parsed.

Side note, and hijacking the thread a bit: I think it's a historical
mistake we've started accumulating stuff in struct drm_display_info that
is *not* derived from the EDID or DisplayID. I think
drm_reset_display_info() should just be one memset() and that's
it. Adding stuff that should not be reset here feels wrong.

Maybe we should just move all the non-EDID derived members directly to
struct drm_connector? Or some other sub-struct.

In the mean time, this patch seems like the right thing to do,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.

>
> Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5251925e3b92..a76224653e6f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5340,6 +5340,9 @@ drm_reset_display_info(struct drm_connector *connec=
tor)
>  	info->rgb_quant_range_selectable =3D false;
>  	memset(&info->hdmi, 0, sizeof(info->hdmi));
>=20=20
> +	info->edid_hdmi_rgb444_dc_modes =3D 0;
> +	info->edid_hdmi_ycbcr444_dc_modes =3D 0;
> +
>  	info->non_desktop =3D 0;
>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));

--=20
Jani Nikula, Intel Open Source Graphics Center
