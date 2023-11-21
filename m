Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8887F344B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443D210E519;
	Tue, 21 Nov 2023 16:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346D010E519;
 Tue, 21 Nov 2023 16:54:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 72B7DB8229E;
 Tue, 21 Nov 2023 16:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096F6C433C9;
 Tue, 21 Nov 2023 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700585653;
 bh=ggMEQVMptL1gP2ssswx/B/yRr3jRciGVTal5ACQE5iY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ekJBVb3lVDIvlO+WEsvH0wCbj3mJhKTAbJdC4ewnEBKNE/bp5tJA2FHm45cSyCMXS
 pAq9m4k4fbP0KAO12n8yZBd8+7yKYYtF131d2bNzOACzyhGV8x0YOb122uM2037eM9
 VDlauIY9GHPeJ/+to1LB6gxiu2d2Nl3QPZAqjbP+lODvmTtF9RpFNCekl4w2ELiU4Y
 gqLrVOaOJaavKp/M53cEs0ui4HYDs5a+Uai3fERPM4RH/ffVqjlyRAmVYplYLuEMpo
 NXk523OixNVrsBgN4+f5EAzsNXbDdbd6wV3fpa1tnFoC5b/9zDNU8JrL4VQcc/kslY
 a50H+HgWDXDAg==
Message-ID: <40ce0006363954e5974a47ae53d1a3c84b292680.camel@kernel.org>
Subject: Re: WARNING in allocate_mst_payload
From: Jeff Layton <jlayton@kernel.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Date: Tue, 21 Nov 2023 11:54:11 -0500
In-Reply-To: <50222784-bab3-4a2b-bd3f-b4399306e373@amd.com>
References: <7597787ef3518240dcfa045d5232bbb73673ee59.camel@kernel.org>
 <50222784-bab3-4a2b-bd3f-b4399306e373@amd.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 kZWuOsJdJQdmwlWC5L5ln9xgfr/4mOY38B0U=
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The monitors are individually connected to the same card. The Dell 34"
is connected via displayport, and the Sceptre monitor is connected via
HDMI.

Thanks,
Jeff


