Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2177F74A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BC010E47A;
	Thu, 17 Aug 2023 13:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631D710E47C;
 Thu, 17 Aug 2023 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692277583; x=1723813583;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wE7qeL3PmBJFRmq8LxVnfupjLQQE+KvKqnjTG7gUkqw=;
 b=UcmX4+BsbZGsxB9HofroWxyi+x3IjKwvBtIkQ23RlaItMdPxJ5/oJIsN
 4DEgLk53JyRzGM5lMXKs0b1NgknDGtUTw6+6Bg145nZC4YX7ktj2tjZ86
 7Duhr2FVlOsVkl6jwKF38ZgpPy/H9E1sEDzRdVqIVdaAvATY0KkTWSJWW
 Z83RfWGxj48cyVR/kmGL1SDvv7S+Mb0BiU6HaOSp8DdGVDmskmgfzzS46
 wySwBbjKGfRrmH1sRnTfugo/jBjG2SdTgyg6JaTr0+2kpzRA487JHFhE/
 oVMw8o9OUtX5ZZJNUEj7EDRFt4exMLwsq4kzGh4/9YMRpyxbVfqORtdiU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436707635"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="436707635"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 06:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="981150375"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="981150375"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 06:06:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dirk Lehmann <develop@dj-l.de>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/edid: Fix "Analog composite sync!" for
 current eDP display panels
In-Reply-To: <E1qWbpR-0007ey-0B@djlnb.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230815101907.2900768-1-jani.nikula@intel.com>
 <E1qWbpR-0007ey-0B@djlnb.local>
Date: Thu, 17 Aug 2023 16:05:56 +0300
Message-ID: <87o7j595u3.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Dirk Lehmann <develop@dj-l.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2023, Dirk Lehmann <develop@dj-l.de> wrote:
> VESA Enhanced EDID Standard does not clearly describe how display
> panel vendors should setup the Sync Signal Defintions (bit 4 & 3) in
> the Detailed Timing Definition (relative offset 17, absolute offset
> 47h[+18]) for Digital Video Signal Interfaces (bit 7 at offset 14h).
>
> In practice many eDP panels which using a Digital Video Signal
> Interfaces (bit 7 at offset 14h == 1) are leaving the Sync Signal
> Defintions at offset 47h[+18] blank 0x00, which would mean concerned
> with the VESA Standard [1] that they are using "Analog Composite
> Sync".
>
> Fix: Just detect Analog Sync Signal if an Analog Video Signal
>      Interface (bit 7 at offset 14h == 0) is in use.  Just detect
>      Digital Sync Signal if an Digital Video Signal Interface is in
>      use.
>
> Reference: [1] VESA Enhanced EDID Standard, Release A, Rev.2, Page 35

Please don't reply with patches in-reply-to other people's patches.

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789

This is now fixed by the revert that I just pushed.

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146

I don't think this patch fixes that one; see below.

> Signed-off-by: Dirk Lehmann <develop@dj-l.de>
> ---
>  drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++------
>  include/drm/drm_edid.h     | 12 +++++--
>  2 files changed, 73 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 1f470968ed14..6afdc34e55ce 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3437,6 +3437,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  	const struct drm_display_info *info = &connector->display_info;
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *mode;
> +	const struct edid *edid = drm_edid->edid;
>  	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
>  	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
>  	unsigned vactive = (pt->vactive_vblank_hi & 0xf0) << 4 | pt->vactive_lo;
> @@ -3456,10 +3457,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  			    connector->base.id, connector->name);
>  		return NULL;
>  	}
> -	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
> -		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
> -			    connector->base.id, connector->name);
> -	}
>  
>  	/* it is incorrect if hsync/vsync width is zero */
>  	if (!hsync_pulse_width || !vsync_pulse_width) {
> @@ -3505,11 +3502,68 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  
>  	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
>  		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
> +	} else if (edid->input & DRM_EDID_INPUT_DIGITAL) {
> +		/* !info->quirks && edid->input == DIGITAL  */
> +		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
> +		/* VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
> +		 *
> +		 * CASE DRM_EDID_PT_ANALOG_CSYNC:
> +		 *
> +		 * (pt->misc & DRM_EDID_PT_SYNC_MASK == 0x00) means
> +		 * "Analog Composite Sync" as described in VESA
> +		 * Standard.  But many digital display panels without
> +		 * composite sync are also using 0x00 here.
> +		 *
> +		 * Therefore use DEFAULT: as we are currently on an
> +		 * digital video signal interface.
> +		 */
> +		case DRM_EDID_PT_DIGITAL_CSYNC:
> +			drm_dbg_kms(dev,
> +				"[CONNECTOR:%d:%s] Digital composite sync!\n",
> +				connector->base.id, connector->name);
> +			mode->flags |= DRM_MODE_FLAG_CSYNC;
> +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
> +			break;
> +		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
> +			drm_dbg_kms(dev,
> +				"[CONNECTOR:%d:%s] Digital seperate sync!\n",
> +				connector->base.id, connector->name);
> +			goto digital_default;
> +			break; /* Missing BREAK throws a compiler warning  */

fallthrough; will do the trick.

> +		default:
> +digital_default:
> +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> +			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;

The failing mode in bug [1] has 0x0a for flags, so it ends up here, and
for that display this patch is a no-op.

As I explained in [2], all the problematic cases have invalid data, but
the ones fixed by the revert need to ignore the analog sync *flags* and
accept the mode, and the display in [1] needs to have the whole *mode*
rejected.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146
[2] https://gitlab.freedesktop.org/drm/intel/-/issues/8789#note_2047902

> +			break;
> +		}
>  	} else {
> -		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> -			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> -		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> -			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> +		/* !info->quirks && edid->input == ANALOG  */
> +		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
> +		/* VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
> +		 *
> +		 * CASE DRM_EDID_PT_ANALOG_CSYNC:
> +		 *
> +		 * (pt->misc & DRM_EDID_PT_SYNC_MASK == 0x00) for
> +		 * "Analog Composite Sync" is possible here, as we are
> +		 * currently on an analog video signal interface.
> +		 */
> +		case DRM_EDID_PT_ANALOG_CSYNC:
> +		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
> +			drm_dbg_kms(dev,
> +				"[CONNECTOR:%d:%s] Analog composite sync!\n",
> +				connector->base.id, connector->name);
> +			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
> +			break;
> +		default:
> +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> +			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> +			break;
> +		}

Another angle is that for analog displays, EDID offset 0x14 has info
about the supported sync modes. If we're separating digital/analog sync
handling, we should probably filter the analog sync with the info from
0x14.

BR,
Jani.


>  	}
>  
>  set_size:
> @@ -3522,8 +3576,8 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  	}
>  
>  	if (info->quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
> -		mode->width_mm = drm_edid->edid->width_cm * 10;
> -		mode->height_mm = drm_edid->edid->height_cm * 10;
> +		mode->width_mm = edid->width_cm * 10;
> +		mode->height_mm = edid->height_cm * 10;
>  	}
>  
>  	mode->type = DRM_MODE_TYPE_DRIVER;
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 48e93f909ef6..169755d3de19 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -61,9 +61,15 @@ struct std_timing {
>  	u8 vfreq_aspect;
>  } __attribute__((packed));
>  
> -#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
> -#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
> -#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
> +#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
> +# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
> +# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
> +# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
> +#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
> +#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
> +# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
> +#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csync */
> +#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
>  #define DRM_EDID_PT_STEREO         (1 << 5)
>  #define DRM_EDID_PT_INTERLACED     (1 << 7)

-- 
Jani Nikula, Intel Open Source Graphics Center
