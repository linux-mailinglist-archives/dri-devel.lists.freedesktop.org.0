Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26EA358DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F310E252;
	Fri, 14 Feb 2025 08:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZxeHA0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99E510E252
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739521712; x=1771057712;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V3Xr3QiP78maYmiAK6Evzqh5bcv1fR5OMCHsNSxXByg=;
 b=FZxeHA0PjCEspFRAL0t89RxM7LQVAU2wG8CpuI4c+NsJn+0LbAQ0Thjo
 LxGrjPEkqNCBHr1ubmX5ZKlAwZAWmfDrGR9h0fDVV6yWXIKCTrPbaTqoD
 C82ptRUNHhmDIUcUFKpm81bm4QGzVL4Dr9B1eLfXcVWgHjB9tRvUyUD3J
 AXvtHVli2jd8FmpN104osfhluRYmFBAEUXjzeoan38DtVpHAVYCj5Q18i
 NI8HwZpvL2xBZm1izEWW8NxTue0Ugpsi1YCSAAeAByjGi0/MnLGhl53GF
 I6e6EMbxC3wwLezvzWHbtEwLLhvC4KxZa7A6oQfqwwUq/nbnGvfs1orB2 g==;
X-CSE-ConnectionGUID: uXfecOf8Qfa0w7BJeJqRrA==
X-CSE-MsgGUID: B+CKi3u0SGOfH2YlfjzaIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40523271"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40523271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:28:31 -0800
X-CSE-ConnectionGUID: 2eSPc9qgRiunPeq3Kavqag==
X-CSE-MsgGUID: 1K1D7/qdRC+1zJoYwzd0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114294467"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:28:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Subject: Re: [PATCH v2 2/2] drm/edid: Refactor DisplayID timing block structs
In-Reply-To: <20250214010545.3793736-1-sdoregor@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <7cab8349bc8bb6fa08d2a7127a724efea155f154.camel@sdore.me>
 <20250214010545.3793736-1-sdoregor@sdore.me>
Date: Fri, 14 Feb 2025 10:28:24 +0200
Message-ID: <87cyflvsk7.fsf@intel.com>
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
> Replaced an error with a printed warning as well.
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>

So the two patches should each stand on their own, instead of this one
fixing the issues in the first.

BR,
Jani.


> ---
>  drivers/gpu/drm/drm_displayid_internal.h | 22 ++++++++--------
>  drivers/gpu/drm/drm_edid.c               | 32 ++++++++++++------------
>  2 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 88220c107822..957dd0619f5c 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -115,25 +115,25 @@ struct displayid_tiled_block {
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

The above belong in patch 2.

>  
>  struct displayid_formula_timings_9 {
>  	u8 flags;
> -	__be16 hactive;
> -	__be16 vactive;
> +	__le16 hactive;
> +	__le16 vactive;

The above belong in patch 1.

>  	u8 vrefresh;
>  } __packed;
>  
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 9c363df5af9a..54122a12a24f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6764,19 +6764,19 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
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

The above belong in patch 2.

>  
>  	mode = drm_mode_create(dev);
>  	if (!mode)
> @@ -6838,8 +6838,8 @@ static struct drm_display_mode *drm_mode_displayid_formula(struct drm_device *de
>  							   bool type_10)
>  {
>  	struct drm_display_mode *mode;
> -	u16 hactive = be16_to_cpu(timings->hactive) + 1;
> -	u16 vactive = be16_to_cpu(timings->vactive) + 1;
> +	u16 hactive = le16_to_cpu(timings->hactive) + 1;
> +	u16 vactive = le16_to_cpu(timings->vactive) + 1;
>  	u8 timing_formula = timings->flags & 0x7;
>  
>  	/* TODO: support RB-v2 & RB-v3 */
> @@ -6848,7 +6848,7 @@ static struct drm_display_mode *drm_mode_displayid_formula(struct drm_device *de
>  
>  	/* TODO: support video-optimized refresh rate */
>  	if (timings->flags & (1 << 4))
> -		return NULL;
> +		drm_dbg_kms(dev, "Fractional vrefresh is not implemented, proceeding with non-video-optimized refresh rate");

The above belong in patch 1.

>  
>  	mode = drm_cvt_mode(dev, hactive, vactive, timings->vrefresh + 1, timing_formula == 1, false, false);
>  	if (!mode)

-- 
Jani Nikula, Intel
