Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CBC4C817
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F062F10E51D;
	Tue, 11 Nov 2025 09:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZ9dUpoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA2710E12C;
 Tue, 11 Nov 2025 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762851735; x=1794387735;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=f9HzI/+bQ8na/xTvfwlsXScGrbgL7vC3Dz7bjmQQ0fI=;
 b=YZ9dUpoLCILQltEeQQxKBuqiRjkERx5OgEN0RqUnr0K2OjpIVme0KNKw
 4mikirhCqUk+A6nRfMtzkhjIhFdNWIV/kBHcwtv93pbaQM884gJfAe+vG
 yzeiFFFa7wUV7Gahb6cnjrw+PvZD+CDGk/B44V6ZhpNKwwq7s31wyfhCM
 IEPo/MCD4EKSNTjmWyTJR1UtIZz0qdqHyUwJGo8eZQqHBe8NuOfrV7F/Q
 +Eadanr2uJo7nv3Kk19b7wme59WWUySWgocpdboLJCGREQ2iL6DBJ2ikY
 Hq9GJ02Wyc86POGsFkkDHGzWo46bXPpEbTVs0XYT0F/jhSR92dl28goK3 Q==;
X-CSE-ConnectionGUID: TRP8GfIkSxqOu9NftG0mDA==
X-CSE-MsgGUID: krBIgETTTzi2C2dZE6lZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68760088"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68760088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:02:14 -0800
X-CSE-ConnectionGUID: 0MBHKRweRXePxZdclQNHGw==
X-CSE-MsgGUID: z1GMCsMYS7KNfUoA6UP3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189346160"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:02:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Uma Shankar
 <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 swati2.sharma@intel.com, alex.hung@amd.com
Subject: Re: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
In-Reply-To: <b01cade8-ba63-472a-a95f-bba9af57afbb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-16-uma.shankar@intel.com>
 <6a310c6396adb711e5f996136a4f3c813c71e2bc@intel.com>
 <b01cade8-ba63-472a-a95f-bba9af57afbb@intel.com>
Date: Tue, 11 Nov 2025 11:02:05 +0200
Message-ID: <f3d7e6c6aad5e74a2ff515b974ea15fd274970fb@intel.com>
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

On Tue, 11 Nov 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> On 11/10/2025 5:39 PM, Jani Nikula wrote:
>> On Wed, 05 Nov 2025, Uma Shankar <uma.shankar@intel.com> wrote:
>>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>
>>> Add helpers to program the 3D LUT registers and arm them.
>>>
>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_color.c    | 57 +++++++++++++++++++
>>>   drivers/gpu/drm/i915/display/intel_color.h    |  2 +
>>>   .../drm/i915/display/intel_color_pipeline.c   | 35 +++++++++++-
>>>   .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>>>   .../drm/i915/display/intel_display_limits.h   |  1 +
>>>   .../drm/i915/display/intel_display_types.h    |  2 +-
>>>   drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>>>   7 files changed, 97 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>>> index f290432f3c31..ab9e889ce19f 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>> @@ -4061,6 +4061,44 @@ xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *pla
>>>   		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>>>   }
>>>   
>>> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color)
>>> +{
>>> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, drm_color_lut32_extract(color->red, 10)) |
>>> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, drm_color_lut32_extract(color->green, 10)) |
>>> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, drm_color_lut32_extract(color->blue, 10));
>>> +}
>>> +
>>> +static void glk_load_lut_3d(struct intel_dsb *dsb,
>>> +			    struct intel_crtc *crtc,
>>> +			    const struct drm_property_blob *blob)
>>> +{
>>> +	struct intel_display *display = to_intel_display(crtc->base.dev);
>>> +	const struct drm_color_lut32 *lut = blob->data;
>>> +	int i, lut_size = drm_color_lut32_size(blob);
>>> +	enum pipe pipe = crtc->pipe;
>>> +
>>> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY);
>> 
>> Why?
>> 
> ...
>
>>> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), LUT_3D_AUTO_INCREMENT);
>>> +	for (i = 0; i < lut_size; i++)
>>> +		intel_de_write_dsb(display, dsb, LUT_3D_DATA(pipe), glk_3dlut_10(&lut[i]));
>>> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), 0);
>>> +}
>>> +
>>> +static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc *crtc, bool enable)
>>> +{
>>> +	struct intel_display *display = to_intel_display(crtc);
>>> +	enum pipe pipe = crtc->pipe;
>>> +	u32 val;
>>> +
>>> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY);
>> 
>> Why?
>> 
>
> LUT_3D_READY is cleared off by the HW once the LUT buffer is loaded into 
> it's internal working RAM.
>
> So by the time we reach here (or above) this bit should be cleared off.
> This warn on was added to indicate if we are writing 3DLUT data while 
> hardware is still processing previous values.
>
> TOL, we should perhaps move it to the state checker in the same commit 
> or poll on it if there are precendance for doing such thing.