On Tue, 2023-11-21 at 14:13 +0100, Christian K=F6nig wrote:
> Hi Jeff,
>=20
> first of all adding Harry from our display team.
>=20
>  From a quick look the obvious missing information is how are your=20
> monitors wired up? Are those individually DP or HDMI connected to the PC=
=20
> or are they daisy chained through MST?
>=20
> If it's daisy chained please double check that you don't have a faulty=
=20
> connection and maybe individually connect them for a test if possible.
>=20
> Regards,
> Christian.
>=20
> Am 21.11.23 um 14:01 schrieb Jeff Layton:
> > I have a recurring problem where my workstation tries to put the monito=
r
> > to sleep, which triggers a warning down in the depths of the video card
> > driver. When I return to the machine the monitor is black, but not in
> > powersave mode and all of the windows on my desktop have been shuffled
> > off to the second monitor.
> >=20
> > I've seen this since at least v6.3 or so (though the problem may predat=
e
> > that). The kernel is stock Fedora kernel. It's occurs fairly reliably,
> > and I'm happy to help test patches.
> >=20
> > I took a quick look at the sources and the reported line corresponds
> > with this assertion in  allocate_mst_payload:
> >=20
> >          ASSERT(proposed_table.stream_count > 0);
> >=20
> > I've attached the output from wayland-info, and the stack traces follow=
.
> > Let me know if any other info would be helpful.
> >=20
> >=20
> > [ 4655.946669] ------------[ cut here ]------------
> > [ 4655.946677] WARNING: CPU: 12 PID: 3979 at drivers/gpu/drm/amd/amdgpu=
/../display/dc/link/link_dpms.c:1484 link_set_dpms_on+0xbe5/0xca0 [amdgpu]
> > [ 4655.947689] Modules linked in: uinput xt_mark rfcomm snd_seq_dummy s=
nd_hrtimer rpcrdma rdma_cm iw_cm ib_cm ib_core tun xt_CHECKSUM xt_MASQUERAD=
E xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbio=
s_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib =
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_n=
at ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat =
nf_nat bridge nf_conntrack stp llc nf_defrag_ipv6 nf_defrag_ipv4 iptable_ma=
ngle iptable_raw iptable_security ip_set nf_tables nfnetlink ip6table_filte=
r iptable_filter qrtr bnep binfmt_misc xfs vfat fat ppdev snd_hda_codec_rea=
ltek snd_hda_codec_generic intel_rapl_msr snd_hda_codec_hdmi ledtrig_audio =
snd_hda_intel intel_rapl_common snd_intel_dspcfg edac_mce_amd snd_intel_sdw=
_acpi snd_usb_audio snd_hda_codec uvcvideo kvm_amd btusb snd_usbmidi_lib sn=
d_hda_core btrtl snd_ump btbcm snd_rawmidi btintel snd_hwdep uvc btmtk kvm =
videobuf2_vmalloc videobuf2_memops bluetooth snd_seq
> > [ 4655.947889]  snd_seq_device irqbypass videobuf2_v4l2 rapl xpad video=
buf2_common snd_pcm ff_memless wmi_bmof mxm_wmi pcspkr acpi_cpufreq videode=
v k10temp rfkill i2c_piix4 snd_timer snd mc soundcore parport_pc parport gp=
io_amdpt gpio_generic joydev nfsd auth_rpcgss nfs_acl lockd grace sunrpc lo=
op zram amdgpu i2c_algo_bit drm_ttm_helper ttm video drm_suballoc_helper ua=
s amdxcp iommu_v2 crct10dif_pclmul crc32_pclmul drm_buddy crc32c_intel gpu_=
sched polyval_clmulni usb_storage r8169 polyval_generic drm_display_helper =
nvme ghash_clmulni_intel nvme_core ccp sha512_ssse3 cec sp5100_tco nvme_com=
mon wmi scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multi=
path fuse
> > [ 4655.948051] CPU: 12 PID: 3979 Comm: KMS thread Kdump: loaded Not tai=
nted 6.5.11-300.fc39.x86_64 #1
> > [ 4655.948058] Hardware name: Micro-Star International Co., Ltd. MS-7A3=
3/X370 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
> > [ 4655.948062] RIP: 0010:link_set_dpms_on+0xbe5/0xca0 [amdgpu]
> > [ 4655.949058] Code: e9 3f fc ff ff 48 c7 c7 98 c7 20 c1 e8 d4 33 e8 e4=
 e9 c0 fe ff ff 48 8b bb d0 01 00 00 48 89 de e8 40 d0 ed ff e9 25 ff ff ff=
 <0f> 0b e9 88 fd ff ff 41 c6 85 50 04 00 00 00 e9 d1 f8 ff ff 49 8b
