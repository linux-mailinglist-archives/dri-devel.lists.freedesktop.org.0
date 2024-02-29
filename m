Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B965286C715
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4510E420;
	Thu, 29 Feb 2024 10:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqCfOZcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4ED10E3FB;
 Thu, 29 Feb 2024 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709203064; x=1740739064;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hpKSgYGqvJQ3oE+hBFflzdNtVFWuhZCktLf62FrxXaI=;
 b=KqCfOZcwFLgFtZgEwTmp7enNgPOvg8kDAj+JQ/ubSRvqPre2UhPGH8ud
 +TDTeOJy+uzxpTi+kXCSwWdRm6uqFQixKBhwlQnLD0RO9dtrhEMn7f9Ky
 CA7FGNAUzo8mUKBG6j/JFHKIQsL0gNjZRa7DRkfnRhn3Vi5ilndtBXLZ5
 6jKSTwOqr50g4JeMMEMhS2G+jYfwipDkLjAWDgLLgpSgLPjABZJgI1zSx
 HghISubPIsSv7sQ626yjTN9JRaKhgqZSRHvV028N+TsxLeVRU7Guh4J60
 rGUuHIUQdNxZXV6H1vKefJBwTh3ZFlNVjl2RP3wZk3iXGigZ+UH3ZQYw7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14814897"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14814897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7737780"
Received: from smatua-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.143])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:37:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com, Mitul
 Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
In-Reply-To: <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 29 Feb 2024 12:37:38 +0200
Message-ID: <87msrj8sjx.fsf@intel.com>
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

On Wed, 28 Feb 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Add structure representing Adaptive Sync Secondary Data Packet (AS SDP).
> Also, add Adaptive Sync SDP logging in drm_dp_helper.c to facilitate
> debugging.

To be honest, the division of patches is a bit weird. There's no reason
to change i915 here, is there?

> --v2:
> - Update logging. [Jani, Ankit]
> - Use 'as_sdp' instead of 'async' [Ankit]
> - Correct define placeholders to where they are actually used. [Jani]
> - Update members in 'as_sdp' structure to make it uniform. [Jani]
>
> --v3:
> - Added changes to dri-devel mailing list. No code changes.
>
> --v4:
> - Instead of directly using operation mode, use an enum to accommodate
> all operation modes (Ankit).
>
> --v5:
> Nit-pick changes to commit message.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 12 +++++++
>  .../drm/i915/display/intel_crtc_state_dump.c  | 12 +++++++
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  include/drm/display/drm_dp.h                  |  9 +++++
>  include/drm/display/drm_dp_helper.h           | 33 +++++++++++++++++++
>  5 files changed, 67 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index f94c04db7187..b1459ac92aea 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2913,6 +2913,18 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>  
> +void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp)
> +{
> +	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
> +		   as_sdp->revision, as_sdp->length);
> +	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
> +	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
> +	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
> +	drm_printf(p, "    duration_decr_ms: %d\n", as_sdp->duration_decr_ms);
> +	drm_printf(p, "    operation_mode: %d\n", as_sdp->mode);
> +}
> +EXPORT_SYMBOL(drm_dp_as_sdp_log);
> +
>  /**
>   * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
>   * @aux: DisplayPort AUX channel
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 4bcf446c75f4..26d77c2934e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -60,6 +60,15 @@ intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
>  	drm_dp_vsc_sdp_log(&p, vsc);
>  }
>  
> +static void
> +intel_dump_dp_as_sdp(struct drm_i915_private *i915,
> +		     const struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "AS_SDP");
> +
> +	drm_dp_as_sdp_log(&p, as_sdp);
> +}
> +
>  static void
>  intel_dump_buffer(struct drm_i915_private *i915,
>  		  const char *prefix, const u8 *buf, size_t len)
> @@ -299,6 +308,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>  	if (pipe_config->infoframes.enable &
>  	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
>  		intel_dump_infoframe(i915, &pipe_config->infoframes.drm);
> +	if (pipe_config->infoframes.enable &
> +	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
> +		intel_dump_dp_as_sdp(i915, &pipe_config->infoframes.as_sdp);
>  	if (pipe_config->infoframes.enable &
>  	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
>  		intel_dump_dp_vsc_sdp(i915, &pipe_config->infoframes.vsc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8ce986fadd9a..1256730ea276 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1335,6 +1335,7 @@ struct intel_crtc_state {
>  		union hdmi_infoframe hdmi;
>  		union hdmi_infoframe drm;
>  		struct drm_dp_vsc_sdp vsc;
> +		struct drm_dp_as_sdp as_sdp;
>  	} infoframes;
>  
>  	u8 eld[MAX_ELD_BYTES];
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 281afff6ee4e..0601b95d53db 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1578,10 +1578,12 @@ enum drm_dp_phy {
>  #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
>  #define DP_SDP_ISRC			0x06 /* DP 1.2 */
>  #define DP_SDP_VSC			0x07 /* DP 1.2 */
> +#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */
>  #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
>  #define DP_SDP_PPS			0x10 /* DP 1.4 */
>  #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
>  #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
> +
>  /* 0x80+ CEA-861 infoframe types */
>  
>  #define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
> @@ -1737,4 +1739,11 @@ enum dp_content_type {
>  	DP_CONTENT_TYPE_GAME = 0x04,
>  };
>  
> +enum operation_mode {
> +	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
> +	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
> +	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
> +	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
> +};
> +
>  #endif /* _DRM_DP_H_ */
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 7c1aa3a703c8..7b7729488ad8 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -98,6 +98,37 @@ struct drm_dp_vsc_sdp {
>  	enum dp_content_type content_type;
>  };
>  
> +/**
> + * struct drm_dp_as_sdp - drm DP Adaptive Sync SDP
> + *
> + * This structure represents a DP AS SDP of drm
> + * It is based on DP 2.1 spec [Table 2-126:  Adaptive-Sync SDP Header Bytes] and
> + * [Table 2-127: Adaptive-Sync SDP Payload for DB0 through DB8]
> + *
> + * @sdp_type: Secondary-data packet type
> + * @revision: Revision Number
> + * @length: Number of valid data bytes
> + * @vtotal: Minimum Vertical Vtotal
> + * @target_rr: Target Refresh
> + * @duration_incr_ms: Successive frame duration increase
> + * @duration_decr_ms: Successive frame duration decrease
> + * @operation_mode: Adaptive Sync Operation Mode
> + */
> +

Superfluous newline.

> +struct drm_dp_as_sdp {
> +	unsigned char sdp_type;
> +	unsigned char revision;
> +	unsigned char length;
> +	int vtotal;
> +	int target_rr;
> +	int duration_incr_ms;
> +	int duration_decr_ms;
> +	enum operation_mode mode;
> +};
> +
> +void drm_dp_as_sdp_log(struct drm_printer *p,
> +		       const struct drm_dp_as_sdp *as_sdp);
> +
>  void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>  
>  bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> @@ -810,6 +841,8 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
>  #define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
>  #define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
>  
> +#define AS_SDP_OP_MODE			GENMASK(1, 0)

Oddly placed, oddly named.

> +
>  int drm_dp_bw_overhead(int lane_count, int hactive,
>  		       int dsc_slice_count,
>  		       int bpp_x16, unsigned long flags);

-- 
Jani Nikula, Intel
