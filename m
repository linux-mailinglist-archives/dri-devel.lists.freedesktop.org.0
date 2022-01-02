Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E51B482B94
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jan 2022 15:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9B8996F;
	Sun,  2 Jan 2022 14:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D15A8996F;
 Sun,  2 Jan 2022 14:30:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1557360EB3;
 Sun,  2 Jan 2022 14:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F279C36AE7;
 Sun,  2 Jan 2022 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641133824;
 bh=R0oVKfZw6YAt4sm6GjaVCweudwqIJ6wnCtw3jLd37Sk=;
 h=Subject:From:To:Cc:Date:From;
 b=a8L4dkVSulNGb9rbNaAQhUfhlAS+kSTslmd7QWKbgNeJPQ2LYXQqr35O9WHCQiqkG
 tq5DbYGGsIfLw6tC2t4hDukT+hFD6+MFdJXBCK5xD/Kom8f2TvrxMfBK6OzBFdjFlH
 iT2oFT/9OeSFR/7BVQAwKqalTFQSNowIpdXe54ID5R+iSP+scddCIqiaciAVKDCSf7
 Hpbfn8UMMy1zCRothwYyMZXfiW1gnfY0oiFKfmFYuRmbXZssIHFyDhT6xgAchjZ8di
 g+UJ89w3Wn4svwuowdXUzhKoxwqjto91FnavZmM82pnXjYG7hvLYgk/Ybg4LTAHYGS
 TQ3aOHo1Dwe4A==
Message-ID: <995b4eaf85a9dd1630b2b81755e30292ce4571e6.camel@kernel.org>
Subject: softlockup in v5.15.12 in dcn20_post_unlock_program_front_end
From: Jeff Layton <jlayton@kernel.org>
To: amd-gfx <amd-gfx@lists.freedesktop.org>
Date: Sun, 02 Jan 2022 09:30:22 -0500
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm seeing a reproducible softlockup on amdgpu on v5.15.12:

[  861.656146] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting f=
or DMUB idle: status=3D3
[  861.914848] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting f=
or DMUB idle: status=3D3
[  862.173368] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting f=
or DMUB idle: status=3D3
[  862.381635] [drm] enabling link 0 failed: 15
[  862.640908] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting f=
or DMUB idle: status=3D3
[  862.743704] [drm:dcn20_wait_for_blank_complete [amdgpu]] *ERROR* DC: fai=
led to blank crtc!
[  863.002846] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting f=
or DMUB idle: status=3D3
[  863.261451] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting f=
or DMUB idle: status=3D3
[  863.262090] [drm] REG_WAIT timeout 1us * 10 tries - optc3_lock line:112
[  863.532231] [drm] REG_WAIT timeout 1us * 100000 tries - optc1_wait_for_s=
tate line:835
[  888.900914] watchdog: BUG: soft lockup - CPU#11 stuck for 26s! [gnome-sh=
ell:2306]
[  888.900921] Modules linked in: uinput rfcomm snd_seq_dummy snd_hrtimer r=
pcrdma rdma_cm iw_cm ib_cm ib_core nft_objref nf_conntrack_netbios_ns nf_co=
nntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject=
_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat bridge =
stp llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable=
_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptab=
le_raw iptable_security ip_set nf_tables nfnetlink ip6table_filter ip6_tabl=
es iptable_filter qrtr ns bnep vfat fat snd_hda_codec_realtek intel_rapl_ms=
r snd_hda_codec_generic intel_rapl_common ledtrig_audio snd_hda_codec_hdmi =
snd_hda_intel snd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi snd_usb_audi=
o snd_hda_codec kvm_amd snd_hda_core btusb snd_usbmidi_lib btrtl snd_rawmid=
i snd_hwdep btbcm ppdev kvm snd_seq btintel uvcvideo snd_seq_device videobu=
f2_vmalloc videobuf2_memops bluetooth videobuf2_v4l2 snd_pcm videobuf2_comm=
on irqbypass wmi_bmof mxm_wmi
[  888.900963]  pcspkr snd_timer rapl k10temp i2c_piix4 videodev snd ecdh_g=
eneric rfkill joydev soundcore mc parport_pc parport gpio_amdpt gpio_generi=
c acpi_cpufreq nfsd auth_rpcgss nfs_acl lockd grace sunrpc zram ip_tables a=
mdgpu drm_ttm_helper ttm iommu_v2 gpu_sched i2c_algo_bit drm_kms_helper cec=
 drm crct10dif_pclmul crc32_pclmul crc32c_intel uas ccp ghash_clmulni_intel=
 sp5100_tco usb_storage r8169 nvme nvme_core wmi ipmi_devintf ipmi_msghandl=
