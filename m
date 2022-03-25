Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47F4E73A8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E7A10E238;
	Fri, 25 Mar 2022 12:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7462F10E1E6;
 Fri, 25 Mar 2022 12:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648212061; x=1679748061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JXmsgfZ+CZd31FbNSGXGbKpyy/ekyTDEs1EfYl4UU1s=;
 b=RQxZ84jyA0xzLAK5HtyO+vT/1ehbyPaBMjINZCiAWkytvt/QUAgGXc/a
 SGgUhlXldsRoyQD/nKKK8U8SyD9MAgr/o9Tv4xDcRZ34brBKpA8avLgrE
 PNInB5KRl04izZhUhoqa83kBG7QxydVKV0WvD12KisJJRg7F0IO0eFIVz
 BEnNLKQv/C4BP1XflVET6lYloDE4fhVI5QWpZdpAZ2pncmdNlxYF9XBxG
 g9JpRvsvdBf4ZVRwckNUR7B1+0KAmCDFSPOQBfhRR8B30215rPI360D0g
 n1XGPwietapdyQW/qo0JQlmCrAH64Sv4csARkYYK+OrwQOctYWDD63jNM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258591444"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258591444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="638206288"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by FMSMGA003.fm.intel.com with SMTP; 25 Mar 2022 05:40:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Mar 2022 14:40:57 +0200
Date: Fri, 25 Mar 2022 14:40:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/9] drm/edid: don't modify EDID while parsing
Message-ID: <Yj24Wb9oinu+AhHI@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
 <aafe62385024e5975b811a90a0906d4b52058785.1648210803.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aafe62385024e5975b811a90a0906d4b52058785.1648210803.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 02:25:23PM +0200, Jani Nikula wrote:
> We'll want to keep the EDID immutable while parsing. Stop modifying the
> EDID because of the quirks.
> 
> In theory, this does have userspace implications, but the userspace is
> supposed to use the modes exposed via KMS API, not by parsing the EDID
> directly.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index cc7bd58369df..1b552fe54f38 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2740,9 +2740,9 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>  		return NULL;
>  
>  	if (quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
> -		timing->pixel_clock = cpu_to_le16(1088);
> -
> -	mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
> +		mode->clock = 1088 * 10;
> +	else
> +		mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
>  
>  	mode->hdisplay = hactive;
>  	mode->hsync_start = mode->hdisplay + hsync_offset;
> @@ -2763,14 +2763,14 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>  	drm_mode_do_interlace_quirk(mode, pt);
>  
>  	if (quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
> -		pt->misc |= DRM_EDID_PT_HSYNC_POSITIVE | DRM_EDID_PT_VSYNC_POSITIVE;
> +		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
> +	} else {
> +		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> +			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> +		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> +			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
>  	}
>  
> -	mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> -		DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> -	mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> -		DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> -
>  set_size:
>  	mode->width_mm = pt->width_mm_lo | (pt->width_height_mm_hi & 0xf0) << 4;
>  	mode->height_mm = pt->height_mm_lo | (pt->width_height_mm_hi & 0xf) << 8;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
