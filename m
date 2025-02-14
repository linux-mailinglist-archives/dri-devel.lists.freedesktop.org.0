Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5917A362AC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3910E33D;
	Fri, 14 Feb 2025 16:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNPvfyGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B310E33D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739549164; x=1771085164;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+FqZ/1MhpJlCMBgu00n2IgemqkNH9utadvTPq8ETZ+4=;
 b=NNPvfyGSVHLtn3F2GNdHB61YU2L/4Pgw1UK8/QYKiBSi8apAzi5B1Kfa
 lml55/jT+9UMhSdh3Bq9PqcMV7zUJI/L91rXkaYI7k/0M8QSHlQ8UB/iO
 FYD0NzRo4Gtv8pW5hsPoihymwHg+9TSCmTGwIbnOWtM7NkYUwHLhsfHTw
 t21D4l7xYSdu4ZbJrFWMmNdipFFASiDLCFjX+dBCus0l2vD2urFz09yX0
 lCgE45YDmSeN823DhttDrag4oMsqQYX7+Pemn9mqLSzje2OCUe02pV3g/
 Ergi5DWddcuFHMlddGBw30oj5LOC0aaBu2awbJOztmEJKR6E8wlIRPJGn A==;
X-CSE-ConnectionGUID: DU8ccD3CREe1Fo7RJSldlg==
X-CSE-MsgGUID: Faficv/rTjWxjCc8qTgXMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44232714"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="44232714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:06:04 -0800
X-CSE-ConnectionGUID: 9nd+vtQFROCMWTagu+QArw==
X-CSE-MsgGUID: OHzK/V+OQd+gJ9x74FVHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113691153"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:06:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Subject: Re: [PATCH v3 2/2] drm/edid: Refactor DisplayID timing block structs
In-Reply-To: <20250214110643.506740-2-sdoregor@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250214110643.506740-1-sdoregor@sdore.me>
 <20250214110643.506740-2-sdoregor@sdore.me>
Date: Fri, 14 Feb 2025 18:05:53 +0200
Message-ID: <87v7tcv7dq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Feb 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> Using le16 instead of u8[2].
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>

The vsync and hsync having high bit indicate polarity makes this less
than perfect, but I think it's fine.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/drm_displayid_internal.h | 18 +++++++--------
>  drivers/gpu/drm/drm_edid.c               | 28 ++++++++++++------------
>  2 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 84831ecfdb6e..957dd0619f5c 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -115,20 +115,20 @@ struct displayid_tiled_block {
>  struct displayid_detailed_timings_1 {
>  	u8 pixel_clock[3];
>  	u8 flags;
> -	u8 hactive[2];
> -	u8 hblank[2];
> -	u8 hsync[2];
> -	u8 hsw[2];
> -	u8 vactive[2];
> -	u8 vblank[2];
> -	u8 vsync[2];
> -	u8 vsw[2];
> +	__le16 hactive;
> +	__le16 hblank;
> +	__le16 hsync;
> +	__le16 hsw;
> +	__le16 vactive;
> +	__le16 vblank;
> +	__le16 vsync;
> +	__le16 vsw;
>  } __packed;
>  
>  struct displayid_detailed_timing_block {
>  	struct displayid_block base;
>  	struct displayid_detailed_timings_1 timings[];
> -};
> +} __packed;
>  
>  struct displayid_formula_timings_9 {
>  	u8 flags;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 03edf0e1598e..32807cefc819 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6760,23 +6760,23 @@ static void update_display_info(struct drm_connector *connector,
>  }
>  
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
> -							    struct displayid_detailed_timings_1 *timings,
> +							    const struct displayid_detailed_timings_1 *timings,
>  							    bool type_7)
>  {
>  	struct drm_display_mode *mode;
> -	unsigned pixel_clock = (timings->pixel_clock[0] |
> -				(timings->pixel_clock[1] << 8) |
> -				(timings->pixel_clock[2] << 16)) + 1;
> -	unsigned hactive = (timings->hactive[0] | timings->hactive[1] << 8) + 1;
> -	unsigned hblank = (timings->hblank[0] | timings->hblank[1] << 8) + 1;
> -	unsigned hsync = (timings->hsync[0] | (timings->hsync[1] & 0x7f) << 8) + 1;
> -	unsigned hsync_width = (timings->hsw[0] | timings->hsw[1] << 8) + 1;
> -	unsigned vactive = (timings->vactive[0] | timings->vactive[1] << 8) + 1;
> -	unsigned vblank = (timings->vblank[0] | timings->vblank[1] << 8) + 1;
> -	unsigned vsync = (timings->vsync[0] | (timings->vsync[1] & 0x7f) << 8) + 1;
> -	unsigned vsync_width = (timings->vsw[0] | timings->vsw[1] << 8) + 1;
> -	bool hsync_positive = (timings->hsync[1] >> 7) & 0x1;
> -	bool vsync_positive = (timings->vsync[1] >> 7) & 0x1;
> +	unsigned int pixel_clock = (timings->pixel_clock[0] |
> +				    (timings->pixel_clock[1] << 8) |
> +				    (timings->pixel_clock[2] << 16)) + 1;
> +	unsigned int hactive = le16_to_cpu(timings->hactive) + 1;
> +	unsigned int hblank = le16_to_cpu(timings->hblank) + 1;
> +	unsigned int hsync = (le16_to_cpu(timings->hsync) & 0x7fff) + 1;
> +	unsigned int hsync_width = le16_to_cpu(timings->hsw) + 1;
> +	unsigned int vactive = le16_to_cpu(timings->vactive) + 1;
> +	unsigned int vblank = le16_to_cpu(timings->vblank) + 1;
> +	unsigned int vsync = (le16_to_cpu(timings->vsync) & 0x7fff) + 1;
> +	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
> +	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
> +	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
>  
>  	mode = drm_mode_create(dev);
>  	if (!mode)

-- 
Jani Nikula, Intel
