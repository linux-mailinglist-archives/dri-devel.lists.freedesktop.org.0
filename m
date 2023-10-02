Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DD7B5614
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 17:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1A510E2DC;
	Mon,  2 Oct 2023 15:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1810E2DA;
 Mon,  2 Oct 2023 15:11:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B799860F05;
 Mon,  2 Oct 2023 15:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B758C433C7;
 Mon,  2 Oct 2023 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696259477;
 bh=7oy9zbQVi2epYsmo/1n/+uKi33yLmuAwn6Wyg0BA31g=;
 h=Subject:From:To:Date:From;
 b=AzIHIGh3oofVUW93pQuYEW0zGrrf36Jn9bNXyxSMIFYrA0RkcLNbzEC49m2Q/Absa
 p1psuFOv2ClLG6ViwOT0WtZqRrDBpyxd96i3TYlE/S3u5lvcvHW6uw9j3NdVxJ9dZk
 RylZvc6cMNjNHv1oMO7ckZ5uf9HReE5MrX3zcw9gBuGFaRBlIEn+jEo8wqYQyywR+x
 ymAey+wm1J8R5YUoRx32D7CNta4V3m5q2/sHKK+DDT9hSs0nUMZ7XpWw4v2Vv27dEX
 vV8/ooLeCqTr/s8M7yWfWCmZdGogeHygsjnWWBVWJIkUQRGXdNOG9vQpKYFz9v6Ho5
 qWC3EMeybsLtA==
Message-ID: <710cff8237cd898ee80f46a858052e681e470e69.camel@kernel.org>
Subject: DPMS problems with radeon card and dual monitor setup
From: Jeff Layton <jlayton@kernel.org>
To: dri-devel@lists.freedesktop.org, amd-gfx <amd-gfx@lists.freedesktop.org>
Date: Mon, 02 Oct 2023 11:11:15 -0400
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have been seeing problems when my displays go to sleep for a couple of
releases now. I have a dual monitor setup and a single AMD RX 6600 card.
When I leave for a bit and come back, often all of my windows have been
shuffled to the secondary monitor, and sometimes GNOME designates that
monitor as primary.

When I look in dmesg, I see the log messages as below:

The first one is this in allocate_mst_payload:

        ASSERT(proposed_table.stream_count > 0);                      =20

I can provide more details about my setup if that would help.

[ 4121.284908] [drm] DM_MST: stopping TM on aconnector: 0000000039b08aac [i=
d: 91]
[ 4125.225843] ------------[ cut here ]------------
[ 4125.225850] WARNING: CPU: 9 PID: 3429 at drivers/gpu/drm/amd/amdgpu/../d=
isplay/dc/link/link_dpms.c:1484 link_set_dpms_on+0xbe5/0xca0 [amdgpu]
[ 4125.226869] Modules linked in: uinput rpcrdma rdma_cm rfcomm iw_cm ib_cm=
 ib_core snd_seq_dummy snd_hrtimer tun xt_CHECKSUM xt_MASQUERADE xt_conntra=
ck ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbios_ns nf_conn=
track_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_i=
net nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat bridge st=
p llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable=
_raw iptable_security ip_set nf_tables nfnetlink ip6table_filter iptable_fi=
lter qrtr bnep binfmt_misc xfs vfat fat snd_hda_codec_realtek snd_hda_codec=
_generic snd_hda_codec_hdmi ledtrig_audio snd_hda_intel intel_rapl_msr inte=
l_rapl_common snd_intel_dspcfg snd_intel_sdw_acpi snd_usb_audio snd_hda_cod=
ec edac_mce_amd btusb btrtl ppdev snd_hda_core uvcvideo btbcm snd_usbmidi_l=
ib kvm_amd snd_ump btintel snd_rawmidi uvc snd_hwdep videobuf2_vmalloc btmt=
k snd_seq videobuf2_memops kvm bluetooth videobuf2_v4l2
[ 4125.227067]  snd_seq_device xpad irqbypass videobuf2_common snd_pcm rapl=
 ff_memless rfkill videodev wmi_bmof snd_timer acpi_cpufreq mxm_wmi i2c_pii=
