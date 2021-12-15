Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889774759E4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7FE10E58D;
	Wed, 15 Dec 2021 13:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C86810E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:48:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226087037"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226087037"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 05:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="545581363"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 15 Dec 2021 05:48:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Dec 2021 15:48:39 +0200
Date: Wed, 15 Dec 2021 15:48:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 01/14] drm/edid: Don't clear YUV422 if using deep color
Message-ID: <YbnyNx+0CK8R8Nd8@intel.com>
References: <20211215124406.340180-1-maxime@cerno.tech>
 <20211215124406.340180-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215124406.340180-2-maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Werner Sembach <wse@tuxedocomputers.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 01:43:53PM +0100, Maxime Ripard wrote:
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
> This deviates from the interpretation of the code and comment, so let's
> fix those.
> 
> Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_edid.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..e57d1b8cdaaa 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5106,10 +5106,9 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  
>  	/*
>  	 * Deep color support mandates RGB444 support for all video
> -	 * modes and forbids YCRCB422 support for all video modes per
> -	 * HDMI 1.3 spec.
> +	 * modes.
>  	 */
> -	info->color_formats = DRM_COLOR_FORMAT_RGB444;
> +	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  
>  	/* YCRCB444 is optional according to spec. */
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {

This whole code seems pretty much wrong. What it tries to do (I think)
is make sure we don't use deep color with YCbCr 4:4:4 unless supported.
But what it actually does is also disable YCbCr 4:4:4 8bpc when deep
color is not supported for YCbCr 4:4:4.

I think what we want is to just get rid of this color_formats stuff here
entirely and instead have some kind of separate tracking of RGB 4:4:4 vs.
YCbCr 4:4:4 deep color capabilities.

-- 
Ville Syrjälä
Intel