> > [ 4655.949064] RSP: 0018:ffffbe344ac2b430 EFLAGS: 00010246
> > [ 4655.949071] RAX: 0000000000000000 RBX: ffff953f0bfab000 RCX: 0000000=
000000005
> > [ 4655.949076] RDX: ffffffffc120c6a8 RSI: 0000000000000002 RDI: 0000000=
000000000
> > [ 4655.949080] RBP: ffff953f0bfab000 R08: 0000000000000000 R09: 0000000=
000000005
> > [ 4655.949084] R10: ffff953ece152800 R11: ffff953ed0eb9960 R12: ffff954=
01e4c0b38
> > [ 4655.949088] R13: 0000000000000006 R14: ffff953ed99c0000 R15: ffff954=
01e4c0df0
> > [ 4655.949093] FS:  00007fba5b8856c0(0000) GS:ffff954d9ed00000(0000) kn=
lGS:0000000000000000
> > [ 4655.949099] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 4655.949104] CR2: 00001eca52061810 CR3: 00000001ad4ac000 CR4: 0000000=
0003506e0
> > [ 4655.949109] Call Trace:
> > [ 4655.949114]  <TASK>
> > [ 4655.949118]  ? link_set_dpms_on+0xbe5/0xca0 [amdgpu]
> > [ 4655.950106]  ? __warn+0x81/0x130
> > [ 4655.950118]  ? link_set_dpms_on+0xbe5/0xca0 [amdgpu]
> > [ 4655.951130]  ? report_bug+0x171/0x1a0
> > [ 4655.951144]  ? handle_bug+0x3c/0x80
> > [ 4655.951153]  ? exc_invalid_op+0x17/0x70
> > [ 4655.951160]  ? asm_exc_invalid_op+0x1a/0x20
> > [ 4655.951178]  ? link_set_dpms_on+0xbe5/0xca0 [amdgpu]
> > [ 4655.952193]  dce110_apply_ctx_to_hw+0x535/0x700 [amdgpu]
> > [ 4655.953141]  dc_commit_state_no_check+0x3cd/0xef0 [amdgpu]
> > [ 4655.954083]  dc_commit_streams+0x29b/0x400 [amdgpu]
> > [ 4655.955032]  amdgpu_dm_atomic_commit_tail+0x5e8/0x3b10 [amdgpu]
> > [ 4655.956023]  ? dcn30_populate_dml_writeback_from_context+0x35/0x50 [=
amdgpu]
> > [ 4655.956963]  ? srso_return_thunk+0x5/0x10
> > [ 4655.956972]  ? dcn30_populate_dml_writeback_from_context+0x35/0x50 [=
amdgpu]
> > [ 4655.957912]  ? srso_return_thunk+0x5/0x10
> > [ 4655.957926]  ? srso_return_thunk+0x5/0x10
> > [ 4655.957934]  ? srso_return_thunk+0x5/0x10
> > [ 4655.957940]  ? dcn30_internal_validate_bw+0x992/0x9d0 [amdgpu]
> > [ 4655.958891]  ? srso_return_thunk+0x5/0x10
> > [ 4655.958899]  ? dcn30_validate_bandwidth+0x101/0x2b0 [amdgpu]
> > [ 4655.959843]  ? srso_return_thunk+0x5/0x10
> > [ 4655.959850]  ? dc_validate_global_state+0x30a/0x3e0 [amdgpu]
> > [ 4655.960781]  ? srso_return_thunk+0x5/0x10
> > [ 4655.960787]  ? dma_resv_iter_first_unlocked+0x66/0x70
> > [ 4655.960795]  ? srso_return_thunk+0x5/0x10
> > [ 4655.960801]  ? dma_resv_get_fences+0x61/0x220
> > [ 4655.960814]  ? srso_return_thunk+0x5/0x10
> > [ 4655.960820]  ? dma_resv_get_singleton+0x46/0x140
> > [ 4655.960829]  ? srso_return_thunk+0x5/0x10
> > [ 4655.960835]  ? wait_for_completion_timeout+0x13e/0x170
> > [ 4655.960841]  ? wait_for_completion_interruptible+0x139/0x1e0
> > [ 4655.960856]  commit_tail+0x94/0x130
> > [ 4655.960866]  drm_atomic_helper_commit+0x11a/0x140
> > [ 4655.960875]  drm_atomic_commit+0x9a/0xd0
> > [ 4655.960884]  ? __pfx___drm_printfn_info+0x10/0x10
> > [ 4655.960895]  drm_mode_atomic_ioctl+0x9b5/0xbc0
> > [ 4655.960916]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > [ 4655.960925]  drm_ioctl_kernel+0xcd/0x170
> > [ 4655.960937]  drm_ioctl+0x26d/0x4b0
> > [ 4655.960945]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > [ 4655.960965]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
> > [ 4655.961776]  __x64_sys_ioctl+0x97/0xd0
> > [ 4655.961788]  do_syscall_64+0x60/0x90
> > [ 4655.961799]  ? srso_return_thunk+0x5/0x10
> > [ 4655.961805]  ? __pm_runtime_suspend+0x4a/0xd0
> > [ 4655.961815]  ? srso_return_thunk+0x5/0x10
> > [ 4655.961821]  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu]
> > [ 4655.962614]  ? srso_return_thunk+0x5/0x10
> > [ 4655.962620]  ? __x64_sys_ioctl+0xaf/0xd0
> > [ 4655.962628]  ? srso_return_thunk+0x5/0x10
> > [ 4655.962634]  ? syscall_exit_to_user_mode+0x2b/0x40
> > [ 4655.962641]  ? srso_return_thunk+0x5/0x10
> > [ 4655.962647]  ? do_syscall_64+0x6c/0x90
> > [ 4655.962655]  ? srso_return_thunk+0x5/0x10
> > [ 4655.962661]  ? exc_page_fault+0x7f/0x180
> > [ 4655.962669]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > [ 4655.962678] RIP: 0033:0x7fba8212f13d
> > [ 4655.962721] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7=
 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05=
 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> > [ 4655.962727] RSP: 002b:00007fba5b8839c0 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000010
