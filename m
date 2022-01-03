Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232F483805
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 21:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897E89FE8;
	Mon,  3 Jan 2022 20:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1480A89FE8;
 Mon,  3 Jan 2022 20:25:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99B9BB81097;
 Mon,  3 Jan 2022 20:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30916C36AE9;
 Mon,  3 Jan 2022 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641241518;
 bh=ZNju7db1qhf/6lneTqNwgZUKnRZ1aX+EYp/CjzXJir8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oFh4HoVrW8KfVRwFq7ojgdG/TnDYr2B5yAL58+qwTec11sZXkyXIJ/utpM/X6RNuM
 Q0ZfbxEgMoIpMJ277OmaFt8rRPePycNNd3moE15hUMjhSJ3HYlvCHDlan+dPPdHdQz
 UtzlOGV+ikZJk1kJfgl1YalJGw795h97oCfNI29Fgeer58WjyBsTgHEFQ6Gx28Jbt+
 W3JigFfLL8CfBBAhQqOTAatx3M1zacgYZK0Jyivmi9/Wvry1x6XwGfvb3PmCnomgC5
 uF/yO869ktBmmtH7reIexHHzZSlRgq0r7ilprwSde3EqA/tHDnY+WaLCfOSY+zJxsw
 10wmeuHAq8b6g==
Message-ID: <abc18b3f74e3393592d5f527d85d20a3b980c6f2.camel@kernel.org>
Subject: Re: softlockup in v5.15.12 in dcn20_post_unlock_program_front_end
From: Jeff Layton <jlayton@kernel.org>
To: amd-gfx <amd-gfx@lists.freedesktop.org>
Date: Mon, 03 Jan 2022 15:25:16 -0500
In-Reply-To: <995b4eaf85a9dd1630b2b81755e30292ce4571e6.camel@kernel.org>
References: <995b4eaf85a9dd1630b2b81755e30292ce4571e6.camel@kernel.org>
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

On Sun, 2022-01-02 at 09:30 -0500, Jeff Layton wrote:
> I'm seeing a reproducible softlockup on amdgpu on v5.15.12:
>=20
> [  861.656146] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting=
 for DMUB idle: status=3D3
> [  861.914848] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting=
 for DMUB idle: status=3D3
> [  862.173368] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting=
 for DMUB idle: status=3D3
> [  862.381635] [drm] enabling link 0 failed: 15
> [  862.640908] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting=
 for DMUB idle: status=3D3
> [  862.743704] [drm:dcn20_wait_for_blank_complete [amdgpu]] *ERROR* DC: f=
ailed to blank crtc!
> [  863.002846] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting=
 for DMUB idle: status=3D3
> [  863.261451] [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting=
 for DMUB idle: status=3D3
> [  863.262090] [drm] REG_WAIT timeout 1us * 10 tries - optc3_lock line:11=
2
> [  863.532231] [drm] REG_WAIT timeout 1us * 100000 tries - optc1_wait_for=
_state line:835
> [  888.900914] watchdog: BUG: soft lockup - CPU#11 stuck for 26s! [gnome-=
shell:2306]
> [  888.900921] Modules linked in: uinput rfcomm snd_seq_dummy snd_hrtimer=
 rpcrdma rdma_cm iw_cm ib_cm ib_core nft_objref nf_conntrack_netbios_ns nf_=
conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reje=
ct_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat bridg=
e stp llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptab=
le_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle ipt=
able_raw iptable_security ip_set nf_tables nfnetlink ip6table_filter ip6_ta=
bles iptable_filter qrtr ns bnep vfat fat snd_hda_codec_realtek intel_rapl_=
msr snd_hda_codec_generic intel_rapl_common ledtrig_audio snd_hda_codec_hdm=
i snd_hda_intel snd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi snd_usb_au=
dio snd_hda_codec kvm_amd snd_hda_core btusb snd_usbmidi_lib btrtl snd_rawm=
idi snd_hwdep btbcm ppdev kvm snd_seq btintel uvcvideo snd_seq_device video=
buf2_vmalloc videobuf2_memops bluetooth videobuf2_v4l2 snd_pcm videobuf2_co=
mmon irqbypass wmi_bmof mxm_wmi
> [  888.900963]  pcspkr snd_timer rapl k10temp i2c_piix4 videodev snd ecdh=
_generic rfkill joydev soundcore mc parport_pc parport gpio_amdpt gpio_gene=
ric acpi_cpufreq nfsd auth_rpcgss nfs_acl lockd grace sunrpc zram ip_tables=
 amdgpu drm_ttm_helper ttm iommu_v2 gpu_sched i2c_algo_bit drm_kms_helper c=
