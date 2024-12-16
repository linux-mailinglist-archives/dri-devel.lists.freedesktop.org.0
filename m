Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65FA9F306D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE9310E5F2;
	Mon, 16 Dec 2024 12:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7MgJWdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1611810E5F2;
 Mon, 16 Dec 2024 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734351738; x=1765887738;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EsdclWmTQoPZB4QuTR3ja92kKRDgCi/37FFUTIqlIZw=;
 b=W7MgJWdDNHzqpDthddDUkDEfU5bNScV8KClGz/A3lK7psODW3mYRq2cE
 M9l2qw+dSZIQnjNlftyh55unlSoT8hoUvsokPDGAN0k0jcOz8ZbZvIZLX
 9hNO4AKSVDOw8DMUc3BcnhDbkwT5aUoQVNv6LYxRH3Uiss7kXCuDt8HUD
 TZTkxhtf4SYZYiRqv8YkuA9jdSnZgk8By6eufnV2AcFT7j+ZQmRXbKbwA
 6PtEzlDyw5pXL3+lpjKUlKHbVfcGn0y+d8BieVmwdO2OpmAAFr/KRBBC6
 aFishIELJipQGn26IwpN6+OvKqAJfAj9pp0Slc6xJh37Ww1VMGUky4I9N Q==;
X-CSE-ConnectionGUID: KX4P4ys3RsKnvzlIc9t4Eg==
X-CSE-MsgGUID: qDS5cD5hSPySIQwBGhWiGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34879107"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34879107"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:22:13 -0800
X-CSE-ConnectionGUID: pZRV/9FURQ2iSX70ZQm0/w==
X-CSE-MsgGUID: Y8IDTDyNTLOSrvqRufPYCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120440344"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:22:08 -0800
Date: Mon, 16 Dec 2024 14:22:49 +0200
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/connector: Expose only a properly inited
 connector
Message-ID: <Z2AbmXNwQv8YRzfD@ideak-desk.fi.intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211230328.4012496-1-imre.deak@intel.com>
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

Hi Thomas, Maxime, Maarten,

are you ok to merge patches 1-9 to drm-misc-next? Patches 10,11 could be
merged then to drm-intel-next after back-merging drm-misc-next to
drm-intel-next.

Thanks,
Imre

On Thu, Dec 12, 2024 at 01:03:17AM +0200, Imre Deak wrote:
> This is v3 of [1], with the following changes:
> 
> - Instead of the drm_connector_init_core()/drm_connector_add() add
>   a drm_connector_dynamic_init()/drm_connector_dynamic_register()
>   interface. Adding the connector to the connector list is now part of
>   the registration step done by the latter function. (Sima)
> - Add kunit tests for the above functions. (Maxime)
> - Add a FIXME note for a related issue in the GETRESOURCES ioctl call.
>   (Sima)
> - Add a note to depricate the use of
>   drm_connector_register()/drm_connector_unregister() by drivers for
>   static connectors.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> 
> [1] https://lore.kernel.org/all/20241126161859.1858058-1-imre.deak@intel.com
> 
> Imre Deak (11):
>   drm/connector: Add a way to init/add a connector in separate steps
>   drm/connector: Add FIXME for GETRESOURCES ioctl wrt. uninited
>     connectors
>   drm/connector: Add deprication notes for
>     drm_connector_register/unregister
>   drm/dp_mst: Register connectors via drm_connector_dynamic_register()
>   drm/i915/dp_mst: Expose a connector to kernel users after it's
>     properly initialized
>   drm/amd/dp_mst: Expose a connector to kernel users after it's properly
>     initialized
>   drm/nouveau/dp_mst: Expose a connector to kernel users after it's
>     properly initialized
>   drm/connector: Warn if a connector is registered/added incorrectly
>   drm/tests: Add tests for drm_connector_dynamic_init()/register()
>   drm/i915/dp_mst: Fix error handling while adding a connector
>   drm/i915/dp_mst: Use intel_connector vs. drm_connector pointer in
>     intel_dp_mst.c
> 
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   5 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>  drivers/gpu/drm/drm_connector.c               | 168 ++++++-
>  drivers/gpu/drm/drm_mode_config.c             |   9 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 206 ++++----
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   4 +-
>  drivers/gpu/drm/tests/drm_connector_test.c    | 463 ++++++++++++++++++
>  include/drm/drm_connector.h                   |   6 +
>  8 files changed, 722 insertions(+), 141 deletions(-)
> 
> -- 
> 2.44.2
> 