> > [ 4655.962735] RAX: ffffffffffffffda RBX: 00007fba5000f490 RCX: 00007fb=
a8212f13d
> > [ 4655.962739] RDX: 00007fba5b883a60 RSI: 00000000c03864bc RDI: 0000000=
00000000c
> > [ 4655.962743] RBP: 00007fba5b883a10 R08: 0000000000000210 R09: 0000000=
000000001
> > [ 4655.962748] R10: 0000000000000013 R11: 0000000000000246 R12: 00007fb=
a5b883a60
> > [ 4655.962752] R13: 00000000c03864bc R14: 000000000000000c R15: 00007fb=
a50003490
> > [ 4655.962766]  </TASK>
> > [ 4655.962770] ---[ end trace 0000000000000000 ]---
> > [ 4656.050004] show_signal_msg: 2 callbacks suppressed
> > [ 4656.050010] fwupd[5178]: segfault at 7ffd114f5b38 ip 00007f26010cd85=
4 sp 00007ffd114f5b20 error 6 in libc.so.6[7f2601094000+160000] likely on C=
PU 10 (core 2, socket 0)
> > [ 4656.050037] Code: 66 0f 1f 44 00 00 f3 0f 1e fa 55 48 89 e5 41 57 49=
 89 d7 41 56 49 89 f6 41 55 49 89 fd 4c 89 f7 41 54 53 48 81 ec e8 04 00 00=
 <48> 89 b5 08 fb ff ff be 25 00 00 00 89 8d 28 fb ff ff 64 48 8b 04
> > [ 4656.141037] [drm] DM_MST: starting TM on aconnector: 00000000304b308=
f [id: 91]
> > [ 4656.148780] [drm] DM_MST: DP12, 4-lane link detected
> > [ 4656.260614] ------------[ cut here ]------------
> > [ 4656.260619] WARNING: CPU: 1 PID: 192 at drivers/gpu/drm/amd/amdgpu/.=
./display/amdgpu_dm/amdgpu_dm_helpers.c:236 dm_helpers_construct_old_payloa=
d+0xc6/0xe0 [amdgpu]
> > [ 4656.261123] Modules linked in: uinput xt_mark rfcomm snd_seq_dummy s=
nd_hrtimer rpcrdma rdma_cm iw_cm ib_cm ib_core tun xt_CHECKSUM xt_MASQUERAD=
E xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbio=
s_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib =
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_n=
at ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat =
nf_nat bridge nf_conntrack stp llc nf_defrag_ipv6 nf_defrag_ipv4 iptable_ma=
ngle iptable_raw iptable_security ip_set nf_tables nfnetlink ip6table_filte=
r iptable_filter qrtr bnep binfmt_misc xfs vfat fat ppdev snd_hda_codec_rea=
ltek snd_hda_codec_generic intel_rapl_msr snd_hda_codec_hdmi ledtrig_audio =
snd_hda_intel intel_rapl_common snd_intel_dspcfg edac_mce_amd snd_intel_sdw=
_acpi snd_usb_audio snd_hda_codec uvcvideo kvm_amd btusb snd_usbmidi_lib sn=
d_hda_core btrtl snd_ump btbcm snd_rawmidi btintel snd_hwdep uvc btmtk kvm =
videobuf2_vmalloc videobuf2_memops bluetooth snd_seq
> > [ 4656.261212]  snd_seq_device irqbypass videobuf2_v4l2 rapl xpad video=
buf2_common snd_pcm ff_memless wmi_bmof mxm_wmi pcspkr acpi_cpufreq videode=
v k10temp rfkill i2c_piix4 snd_timer snd mc soundcore parport_pc parport gp=
io_amdpt gpio_generic joydev nfsd auth_rpcgss nfs_acl lockd grace sunrpc lo=
op zram amdgpu i2c_algo_bit drm_ttm_helper ttm video drm_suballoc_helper ua=
s amdxcp iommu_v2 crct10dif_pclmul crc32_pclmul drm_buddy crc32c_intel gpu_=
sched polyval_clmulni usb_storage r8169 polyval_generic drm_display_helper =
nvme ghash_clmulni_intel nvme_core ccp sha512_ssse3 cec sp5100_tco nvme_com=
mon wmi scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multi=
path fuse
> > [ 4656.261286] CPU: 1 PID: 192 Comm: kworker/u64:7 Kdump: loaded Tainte=
d: G        W          6.5.11-300.fc39.x86_64 #1
> > [ 4656.261289] Hardware name: Micro-Star International Co., Ltd. MS-7A3=
3/X370 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
> > [ 4656.261292] Workqueue: events_unbound commit_work
> > [ 4656.261298] RIP: 0010:dm_helpers_construct_old_payload+0xc6/0xe0 [am=
dgpu]
> > [ 4656.261730] Code: 0f af d2 41 89 50 10 39 c8 74 1f 48 8b 84 24 98 00=
 00 00 65 48 2b 04 25 28 00 00 00 75 14 48 81 c4 a0 00 00 00 e9 ba 0d 4e e5=
 <0f> 0b eb dd 31 c0 eb d5 e8 dd 83 4c e5 66 66 2e 0f 1f 84 00 00 00
