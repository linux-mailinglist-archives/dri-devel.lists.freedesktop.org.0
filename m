Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B71792646B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF4910E90F;
	Wed,  3 Jul 2024 15:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcKKuNpS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C5C10E910;
 Wed,  3 Jul 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720019414; x=1751555414;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=21xLGJoQYD1kb2zURTdJKfi+rqKWWh/EQBKGmisczfU=;
 b=bcKKuNpSakw1Q1pVGpZyUHX4CxigXHwo5hpPuxV21jCM0kqr2/cLgyKZ
 XHgJAl7fQcAxMCdCYfpJpvevYczD8NL8ubbC6Ki97jrtp+Ts1sBA06PaL
 ZPNMrzngMskpZxDEFwS3eNSh06TmvmviDdn4UrFkX4ENMlWuBqGTgxreP
 jjW3aVbb6g4N9lEQ6tTMwL8lPGn1+jhjEnFW+x1qC6G+Ssk4sXntSJm3U
 bysqBtGMeP7Obbc9/xQvOrMXuPjDqsVAE7iZKvXry/yPx+PbuCG9pRPFl
 WuaxCQkSLD4XVMXmH9YFjoUCtumtCsY/W1RY84tX6Ef9UO7kXhdoOFiGu Q==;
X-CSE-ConnectionGUID: IFSazUZFQ6O+q4lJ+89uoQ==
X-CSE-MsgGUID: 62VlKjleQWelvOIRp1AtcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21126990"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="21126990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:10:13 -0700
X-CSE-ConnectionGUID: bornbNVxQsKAg15BCJsKkg==
X-CSE-MsgGUID: jW+rOXhcTumhiV2lZYVWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46261150"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:10:13 -0700
Date: Wed, 3 Jul 2024 18:10:24 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] drm/i915: Dump DSC state to dmesg/debugfs
Message-ID: <ZoVp4L1Sdo96ZRYu@ideak-desk.fi.intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
 <87sewt9wrk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sewt9wrk.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 01, 2024 at 02:28:31PM +0300, Jani Nikula wrote:
> On Fri, 28 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> > This is v2 of [1], renaming the helpers from drm_x16 to fxp_q4 as
> > suggested by Jani.
> >
> > [1] https://lore.kernel.org/all/20240614173911.3743172-1-imre.deak@intel.com
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> 
> No detailed review, but on the approach and naming,
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Testing the patchset in CI shards is still pending, however based on the
available BAT result, I pushed already the first two patches with your
ack to drm-misc-next, thanks.

> > Imre Deak (9):
> >   drm: Add helpers for q4 fixed point values
> >   drm/display/dsc: Add a helper to dump the DSC configuration
> >   drm/i915: Replace to_bpp_x16() with fxp_q4_from_int()
> >   drm/i915: Replace to_bpp_int() with fxp_q4_to_int()
> >   drm/i915: Replace to_bpp_int_roundup() with fxp_q4_to_int_roundup()
> >   drm/i915: Replace to_bpp_frac() with fxp_q4_to_frac()
> >   drm/i915: Replace BPP_X16_FMT()/ARGS() with FXP_Q4_FMT()/ARGS()
> >   drm/i915: Dump DSC state to dmesg and debugfs/i915_display_info
> >   drm/i915: Remove DSC register dump
> >
> >  drivers/gpu/drm/display/drm_dp_helper.c       |  5 +-
> >  drivers/gpu/drm/display/drm_dsc_helper.c      | 91 +++++++++++++++++++
> >  drivers/gpu/drm/i915/display/icl_dsi.c        |  9 +-
> >  drivers/gpu/drm/i915/display/intel_audio.c    |  5 +-
> >  drivers/gpu/drm/i915/display/intel_bios.c     |  5 +-
> >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +-
> >  .../drm/i915/display/intel_crtc_state_dump.c  |  3 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |  7 +-
> >  .../drm/i915/display/intel_display_debugfs.c  |  4 +
> >  .../drm/i915/display/intel_display_types.h    | 23 -----
> >  drivers/gpu/drm/i915/display/intel_dp.c       | 51 ++++++-----
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 26 +++---
> >  drivers/gpu/drm/i915/display/intel_fdi.c      |  6 +-
> >  drivers/gpu/drm/i915/display/intel_link_bw.c  |  4 +-
> >  drivers/gpu/drm/i915/display/intel_vdsc.c     | 51 ++++++-----
> >  drivers/gpu/drm/i915/display/intel_vdsc.h     |  4 +
> >  include/drm/display/drm_dsc_helper.h          |  3 +
> >  include/drm/drm_fixed.h                       | 23 +++++
> >  18 files changed, 222 insertions(+), 103 deletions(-)
> 
> -- 
> Jani Nikula, Intel
