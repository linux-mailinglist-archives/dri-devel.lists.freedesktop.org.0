Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE45AAD45
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 13:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7479410E7FC;
	Fri,  2 Sep 2022 11:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754AD10E800;
 Fri,  2 Sep 2022 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662117289; x=1693653289;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=X7IKFVPPvozRQoVXAEPchifeq0wc72nPse9BauvYMbA=;
 b=HHXJiUmasoh6w6/ZTGun9dNx5qGW6HreD4FMcWcmIBuTresI335G2p9d
 PRJb0Wv4gcXzuXZ0kVmKag1JYaIqB27u12v4MhKjNmpRoB82hzK2bizaU
 IXXERZkySSIn9AddvSGtpygEo6TZehr/KRBv58AJ7KQZojTjXDG0buGXO
 tcsNz1F6viNrhqvWbU98NHyISzUAfvszIMkHHuN/b5gHluSpyvsDuVxJV
 BvPv9RPQI7WJBwSxKuzgUTQIFhWj1WC5aj8fELvYC5Qg7LEQ6W3AHZJQL
 H2WejImdnC8Uqc9yyD7x+JtL/drBc9Q++fc8qWmziaXaFIt10WLKMB//4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278974911"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="278974911"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 04:14:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="642873209"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 04:14:46 -0700
Date: Fri, 2 Sep 2022 14:14:42 +0300
From: Imre Deak <imre.deak@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v7 1/3] drm/i915/hpd: suspend MST at the end of
 intel_modeset_driver_remove
Message-ID: <YxHlohZu/jCxSyJK@ideak-desk.fi.intel.com>
References: <20220826141929.189681-1-andrzej.hajda@intel.com>
 <20220826141929.189681-2-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826141929.189681-2-andrzej.hajda@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 04:19:27PM +0200, Andrzej Hajda wrote:
> i915->hotplug.dig_port_work can be queued from intel_hpd_irq_handler
> called by IRQ handler or by intel_hpd_trigger_irq called from dp_mst.
> Since dp_mst is suspended after irq handler uninstall, a cleaner approach
> is to cancel hpd work after intel_dp_mst_suspend, otherwise we risk
> use-after-free.
> 
> It should fix following WARNINGS:
> [283.405824] cpu_latency_qos_update_request called for unknown object
> [283.405866] WARNING: CPU: 2 PID: 240 at kernel/power/qos.c:296 cpu_latency_qos_update_request+0x2d/0x100
> [283.405912] CPU: 2 PID: 240 Comm: kworker/u64:9 Not tainted 5.18.0-rc6-Patchwork_103738v3-g1672d1c43e43+ #1
> [283.405915] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
> [283.405916] Workqueue: i915-dp i915_digport_work_func [i915]
> [283.406020] RIP: 0010:cpu_latency_qos_update_request+0x2d/0x100
> ...
> [283.406040] Call Trace:
> [283.406041]  <TASK>
> [283.406044]  intel_dp_aux_xfer+0x60e/0x8e0 [i915]
> [283.406131]  ? finish_swait+0x80/0x80
> [283.406139]  intel_dp_aux_transfer+0xc5/0x2b0 [i915]
> [283.406218]  drm_dp_dpcd_access+0x79/0x130 [drm_display_helper]
> [283.406227]  drm_dp_dpcd_read+0xe2/0xf0 [drm_display_helper]
> [283.406233]  intel_dp_hpd_pulse+0x134/0x570 [i915]
> [283.406308]  ? __down_killable+0x70/0x140
> [283.406313]  i915_digport_work_func+0xba/0x150 [i915]
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4586
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5558
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index a0f84cbe974fc3..524c4580ae6bc9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9000,6 +9000,13 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
>  
>  	flush_work(&i915->atomic_helper.free_work);
>  	drm_WARN_ON(&i915->drm, !llist_empty(&i915->atomic_helper.free_list));
> +
> +	/*
> +	 * MST topology needs to be suspended so we don't have any calls to
> +	 * fbdev after it's finalized. MST will be destroyed later as part of
> +	 * drm_mode_config_cleanup()
> +	 */
> +	intel_dp_mst_suspend(i915);
>  }
>  
>  /* part #2: call after irq uninstall */
> @@ -9014,13 +9021,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
>  	 */
>  	intel_hpd_poll_fini(i915);
>  
> -	/*
> -	 * MST topology needs to be suspended so we don't have any calls to
> -	 * fbdev after it's finalized. MST will be destroyed later as part of
> -	 * drm_mode_config_cleanup()
> -	 */
> -	intel_dp_mst_suspend(i915);
> -
>  	/* poll work can call into fbdev, hence clean that up afterwards */
>  	intel_fbdev_fini(i915);
>  
> -- 
> 2.25.1
> 
