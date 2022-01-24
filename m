Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF55497AE2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 10:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C0010E8AD;
	Mon, 24 Jan 2022 09:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B88610E817
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 09:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643014862; x=1674550862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Yu1YtG18UG1kIzuNC3Ov19VR1592UST5oo6NtYpn0bM=;
 b=a3ID3S2gjXxDrQyFAUQe7n57J7PV76U/Qmr0eQg6rvT68MJj1tED3HB0
 7myTuIRkfZTdHX71LqO1u3aSy5I0QsqbhsT7isgv93sx5QkPDqxXVkzqn
 8JEtVKUoKww2wyWfB/wC+vJvv/ahq4yVs9DmDp8hp1iap5TXOJuoBzxfK
 sClYK0qJlBf+gDcA5PYTiW5aOO85qXPWpWg3Z75QlG22xMkKoV5LkBG0w
 WVpGan/brWFRQrINsUxzN5I79zMgciUSQVRZL7hWAYW7UY9TwQojn1VU1
 sTYLBkpV7wR1EMLUp5j2RwWdMwzmn25/N3+j+/rM82BYZSufPLExhmMnT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="225980006"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="225980006"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 01:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519867789"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga007.jf.intel.com with SMTP; 24 Jan 2022 01:00:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Jan 2022 11:00:56 +0200
Date: Mon, 24 Jan 2022 11:00:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 02/16] drm/edid: Don't clear formats if using deep color
Message-ID: <Ye5qyCVYfuU+00oJ@intel.com>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120151625.594595-3-maxime@cerno.tech>
X-Patchwork-Hint: comment
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 04:16:11PM +0100, Maxime Ripard wrote:
> The current code, when parsing the EDID Deep Color depths, that the
> YUV422 cannot be used, referring to the HDMI 1.3 Specification.
> 
> This specification, in its section 6.2.4, indeed states:
> 
>   For each supported Deep Color mode, RGB 4:4:4 shall be supported and
>   optionally YCBCR 4:4:4 may be supported.
> 
>   YCBCR 4:2:2 is not permitted for any Deep Color mode.
> 
> This indeed can be interpreted like the code does, but the HDMI 1.4
> specification further clarifies that statement in its section 6.2.4:
> 
>   For each supported Deep Color mode, RGB 4:4:4 shall be supported and
>   optionally YCBCR 4:4:4 may be supported.
> 
>   YCBCR 4:2:2 is also 36-bit mode but does not require the further use
>   of the Deep Color modes described in section 6.5.2 and 6.5.3.
> 
> This means that, even though YUV422 can be used with 12 bit per color,
> it shouldn't be treated as a deep color mode.
> 
> This is also broken with YUV444 if it's supported by the display, but
> DRM_EDID_HDMI_DC_Y444 isn't set. In such a case, the code will clear
> color_formats of the YUV444 support set previously in
> drm_parse_cea_ext(), but will not set it back.
> 
> Since the formats supported are already setup properly in
> drm_parse_cea_ext(), let's just remove the code modifying the formats in
> drm_parse_hdmi_deep_color_info()
> 
> Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13644dd579b4..5085ef08c22d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5104,16 +5104,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  		  connector->name, dc_bpc);
>  	info->bpc = dc_bpc;
>  
> -	/*
> -	 * Deep color support mandates RGB444 support for all video
> -	 * modes and forbids YCRCB422 support for all video modes per
> -	 * HDMI 1.3 spec.
> -	 */
> -	info->color_formats = DRM_COLOR_FORMAT_RGB444;
> -
>  	/* YCRCB444 is optional according to spec. */
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
> -		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
>  		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
>  			  connector->name);
>  	}
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
