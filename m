Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8A35154D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 15:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62FA6ECA9;
	Thu,  1 Apr 2021 13:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9CE6E0CF;
 Thu,  1 Apr 2021 13:40:49 +0000 (UTC)
IronPort-SDR: 3PSqg89DRxisX0jP9kS1oDlvqUhegBjHPvIZIzj0WkbKxN9UKtVwDq27gcWPrusr6/2moxzn7l
 +gesSGOT1BDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="277431052"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="277431052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 06:40:39 -0700
IronPort-SDR: LFYKKCnNLIHo8d1WzwQ5AsNeqrd0MpZqv++pww8uo/8fUTlbro4kse1JFIDXwGB/auZUAspbsR
 I6L+jGfT4YTw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="419206855"
Received: from shergane-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.188])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 06:40:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 00/20] drm: Use new DRM printk funcs (like
 drm_dbg_*()) in DP helpers
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210326203807.105754-1-lyude@redhat.com>
Date: Thu, 01 Apr 2021 16:40:33 +0300
Message-ID: <87blaym8by.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021, Lyude Paul <lyude@redhat.com> wrote:
> Since it's been asked quite a few times on some of the various DP
> related patch series I've submitted to use the new DRM printk helpers,
> and it technically wasn't really trivial to do this before due to the
> lack of a consistent way to find a drm_device for an AUX channel, this
> patch series aims to address this. In this series we:
>
> * Clean-up potentially erroneous usages of drm_dp_aux_init() and
>   drm_dp_aux_register() so that actual AUX registration doesn't happen
>   until we have an associated DRM device
> * Clean-up any obvious errors in drivers we find along the way
> * Add a backpointer to the respective drm_device for an AUX channel in
>   drm_dp_aux.drm_dev, and hook it up in every driver with an AUX channel
>   across the tree
> * Add a new ratelimited print helper we'll need for converting the DP
>   helpers over to using the new DRM printk helpers
> * Fix any inconsistencies with logging in drm_dp_helper.c so we always
>   have the aux channel name printed
> * Prepare the various DP helpers so they can find the correct drm_device
>   to use for logging
> * And finally, convert all of the DP helpers over to using drm_dbg_*()
>   and drm_err().
>
> Series-wide changes in v2:
> * Address most checkpatch issues ('most' as in all except for one line
>   going two chars over 100 in "drm/dp_mst: Pass drm_dp_mst_topology_mgr
>   to drm_dp_get_vc_payload_bw()" as this was the style in use
>   previously, and 2 chars over the limit looks nicer then trying to
>   line-wrap this
> * Don't rewrap comments

For anything touching i915, and for merging via whichever tree or branch
seems best,

Acked-by: Jani Nikula <jani.nikula@intel.com>

That said, gut feeling says there will be conflicts before latest
drm-misc-next and drm-intel-next have been merged to drm-next, and
drm-next has been backmerged to drm-misc-next and drm-intel-next.

It just might be a good idea to wait for those (as well as other driver
feature pulls) to settle, do a topic branch with a common ancestor
between drm-next and drm-misc-next, apply there, merge the topic branch
to drm-misc-next, and let all drivers merge the topic branch as
needed. Due to the timing, otherwise we might have to carry the
conflicts for quite a while.

BR,
Jani.


>
> Lyude Paul (20):
>   drm/dp: Fixup kernel docs for struct drm_dp_aux
>   drm/tegra: Don't register DP AUX channels before connectors
>   drm/bridge/cdns-mhdp8546: Register DP aux channel with userspace
>   drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late
>     register/early unregister
>   drm/dp: Add backpointer to drm_device in drm_dp_aux
>   drm/dp: Clarify DP AUX registration time
>   drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
>   drm/dp: Pass drm_dp_aux to drm_dp_link_train_clock_recovery_delay()
>   drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()
>   drm/dp: Always print aux channel name in logs
>   drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_detect()
>   drm/dp_dual_mode: Pass drm_device to
>     drm_dp_dual_mode_set_tmds_output()
>   drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_max_tmds_clock()
>   drm/dp_dual_mode: Pass drm_device to
>     drm_dp_dual_mode_get_tmds_output()
>   drm/dp_dual_mode: Pass drm_device to drm_lspcon_(get|set)_mode()
>   drm/dp_mst: Pass drm_dp_mst_topology_mgr to drm_dp_get_vc_payload_bw()
>   drm/dp: Convert drm_dp_helper.c to using drm_err/drm_dbg_*()
>   drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c to using
>     drm_err/drm_dbg_kms()
>   drm/dp_mst: Drop DRM_ERROR() on kzalloc() fail in
>     drm_dp_mst_handle_up_req()
>   drm/dp_mst: Convert drm_dp_mst_topology.c to drm_err()/drm_dbg*()
>
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   5 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   1 +
>  .../drm/bridge/analogix/analogix-anx6345.c    |   1 +
>  .../drm/bridge/analogix/analogix-anx78xx.c    |   1 +
>  .../drm/bridge/analogix/analogix_dp_core.c    |   1 +
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  12 +-
>  drivers/gpu/drm/bridge/tc358767.c             |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   1 +
>  drivers/gpu/drm/drm_dp_aux_dev.c              |   6 +
>  drivers/gpu/drm/drm_dp_dual_mode_helper.c     |  68 ++--
>  drivers/gpu/drm/drm_dp_helper.c               | 181 +++++----
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 381 +++++++++---------
>  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   1 +
>  .../drm/i915/display/intel_dp_link_training.c |   6 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |   7 +-
>  drivers/gpu/drm/i915/display/intel_lspcon.c   |  17 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |   6 +-
>  drivers/gpu/drm/msm/edp/edp.h                 |   3 +-
>  drivers/gpu/drm/msm/edp/edp_aux.c             |   5 +-
>  drivers/gpu/drm/msm/edp/edp_ctrl.c            |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  27 +-
>  drivers/gpu/drm/radeon/atombios_dp.c          |   5 +-
>  drivers/gpu/drm/tegra/dpaux.c                 |  12 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c              |   5 +-
>  include/drm/drm_dp_dual_mode_helper.h         |  14 +-
>  include/drm/drm_dp_helper.h                   |  61 +--
>  include/drm/drm_dp_mst_helper.h               |   3 +-
>  include/drm/drm_print.h                       |  20 +-
>  29 files changed, 478 insertions(+), 384 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