er fuse
[  888.900989] CPU: 11 PID: 2306 Comm: gnome-shell Not tainted 5.15.12-200.=
fc35.x86_64 #1
[  888.900992] Hardware name: Micro-Star International Co., Ltd. MS-7A33/X3=
70 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
[  888.900993] RIP: 0010:delay_halt_mwaitx+0x39/0x40
[  888.900999] Code: 03 05 cb b6 95 4d 31 d2 48 89 d1 0f 01 fa b8 ff ff ff =
ff b9 02 00 00 00 48 39 c6 48 0f 46 c6 48 89 c3 b8 f0 00 00 00 0f 01 fb <5b=
> c3 0f 1f 44 00 00 0f 1f 44 00 00 48 8b 05 9c 2f 03 01 e9 7f 47
[  888.901001] RSP: 0018:ffffb7f243e63878 EFLAGS: 00000293
[  888.901003] RAX: 00000000000000f0 RBX: 00000000002dc50a RCX: 00000000000=
00002
[  888.901005] RDX: 0000000000000000 RSI: 00000000002dc50a RDI: 0000027b571=
2e506
[  888.901006] RBP: 00000000002dc50a R08: ffffb7f243e63824 R09: 00000000000=
00001
[  888.901007] R10: ffffb7f243e63660 R11: 000000000000000d R12: ffff917bd71=
90000
[  888.901009] R13: ffff917dd4500000 R14: ffff917dd45006a0 R15: ffff917bd54=
1fc00
[  888.901010] FS:  00007f2912683d80(0000) GS:ffff918a9ecc0000(0000) knlGS:=
0000000000000000
[  888.901011] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  888.901013] CR2: 000033910fce0000 CR3: 0000000105b22000 CR4: 00000000003=
506e0
[  888.901014] Call Trace:
[  888.901016]  <TASK>
[  888.901018]  delay_halt+0x3b/0x60
[  888.901021]  dcn20_post_unlock_program_front_end+0xf4/0x2c0 [amdgpu]
[  888.901209]  dc_commit_state+0x4b6/0xa50 [amdgpu]
[  888.901382]  amdgpu_dm_atomic_commit_tail+0x55c/0x2610 [amdgpu]
[  888.901557]  ? dcn20_calculate_dlg_params+0x4f4/0x540 [amdgpu]
[  888.901735]  ? dcn20_calculate_dlg_params+0x4f4/0x540 [amdgpu]
[  888.901916]  ? dcn30_calculate_wm_and_dlg_fp+0x707/0x8a0 [amdgpu]
[  888.902090]  ? dcn30_validate_bandwidth+0x10f/0x240 [amdgpu]
[  888.902261]  ? kfree+0xaa/0x3f0
[  888.902265]  ? dcn30_validate_bandwidth+0x10f/0x240 [amdgpu]
[  888.902435]  ? dc_validate_global_state+0x31f/0x3c0 [amdgpu]
[  888.902604]  ? ttm_bo_mem_compat+0x2c/0x90 [ttm]
[  888.902609]  ? ttm_bo_validate+0x42/0x100 [ttm]
[  888.902614]  ? __raw_callee_save___native_queued_spin_unlock+0x11/0x1e
[  888.902619]  ? amdgpu_bo_destroy+0x70/0x70 [amdgpu]
[  888.902746]  ? dm_plane_helper_prepare_fb+0x1f4/0x260 [amdgpu]
[  888.902924]  ? __cond_resched+0x16/0x40
[  888.902927]  ? __wait_for_common+0x2b/0x140
[  888.902929]  ? __raw_callee_save___native_queued_spin_unlock+0x11/0x1e
[  888.902934]  commit_tail+0x94/0x120 [drm_kms_helper]
[  888.902955]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[  888.902969]  drm_mode_atomic_ioctl+0x8fd/0xac0 [drm]
[  888.902992]  ? __cond_resched+0x16/0x40
[  888.902994]  ? drm_plane_get_damage_clips.cold+0x1c/0x1c [drm]
[  888.903015]  ? drm_atomic_set_property+0xb30/0xb30 [drm]
[  888.903035]  drm_ioctl_kernel+0x86/0xd0 [drm]
[  888.903055]  ? wp_page_reuse+0x61/0x70
[  888.903057]  drm_ioctl+0x220/0x3e0 [drm]
[  888.903077]  ? drm_atomic_set_property+0xb30/0xb30 [drm]
[  888.903097]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[  888.903222]  __x64_sys_ioctl+0x82/0xb0
[  888.903226]  do_syscall_64+0x3b/0x90
[  888.903228]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  888.903231] RIP: 0033:0x7f2918b362bb
[  888.903234] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 =
e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3d 2b 0f 00 f7 d8 64 89 01 48
[  888.903235] RSP: 002b:00007ffdd451da48 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[  888.903237] RAX: ffffffffffffffda RBX: 00007ffdd451da90 RCX: 00007f2918b=
362bb
[  888.903238] RDX: 00007ffdd451da90 RSI: 00000000c03864bc RDI: 00000000000=
00009
[  888.903239] RBP: 00000000c03864bc R08: 0000000000000012 R09: 00000000000=
00012
[  888.903240] R10: 0000000000000002 R11: 0000000000000246 R12: 000055bcad4=
05c50
[  888.903241] R13: 0000000000000009 R14: 000055bca9f13bc0 R15: 000055bcabe=
0d6a0
[  888.903243]  </TASK>