ec drm crct10dif_pclmul crc32_pclmul crc32c_intel uas ccp ghash_clmulni_int=
el sp5100_tco usb_storage r8169 nvme nvme_core wmi ipmi_devintf ipmi_msghan=
dler fuse
> [  888.900989] CPU: 11 PID: 2306 Comm: gnome-shell Not tainted 5.15.12-20=
0.fc35.x86_64 #1
> [  888.900992] Hardware name: Micro-Star International Co., Ltd. MS-7A33/=
X370 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
> [  888.900993] RIP: 0010:delay_halt_mwaitx+0x39/0x40
> [  888.900999] Code: 03 05 cb b6 95 4d 31 d2 48 89 d1 0f 01 fa b8 ff ff f=
f ff b9 02 00 00 00 48 39 c6 48 0f 46 c6 48 89 c3 b8 f0 00 00 00 0f 01 fb <=
5b> c3 0f 1f 44 00 00 0f 1f 44 00 00 48 8b 05 9c 2f 03 01 e9 7f 47
> [  888.901001] RSP: 0018:ffffb7f243e63878 EFLAGS: 00000293
> [  888.901003] RAX: 00000000000000f0 RBX: 00000000002dc50a RCX: 000000000=
0000002
> [  888.901005] RDX: 0000000000000000 RSI: 00000000002dc50a RDI: 0000027b5=
712e506
> [  888.901006] RBP: 00000000002dc50a R08: ffffb7f243e63824 R09: 000000000=
0000001
> [  888.901007] R10: ffffb7f243e63660 R11: 000000000000000d R12: ffff917bd=
7190000
> [  888.901009] R13: ffff917dd4500000 R14: ffff917dd45006a0 R15: ffff917bd=
541fc00
> [  888.901010] FS:  00007f2912683d80(0000) GS:ffff918a9ecc0000(0000) knlG=
S:0000000000000000
> [  888.901011] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  888.901013] CR2: 000033910fce0000 CR3: 0000000105b22000 CR4: 000000000=
03506e0
> [  888.901014] Call Trace:
> [  888.901016]  <TASK>
> [  888.901018]  delay_halt+0x3b/0x60
> [  888.901021]  dcn20_post_unlock_program_front_end+0xf4/0x2c0 [amdgpu]
> [  888.901209]  dc_commit_state+0x4b6/0xa50 [amdgpu]
> [  888.901382]  amdgpu_dm_atomic_commit_tail+0x55c/0x2610 [amdgpu]
> [  888.901557]  ? dcn20_calculate_dlg_params+0x4f4/0x540 [amdgpu]
> [  888.901735]  ? dcn20_calculate_dlg_params+0x4f4/0x540 [amdgpu]
> [  888.901916]  ? dcn30_calculate_wm_and_dlg_fp+0x707/0x8a0 [amdgpu]
> [  888.902090]  ? dcn30_validate_bandwidth+0x10f/0x240 [amdgpu]
> [  888.902261]  ? kfree+0xaa/0x3f0
> [  888.902265]  ? dcn30_validate_bandwidth+0x10f/0x240 [amdgpu]
> [  888.902435]  ? dc_validate_global_state+0x31f/0x3c0 [amdgpu]
> [  888.902604]  ? ttm_bo_mem_compat+0x2c/0x90 [ttm]
> [  888.902609]  ? ttm_bo_validate+0x42/0x100 [ttm]
> [  888.902614]  ? __raw_callee_save___native_queued_spin_unlock+0x11/0x1e
> [  888.902619]  ? amdgpu_bo_destroy+0x70/0x70 [amdgpu]
> [  888.902746]  ? dm_plane_helper_prepare_fb+0x1f4/0x260 [amdgpu]
> [  888.902924]  ? __cond_resched+0x16/0x40
> [  888.902927]  ? __wait_for_common+0x2b/0x140
> [  888.902929]  ? __raw_callee_save___native_queued_spin_unlock+0x11/0x1e
> [  888.902934]  commit_tail+0x94/0x120 [drm_kms_helper]
> [  888.902955]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> [  888.902969]  drm_mode_atomic_ioctl+0x8fd/0xac0 [drm]
> [  888.902992]  ? __cond_resched+0x16/0x40
> [  888.902994]  ? drm_plane_get_damage_clips.cold+0x1c/0x1c [drm]
> [  888.903015]  ? drm_atomic_set_property+0xb30/0xb30 [drm]
> [  888.903035]  drm_ioctl_kernel+0x86/0xd0 [drm]
> [  888.903055]  ? wp_page_reuse+0x61/0x70
> [  888.903057]  drm_ioctl+0x220/0x3e0 [drm]
> [  888.903077]  ? drm_atomic_set_property+0xb30/0xb30 [drm]
> [  888.903097]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
> [  888.903222]  __x64_sys_ioctl+0x82/0xb0
> [  888.903226]  do_syscall_64+0x3b/0x90
> [  888.903228]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  888.903231] RIP: 0033:0x7f2918b362bb
> [  888.903234] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 8=
9 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3d 2b 0f 00 f7 d8 64 89 01 48
> [  888.903235] RSP: 002b:00007ffdd451da48 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  888.903237] RAX: ffffffffffffffda RBX: 00007ffdd451da90 RCX: 00007f291=
8b362bb
> [  888.903238] RDX: 00007ffdd451da90 RSI: 00000000c03864bc RDI: 000000000=
0000009
> [  888.903239] RBP: 00000000c03864bc R08: 0000000000000012 R09: 000000000=
0000012
> [  888.903240] R10: 0000000000000002 R11: 0000000000000246 R12: 000055bca=
d405c50
> [  888.903241] R13: 0000000000000009 R14: 000055bca9f13bc0 R15: 000055bca=
be0d6a0
> [  888.903243]  </TASK>
>=20
> (gdb) list *(dcn20_post_unlock_program_front_end+0xf4)
> 0x2561b4 is in dcn20_post_unlock_program_front_end (drivers/gpu/drm/amd/a=
mdgpu/../display/dc/dcn20/dcn20_hwseq.c:1766).
> 1761			if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bit=
s.enable) {
> 1762				struct hubp *hubp =3D pipe->plane_res.hubp;
> 1763				int j =3D 0;
> 1764=09
> 1765				for (j =3D 0; j < TIMEOUT_FOR_PIPE_ENABLE_MS*1000
> 1766						&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
> 1767					mdelay(1);
> 1768			}
> 1769		}
> 1770=09
>=20
> I can reproduce this by logging with GNOME on wayland, starting up the
> steam client and then letting the screen blank kick in. Note that
> starting an actual game is not necessary.  Once I try to unblank the
> screen (keypress or mouse movement), it never does and the machine goes
> into a soft lockup.
>=20
> The host is Fedora 35 with a stock kernels. I also see this with earlier
> v5.15 kernels. I haven't tested anything pre-5.15 though. If I log in
> with Xorg, I don't see the issue. Video card is:
>=20
> 30:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]=
 Navi 23 [Radeon RX 6600/6600 XT/6600M] (rev c7) (prog-if 00 [VGA controlle=
r])
>         Subsystem: Sapphire Technology Limited Device e447
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+ =
<TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 66
>         IOMMU group: 17
>         Region 0: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
>         Region 2: Memory at f0000000 (64-bit, prefetchable) [size=3D2M]
>         Region 4: I/O ports at e000 [size=3D256]
>         Region 5: Memory at fc800000 (32-bit, non-prefetchable) [size=3D1=
M]
>         Expansion ROM at 000c0000 [disabled] [size=3D128K]
>         Capabilities: <access denied>
>         Kernel driver in use: amdgpu
>         Kernel modules: amdgpu
>=20
> I'm able to test patches if it helps. Let me know if you want other info
> as well.
>=20
> Thanks!

