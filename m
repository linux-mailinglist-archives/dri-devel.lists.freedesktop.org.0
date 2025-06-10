Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABBAD407C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 19:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C7C10E0E6;
	Tue, 10 Jun 2025 17:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jVkK7fX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A038E10E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 17:25:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F4A74A56A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 17:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DDB4C4CEED
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749576303;
 bh=uGaxqA/n55skUK7iM1lEPRwdjsKEEQgHiBQmAwX0wmM=;
 h=From:To:Subject:Date:From;
 b=jVkK7fX5R80nVUBrPE6WeXSjcla2ncL64cNgOt/Nu8ujrMoJO7pz8n637YtlMdy0N
 3L3/eaBaNngUHEmWALRGzLz73drG7Pef6C2MDEb6s4T0hisZbwxsmnx0/SQPznthj/
 ViUBBbh/hvr3PeBX8z895OZ78LHRRULT7H4rxpSoTBL36nrF4O84E9tdUZmetVzHYV
 B2JXvLsQNLoq38JkHherQWRZVqGYGrUuMGMoSe9rxlvFE8v/gNDFJ6wKJJbSknp/H3
 gRt/SsflsqWoiZ5SCqkPfq3ucJVxJvsC+HYj1tCKd14XrM/+nvhfr1SawdaS6Xmclp
 84ojwKm5M8ilQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 145E3C3279F; Tue, 10 Jun 2025 17:25:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220218] New: amdgpu: crash in
 dc_dmub_srv_apply_idle_power_optimizations
Date: Tue, 10 Jun 2025 17:25:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220218-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220218

            Bug ID: 220218
           Summary: amdgpu: crash in
                    dc_dmub_srv_apply_idle_power_optimizations
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ein4rth@gmail.com
        Regression: No

hardware: AMD Ryzen AI 9 HX 370
kernel: 6.15.1 (Gnome desktop)

