Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F46B0766
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291E210E674;
	Wed,  8 Mar 2023 12:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D46410E5D8;
 Wed,  8 Mar 2023 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678279634; x=1709815634;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KOQ3EIRyeOz73H2k2pXOZ69mXfTnkaJuS8xZ8IBgDoc=;
 b=nXiAeffK6UwCA99m+liXnbXjpMAnR5wn5jB7Aw3otaeqKW5EkBfBLUgM
 Jh6FSHidRFtZ23er1D/N8blYADb8Xjk96qRKozZmEn7GHU2A00rGiTjrH
 Ik6uFngukLPwYz/r9/VpjWFxqzBSUVM1vJvFuh70HdSw0Dzf8lmGSTvu7
 TweFFTpWDUCKM2+aTMslm7g9I5IV/xeR1j9dnwxTVw3ASSlCalPNfS0Q8
 sBx2UDM9NKV+qdxBzdmJOTnbVlwM23uLGsej3RoVRSm2Q0F/UorAxfqWQ
 I4fmfE5401qCLli5olio6W9WR/GZV8c7AiJAr7q6XnvoVMiCHRjWs4vRf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337660557"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="337660557"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765981826"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="765981826"
Received: from eharan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.177])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:47:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Suraj Kandpal
 <suraj.kandpal@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
In-Reply-To: <6bd9b493-01da-0542-2a21-10602dba6a1a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
 <6bd9b493-01da-0542-2a21-10602dba6a1a@linaro.org>
Date: Wed, 08 Mar 2023 14:47:08 +0200
Message-ID: <87r0tzbeb7.fsf@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Mar 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On 08/03/2023 13:30, Jani Nikula wrote:
>> On Wed, 22 Feb 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>>> This patch series aims to enable the YCbCr420 format
>>> for DSC. Changes are mostly compute params related for
>>> hdmi,dp and dsi along with the addition of new rc_tables
>>> for native_420 and corresponding changes to macros used to
>>> fetch them.
>>> There have been discussions prior to this series in which some patches
>>> have gotten rb and can be found in the below link
>>> https://patchwork.freedesktop.org/series/113729
>> 
>> I think it would be useful to get [1] from Dmitry merged to
>> drm-misc-next first, have that in drm-next, and again backmerged to
>> drm-intel-next before this. At least patches 1-5.
>> 
>> There's not much point in all drivers duplicating the parameters, and we
>> need to move towards common code. Dmitry has been helpful in
>> contributing this to us.
>
> Note, while I slightly reworked the calculate_rc_params() function, I 
> did not touch the intel_qp_tables (mostly since we do not need them for 
> drm/msm (at least for now). Our current plan is to use fixed params (at 
> least in the short notice). We might have to reconsider it at some point.

Yeah, this isn't a big conflict, but AFAICT it'll conflict in
intel_vdsc.c.

> However it might be wise to merge them with amdgpu's qp tables. amdgpu 
> driver also contains code to calculate RC params. It might be worth 
> moving RC calculation to the common helper.

Agreed.

BR,
Jani.


>
>> 
>> BR,
>> Jani.
>> 
>> 
>> [1] https://patchwork.freedesktop.org/series/114473/
>> 
>>>
>>> Ankit Nautiyal (2):
>>>    drm/dp_helper: Add helper to check DSC support with given o/p format
>>>    drm/i915/dp: Check if DSC supports the given output_format
>>>
>>> Suraj Kandpal (4):
>>>    drm/i915: Adding the new registers for DSC
>>>    drm/i915: Enable YCbCr420 for VDSC
>>>    drm/i915/display: Fill in native_420 field
>>>    drm/i915/vdsc: Check slice design requirement
>>>
>>> Swati Sharma (1):
>>>    drm/i915/dsc: Add debugfs entry to validate DSC output formats
>>>
>>>   drivers/gpu/drm/i915/display/icl_dsi.c        |   2 -
>>>   .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
>>>   .../drm/i915/display/intel_crtc_state_dump.h  |   2 +
>>>   .../drm/i915/display/intel_display_debugfs.c  |  78 ++++++++
>>>   .../drm/i915/display/intel_display_types.h    |   1 +
>>>   drivers/gpu/drm/i915/display/intel_dp.c       |  39 +++-
>>>   .../gpu/drm/i915/display/intel_qp_tables.c    | 187 ++++++++++++++++--
>>>   .../gpu/drm/i915/display/intel_qp_tables.h    |   4 +-
>>>   drivers/gpu/drm/i915/display/intel_vdsc.c     | 108 +++++++++-
>>>   drivers/gpu/drm/i915/i915_reg.h               |  28 +++
>>>   include/drm/display/drm_dp_helper.h           |  13 ++
>>>   11 files changed, 442 insertions(+), 24 deletions(-)
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
