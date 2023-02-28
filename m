Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533666A596B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA63210E6A4;
	Tue, 28 Feb 2023 12:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5261A10E6A1;
 Tue, 28 Feb 2023 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677588600; x=1709124600;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tbKjb7Mfopox7UDwFDTnueTIVMNnS9Ltr3NeD6nYIh8=;
 b=SSo0lON654Zv4HVh/P9BLjBz1+2tM5i4wkp+nY2e8RKGXBbd2iWuAKsx
 t8QTYZz6nQE68WXAvQKPKCWaZhLfxXEeXS8GTe8POV8BnL1OXv4FPzsEB
 bKy6k+7FWGXIxwAQzU2ddsd/mV+/4cvf++Rjena5MJY8M8AT0rjJNgdF/
 VyTl9H1SPb+Ymv6sn8i6IAOlvC7sD+5gbcFfiE661w1QbDiQPpm/ztg6n
 niJ9lRaUiKhKMg1AzbF7sZyAflY1aVKeonOuA7mDyZy38bwCkswTtTOLm
 vIB/qZORxYbNMt1KfUdt5GSNR98C9O5q9Zf7dZiHKX+hFGu2GeHtWy7os A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317925920"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="317925920"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:49:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="798060398"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="798060398"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:49:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 02/10] drm/i915/dsc: move rc_buf_thresh values to common
 helper
In-Reply-To: <CAA8EJpoubQQjuUAs342TVYgx09nw9vENXcsiJiDOq0e0_q=6Fw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
 <87mt4yyo2s.fsf@intel.com>
 <CAA8EJpoubQQjuUAs342TVYgx09nw9vENXcsiJiDOq0e0_q=6Fw@mail.gmail.com>
Date: Tue, 28 Feb 2023 14:49:50 +0200
Message-ID: <87h6v6ymxd.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Tue, 28 Feb 2023 at 14:25, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> > The rc_buf_thresh values are common to all DSC implementations. Move
>> > them to the common helper together with the code to propagage them to
>> > the drm_dsc_config.
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  drivers/gpu/drm/display/drm_dsc_helper.c  | 37 +++++++++++++++++++++++
>> >  drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +--------------
>> >  include/drm/display/drm_dsc_helper.h      |  1 +
>> >  3 files changed, 39 insertions(+), 23 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>> > index c869c6e51e2b..ab8679c158b5 100644
>> > --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>> > +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>> > @@ -270,6 +270,43 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>> >  }
>> >  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>> >
>> > +/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>> > +const u16 drm_dsc_rc_buf_thresh[] = {
>> > +     896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
>> > +     7744, 7872, 8000, 8064
>> > +};
>> > +EXPORT_SYMBOL(drm_dsc_rc_buf_thresh);
>>
>> This needs to be static, without exports.
>
> Exported this to let other drivers use it, while skipping the
> drm_dsc_set_rc_buf_thresh(). For example amdgpu driver sets buffer
> thresholds on the interim structure, so the helper is not directly
> applicable. See _do_calc_rc_params().

Regardless, I'm still saying don't do that.

Data is not an interface.

If you make it easy to just use the data, nobody will ever fix their
drivers to use proper interfaces, and you'll lock yourself to a
particular representation of the data even though it's supposed to be a
hidden implementation detail.


BR,
Jani.


>
>>
>> > +
>> > +/**
>> > + * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
>> > + * in accordance with the DSC 1.2 specification.
>> > + *
>> > + * @vdsc_cfg: DSC Configuration data partially filled by driver
>> > + */
>> > +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
>> > +{
>> > +     int i = 0;
>>
>> Unnecessary initialization.
>
> My bad.
>
>>
>> > +
>> > +     for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
>>
>> Please use ARRAY_SIZE(). Maybe add BUILD_BUG_ON() for DSC_NUM_BUF_RANGES
>> vs. ARRAY_SIZE(). (Yes, we should've used ARRAY_SIZE() in i915.)
>
> Ack
>
>>
>> > +             /*
>> > +              * six 0s are appended to the lsb of each threshold value
>> > +              * internally in h/w.
>> > +              * Only 8 bits are allowed for programming RcBufThreshold
>> > +              */
>> > +             vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
>> > +     }
>> > +
>> > +     /*
>> > +      * For 6bpp, RC Buffer threshold 12 and 13 need a different value
>> > +      * as per C Model
>> > +      */
>> > +     if (vdsc_cfg->bits_per_pixel == 6 << 4) {
>> > +             vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
>> > +             vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
>> > +     }
>> > +}
>> > +EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
>> > +
>> >  /**
>> >   * drm_dsc_compute_rc_parameters() - Write rate control
>> >   * parameters to the dsc configuration defined in
>> > diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> > index d080741fd0b3..b4faab4c8fb3 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> > @@ -36,12 +36,6 @@ enum COLUMN_INDEX_BPC {
>> >       MAX_COLUMN_INDEX
>> >  };
>> >
>> > -/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>> > -static const u16 rc_buf_thresh[] = {
>> > -     896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
>> > -     7744, 7872, 8000, 8064
>> > -};
>> > -
>> >  struct rc_parameters {
>> >       u16 initial_xmit_delay;
>> >       u8 first_line_bpg_offset;
>> > @@ -474,23 +468,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>> >       vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
>> >       vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
>> >
>> > -     for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
>> > -             /*
>> > -              * six 0s are appended to the lsb of each threshold value
>> > -              * internally in h/w.
>> > -              * Only 8 bits are allowed for programming RcBufThreshold
>> > -              */
>> > -             vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
>> > -     }
>> > -
>> > -     /*
>> > -      * For 6bpp, RC Buffer threshold 12 and 13 need a different value
>> > -      * as per C Model
>> > -      */
>> > -     if (compressed_bpp == 6) {
>> > -             vdsc_cfg->rc_buf_thresh[12] = 0x7C;
>> > -             vdsc_cfg->rc_buf_thresh[13] = 0x7D;
>> > -     }
>> > +     drm_dsc_set_rc_buf_thresh(vdsc_cfg);
>> >
>> >       /*
>> >        * From XE_LPD onwards we supports compression bpps in steps of 1
>> > diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> > index 8b41edbbabab..706ba1d34742 100644
>> > --- a/include/drm/display/drm_dsc_helper.h
>> > +++ b/include/drm/display/drm_dsc_helper.h
>> > @@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>> >  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>> >  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>> >                             const struct drm_dsc_config *dsc_cfg);
>> > +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>> >  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>> >
>> >  #endif /* _DRM_DSC_HELPER_H_ */
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
