Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D5BE49C7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9910EA45;
	Thu, 16 Oct 2025 16:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nwqo3f6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2275A10EA45;
 Thu, 16 Oct 2025 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760632627; x=1792168627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LbMQXYYD2VCFhyGbP4YBItotcfoofyldIjj+Vt4ukYo=;
 b=Nwqo3f6lzl2pxF4znTQvr9L/Hbu1DhfTM4vdM4lwbtseKYzY7XmZiIY1
 R33eRSpu2OR2qPaybra2WzaOgUrD9DZ+trkuYKCTYiRiAO+IhRpZmjBf1
 Cj9wY5I5/KCoDMlo4A0o1t44vynH3Qjk5uBVwq8mgiqgOGL2GPiciwXqK
 hA2EFCFhjko7/DBLmt8JBE0rMS8cKekumm+KpnBkiNiIwVCo/KMLDmVPx
 c3gUXhpUmN5s6AWfxYDaPn9GRfeP+WU2qxlrHjMbcp7R2xZYSGDVBGsPd
 a8Chmz9wnHV2kMQ59zFSFJpXlhsVzQ4Xfkv5e+jNGO5qSjmpwTMxQFvf/ w==;
X-CSE-ConnectionGUID: KMTQfX2hS9CJSwaQKLZwOg==
X-CSE-MsgGUID: wMwTTUupRnamnTjthltGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65450138"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65450138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:37:06 -0700
X-CSE-ConnectionGUID: 0jiOiGrZQAKpydpnQhqX6w==
X-CSE-MsgGUID: mZqcDuquS5SRKye74ytZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182474326"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.155])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:37:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, Maarten Lankhorst
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
Subject: Re: [PATCH v4 1/2] drm/edid: parse DRM VESA dsc bpp target
In-Reply-To: <20251016001038.13611-4-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251016001038.13611-2-iam@lach.pw>
 <20251016001038.13611-4-iam@lach.pw>
Date: Thu, 16 Oct 2025 19:36:57 +0300
Message-ID: <3abc1087618c822e5676e67a3ec2e64e506dc5ec@intel.com>
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

On Thu, 16 Oct 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
> VESA vendor-specific data block may contain target DSC bits per pixel
> fields

Thanks for the patch.

I think there's just too much going on in a single patch. Should
probably be split to several patches:

- rename drm_parse_vesa_mso_data() to drm_parse_vesa_specific_block()

- handle DSC pass-through parts in the above, including the macros for
  parsing that (but nothing about timing here yet), and adding to
  display_info

- note that the above would be needed to backport mso support for 7 byte
  vendor blocks to stable!

- Add the detailed timing parsing in a separate patch

>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_displayid_internal.h |  8 ++++
>  drivers/gpu/drm/drm_edid.c               | 61 ++++++++++++++++--------
>  include/drm/drm_connector.h              |  6 +++
>  include/drm/drm_modes.h                  | 10 ++++
>  4 files changed, 64 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 957dd0619f5c..d008a98994bb 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -97,6 +97,10 @@ struct displayid_header {
>  	u8 ext_count;
>  } __packed;
>  
> +#define DISPLAYID_BLOCK_REV				GENMASK(2, 0)
> +#define DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT	BIT(3)
> +#define DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES	GENMASK(6, 4)

These two are related to the rev of struct
displayid_detailed_timing_block only, and should probably be defined
next to it.

