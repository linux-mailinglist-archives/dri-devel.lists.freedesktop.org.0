Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFA2CA38F7
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049810E942;
	Thu,  4 Dec 2025 12:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzAhR6wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4505C10E93F;
 Thu,  4 Dec 2025 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764850272; x=1796386272;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TJAFFG/UpvZObzhCsPEHrWrwMC5HnC2pRmBFGK+Nyu0=;
 b=GzAhR6wgD3bZdctRjsgvmxI3dqoCSDPoZMz8KQLHXEZHnjv/U4CZpbOQ
 gPi3Ki1M9mvDKMHlcKuFyY6ZgihZri0nbyMr+7wcrlrT6jLb7gJ+B+V7L
 K4b0GZPhsW5uguf1uZBafC8+CvJwfplzC0P9zOHQxrxAeeC0hEwvTBZbO
 V5waxZANSfDpIEObsrAaErQyEtz0tq4s7Mduz+9T6z9kWiZKYtSpPKrIU
 yYDsDk6K4R7gLRSCrwO/C4fEFK2X6HiybR+Uj/lKVRqJRUFwntI39yH23
 KtQOT2eldQsM4Lb/tgodYaD56ufy7v0LY4rrhfoIzP43qkhE3qSi5uumQ g==;
X-CSE-ConnectionGUID: yWQ+GCVBQ/C57wayNYEiRQ==
X-CSE-MsgGUID: mp8CLdPlTVmVME3PhpLShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66904544"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66904544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:11:12 -0800
X-CSE-ConnectionGUID: zxomv8GLThSDDn9uXuqtYQ==
X-CSE-MsgGUID: PXSzXa6wR4a8eu8+3Tatlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194789507"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:11:06 -0800
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
Subject: Re: [PATCH v7 4/7] drm/edid: parse DSC DPP passthru support flag
 for mode VII timings
In-Reply-To: <20251202110218.9212-5-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251202110218.9212-1-iam@lach.pw>
 <20251202110218.9212-5-iam@lach.pw>
Date: Thu, 04 Dec 2025 14:11:02 +0200
Message-ID: <b0b1567707c91806e3758bf0b678c2038dffb3c2@intel.com>
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

On Tue, 02 Dec 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> For timings v7 block revision >=1, revision field also contains a bit
> that indicates that the mode timings should only be used with fixed bits
> per pixel value specified in vesa vendor-specific block.
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>

On the EDID/DisplayID parts,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

but I'd like to get ack from e.g. Ville about the
dsc_passthrough_timings_support member in struct drm_display_mode.

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
> index 380a9dda275f..b28ff4bafb1d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6794,8 +6794,8 @@ static void update_display_info(struct drm_connector *connector,
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
> @@ -6811,11 +6811,16 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
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
> +			block->rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT;
> +
>  	/* resolution is kHz for type VII, and 10 kHz for type I */
>  	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
>  	mode->hdisplay = hactive;
> @@ -6848,7 +6853,6 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>  	int num_timings;
>  	struct drm_display_mode *newmode;
>  	int num_modes = 0;
> -	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
>  	/* blocks must be multiple of 20 bytes length */
>  	if (block->num_bytes % 20)
>  		return 0;
> @@ -6857,7 +6861,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
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
