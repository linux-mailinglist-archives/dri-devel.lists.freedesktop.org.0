Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMyYGO9UpWnR9AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:14:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B921D55E6
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BDF10E46A;
	Mon,  2 Mar 2026 09:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWnG5Ohm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3E110E468;
 Mon,  2 Mar 2026 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772442859; x=1803978859;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RtwfrFeXBw7geJ5yg80jY4SyPRCqf59bPMWFOwQudjM=;
 b=BWnG5OhmRjD32UY7qMxUMo1DW+fXAgrHSItWlQ1tUKTJpaJ7xaee3ogM
 k4S+B0WNLtiMoAYflbR1aShgEoqVH4YkLiKJiEPnQor1f6nWYl3inr1vg
 h/nZE/g97Z3I75wSAXBjQqfLJ5NHUJkM7q86LkbqXQOcwwZjRZ196spKp
 nXcNHQ/DjxhnomDl8n0nqXJm8mX51lqzW/yCNoFs5CR7Jkdg9QNt7ZXjp
 7rSMblT3PR0Op/lsURgaR6c7odKyN6wxTS2LSSGpH480IVET7RRm6CCpX
 +PauCKN9tS/Gru1S9XRrW+/fP8K1d6jZY2lx61kFejZ0U0otCJARgXmAp g==;
X-CSE-ConnectionGUID: /PR5qStZSjSvpzsebid4UA==
X-CSE-MsgGUID: F08ARKZDRCiqhGM7poLC9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72471492"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="72471492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:14:19 -0800
X-CSE-ConnectionGUID: V1+4rJOOTUizWJX3sjTvsg==
X-CSE-MsgGUID: UJISbN7eTKW3MJshlhNzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217705811"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:14:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tao Liu <ltao@redhat.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Liu <ltao@redhat.com>
Subject: Re: [PATCH] i915: Fix NULL pointer dereference in
 intel_dmc_update_dc6_allowed_count()
In-Reply-To: <20260228130946.50919-2-ltao@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260228130946.50919-2-ltao@redhat.com>
Date: Mon, 02 Mar 2026 11:14:11 +0200
Message-ID: <31690b028081ba72ca9babf2d09417376e10f2f1@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 13B921D55E6
X-Rspamd-Action: no action

On Sun, 01 Mar 2026, Tao Liu <ltao@redhat.com> wrote:
> There is a NULL pointer dereference issue noticed in i915 when 2nd kernel
> bootup during kdump. This will panic 2nd kernel and lead to no vmcore
> generation. The issue is observed in Meteorlake CPU(cpuid: 0xA06A2):

The previously posted fix is [1].

Imre, please R-b that. It's a NULL pointer dereference in the wild, in
stable kernels. We need to get it fixed instead of bikeshedding on
potential incorrect debugfs results.

BR,
Jani.


[1] https://lore.kernel.org/r/20251202183950.2450315-1-jani.nikula@intel.com


>
>     BUG: kernel NULL pointer dereference, address: 0000000000000000
>     #PF: supervisor read access in kernel mode
>     #PF: error_code(0x0000) - not-present page
>     PGD 0 P4D 0
>     Oops: Oops: 0000 [#1] SMP NOPTI
>     ...
>     RIP: 0010:intel_dmc_update_dc6_allowed_count+0x16/0xa0 [i915]
>     ...
>
> It is easy to locate the NULL pointer dereference by disassembly:
>
>     00000000001171e0 <intel_dmc_update_dc6_allowed_count>:
>       1171e0:       f3 0f 1e fa             endbr64
>       1171e4:       e8 00 00 00 00          call   1171e9
>       1171e9:       41 55                   push   %r13
>       1171eb:       41 54                   push   %r12
>       1171ed:       55                      push   %rbp
>       1171ee:       53                      push   %rbx
>       1171ef:       4c 8b a7 18 03 00 00    mov    0x318(%rdi),%r12
>       1171f6:       49 8b 2c 24             mov    (%r12),%rbp
>
> To fix this, add a NULL pointer check before dereferencing.
>
> Signed-off-by: Tao Liu <ltao@redhat.com>
> ---
>
> The issue doesn't happen in 1st kernel, but in 2nd kernel of kdump. I'm not
> an expert to i915 and unsure what lead to the NULL pointer. To help further
> analysis, here is the full stack:
>
> [    8.608520]  <TASK> 
> [    8.610652]  gen9_set_dc_state.part.0+0x25d/0x2f0 [i915] 
> [    8.616096]  icl_display_core_init+0x2d/0x620 [i915] 
> [    8.621266]  intel_power_domains_init_hw+0x1b2/0x500 [i915] 
> [    8.627047]  intel_display_driver_probe_noirq+0x87/0x300 [i915] 
> [    8.633188]  i915_driver_probe+0x207/0x5d0 [i915] 
> [    8.637977]  ? drm_privacy_screen_get+0x198/0x1c0 
> [    8.642832]  local_pci_probe+0x41/0x90 
> [    8.646646]  pci_call_probe+0x58/0x160 
> [    8.650458]  ? pci_assign_irq+0x2f/0x160 
> [    8.654447]  ? pci_match_device+0xf8/0x120 
> [    8.658522]  pci_device_probe+0x95/0x140 
> [    8.662582]  call_driver_probe+0x27/0x110 
> [    8.666570]  really_probe+0xcc/0x2c0 
> [    8.670190]  __driver_probe_device+0x78/0x120 
> [    8.674692]  driver_probe_device+0x1f/0xa0 
> [    8.678857]  __driver_attach+0xfa/0x230 
> [    8.682757]  ? __pfx___driver_attach+0x10/0x10 
> [    8.687185]  bus_for_each_dev+0x8e/0xe0 
> [    8.691159]  bus_add_driver+0x11f/0x200 
> [    8.694970]  driver_register+0x72/0xd0 
> [    8.698853]  i915_init+0x26/0x90 [i915] 
> [    8.702837]  ? __pfx_i915_init+0x10/0x10 [i915] 
> [    8.707433]  do_one_initcall+0x5c/0x320 
> [    8.711409]  do_init_module+0x60/0x240 
> [    8.715132]  init_module_from_file+0xd6/0x130 
> [    8.719634]  idempotent_init_module+0x114/0x310 
> [    8.724241]  __x64_sys_finit_module+0x71/0xe0 
> [    8.728671]  do_syscall_64+0x11b/0x6d0 
> [    8.732483]  ? ksys_read+0x6b/0xe0 
> [    8.735854]  ? arch_exit_to_user_mode_prepare.isra.0+0xa2/0xd0 
> [    8.741768]  ? do_syscall_64+0x153/0x6d0 
> [    8.745828]  ? do_syscall_64+0x153/0x6d0 
> [    8.749814]  ? do_syscall_64+0x153/0x6d0 
> [    8.753800]  ? clear_bhb_loop+0x30/0x80 
> [    8.757700]  entry_SYSCALL_64_after_hwframe+0x76/0x7e 
>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 1006b060c3f3..fd2756badc0c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1578,7 +1578,7 @@ void intel_dmc_update_dc6_allowed_count(struct intel_display *display,
>  	struct intel_dmc *dmc = display_to_dmc(display);
>  	u32 dc5_cur_count;
>  
> -	if (DISPLAY_VER(dmc->display) < 14)
> +	if (!dmc || DISPLAY_VER(dmc->display) < 14)
>  		return;
>  
>  	dc5_cur_count = intel_de_read(dmc->display, DG1_DMC_DEBUG_DC5_COUNT);

-- 
Jani Nikula, Intel
