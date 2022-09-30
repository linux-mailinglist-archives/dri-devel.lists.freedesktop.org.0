Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2135F0CCC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1640E10ED06;
	Fri, 30 Sep 2022 13:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10EF10ED08;
 Fri, 30 Sep 2022 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664546001; x=1696082001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QH4ENeVd+49h3QIB1jgjo+dFYttG3Rwo413wsqCifSQ=;
 b=nQrAU63ubZoTv1S2DFX7+wWAELo84kJ3IQLx9LCPZ28L6aTjaUBPOSNH
 v3MKCC6NdeRMZdGomN17dG9LbOXTZ3GaRjzal2EdpAuDPVvuLl9aF1sKx
 /CZ56ZkokyGNmWsiWgQ7dyNcYqfUf0bjczzqhiz60gP36cP7mPcHKiOUL
 0voL2WTcyKkYEWyhUkqtqktRrA5K1R68SACCJo/pNWZknyXDDdAt/Vz7d
 MFMYehsutoE0dmzMUsI0vKE/rB4rnKss7z6+meMCniCDuU3uee2G9vwrh
 0lq0NMjfD2uw4jWR4ZMbgy6efyajTeB/97hcq82qD8lK6YHa83Fu+mf4T Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="302167158"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="302167158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 06:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="655961386"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="655961386"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 30 Sep 2022 06:52:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 16:52:56 +0300
Date: Fri, 30 Sep 2022 16:52:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Message-ID: <Yzb0uNjB5FpjCIjq@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929184307.258331-1-contact@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 06:43:15PM +0000, Simon Ser wrote:
> This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
> commits, aka. "immediate flip" (which might result in tearing).
> The feature was only available via the legacy uAPI, however for
> gaming use-cases it may be desirable to enable it via the atomic
> uAPI too.
> 
> - Patchwork: https://patchwork.freedesktop.org/series/107683/
> - User-space patch: https://github.com/Plagman/gamescope/pull/595
> - IGT patch: https://patchwork.freedesktop.org/series/107681/

So no tests that actually verify that the kernel properly rejects
stuff stuff like modesets, gamma LUT updates, plane movement,
etc.?

> 
> Main changes in v2: add docs, fail atomic commit if async flip isn't
> possible.
> 
> Changes in v3: add a note in the documentation about Intel hardware,
> add R-b tags.
> 
> Tested on an AMD Picasso iGPU (Simon) and an AMD Vangogh GPU (André).
> 
> Simon Ser (6):
>   drm: document DRM_MODE_PAGE_FLIP_ASYNC
>   amd/display: only accept async flips for fast updates
>   drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
>   drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
>   drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
>   amd/display: indicate support for atomic async page-flips on DC
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 10 +++++++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 28 +++++++++++++++++--
>  drivers/gpu/drm/drm_ioctl.c                   |  5 ++++
>  drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  1 +
>  include/drm/drm_mode_config.h                 | 11 ++++++++
>  include/uapi/drm/drm.h                        | 10 ++++++-
>  include/uapi/drm/drm_mode.h                   | 16 +++++++++++
>  11 files changed, 88 insertions(+), 4 deletions(-)
> 
> -- 
> 2.37.3
> 

-- 
Ville Syrjälä
Intel
