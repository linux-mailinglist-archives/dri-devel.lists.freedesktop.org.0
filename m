Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E6A9E136
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 10:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7A110E173;
	Sun, 27 Apr 2025 08:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FHGGB0rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4510E173;
 Sun, 27 Apr 2025 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QQgVSxOnvc6pG0ndHJH4wBh8BjlqdlYnejLQRbNIRtg=; b=FHGGB0rmxcU6VuGWWNRZYnr8MM
 6i6lJWD8w4gVPYeNnA7ttELzki2wEYblhZNJlFupnYEv05ETYTaLQFNwkcOUQt9rFvw4/ZM6FsWwp
 wmJk7o9nNDCty2W030VWOff8fCugae2R+aeTVMjOYKYZoAYxlbiUPUIqELkuGNz7ntyTIdZyj6e/Y
 TV5bg433V5qzEVW/8lKMPUZnYw5fgfgjViNkLvOV+WV0cDqIGvQ2bRvQCjMjtXDcyCLpnE1TWQFFy
 DYGWFkcFYpsjLOyXrzC+xbyvkNId2Lqm+FYowIgrkVpha8iggaRB3/ZHZYflufpuTWN5u3DDGlQPE
 szDTpiOw==;
Received: from bl23-10-177.dsl.telepac.pt ([144.64.10.177] helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u8xmU-0098Zs-1S; Sun, 27 Apr 2025 10:54:34 +0200
From: Luis Henriques <luis@igalia.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: amdgpu WARNING when switching to external display
Date: Sun, 27 Apr 2025 09:54:27 +0100
Message-ID: <87tt6a2ddo.fsf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

I have been seeing the following splat for quite a while (since I got this
laptop!).  It happens every time I switch from the laptop display to an
external display with:

    xrandr --output eDP --off --output HDMI-A-0 --auto --primary

Not sure what information is needed to debug this, but here's the lspci
for the video card:

65:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] P=
hoenix3 (rev c5) (prog-if 00 [VGA controller])
        Subsystem: AIstone Global Limited Device 137d
        Flags: bus master, fast devsel, latency 0, IRQ 65, IOMMU group 19
        Memory at 7c00000000 (64-bit, prefetchable) [size=3D256M]
        Memory at dc000000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at e000 [size=3D256]
        Memory at dc500000 (32-bit, non-prefetchable) [size=3D512K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu

Cheers,
--=20
Lu=C3=ADs

[   48.702238] amdgpu 0000:65:00.0: [drm] REG_WAIT timeout 1us * 100 tries =
- dcn31_program_compbuf_size line:142
[   48.702273] ------------[ cut here ]------------
[   48.702274] WARNING: CPU: 15 PID: 3540 at drivers/gpu/drm/amd/amdgpu/../=
display/dc/hubbub/dcn31/dcn31_hubbub.c:151 dcn31_program_compbuf_size+0xc8/=
0x220 [amdgpu]
[   48.702467] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_reject_=
ipv6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables=
 nfnetlink ctr ccm nls_utf8 nls_cp437 vfat fat af_packet uvcvideo uvc video=
buf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc a=
mdgpu snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_a=
md_renoir snd_sof_amd_acp snd_sof_pci amdxcp iwlmvm snd_sof gpu_sched drm_p=
anel_backlight_quirks snd_sof_utils joydev drm_buddy snd_sof_xtensa_dsp snd=
_soc_core mousedev drm_ttm_helper snd_hda_codec_conexant snd_compress mac80=
211 snd_hda_codec_generic snd_hda_codec_hdmi ttm intel_rapl_msr libarc4 drm=
_exec snd_pcm_dmaengine intel_rapl_common snd_hda_intel drm_suballoc_helper=
 snd_intel_dspcfg drm_client_lib edac_mce_amd snd_intel_sdw_acpi iwlwifi dr=
m_display_helper snd_hda_codec snd_pci_ps hid_multitouch snd_soc_acpi_amd_m=
atch cec kvm_amd hid_generic snd_pci_acp6x sdhci_pci snd_hda_core kvm snd_h=
wdep irqbypass snd_pcm sdhci_uhs2 input_leds asus_wmi rapl
[   48.702547]  ucsi_acpi snd_pci_acp5x i2c_hid_acpi snd_timer sparse_keyma=
p drm_kms_helper i2c_hid sdhci sp5100_tco snd_rn_pci_acp3x serio_raw platfo=
rm_profile cfg80211 efi_pstore snd wmi_bmof cqhci snd_acp_config hid thunde=
rbolt agpgart typec_ucsi i2c_piix4 k10temp i2c_algo_bit snd_soc_acpi typec =
i2c_smbus mmc_core tpm_crb ccp soundcore snd_pci_acp3x rfkill roles tpm_tis=
 tpm_tis_core evdev drm button mac_hid tpm rng_core thermal amd_pmc ac efiv=
arfs serpent_avx2 serpent_avx_x86_64 serpent_sse2_x86_64 serpent_generic al=
gif_skcipher af_alg video ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha=
1_ssse3 xhci_pci xhci_hcd dm_crypt aesni_intel gf128mul crypto_simd cryptd =
encrypted_keys trusted dm_mod battery wmi loop nvme nvme_core hwmon ext4 cr=
c16 mbcache jbd2 usb_storage usbcore usb_common sd_mod scsi_mod scsi_common
[   48.702633] CPU: 15 UID: 0 PID: 3540 Comm: Xorg Not tainted 6.14.4-0-edg=
e #1-Alpine
[   48.702637] Hardware name: TUXEDO TUXEDO InfinityBook Pro AMD Gen9/GXxHR=
Xx, BIOS N.1.14A13 03/06/2025
[   48.702639] RIP: 0010:dcn31_program_compbuf_size+0xc8/0x220 [amdgpu]
[   48.702746] Code: 00 48 8b 43 28 8b 88 d8 01 00 00 48 8b 43 20 0f b6 50 =
76 48 8b 43 18 8b b0 14 01 00 00 e8 90 01 0e 00 85 c0 0f 85 31 01 00 00 <0f=
> 0b 48 8b 45 f0 65 48 2b 04 25 28 00 00 00 0f 85 33 01 00 00 48
[   48.702748] RSP: 0018:ffffb75b412236a0 EFLAGS: 00010202
[   48.702751] RAX: 0000000000000001 RBX: ffff93e706f59000 RCX: 00000000000=
0001f
[   48.702752] RDX: 0000000000000000 RSI: 000000000000397a RDI: ffff93e71ab=
00000
[   48.702754] RBP: ffffb75b412236b8 R08: ffffb75b412236a4 R09: 00000000000=
00019
[   48.702755] R10: ffffffffb22f0888 R11: 0000000000000003 R12: 00000000000=
00004
[   48.702756] R13: ffff93e71e940000 R14: ffff93e714c00000 R15: ffff93e706f=
59000
[   48.702758] FS:  00007f9810f35240(0000) GS:ffff93f5a01c0000(0000) knlGS:=
0000000000000000
[   48.702760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   48.702761] CR2: 00007f9db04f14b0 CR3: 000000011c24e000 CR4: 00000000007=
50ef0
[   48.702763] PKRU: 55555554
[   48.702764] Call Trace:
[   48.702766]  <TASK>
[   48.702768]  dcn20_optimize_bandwidth+0xe1/0x220 [amdgpu]
[   48.702899]  dc_commit_state_no_check+0xc8c/0xe40 [amdgpu]
[   48.703018]  dc_commit_streams+0x3b5/0x4f0 [amdgpu]
[   48.703114]  ? dc_dmub_srv_cmd_run+0x13/0x20 [amdgpu]
[   48.703209]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703216]  amdgpu_dm_atomic_commit_tail+0x6c0/0x3c30 [amdgpu]
[   48.703327]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703329]  ? dcn314_validate_bandwidth+0xfc/0x2c0 [amdgpu]
[   48.703436]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703438]  ? dma_resv_get_fences+0x9f/0x280
[   48.703441]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703443]  ? dma_resv_get_singleton+0x2c/0x120
[   48.703445]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703446]  ? __wait_for_common+0x158/0x190
[   48.703450]  ? __pfx_schedule_timeout+0x10/0x10
[   48.703452]  ? drm_gem_plane_helper_prepare_fb+0xed/0x1e0 [drm_kms_helpe=
r]
[   48.703458]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703460]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703462]  ? wait_for_completion_timeout+0x18/0x20
[   48.703464]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703466]  commit_tail+0x8f/0x140 [drm_kms_helper]
[   48.703470]  drm_atomic_helper_commit+0x121/0x150 [drm_kms_helper]
[   48.703475]  drm_atomic_commit+0xa6/0xe0 [drm]
[   48.703486]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[   48.703494]  drm_atomic_connector_commit_dpms+0x109/0x130 [drm]
[   48.703501]  drm_mode_obj_set_property_ioctl+0x197/0x3a0 [drm]
[   48.703512]  ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
[   48.703521]  drm_connector_property_set_ioctl+0x34/0x50 [drm]
[   48.703527]  drm_ioctl_kernel+0xa0/0x100 [drm]
[   48.703537]  drm_ioctl+0x293/0x590 [drm]
[   48.703543]  ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
[   48.703550]  ? srso_alias_return_thunk+0x5/0xfbef5
[   48.703551]  ? ep_item_poll.isra.0+0x4f/0x90
[   48.703555]  amdgpu_drm_ioctl+0x46/0x80 [amdgpu]
[   48.703627]  __x64_sys_ioctl+0x97/0xd0
[   48.703631]  x64_sys_call+0xf32/0x1d70
[   48.703634]  do_syscall_64+0x4b/0x110
[   48.703637]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   48.703638] RIP: 0033:0x7f9810ee5828
[   48.703641] Code: 63 f6 48 8d 44 24 60 48 89 54 24 30 48 89 44 24 10 48 =
8d 44 24 20 48 89 44 24 18 b8 10 00 00 00 c7 44 24 08 10 00 00 00 0f 05 <48=
> 63 f8 e8 aa ca fe ff 48 83 c4 58 c3 0f be 05 46 d0 04 00 c3 53
[   48.703642] RSP: 002b:00007ffe9f6cd6e0 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000010
[   48.703645] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f9810e=
e5828
[   48.703646] RDX: 00007ffe9f6cd770 RSI: ffffffffc01064ab RDI: 00000000000=
0000a
[   48.703647] RBP: 00000000c01064ab R08: 0000000000000000 R09: 00000000000=
00001
[   48.703648] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe9f6=
cd770
[   48.703649] R13: 000000000000000a R14: 00007f97fd4aa660 R15: 00007f98028=
48fc0
[   48.703651]  </TASK>
[   48.703653] ---[ end trace 0000000000000000 ]---