x4 pcspkr k10temp snd mc soundcore parport_pc parport gpio_amdpt gpio_gener=
ic joydev nfsd auth_rpcgss nfs_acl lockd grace sunrpc loop zram amdgpu uas =
usb_storage r8169 i2c_algo_bit drm_ttm_helper ttm video drm_suballoc_helper=
 amdxcp crct10dif_pclmul iommu_v2 crc32_pclmul drm_buddy crc32c_intel polyv=
al_clmulni gpu_sched polyval_generic nvme ghash_clmulni_intel drm_display_h=
elper sha512_ssse3 sp5100_tco nvme_core ccp cec nvme_common wmi scsi_dh_rda=
c scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multipath fuse
[ 4125.227226] CPU: 9 PID: 3429 Comm: gnome-shell Kdump: loaded Not tainted=
 6.5.5-200.fc38.x86_64 #1
[ 4125.227234] Hardware name: Micro-Star International Co., Ltd. MS-7A33/X3=
70 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
[ 4125.227238] RIP: 0010:link_set_dpms_on+0xbe5/0xca0 [amdgpu]
[ 4125.228239] Code: e9 3f fc ff ff 48 c7 c7 38 86 ff c0 e8 e4 66 09 c6 e9 =
c0 fe ff ff 48 8b bb d0 01 00 00 48 89 de e8 20 d0 ed ff e9 25 ff ff ff <0f=
> 0b e9 88 fd ff ff 41 c6 85 50 04 00 00 00 e9 d1 f8 ff ff 49 8b
[ 4125.228246] RSP: 0018:ffffa1204aed3428 EFLAGS: 00010246
[ 4125.228254] RAX: 0000000000000000 RBX: ffff92ddfbf75000 RCX: 00000000000=
00005
[ 4125.228259] RDX: ffffffffc0ff8548 RSI: 0000000000000002 RDI: 00000000000=
00000
[ 4125.228263] RBP: ffff92ddfbf75000 R08: 0000000000000000 R09: 00000000000=
00005
[ 4125.228267] R10: ffff92ddd1a0f000 R11: ffff92ddcc6e87e0 R12: ffff92de3c9=
c0248
[ 4125.228272] R13: 0000000000000006 R14: ffff92ddd9580000 R15: ffff92de3c9=
c0500
[ 4125.228276] FS:  00007f8bbc726600(0000) GS:ffff92ecdec40000(0000) knlGS:=
0000000000000000
[ 4125.228282] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4125.228287] CR2: 00000f66f44a9000 CR3: 000000018492a000 CR4: 00000000003=
506e0
[ 4125.228292] Call Trace:
[ 4125.228298]  <TASK>
[ 4125.228302]  ? link_set_dpms_on+0xbe5/0xca0 [amdgpu]
[ 4125.229298]  ? __warn+0x81/0x130
[ 4125.229312]  ? link_set_dpms_on+0xbe5/0xca0 [amdgpu]
[ 4125.230311]  ? report_bug+0x171/0x1a0
[ 4125.230324]  ? handle_bug+0x3c/0x80
[ 4125.230334]  ? exc_invalid_op+0x17/0x70
[ 4125.230342]  ? asm_exc_invalid_op+0x1a/0x20
[ 4125.230358]  ? link_set_dpms_on+0xbe5/0xca0 [amdgpu]
[ 4125.231360]  dce110_apply_ctx_to_hw+0x535/0x700 [amdgpu]
[ 4125.232313]  dc_commit_state_no_check+0x3cd/0xef0 [amdgpu]
[ 4125.233263]  dc_commit_streams+0x29b/0x400 [amdgpu]
[ 4125.234238]  amdgpu_dm_atomic_commit_tail+0x5e8/0x3b10 [amdgpu]
[ 4125.235238]  ? srso_return_thunk+0x5/0x10
[ 4125.235249]  ? psi_group_change+0x213/0x3c0
[ 4125.235261]  ? srso_return_thunk+0x5/0x10
[ 4125.235268]  ? psi_task_switch+0xd6/0x230
[ 4125.235276]  ? srso_return_thunk+0x5/0x10
[ 4125.235283]  ? finish_task_switch.isra.0+0x94/0x2f0
[ 4125.235298]  ? srso_return_thunk+0x5/0x10
[ 4125.235308]  ? srso_return_thunk+0x5/0x10
[ 4125.235315]  ? psi_group_change+0x213/0x3c0
[ 4125.235325]  ? srso_return_thunk+0x5/0x10
[ 4125.235332]  ? psi_task_switch+0xd6/0x230
[ 4125.235339]  ? srso_return_thunk+0x5/0x10
[ 4125.235346]  ? finish_task_switch.isra.0+0x94/0x2f0
[ 4125.235356]  ? srso_return_thunk+0x5/0x10
[ 4125.235364]  ? __schedule+0x3f6/0x14c0
[ 4125.235371]  ? dma_resv_get_fences+0x117/0x220
[ 4125.235382]  ? srso_return_thunk+0x5/0x10
[ 4125.235395]  ? srso_return_thunk+0x5/0x10
[ 4125.235402]  ? schedule+0x5e/0xd0
[ 4125.235410]  ? srso_return_thunk+0x5/0x10
[ 4125.235417]  ? schedule_timeout+0x151/0x160
[ 4125.235423]  ? srso_return_thunk+0x5/0x10
[ 4125.235430]  ? sysvec_apic_timer_interrupt+0xe/0x90
[ 4125.235438]  ? srso_return_thunk+0x5/0x10
[ 4125.235445]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
[ 4125.235456]  ? srso_return_thunk+0x5/0x10
[ 4125.235464]  ? wait_for_completion_timeout+0x13e/0x170
[ 4125.235480]  commit_tail+0x94/0x130
[ 4125.235490]  drm_atomic_helper_commit+0x11a/0x140
[ 4125.235498]  drm_atomic_commit+0x9a/0xd0
[ 4125.235508]  ? __pfx___drm_printfn_info+0x10/0x10
[ 4125.235520]  drm_mode_atomic_ioctl+0x9b5/0xbc0
[ 4125.235533]  ? idr_alloc+0x3a/0x70
[ 4125.235547]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 4125.235557]  drm_ioctl_kernel+0xcd/0x170
[ 4125.235568]  drm_ioctl+0x26d/0x4b0
[ 4125.235576]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 4125.235596]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[ 4125.236392]  __x64_sys_ioctl+0x97/0xd0
[ 4125.236403]  do_syscall_64+0x60/0x90
[ 4125.236412]  ? __x64_sys_ioctl+0xaf/0xd0
[ 4125.236420]  ? srso_return_thunk+0x5/0x10
[ 4125.236427]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.236436]  ? srso_return_thunk+0x5/0x10
[ 4125.236443]  ? do_syscall_64+0x6c/0x90
[ 4125.236451]  ? srso_return_thunk+0x5/0x10
[ 4125.236458]  ? __x64_sys_ioctl+0xaf/0xd0
[ 4125.236466]  ? srso_return_thunk+0x5/0x10
[ 4125.236473]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.236481]  ? srso_return_thunk+0x5/0x10
[ 4125.236488]  ? do_syscall_64+0x6c/0x90
[ 4125.236494]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.236502]  ? srso_return_thunk+0x5/0x10
[ 4125.236509]  ? do_syscall_64+0x6c/0x90
[ 4125.236516]  ? srso_return_thunk+0x5/0x10
[ 4125.236523]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.236530]  ? srso_return_thunk+0x5/0x10
[ 4125.236538]  ? do_syscall_64+0x6c/0x90
[ 4125.236544]  ? srso_return_thunk+0x5/0x10
[ 4125.236551]  ? __irq_exit_rcu+0x4b/0xc0
[ 4125.236562]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[ 4125.236570] RIP: 0033:0x7f8bbfd28edd
[ 4125.236613] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 =
b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[ 4125.236618] RSP: 002b:00007ffe0a954fa0 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[ 4125.236626] RAX: ffffffffffffffda RBX: 0000560755e3ca30 RCX: 00007f8bbfd=
28edd
[ 4125.236630] RDX: 00007ffe0a955040 RSI: 00000000c03864bc RDI: 00000000000=
0000a
[ 4125.236635] RBP: 00007ffe0a954ff0 R08: 0000000000000007 R09: 00000000000=
00014
[ 4125.236639] R10: 0000000000000012 R11: 0000000000000246 R12: 00007ffe0a9=
55040
[ 4125.236643] R13: 00000000c03864bc R14: 000000000000000a R15: 00005607576=
8c4d0
[ 4125.236666]  </TASK>
[ 4125.236670] ---[ end trace 0000000000000000 ]---
[ 4125.275997] snd_hda_codec_hdmi hdaudioC0D0: HDMI: Unknown ELD version 0
[ 4125.401923] [drm] DM_MST: starting TM on aconnector: 0000000039b08aac [i=
d: 91]
[ 4125.409668] [drm] DM_MST: DP12, 4-lane link detected
[ 4125.606757] ------------[ cut here ]------------
[ 4125.606765] WARNING: CPU: 10 PID: 3429 at drivers/gpu/drm/amd/amdgpu/../=
display/amdgpu_dm/amdgpu_dm_helpers.c:236 dm_helpers_construct_old_payload+=
0xc6/0xe0 [amdgpu]
[ 4125.607780] Modules linked in: uinput rpcrdma rdma_cm rfcomm iw_cm ib_cm=
 ib_core snd_seq_dummy snd_hrtimer tun xt_CHECKSUM xt_MASQUERADE xt_conntra=
