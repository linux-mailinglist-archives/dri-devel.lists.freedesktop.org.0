Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8468C56D48
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ADD10E345;
	Thu, 13 Nov 2025 10:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0FKEHiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5B10E179;
 Thu, 13 Nov 2025 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763029619; x=1794565619;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wgBi8c+U/98U2wSjzClD/VctfdhGL//tIxEiATrxW2Y=;
 b=a0FKEHiA0KHW1/aDHbFL/bEa0rwaDV7VE6FJZKDwOCd5w9JvHAVGzo/M
 jNGylFPGORzN2u7tqzVhDLvhH5NZthOK40abNTFJ0s2U8Hyq+slAlEOns
 2CAQDJDfy99Y6LjkG6hsNEvnwB0u5OHl/jdK32lzLYtbTrmcGblQ66ZsC
 PBrivDXXjeOr5Wi5P3SfxKBiSm9LkXiDCB5UcDjUPQmysjv9ywbfLdQcG
 fVWbkzJe+QqEnD6Z2pF1SeNo5zLY6CpyUxlAoM5oHJ+xbl3LLqh5oHMg2
 S/I3kOqLXAc8sqKEVNPYHaWH4SjU6DcXRr1QyR8oJMlLrQR9E7l8fxIK+ w==;
X-CSE-ConnectionGUID: Dzjxh3JOQ5ukwFUu8yglwA==
X-CSE-MsgGUID: k9yGSjsPTK2MCSH7qHXCJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68955990"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="68955990"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:26:59 -0800
X-CSE-ConnectionGUID: BPfAXXCzQkCUWHhGR9FgXw==
X-CSE-MsgGUID: znLSp8QkRTCur4ez9wGpIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189900667"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:26:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
In-Reply-To: <DM3PPF208195D8D7C8C263E115ABED5A500E3CDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <c47f1221281e998f53169ffd0a2e06b301bb1605@intel.com>
 <DM3PPF208195D8D7C8C263E115ABED5A500E3CDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Thu, 13 Nov 2025 12:26:53 +0200
Message-ID: <b2b7c5cbec76955ffdcc0a7ebf6cd83ad67e8b04@intel.com>
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

On Thu, 13 Nov 2025, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> .deak@intel.com>; Kandpal,
>> Suraj <suraj.kandpal@intel.com>
>> Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
>> 
>> On Thu, 13 Nov 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> > When releasing a timeslot there is a slight chance we may end up with
>> > the wrong payload mask due to overflow if the delayed_destroy_work
>> > ends up coming into play after a DP 2.1 monitor gets disconnected
>> > which causes vcpi to become 0 then we try to make the payload =
>> > ~BIT(vcpi - 1) which is a negative shift.
>> 
>> Is that a real scenario or a hypothetical one?
>> 
>
> This is a real scenario which ends up throwing the below error
> <7> [515.287237] xe 0000:03:00.0: [drm:drm_dp_mst_get_port_malloc [drm_display_helper]] port ffff888126ce9000 (3)
> <4> [515.287267] -----------[ cut here ]-----------
> <3> [515.287268] UBSAN: shift-out-of-bounds in ../drivers/gpu/drm/display/drm_dp_mst_topology.c:4575:36
> <3> [515.287271] shift exponent -1 is negative
> <4> [515.287275] CPU: 7 UID: 0 PID: 3108 Comm: kworker/u64:33 Tainted: G S U 6.17.0-rc6-lgci-xe-xe-3795-3e79699fa1b216e92+ #1 PREEMPT(voluntary)
> <4> [515.287279] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
> <4> [515.287279] Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 1645 03/15/2024
> <4> [515.287281] Workqueue: drm_dp_mst_wq drm_dp_delayed_destroy_work [drm_display_helper]
> <4> [515.287303] Call Trace:
> <4> [515.287304] <TASK>
> <4> [515.287306] dump_stack_lvl+0xc1/0xf0
> <4> [515.287313] dump_stack+0x10/0x20
> <4> [515.287316] __ubsan_handle_shift_out_of_bounds+0x133/0x2e0
> <4> [515.287324] ? drm_atomic_get_private_obj_state+0x186/0x1d0
> <4> [515.287333] drm_dp_atomic_release_time_slots.cold+0x17/0x3d [drm_display_helper]
> <4> [515.287355] mst_connector_atomic_check+0x159/0x180 [xe]
> <4> [515.287546] drm_atomic_helper_check_modeset+0x4d9/0xfa0
> <4> [515.287550] ? __ww_mutex_lock.constprop.0+0x6f/0x1a60
> <4> [515.287562] intel_atomic_check+0x119/0x2b80 [xe]
> <4> [515.287740] ? find_held_lock+0x31/0x90
> <4> [515.287747] ? lock_release+0xce/0x2a0
> <4> [515.287754] drm_atomic_check_only+0x6a2/0xb40
> <4> [515.287758] ? drm_atomic_add_affected_connectors+0x12b/0x140
> <4> [515.287765] drm_atomic_commit+0x6e/0xf0
> <4> [515.287766] ? _pfx__drm_printfn_info+0x10/0x10
> <4> [515.287774] drm_client_modeset_commit_atomic+0x25c/0x2b0
> <4> [515.287794] drm_client_modeset_commit_locked+0x60/0x1b0
> <4> [515.287795] ? mutex_lock_nested+0x1b/0x30
> <4> [515.287801] drm_client_modeset_commit+0x26/0x50
> <4> [515.287804] __drm_fb_helper_restore_fbdev_mode_unlocked+0xdc/0x110
> <4> [515.287810] drm_fb_helper_hotplug_event+0x120/0x140
> <4> [515.287814] drm_fbdev_client_hotplug+0x28/0xd0
> <4> [515.287819] drm_client_hotplug+0x6c/0xf0
> <4> [515.287824] drm_client_dev_hotplug+0x9e/0xd0
> <4> [515.287829] drm_kms_helper_hotplug_event+0x1a/0x30
> <4> [515.287834] drm_dp_delayed_destroy_work+0x3df/0x410 [drm_display_helper]
> <4> [515.287861] process_one_work+0x22b/0x6f0
> <4> [515.287874] worker_thread+0x1e8/0x3d0
> <4> [515.287879] ? __pfx_worker_thread+0x10/0x10
> <4> [515.287882] kthread+0x11c/0x250
> <4> [515.287886] ? __pfx_kthread+0x10/0x10
> <4> [515.287890] ret_from_fork+0x2d7/0x310
> <4> [515.287894] ? __pfx_kthread+0x10/0x10
> <4> [515.287897] ret_from_fork_asm+0x1a/0x30
>
> Refer to gitlab xe issue:  6303

Both the backtrace and the gitlab reference should be part of the commit
message...

>
> Regards,
> Suraj Kandpal
>
>> >
>> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> > ---
>> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > index 64e5c176d5cc..3cf1eafcfcb5 100644
>> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
>> drm_atomic_state *state,
>> >  	struct drm_dp_mst_atomic_payload *payload;
>> >  	struct drm_connector_state *old_conn_state, *new_conn_state;
>> >  	bool update_payload = true;
>> > +	int bit;
>> >
>> >  	old_conn_state = drm_atomic_get_old_connector_state(state, port-
>> >connector);
>> >  	if (!old_conn_state->crtc)
>> > @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
>> drm_atomic_state *state,
>> >  	if (!payload->delete) {
>> >  		payload->pbn = 0;
>> >  		payload->delete = true;
>> > -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
>> > +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
>> > +		topology_state->payload_mask &= ~BIT(bit);
>> >  	}
>> >
>> >  	return 0;
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