> +
>  struct displayid_block {
>  	u8 tag;
>  	u8 rev;
> @@ -144,12 +148,16 @@ struct displayid_formula_timing_block {
>  
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
> +#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
>  
>  struct displayid_vesa_vendor_specific_block {
>  	struct displayid_block base;
>  	u8 oui[3];
>  	u8 data_structure_type;
>  	u8 mso;
> +	u8 dsc_bpp_int;
> +	u8 dsc_bpp_fract;
>  } __packed;
>  
>  /*
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e2e85345aa9a..6e42e55b41f9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6524,8 +6524,8 @@ static void drm_get_monitor_range(struct drm_connector *connector,
>  		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
>  }
>  
> -static void drm_parse_vesa_mso_data(struct drm_connector *connector,
> -				    const struct displayid_block *block)
> +static void drm_parse_vesa_specific_block(struct drm_connector *connector,
> +					  const struct displayid_block *block)
>  {
>  	struct displayid_vesa_vendor_specific_block *vesa =
>  		(struct displayid_vesa_vendor_specific_block *)block;
> @@ -6541,7 +6541,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>  		return;
>  
> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
> +	if (block->num_bytes < 5) {
>  		drm_dbg_kms(connector->dev,
>  			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>  			    connector->base.id, connector->name);
> @@ -6564,28 +6564,40 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  		break;
>  	}
>  
> -	if (!info->mso_stream_count) {
> -		info->mso_pixel_overlap = 0;
> -		return;
> -	}
> +	info->mso_pixel_overlap = 0;

Nitpick, I kind of like having this in the else path below instead of
first setting it to 0 and then setting it again to something else.

>  
> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> -	if (info->mso_pixel_overlap > 8) {
> -		drm_dbg_kms(connector->dev,
> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
> -			    connector->base.id, connector->name,
> -			    info->mso_pixel_overlap);
> -		info->mso_pixel_overlap = 8;
> +	if (info->mso_stream_count) {
> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> +		if (info->mso_pixel_overlap > 8) {
> +			drm_dbg_kms(connector->dev,
> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
> +				    connector->base.id, connector->name,
> +				    info->mso_pixel_overlap);
> +			info->mso_pixel_overlap = 8;
> +		}
>  	}
>  
>  	drm_dbg_kms(connector->dev,
>  		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>  		    connector->base.id, connector->name,
>  		    info->mso_stream_count, info->mso_pixel_overlap);

Not sure we want to debug log this unless info->mso_stream_count !=
0. This is a rare feature.

Side note, we seem to be lacking the check for
data_structure_type. Probably my bad. I'm not asking you to fix it, but
hey, if you're up for it, another patch is welcome! ;)

> +
> +	if (block->num_bytes < 7) {
> +		/* DSC bpp is optional */
> +		return;
> +	}
> +
> +	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) << 4 |
> +			   FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
> +
> +	drm_dbg_kms(connector->dev,
> +		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
> +		    connector->base.id, connector->name,
> +		    info->dp_dsc_bpp);
>  }
>  
> -static void drm_update_mso(struct drm_connector *connector,
> -			   const struct drm_edid *drm_edid)
> +static void drm_update_vesa_specific_block(struct drm_connector *connector,
> +					   const struct drm_edid *drm_edid)
>  {
>  	const struct displayid_block *block;
>  	struct displayid_iter iter;
> @@ -6593,7 +6605,7 @@ static void drm_update_mso(struct drm_connector *connector,
>  	displayid_iter_edid_begin(drm_edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
>  		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
> -			drm_parse_vesa_mso_data(connector, block);
> +			drm_parse_vesa_specific_block(connector, block);
>  	}
>  	displayid_iter_end(&iter);
>  }
> @@ -6630,6 +6642,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->mso_stream_count = 0;
>  	info->mso_pixel_overlap = 0;
>  	info->max_dsc_bpp = 0;
> +	info->dp_dsc_bpp = 0;
>  
>  	kfree(info->vics);
>  	info->vics = NULL;
> @@ -6753,7 +6766,7 @@ static void update_display_info(struct drm_connector *connector,
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>  		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>  
> -	drm_update_mso(connector, drm_edid);
> +	drm_update_vesa_specific_block(connector, drm_edid);
>  
>  out:
>  	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
> @@ -6784,7 +6797,8 @@ static void update_display_info(struct drm_connector *connector,
>  
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>  							    const struct displayid_detailed_timings_1 *timings,
> -							    bool type_7)
> +							    bool type_7,
> +							    int rev)

If we added struct displayid_detailed_timing_block *block parameter
(between dev and timings), the function could figure it all out from
there instead of having to pass several parameters. Dunno which is
cleaner. It's also not neat to pass rev as int, when it's really data
that has to be parsed.

>  {
>  	struct drm_display_mode *mode;
>  	unsigned int pixel_clock = (timings->pixel_clock[0] |
> @@ -6805,6 +6819,10 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
>  	if (!mode)
>  		return NULL;
>  
> +	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, rev) >= 1)
> +		mode->dsc_passthrough_timings_support =
> +			!!(rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);

I wonder if it would make life easier all around if we just filled the
dp_dsc_bpp in the mode itself, instead of having a flag and having to
look it up separately?

> +
>  	/* resolution is kHz for type VII, and 10 kHz for type I */
>  	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
>  	mode->hdisplay = hactive;
> @@ -6846,7 +6864,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>  	for (i = 0; i < num_timings; i++) {
>  		struct displayid_detailed_timings_1 *timings = &det->timings[i];
>  
> -		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
> +		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7, block->rev);
>  		if (!newmode)
>  			continue;
>  
> @@ -6893,7 +6911,8 @@ static int add_displayid_formula_modes(struct drm_connector *connector,
>  	struct drm_display_mode *newmode;
>  	int num_modes = 0;
>  	bool type_10 = block->tag == DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
> -	int timing_size = 6 + ((formula_block->base.rev & 0x70) >> 4);
> +	int timing_size = 6 +
> +		FIELD_GET(DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES, formula_block->base.rev);

I think this is an unrelated change. Probably something we want, but
should not be in the same patch with the rest.

>  
>  	/* extended blocks are not supported yet */
>  	if (timing_size != 6)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..01640fcf7464 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -837,6 +837,12 @@ struct drm_display_info {
>  	 */
>  	u32 max_dsc_bpp;
>  
> +	/**
> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
> +	 * DSC bits per pixel in 6.4 fixed point format. 0 means undefined.
> +	 */
> +	u16 dp_dsc_bpp;

It's slightly annoying that we have max_dsc_bpp which is int, and
dp_dsc_bpp, which is 6.4 fixed point. The drm_dp_helper.c uses _x16
suffix for the 6.4 bpp, so maybe do the same here, dp_dsc_bpp_x16?

> +
>  	/**
>  	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>  	 */
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
