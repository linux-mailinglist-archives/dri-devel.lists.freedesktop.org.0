Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71A84581C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 13:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BC210ED5C;
	Thu,  1 Feb 2024 12:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdtaJ52h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4F910ED5C;
 Thu,  1 Feb 2024 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706791879; x=1738327879;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=k0K7+O4E52W375QiObRrDV8/j+msM0QFKMQn2H6NoW0=;
 b=LdtaJ52hk+6ZhNfVnE+5OJFkjR+pqk/Xv2R0/Yo5bU2ApBzbpi4HNp6r
 khYlCWKJ7dXr0IS2FzC7jrT4deBo/fao7fR6wrRaviMnQFC3XDtzowYXg
 Lt8astgpD5uuUbZqFeNHDt55p34Veajsps++/1AOHwYRRzyrCuPugUKkH
 sh5DOMQF3VnTqhOxMcnMfGrE+IJDmN25KUD1VRfrMpbIH3Nb3j+8YxrEu
 pFGh2ZiWHLCh/cAK2OpXenFOn28VtbwSIZGUdGzuQM5ZvxedVvzItEoQO
 HWne6Atma7S5x02UAUkyRPEOPm0WH0W0HDEo7AVHFKUpQSXHEdAOCf6um A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401016433"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401016433"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961908437"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="961908437"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:51:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 00/10] drm: drm debug and error logging improvements
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1705410327.git.jani.nikula@intel.com>
Date: Thu, 01 Feb 2024 14:51:13 +0200
Message-ID: <871q9wgxfi.fsf@intel.com>
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

On Tue, 16 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> This is resend and more patches on top of [1]. I don't think I've
> changed anything since then.

Hi drm-misc maintainers -

I've got R-b from Luca, but given there's no comments outside of Intel,
are you okay with me merging this to drm-misc?

BR,
Jani.


>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/126873/
>
>
> Jani Nikula (10):
>   drm/print: make drm_err_printer() device specific by using drm_err()
>   drm/print: move enum drm_debug_category etc. earlier in drm_print.h
>   drm/print: add drm_dbg_printer() for drm device specific printer
>   drm/dp_mst: switch from drm_debug_printer() to device specific
>     drm_dbg_printer()
>   drm/mode: switch from drm_debug_printer() to device specific
>     drm_dbg_printer()
>   drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
>   drm/i915: switch from drm_debug_printer() to device specific
>     drm_dbg_printer()
>   drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()
>   drm/xe: switch from drm_debug_printer() to device specific
>     drm_dbg_printer()
>   drm: remove drm_debug_printer in favor of drm_dbg_printer
>
>  drivers/gpu/drm/display/drm_dp_helper.c       |  17 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  23 +-
>  drivers/gpu/drm/drm_mode_config.c             |   2 +-
>  drivers/gpu/drm/drm_modeset_lock.c            |   2 +-
>  drivers/gpu/drm/drm_print.c                   |  29 ++-
>  .../drm/i915/display/intel_crtc_state_dump.c  |   5 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |  27 ++-
>  .../drm/i915/display/intel_display_driver.c   |   3 +-
>  .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   3 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   3 +-
>  drivers/gpu/drm/i915/gt/selftest_context.c    |   3 +-
>  .../drm/i915/gt/selftest_engine_heartbeat.c   |  10 +-
>  drivers/gpu/drm/i915/i915_driver.c            |   3 +-
>  drivers/gpu/drm/i915/selftests/i915_active.c  |   8 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  |   2 +-
>  drivers/gpu/drm/xe/xe_gt.c                    |   2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c           |   4 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c                |   2 +-
>  include/drm/display/drm_dp_helper.h           |   3 +-
>  include/drm/drm_print.h                       | 220 +++++++++---------
>  21 files changed, 206 insertions(+), 168 deletions(-)

-- 
Jani Nikula, Intel
