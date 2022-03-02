Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F94CA01A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BB710EEBB;
	Wed,  2 Mar 2022 08:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA0910EEC7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 08:57:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8372EB81ED1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 08:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DE02C340F2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646211474;
 bh=zEJCsu9Ft6v/8QqpEB9XYa210Rig4YFxKdt+caP56Y4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=onAMeak42J8o4+X7QgAe3gTXH6Tj8duxAHyf/yOoILUvnJuK7nzTenY7Iw3HMi2hu
 CesH+OHgJ1gDeWCK0aL+dt0ux19BlQ6MrS17koSr+p22e4z8JrmG7TwPp0H5RvP3Jq
 0aA8+ISIWaupMjuV+74L7UB69K+FVx+JbwBTWA1oyr0pKFdXhbIBYAWH+P2mstJgIL
 30gW08KS2wLOMnaoBLLWn8sO9YKW9nFHyJEuBxgMRwDPGaWTvJVIgU35fs4Vy04lZw
 8hQwJzPFb3C3dwdl22C1ROZvb3J3bWlInIDcPa8QorGi6ZbO4Dv2R+65dESCvTco0t
 bq/+rACr1zK8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2FF98CAC6E2; Wed,  2 Mar 2022 08:57:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215648] amdgpu: Changing monitor configuration
 (plug/unplug/wake from DPMS) causes kernel panic
Date: Wed, 02 Mar 2022 08:57:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pr_kernel@tum.fail
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215648-2300-iqy2ihl5eh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215648-2300@https.bugzilla.kernel.org/>
References: <bug-215648-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215648

--- Comment #2 from Philipp Riederer (pr_kernel@tum.fail) ---
Hey,

this is the log I could recover:

> <4>[   70.829010] RSP: 0018:ffffad060ad67838 EFLAGS: 00000202
> <4>[   70.829013] RAX: 0000000000000000 RBX: ffff92c82ff28000 RCX:
> 00000000000001f5
> <4>[   70.829014] RDX: ffffffffc2fc3970 RSI: ffffffffc3047f09 RDI:
> 0000000000000000
> <4>[   70.829014] RBP: 0000000000000012 R08: 0000000000000000 R09:
> ffffad060ad67610
> <4>[   70.829015] R10: ffffad060ad67608 R11: ffffffff9b743bc8 R12:
> ffff92c827b30c00
> <4>[   70.829016] R13: ffff92c7e0b35000 R14: ffff92c82c8c0000 R15:
> ffff92c82c8c0b58
> <4>[   70.829017] FS:  0000000000000000(0000) GS:ffff92cabf900000(0000)
> knlGS:0000000000000000
> <4>[   70.829018] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   70.829018] CR2: 00007f2afe48ef20 CR3: 000000014a5b4000 CR4:
> 0000000000350ee0
> <0>[   70.829020] Kernel panic - not syncing: Fatal exception in interrupt
> <0>[   70.829047] Kernel Offset: 0x19000000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> <4>[   70.741431] ---[ end trace d042cf4ec67f5116 ]---
> <4>[   70.829001] RIP: 0010:kgdb_breakpoint+0x10/0x20
> <4>[   70.829009] Code: c0 c3 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 31 c=
0 c3
> 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 f0 ff 05 fc f9 f3 01 0f ae f8 cc <=
0f>
> ae f8 f0 ff 0d ee f9 f3 01 c3 0f 1f 44 00 00 0f 1f 44 00 00 48
> <4>[   70.702654]  videodev snd_hda_core ecdh_generic drm_kms_helper ecc
> snd_hwdep cdc_acm joydev mc thinkpad_acpi sp5100_tco snd_rn_pci_acp3x
> serio_raw efi_pstore k10temp cfg80211 snd_pcm i2c_piix4 nvram cec rtsx_pci
> snd_pci_acp3x ccp snd_timer rc_core ipmi_devintf ledtrig_audio ucsi_acpi
> platform_profile mfd_core ipmi_msghandler typec_ucsi snd roles mac_hid ty=
pec
> soundcore rfkill wmi video i2c_designware_platform i2c_scmi pinctrl_amd
> amd_pmc i2c_designware_core acpi_cpufreq vboxnetadp(OE) vboxnetflt(OE) nf=
sd
> auth_rpcgss vboxdrv(OE) drm nfs_acl lockd grace backlight fuse i2c_core
> configfs sunrpc bpf_preload efivarfs zfs(POE) zunicode(POE) zzstd(OE)
> zlua(OE) zavl(POE) icp(POE) crc32_pclmul crc32c_intel zcommon(POE)
> znvpair(POE) spl(OE) xhci_pci xhci_pci_renesas aesni_intel r8169 crypto_s=
imd
> realtek cryptd xhci_hcd mdio_devres ehci_pci libphy ehci_hcd
> <4>[   70.702619]  ? set_kthread_struct+0x40/0x40
> <4>[   70.702620]  ret_from_fork+0x22/0x30
> <4>[   70.702623]  </TASK>
> <4>[   70.702623] Modules linked in: ccm xt_mark xt_comment tun xt_CHECKS=
UM
> xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 ip6table_mangle
> ip6table_nat ip6table_filter ip6_tables iptable_mangle iptable_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter ip_ta=
bles
> bridge stp llc cmac algif_skcipher bnep intel_rapl_msr intel_rapl_common
> snd_acp3x_rn snd_soc_dmic snd_acp3x_pdm_dma snd_soc_core snd_compress
> rtsx_pci_sdmmc edac_mce_amd snd_pcm_dmaengine mmc_core ac97_bus wmi_bmof
> kvm_amd snd_ctl_led iwlmvm snd_hda_codec_realtek amdgpu mac80211
> snd_hda_codec_generic kvm snd_hda_codec_hdmi uvcvideo btusb libarc4 btrtl
> irqbypass btbcm drm_ttm_helper cdc_ether snd_hda_intel btintel
> videobuf2_vmalloc crct10dif_pclmul videobuf2_memops ttm snd_intel_dspcfg
> snd_usb_audio usbnet snd_intel_sdw_acpi ghash_clmulni_intel videobuf2_v4l2
> iommu_v2 snd_usbmidi_lib gpu_sched bluetooth iwlwifi snd_hda_codec r8152
> videobuf2_common snd_rawmidi rapl i2c_algo_bit mii snd_seq_device
> <4>[   70.702134]  ? dc_validate_global_state+0x321/0x3c0 [amdgpu]
> <4>[   70.702259]  ? dm_plane_helper_prepare_fb+0x231/0x2b0 [amdgpu]
> <4>[   70.702382]  ? __cond_resched+0x16/0x40
> <4>[   70.702385]  ? __wait_for_common+0x3b/0x160
> <4>[   70.702386]  ? __raw_callee_save___native_queued_spin_unlock+0x11/0=
x1e
> <4>[   70.702390]  commit_tail+0x94/0x120 [drm_kms_helper]
> <4>[   70.702401]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> <4>[   70.702412]  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
> <4>[   70.702430]  drm_client_modeset_commit_locked+0x56/0x150 [drm]
> <4>[   70.702444]  drm_client_modeset_commit+0x24/0x40 [drm]
> <4>[   70.702458]  drm_fb_helper_set_par+0xa5/0xd0 [drm_kms_helper]
> <4>[   70.702468]  drm_fb_helper_hotplug_event.part.0+0xa8/0xc0
> [drm_kms_helper]
> <4>[   70.702476]  drm_kms_helper_hotplug_event+0x26/0x30 [drm_kms_helper]
> <4>[   70.702486]  handle_hpd_irq+0x12b/0x160 [amdgpu]
> <4>[   70.702611]  process_one_work+0x1f1/0x390
> <4>[   70.702614]  worker_thread+0x53/0x3e0
> <4>[   70.702615]  ? process_one_work+0x390/0x390
> <4>[   70.702617]  kthread+0x127/0x150
> <4>[   70.701096] RBP: 0000000000000012 R08: 0000000000000000 R09:
> ffffad060ad67610
> <4>[   70.701096] R10: ffffad060ad67608 R11: ffffffff9b743bc8 R12:
> ffff92c827b30c00
> <4>[   70.701097] R13: ffff92c7e0b35000 R14: ffff92c82c8c0000 R15:
> ffff92c82c8c0b58
> <4>[   70.701098] FS:  0000000000000000(0000) GS:ffff92cabf900000(0000)
> knlGS:0000000000000000
> <4>[   70.701099] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   70.701099] CR2: 00007f2afe48ef20 CR3: 000000003f610000 CR4:
> 0000000000350ee0
> <4>[   70.701100] Call Trace:
> <4>[   70.701102]  <TASK>
> <4>[   70.701103]  mpc2_assert_idle_mpcc+0xaf/0xf0 [amdgpu]
> <4>[   70.701242]  dcn20_program_front_end_for_ctx+0x70f/0xd40 [amdgpu]
> <4>[   70.701373]  dc_commit_state+0x49c/0xa60 [amdgpu]
> <4>[   70.701507]  amdgpu_dm_atomic_commit_tail+0x55c/0x2630 [amdgpu]
> <4>[   70.701635]  ? dcn21_validate_bandwidth_fp+0x109/0x700 [amdgpu]
> <4>[   70.701760]  ? kfree+0xba/0x400
> <4>[   70.701764]  ? dcn21_validate_bandwidth_fp+0xc1/0x700 [amdgpu]
> <4>[   70.701886]  ? dc_fpu_end+0x70/0x80 [amdgpu]
> <4>[   70.702010]  ? dcn21_validate_bandwidth+0x44/0x50 [amdgpu]

The system is locked down hard after this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
