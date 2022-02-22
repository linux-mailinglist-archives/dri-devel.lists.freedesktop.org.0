Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0F4C01F3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 20:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5267A10E209;
	Tue, 22 Feb 2022 19:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE1C10E209
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645557761; x=1677093761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UtAFAACgZkZ9CY+W/SPNdTcpBaMl3HVLfVZmYhwAETs=;
 b=T/EqHMyWETNfCGW8OC2MgpikGEMk90l8RpCDwQN/gbX3vV6rhIYz/KBe
 4WjXLsGAdMkFiJxcJwAgb3bXyygsbRqAi+EDMylMlgGZ2bcrs/gpJxlV7
 l9CpG1AQ6g1ugKDPv4zP49sidHAnvqnqu+PsK7P9O+5Y2tZiovzFbvz7/
 ZG9bZuDUGE/aRExRzW6EzK7tTVtTaJMAX3kkUTeOp2yXZ0x79lI1XtG/d
 Wln6YVrXMomhMnf6Y84YylAHJg/IlNYtrJLNqwNRmA8INRW9AIrO2XeFB
 velHrAI65nbwQcKNuqGpcBHi0k5Qa7HX/iEVpcnlx4/Yv7mALaEa64oGj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235300116"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="235300116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 11:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="508116345"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 22 Feb 2022 11:22:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 21:22:28 +0200
Date: Tue, 22 Feb 2022 21:22:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/edid: Always set RGB444
Message-ID: <YhU39Hqtg/7Zuh5h@intel.com>
References: <20220203115416.1137308-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220203115416.1137308-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Matthias Reichl <hias@horus.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 12:54:16PM +0100, Maxime Ripard wrote:
> In order to fill the drm_display_info structure each time an EDID is
> read, the code currently will call drm_add_display_info with the parsed
> EDID.
> 
> drm_add_display_info will then call drm_reset_display_info to reset all
> the fields to 0, and then set them to the proper value depending on the
> EDID.
> 
> In the color_formats case, we will thus report that we don't support any
> color format, and then fill it back with RGB444 plus the additional
> formats described in the EDID Feature Support byte.
> 
> However, since that byte only contains format-related bits since the 1.4
> specification, this doesn't happen if the EDID is following an earlier
> specification. In turn, it means that for one of these EDID, we end up
> with color_formats set to 0.
> 
> The EDID 1.3 specification never really specifies what it means by RGB
> exactly, but since both HDMI and DVI will use RGB444, it's fairly safe
> to assume it's supposed to be RGB444.
> 
> Let's move the addition of RGB444 to color_formats earlier in
> drm_add_display_info() so that it's always set for a digital display.
> 
> Fixes: da05a5a71ad8 ("drm: parse color format support for digital displays")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-by: Matthias Reichl <hias@horus.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks OK to me. I guess the DFP1.x == 0 case might allow some
other encoding to be used but the EDID spec makes not mention
how to figure that out.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..f5f5de362ff2 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5345,6 +5345,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  	if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
>  		return quirks;
>  
> +	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  	drm_parse_cea_ext(connector, edid);
>  
>  	/*
> @@ -5393,7 +5394,6 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  	DRM_DEBUG("%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
>  			  connector->name, info->bpc);
>  
> -	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
>  		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
