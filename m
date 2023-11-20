Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8C7F135B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED91510E3BA;
	Mon, 20 Nov 2023 12:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56FA10E3BA;
 Mon, 20 Nov 2023 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700483503; x=1732019503;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s2Sz/k2C3vClA1ZL29UEioOfWz6nNPpISmlGVfUyBKk=;
 b=ePUesCDiQtz3drEpEWUiUrKGslgvS+KbM0CBrovg6+S1xkeZGGC1oAqd
 1ZDukBMtKgjXJZ0uCMT0Wg9LulYw6/fWTkrLweLGDPko/JpErOccAyHZM
 xqI5QjuLr2061PLaW7r5z1gOXnqT34SF5Ysj4zmwHDn5VAbjPJg6DigDN
 kqw35tpLLMrUtRR+0JZX5A3Uv7h/vTjXCQISYNSI/Bn1CSQHIMLcgzbKf
 XcM/kvBt6B29Lb2Tj6GwV1cfoudQxGgp3OiHhNC+5w1MKmi65Cpn4vZT3
 fomyQfR7VLcSxxpKVL1j9jfuriWD+cKrWJsgs58SC81WIAQDfL3MQ2GB1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="477817852"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="477817852"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 04:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="795453765"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="795453765"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 04:31:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 00/11] drm/i915: Fix UHBR data,link M/N/TU and PBN
 values
In-Reply-To: <20231116131841.1588781-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231116131841.1588781-1-imre.deak@intel.com>
Date: Mon, 20 Nov 2023 14:31:34 +0200
Message-ID: <87y1esobbt.fsf@intel.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arun R Murthy <arun.r.murthy@intel.com>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023, Imre Deak <imre.deak@intel.com> wrote:
> This is v2 of [1], with the following changes:
> - Store the pbn_div value in fixed point format.
> - Fix PBN calculation in patch 8.
> - Reuse intel_dp_max_data_rate(), intel_dp_effective_data_rate() in
>   intel_link_compute_m_n() (Jani).
>
> [1] https://lore.kernel.org/all/20231113201110.510724-1-imre.deak@intel.com
>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
>
> Imre Deak (11):
>   drm/dp_mst: Store the MST PBN divider value in fixed point format
>   drm/dp_mst: Fix PBN divider calculation for UHBR rates
>   drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()

Maarten, Maxime, Thomas, ack for merging these three via drm-intel-next?

Imre, I note that said patches were Cc: dri-devel, but for future
reference please Cc: the entire series to dri-devel when you include
dependencies that you plan to merge via drm-intel.

BR,
Jani.


>   drm/i915/dp: Replace intel_dp_is_uhbr_rate() with
>     drm_dp_is_uhbr_rate()
>   drm/i915/dp: Account for channel coding efficiency on UHBR links
>   drm/i915/dp: Fix UHBR link M/N values
>   drm/i915/dp_mst: Calculate the BW overhead in
>     intel_dp_mst_find_vcpi_slots_for_bpp()
>   drm/i915/dp_mst: Fix PBN / MTP_TU size calculation for UHBR rates
>   drm/i915/dp: Report a rounded-down value as the maximum data rate
>   drm/i915/dp: Simplify intel_dp_max_data_rate()
>   drm/i915/dp: Reuse intel_dp_{max,effective}_data_rate in
>     intel_link_compute_m_n()
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   5 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   3 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   5 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  31 +++-
>  drivers/gpu/drm/i915/display/intel_display.c  |  51 ++----
>  drivers/gpu/drm/i915/display/intel_dp.c       |  78 +++++++---
>  drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  55 +++++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   6 +-
>  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 145 ++++++++++++++++++
>  include/drm/display/drm_dp_helper.h           |  13 ++
>  include/drm/display/drm_dp_mst_helper.h       |   7 +-
>  12 files changed, 311 insertions(+), 93 deletions(-)

-- 
Jani Nikula, Intel