> > [ 4656.261732] RSP: 0018:ffffbe3440f2f5a0 EFLAGS: 00010246
> > [ 4656.261735] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
> > [ 4656.261737] RDX: ffff953f8bebc998 RSI: ffff953ece152bb0 RDI: ffffbe3=
440f2f638
> > [ 4656.261739] RBP: ffff953f0bfab000 R08: ffffbe3440f2f648 R09: ffff953=
ece152800
> > [ 4656.261741] R10: 0000000000000028 R11: 0000000000000100 R12: ffffbe3=
440f2f70c
> > [ 4656.261743] R13: ffff9540b47d59c0 R14: ffff953ecfbb4578 R15: ffff953=
f8bebc960
> > [ 4656.261745] FS:  0000000000000000(0000) GS:ffff954d9ea40000(0000) kn=
lGS:0000000000000000
> > [ 4656.261747] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 4656.261750] CR2: 00007fba60548000 CR3: 0000000105c3c000 CR4: 0000000=
0003506e0
> > [ 4656.261752] Call Trace:
> > [ 4656.261755]  <TASK>
> > [ 4656.261757]  ? dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu]
> > [ 4656.262179]  ? __warn+0x81/0x130
> > [ 4656.262186]  ? dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu]
> > [ 4656.262733]  ? report_bug+0x171/0x1a0
> > [ 4656.262741]  ? handle_bug+0x3c/0x80
> > [ 4656.262746]  ? exc_invalid_op+0x17/0x70
> > [ 4656.262751]  ? asm_exc_invalid_op+0x1a/0x20
> > [ 4656.262760]  ? dm_helpers_construct_old_payload+0xc6/0xe0 [amdgpu]
> > [ 4656.263323]  dm_helpers_dp_mst_write_payload_allocation_table+0xb0/0=
x120 [amdgpu]
> > [ 4656.263804]  link_set_dpms_off+0x6ec/0x8c0 [amdgpu]
> > [ 4656.264271]  dcn20_reset_hw_ctx_wrap+0x155/0x440 [amdgpu]
> > [ 4656.264724]  dce110_apply_ctx_to_hw+0x6e/0x700 [amdgpu]
> > [ 4656.265124]  ? srso_return_thunk+0x5/0x10
> > [ 4656.265129]  ? __free_pages_ok+0x256/0x550
> > [ 4656.265137]  dc_commit_state_no_check+0x3cd/0xef0 [amdgpu]
> > [ 4656.265538]  dc_commit_streams+0x29b/0x400 [amdgpu]
> > [ 4656.265950]  amdgpu_dm_atomic_commit_tail+0x5e8/0x3b10 [amdgpu]
> > [ 4656.266373]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266376]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266380]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266382]  ? __iommu_dma_map+0x84/0xf0
> > [ 4656.266389]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266391]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266396]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266399]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266401]  ? dm_read_reg_func+0x3b/0xb0 [amdgpu]
> > [ 4656.266830]  ? srso_return_thunk+0x5/0x10
> > [ 4656.266833]  ? dm_read_reg_func+0x3b/0xb0 [amdgpu]
> > [ 4656.267253]  ? srso_return_thunk+0x5/0x10
> > [ 4656.267257]  ? generic_reg_get+0x21/0x40 [amdgpu]
> > [ 4656.267657]  ? srso_return_thunk+0x5/0x10
> > [ 4656.267660]  ? optc1_get_crtc_scanoutpos+0x7b/0xb0 [amdgpu]
> > [ 4656.268068]  ? srso_return_thunk+0x5/0x10
> > [ 4656.268071]  ? srso_return_thunk+0x5/0x10
> > [ 4656.268074]  ? srso_return_thunk+0x5/0x10
> > [ 4656.268076]  ? srso_return_thunk+0x5/0x10
> > [ 4656.268079]  ? ktime_get+0x3f/0xa0
> > [ 4656.268083]  ? srso_return_thunk+0x5/0x10
> > [ 4656.268086]  ? amdgpu_display_get_crtc_scanoutpos+0xaa/0x190 [amdgpu=
]
> > [ 4656.268431]  ? __pfx_amdgpu_crtc_get_scanout_position+0x10/0x10 [amd=
gpu]
> > [ 4656.268783]  ? srso_return_thunk+0x5/0x10
> > [ 4656.268786]  ? amdgpu_crtc_get_scanout_position+0x28/0x40 [amdgpu]
> > [ 4656.269130]  ? srso_return_thunk+0x5/0x10
> > [ 4656.269133]  ? drm_crtc_vblank_helper_get_vblank_timestamp_internal+=
0xf6/0x3a0
> > [ 4656.269140]  ? srso_return_thunk+0x5/0x10
> > [ 4656.269143]  ? wait_for_completion_timeout+0x13e/0x170
> > [ 4656.269146]  ? srso_return_thunk+0x5/0x10
> > [ 4656.269149]  ? drm_crtc_get_last_vbltimestamp+0x58/0x90
> > [ 4656.269155]  commit_tail+0x94/0x130
> > [ 4656.269161]  process_one_work+0x1e1/0x3f0
> > [ 4656.269166]  worker_thread+0x51/0x390
> > [ 4656.269171]  ? __pfx_worker_thread+0x10/0x10
> > [ 4656.269174]  kthread+0xe8/0x120
> > [ 4656.269178]  ? __pfx_kthread+0x10/0x10
> > [ 4656.269182]  ret_from_fork+0x34/0x50
> > [ 4656.269187]  ? __pfx_kthread+0x10/0x10
> > [ 4656.269191]  ret_from_fork_asm+0x1b/0x30
> > [ 4656.269200]  </TASK>
> > [ 4656.269202] ---[ end trace 0000000000000000 ]---
> > [ 4656.269233] ------------[ cut here ]------------
> > [ 4656.269235] WARNING: CPU: 1 PID: 192 at drivers/gpu/drm/amd/amdgpu/.=
./display/amdgpu_dm/amdgpu_dm_helpers.c:182 fill_dc_mst_payload_table_from_=
drm+0x94/0x140 [amdgpu]
> > [ 4656.269661] Modules linked in: uinput xt_mark rfcomm snd_seq_dummy s=
nd_hrtimer rpcrdma rdma_cm iw_cm ib_cm ib_core tun xt_CHECKSUM xt_MASQUERAD=
E xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbio=
s_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib =
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_n=
at ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat =
nf_nat bridge nf_conntrack stp llc nf_defrag_ipv6 nf_defrag_ipv4 iptable_ma=
ngle iptable_raw iptable_security ip_set nf_tables nfnetlink ip6table_filte=
r iptable_filter qrtr bnep binfmt_misc xfs vfat fat ppdev snd_hda_codec_rea=
ltek snd_hda_codec_generic intel_rapl_msr snd_hda_codec_hdmi ledtrig_audio =
snd_hda_intel intel_rapl_common snd_intel_dspcfg edac_mce_amd snd_intel_sdw=
_acpi snd_usb_audio snd_hda_codec uvcvideo kvm_amd btusb snd_usbmidi_lib sn=
d_hda_core btrtl snd_ump btbcm snd_rawmidi btintel snd_hwdep uvc btmtk kvm =
videobuf2_vmalloc videobuf2_memops bluetooth snd_seq
> > [ 4656.269752]  snd_seq_device irqbypass videobuf2_v4l2 rapl xpad video=
buf2_common snd_pcm ff_memless wmi_bmof mxm_wmi pcspkr acpi_cpufreq videode=
v k10temp rfkill i2c_piix4 snd_timer snd mc soundcore parport_pc parport gp=
io_amdpt gpio_generic joydev nfsd auth_rpcgss nfs_acl lockd grace sunrpc lo=
op zram amdgpu i2c_algo_bit drm_ttm_helper ttm video drm_suballoc_helper ua=
s amdxcp iommu_v2 crct10dif_pclmul crc32_pclmul drm_buddy crc32c_intel gpu_=
sched polyval_clmulni usb_storage r8169 polyval_generic drm_display_helper =
nvme ghash_clmulni_intel nvme_core ccp sha512_ssse3 cec sp5100_tco nvme_com=
mon wmi scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multi=
path fuse
> > [ 4656.269825] CPU: 1 PID: 192 Comm: kworker/u64:7 Kdump: loaded Tainte=
d: G        W          6.5.11-300.fc39.x86_64 #1
> > [ 4656.269829] Hardware name: Micro-Star International Co., Ltd. MS-7A3=
3/X370 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
> > [ 4656.269831] Workqueue: events_unbound commit_work
> > [ 4656.269835] RIP: 0010:fill_dc_mst_payload_table_from_drm+0x94/0x140 =
[amdgpu]
> > [ 4656.270256] Code: 09 31 d2 48 89 c1 eb 0b 83 c2 01 48 83 c1 18 39 d6=
 74 17 40 38 39 75 f0 48 63 ca 31 ff 48 8d 0c 49 66 89 7c cc 28 39 d6 75 22=
 <0f> 0b eb 1e 0f b7 5a 0c 0f b7 05 37 e2 73 00 48 8d 0c 76 8a 42 09
