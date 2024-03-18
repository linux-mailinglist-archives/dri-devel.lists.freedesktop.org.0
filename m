Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23D87EB28
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4D810EDE4;
	Mon, 18 Mar 2024 14:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpsUwayc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706D410E26C;
 Mon, 18 Mar 2024 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710772685; x=1742308685;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=E/TWm7rpdk4KyK1snuFJ7hfjQG5X7/S6Tjivqk5S4PU=;
 b=ZpsUwaycgXJmoTS3tMHmX17FPcoyqe+9QYYgnBD202MjkHPhJh0BSJlI
 r9tLJ+vKfpaKot74PRhhHvBJTn3q9N+IxuGsujKmr8Tbx3IROhRlv+xIP
 QEPXGSmt2ZUMh29mUjKG9+7T4xJpwB8Ck8+csHeBujYYudbJkS13ASQzY
 y6NWO0hQ7FjZ62T9KK7+FMu/yPzxwK8le4atEh6WXD912P9G+aR5NCoPl
 VeUf15/uRI0TOvQITLxBJCP30oz+zmRqokcLUryB9mobGVKrgNRKcFIkm
 61kghkI2qJaNyZiCluYpeUzk5wH91Xli1nOyvSpcQzyCPwABdYz6cZoMX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5451363"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5451363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18156116"
Received: from ahmedess-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:38:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org, Mitul
 Golani <mitulkumar.ajitkumar.golani@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
In-Reply-To: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Mon, 18 Mar 2024 16:37:58 +0200
Message-ID: <87a5mvppvd.fsf@intel.com>
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

On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>  An Adaptive-Sync-capable DP protocol converter indicates its
> support by setting the related bit in the DPCD register. This
> is valid for DP and edp as well.
>
> Computes AS SDP values based on the display configuration,
> ensuring proper handling of Variable Refresh Rate (VRR)
> in the context of Adaptive Sync.

[snip]

> Mitul Golani (9):
>   drm/dp: Add support to indicate if sink supports AS SDP
>   drm: Add Adaptive Sync SDP logging

Maarten, Maxime, Thomas, ack for merging these two patches via
drm-intel-next?

BR,
Jani.

>   drm/i915/display: Add crtc state dump for Adaptive Sync SDP
>   drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
>   drm/i915/dp: Add wrapper function to check AS SDP
>   drm/i915/display: Compute AS SDP parameters
>   drm/i915/display: Add state checker for Adaptive Sync SDP
>   drm/i915/display: Compute vrr_vsync params
>   drm/i915/display: Read/Write Adaptive Sync SDP
>
>  drivers/gpu/drm/display/drm_dp_helper.c       |  37 ++++++
>  .../drm/i915/display/intel_crtc_state_dump.c  |  13 ++
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   1 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  48 +++++++
>  .../drm/i915/display/intel_display_device.h   |   1 +
>  .../drm/i915/display/intel_display_types.h    |   2 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 125 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h       |   1 +
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  14 +-
>  drivers/gpu/drm/i915/display/intel_vrr.c      |  30 ++++-
>  drivers/gpu/drm/i915/i915_reg.h               |  15 +++
>  include/drm/display/drm_dp.h                  |  11 ++
>  include/drm/display/drm_dp_helper.h           |  30 +++++
>  13 files changed, 325 insertions(+), 3 deletions(-)

-- 
Jani Nikula, Intel
