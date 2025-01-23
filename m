Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A6A1A19D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 11:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B17B10E7D7;
	Thu, 23 Jan 2025 10:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLhjLF+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBCD10E7C4;
 Thu, 23 Jan 2025 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737627171; x=1769163171;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eJuT2i1OQ/n/dl6VjfKxG9lcaZkbxzsrBgcEVMBaYbU=;
 b=XLhjLF+rlWxKwwHFV6PKiU4UaotLl7xxf8K9OBTYldIJSpkr62Gh05Hg
 y5QBSBNCIfY7JnoOaQE9VWBBZY+I0d3sO04pY70kdEyeo/Yw4SzaOnr8o
 TOObqSTka3g3rqrz7jOy4FwY3h3iM8ut1KO586enrJWogkeK0LitfwPF7
 Ww1R4mnLXi7d8H/3R56Bc1OPjVWet19l5nWOiQginF9xO1VWYzjQNbZln
 W5tsIHxKHdKHA3tH22cBJ8y6AqNMah9G4d3o6AswdIL9utiJUe/GSXx/O
 CGy85WPSBfhnscukcVmjgV03C6EVQxEXEeEeGE6TflxWCoyzD3jbePKTG Q==;
X-CSE-ConnectionGUID: rq4M4+gbTluPsf3tUFci+w==
X-CSE-MsgGUID: 2Qm0N2JITxisTFyTQw9R1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49512213"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49512213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:12:50 -0800
X-CSE-ConnectionGUID: twj7RcuZRLWVJdo7S3/DrA==
X-CSE-MsgGUID: t5iE9bT0RVWsz75r397Oyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111432042"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:12:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
In-Reply-To: <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
Date: Thu, 23 Jan 2025 12:12:43 +0200
Message-ID: <87r04tn8is.fsf@intel.com>
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

On Thu, 23 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
>> Existing DPCD access functions return an error code or the number of
>> bytes being read / write in case of partial access. However a lot of
>> drivers either (incorrectly) ignore partial access or mishandle error
>> codes. In other cases this results in a boilerplate code which compares
>> returned value with the size.
>> 
>> As suggested by Jani implement new set of DPCD access helpers, which
>> ignore partial access, always return 0 or an error code. Reimplement
>> existing helpers using the new functions to ensure backwards
>> compatibility.
>> 
>> This series targets only the DRM helpers code. If the approach is found
>> to be acceptable, each of the drivers should be converted on its own.
>
> Gracious ping for the series, it's been posted a week ago.

It's a bit of a bummer the names become longer. I don't have a better
suggestion, though.

I do like it that the error handling becomes easier and more uniform
overall, and this actually fixes many places that only checked for < 0
with the old functions.

I glanced through the series, I didn't spot anything obviously wrong,
but didn't do a thorough review either. I can do once we have wider
buy-in for the idea in general, so the effort won't be wasted.

For now,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
>> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Dmitry Baryshkov (7):
>>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
>>       drm/display: dp: implement new access helpers
>>       drm/display: dp: use new DCPD access helpers
>>       drm/display: dp-aux-dev: use new DCPD access helpers
>>       drm/display: dp-cec: use new DCPD access helpers
>>       drm/display: dp-mst-topology: use new DCPD access helpers
>>       drm/display: dp-tunnel: use new DCPD access helpers
>> 
>>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
>>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
>>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
>>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
>>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
>>  include/drm/display/drm_dp_helper.h           |  81 +++++-
>>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
>>  9 files changed, 354 insertions(+), 345 deletions(-)
>> ---
>> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
>> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
>> 
>> Best regards,
>> -- 
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> 

-- 
Jani Nikula, Intel