Update. I just got the same soft lockup with Xorg as well. Here's the
stack trace. The problem looks basically the same. Not sure why it's
more easily reproducible under wayland, but it does seem to be:

Jan 03 15:16:08 tleilax kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR=
* Error waiting for DMUB idle: status=3D3
Jan 03 15:16:11 tleilax kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR=
* Error waiting for DMUB idle: status=3D3
Jan 03 15:16:11 tleilax kernel: [drm:dcn20_wait_for_blank_complete [amdgpu]=
] *ERROR* DC: failed to blank crtc!
Jan 03 15:16:11 tleilax kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR=
* Error waiting for DMUB idle: status=3D3
Jan 03 15:16:12 tleilax kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR=
* Error waiting for DMUB idle: status=3D3
Jan 03 15:16:12 tleilax kernel: [drm] REG_WAIT timeout 1us * 10 tries - opt=
c3_lock line:112
Jan 03 15:16:12 tleilax kernel: [drm] REG_WAIT timeout 1us * 100000 tries -=
 optc1_wait_for_state line:835
Jan 03 15:16:37 tleilax kernel: watchdog: BUG: soft lockup - CPU#1 stuck fo=
r 26s! [Xorg:2077]
Jan 03 15:16:37 tleilax kernel: Modules linked in: rpcsec_gss_krb5 vhost_ne=
t vhost vhost_iotlb tap tun rfcomm snd_seq_dummy snd_hrtimer rpcrdma rdma_c=
m iw_cm ib_cm ib_core nft_objref nf_conntrack_netbios_n>
Jan 03 15:16:37 tleilax kernel:  videobuf2_v4l2 irqbypass rapl videobuf2_co=
mmon snd_timer wmi_bmof mxm_wmi k10temp i2c_piix4 ecdh_generic pcspkr rfkil=
l videodev joydev snd mc soundcore parport_pc parport g>
Jan 03 15:16:37 tleilax kernel: CPU: 1 PID: 2077 Comm: Xorg Not tainted 5.1=
5.12-200.fc35.x86_64 #1
Jan 03 15:16:37 tleilax kernel: Hardware name: Micro-Star International Co.=
, Ltd. MS-7A33/X370 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
Jan 03 15:16:37 tleilax kernel: RIP: 0010:delay_halt_mwaitx+0x39/0x40
Jan 03 15:16:37 tleilax kernel: Code: 03 05 cb b6 95 53 31 d2 48 89 d1 0f 0=
1 fa b8 ff ff ff ff b9 02 00 00 00 48 39 c6 48 0f 46 c6 48 89 c3 b8 f0 00 0=
0 00 0f 01 fb <5b> c3 0f 1f 44 00 00 0f 1f 44 00 00 48 >
Jan 03 15:16:37 tleilax kernel: RSP: 0018:ffffa50683d2f870 EFLAGS: 00000297
Jan 03 15:16:37 tleilax kernel: RAX: 00000000000000f0 RBX: 00000000002dc570=
 RCX: 0000000000000002
