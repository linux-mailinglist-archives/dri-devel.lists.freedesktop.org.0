Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCE70099C
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F75010E6C2;
	Fri, 12 May 2023 13:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAEC10E6C2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:57:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0E2D61472
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C22CC433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683899869;
 bh=fZfRrGAY18pUVptyVUWHX8+5Mhsa4j8HdrjybeJbyxM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dnVJOqs6B0yx0RhhNvry1B92tb5W4/msfQ1hl6SSjGiRHpxG78BEM3NxFg6M6wI6B
 owTYcaSrsF0T5iEU0QvaFb29ZkmwBdG91mRx9CWoW+FfyJP8PkVO2NRQcTAYwpwa22
 UyIXxOktMUdEjZLCfYzybzmtBt8IFaFqWoIB5xkyux+exH4dtOlIgYOC/4vQfDKBvw
 axsJdPdKA61upj02zjj+XIVsBAdk9jlfvX8PTe/5zZlTAw1OF7h6ay9iX4QqqWOZT8
 x9+TrZkNL+8gW6S1NeIevBmMc6fogORkn6YOjmCGLW7UGmXJieaVYSUOd+cUXjYR4X
 1Fr6LDuuxjqNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 38D0AC43145; Fri, 12 May 2023 13:57:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217432] AMDGPU crash on shutdown