(gdb) list *(dcn20_post_unlock_program_front_end+0xf4)
0x2561b4 is in dcn20_post_unlock_program_front_end (drivers/gpu/drm/amd/amd=
gpu/../display/dc/dcn20/dcn20_hwseq.c:1766).
1761			if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.=
enable) {
1762				struct hubp *hubp =3D pipe->plane_res.hubp;
1763				int j =3D 0;
1764=09
1765				for (j =3D 0; j < TIMEOUT_FOR_PIPE_ENABLE_MS*1000
1766						&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
1767					mdelay(1);
1768			}
1769		}
1770=09

I can reproduce this by logging with GNOME on wayland, starting up the
steam client and then letting the screen blank kick in. Note that
starting an actual game is not necessary.  Once I try to unblank the
screen (keypress or mouse movement), it never does and the machine goes
into a soft lockup.

The host is Fedora 35 with a stock kernels. I also see this with earlier
v5.15 kernels. I haven't tested anything pre-5.15 though. If I log in
with Xorg, I don't see the issue. Video card is:

30:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi 23 [Radeon RX 6600/6600 XT/6600M] (rev c7) (prog-if 00 [VGA controller]=
)
        Subsystem: Sapphire Technology Limited Device e447
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
 Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+ <T=
Abort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 66
        IOMMU group: 17
        Region 0: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at f0000000 (64-bit, prefetchable) [size=3D2M]
        Region 4: I/O ports at e000 [size=3D256]
        Region 5: Memory at fc800000 (32-bit, non-prefetchable) [size=3D1M]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

I'm able to test patches if it helps. Let me know if you want other info
as well.

Thanks!
--=20
Jeff Layton <jlayton@kernel.org>
