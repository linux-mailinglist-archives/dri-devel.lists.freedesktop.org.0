Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283047027F9
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612810E187;
	Mon, 15 May 2023 09:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F48F10E178;
 Mon, 15 May 2023 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684141930; x=1715677930;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dhM3m8vOuQXUzo4VYwSqzWC32+ahxslyhibsQL5kqac=;
 b=L2oK9Q6L+lt8y5MVhAryQsO0ILS63BSwuBIWwPw3boCsd9pbx3aqYwrt
 9c1GbHcSXELiONd6WfaqKLcmQ23JIXtNj5P+gA0OPaRFvvBJ8rb42686Y
 sN3/fPHxWkMp4KtARX9rlBlRUNdixQjIkurCn1o1Z2sq6jPSC4NC+V8SW
 2tjaEGIDW4RZtV3IDSqs0DajUPKx8c2Sqw5khkixiEyl8KrB43+SUazRR
 nSJ01Aaq83NONJTBz6fPQsj8sGti+ZWMq5MchcBMXn7tefwCBE0mHAIQT
 wSU/QtoTNOKaIG3BOYk+hjvl7iUGDOVum8gh+q8a8Y/S4vpePsgTdWBNM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="437489750"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="437489750"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="812870323"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="812870323"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.56])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:12:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v5 0/8] drm/i915: move DSC RC tables to drm_dsc_helper.c
In-Reply-To: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
Date: Mon, 15 May 2023 12:12:02 +0300
Message-ID: <871qjij6vx.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 May 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Other platforms (msm) will benefit from sharing the DSC config setup
> functions. This series moves parts of static DSC config data from the
> i915 driver to the common helpers to be used by other drivers.
>
> Note: the RC parameters were cross-checked against config files found in
> DSC model 2021062, 20161212 (and 20150914). The first patch modifies
> tables according to those config files, while preserving parameter
> values using the code. I have not changed one of the values in the
> pre-SCR config file as it clearly looks like a typo in the config file,
> considering the table E in DSC 1.1 and in the DSC 1.1 SCR.

As I believe I've said before, I think it's fine to merge these either
via drm-intel or drm-misc. Which do you prefer?

BR,
Jani.



>
> Chances since v4:
> - Rebased on top of drm-intel-next
> - Cut the first 8 patches of the series to ease merging. The rest of the
>   patches will go afterwards.
>
> Chances since v3:
> - Rebased on top of drm-intel-next
> - Dropped the msm patch to make patchset fully mergeable through
>   drm-intel
> - Made drm_dsc_set_const_params() ignore rc_model_size, picked up
>   drm_dsc_set_initial_scale_value() patch by Jessica and switched
>   intel_vdsc.c to use those two helpers.
> - Added a patch to make i915 actually use rc_tgt_offset_high,
>   rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.
>
> Chances since v2:
> - Rebased on top of drm-intel-next
>
> Chances since v1:
> - Made drm_dsc_rc_buf_thresh static rather than exporting it
> - Switched drm_dsc_rc_buf_thresh loop to use ARRAY_SIZE. Added
>   BUILD_BUG_ON's to be sure that array sizes are correct
> - Fixed rc_parameters_data indentation to be logical and tidy
> - Fixed drm_dsc_setup_rc_params() kerneldoc
> - Added a clause to drm_dsc_setup_rc_params() to verify bpp and bpc
>   being set.
> - Fixed range_bpg_offset programming in calculate_rc_params()
> - Fixed bpp vs bpc bug in intel_dsc_compute_params()
> - Added FIXME comment next to the customizations in
>   intel_dsc_compute_params().
>
> Dmitry Baryshkov (8):
>   drm/i915/dsc: change DSC param tables to follow the DSC model
>   drm/i915/dsc: move rc_buf_thresh values to common helper
>   drm/i915/dsc: move DSC tables to DRM DSC helper
>   drm/i915/dsc: stop using interim structure for calculated params
>   drm/display/dsc: use flat array for rc_parameters lookup
>   drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
>   drm/display/dsc: include the rest of pre-SCR parameters
>   drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
>
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 986 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 443 ++--------
>  include/drm/display/drm_dsc_helper.h      |   9 +
>  3 files changed, 1042 insertions(+), 396 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
