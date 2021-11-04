Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C844566F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 16:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74D76F885;
	Thu,  4 Nov 2021 15:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E256F87F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 15:37:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="295174804"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="295174804"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 08:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="490000002"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 04 Nov 2021 08:37:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 17:37:21 +0200
Date: Thu, 4 Nov 2021 17:37:21 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <YYP+MX9gxZVafhKk@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102145944.259181-3-maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
>  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
>  }
>  
> +/**
> + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> + * @mode: DRM display mode
> + *
> + * Checks if a given display mode requires the scrambling to be enabled.
> + *
> + * Returns:
> + * A boolean stating whether it's required or not.
> + */
> +static inline bool
> +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> +{
> +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> +}

That's only correct for 8bpc. The actual limit is on the TMDS clock (or
rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
magic for the actually transmitted TMDS clock).

-- 
Ville Syrjälä
Intel