ck ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbios_ns nf_conn=
track_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_i=
net nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat bridge st=
p llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable=
_raw iptable_security ip_set nf_tables nfnetlink ip6table_filter iptable_fi=
lter qrtr bnep binfmt_misc xfs vfat fat snd_hda_codec_realtek snd_hda_codec=
_generic snd_hda_codec_hdmi ledtrig_audio snd_hda_intel intel_rapl_msr inte=
l_rapl_common snd_intel_dspcfg snd_intel_sdw_acpi snd_usb_audio snd_hda_cod=
ec edac_mce_amd btusb btrtl ppdev snd_hda_core uvcvideo btbcm snd_usbmidi_l=
ib kvm_amd snd_ump btintel snd_rawmidi uvc snd_hwdep videobuf2_vmalloc btmt=
k snd_seq videobuf2_memops kvm bluetooth videobuf2_v4l2
[ 4125.607978]  snd_seq_device xpad irqbypass videobuf2_common snd_pcm rapl=
 ff_memless rfkill videodev wmi_bmof snd_timer acpi_cpufreq mxm_wmi i2c_pii=
x4 pcspkr k10temp snd mc soundcore parport_pc parport gpio_amdpt gpio_gener=
ic joydev nfsd auth_rpcgss nfs_acl lockd grace sunrpc loop zram amdgpu uas =
usb_storage r8169 i2c_algo_bit drm_ttm_helper ttm video drm_suballoc_helper=
 amdxcp crct10dif_pclmul iommu_v2 crc32_pclmul drm_buddy crc32c_intel polyv=