> > [ 4656.270259] RSP: 0018:ffffbe3440f2f588 EFLAGS: 00010246
> > [ 4656.270262] RAX: ffffbe3440f2f5b0 RBX: 0000000000000000 RCX: 0000000=
000000000
> > [ 4656.270264] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffbe3=
440f2f630
> > [ 4656.270266] RBP: ffff953f0bfab000 R08: ffffbe3440f2f70c R09: 0000000=
000000000
> > [ 4656.270268] R10: 0000000000000028 R11: 0000000000000100 R12: ffffbe3=
440f2f70c
> > [ 4656.270270] R13: ffffbe3440f2f648 R14: ffff953ecfbb4578 R15: ffff953=
f8bebc960
> > [ 4656.270272] FS:  0000000000000000(0000) GS:ffff954d9ea40000(0000) kn=
lGS:0000000000000000
> > [ 4656.270275] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 4656.270277] CR2: 00007fba60548000 CR3: 0000000105c3c000 CR4: 0000000=
0003506e0
> > [ 4656.270279] Call Trace:
> > [ 4656.270281]  <TASK>
> > [ 4656.270282]  ? fill_dc_mst_payload_table_from_drm+0x94/0x140 [amdgpu=
]
> > [ 4656.270707]  ? __warn+0x81/0x130
> > [ 4656.270712]  ? fill_dc_mst_payload_table_from_drm+0x94/0x140 [amdgpu=
]
> > [ 4656.271135]  ? report_bug+0x171/0x1a0
> > [ 4656.271141]  ? handle_bug+0x3c/0x80
> > [ 4656.271144]  ? exc_invalid_op+0x17/0x70
> > [ 4656.271148]  ? asm_exc_invalid_op+0x1a/0x20
> > [ 4656.271155]  ? fill_dc_mst_payload_table_from_drm+0x94/0x140 [amdgpu=
]
> > [ 4656.271587]  dm_helpers_dp_mst_write_payload_allocation_table+0xd6/0=
x120 [amdgpu]
> > [ 4656.272011]  link_set_dpms_off+0x6ec/0x8c0 [amdgpu]
> > [ 4656.272437]  dcn20_reset_hw_ctx_wrap+0x155/0x440 [amdgpu]
> > [ 4656.272857]  dce110_apply_ctx_to_hw+0x6e/0x700 [amdgpu]
> > [ 4656.273256]  ? srso_return_thunk+0x5/0x10
> > [ 4656.273260]  ? __free_pages_ok+0x256/0x550
> > [ 4656.273268]  dc_commit_state_no_check+0x3cd/0xef0 [amdgpu]
> > [ 4656.273673]  dc_commit_streams+0x29b/0x400 [amdgpu]
> > [ 4656.274077]  amdgpu_dm_atomic_commit_tail+0x5e8/0x3b10 [amdgpu]
> > [ 4656.274500]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274504]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274507]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274510]  ? __iommu_dma_map+0x84/0xf0
> > [ 4656.274516]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274518]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274523]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274526]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274528]  ? dm_read_reg_func+0x3b/0xb0 [amdgpu]
> > [ 4656.274954]  ? srso_return_thunk+0x5/0x10
> > [ 4656.274957]  ? dm_read_reg_func+0x3b/0xb0 [amdgpu]
> > [ 4656.275377]  ? srso_return_thunk+0x5/0x10
> > [ 4656.275380]  ? generic_reg_get+0x21/0x40 [amdgpu]
> > [ 4656.275776]  ? srso_return_thunk+0x5/0x10
> > [ 4656.275779]  ? optc1_get_crtc_scanoutpos+0x7b/0xb0 [amdgpu]
> > [ 4656.276190]  ? srso_return_thunk+0x5/0x10
> > [ 4656.276193]  ? srso_return_thunk+0x5/0x10
> > [ 4656.276196]  ? srso_return_thunk+0x5/0x10
> > [ 4656.276199]  ? srso_return_thunk+0x5/0x10
> > [ 4656.276201]  ? ktime_get+0x3f/0xa0
> > [ 4656.276206]  ? srso_return_thunk+0x5/0x10
> > [ 4656.276208]  ? amdgpu_display_get_crtc_scanoutpos+0xaa/0x190 [amdgpu=
]
> > [ 4656.276563]  ? __pfx_amdgpu_crtc_get_scanout_position+0x10/0x10 [amd=
gpu]
> > [ 4656.276908]  ? srso_return_thunk+0x5/0x10
> > [ 4656.276911]  ? amdgpu_crtc_get_scanout_position+0x28/0x40 [amdgpu]
> > [ 4656.277254]  ? srso_return_thunk+0x5/0x10
> > [ 4656.277257]  ? drm_crtc_vblank_helper_get_vblank_timestamp_internal+=
0xf6/0x3a0
> > [ 4656.277264]  ? srso_return_thunk+0x5/0x10
> > [ 4656.277267]  ? wait_for_completion_timeout+0x13e/0x170
> > [ 4656.277270]  ? srso_return_thunk+0x5/0x10
> > [ 4656.277273]  ? drm_crtc_get_last_vbltimestamp+0x58/0x90
> > [ 4656.277279]  commit_tail+0x94/0x130
> > [ 4656.277284]  process_one_work+0x1e1/0x3f0
> > [ 4656.277289]  worker_thread+0x51/0x390
> > [ 4656.277293]  ? __pfx_worker_thread+0x10/0x10
> > [ 4656.277296]  kthread+0xe8/0x120
> > [ 4656.277301]  ? __pfx_kthread+0x10/0x10
> > [ 4656.277305]  ret_from_fork+0x34/0x50
> > [ 4656.277309]  ? __pfx_kthread+0x10/0x10
> > [ 4656.277312]  ret_from_fork_asm+0x1b/0x30
> > [ 4656.277321]  </TASK>
> > [ 4656.277323] ---[ end trace 0000000000000000 ]---
> >=20
>=20

--=20
Jeff Layton <jlayton@kernel.org>
