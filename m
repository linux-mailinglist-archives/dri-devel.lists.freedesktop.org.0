Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0276B05FE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E510E66F;
	Wed,  8 Mar 2023 11:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56E10E670;
 Wed,  8 Mar 2023 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678275035; x=1709811035;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y97KwLScUJ6690tuj6eR6vLQ8d+gIriIl7c10zBRTfM=;
 b=ChQIveDjalK2tO+9WOQv6hzH9LsodmAn1rJ3QWE5MpW/rcABGYVkH4YM
 eKp+UH7VrefSuDqA3EE0mV68bsvuUZ8oA+OKu0SmJUpnOic9BTf11zXDP
 dycTBmRv5tsvYq/z0juI9GuPEAHLrCJp3prkJpXofIOF/878UM9oMKo5j
 0bR/p4Iid6RYr1X4UxtdVVPSFUGrkppdPLvJRytR6jmTLPrZa6Z9ABhMb
 XWTSo4wH+FAgZGHIk4d4AT1+mYev6g3BkDPjoovHSaDqh5sCZBZjF7O/j
 2nKEf1978L1N15mr+XfEhdB76WEwaye6AWjjS3DkOUiEDifpkk2quRjdl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319960872"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="319960872"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800719459"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="800719459"
Received: from eharan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.177])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:30:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
In-Reply-To: <20230222053153.3658345-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
Date: Wed, 08 Mar 2023 13:30:28 +0200
Message-ID: <87ttyvbhuz.fsf@intel.com>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ankit.k.nautiyal@intel.com,
 uma.shankar@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Feb 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> This patch series aims to enable the YCbCr420 format
> for DSC. Changes are mostly compute params related for
> hdmi,dp and dsi along with the addition of new rc_tables
> for native_420 and corresponding changes to macros used to
> fetch them.
> There have been discussions prior to this series in which some patches
> have gotten rb and can be found in the below link
> https://patchwork.freedesktop.org/series/113729

I think it would be useful to get [1] from Dmitry merged to
drm-misc-next first, have that in drm-next, and again backmerged to
drm-intel-next before this. At least patches 1-5.

There's not much point in all drivers duplicating the parameters, and we
need to move towards common code. Dmitry has been helpful in
contributing this to us.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/114473/

>
> Ankit Nautiyal (2):
>   drm/dp_helper: Add helper to check DSC support with given o/p format
>   drm/i915/dp: Check if DSC supports the given output_format
>
> Suraj Kandpal (4):
>   drm/i915: Adding the new registers for DSC
>   drm/i915: Enable YCbCr420 for VDSC
>   drm/i915/display: Fill in native_420 field
>   drm/i915/vdsc: Check slice design requirement
>
> Swati Sharma (1):
>   drm/i915/dsc: Add debugfs entry to validate DSC output formats
>
>  drivers/gpu/drm/i915/display/icl_dsi.c        |   2 -
>  .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
>  .../drm/i915/display/intel_crtc_state_dump.h  |   2 +
>  .../drm/i915/display/intel_display_debugfs.c  |  78 ++++++++
>  .../drm/i915/display/intel_display_types.h    |   1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       |  39 +++-
>  .../gpu/drm/i915/display/intel_qp_tables.c    | 187 ++++++++++++++++--
>  .../gpu/drm/i915/display/intel_qp_tables.h    |   4 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c     | 108 +++++++++-
>  drivers/gpu/drm/i915/i915_reg.h               |  28 +++
>  include/drm/display/drm_dp_helper.h           |  13 ++
>  11 files changed, 442 insertions(+), 24 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
