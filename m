Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244670B90A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F7610E296;
	Mon, 22 May 2023 09:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B433710E1AC;
 Mon, 22 May 2023 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684748141; x=1716284141;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2yLoCurvsm+Am4n+8Po4obmzXAOhFU5SVLIQzAYdKM4=;
 b=SNUFdyVLY+4k7vkrE88JAB1BWapY3IhM84G7+s3RBPP4VK7BS3jMZ9/9
 nAyPeHuprNdQWlqQ8045ktrx0M4yAc4Un+r2Z/3lpVFXs4h4zNrCzd5K1
 wLVy/wbWFZaQ9arYgB+Y0mg6Wvw+6XNeewDHcssQA0Dq4hqFKajgWxzrT
 lI/q2wKIXJksxKhSJSo9YVW6K4mCqNYET5WQSyV4RmQDtHBXcPUDeP33l
 urvDB9IE4TyZzBdRUgIMT6s/RTLy60TqChHXhepdPnkfyTprrluh/sf8p
 +qxU5DH8MvzAZ2QXpi2O/wt7x8dT2C5K8d5y39osDlvR71pC77FF4meZE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="351722754"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="351722754"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="734201147"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="734201147"
Received: from andreipo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:35:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v12 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
Date: Mon, 22 May 2023 12:35:33 +0300
Message-ID: <87a5xwogii.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 May 2023, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/display/drm_dsc_helper.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index e0cbc38ada26..7bf7e8ff8eb4 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -9,6 +9,7 @@
>  #define DRM_DSC_HELPER_H_
>  
>  #include <drm/display/drm_dsc.h>
> +#include <linux/bug.h>

Seems like a small thing, adding static inlines in headers usually leads
to more header dependencies like this, and gradually slows down build.

Does it need to be a static inline?

BR,
Jani.

>  
>  enum drm_dsc_params_type {
>  	DRM_DSC_1_2_444,
> @@ -26,6 +27,12 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *dsc)
> +{
> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> +	return dsc->bits_per_pixel >> 4;
> +}
> +
>  static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
>  {
>  	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);

-- 
Jani Nikula, Intel Open Source Graphics Center
