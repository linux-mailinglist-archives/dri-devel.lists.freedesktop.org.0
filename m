Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB2824E14
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 06:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DE510E0D2;
	Fri,  5 Jan 2024 05:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id C40E310E0D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 05:24:30 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 6AB1D20B3CC1; Thu,  4 Jan 2024 21:24:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6AB1D20B3CC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1704432270;
 bh=i9p4ncg9Brn8XRFAl2ebtIWJfmFAwavSXtUfG7JjPz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NFDo9Ys9Tsuf9cnE2Dh/w0MU27pZ3FU+2gFb61CyO4uO7TheFN3vPIZ6OTgwOp9lw
 B4P2HrnF8PiF7ZlHPZvQIp8Bz70c89xrDQKtKbcmXHfFDfvHalBWV8EZBsXS2N86NV
 6ItdveKNxFLzDmOcn4nsEWUiVjAAzj9z7QeT6RXI=
Date: Thu, 4 Jan 2024 21:24:30 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Subject: Re: [PATCH] drm: Check output polling initialized before disabling
Message-ID: <20240105052430.GA16186@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1703662035-1373-1-git-send-email-shradhagupta@linux.microsoft.com>
 <20231227103317.GA25288@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20240105051942.GA14650@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105051942.GA14650@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>, dri-devel@lists.freedesktop.org,
 Shradha Gupta <shradhagupta@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 09:19:42PM -0800, Shradha Gupta wrote:
> On Wed, Dec 27, 2023 at 02:33:17AM -0800, Saurabh Singh Sengar wrote:
> > On Tue, Dec 26, 2023 at 11:27:15PM -0800, Shradha Gupta wrote:
> > > In drm_mode_config_helper_suspend() check if output polling
> > > support is initialized before enabling/disabling polling.
> > > For drivers like hyperv-drm, that do not initialize connector
> > > polling, if suspend is called without this check, it leads to
> > > suspend failure with following stack
> > > 
> > > [  770.719392] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > [  770.720592] printk: Suspending console(s) (use no_console_suspend to debug)
> > > [  770.948823] ------------[ cut here ]------------
> > > [  770.948824] WARNING: CPU: 1 PID: 17197 at kernel/workqueue.c:3162 __flush_work.isra.0+0x212/0x230
> > > [  770.948831] Modules linked in: rfkill nft_counter xt_conntrack xt_owner udf nft_compat crc_itu_t nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink vfat fat mlx5_ib ib_uverbs ib_core mlx5_core intel_rapl_msr intel_rapl_common kvm_amd ccp mlxfw kvm psample hyperv_drm tls drm_shmem_helper drm_kms_helper irqbypass pcspkr syscopyarea sysfillrect sysimgblt hv_balloon hv_utils joydev drm fuse xfs libcrc32c pci_hyperv pci_hyperv_intf sr_mod sd_mod cdrom t10_pi sg hv_storvsc scsi_transport_fc hv_netvsc serio_raw hyperv_keyboard hid_hyperv crct10dif_pclmul crc32_pclmul crc32c_intel hv_vmbus ghash_clmulni_intel dm_mirror dm_region_hash dm_log dm_mod
> > > [  770.948863] CPU: 1 PID: 17197 Comm: systemd-sleep Not tainted 5.14.0-362.2.1.el9_3.x86_64 #1
> > > [  770.948865] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 05/09/2022
> > > [  770.948866] RIP: 0010:__flush_work.isra.0+0x212/0x230
> > > [  770.948869] Code: 8b 4d 00 4c 8b 45 08 89 ca 48 c1 e9 04 83 e2 08 83 e1 0f 83 ca 02 89 c8 48 0f ba 6d 00 03 e9 25 ff ff ff 0f 0b e9 4e ff ff ff <0f> 0b 45 31 ed e9 44 ff ff ff e8 8f 89 b2 00 66 66 2e 0f 1f 84 00
> > > [  770.948870] RSP: 0018:ffffaf4ac213fb10 EFLAGS: 00010246
> > > [  770.948871] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8c992857
> > > [  770.948872] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff9aad82b00330
> > > [  770.948873] RBP: ffff9aad82b00330 R08: 0000000000000000 R09: ffff9aad87ee3d10
> > > [  770.948874] R10: 0000000000000200 R11: 0000000000000000 R12: ffff9aad82b00330
> > > [  770.948874] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
> > > [  770.948875] FS:  00007ff1b2f6bb40(0000) GS:ffff9aaf37d00000(0000) knlGS:0000000000000000
> > > [  770.948878] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  770.948878] CR2: 0000555f345cb666 CR3: 00000001462dc005 CR4: 0000000000370ee0
> > > [  770.948879] Call Trace:
> > > [  770.948880]  <TASK>
> > > [  770.948881]  ? show_trace_log_lvl+0x1c4/0x2df
> > > [  770.948884]  ? show_trace_log_lvl+0x1c4/0x2df
> > > [  770.948886]  ? __cancel_work_timer+0x103/0x190
> > > [  770.948887]  ? __flush_work.isra.0+0x212/0x230
> > > [  770.948889]  ? __warn+0x81/0x110
> > > [  770.948891]  ? __flush_work.isra.0+0x212/0x230
> > > [  770.948892]  ? report_bug+0x10a/0x140
> > > [  770.948895]  ? handle_bug+0x3c/0x70
> > > [  770.948898]  ? exc_invalid_op+0x14/0x70
> > > [  770.948899]  ? asm_exc_invalid_op+0x16/0x20
> > > [  770.948903]  ? __flush_work.isra.0+0x212/0x230
> > > [  770.948905]  __cancel_work_timer+0x103/0x190
> > > [  770.948907]  ? _raw_spin_unlock_irqrestore+0xa/0x30
> > > [  770.948910]  drm_kms_helper_poll_disable+0x1e/0x40 [drm_kms_helper]
> > > [  770.948923]  drm_mode_config_helper_suspend+0x1c/0x80 [drm_kms_helper]
> > > [  770.948933]  ? __pfx_vmbus_suspend+0x10/0x10 [hv_vmbus]
> > > [  770.948942]  hyperv_vmbus_suspend+0x17/0x40 [hyperv_drm]
> > > [  770.948944]  ? __pfx_vmbus_suspend+0x10/0x10 [hv_vmbus]
> > > [  770.948951]  dpm_run_callback+0x4c/0x140
> > > [  770.948954]  __device_suspend_noirq+0x74/0x220
> > > [  770.948956]  dpm_noirq_suspend_devices+0x148/0x2a0
> > > [  770.948958]  dpm_suspend_end+0x54/0xe0
> > > [  770.948960]  create_image+0x14/0x290
> > > [  770.948963]  hibernation_snapshot+0xd6/0x200
> > > [  770.948964]  hibernate.cold+0x8b/0x1fb
> > > [  770.948967]  state_store+0xcd/0xd0
> > > [  770.948969]  kernfs_fop_write_iter+0x124/0x1b0
> > > [  770.948973]  new_sync_write+0xff/0x190
> > > [  770.948976]  vfs_write+0x1ef/0x280
> > > [  770.948978]  ksys_write+0x5f/0xe0
> > > [  770.948979]  do_syscall_64+0x5c/0x90
> > > [  770.948981]  ? syscall_exit_work+0x103/0x130
> > > [  770.948983]  ? syscall_exit_to_user_mode+0x12/0x30
> > > [  770.948985]  ? do_syscall_64+0x69/0x90
> > > [  770.948986]  ? do_syscall_64+0x69/0x90
> > > [  770.948987]  ? do_user_addr_fault+0x1d6/0x6a0
> > > [  770.948989]  ? do_syscall_64+0x69/0x90
> > > [  770.948990]  ? exc_page_fault+0x62/0x150
> > > [  770.948992]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > > [  770.948995] RIP: 0033:0x7ff1b293eba7
> > > [  770.949010] Code: 0b 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> > > [  770.949011] RSP: 002b:00007ffde3912128 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> > > [  770.949012] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007ff1b293eba7
> > > [  770.949013] RDX: 0000000000000005 RSI: 00007ffde3912210 RDI: 0000000000000004
> > > [  770.949014] RBP: 00007ffde3912210 R08: 000055d7dd4c9510 R09: 00007ff1b29b14e0
> > > [  770.949014] R10: 00007ff1b29b13e0 R11: 0000000000000246 R12: 0000000000000005
> > > [  770.949015] R13: 000055d7dd4c53e0 R14: 0000000000000005 R15: 00007ff1b29f69e0
> > > [  770.949016]  </TASK>
> > > [  770.949017] ---[ end trace e6fa0618bfa2f31d ]---
> > > 
> > > Built-on: Rhel9, Ubuntu22
> > > Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
> > > ---
> > >  drivers/gpu/drm/drm_modeset_helper.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> > > index f858dfedf2cf..ac8ce709e3c1 100644
> > > --- a/drivers/gpu/drm/drm_modeset_helper.c
> > > +++ b/drivers/gpu/drm/drm_modeset_helper.c
> > > @@ -194,12 +194,17 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
> > >  	if (!dev)
> > >  		return 0;
> > >  
> > > -	drm_kms_helper_poll_disable(dev);
> > > +	if (dev->mode_config.poll_enabled)
> > > +		drm_kms_helper_poll_disable(dev);
> > > +
> > >  	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 1);
> > >  	state = drm_atomic_helper_suspend(dev);
> > >  	if (IS_ERR(state)) {
> > >  		drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
> > > -		drm_kms_helper_poll_enable(dev);
> > > +
> > > +		if (dev->mode_config.poll_enabled)
> > > +			drm_kms_helper_poll_enable(dev);
> > 
> > This can be avoided as drm_kms_helper_poll_enable already check for
> > dev->mode_config.poll_enabled.
> Sure, I agree, This check can be skipped. Thanks
> > Further I was thinking may be we can add a similar check in
> > drm_kms_helper_poll_disable but, there is already a function
> > drm_kms_helper_poll_fini which does something similar. May be worth
> > using it instead of drm_kms_helper_poll_disable ?
> If we use drm_kms_helper_poll_fini in suspend, we will have to replace
> the drm_kms_helper_poll_enable in resume call with
> drm_kms_helper_poll_init that would add initialization of work in the
> resume path. I feel it would be better if I move the poll_enabled and
> poll_running checks in the drm_kms_helper_poll_disable call (also maintains
> parity with checks in drm_kms_helper_poll_enable checks). Thought?

Sounds good to me. Would like to see what DRM maintainers think of it.

- Saurabh

> > 
> > Moreover I see the below comments in description of
> > drm_kms_helper_poll_disable. Apparently which is not true. Possibly
> > Daniel or other DRM maintainers can share their opinion on this
> > comment if it can be taken out.
> > "
> >  * Drivers can call this helper from their device suspend implementation. It is
> >  * not an error to call this even when output polling isn't enabled or already
> >  * disabled. 
> > "
> Right, this needs to be corrected. Will update this in the next version
> > 
> > - Saurabh
> > 
> > > +
> > >  		return PTR_ERR(state);
> > >  	}
> > >  
> > > -- 
> > > 2.34.1