al_clmulni gpu_sched polyval_generic nvme ghash_clmulni_intel drm_display_h=
elper sha512_ssse3 sp5100_tco nvme_core ccp cec nvme_common wmi scsi_dh_rda=
c scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multipath fuse
[ 4125.608137] CPU: 10 PID: 3429 Comm: gnome-shell Kdump: loaded Tainted: G=
        W          6.5.5-200.fc38.x86_64 #1
[ 4125.608144] Hardware name: Micro-Star International Co., Ltd. MS-7A33/X3=
70 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
[ 4125.608149] RIP: 0010:dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu=
]
[ 4125.609150] Code: 0f af d2 41 89 50 10 39 c8 74 1f 48 8b 84 24 98 00 00 =
00 65 48 2b 04 25 28 00 00 00 75 14 48 81 c4 a0 00 00 00 e9 aa 92 6e c6 <0f=
> 0b eb dd 31 c0 eb d5 e8 cd 08 6d c6 66 66 2e 0f 1f 84 00 00 00
[ 4125.609156] RSP: 0018:ffffa1204aed32f0 EFLAGS: 00010246
[ 4125.609163] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[ 4125.609168] RDX: ffff92ddc8a9a818 RSI: ffff92ddd1a0f3b0 RDI: ffffa1204ae=
d3388
[ 4125.609173] RBP: ffff92ddfbf75000 R08: ffffa1204aed3398 R09: ffff92ddd1a=
0f000
[ 4125.609177] R10: 0000000000000000 R11: 0000000000000100 R12: ffffa1204ae=
d345c
[ 4125.609181] R13: ffff92dfdb79e6c0 R14: ffff92ddc1b58578 R15: ffff92ddc8a=
9a7e0
[ 4125.609185] FS:  00007f8bbc726600(0000) GS:ffff92ecdec80000(0000) knlGS:=
0000000000000000
[ 4125.609191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4125.609196] CR2: 00007f1021a4faf4 CR3: 000000018492a000 CR4: 00000000003=
506e0
[ 4125.609201] Call Trace:
[ 4125.609207]  <TASK>
[ 4125.609211]  ? dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu]
[ 4125.610214]  ? __warn+0x81/0x130
[ 4125.610228]  ? dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu]
[ 4125.611227]  ? report_bug+0x171/0x1a0
[ 4125.611240]  ? handle_bug+0x3c/0x80
[ 4125.611249]  ? exc_invalid_op+0x17/0x70
[ 4125.611258]  ? asm_exc_invalid_op+0x1a/0x20
[ 4125.611274]  ? dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu]
[ 4125.612280]  dm_helpers_dp_mst_write_payload_allocation_table+0xb0/0x120=
 [amdgpu]