Yeah. The thing I dislike about throwing in random assert type checks
here and there is that they're incredibly long-lasting and hard to get
rid of.

In some cases (though unlikely here) you get static analyzer warnings on
things that are being checked as WARNs but not acted on, and then people
add error handling on them. Piles and piles of code get added for
reasons that become completely blurred over time. Especially so when
there's not even a mention of the reason in the commit message.

BR,
Jani.








>
> ==
> Chaitanya
>
>
>>> +
>>> +	if (enable)
>>> +		val = LUT_3D_ENABLE | LUT_3D_READY | LUT_3D_BIND_PLANE_1;
>>> +	else
>>> +		val = 0;
>>> +	intel_de_write_dsb(display, dsb, LUT_3D_CTL(pipe), val);
>>> +}
>>> +
>>>   static const struct intel_color_funcs chv_color_funcs = {
>>>   	.color_check = chv_color_check,
>>>   	.color_commit_arm = i9xx_color_commit_arm,
>>> @@ -4190,6 +4228,14 @@ static const struct intel_color_funcs ilk_color_funcs = {
>>>   	.get_config = ilk_get_config,
>>>   };
>>>   
>>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>> +				  const struct intel_plane_state *plane_state)
>>> +{
>>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>>> +
>>> +	glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>>> +}
>>> +
>>>   static void
>>>   intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>>>   				  const struct intel_plane_state *plane_state)
>>> @@ -4210,6 +4256,15 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
>>>   		display->funcs.color->load_plane_luts(dsb, plane_state);
>>>   }
>>>   
>>> +static void
>>> +intel_color_load_3dlut(struct intel_dsb *dsb,
>>> +		       const struct intel_plane_state *plane_state)
>>> +{
>>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>>> +
>>> +	glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
>>> +}
>>> +
>>>   void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>>   					const struct intel_plane_state *plane_state)
>>>   {
>>> @@ -4217,6 +4272,8 @@ void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>>   		intel_color_load_plane_csc_matrix(dsb, plane_state);
>>>   	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
>>>   		intel_color_load_plane_luts(dsb, plane_state);
>>> +	if (plane_state->hw.lut_3d)
>>> +		intel_color_load_3dlut(dsb, plane_state);
>>>   }
>>>   
>>>   void intel_color_crtc_init(struct intel_crtc *crtc)
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
>>> index 8051c827a1d8..a70df0c2bd9a 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>>> @@ -43,4 +43,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>>>   void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
>>>   void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>>   					const struct intel_plane_state *plane_state);
>>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>> +				  const struct intel_plane_state *plane_state);
>>>   #endif /* __INTEL_COLOR_H__ */
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>> index b6e6ebdd0dff..fd7d63ce6d9f 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>> @@ -12,11 +12,24 @@
>>>   #define PLANE_DEGAMMA_SIZE 128
>>>   #define PLANE_GAMMA_SIZE 32
>>>   
>>> +static inline bool
>>> +intel_crtc_has_lut_3d(struct intel_display *display, enum pipe pipe)
>>> +{
>>> +	if (DISPLAY_VER(display) >= 12)
>>> +		return pipe == PIPE_A || pipe == PIPE_B;
>>> +	else if (DISPLAY_VER(display) >= 10 /*|| IS_GEMINILAKE(display)*/)
>>> +		return pipe == PIPE_A;
>>> +	else
>>> +		return false;
>>> +}
>>> +
>>>   static
>>> -int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
>>> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
>>> +				     enum pipe pipe)
>>>   {
>>>   	struct intel_colorop *colorop;
>>>   	struct drm_device *dev = plane->dev;
>>> +	struct intel_display *display = to_intel_display(dev);
>>>   	int ret;
>>>   	struct drm_colorop *prev_op;
>>>   
>>> @@ -36,6 +49,22 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>>>   	/* TODO: handle failures and clean up */
>>>   	prev_op = &colorop->base;
>>>   
>>> +	if (DISPLAY_VER(display) >= 35 &&
>>> +	    intel_crtc_has_lut_3d(display, pipe) &&
>>> +	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>>> +		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>>> +
>>> +		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
>>> +						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>> +						   true);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		drm_colorop_set_next_property(prev_op, &colorop->base);
>>> +
>>> +		prev_op = &colorop->base;
>>> +	}
>>> +
>>>   	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>>>   	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>>>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> @@ -58,7 +87,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>>>   	return 0;
>>>   }
>>>   
>>> -int intel_color_pipeline_plane_init(struct drm_plane *plane)
>>> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
>>>   {
>>>   	struct drm_device *dev = plane->dev;
>>>   	struct intel_display *display = to_intel_display(dev);
>>> @@ -77,7 +106,7 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane)
>>>   	len++;
>>>   
>>>   	/* Add pipeline consisting of transfer functions */
>>> -	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
>>> +	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>>>   	if (ret)
>>>   		return ret;
>>>   	len++;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>>> index 7f1d32bc9202..a457d306da7f 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>>> @@ -7,7 +7,8 @@
>>>   #define __INTEL_COLOR_PIPELINE_H__
>>>   
>>>   struct drm_plane;
>>> +enum pipe;
>>>   
>>> -int intel_color_pipeline_plane_init(struct drm_plane *plane);
>>> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe);
>>>   
>>>   #endif /* __INTEL_COLOR_PIPELINE_H__ */
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
>>> index 55fd574ba313..cb3c9c665c44 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
>>> @@ -142,6 +142,7 @@ enum intel_color_block {
>>>   	INTEL_PLANE_CB_PRE_CSC_LUT,
>>>   	INTEL_PLANE_CB_CSC,
>>>   	INTEL_PLANE_CB_POST_CSC_LUT,
>>> +	INTEL_PLANE_CB_3DLUT,
>>>   
>>>   	INTEL_CB_MAX
>>>   };
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>>> index d8fe80a55601..50a14f75b727 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>>> @@ -646,7 +646,7 @@ struct intel_plane_state {
>>>   		enum drm_color_encoding color_encoding;
>>>   		enum drm_color_range color_range;
>>>   		enum drm_scaling_filter scaling_filter;
>>> -		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut;
>>> +		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut, *lut_3d;
>>>   	} hw;
>>>   
>>>   	struct i915_vma *ggtt_vma;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
>>> index 298f8e186fee..7c230a2832c2 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
>>> @@ -348,6 +348,8 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
>>>   		return	drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
>>>   	else if (intel_colorop->id == INTEL_PLANE_CB_POST_CSC_LUT)
>>>   		return drm_property_replace_blob(&plane_state->hw.gamma_lut, blob);
>>> +	else if (intel_colorop->id == INTEL_PLANE_CB_3DLUT)
>>> +		return	drm_property_replace_blob(&plane_state->hw.lut_3d, blob);
>>>   
>>>   	return false;
>>>   }
>> 
>

-- 
Jani Nikula, Intel