[  760.250963] WARNING: CPU: 3 PID: 2475 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:1543
dc_dmub_srv_apply_idle_power_optimizations+0x1d5/0x550 [amdgpu]
[  760.251383] Modules linked in: snd_seq_dummy snd_hrtimer rfcomm snd_seq
snd_seq_device cdc_ether usbnet r8152 mii libphy nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reje=
ct
nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
nf_tables cmac algif_hash algif_skcipher af_alg bnep snd_acp70 snd_acp_i2s
snd_acp_pdm snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_van=
gogh
snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp vfat fat snd_sof_p=
ci
snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps intel_rapl_msr amd_atl
snd_soc_acpi_amd_match snd_amd_sdw_acpi amdgpu intel_rapl_common soundwire_=
amd
soundwire_generic_allocation snd_hda_codec_conexant soundwire_bus
snd_hda_codec_generic snd_soc_sdca snd_hda_codec_hdmi mt7921e snd_soc_core
mt7921_common snd_hda_intel snd_compress snd_intel_dspcfg uvcvideo ac97_bus
mt792x_lib snd_intel_sdw_acpi videobuf2_vmalloc snd_pcm_dmaengine uvc amdxcp
mt76_connac_lib snd_rpl_pci_acp6x videobuf2_memops
[  760.251435]  drm_panel_backlight_quirks btusb snd_hda_codec videobuf2_v4=
l2
drm_buddy snd_acp_pci mt76 btrtl videobuf2_common snd_amd_acpi_mach btintel
snd_acp_legacy_common drm_exec snd_pci_acp6x btbcm snd_hda_core mac80211
drm_suballoc_helper videodev kvm_amd btmtk snd_pci_acp5x drm_ttm_helper
snd_hwdep ttm libarc4 snd_rn_pci_acp3x bluetooth i2c_algo_bit snd_pcm kvm
snd_acp_config mc spd5118 asus_wmi snd_timer cfg80211 irqbypass
drm_display_helper snd_soc_acpi sparse_keymap amdxdna snd rapl amd_pmf cec
wmi_bmof rfkill i2c_piix4 thunderbolt gpu_sched snd_pci_acp3x soundcore amd=
tee
k10temp i2c_smbus amd_sfh joydev platform_profile mousedev amd_pmc mac_hid =
loop
nfnetlink ip_tables x_tables dm_crypt encrypted_keys trusted asn1_encoder t=
ee
polyval_clmulni polyval_generic ghash_clmulni_intel sha512_ssse3 sdhci_pci =
nvme
sha256_ssse3 sha1_ssse3 sdhci_uhs2 ucsi_acpi nvme_core aesni_intel sdhci
hid_multitouch typec_ucsi cqhci crypto_simd cryptd mmc_core video ccp roles
sp5100_tco nvme_keyring i2c_hid_acpi typec nvme_auth wmi
[  760.251512]  i2c_hid serio_raw dm_mod pkcs8_key_parser crypto_user
[  760.251521] CPU: 3 UID: 0 PID: 2475 Comm: kworker/u96:3 Not tainted
6.15.1-arch1-2 #1 PREEMPT(full)  cd63386364b969355862abafc710704c8116e874
[  760.251526] Hardware name: PCSpecialist Lafite Pro V 14M/X4SP4NAL, BIOS
N.1.10PCS02 03/20/2025
[  760.251531] Workqueue: dm_vblank_control_workqueue
amdgpu_dm_crtc_vblank_control_worker [amdgpu]
[  760.252049] RIP: 0010:dc_dmub_srv_apply_idle_power_optimizations+0x1d5/0=
x550
[amdgpu]
[  760.252419] Code: ff ff 44 0f b6 c5 48 c7 c2 00 55 54 c2 48 c7 c6 20 9d =
5e
c2 48 c7 c7 70 47 09 c2 e8 45 a9 b5 c5 40 84 ed 75 bc e9 90 fe ff ff <0f> 0=
b 41
c7 44 24 68 00 00 00 00 48 83 c4 10 5b 5d 41 5c 41 5d 41
[  760.252421] RSP: 0018:ffffcd7d862d3d40 EFLAGS: 00010286
[  760.252425] RAX: 00000000ffffffff RBX: ffff8a1083800000 RCX:
0000000000000001
[  760.252427] RDX: 0000000000000181 RSI: 00000000000036a3 RDI:
ffff8a1090380000
[  760.252428] RBP: ffffcd7ddf941e00 R08: ffffcd7d862d3ce4 R09:
0000000000001540
[  760.252430] R10: ffff8a104109c880 R11: ffff8a108c18a000 R12:
ffff8a104109c880
[  760.252430] R13: 0000000000000005 R14: 0000000000000002 R15:
000000000000066a
[  760.252432] FS:  0000000000000000(0000) GS:ffff8a1fd45ef000(0000)
knlGS:0000000000000000
[  760.252434] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  760.252436] CR2: 00005589f4737de8 CR3: 00000004ad224000 CR4:
0000000000f50ef0
[  760.252438] PKRU: 55555554
[  760.252439] Call Trace:
[  760.252445]  <TASK>
[  760.252450]  ? __slab_free+0xe4/0x310
[  760.252460]  dcn35_apply_idle_power_optimizations+0xd1/0xf0 [amdgpu
9195822a555765587a485333de7887baecb6b29e]
[  760.252884]  dc_allow_idle_optimizations_internal+0xe5/0x360 [amdgpu
9195822a555765587a485333de7887baecb6b29e]
[  760.253055]  amdgpu_dm_crtc_vblank_control_worker+0x157/0x2b0 [amdgpu
9195822a555765587a485333de7887baecb6b29e]
[  760.253182]  ? __pwq_activate_work+0x35/0xb0
[  760.253186]  process_one_work+0x190/0x350
[  760.253189]  worker_thread+0x2d7/0x410
[  760.253190]  ? __pfx_worker_thread+0x10/0x10
[  760.253191]  kthread+0xf9/0x240
[  760.253194]  ? __pfx_kthread+0x10/0x10
[  760.253195]  ret_from_fork+0x31/0x50
[  760.253199]  ? __pfx_kthread+0x10/0x10
[  760.253200]  ret_from_fork_asm+0x1a/0x30
[  760.253204]  </TASK>
[  760.253205] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
