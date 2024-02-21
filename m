Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D785085E565
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 19:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F7B10E57C;
	Wed, 21 Feb 2024 18:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4FWW2wW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7652F10E63D;
 Wed, 21 Feb 2024 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708539628; x=1740075628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SvTDEY+0QcaH0E2UrMugQ8Cuiud8mCTZP++Vpeo4srs=;
 b=g4FWW2wWthybHSTxVNMghbwA5IRJ3TOWvF+1wOIf9ZlK01d8aB3NzHiV
 5xOuApIe0jHQoYXOZeVmzmFrCSsOVQT6+ftE0Tinjqdd4qU9x9N6n2k4L
 nk3KKGKXaBbotKMpcw4avq4p81sL2jUfpR98mIkfyLfhjv0gaLWNOu1hu
 WAMoiH+1M0EzZwBYJ2xXltLtJn4w/KeZQ0drDlr0qfBeBDEBrIekWpmaB
 8k+nzjzTrhu+Y9WxWHqfqHTFydM7Bmsryw2m8+6RG2vi4h7NbioqNyf3Z
 tiQZrF4cnpWvuM8fOuHFvKMlEDhP66M2Sfw4bD6LVk+IXtbTp8bxZKpWH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20263715"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="20263715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 10:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827390066"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="827390066"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 21 Feb 2024 10:20:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 20:20:22 +0200
Date: Wed, 21 Feb 2024 20:20:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drivers/i915/intel_bios: Fix parsing backlight BDB data
Message-ID: <ZdY-5pcLQMNosnYt@intel.com>
References: <20240220141256.v1.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220141256.v1.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 20, 2024 at 02:12:57PM -0700, Karthikeyan Ramasubramanian wrote:
> Starting BDB version 239, hdr_dpcd_refresh_timeout is introduced to
> backlight BDB data. Commit 700034566d68 ("drm/i915/bios: Define more BDB
> contents") updated the backlight BDB data accordingly. This broke the
> parsing of backlight BDB data in VBT for versions 236 - 238 (both
> inclusive) and hence the backlight controls are not responding on units
> with the concerned BDB version.
> 
> backlight_control information has been present in backlight BDB data
> from at least BDB version 191 onwards, if not before. Hence this patch
> extracts the backlight_control information if the block size of
> backlight BDB is >= version 191 backlight BDB block size.
> Tested on Chromebooks using Jasperlake SoC (reports bdb->version = 236).
> Tested on Chromebooks using Raptorlake SoC (reports bdb->version = 251).
> 
> Fixes: 700034566d68 ("drm/i915/bios: Define more BDB contents")
> Cc: stable@vger.kernel.org
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
> ---
> 
>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++--------------
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  2 --
>  2 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index aa169b0055e97..4ec50903b9e64 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1041,23 +1041,13 @@ parse_lfp_backlight(struct drm_i915_private *i915,
>  
>  	panel->vbt.backlight.type = INTEL_BACKLIGHT_DISPLAY_DDI;
>  	panel->vbt.backlight.controller = 0;
> -	if (i915->display.vbt.version >= 191) {
> -		size_t exp_size;
> +	if (i915->display.vbt.version >= 191 &&
> +	    get_blocksize(backlight_data) >= EXP_BDB_LFP_BL_DATA_SIZE_REV_191) {

The size checks looks like nonsense to me. I guess maybe
we needed it before we were guaranteed to have the full
struct's worth of memory. But there should be no need for
this anymore.

> +		const struct lfp_backlight_control_method *method;
>  
> -		if (i915->display.vbt.version >= 236)
> -			exp_size = sizeof(struct bdb_lfp_backlight_data);
> -		else if (i915->display.vbt.version >= 234)
> -			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_234;
> -		else
> -			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_191;
> -
> -		if (get_blocksize(backlight_data) >= exp_size) {
> -			const struct lfp_backlight_control_method *method;
> -
> -			method = &backlight_data->backlight_control[panel_type];
> -			panel->vbt.backlight.type = method->type;
> -			panel->vbt.backlight.controller = method->controller;
> -		}
> +		method = &backlight_data->backlight_control[panel_type];
> +		panel->vbt.backlight.type = method->type;
> +		panel->vbt.backlight.controller = method->controller;
>  	}
>  
>  	panel->vbt.backlight.pwm_freq_hz = entry->pwm_freq_hz;
> diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> index a9f44abfc9fc2..aeea5635a37ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> @@ -899,8 +899,6 @@ struct lfp_brightness_level {
>  
>  #define EXP_BDB_LFP_BL_DATA_SIZE_REV_191 \
>  	offsetof(struct bdb_lfp_backlight_data, brightness_level)
> -#define EXP_BDB_LFP_BL_DATA_SIZE_REV_234 \
> -	offsetof(struct bdb_lfp_backlight_data, brightness_precision_bits)
>  
>  struct bdb_lfp_backlight_data {
>  	u8 entry_size;
> -- 
> 2.44.0.rc0.258.g7320e95886-goog

-- 
Ville Syrjälä
Intel
