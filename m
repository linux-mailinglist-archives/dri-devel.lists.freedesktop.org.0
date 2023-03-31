Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 926946D2BB5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 01:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FE410F34B;
	Fri, 31 Mar 2023 23:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79410F34B;
 Fri, 31 Mar 2023 23:30:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89AF262C8C;
 Fri, 31 Mar 2023 23:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0707AC433EF;
 Fri, 31 Mar 2023 23:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680305440;
 bh=rztUcqlYcdZaRzLY5VUrM4dmO5NewoOi9N88PCpBK3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jK3TlWReKZ22CyVeRauW6VBW4zWzqkJiBnWSQsYej+IQ/ojiECyqB6zB+ZayUIeB7
 UtCmzbXc43YjOZ/DCBvznOtCwadsRaE7/7BPa24a1a38rnilsD8sO5WJCHXTnnBzqh
 O849SgCBL0P5jgthjVyCJME5fL3vPLiarqeSKFXFjE6vDYK6R0EDGanjwVNJ6lYZ5L
 ROBPOR0jKmf/k0+u1UbZ6BHNB6IrQ8SEQOQin+QBculyqT69SddOE3aS+1MmJ+6i8+
 crLyumWDEz9MMji6OFspDjmr4nF/fMFjiBT9GalqAnCarnSuILStJTA6bG8ZxQVOjv
 Ih2Hgg0Yj8u/Q==
Date: Fri, 31 Mar 2023 16:30:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v10 11/15] drm/atomic-helper: Set fence deadline for vblank
Message-ID: <20230331233037.GA2443175@dev-arch.thelio-3990X>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-12-robdclark@gmail.com>
 <20230331204412.GA396777@dev-arch.thelio-3990X>
 <CAF6AEGtDbSDNBBdONQ6YubZDaKMpDQ-BJx5mP+aGw4uy9qbXDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtDbSDNBBdONQ6YubZDaKMpDQ-BJx5mP+aGw4uy9qbXDQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Luben Tuikov <luben.tuikov@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 03:14:30PM -0700, Rob Clark wrote:
> On Fri, Mar 31, 2023 at 1:44 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Rob,
> >
> > On Wed, Mar 08, 2023 at 07:53:02AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > For an atomic commit updating a single CRTC (ie. a pageflip) calculate
> > > the next vblank time, and inform the fence(s) of that deadline.
> > >
> > > v2: Comment typo fix (danvet)
> > > v3: If there are multiple CRTCs, consider the time of the soonest vblank
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > I apologize if this has already been reported or fixed, I searched lore
> > but did not find anything.
> >
> > This change as commit d39e48ca80c0 ("drm/atomic-helper: Set fence
> > deadline for vblank") in -next causes a hang while running LTP's
> > read_all test on /proc on my Ampere Altra system (it seems it is hanging
> > on a pagemap file?). Additionally, I have this splat in dmesg, which
> > seems related based on the call stack.
> 
> Hi, I'm not familiar with this hardware.. do you know which drm driver
> is used?  I can't tell from the call-stack.

I think it is drivers/gpu/drm/ast, as I see ast in lsmod?

> > [   20.542591] fbcon: Taking over console
> > [   20.550772] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000074
> > [   20.550776] Mem abort info:
> > [   20.550777]   ESR = 0x0000000096000004
> > [   20.550779]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [   20.550781]   SET = 0, FnV = 0
> > [   20.550782]   EA = 0, S1PTW = 0
> > [   20.550784]   FSC = 0x04: level 0 translation fault
> > [   20.550785] Data abort info:
> > [   20.550786]   ISV = 0, ISS = 0x00000004
> > [   20.550788]   CM = 0, WnR = 0
> > [   20.550789] user pgtable: 4k pages, 48-bit VAs, pgdp=0000080009d16000
> > [   20.550791] [0000000000000074] pgd=0000000000000000, p4d=0000000000000000
> > [   20.550796] Internal error: Oops: 0000000096000004 [#1] SMP
> > [   20.550800] Modules linked in: ip6table_nat tun nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink qrtr sunrpc binfmt_misc vfat fat xfs snd_usb_audio snd_hwdep snd_usbmidi_lib snd_seq snd_pcm snd_rawmidi snd_timer snd_seq_device snd soundcore joydev mc ipmi_ssif ipmi_devintf ipmi_msghandler arm_spe_pmu arm_cmn arm_dsu_pmu arm_dmc620_pmu cppc_cpufreq loop zram crct10dif_ce polyval_ce nvme polyval_generic ghash_ce sbsa_gwdt igb nvme_core ast nvme_common i2c_algo_bit xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multipath fuse
> > [   20.550869] CPU: 12 PID: 469 Comm: kworker/12:1 Not tainted 6.3.0-rc2-00008-gd39e48ca80c0 #1
> > [   20.550872] Hardware name: ADLINK AVA Developer Platform/AVA Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 09/08/2022
> > [   20.550875] Workqueue: events fbcon_register_existing_fbs
> > [   20.550884] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [   20.550888] pc : drm_crtc_next_vblank_start+0x2c/0x98
> > [   20.550894] lr : drm_atomic_helper_wait_for_fences+0x90/0x240
> > [   20.550898] sp : ffff80000d583960
> > [   20.550900] x29: ffff80000d583960 x28: ffff07ff8fc187b0 x27: 0000000000000000
> > [   20.550904] x26: ffff07ff99c08c00 x25: 0000000000000038 x24: ffff07ff99c0c000
> > [   20.550908] x23: 0000000000000001 x22: 0000000000000038 x21: 0000000000000000
> > [   20.550912] x20: ffff07ff9640a280 x19: 0000000000000000 x18: ffffffffffffffff
> > [   20.550915] x17: 0000000000000000 x16: ffffb24d2eece1c0 x15: 0000003038303178
> > [   20.550919] x14: 3032393100000048 x13: 0000000000000000 x12: 0000000000000000
> > [   20.550923] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffb24d2eeeaca0
> > [   20.550926] x8 : ffff80000d583628 x7 : 0000080077783000 x6 : 0000000000000000
> > [   20.550930] x5 : ffff80000d584000 x4 : ffff07ff99c0c000 x3 : 0000000000000130
> > [   20.550934] x2 : 0000000000000000 x1 : ffff80000d5839c0 x0 : ffff07ff99c0cc08
> > [   20.550937] Call trace:
> > [   20.550939]  drm_crtc_next_vblank_start+0x2c/0x98
> > [   20.550942]  drm_atomic_helper_wait_for_fences+0x90/0x240
> > [   20.550946]  drm_atomic_helper_commit+0xb0/0x188
> > [   20.550949]  drm_atomic_commit+0xb0/0xf0
> > [   20.550953]  drm_client_modeset_commit_atomic+0x218/0x280
> > [   20.550957]  drm_client_modeset_commit_locked+0x64/0x1a0
> > [   20.550961]  drm_client_modeset_commit+0x38/0x68
> > [   20.550965]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb0/0xf8
> > [   20.550970]  drm_fb_helper_set_par+0x44/0x88
> > [   20.550973]  fbcon_init+0x1e0/0x4a8
> > [   20.550976]  visual_init+0xbc/0x118
> > [   20.550981]  do_bind_con_driver.isra.0+0x194/0x3a0
> > [   20.550984]  do_take_over_console+0x50/0x70
> > [   20.550987]  do_fbcon_takeover+0x74/0xf8
> > [   20.550989]  do_fb_registered+0x13c/0x158
> > [   20.550992]  fbcon_register_existing_fbs+0x78/0xc0
> > [   20.550995]  process_one_work+0x1ec/0x478
> > [   20.551000]  worker_thread+0x74/0x418
> > [   20.551002]  kthread+0xec/0x100
> > [   20.551005]  ret_from_fork+0x10/0x20
> > [   20.551011] Code: f9400004 b9409013 f940a082 9ba30a73 (b9407662)
> > [   20.551013] ---[ end trace 0000000000000000 ]---
> >
> > If there is any additional information that I can provide or patches I
> > can test, I am more than happy to do so.
> >
> > Cheers,
> > Nathan
> >
> > # bad: [4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5] Add linux-next specific files for 20230331
> > # good: [b2bc47e9b2011a183f9d3d3454a294a938082fb9] Merge tag 'net-6.3-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> > git bisect start '4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5' 'b2bc47e9b2011a183f9d3d3454a294a938082fb9'
> > # good: [ed5f95f3349003d74a4a11b27b0f05d6794c382a] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> > git bisect good ed5f95f3349003d74a4a11b27b0f05d6794c382a
> > # bad: [85f7d1bfa30a05df2c9d8a0e9f6b1f23b4a6f13b] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git
> > git bisect bad 85f7d1bfa30a05df2c9d8a0e9f6b1f23b4a6f13b
> > # bad: [fbd0f79f200f8e5cb73fb3d7b788de09a8f33a6f] Merge branch 'msm-next' of https://gitlab.freedesktop.org/drm/msm.git
> > git bisect bad fbd0f79f200f8e5cb73fb3d7b788de09a8f33a6f
> > # good: [90031bc33f7525f0cc7a9ef0b1df62a1a4463382] Merge tag 'amd-drm-next-6.4-2023-03-17' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> > git bisect good 90031bc33f7525f0cc7a9ef0b1df62a1a4463382
> > # good: [d4e04817db670083aed73de1fadd3b21758e69ba] drm/amdgpu: Return from switch early for EEPROM I2C address
> > git bisect good d4e04817db670083aed73de1fadd3b21758e69ba
> > # good: [70e360f9b548d99f959668d4f047d1363d42fe8e] drm: exynos: dsi: Consolidate component and bridge
> > git bisect good 70e360f9b548d99f959668d4f047d1363d42fe8e
> > # bad: [0b43595d0cbb06736d1e572e79e29a410a273573] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
> > git bisect bad 0b43595d0cbb06736d1e572e79e29a410a273573
> > # good: [fbb3b3500f76ec8b741bd2d0e761ca3e856ad924] dt-bindings: display: boe,tv101wum-nl6: document rotation
> > git bisect good fbb3b3500f76ec8b741bd2d0e761ca3e856ad924
> > # bad: [82bbec189ab34873688484cd14189a5392946fbb] Merge v6.3-rc4 into drm-next
> > git bisect bad 82bbec189ab34873688484cd14189a5392946fbb
> > # bad: [d39e48ca80c0960b039cb38633957f0040f63e1a] drm/atomic-helper: Set fence deadline for vblank
> > git bisect bad d39e48ca80c0960b039cb38633957f0040f63e1a
> > # good: [d7d5a21dd6b4706c04fbba5d25db8da5f25aab68] dma-buf/dma-resv: Add a way to set fence deadline
> > git bisect good d7d5a21dd6b4706c04fbba5d25db8da5f25aab68
> > # good: [f3823da7e4ba7d4781375c2bb786a8a78efc6591] drm/scheduler: Add fence deadline support
> > git bisect good f3823da7e4ba7d4781375c2bb786a8a78efc6591
> > # good: [b2c077d001b612b1f34f7e528b2dc6072bd6794e] drm/vblank: Add helper to get next vblank time
> > git bisect good b2c077d001b612b1f34f7e528b2dc6072bd6794e
> > # first bad commit: [d39e48ca80c0960b039cb38633957f0040f63e1a] drm/atomic-helper: Set fence deadline for vblank
