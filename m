Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B9A43D9A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8082A10E646;
	Tue, 25 Feb 2025 11:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJ9kvOky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702D110E643;
 Tue, 25 Feb 2025 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740482973; x=1772018973;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NKedsfUkieXfxiUN7z3yWpWCUJzwcsbZVYDJyCoU/r4=;
 b=aJ9kvOkya8DhuPu6V5i0XokyNv6Eh1SSrJ1Qfj/UKSPd6cMPP1MTk+C3
 I5v6tP07wVR1CDihLGE23DcIa7ZNb5YAYbTaCoPxTXwkoLpHpB278UHqM
 9xCm6uaKxpk6GXZNTAJcp8CaHElGeQyBAPDxaslHWD1DiTZDJbGNm9vXp
 BAd5ruAWAys0FRPw13CrPdYz/06KF6rfKvdqpLQ8PDe2SgbEZbx4qJhQC
 jvILuvitbJtmVnSiObGFFOK8lYsMt63sZOlYIzf3v2js+glITqLg8BHpd
 Md9eyWz9iOJggEZl3jtkKKCl3sK2M547+ScNig6ig7UHOSAp9yuaudvBD Q==;
X-CSE-ConnectionGUID: USYKg57VTwC4PipRckFNRw==
X-CSE-MsgGUID: J3AFTp8dTtSGAVVs8EypOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41198781"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41198781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 03:29:32 -0800
X-CSE-ConnectionGUID: /fXmTyiFQkG/6ivPziotjA==
X-CSE-MsgGUID: i7XrO8h1R2mz9UkjF/+iig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121615259"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 03:29:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling
 and add support to msm driver
In-Reply-To: <frsbcvxcvtp45mh45cld3rzbgl52gomzmzs73crv53pwbc4fns@sygnt6z2avht>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
 <frsbcvxcvtp45mh45cld3rzbgl52gomzmzs73crv53pwbc4fns@sygnt6z2avht>
Date: Tue, 25 Feb 2025 13:29:20 +0200
Message-ID: <87o6yq5kkv.fsf@intel.com>
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

On Fri, 21 Feb 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, Feb 03, 2025 at 12:57:55PM +0200, Abel Vesa wrote:
>> Looking at both i915 and nouveau DP drivers, both are setting the first
>> LTTPR (if found) in transparent mode first and then in non-transparent
>> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
>> 
>> Being part of the standard, setting the LTTPR in a specific operation mode
>> can be easily moved in the generic framework. So do that by adding a new
>> helper.
>> 
>> Then, the msm DP driver is lacking any kind of support for LTTPR handling,
>> so add it by reading the LTTPR caps for figuring out the number of LTTPRs
>> found on plug detect and then do exactly what the i915 and nouveau drivers
>> do with respect to toggling through operating modes, just like the
>> up-mentioned section from DP spec describes.
>> 
>> At some point, link training per sub-segment will probably be needed, but
>> for now, toggling the operating modes seems to be enough at least for the
>> X Elite-based platforms that this patchset has been tested on.
>> 
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>
> [...]
>> 
>> ---
>> Abel Vesa (4):
>>       drm/dp: Add helper to set LTTPRs in transparent mode
>>       drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
>>       drm/i915/dp: Use the generic helper to control LTTPR transparent mode
>
> Lyude, Jani, what would be your preferred way of merging these patches?
> Would you ack merging of those through drm-misc or would you prefer for
> the first patch only to be landed to drm-misc, which you can then pull
> into nouveau and i915 trees.

Either way is fine with me, up to you. But please try to ensure these
get into drm-misc-next pull request by this cycle, so we can backmerge
and catch up sooner rather than later.

Acked-by: Jani Nikula <jani.nikula@intel.com>



>
>>       drm/msm/dp: Add support for LTTPR handling
>> 
>>  drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
>>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
>>  drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++++
>>  drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
>>  include/drm/display/drm_dp_helper.h                |  2 +
>>  5 files changed, 85 insertions(+), 34 deletions(-)
>> ---
>> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
>> change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
>> 
>> Best regards,
>> -- 
>> Abel Vesa <abel.vesa@linaro.org>
>> 

-- 
Jani Nikula, Intel