[ 4125.613281]  link_set_dpms_off+0x6ec/0x8c0 [amdgpu]
[ 4125.614295]  dcn20_reset_hw_ctx_wrap+0x155/0x440 [amdgpu]
[ 4125.615287]  dce110_apply_ctx_to_hw+0x6e/0x700 [amdgpu]
[ 4125.616233]  ? srso_return_thunk+0x5/0x10
[ 4125.616243]  ? __free_pages_ok+0x256/0x550
[ 4125.616260]  dc_commit_state_no_check+0x3cd/0xef0 [amdgpu]
[ 4125.617209]  dc_commit_streams+0x29b/0x400 [amdgpu]
[ 4125.618163]  amdgpu_dm_atomic_commit_tail+0x5e8/0x3b10 [amdgpu]
[ 4125.619159]  ? srso_return_thunk+0x5/0x10
[ 4125.619168]  ? load_balance+0x18f/0xdd0
[ 4125.619184]  ? sugov_update_single_freq+0xb7/0x180
[ 4125.619200]  ? srso_return_thunk+0x5/0x10
[ 4125.619207]  ? srso_return_thunk+0x5/0x10
[ 4125.619214]  ? srso_return_thunk+0x5/0x10
[ 4125.619222]  ? raw_spin_rq_lock_nested+0x1c/0x80
[ 4125.619231]  ? srso_return_thunk+0x5/0x10
[ 4125.619238]  ? psi_group_change+0x213/0x3c0
[ 4125.619248]  ? srso_return_thunk+0x5/0x10
[ 4125.619255]  ? psi_task_switch+0xd6/0x230
[ 4125.619262]  ? srso_return_thunk+0x5/0x10
[ 4125.619270]  ? finish_task_switch.isra.0+0x94/0x2f0
[ 4125.619280]  ? srso_return_thunk+0x5/0x10
[ 4125.619287]  ? __schedule+0x3f6/0x14c0
[ 4125.619296]  ? srso_return_thunk+0x5/0x10
[ 4125.619304]  ? dma_fence_array_create+0x48/0x110
[ 4125.619319]  ? srso_return_thunk+0x5/0x10
[ 4125.619327]  ? __slab_free+0xf1/0x330
[ 4125.619335]  ? srso_return_thunk+0x5/0x10
[ 4125.619342]  ? __slab_free+0xf1/0x330
[ 4125.619355]  ? srso_return_thunk+0x5/0x10
[ 4125.619362]  ? wait_for_completion_timeout+0x13e/0x170
[ 4125.619369]  ? wait_for_completion_interruptible+0x139/0x1e0
[ 4125.619378]  ? srso_return_thunk+0x5/0x10
[ 4125.619392]  commit_tail+0x94/0x130
[ 4125.619402]  drm_atomic_helper_commit+0x11a/0x140
[ 4125.619410]  drm_atomic_commit+0x9a/0xd0
[ 4125.619420]  ? __pfx___drm_printfn_info+0x10/0x10
[ 4125.619431]  drm_mode_atomic_ioctl+0x9b5/0xbc0
[ 4125.619444]  ? __pfx_drm_mode_createblob_ioctl+0x10/0x10
[ 4125.619459]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 4125.619469]  drm_ioctl_kernel+0xcd/0x170
[ 4125.619480]  drm_ioctl+0x26d/0x4b0
[ 4125.619488]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 4125.619508]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[ 4125.620303]  __x64_sys_ioctl+0x97/0xd0
[ 4125.620315]  do_syscall_64+0x60/0x90
[ 4125.620324]  ? srso_return_thunk+0x5/0x10
[ 4125.620332]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.620340]  ? srso_return_thunk+0x5/0x10
[ 4125.620348]  ? do_syscall_64+0x6c/0x90
[ 4125.620354]  ? srso_return_thunk+0x5/0x10
[ 4125.620361]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.620369]  ? srso_return_thunk+0x5/0x10
[ 4125.620376]  ? do_syscall_64+0x6c/0x90
[ 4125.620382]  ? srso_return_thunk+0x5/0x10
[ 4125.620389]  ? __irq_exit_rcu+0x4b/0xc0
[ 4125.620400]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[ 4125.620408] RIP: 0033:0x7f8bbfd28edd
[ 4125.620451] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 =
b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[ 4125.620456] RSP: 002b:00007ffe0a954fa0 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[ 4125.620464] RAX: ffffffffffffffda RBX: 0000560753e3f1a0 RCX: 00007f8bbfd=
28edd
[ 4125.620468] RDX: 00007ffe0a955040 RSI: 00000000c03864bc RDI: 00000000000=
0000a
[ 4125.620473] RBP: 00007ffe0a954ff0 R08: 0000000000000007 R09: 00000000000=
00014
[ 4125.620477] R10: 0000000000000011 R11: 0000000000000246 R12: 00007ffe0a9=
55040
[ 4125.620481] R13: 00000000c03864bc R14: 000000000000000a R15: 00005607546=
6b960
[ 4125.620496]  </TASK>
[ 4125.620499] ---[ end trace 0000000000000000 ]---
[ 4125.620533] ------------[ cut here ]------------
[ 4125.620536] WARNING: CPU: 10 PID: 3429 at drivers/gpu/drm/amd/amdgpu/../=
display/amdgpu_dm/amdgpu_dm_helpers.c:182 fill_dc_mst_payload_table_from_dr=
m+0x94/0x140 [amdgpu]
[ 4125.621532] Modules linked in: uinput rpcrdma rdma_cm rfcomm iw_cm ib_cm=
 ib_core snd_seq_dummy snd_hrtimer tun xt_CHECKSUM xt_MASQUERADE xt_conntra=
