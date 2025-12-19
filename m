Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A54CD00F3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0410E7A0;
	Fri, 19 Dec 2025 13:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VorQn3x/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BEB10E1D1;
 Fri, 19 Dec 2025 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766150916; x=1797686916;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AS3oWRmAkfcyoDBeSPoWEtvVnhzA59048XKplit7xg8=;
 b=VorQn3x/EYkAyHWWRgJoaCnzqK2sXGZAQOS7cRWk12qQxCVB1/14jBR+
 /rRAi+Wwc/hQbo8GzH2Soe7wmtC3wQFGIdN6+wYZ4+4ELYnW+abrLbnZo
 M3754TOifWsIOx8vFefUo9pSOhpZVio4vbbMuLAecaBJAlcKoP1squhO4
 UOg7lU8CCpijiEvgp5dvemXDttGPHhj8pJsYToPeOnDWCzUMmlNLtaUQw
 H94dpTSbS7ySvM3ngWO8VDzWBSOBp8E+eWSZHLLLCET/gpmAFO5ZpHedC
 VFNdZyTUzkMdZy+vW9TdIkDjT1HGlLDSLZGO0Iv6+PgneD844Xg3U1yVS w==;
X-CSE-ConnectionGUID: tnI/OxFoTuKB3IZB7megEA==
X-CSE-MsgGUID: D19DEMHbSwCzU9Rh/OvNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68185755"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68185755"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:28:36 -0800
X-CSE-ConnectionGUID: zuz2DXsHTo2WUkiGpokeSA==
X-CSE-MsgGUID: VjL+924hS4eIXrabfR6JZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203767018"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.49])
 ([10.245.245.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:28:33 -0800
Message-ID: <03c830d1-3495-4b7d-a333-f54925133c6e@linux.intel.com>
Date: Fri, 19 Dec 2025 14:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] drm/i915/dp: Clean up link BW/DSC slice config
 computation (fixes)
To: imre.deak@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@intel.com>
Cc: Ankit K Nautiyal <ankit.k.nautiyal@intel.com>,
 Luciano Coelho <luciano.coelho@intel.com>,
 Jouni Hogander <jouni.hogander@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20251215192357.172201-1-imre.deak@intel.com>
 <aUGW6XAOyXlhfy4H@ideak-desk> <aUPs5_Qc9k-7Jesu@ideak-desk>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <aUPs5_Qc9k-7Jesu@ideak-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Got no objections.

For patch 1+2:

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-12-18 kl. 13:00, skrev Imre Deak:
> Hi all,
> 
> On Tue, Dec 16, 2025 at 07:30:40PM +0200, Imre Deak wrote:
>> Hi Thomas, Maarten, Maxime,
>>
>> could you ack merging patch 1 and 2 in this patchset containing changes
>> in drm_dp_helper.c via the Intel trees?
> 
> any objections to merge patch 1 and 2 via drm-intel? If not, could
> someone ack it?
> 
> Thanks,
> Imre
> 
>> They fix an issue in the i915/xe drivers' DP DSC slice-count handling
>> and do not affect other drivers.
>>
>> Thanks,
>> Imre
>>
>> On Mon, Dec 15, 2025 at 09:23:40PM +0200, Imre Deak wrote:
>>> This is the first part of patchset [1] containing only the fixes for the
>>> link BW and DSC slice computation. The remaining patches in [1] refactor
>>> the link BW and DSC slice computation simplifying these, to be sent as a
>>> follow-up to this patchset.
>>>
>>> I moved patches 13-15 in [1] later in the patchset to be sent as part of
>>> the follow-up, as these patches are not a dependency for the fixes in
>>> this patchset.
>>>
>>> [1] https://lore.kernel.org/all/20251127175023.1522538-1-imre.deak@intel.com
>>>
>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> Cc: Luca Coelho <luciano.coelho@intel.com>
>>> Cc: Jouni Högander <jouni.hogander@intel.com>
>>> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
>>>
>>> Imre Deak (16):
>>>   drm/dp: Parse all DSC slice count caps for eDP 1.5
>>>   drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
>>>   drm/i915/dp: Fix DSC sink's slice count capability check
>>>   drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
>>>   drm/i915/dp: Use a mode's crtc_clock vs. clock during state
>>>     computation
>>>   drm/i915/dp: Factor out intel_dp_link_bw_overhead()
>>>   drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
>>>   drm/i915/dp: Use the effective data rate for DP BW calculation
>>>   drm/i915/dp: Use the effective data rate for DP compressed BW
>>>     calculation
>>>   drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST
>>>     stream BW
>>>   drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream
>>>     BW
>>>   drm/i915/dp: Account with pipe joiner max compressed BPP limit for
>>>     DP-MST and eDP
>>>   drm/i915/dp: Fail state computation for invalid min/max link BPP
>>>     values
>>>   drm/i915/dp: Fail state computation for invalid max throughput BPP
>>>     value
>>>   drm/i915/dp: Fail state computation for invalid max sink compressed
>>>     BPP value
>>>   drm/i915/dp: Fail state computation for invalid DSC source input BPP
>>>     values
>>>
>>>  drivers/gpu/drm/display/drm_dp_helper.c       | 103 ++++++---
>>>  drivers/gpu/drm/i915/display/intel_dp.c       | 211 ++++++++++++------
>>>  drivers/gpu/drm/i915/display/intel_dp.h       |   9 +-
>>>  .../drm/i915/display/intel_dp_link_training.c |   4 +-
>>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  33 ++-
>>>  include/drm/display/drm_dp_helper.h           |   3 +
>>>  6 files changed, 234 insertions(+), 129 deletions(-)
>>>
>>> -- 
>>> 2.49.1
>>>

