Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A818AE7B53
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFD810E6B6;
	Wed, 25 Jun 2025 09:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkykgqMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305CC10E094;
 Wed, 25 Jun 2025 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750842195; x=1782378195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PfoGJ0GfZY1DsnxMeIOSOojnO0+7vjQgvE5HqZXEZHY=;
 b=nkykgqMIhOVkcyKbVLaGKuLJpK3NV3ZDqKq6/Xhoh0iFrYzwRKaPY5vY
 dPqZPYMVJ2iagpV4Snp47DDmEscQ6zjqX1xXXQJAMNI77HcxO+J8ij2c3
 /RdHHEooHeL/L7GgrxBQEKr/w7vsqXGptHX9kjO0WPMptvR7Yk0hvPI+K
 c38LhrANZKWWEZPK4V26QVsXc6pB4ucZVRTwaXao0m8eeUVh/jhBgHB3b
 myf1/BV0IOcYK6pbp9zm0ktIcQc6ZTXuDQwslRb5u/L5aYY7KAU3RwyJt
 pFciw+OX1ewzEZKUwzfx2EfibNrIZJtOCHX+EezU24RJ4Q8ceHx87X02i A==;
X-CSE-ConnectionGUID: StquR0mDSzKd5qlHofmOXA==
X-CSE-MsgGUID: 6aAEvx6tRFmIzEpiKWNHHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63792397"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="63792397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:03:15 -0700
X-CSE-ConnectionGUID: ZLX0mSTITJqyN6ZCnm8+Mg==
X-CSE-MsgGUID: oD6FTrERQFGrqalRYscCGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="156726780"
Received: from monicael-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:03:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Cc: arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 00/13] Modify drm helpers to use luminance
In-Reply-To: <20250620063445.3603086-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
Date: Wed, 25 Jun 2025 12:03:08 +0300
Message-ID: <4962fc123ddc84edcf02dea8d57df32088c18d5a@intel.com>
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

On Fri, 20 Jun 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> This series modifies drm dp edp helpers so that drivers can now use them
> to manipulate brightness using luminance value via the
> PANEL_TARGET_LUMINANCE_VALUE register. This feature was
> introduced frin eDP 1.5.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
> Suraj Kandpal (13):
>   drm/dp: Introduce new member in drm_backlight_info
>   drm/dp: Add argument in drm_edp_backlight_init
>   drm/dp: Add argument for max luminance in drm_edp_backlight_init
>   drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
>   drm/dp: Change current_level argument type to u32
>   drm/dp: Modify drm_edp_probe_state
>   drm/dp: Change argument type for drm_edp_backlight_set_level
>   drm/dp: Modify drm_edp_backlight_set_level
>   drm/dp: Change argument type of drm_edp_backlight_enable
>   drm/dp: Enable backlight control using luminance
>   drm/i915/backlight: Use drm helper to initialize edp backlight
>   drm/i915/backlight: Use drm helper to set edp backlight
>   drm/i915/backlight: Use drm_edp_backlight_enable

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging the last three patches via drm-misc.

However, would be great to solicit feedback on the series from non-Intel
folks too. Cc: Lyude who's worked on DPCD brightness before.

BR,
Jani.

>
>  drivers/gpu/drm/display/drm_dp_helper.c       |  92 ++++++++----
>  .../drm/i915/display/intel_dp_aux_backlight.c | 140 ++++++------------
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_backlight.c   |   7 +-
>  include/drm/display/drm_dp_helper.h           |  10 +-
>  5 files changed, 127 insertions(+), 124 deletions(-)

-- 
Jani Nikula, Intel