Jan 03 15:16:37 tleilax kernel: RDX: 0000000000000000 RSI: 00000000002dc570=
 RDI: 00005c30244016bc
Jan 03 15:16:37 tleilax kernel: RBP: 00000000002dc570 R08: ffffa50683d2f81c=
 R09: 0000000000000001
Jan 03 15:16:37 tleilax kernel: R10: ffffa50683d2f658 R11: 000000000000000d=
 R12: ffff9466ce390000
Jan 03 15:16:37 tleilax kernel: R13: ffff9467c24e0000 R14: ffff9467c24e01e8=
 R15: ffff9466c11da000
Jan 03 15:16:37 tleilax kernel: FS:  00007f655a17bf00(0000) GS:ffff94759ea4=
0000(0000) knlGS:0000000000000000
Jan 03 15:16:37 tleilax kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Jan 03 15:16:37 tleilax kernel: CR2: 00007f32b95303a0 CR3: 000000010f644000=
 CR4: 00000000003506e0
Jan 03 15:16:37 tleilax kernel: Call Trace:
Jan 03 15:16:37 tleilax kernel:  <TASK>
Jan 03 15:16:37 tleilax kernel:  delay_halt+0x3b/0x60
Jan 03 15:16:37 tleilax kernel:  dcn20_post_unlock_program_front_end+0xf4/0=
x2c0 [amdgpu]
Jan 03 15:16:37 tleilax kernel:  dc_commit_state+0x4b6/0xa50 [amdgpu]
Jan 03 15:16:37 tleilax kernel:  amdgpu_dm_atomic_commit_tail+0x55c/0x2610 =
[amdgpu]
Jan 03 15:16:37 tleilax kernel:  ? dcn20_calculate_dlg_params+0x4f4/0x540 [=
amdgpu]
Jan 03 15:16:37 tleilax kernel:  ? dcn20_calculate_dlg_params+0x4f4/0x540 [=
amdgpu]
Jan 03 15:16:37 tleilax kernel:  ? dcn30_calculate_wm_and_dlg_fp+0x707/0x8a=
0 [amdgpu]
Jan 03 15:16:37 tleilax kernel:  ? dcn30_validate_bandwidth+0x10f/0x240 [am=
dgpu]
Jan 03 15:16:37 tleilax kernel:  ? kfree+0xaa/0x3f0
Jan 03 15:16:37 tleilax kernel:  ? dcn30_validate_bandwidth+0x10f/0x240 [am=
dgpu]
Jan 03 15:16:37 tleilax kernel:  ? dc_validate_global_state+0x31f/0x3c0 [am=
dgpu]
Jan 03 15:16:37 tleilax kernel:  ? ttm_bo_mem_compat+0x2c/0x90 [ttm]
Jan 03 15:16:37 tleilax kernel:  ? ttm_bo_validate+0x42/0x100 [ttm]
Jan 03 15:16:37 tleilax kernel:  ? dm_plane_helper_prepare_fb+0x1a9/0x260 [=
amdgpu]
Jan 03 15:16:37 tleilax kernel:  ? __cond_resched+0x16/0x40
Jan 03 15:16:37 tleilax kernel:  ? __wait_for_common+0x2b/0x140
Jan 03 15:16:37 tleilax kernel:  ? __raw_callee_save___native_queued_spin_u=
nlock+0x11/0x1e
Jan 03 15:16:37 tleilax kernel:  commit_tail+0x94/0x120 [drm_kms_helper]
Jan 03 15:16:37 tleilax kernel:  drm_atomic_helper_commit+0x113/0x140 [drm_=
kms_helper]
Jan 03 15:16:37 tleilax kernel:  drm_atomic_helper_set_config+0x70/0xb0 [dr=
m_kms_helper]
Jan 03 15:16:37 tleilax kernel:  drm_mode_setcrtc+0x1ab/0x6b0 [drm]
Jan 03 15:16:37 tleilax kernel:  ? drm_mode_getcrtc+0x170/0x170 [drm]
Jan 03 15:16:37 tleilax kernel:  drm_ioctl_kernel+0x86/0xd0 [drm]
Jan 03 15:16:37 tleilax kernel:  drm_ioctl+0x220/0x3e0 [drm]
Jan 03 15:16:37 tleilax kernel:  ? drm_mode_getcrtc+0x170/0x170 [drm]
Jan 03 15:16:37 tleilax kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Jan 03 15:16:37 tleilax kernel:  __x64_sys_ioctl+0x82/0xb0
Jan 03 15:16:37 tleilax kernel:  do_syscall_64+0x3b/0x90
Jan 03 15:16:37 tleilax kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
Jan 03 15:16:37 tleilax kernel: RIP: 0033:0x7f655a9f12bb
Jan 03 15:16:37 tleilax kernel: Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff f=
f ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 0=
0 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3d >
Jan 03 15:16:37 tleilax kernel: RSP: 002b:00007ffd327e0878 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000010
Jan 03 15:16:37 tleilax kernel: RAX: ffffffffffffffda RBX: 00007ffd327e08b0=
 RCX: 00007f655a9f12bb
Jan 03 15:16:37 tleilax kernel: RDX: 00007ffd327e08b0 RSI: 00000000c06864a2=
 RDI: 000000000000000e
Jan 03 15:16:37 tleilax kernel: RBP: 00000000c06864a2 R08: 0000000000000000=
 R09: 000056234be435b0
Jan 03 15:16:37 tleilax kernel: R10: 0000000000000000 R11: 0000000000000246=
 R12: 0000000000000000
Jan 03 15:16:37 tleilax kernel: R13: 000000000000000e R14: 000056234be435b0=
 R15: 0000000000000000
Jan 03 15:16:37 tleilax kernel:  </TASK>

--=20
Jeff Layton <jlayton@kernel.org>
