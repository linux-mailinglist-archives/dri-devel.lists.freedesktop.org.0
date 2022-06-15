Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0D954D172
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 21:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533D9112A61;
	Wed, 15 Jun 2022 19:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6156510FAC9;
 Wed, 15 Jun 2022 19:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655320610; x=1686856610;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oVbScG/DWO8m78cbPhcP5qpY+C/RLXH24wD9sFc7X6U=;
 b=lGzoiB4yNrDjP3S0ywD8GrAw8wv7Pvy+vup70GEa30mVI9CIAWtr9SF6
 S6UpKllR20Af0a69ZEPf8sBAhaRGMzfjy+ygAp/fDicVGWwmSVKKY/e0O
 LHUCZfbmF/2oT5TchpyOSuaQ+hyby7zVqsPGD7JtAJuPcXrw0KJ8D6I7T
 tvCds1f1g2b24VDyS6VLH7kZdU4tNh1ApLii3Fq8b8gx2DUJm4SqYazWL
 sTcn694ZkjBvilBxV1Hri8GCoAEJI+QH3PDaG4+dM5m1IWl41TOa4jHw0
 vxDgVY6XADyACH898HE90sa/Zs5byhZdxO2Of16yH/mpGPtrAXs2ux7u1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279134408"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="279134408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 12:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="583353008"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 15 Jun 2022 12:16:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Jun 2022 22:16:46 +0300
Date: Wed, 15 Jun 2022 22:16:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7] drm/i915/display: disable HPD workers
 before display driver unregister
Message-ID: <YqowHjSqWoQZmRkQ@intel.com>
References: <20220610160024.903701-1-andrzej.hajda@intel.com>
 <YqOPdYtBRLz4aDIp@intel.com>
 <e7c52485-7bc5-cf44-308a-a24e7175246c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7c52485-7bc5-cf44-308a-a24e7175246c@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 05:06:40PM +0200, Andrzej Hajda wrote:
> On 10.06.2022 20:37, Ville Syrjälä wrote:
> > On Fri, Jun 10, 2022 at 06:00:24PM +0200, Andrzej Hajda wrote:
> >> Handling HPD during driver removal is pointless, and can cause different
> >> use-after-free/concurrency issues:
> >> 1. Setup of deferred fbdev after fbdev unregistration.
> >> 2. Access to DP-AUX after DP-AUX removal.
> >>
> >> Below stacktraces of both cases observed on CI:
> >>
> >> [272.634530] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
> >> [272.634536] CPU: 0 PID: 6030 Comm: i915_selftest Tainted: G     U            5.18.0-rc5-CI_DRM_11603-g12dccf4f5eef+ #1
> >> [272.634541] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
> >> [272.634545] RIP: 0010:fb_do_apertures_overlap.part.14+0x26/0x60
> >> ...
> >> [272.634582] Call Trace:
> >> [272.634583]  <TASK>
> >> [272.634585]  do_remove_conflicting_framebuffers+0x59/0xa0
> >> [272.634589]  remove_conflicting_framebuffers+0x2d/0xc0
> >> [272.634592]  remove_conflicting_pci_framebuffers+0xc8/0x110
> >> [272.634595]  drm_aperture_remove_conflicting_pci_framebuffers+0x52/0x70
> >> [272.634604]  i915_driver_probe+0x63a/0xdd0 [i915]
> >>
> >> [283.405824] cpu_latency_qos_update_request called for unknown object
> >> [283.405866] WARNING: CPU: 2 PID: 240 at kernel/power/qos.c:296 cpu_latency_qos_update_request+0x2d/0x100
> >> [283.405912] CPU: 2 PID: 240 Comm: kworker/u64:9 Not tainted 5.18.0-rc6-Patchwork_103738v3-g1672d1c43e43+ #1
> >> [283.405915] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
> >> [283.405916] Workqueue: i915-dp i915_digport_work_func [i915]
> >> [283.406020] RIP: 0010:cpu_latency_qos_update_request+0x2d/0x100
> >> ...
> >> [283.406040] Call Trace:
> >> [283.406041]  <TASK>
> >> [283.406044]  intel_dp_aux_xfer+0x60e/0x8e0 [i915]
> >> [283.406131]  ? finish_swait+0x80/0x80
> >> [283.406139]  intel_dp_aux_transfer+0xc5/0x2b0 [i915]
> >> [283.406218]  drm_dp_dpcd_access+0x79/0x130 [drm_display_helper]
> >> [283.406227]  drm_dp_dpcd_read+0xe2/0xf0 [drm_display_helper]
> >> [283.406233]  intel_dp_hpd_pulse+0x134/0x570 [i915]
> >> [283.406308]  ? __down_killable+0x70/0x140
> >> [283.406313]  i915_digport_work_func+0xba/0x150 [i915]
> >>
> >> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> >> ---
> >> Hi All,
> >>
> >> I am not sure about changes in shutdown path, any comments welcome.
> >> I suspect suspend path have also some common bits, but I am little
> >> bit afraid of touching it.
> >>
> >> Changes:
> >> v1 - v6:
> >>      - chasing the bug appearing only on public CI.
> >> v7:
> >>      - shutdown path adjusted (suggested by Jani)
> >>
> >> Regards
> >> Andrzej
> >> ---
> >>   drivers/gpu/drm/i915/display/intel_display.c | 11 ++++-------
> >>   drivers/gpu/drm/i915/i915_driver.c           |  5 ++---
> >>   2 files changed, 6 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> >> index 186b37925d23f2..f9952ee8289fb2 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >> @@ -10490,13 +10490,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
> >>   	 */
> >>   	intel_hpd_poll_fini(i915);
> >>   
> >> -	/*
> >> -	 * MST topology needs to be suspended so we don't have any calls to
> >> -	 * fbdev after it's finalized. MST will be destroyed later as part of
> >> -	 * drm_mode_config_cleanup()
> >> -	 */
> >> -	intel_dp_mst_suspend(i915);
> >> -
> >>   	/* poll work can call into fbdev, hence clean that up afterwards */
> >>   	intel_fbdev_fini(i915);
> >>   
> >> @@ -10588,6 +10581,10 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
> >>   	if (!HAS_DISPLAY(i915))
> >>   		return;
> >>   
> >> +	intel_dp_mst_suspend(i915);
> >> +	intel_hpd_cancel_work(i915);
> >> +	drm_kms_helper_poll_disable(&i915->drm);
> >> +
> >>   	intel_fbdev_unregister(i915);
> >>   	intel_audio_deinit(i915);
> >>   
> >> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> >> index d26dcca7e654aa..82cdccf072e2bc 100644
> >> --- a/drivers/gpu/drm/i915/i915_driver.c
> >> +++ b/drivers/gpu/drm/i915/i915_driver.c
> >> @@ -1070,15 +1070,14 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
> >>   	i915_gem_suspend(i915);
> >>   
> >>   	if (HAS_DISPLAY(i915)) {
> >> +		intel_dp_mst_suspend(i915);
> >> +		intel_hpd_cancel_work(i915);
> >>   		drm_kms_helper_poll_disable(&i915->drm);
> >>   
> >>   		drm_atomic_helper_shutdown(&i915->drm);
> > 
> > You can't suspend MST before this since this is what actually turns the
> > displays off.
> > 
> > The real chicken and egg sitaation is due to MST sideband depending
> > on HPD_IRQs to work, but we want to stop the rest of hotplug processing
> > before we shut down the displays to make sure fbdev/etc. doesn't light
> > them back up.
> > 
> > If we didn't have MST sidband we could just turn off hotplug interrupts
> > ahead of time and flush the works, but with MST we need to keep the
> > interrupts alive. So I suspect we need some kind of flag to indicate
> > that at least full hotplug handling should not happen even though the
> > hotplug interrupts are still enabled.
> 
> 
> Thanks for explanation.
> As usual, reality is more complicated than expectations :)
> I was wondering about HPD during removal/shutdown/suspend.
> - HPD-plug should be ignored.
> - HPD-unplug probably should be handled - to avoid possible attempts to 
> communicate to non-exisitng sinks.
> So maybe at the beginning of removal/shutdown and maybe suspend we could 
> perform kind of cold HPD-unplug? What do you think?

Talking to non-existing sinks is perfectly normal. Happens every time
you pulle the cable out.

-- 
Ville Syrjälä
Intel