ck ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbios_ns nf_conn=
track_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_i=
net nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat bridge st=
p llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable=
_raw iptable_security ip_set nf_tables nfnetlink ip6table_filter iptable_fi=
lter qrtr bnep binfmt_misc xfs vfat fat snd_hda_codec_realtek snd_hda_codec=
_generic snd_hda_codec_hdmi ledtrig_audio snd_hda_intel intel_rapl_msr inte=
l_rapl_common snd_intel_dspcfg snd_intel_sdw_acpi snd_usb_audio snd_hda_cod=
ec edac_mce_amd btusb btrtl ppdev snd_hda_core uvcvideo btbcm snd_usbmidi_l=
ib kvm_amd snd_ump btintel snd_rawmidi uvc snd_hwdep videobuf2_vmalloc btmt=
k snd_seq videobuf2_memops kvm bluetooth videobuf2_v4l2
[ 4125.621734]  snd_seq_device xpad irqbypass videobuf2_common snd_pcm rapl=
 ff_memless rfkill videodev wmi_bmof snd_timer acpi_cpufreq mxm_wmi i2c_pii=
x4 pcspkr k10temp snd mc soundcore parport_pc parport gpio_amdpt gpio_gener=
ic joydev nfsd auth_rpcgss nfs_acl lockd grace sunrpc loop zram amdgpu uas =
usb_storage r8169 i2c_algo_bit drm_ttm_helper ttm video drm_suballoc_helper=
 amdxcp crct10dif_pclmul iommu_v2 crc32_pclmul drm_buddy crc32c_intel polyv=
