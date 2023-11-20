Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4357F1480
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 14:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E3110E3D0;
	Mon, 20 Nov 2023 13:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9EA10E3D0;
 Mon, 20 Nov 2023 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700487412; x=1732023412;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5Nj6A7JaMqkez41JQurpahw8WA7RQy+4C1fhYDHEVwA=;
 b=RCv8xx73D42lh/VpR2IKi4v7DQNd701BrDBwqVhm8E5ego9tZNbi3KZl
 ljy1eyoRvUAApwBJmj+Pe0+v5AngU+hHB1vf1B8CoKEuCm8Lt68f2N9ky
 xa+EoXn0FirRLLaPi83zqhes9Ysu4Wy4CB3DDl5ZjYjOIxQx5SYoeT7Rh
 e6NGXRgCI8NBXNLhbwrQ0FsYeb1SAH6UPvNPBIM491wpTNFs3SBPbj7i4
 8elnYr+oQrbC6fbYiKB/WD6cGm4aSjlwd7Bsd3MOyfyRJjXUvK3q/c6f0
 WthBSsMMWgbzweS0ZG9yxcb+QDLNEg0acW8ax7Wefb/spm0c00+AN7XBZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394468691"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="394468691"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 05:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759789415"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="759789415"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.194])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 05:36:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com
Subject: Re: [PATCH v2 00/11] drm/i915: Fix UHBR data,link M/N/TU and PBN
 values
In-Reply-To: <ZVta2eJBqGMRVX6g@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231116131841.1588781-1-imre.deak@intel.com>
 <87y1esobbt.fsf@intel.com> <ZVta2eJBqGMRVX6g@ideak-desk.fi.intel.com>
Date: Mon, 20 Nov 2023 15:36:45 +0200
Message-ID: <87msv8o8b6.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arun R Murthy <arun.r.murthy@intel.com>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Nov 2023, Imre Deak <imre.deak@intel.com> wrote:
> On Mon, Nov 20, 2023 at 02:31:34PM +0200, Jani Nikula wrote:
>> On Thu, 16 Nov 2023, Imre Deak <imre.deak@intel.com> wrote:
>> > This is v2 of [1], with the following changes:
>> > - Store the pbn_div value in fixed point format.
>> > - Fix PBN calculation in patch 8.
>> > - Reuse intel_dp_max_data_rate(), intel_dp_effective_data_rate() in
>> >   intel_link_compute_m_n() (Jani).
>> >
>> > [1] https://lore.kernel.org/all/20231113201110.510724-1-imre.deak@intel.com
>> >
>> > Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> > Cc: Lyude Paul <lyude@redhat.com>
>> >
>> > Imre Deak (11):
>> >   drm/dp_mst: Store the MST PBN divider value in fixed point format
>> >   drm/dp_mst: Fix PBN divider calculation for UHBR rates
>> >   drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()
>> 
>> Maarten, Maxime, Thomas, ack for merging these three via drm-intel-next?
>> 
>> Imre, I note that said patches were Cc: dri-devel, but for future
>> reference please Cc: the entire series to dri-devel when you include
>> dependencies that you plan to merge via drm-intel.
>
> Ok. I assumed the alternative to merge the 3 patches via drm-misc-next,
> wait for that to get merged back to i915 and then merge the rest to i915
> was still a preferred way; wondering now if in general this is better to
> avoid merge conflicts similar to the one reported now wrt. 
>   "drm/dp_mst: Fix fractional DSC bpp handling".
>
> In any case yes, I can CC dri-devel the whole patchset whenever there
> are any drm changes in it. While still wondering about the ideal
> approach above, I'd still prefer if the 3 drm patches in this one could
> also get merged via the i915 tree.

There are no rigid rules for this.

But it's clearly more problematic when the patches touch not just drm +
one driver, but drm + several drivers. Perhaps that's an indication they
should be merged via drm-misc-next instead of a driver tree.

Also, we probably need to clear up the existing conflicts before adding
more patches in the area to drm-intel-next.

BR,
Jani.


>
> --Imre
>
>> BR,
>> Jani.
>> 
>> 
>> >   drm/i915/dp: Replace intel_dp_is_uhbr_rate() with
>> >     drm_dp_is_uhbr_rate()
>> >   drm/i915/dp: Account for channel coding efficiency on UHBR links
>> >   drm/i915/dp: Fix UHBR link M/N values
>> >   drm/i915/dp_mst: Calculate the BW overhead in
>> >     intel_dp_mst_find_vcpi_slots_for_bpp()
>> >   drm/i915/dp_mst: Fix PBN / MTP_TU size calculation for UHBR rates
>> >   drm/i915/dp: Report a rounded-down value as the maximum data rate
>> >   drm/i915/dp: Simplify intel_dp_max_data_rate()
>> >   drm/i915/dp: Reuse intel_dp_{max,effective}_data_rate in
>> >     intel_link_compute_m_n()
>> >
>> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   5 +-
>> >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   3 +-
>> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   5 +-
>> >  drivers/gpu/drm/display/drm_dp_mst_topology.c |  31 +++-
>> >  drivers/gpu/drm/i915/display/intel_display.c  |  51 ++----
>> >  drivers/gpu/drm/i915/display/intel_dp.c       |  78 +++++++---
>> >  drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
>> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  55 +++++--
>> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   6 +-
>> >  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 145 ++++++++++++++++++
>> >  include/drm/display/drm_dp_helper.h           |  13 ++
>> >  include/drm/display/drm_dp_mst_helper.h       |   7 +-
>> >  12 files changed, 311 insertions(+), 93 deletions(-)
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