Date: Fri, 12 May 2023 13:57:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217432-2300-hdISSacGam@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217432-2300@https.bugzilla.kernel.org/>
References: <bug-217432-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217432

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #2 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Jonny Mako from comment #0)
> amd driver crash on system shutdown:
>=20
> [   20.987226] ------------[ cut here ]------------
> [   20.987228] WARNING: CPU: 0 PID: 7 at
> drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:599 amdgpu_irq_put+0x46/0x70 [amd=
gpu]
> [   20.987426] Modules linked in: ccm algif_aead des_generic libdes ecb c=
mac
> algif_skcipher md4 bnep algif_hash af_alg snd_ctl_led snd_soc_skl_hda_dsp
> snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes
> snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic
> snd_sof_pci_intel_tgl snd_sof_intel_hda_common soundwire_intel
> soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_=
pci
> snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_hdac_hda snd_hda_ext_core
> snd_soc_acpi_intel_match hid_sensor_als snd_soc_acpi hid_sensor_trigger
> industrialio_triggered_buffer soundwire_bus kfifo_buf hid_sensor_iio_comm=
on
> snd_soc_core industrialio snd_compress ac97_bus hid_sensor_hub
> snd_pcm_dmaengine snd_hda_codec_hdmi intel_ishtp_hid x86_pkg_temp_thermal
> intel_powerclamp uvcvideo snd_hda_intel coretemp iwlmvm snd_intel_dspcfg
> btusb mousedev videobuf2_vmalloc amdgpu snd_intel_sdw_acpi kvm_intel btrtl
> iTCO_wdt uvc i915 snd_hda_codec processor_thermal_device_pci_legacy
> hid_multitouch mei_hdcp
> [   20.987449]  videobuf2_memops btbcm intel_pmc_bxt pmt_telemetry mac802=
11
> hp_wmi processor_thermal_device mei_pxp kvm intel_rapl_msr snd_hda_core
> joydev videobuf2_v4l2 iTCO_vendor_support btintel drm_buddy gpu_sched ee1=
004
> snd_hwdep pmt_class btmtk libarc4 platform_profile wmi_bmof videodev snd_=
pcm
> irqbypass processor_thermal_rfim i2c_algo_bit drm_ttm_helper mei_me rapl
> videobuf2_common intel_lpss_pci ttm processor_thermal_mbox snd_timer
> bluetooth intel_cstate spi_nor processor_thermal_rapl vfat
> drm_display_helper snd intel_ish_ipc i2c_hid_acpi intel_lpss i2c_i801
> iwlwifi fat ecdh_generic intel_rapl_common intel_uncore cec e1000e pcspkr
> mtd mc soundcore i2c_smbus mei thunderbolt idma64 crc16 intel_gtt
> intel_ishtp intel_soc_dts_iosf intel_vsec i2c_hid cfg80211 video
> int3403_thermal hp_accel int340x_thermal_zone wmi lis3lv02d intel_hid
> int3400_thermal rfkill wireless_hotkey acpi_thermal_rel sparse_keymap
> acpi_pad mac_hid pkcs8_key_parser crypto_user fuse loop bpf_preload
> ip_tables x_tables btrfs blake2b_generic xor
> [   20.987481]  raid6_pq libcrc32c crc32c_generic usbhid dm_crypt cbc
> encrypted_keys trusted asn1_encoder tee dm_mod rtsx_pci_sdmmc serio_raw
> crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic
> atkbd mmc_core nvme gf128mul ghash_clmulni_intel libps2 vivaldi_fmap
> sha512_ssse3 aesni_intel xhci_pci nvme_core crypto_simd spi_intel_pci cry=
ptd
> rtsx_pci spi_intel nvme_common xhci_pci_renesas i8042 serio
> [   20.987495] CPU: 0 PID: 7 Comm: kworker/0:0 Tainted: G        W=20=20=
=20=20=20=20=20=20=20
> 6.3.1-arch2-1 #1 4c16b0b90f71a940c7f1bb2eb00cdd9db2a83452
> [   20.987497] Hardware name: HP HP ZBook Fury 17.3 inch G8 Mobile
> Workstation PC/886D, BIOS T95 Ver. 01.12.00 01/03/2023
> [   20.987498] Workqueue: pm pm_runtime_work
> [   20.987502] RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
> [   20.987643] Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29 89 d1 48 8d 04
> 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 c3 cc cc cc cc e9 5a fd ff ff <=
0f>
> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc cc cc
> [   20.987644] RSP: 0018:ffffbd8a4011fce0 EFLAGS: 00010246
> [   20.987645] RAX: ffff9fb666317be8 RBX: ffff9fb655560000 RCX:
> 0000000000000000
> [   20.987646] RDX: 0000000000000000 RSI: ffff9fb655562510 RDI:
> ffff9fb655560000
> [   20.987647] RBP: ffff9fb655560000 R08: 0000000000000000 R09:
> 0000000000261614
> [   20.987647] R10: 0000000000000001 R11: 0000000000000100 R12:
> 0000000000001050
> [   20.987648] R13: ffff9fb6555789a0 R14: 0000000000000000 R15:
> ffff9fb640250000
> [   20.987648] FS:  0000000000000000(0000) GS:ffff9fbdcfc00000(0000)
> knlGS:0000000000000000
> [   20.987649] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.987650] CR2: 00007f67ba9f91c0 CR3: 0000000105c3c004 CR4:
> 0000000000f70ef0
> [   20.987651] PKRU: 55555554
> [   20.987651] Call Trace:
> [   20.987652]  <TASK>
> [   20.987653]  gmc_v10_0_hw_fini+0x53/0x90 [amdgpu
> dabade4992cc0aac9f1b5fa94ced08d9dd7f5493]
> [   20.987790]  gmc_v10_0_suspend+0xe/0x20 [amdgpu
> dabade4992cc0aac9f1b5fa94ced08d9dd7f5493]
> [   20.987922]  amdgpu_device_ip_suspend_phase2+0x104/0x1a0 [amdgpu
> dabade4992cc0aac9f1b5fa94ced08d9dd7f5493]
> [   20.988031]  amdgpu_device_suspend+0x107/0x180 [amdgpu
> dabade4992cc0aac9f1b5fa94ced08d9dd7f5493]
> [   20.988141]  amdgpu_pmops_runtime_suspend+0xbe/0x1c0 [amdgpu
> dabade4992cc0aac9f1b5fa94ced08d9dd7f5493]
> [   20.988250]  pci_pm_runtime_suspend+0x67/0x1e0
> [   20.988253]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [   20.988255]  __rpm_callback+0x41/0x170
> [   20.988256]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [   20.988258]  rpm_callback+0x5d/0x70
> [   20.988259]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [   20.988261]  rpm_suspend+0x120/0x6a0
> [   20.988262]  ? __schedule+0x44b/0x1400
> [   20.988265]  pm_runtime_work+0x98/0xb0
> [   20.988267]  process_one_work+0x1c4/0x3d0
> [   20.988269]  worker_thread+0x51/0x390
> [   20.988271]  ? __pfx_worker_thread+0x10/0x10
> [   20.988272]  kthread+0xdb/0x110
> [   20.988274]  ? __pfx_kthread+0x10/0x10
> [   20.988275]  ret_from_fork+0x29/0x50
> [   20.988278]  </TASK>
> [   20.988279] ---[ end trace 0000000000000000 ]---

As Alex has noted mainline commit fix, I'd like to know your kernel version=
 for
stable backport purposes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
