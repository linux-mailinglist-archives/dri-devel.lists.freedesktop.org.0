Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGiiNevZcGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:51:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402357EE2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934C310E7C4;
	Wed, 21 Jan 2026 13:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffGW5zjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7729C10E7C4;
 Wed, 21 Jan 2026 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769003496; x=1800539496;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X6WWV8Zc3M2gl2bSFzCM11YEJF5O9CumjKArCsMsjr0=;
 b=ffGW5zjSEhh0ovBVqSabzHoKpRz/hJiG/kZG8e5Eq1RVDXbnDRBLg5s8
 1PiHMT2kT4ngS1BN/lPCgM+nnkea0VW6Lx5swsH3QidYp9+u/fLWIuPvx
 X/Y5VdkkOpmDALicw3CKfR0o6AhN8bN4A6fUCXiRjwIEVBCiE0S6HAO83
 aIPeE3SnHG/Mg8LDMGL1ys26YkBvMdiGq0+dZ1Pe7hPC92OuELia2J0bi
 DlmJJzg122XIv5I5EYEyHdy3ppMpgHXIy2Dq92UCVaELNGppyGlksqj9m
 Xv2/6aAZkuJIVtf3dAC0tn5/v2uBfnvbfoEHW7etNi/hLv34uiTH1Mnfz g==;
X-CSE-ConnectionGUID: wrMBmj8TSU+JbQYztKosJA==
X-CSE-MsgGUID: C2bjjir8Qfa+kLgv7max4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70141359"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70141359"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 05:51:35 -0800
X-CSE-ConnectionGUID: +VjNks09T5C1G0XER90Uug==
X-CSE-MsgGUID: Zgeiwj2zTP6tnOIDWBVJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="205704745"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 05:51:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v3 00/13] drm: Color pipeline teardown and follow-up
 fixes/improvements
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
Date: Wed, 21 Jan 2026 15:51:26 +0200
Message-ID: <513db214e2adcad6a70cea2461b7bfc26c2884db@intel.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 4402357EE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 13 Jan 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> This series contains follow-up fixes and improvements for the DRM color
> pipeline infrastructure that was introduced in v6.19.[1][2]
>
> The central handling of clean up of colorop from the mode_config list
> is missing. While vkms calls drm_colorop_pipeline_destroy() in vkms_destroy(),
> amd driver calls it only during failure of the init path and i915/xe driver
> does not call it at all. This means amd and intel leaks these objects on
> driver removal.
>
> This series adds the teardown of mode_config.colorop_list in drm_mode_config_cleanup().
> Since, i915/xe sub-classes the drm_colorop within intel_colorop it was not enough
> to just use drm_colorop_pipeline_destroy(). Therefore, this series
>
> - Introduces driver-managed destruction for drm_colorop objects and
>   updates core helpers to use driver-provided destroy callbacks.
> - Ensures all colorop objects are correctly torn down during
>   mode_config cleanup and driver removal.
>
> In addition to that following changes are made in the series
> - Fixes enum name lifetime leaks in color pipeline init in i915, amdgpu_dm, and vkms
> - Corrects the ordering of the 3D LUT block in the i915 plane color pipeline
> - Refactors i915 plane color pipeline initialization to reliably clean
>   up partially constructed pipelines on failure.
>
> Thanks for taking a look. Feedback is welcome.

I did not do detailed review, but

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via drm-misc.

Please coordinate with drm and drm-misc maintainers on which branch
these should merged through. IIUC there are memory leak fixes for
changes heading to v6.19, which speaks for drm-misc-fixes. But is it too
much at this stage? Up to drm and drm-misc maintainers I think.

BR,
Jani.


>
> [1] https://lore.kernel.org/dri-devel/cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com/
> [2] https://lore.kernel.org/intel-gfx/20251203085211.3663374-1-uma.shankar@intel.com/
>
> v2:
>  - Re-arrange patches (Alex)
>  - Re-factor code to avoid repitition in pipeline creation (Suraj)
>
> v3:
>  - Add documentation only to function definition (Jani)
>  - s/nvl/xe3plpd (Suraj)
>
> Chaitanya Kumar Borah (13):
>   drm/i915/color: Place 3D LUT after CSC in plane color pipeline
>   drm/amd/display: Fix color pipeline enum name leak
>   drm/vkms: Fix color pipeline enum name leak
>   drm/i915/display: Fix color pipeline enum name leak
>   drm/colorop: Add destroy helper for colorop objects
>   drm: Allow driver-managed destruction of colorop objects
>   drm/amd/display: Hook up colorop destroy helper for plane pipelines
>   drm/vkms: Hook up colorop destroy helper for plane pipelines
>   drm/i915/display: Hook up intel_colorop_destroy
>   drm: Clean up colorop objects during mode_config cleanup
>   drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
>   drm/colorop: Use destroy callback for color pipeline teardown
>   drm/i915/color: Add failure handling in plane color pipeline init
>
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  31 ++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
>  drivers/gpu/drm/drm_colorop.c                 |  49 +++--
>  drivers/gpu/drm/drm_mode_config.c             |   6 +
>  .../drm/i915/display/intel_color_pipeline.c   | 179 +++++++++++++-----
>  drivers/gpu/drm/i915/display/intel_colorop.c  |   6 +
>  drivers/gpu/drm/i915/display/intel_colorop.h  |   1 +
>  drivers/gpu/drm/vkms/vkms_colorop.c           |  31 +--
>  drivers/gpu/drm/vkms/vkms_drv.c               |   1 -
>  include/drm/drm_colorop.h                     |  32 +++-
>  10 files changed, 259 insertions(+), 90 deletions(-)

-- 
Jani Nikula, Intel