al_clmulni gpu_sched polyval_generic nvme ghash_clmulni_intel drm_display_h=
elper sha512_ssse3 sp5100_tco nvme_core ccp cec nvme_common wmi scsi_dh_rda=
c scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multipath fuse
[ 4125.621886] CPU: 10 PID: 3429 Comm: gnome-shell Kdump: loaded Tainted: G=
        W          6.5.5-200.fc38.x86_64 #1
[ 4125.621893] Hardware name: Micro-Star International Co., Ltd. MS-7A33/X3=
70 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
[ 4125.621897] RIP: 0010:fill_dc_mst_payload_table_from_drm+0x94/0x140 [amd=
gpu]
[ 4125.622896] Code: 09 31 d2 48 89 c1 eb 0b 83 c2 01 48 83 c1 18 39 d6 74 =
17 40 38 39 75 f0 48 63 ca 31 ff 48 8d 0c 49 66 89 7c cc 28 39 d6 75 22 <0f=
> 0b eb 1e 0f b7 5a 0c 0f b7 05 c7 d5 73 00 48 8d 0c 76 8a 42 09
[ 4125.622901] RSP: 0018:ffffa1204aed32d8 EFLAGS: 00010246
[ 4125.622908] RAX: ffffa1204aed3300 RBX: 0000000000000000 RCX: 00000000000=
00000
[ 4125.622912] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa1204ae=
d3380
[ 4125.622916] RBP: ffff92ddfbf75000 R08: ffffa1204aed345c R09: 00000000000=
00000
[ 4125.622920] R10: 0000000000000000 R11: 0000000000000100 R12: ffffa1204ae=
d345c
[ 4125.622924] R13: ffffa1204aed3398 R14: ffff92ddc1b58578 R15: ffff92ddc8a=
9a7e0
[ 4125.622929] FS:  00007f8bbc726600(0000) GS:ffff92ecdec80000(0000) knlGS:=
0000000000000000
[ 4125.622934] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4125.622939] CR2: 00007f1021a4faf4 CR3: 000000018492a000 CR4: 00000000003=
506e0
[ 4125.622944] Call Trace:
[ 4125.622947]  <TASK>
[ 4125.622951]  ? fill_dc_mst_payload_table_from_drm+0x94/0x140 [amdgpu]
[ 4125.623945]  ? __warn+0x81/0x130
[ 4125.623955]  ? fill_dc_mst_payload_table_from_drm+0x94/0x140 [amdgpu]
[ 4125.624951]  ? report_bug+0x171/0x1a0
[ 4125.624962]  ? handle_bug+0x3c/0x80
[ 4125.624971]  ? exc_invalid_op+0x17/0x70
[ 4125.624980]  ? asm_exc_invalid_op+0x1a/0x20
[ 4125.624994]  ? fill_dc_mst_payload_table_from_drm+0x94/0x140 [amdgpu]
[ 4125.626003]  dm_helpers_dp_mst_write_payload_allocation_table+0xd6/0x120=
 [amdgpu]
