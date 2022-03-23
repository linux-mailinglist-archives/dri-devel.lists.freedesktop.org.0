Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278074E54E4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1878E10E4C7;
	Wed, 23 Mar 2022 15:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85E310E07B;
 Wed, 23 Mar 2022 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648048151; x=1679584151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=shoRowFg1yK7IIvq/zXYPsuOfhD8hfo5h8WB7Jh4cdk=;
 b=kg5dVRF+8WHu9LtZnmHVDsiQLR0oaWeXVuBzmIP6DIazd5vY1wF0Q5x4
 uSlHIAIiY4pK0edRa7pcyhc/OmXWY2pQbX+oE0lZlc7KtsMtqVfnflcBE
 GuIlb/sa2EsKthYpM6+tNv2Kxibj0fQCt/L9H3SHBgVEFT97awlDjyl/p
 glwTVsSijyO16xIeObzKghhwLWVIIQ0S4DctvXbkt3mEfOELjsaeDsMT6
 BAtOGYAK13PJ2ZvvqgWXcHXh4FQMP4Om/nmBV3ADjIBUg3dVAI4Wnw/iS
 ej7xRsGDwRb1Vwrd1Jvi8g/kJou5kvEndZVrxZssBe6PPOaz48wjaUePa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238073739"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="238073739"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="552518780"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga007.fm.intel.com with SMTP; 23 Mar 2022 08:09:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 17:09:07 +0200
Date: Wed, 23 Mar 2022 17:09:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/edid: fix CEA extension byte #3 parsing
Message-ID: <Yjs4E5gl3KZoUOBR@intel.com>
References: <20220323100438.1757295-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323100438.1757295-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Shawn C Lee <shawn.c.lee@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 12:04:38PM +0200, Jani Nikula wrote:
> Only an EDID CEA extension has byte #3, while the CTA DisplayID Data
> Block does not. Don't interpret bogus data for color formats.

I think what we might want eventually is a cleaner split between
the CTA data blocks vs. the rest of the EDID CTA ext block. Only
the former is relevant for DisplayID.

But for a bugfix we want to keep it simple.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> For most displays it's probably an unlikely scenario you'd have a CTA
> DisplayID Data Block without a CEA extension, but they do exist.
> 
> Fixes: e28ad544f462 ("drm/edid: parse CEA blocks embedded in DisplayID")
> Cc: <stable@vger.kernel.org> # v4.15
> Cc: Shawn C Lee <shawn.c.lee@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> commit e28ad544f462 was merged in v5.3, but it has Cc: stable for v4.15.
> 
> This is also fixed in my CEA data block iteration series [1], but we'll
> want the simple fix for stable first.
> 
> Hum, CTA is formerly CEA, I and the code seem to use both, should we use
> only one or the other?

And before CEA it was called EIA (IIRC). Dunno if we also use that name
somewhere.

If someone cares enough I guess we could rename everything to "cta".

> 
> [1] https://patchwork.freedesktop.org/series/101659/
> ---
>  drivers/gpu/drm/drm_edid.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 561f53831e29..ccf7031a6797 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5187,10 +5187,14 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  
>  	/* The existence of a CEA block should imply RGB support */
>  	info->color_formats = DRM_COLOR_FORMAT_RGB444;
> -	if (edid_ext[3] & EDID_CEA_YCRCB444)
> -		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
> -	if (edid_ext[3] & EDID_CEA_YCRCB422)
> -		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
> +
> +	/* CTA DisplayID Data Block does not have byte #3 */
> +	if (edid_ext[0] == CEA_EXT) {
> +		if (edid_ext[3] & EDID_CEA_YCRCB444)
> +			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
> +		if (edid_ext[3] & EDID_CEA_YCRCB422)
> +			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
> +	}
>  
>  	if (cea_db_offsets(edid_ext, &start, &end))
>  		return;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
