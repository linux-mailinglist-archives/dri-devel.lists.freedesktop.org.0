Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E89C8A465
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822A10E632;
	Wed, 26 Nov 2025 14:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFDxoLcA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C861E10E632;
 Wed, 26 Nov 2025 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166751; x=1795702751;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j7PcOtoN96E/M6QjgMqFl9rqp/XCoIQCS07wrWuQSow=;
 b=GFDxoLcA5tx/GZV6rFu/gXvWf5FST5MyydmskWI3AJOarH7Zh9QGxjws
 PfA3ZCY6MqJrr3QhMdSb2oU7BVYvqL4qiN/IOheCTNIla5RyuLK7sLs3d
 zqjk11EqPebAQGVVb/8SCY0laWUZxqFL3SyRYlYV2ljZDNk9NfRbej8fo
 VC8+kjN7zKG1Dh0tn9ZoViyIrVXfyDHwFRZB6tk3KcMw6+Ry8dVqLz5dQ
 ayy1Wc3fUltbAQd4yenFu+nVVYAMR8cS7BrJi5dXlh1msQRPeBIf+ugRY
 1alBrr/hov1hkxw0jtszzsbLRK+EaC2HEhhLFXActQj0NMR+1SiWvOX4G Q==;
X-CSE-ConnectionGUID: sZUZXI5JQvSVhZQ1z6zs6A==
X-CSE-MsgGUID: G5rwjzZJTDiiamkhh/j+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83597608"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83597608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:19:10 -0800
X-CSE-ConnectionGUID: dabGSDQDRVuZ/CDhmtx9pg==
X-CSE-MsgGUID: uzKZ8J/+RZKuiQIlEjQUxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="198060096"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:19:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yaroslav
 Bolyukin <iam@lach.pw>
Subject: Re: [PATCH v6 4/7] drm/edid: parse DSC DPP passthru support flag
 for mode VII timings
In-Reply-To: <20251126065126.54016-5-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-5-iam@lach.pw>
Date: Wed, 26 Nov 2025 16:19:02 +0200
Message-ID: <6f88c0111ce7f2a74010ff43a77bdd03f669ffb6@intel.com>
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

On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:

The commit message goes here.

> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_displayid_internal.h |  2 ++
>  drivers/gpu/drm/drm_edid.c               | 12 ++++++++----
>  include/drm/drm_modes.h                  | 10 ++++++++++
>  3 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 72f107ae832f..724174b429f2 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -97,6 +97,7 @@ struct displayid_header {
>  	u8 ext_count;
>  } __packed;
>  
> +#define DISPLAYID_BLOCK_REV	GENMASK(2, 0)
>  struct displayid_block {
>  	u8 tag;
>  	u8 rev;
> @@ -125,6 +126,7 @@ struct displayid_detailed_timings_1 {
>  	__le16 vsw;
>  } __packed;
>  
> +#define DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT	BIT(3)
>  struct displayid_detailed_timing_block {
>  	struct displayid_block base;
>  	struct displayid_detailed_timings_1 timings[];
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 348aa31aea1b..72a94b1713e2 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6792,8 +6792,8 @@ static void update_display_info(struct drm_connector *connector,
>  }
>  
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
> -							    const struct displayid_detailed_timings_1 *timings,
> -							    bool type_7)
> +							    const struct displayid_block *block,
> +							    const struct displayid_detailed_timings_1 *timings)
>  {
>  	struct drm_display_mode *mode;
>  	unsigned int pixel_clock = (timings->pixel_clock[0] |
> @@ -6809,11 +6809,16 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
>  	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
>  	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
>  	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
> +	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
>  
>  	mode = drm_mode_create(dev);
>  	if (!mode)
>  		return NULL;
>  
> +	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, block->rev) >= 1)
> +		mode->dsc_passthrough_timings_support =
> +			!!(block->rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);

The !! and parentheses are superfluous.

> +
>  	/* resolution is kHz for type VII, and 10 kHz for type I */
>  	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
>  	mode->hdisplay = hactive;
> @@ -6846,7 +6851,6 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>  	int num_timings;
>  	struct drm_display_mode *newmode;
>  	int num_modes = 0;
> -	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
>  	/* blocks must be multiple of 20 bytes length */
>  	if (block->num_bytes % 20)
>  		return 0;
> @@ -6855,7 +6859,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>  	for (i = 0; i < num_timings; i++) {
>  		struct displayid_detailed_timings_1 *timings = &det->timings[i];
>  
> -		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
> +		newmode = drm_mode_displayid_detailed(connector->dev, block, timings);
>  		if (!newmode)
>  			continue;
>  
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b9bb92e4b029..312e5c03af9a 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -417,6 +417,16 @@ struct drm_display_mode {
>  	 */
>  	enum hdmi_picture_aspect picture_aspect_ratio;
>  
> +	/**
> +	 * @dsc_passthrough_timing_support:
> +	 *
> +	 * Indicates whether this mode timing descriptor is supported
> +	 * with specific target DSC bits per pixel only.
> +	 *
> +	 * VESA vendor-specific data block shall exist with the relevant
> +	 * DSC bits per pixel declaration when this flag is set to true.
> +	 */
> +	bool dsc_passthrough_timings_support;
>  };
>  
>  /**

-- 
Jani Nikula, Intel
