Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE5425348
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 14:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941D56F45F;
	Thu,  7 Oct 2021 12:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF8C6F45F;
 Thu,  7 Oct 2021 12:38:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="223636873"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="223636873"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 05:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="439513897"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 07 Oct 2021 05:38:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 15:38:46 +0300
Date: Thu, 7 Oct 2021 15:38:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Johannes Stezenbach <js@sig21.net>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [bisected] suspend broken by DRM fbdev name change
 on i915 IVB
Message-ID: <YV7qVorGtO5NHKkC@intel.com>
References: <YV6hBl5ybMxm5Dln@sig21.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YV6hBl5ybMxm5Dln@sig21.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 07, 2021 at 09:25:58AM +0200, Johannes Stezenbach wrote:
> Hi,
> 
> yesterday I updated the kernel from 5.13.7 to 5.14.9 and found
> it broke suspend-to-RAM. The machine displays a few messages on
> text console after resume but hangs when switching to X11.
> 
> The hardware: Asus P8H77-V with Intel Core i5-3550 CPU,
> display connected via DP.
> 
>   DP1 connected primary 1920x1200+0+0 (normal left inverted right x axis y axis) 520mm x 320mm
>      1920x1200     59.95*+
> 
> I bisected it and the offending commit is the totally unlikely
> and innocent looking
> 
>   commit b3484d2b03e4c940a9598aa841a52d69729c582a
>   Author: Javier Martinez Canillas <javierm@redhat.com>
>   Date:   Tue May 25 17:13:13 2021 +0200
> 
>     drm/fb-helper: improve DRM fbdev emulation device names
> 
> Now I'm running 5.14.9 with this commit reverted and
> suspend works.
> 
> In /var/log/kern.log I found this on suspend:
> 
> [   34.002252][ T3455] ------------[ cut here ]------------
> [   34.002256][ T3455] i915 0000:00:02.0: drm_WARN_ON((intel_de_read(dev_priv, intel_dp->output_reg) & (1 << 31)) == 0)
> [   34.002274][ T3455] WARNING: CPU: 0 PID: 3455 at drivers/gpu/drm/i915/display/g4x_dp.c:431 intel_dp_link_down.isra.0+0x2e7/0x390
> [   34.002285][ T3455] Modules linked in: kvm_intel kvm irqbypass ehci_pci xhci_pci ehci_hcd xhci_hcd
> [   34.002304][ T3455] CPU: 0 PID: 3455 Comm: kworker/u8:27 Not tainted 5.14.9 #29
> [   34.002309][ T3455] Hardware name: System manufacturer System Product Name/P8H77-V, BIOS 1905 10/27/2014
> [   34.002312][ T3455] Workqueue: events_unbound async_run_entry_fn
> [   34.002320][ T3455] RIP: 0010:intel_dp_link_down.isra.0+0x2e7/0x390
> [   34.002326][ T3455] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 d2 19 05 00 48 c7 c1 e8 53 8c 88 4c 89 e2 48 c7 c7 7b 83 89 88 48 89 c6 e8 d1 d0 52 00 <0f> 0b 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 49 8b 7d 08 4c
> [   34.002330][ T3455] RSP: 0018:ffffaa1dc1be3a88 EFLAGS: 00010282
> [   34.002335][ T3455] RAX: 0000000000000000 RBX: ffffa15a45f28000 RCX: 0000000000000000
> [   34.002338][ T3455] RDX: 0000000000000001 RSI: ffffffff8714af2f RDI: ffffffff8714af2f
> [   34.002341][ T3455] RBP: 0000000080180344 R08: 00000007eab15173 R09: 0000000000000001
> [   34.002344][ T3455] R10: 0000000000080000 R11: 0000000000000000 R12: ffffa15a40f87180
> [   34.002347][ T3455] R13: ffffa15a464e0000 R14: ffffa15a593c6000 R15: 0000000000000001
> [   34.002350][ T3455] FS:  0000000000000000(0000) GS:ffffa15d4f800000(0000) knlGS:0000000000000000
> [   34.002354][ T3455] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   34.002357][ T3455] CR2: 000056000d53cf60 CR3: 000000015fa2a006 CR4: 00000000001706f0
> [   34.002361][ T3455] Call Trace:
> [   34.002373][ T3455]  g4x_post_disable_dp+0x2e/0x110
> [   34.002380][ T3455]  intel_encoders_post_disable+0x73/0x80
> [   34.002391][ T3455]  ilk_crtc_disable+0x96/0x3a0
> [   34.002402][ T3455]  intel_old_crtc_state_disables+0x5c/0x110
> [   34.002412][ T3455]  intel_atomic_commit_tail+0xdcc/0x1410
> [   34.002434][ T3455]  intel_atomic_commit+0x332/0x3b0
> [   34.002443][ T3455]  drm_atomic_helper_disable_all+0x175/0x190
> [   34.002453][ T3455]  drm_atomic_helper_suspend+0xa6/0x200
> [   34.002474][ T3455]  intel_display_suspend+0x23/0x50
> [   34.002480][ T3455]  i915_drm_suspend+0x42/0xe0
> [   34.002488][ T3455]  pci_pm_suspend+0x74/0x160
> [   34.002496][ T3455]  ? pci_pm_freeze+0xb0/0xb0
> [   34.002500][ T3455]  dpm_run_callback+0x6f/0x170
> [   34.002512][ T3455]  __device_suspend+0x110/0x4b0
> [   34.002521][ T3455]  async_suspend+0x1b/0x90
> [   34.002529][ T3455]  async_run_entry_fn+0x2e/0x110
> [   34.002535][ T3455]  process_one_work+0x2c9/0x550
> [   34.002551][ T3455]  worker_thread+0x4f/0x3e0
> [   34.002556][ T3455]  ? rescuer_thread+0x340/0x340
> [   34.002563][ T3455]  kthread+0x14a/0x170
> [   34.002569][ T3455]  ? set_kthread_struct+0x40/0x40
> [   34.002578][ T3455]  ret_from_fork+0x22/0x30
> [   34.002600][ T3455] ---[ end trace 2058ff589e8cbd78 ]---
> 
> and after resume:
> 
> [   44.513409][    C0] i915 0000:00:02.0: [drm] *ERROR* uncleared pch fifo underrun on pch transcoder A
> [   44.514557][    C0] i915 0000:00:02.0: [drm] *ERROR* PCH transcoder A FIFO underrun
> [   54.997256][ T3520] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:45:pipe A] flip_done timed out
> 
> 
> Scratching my head about it I found one hint in
> /usr/lib/pm-utils/sleep.d/98video-quirk-db-handler:
> 
>  using_kms() { grep -q -E '(nouveau|drm)fb' /proc/fb; }
> 
> So the ABI change in /proc/fb causes the pm-utils scripts to
> skip the --quirk-no-chvt and apply other quirks,
> /var/log/pm-suspend.log says:

Nasty. This pm-utils quirk stuff really has no business existing IMO,
and so I recommend nuking pm-utils from your system as soon as possible.
Back when I still had it on my machines (due to some silly dependency
I think), I just created empty override files in /etc/pm/ to permanently
disable all the quirks.

But as long people might be using it I guess we need some kind of
revert/fix to put the "drmfb" back into the name. Javier?

-- 
Ville Syrjälä
Intel
