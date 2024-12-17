Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FD9F4E2A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A5E10E998;
	Tue, 17 Dec 2024 14:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GE6ZHWIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB8D10E998;
 Tue, 17 Dec 2024 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734446796; x=1765982796;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=byLGQEcrH3CKtlSSCGnJz5MBlNvB9U9VxD8ZFS9Ppj4=;
 b=GE6ZHWIw7Ry/e8OoEdhzVEBXTZ9/1K+Ofzu3AtywHig/YSLe6OrNEZhD
 olAX59aOtoibInXEjv1ZD4+tMKQ+edTwhN6RfkhovGWEEda1Hret2ycTW
 4KajYv4X01JycIuDwGm1OiFKVgG491FD38shgz9U9vr6HPxcEChTpaXHm
 3zOOPXTcsVEdCHgfk1dq+6dePEm5X2YKU4xzOwaptfW2SAW/T+w/j0pk/
 YCYBs9+CFUpoFhx6Vta4I3iGOxYPR5k+WV8RkLCKj3klY3R14GRyZvQid
 zsWj5ainK0xffhPFXPgDQlW+MSy8Wi/smwtnre+bOK2jGVxn3e1SdN6LG A==;
X-CSE-ConnectionGUID: +NDWQKErQJuzZ8m23zrp2g==
X-CSE-MsgGUID: /g3CvQLYQ5e+TUMokw69iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57355102"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="57355102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:46:35 -0800
X-CSE-ConnectionGUID: RFLLmIhYRMmN+cMd4szEsQ==
X-CSE-MsgGUID: 6+wQyitPT5emF2cRdX2r4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101690668"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:46:32 -0800
Date: Tue, 17 Dec 2024 16:47:11 +0200
From: Imre Deak <imre.deak@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Wayne Lin <wayne.lin@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/connector: Expose only a properly inited
 connector
Message-ID: <Z2GO73VinccXiDC_@ideak-desk.fi.intel.com>
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

On Thu, Dec 12, 2024 at 01:03:17AM +0200, Imre Deak wrote:

The patchset at [2] is pushed now to drm-misc-next, thanks for the
reviews, acks and ideas.

While merging, I fixed the typos in patch 3, 5-7 and removed references
to 'patches', 'patchsets' in the commit logs of patch 2, 4, 9.

I had to rebase patch 5 ("drm/i915/dp_mst: Expose a connector to kernel
users after it's properly initialized") on drm-misc-next due to commit
5503f8112e52 ("drm/i915/mst: unify MST topology callback naming to
mst_topology_*") being only in drm-intel-next and not in drm-misc-next
and then resolve a trivial conflict while merging drm-misc-next to
drm-tip in the following way:

diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.c
index 56ca571e534c5,326ff20a5a499..708fe93d8b06b
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -1715,9 -1704,7 +1704,9 @@@ mst_topology_add_connector(struct drm_d
        if (!intel_connector)
                return NULL;

 +      connector = &intel_connector->base;
 +
-       intel_connector->get_hw_state = intel_dp_mst_get_hw_state;
+       intel_connector->get_hw_state = mst_connector_get_hw_state;
        intel_connector->sync_state = intel_dp_connector_sync_state;
        intel_connector->mst_port = intel_dp;
        intel_connector->port = port;
@@@ -1725,22 -1712,33 +1714,22 @@@

        intel_dp_init_modeset_retry_work(intel_connector);

-       ret = drm_connector_dynamic_init(&dev_priv->drm, connector, &intel_dp_mst_connector_funcs,
 -      /*
 -       * TODO: The following drm_connector specific initialization belongs
 -       * to DRM core, however it happens atm too late in
 -       * drm_connector_init(). That function will also expose the connector
 -       * to in-kernel users, so it can't be called until the connector is
 -       * sufficiently initialized; init the device pointer used by the
 -       * following DSC setup, until a fix moving this to DRM core.
 -       */
 -      intel_connector->base.dev = mgr->dev;
 -
 -      intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
 -      intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 -      intel_connector->dp.dsc_hblank_expansion_quirk =
 -              detect_dsc_hblank_expansion_quirk(intel_connector);
 -
 -      connector = &intel_connector->base;
 -      ret = drm_connector_init(display->drm, connector, &mst_connector_funcs,
 -                               DRM_MODE_CONNECTOR_DisplayPort);
++      ret = drm_connector_dynamic_init(display->drm, connector, &mst_connector_funcs,
 +                                       DRM_MODE_CONNECTOR_DisplayPort, NULL);
        if (ret) {
                drm_dp_mst_put_port_malloc(port);
                intel_connector_free(intel_connector);
                return NULL;
        }

 +      intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
 +      intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 +      intel_connector->dp.dsc_hblank_expansion_quirk =
 +              detect_dsc_hblank_expansion_quirk(intel_connector);
 +
-       drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs);
+       drm_connector_helper_add(connector, &mst_connector_helper_funcs);

-       for_each_pipe(dev_priv, pipe) {
+       for_each_pipe(display, pipe) {
                struct drm_encoder *enc =
                        &intel_dp->mst_encoders[pipe]->base.base;

[2] https://lore.kernel.org/all/20241211230328.4012496-1-imre.deak@intel.com

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
