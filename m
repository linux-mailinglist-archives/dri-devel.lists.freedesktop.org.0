Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CB861F75
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 23:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0490D10E0F7;
	Fri, 23 Feb 2024 22:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzO+bUTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7110E0ED;
 Fri, 23 Feb 2024 22:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708726487; x=1740262487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y1miJ1WDsld69IrDRlWeuljzXQmgdNODcm8JPexiqUs=;
 b=bzO+bUTa8ks8HmDqa+SG+phDShUErINK7LCqQ536a9pstrz5DDZY94PN
 3XWdfHHuTlwHlK8/i613194qIqf+bsoU0PN7lX9pIrKras6WfM5rlqoH/
 +XfTIwVpuqJYI/kHJDE0TgHo5KWwu3n1nS6bynQIX9yPYAktv93AZGfIW
 NUsBUbrK80+tCZZsCfKTfvpLXEV0b+Klc1HVAmqBas6b67ZE3ejMuEx1e
 dklDdtwIk+QHMNjTr2ZxqpV6EDmK2U5v/IjrazNNE+XqbqoTzetKZQfAK
 gYF79EMqHSTZDFyoPP6alYD3Povy//GKoXaBqvol3eYsN0Jtsm1oHdoie Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2932449"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2932449"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 14:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="827767929"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="827767929"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 23 Feb 2024 14:14:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 24 Feb 2024 00:14:41 +0200
Date: Sat, 24 Feb 2024 00:14:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
 Saranya Gopal <saranya.gopal@intel.com>,
 Rajaram Regupathy <rajaram.regupathy@intel.com>,
 Gil Fine <gil.fine@intel.com>, Naama Shachar <naamax.shachar@intel.com>,
 Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH v2 00/21] drm/i915: Add Display Port tunnel BW allocation
 support
Message-ID: <ZdkY0WvQ98nDaQoF@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Feb 20, 2024 at 11:18:20PM +0200, Imre Deak wrote:
> This is v2 of [1], with the following changes:
> 
> - Several functional/typo/formatting fixes, detailed in the patches.
> - Move the BW allocation from encoder hooks to
>   intel_atomic_commit_tail() fixing the allocation for MST streams
>   enabled/disabled w/o a full modeset (i.e. w/o re-enabling the master
>   stream).
> - Fix an MST mode restore issue during system resume, which also lead
>   to a tunnel BW allocation failure. (Patch 3)
> - Ensure a DPCD DPRX cap read as required by the TBT CM any time a long
>   HPD pulse is detected. (Patch 20)
> - Explicitly disable the BW allocation mode during system suspend.
> 
> The patchset is also available at:
> https://github.com/ideak/linux/commits/dp_tun_bw_alloc
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Cc: Saranya Gopal <saranya.gopal@intel.com>
> Cc: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Cc: Gil Fine <gil.fine@intel.com>
> Cc: Naama Shachar <naamax.shachar@intel.com>
> Cc: Pengfei Xu <pengfei.xu@intel.com>
> 
> [1] https://lore.kernel.org/all/20240123102850.390126-1-imre.deak@intel.com
> 
> Imre Deak (21):
>   drm/dp: Add drm_dp_max_dprx_data_rate()
>   drm/dp: Add support for DP tunneling
>   drm/i915: Fix display bpp limit computation during system resume
>   drm/i915/dp: Add support to notify MST connectors to retry modesets
>   drm/i915/dp: Use drm_dp_max_dprx_data_rate()
>   drm/i915/dp: Factor out intel_dp_config_required_rate()
>   drm/i915/dp: Export intel_dp_max_common_rate/lane_count()
>   drm/i915/dp: Factor out intel_dp_update_sink_caps()
>   drm/i915/dp: Factor out intel_dp_read_dprx_caps()
>   drm/i915/dp: Add intel_dp_max_link_data_rate()
>   drm/i915/dp: Add way to get active pipes with syncing commits
>   drm/i915/dp: Add support for DP tunnel BW allocation
>   drm/i915/dp: Add DP tunnel atomic state and check BW limit
>   drm/i915/dp: Account for tunnel BW limit in
>     intel_dp_max_link_data_rate()
>   drm/i915/dp: Compute DP tunnel BW during encoder state computation
>   drm/i915/dp: Allocate/free DP tunnel BW in the encoder enable/disable
>     hooks
>   drm/i915/dp: Handle DP tunnel IRQs
>   drm/i915/dp: Call intel_dp_sync_state() always for DDI DP encoders
>   drm/i915/dp: Suspend/resume DP tunnels
>   drm/i915/dp: Read DPRX for all long HPD pulses
>   drm/i915/dp: Enable DP tunnel BW allocation mode

I think I eyeballed this sufficiently now. 

Only a few minor issues which I pointed out already. 
Otherwise this is:
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  drivers/gpu/drm/display/Kconfig               |   21 +
>  drivers/gpu/drm/display/Makefile              |    2 +
>  drivers/gpu/drm/display/drm_dp_helper.c       |   30 +
>  drivers/gpu/drm/display/drm_dp_tunnel.c       | 1929 +++++++++++++++++
>  drivers/gpu/drm/i915/Kconfig                  |   14 +
>  drivers/gpu/drm/i915/Kconfig.debug            |    1 +
>  drivers/gpu/drm/i915/Makefile                 |    3 +
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   10 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     |   52 +
>  drivers/gpu/drm/i915/display/intel_crtc.h     |    2 +
>  drivers/gpu/drm/i915/display/intel_ddi.c      |    3 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   26 +-
>  .../gpu/drm/i915/display/intel_display_core.h |    1 +
>  .../drm/i915/display/intel_display_driver.c   |   20 +-
>  .../drm/i915/display/intel_display_types.h    |    9 +
>  drivers/gpu/drm/i915/display/intel_dp.c       |  292 ++-
>  drivers/gpu/drm/i915/display/intel_dp.h       |   13 +-
>  .../drm/i915/display/intel_dp_link_training.c |   33 +-
>  .../drm/i915/display/intel_dp_link_training.h |    1 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   18 +-
>  .../gpu/drm/i915/display/intel_dp_tunnel.c    |  815 +++++++
>  .../gpu/drm/i915/display/intel_dp_tunnel.h    |  133 ++
>  drivers/gpu/drm/i915/display/intel_link_bw.c  |   27 +-
>  drivers/gpu/drm/i915/display/intel_link_bw.h  |    2 +-
>  drivers/gpu/drm/i915/display/intel_tc.c       |    7 +
>  include/drm/display/drm_dp.h                  |   61 +
>  include/drm/display/drm_dp_helper.h           |    2 +
>  include/drm/display/drm_dp_tunnel.h           |  248 +++
>  28 files changed, 3650 insertions(+), 125 deletions(-)
>  create mode 100644 drivers/gpu/drm/display/drm_dp_tunnel.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.h
>  create mode 100644 include/drm/display/drm_dp_tunnel.h
> 
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