[ 4125.627004]  link_set_dpms_off+0x6ec/0x8c0 [amdgpu]
[ 4125.628007]  dcn20_reset_hw_ctx_wrap+0x155/0x440 [amdgpu]
[ 4125.628996]  dce110_apply_ctx_to_hw+0x6e/0x700 [amdgpu]
[ 4125.629938]  ? srso_return_thunk+0x5/0x10
[ 4125.629947]  ? __free_pages_ok+0x256/0x550
[ 4125.629963]  dc_commit_state_no_check+0x3cd/0xef0 [amdgpu]
[ 4125.630910]  dc_commit_streams+0x29b/0x400 [amdgpu]
[ 4125.631863]  amdgpu_dm_atomic_commit_tail+0x5e8/0x3b10 [amdgpu]
[ 4125.632859]  ? srso_return_thunk+0x5/0x10
[ 4125.632867]  ? load_balance+0x18f/0xdd0
[ 4125.632882]  ? sugov_update_single_freq+0xb7/0x180
[ 4125.632898]  ? srso_return_thunk+0x5/0x10
[ 4125.632905]  ? srso_return_thunk+0x5/0x10
[ 4125.632912]  ? srso_return_thunk+0x5/0x10
[ 4125.632920]  ? raw_spin_rq_lock_nested+0x1c/0x80
[ 4125.632927]  ? srso_return_thunk+0x5/0x10
[ 4125.632934]  ? psi_group_change+0x213/0x3c0
[ 4125.632945]  ? srso_return_thunk+0x5/0x10
[ 4125.632952]  ? psi_task_switch+0xd6/0x230
[ 4125.632959]  ? srso_return_thunk+0x5/0x10
[ 4125.632966]  ? finish_task_switch.isra.0+0x94/0x2f0
[ 4125.632977]  ? srso_return_thunk+0x5/0x10
[ 4125.632984]  ? __schedule+0x3f6/0x14c0
[ 4125.632993]  ? srso_return_thunk+0x5/0x10
[ 4125.633001]  ? dma_fence_array_create+0x48/0x110
[ 4125.633015]  ? srso_return_thunk+0x5/0x10
[ 4125.633022]  ? __slab_free+0xf1/0x330
[ 4125.633029]  ? srso_return_thunk+0x5/0x10
[ 4125.633036]  ? __slab_free+0xf1/0x330
[ 4125.633049]  ? srso_return_thunk+0x5/0x10
[ 4125.633056]  ? wait_for_completion_timeout+0x13e/0x170
[ 4125.633063]  ? wait_for_completion_interruptible+0x139/0x1e0
[ 4125.633072]  ? srso_return_thunk+0x5/0x10
[ 4125.633086]  commit_tail+0x94/0x130
[ 4125.633095]  drm_atomic_helper_commit+0x11a/0x140
[ 4125.633103]  drm_atomic_commit+0x9a/0xd0
[ 4125.633111]  ? __pfx___drm_printfn_info+0x10/0x10
[ 4125.633122]  drm_mode_atomic_ioctl+0x9b5/0xbc0
[ 4125.633135]  ? __pfx_drm_mode_createblob_ioctl+0x10/0x10
[ 4125.633150]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 4125.633159]  drm_ioctl_kernel+0xcd/0x170
[ 4125.633169]  drm_ioctl+0x26d/0x4b0
[ 4125.633178]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 4125.633198]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[ 4125.633994]  __x64_sys_ioctl+0x97/0xd0
[ 4125.634004]  do_syscall_64+0x60/0x90
[ 4125.634013]  ? srso_return_thunk+0x5/0x10
[ 4125.634020]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.634028]  ? srso_return_thunk+0x5/0x10
[ 4125.634036]  ? do_syscall_64+0x6c/0x90
[ 4125.634042]  ? srso_return_thunk+0x5/0x10
[ 4125.634049]  ? syscall_exit_to_user_mode+0x2b/0x40
[ 4125.634057]  ? srso_return_thunk+0x5/0x10
[ 4125.634064]  ? do_syscall_64+0x6c/0x90
[ 4125.634071]  ? srso_return_thunk+0x5/0x10
[ 4125.634078]  ? __irq_exit_rcu+0x4b/0xc0
[ 4125.634088]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[ 4125.634095] RIP: 0033:0x7f8bbfd28edd
[ 4125.634112] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 =
b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[ 4125.634117] RSP: 002b:00007ffe0a954fa0 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[ 4125.634124] RAX: ffffffffffffffda RBX: 0000560753e3f1a0 RCX: 00007f8bbfd=
28edd
[ 4125.634129] RDX: 00007ffe0a955040 RSI: 00000000c03864bc RDI: 00000000000=
0000a
[ 4125.634133] RBP: 00007ffe0a954ff0 R08: 0000000000000007 R09: 00000000000=
00014
[ 4125.634137] R10: 0000000000000011 R11: 0000000000000246 R12: 00007ffe0a9=
55040
[ 4125.634141] R13: 00000000c03864bc R14: 000000000000000a R15: 00005607546=
6b960
[ 4125.634156]  </TASK>
[ 4125.634159] ---[ end trace 0000000000000000 ]---

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>
