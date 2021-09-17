Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150040F85A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFED6EC73;
	Fri, 17 Sep 2021 12:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEA56EC73;
 Fri, 17 Sep 2021 12:51:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286475861"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="286475861"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:51:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="546361699"
Received: from unknown (HELO localhost) ([10.251.216.224])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:51:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>, "Saarinen\,
 Jani" <jani.saarinen@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 00/13] drm/hdcp: Pull HDCP
 auth/exchange/check into helpers
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210915203834.1439-1-sean@poorly.run>
Date: Fri, 17 Sep 2021 15:51:15 +0300
Message-ID: <87pmt7uzzw.fsf@intel.com>
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

On Wed, 15 Sep 2021, Sean Paul <sean@poorly.run> wrote:
> From: Sean Paul <seanpaul@chromium.org>
>
> Hello again,
> This is the second version of the HDCP helper patchset. See version 1
> here: https://patchwork.freedesktop.org/series/94623/
>
> In this second version, I've fixed up the oopsies exposed by 0-day and
> yamllint and incorporated early review feedback from the dt/dts reviews.
>
> Please take a look,

I'll try to ping folks to get someone to review the i915 parts, but the
general idea of moving common HDCP code from i915 to drm is, I hope
obviously,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Sean
>
> Sean Paul (13):
>   drm/hdcp: Add drm_hdcp_atomic_check()
>   drm/hdcp: Avoid changing crtc state in hdcp atomic check
>   drm/hdcp: Update property value on content type and user changes
>   drm/hdcp: Expand HDCP helper library for enable/disable/check
>   drm/i915/hdcp: Consolidate HDCP setup/state cache
>   drm/i915/hdcp: Retain hdcp_capable return codes
>   drm/i915/hdcp: Use HDCP helpers for i915
>   drm/msm/dpu_kms: Re-order dpu includes
>   drm/msm/dpu: Remove useless checks in dpu_encoder
>   drm/msm/dpu: Remove encoder->enable() hack
>   drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
>   dt-bindings: msm/dp: Add bindings for HDCP registers
>   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
>
>  .../bindings/display/msm/dp-controller.yaml   |    7 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |    4 +-
>  drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
>  .../drm/i915/display/intel_display_types.h    |   58 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   35 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
>  drivers/gpu/drm/msm/Makefile                  |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
>  drivers/gpu/drm/msm/dp/dp_debug.c             |   49 +-
>  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |   47 +-
>  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
>  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  433 ++++++
>  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |   22 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
>  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
>  include/drm/drm_hdcp.h                        |  194 +++
>  30 files changed, 2561 insertions(+), 1389 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Jani Nikula, Intel Open Source Graphics Center
