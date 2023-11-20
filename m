Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF17F13F2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 14:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D3B10E244;
	Mon, 20 Nov 2023 13:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D2810E070;
 Mon, 20 Nov 2023 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700485852; x=1732021852;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Zy40wqUoBRP6sTePg19jD80thnLUbSvAaxVsDZMP7Ac=;
 b=DUxGO58wo1RL5z/IgxBKeHiqXMAqgVoBw3K4X5JDqw3KbJ6p+uJ4CNfs
 mHjY+Pu0K74lMXK9WdIJG+S7BczXbKee8Pw9YWu/JyGwQPwAUn0BRHGiZ
 /ge7rkDQq7dXWjSC1BpbzJDmMwvw+QWWWNwS5RixgjRXGFbtqtoElk37H
 2R0v/aYb8GT0Otw7apLjnapNuj7SeRMVk05oKjMDUpIe3bLSmIf1nBCc9
 Ms11YZalNIaNX5RFrH5uguvP/XXUC/ixSGeTPYAoc9Qvq93UuJtXYl8GQ
 J6Wa/KIr8+FjY9Y3o20e/+f6FYIJ+SOQ+D8nnCDpTEL/ohwLlOp19eoaC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="395542474"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="395542474"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 05:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="883848848"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="883848848"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 05:10:48 -0800
Date: Mon, 20 Nov 2023 15:10:49 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 00/11] drm/i915: Fix UHBR data,link M/N/TU and PBN
 values
Message-ID: <ZVta2eJBqGMRVX6g@ideak-desk.fi.intel.com>
References: <20231116131841.1588781-1-imre.deak@intel.com>
 <87y1esobbt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1esobbt.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arun R Murthy <arun.r.murthy@intel.com>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 02:31:34PM +0200, Jani Nikula wrote:
> On Thu, 16 Nov 2023, Imre Deak <imre.deak@intel.com> wrote:
> > This is v2 of [1], with the following changes:
> > - Store the pbn_div value in fixed point format.
> > - Fix PBN calculation in patch 8.
> > - Reuse intel_dp_max_data_rate(), intel_dp_effective_data_rate() in
> >   intel_link_compute_m_n() (Jani).
> >
> > [1] https://lore.kernel.org/all/20231113201110.510724-1-imre.deak@intel.com
> >
> > Cc: Arun R Murthy <arun.r.murthy@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> >
> > Imre Deak (11):
> >   drm/dp_mst: Store the MST PBN divider value in fixed point format
> >   drm/dp_mst: Fix PBN divider calculation for UHBR rates
> >   drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()
> 
> Maarten, Maxime, Thomas, ack for merging these three via drm-intel-next?
> 
> Imre, I note that said patches were Cc: dri-devel, but for future
> reference please Cc: the entire series to dri-devel when you include
> dependencies that you plan to merge via drm-intel.

Ok. I assumed the alternative to merge the 3 patches via drm-misc-next,
wait for that to get merged back to i915 and then merge the rest to i915
was still a preferred way; wondering now if in general this is better to
avoid merge conflicts similar to the one reported now wrt. 
  "drm/dp_mst: Fix fractional DSC bpp handling".

In any case yes, I can CC dri-devel the whole patchset whenever there
are any drm changes in it. While still wondering about the ideal
approach above, I'd still prefer if the 3 drm patches in this one could
also get merged via the i915 tree.

--Imre

> BR,
> Jani.
> 
> 
> >   drm/i915/dp: Replace intel_dp_is_uhbr_rate() with
> >     drm_dp_is_uhbr_rate()
> >   drm/i915/dp: Account for channel coding efficiency on UHBR links
> >   drm/i915/dp: Fix UHBR link M/N values
> >   drm/i915/dp_mst: Calculate the BW overhead in
> >     intel_dp_mst_find_vcpi_slots_for_bpp()
> >   drm/i915/dp_mst: Fix PBN / MTP_TU size calculation for UHBR rates
> >   drm/i915/dp: Report a rounded-down value as the maximum data rate
> >   drm/i915/dp: Simplify intel_dp_max_data_rate()
> >   drm/i915/dp: Reuse intel_dp_{max,effective}_data_rate in
> >     intel_link_compute_m_n()
> >
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   5 +-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   3 +-
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   5 +-
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c |  31 +++-
> >  drivers/gpu/drm/i915/display/intel_display.c  |  51 ++----
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  78 +++++++---
> >  drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  55 +++++--
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   6 +-
> >  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 145 ++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h           |  13 ++
> >  include/drm/display/drm_dp_mst_helper.h       |   7 +-
> >  12 files changed, 311 insertions(+), 93 deletions(-)
> 
> -- 
> Jani Nikula, Intel
