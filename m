Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49016AABED
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 19:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7DA10E2A1;
	Sat,  4 Mar 2023 18:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFE710E2A1;
 Sat,  4 Mar 2023 18:52:23 +0000 (UTC)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.169])
 by gnuweeb.org (Postfix) with ESMTPSA id A70D3831EF;
 Sat,  4 Mar 2023 18:52:10 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1677955942;
 bh=4RdJOStNYmd5IfyL0HEAgtNFc3FABOrBZTo8Hg0l4g0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=axZMmF/LZkCZQm2SDb6ytxDLqmx2Xe8ensXexQRmUgBKWQvE8if2ujzApBn/w/f0f
 jIarhhevspMYZokKKp/DektuuNpKMeFeOsFHbOrPFS/vhRuUvKG6RQhXOEkmCGTLrn
 Ln+aTiXha4rl4gInUpux8AtcWi08hDC1YUBxqoUzhzri5rvz63PI68xq467ywGnWUJ
 I/prKnsyQ2OUqENDNu/yOjFnftuFXQKebmFGELh+rh7XT2TNOM/dzxpXIUND2tg5z3
 JFcD/bnz1zk0CLLAdNVGJBTV41wzqHv7UP8V8oYagb1vhv1JWGa7oL5xotximvVoR3
 fpCC3A8YLeQcA==
Date: Sun, 5 Mar 2023 01:52:03 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZAOTU5CRwdEC1lGH@biznet-home.integral.gnuweeb.org>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
 <ZAGqet3U8AMm4Uf1@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAGqet3U8AMm4Uf1@debian.me>
X-Bpl: hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 03:06:18PM +0700, Bagas Sanjaya wrote:
> Can you please try v6.1?

It's reproducible in v6.1.9. I finally can reliably reproduce it, it
only happens when I start a VM with qemu.

Specifically adding this device to the qemu instance:

  <hostdev mode="subsystem" type="pci" managed="yes">
    <source>
      <address domain="0x0000" bus="0x00" slot="0x02" function="0x0"/>
    </source>
    <address type="pci" domain="0x0000" bus="0x04" slot="0x00" function="0x0"/>
  </hostdev>

And that slot is used by this hardware:

  0000:00:02:0 Intel Corporation TigerLake-LP GT2 [Iris Xe Graphics]

Removing it from the qemu instance solves the issue. But it's still a
kernel bug anyway.

-- 
Ammar Faizi

---
<6>[   67.066516] Console: switching to colour dummy device 80x25
<4>[   67.254746] ------------[ cut here ]------------
<4>[   67.254749] WARNING: CPU: 3 PID: 1248 at drivers/gpu/drm/drm_mode_config.c:505 drm_mode_config_cleanup+0x259/0x320 [drm]
<4>[   67.254777] Modules linked in: xt_nat xt_mark nvme_fabrics ccm r8153_ecm cdc_ether usbnet uas r8152 usb_storage mii xt_CHECKSUM xt_MASQUERADE xt_conntrack ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc snd_ctl_led snd_soc_skl_hda_dsp snd_soc_hdac_hdmi snd_soc_intel_hda_dsp_common snd_sof_probes snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep rtw88_8822ce snd_pcm rtw88_8822c rtw88_pci uvcvideo snd_seq_midi
<4>[   67.254819]  rtw88_core snd_seq_midi_event snd_rawmidi intel_tcc_cooling snd_seq videobuf2_vmalloc x86_pkg_temp_thermal videobuf2_memops hid_multitouch intel_powerclamp iTCO_wdt videobuf2_v4l2 mei_hdcp coretemp videobuf2_common intel_pmc_bxt snd_seq_device nls_iso8859_1 mac80211 ee1004 btrfs iTCO_vendor_support intel_rapl_msr kvm_intel videodev crct10dif_pclmul snd_timer processor_thermal_device_pci_legacy crc32_pclmul mei_me processor_thermal_device ghash_clmulni_intel cfg80211 sha512_ssse3 mc processor_thermal_rfim hp_wmi snd intel_lpss_pci processor_thermal_mbox libarc4 platform_profile mei serio_raw processor_thermal_rapl sparse_keymap i2c_i801 soundcore wmi_bmof intel_lpss intel_rapl_common i2c_smbus idma64 intel_soc_dts_iosf i2c_hid_acpi i2c_hid int3403_thermal int3400_thermal int340x_thermal_zone acpi_thermal_rel acpi_pad dptf_pch_fivr sch_fq_codel kvmgt mdev kvm parport_pc ppdev lp parport ramoops reed_solomon efi_pstore ip_tables x_tables autofs4 input_leds
<4>[   67.254848]  raid10 raid456 libcrc32c async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log joydev hid_generic usbhid hid nvme nvme_core i915 drm_buddy i2c_algo_bit ttm drm_display_helper cec rc_core drm_kms_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm aesni_intel crypto_simd cryptd xhci_pci vmd xhci_pci_renesas video wmi pinctrl_tigerlake mac_hid
<4>[   67.254867] CPU: 3 PID: 1248 Comm: rpc-libvirtd Not tainted 6.1.9-2023-02-05-00498-g8ac3f3ea3339 #1 f45067dcdcd5671001354cafa377ba836858a12e
<4>[   67.254869] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.21 03/21/2022
<4>[   67.254870] RIP: 0010:drm_mode_config_cleanup+0x259/0x320 [drm]
<4>[   67.254890] Code: 6d 1b 92 e1 48 8b 83 b0 01 00 00 48 81 c3 b0 01 00 00 48 39 d8 0f 85 c1 00 00 00 48 83 c4 30 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b 48 89 1c 24 48 c7 44 24 08 00 00 00 00 49 89 e6 4c 89 f7 e8
<4>[   67.254891] RSP: 0018:ffff888106b6bc88 EFLAGS: 00010216
<4>[   67.254893] RAX: ffff8881242b8268 RBX: ffff8881242b8000 RCX: ffff888124327820
<4>[   67.254894] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff888106b6bc30
<4>[   67.254895] RBP: 0000000000000000 R08: ffff888104bf9fc0 R09: 0000000000000100
<4>[   67.254896] R10: 0000000000000100 R11: 0000000000000100 R12: ffff888125809800
<4>[   67.254897] R13: ffffffffa08e8a00 R14: ffff888106b6bc88 R15: ffff888125809850
<4>[   67.254898] FS:  00007f25ce3ff640(0000) GS:ffff889036ac0000(0000) knlGS:0000000000000000
<4>[   67.254900] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   67.254901] CR2: 00007fbb11df8be8 CR3: 0000000106daf001 CR4: 0000000000770ee0
<4>[   67.254902] PKRU: 55555554
<4>[   67.254903] Call Trace:
<4>[   67.254905]  <TASK>
<4>[   67.254907]  ? intel_atomic_global_obj_cleanup+0x4a/0xf0 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.254968]  intel_modeset_driver_remove_noirq+0xea/0x160 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255024]  i915_driver_remove+0x14a/0x350 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255077]  i915_pci_remove+0x15/0x30 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255132]  pci_device_remove+0x6d/0x110
<4>[   67.255135]  device_release_driver_internal+0x30e/0x520
<4>[   67.255139]  unbind_store+0x17f/0x200
<4>[   67.255141]  ? klist_devices_get+0x10/0x10
<4>[   67.255143]  kernfs_fop_write_iter+0x18b/0x2c0
<4>[   67.255146]  vfs_write+0x324/0x3e0
<4>[   67.255149]  ksys_write+0x50/0xc0
<4>[   67.255151]  do_syscall_64+0x2b/0x50
<4>[   67.255153]  entry_SYSCALL_64_after_hwframe+0x24/0x8e
<4>[   67.255156] RIP: 0033:0x7f25d2514a6f
<4>[   67.255157] Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 19 c0 f7 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 5c c0 f7 ff 48
<4>[   67.255159] RSP: 002b:00007f25ce3fe2e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
<4>[   67.255161] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f25d2514a6f
<4>[   67.255162] RDX: 000000000000000c RSI: 00007f25c82342b0 RDI: 000000000000001d
<4>[   67.255162] RBP: 00007f25c82342b0 R08: 0000000000000000 R09: 000000007fffffff
<4>[   67.255163] R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000001d
<4>[   67.255164] R13: 000000000000001d R14: 0000000000000000 R15: 00007f25c82beac0
<4>[   67.255166]  </TASK>
<4>[   67.255166] ---[ end trace 0000000000000000 ]---
<3>[   67.255168] [drm:drm_mode_config_cleanup [drm]] *ERROR* connector HDMI-A-1 leaked!
<4>[   67.255243] ------------[ cut here ]------------
<4>[   67.255244] i915 0000:00:02.0: drm_WARN_ON(plane_state->ggtt_vma)
<4>[   67.255264] WARNING: CPU: 3 PID: 1248 at drivers/gpu/drm/i915/display/intel_atomic_plane.c:134 intel_plane_destroy_state+0x7a/0xd0 [i915]
<4>[   67.255319] Modules linked in: xt_nat xt_mark nvme_fabrics ccm r8153_ecm cdc_ether usbnet uas r8152 usb_storage mii xt_CHECKSUM xt_MASQUERADE xt_conntrack ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc snd_ctl_led snd_soc_skl_hda_dsp snd_soc_hdac_hdmi snd_soc_intel_hda_dsp_common snd_sof_probes snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep rtw88_8822ce snd_pcm rtw88_8822c rtw88_pci uvcvideo snd_seq_midi
<4>[   67.255346]  rtw88_core snd_seq_midi_event snd_rawmidi intel_tcc_cooling snd_seq videobuf2_vmalloc x86_pkg_temp_thermal videobuf2_memops hid_multitouch intel_powerclamp iTCO_wdt videobuf2_v4l2 mei_hdcp coretemp videobuf2_common intel_pmc_bxt snd_seq_device nls_iso8859_1 mac80211 ee1004 btrfs iTCO_vendor_support intel_rapl_msr kvm_intel videodev crct10dif_pclmul snd_timer processor_thermal_device_pci_legacy crc32_pclmul mei_me processor_thermal_device ghash_clmulni_intel cfg80211 sha512_ssse3 mc processor_thermal_rfim hp_wmi snd intel_lpss_pci processor_thermal_mbox libarc4 platform_profile mei serio_raw processor_thermal_rapl sparse_keymap i2c_i801 soundcore wmi_bmof intel_lpss intel_rapl_common i2c_smbus idma64 intel_soc_dts_iosf i2c_hid_acpi i2c_hid int3403_thermal int3400_thermal int340x_thermal_zone acpi_thermal_rel acpi_pad dptf_pch_fivr sch_fq_codel kvmgt mdev kvm parport_pc ppdev lp parport ramoops reed_solomon efi_pstore ip_tables x_tables autofs4 input_leds
<4>[   67.255372]  raid10 raid456 libcrc32c async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log joydev hid_generic usbhid hid nvme nvme_core i915 drm_buddy i2c_algo_bit ttm drm_display_helper cec rc_core drm_kms_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm aesni_intel crypto_simd cryptd xhci_pci vmd xhci_pci_renesas video wmi pinctrl_tigerlake mac_hid
<4>[   67.255388] CPU: 3 PID: 1248 Comm: rpc-libvirtd Tainted: G        W          6.1.9-2023-02-05-00498-g8ac3f3ea3339 #1 f45067dcdcd5671001354cafa377ba836858a12e
<4>[   67.255390] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.21 03/21/2022
<4>[   67.255391] RIP: 0010:intel_plane_destroy_state+0x7a/0xd0 [i915]
<4>[   67.255443] Code: e1 49 8b 0e 48 8b 49 08 48 8b 51 50 48 85 d2 75 03 48 8b 11 48 c7 c7 8b da 7f a0 48 89 c6 48 c7 c1 ef 4f 81 a0 e8 16 6b 99 e0 <0f> 0b 48 83 bb c8 00 00 00 00 74 97 49 8b 06 48 8b 78 08 e8 ce af
<4>[   67.255445] RSP: 0018:ffff888106b6bc40 EFLAGS: 00010286
<4>[   67.255446] RAX: 0000000000000035 RBX: ffff888111818e00 RCX: 0000000000000027
<4>[   67.255447] RDX: ffff888106b6bb40 RSI: 00000000ffefffff RDI: ffff889036add808
<4>[   67.255448] RBP: 0000000000000000 R08: 00000000000fffff R09: ffff88907c3fe000
<4>[   67.255449] R10: 00000000002ffffd R11: 0000000000000004 R12: ffff888125809800
<4>[   67.255450] R13: ffffffffa08e8a00 R14: ffff8881242c6400 R15: ffff8881242b8000
<4>[   67.255451] FS:  00007f25ce3ff640(0000) GS:ffff889036ac0000(0000) knlGS:0000000000000000
<4>[   67.255452] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   67.255453] CR2: 00007fbb11df8be8 CR3: 0000000106daf001 CR4: 0000000000770ee0
<4>[   67.255454] PKRU: 55555554
<4>[   67.255455] Call Trace:
<4>[   67.255456]  <TASK>
<4>[   67.255456]  drm_plane_cleanup+0xe9/0x140 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   67.255481]  intel_plane_destroy+0x9/0x20 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255536]  drm_mode_config_cleanup+0x151/0x320 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   67.255558]  ? intel_atomic_global_obj_cleanup+0x4a/0xf0 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255613]  intel_modeset_driver_remove_noirq+0xea/0x160 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255668]  i915_driver_remove+0x14a/0x350 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255726]  i915_pci_remove+0x15/0x30 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.255783]  pci_device_remove+0x6d/0x110
<4>[   67.255785]  device_release_driver_internal+0x30e/0x520
<4>[   67.255788]  unbind_store+0x17f/0x200
<4>[   67.255790]  ? klist_devices_get+0x10/0x10
<4>[   67.255792]  kernfs_fop_write_iter+0x18b/0x2c0
<4>[   67.255794]  vfs_write+0x324/0x3e0
<4>[   67.255796]  ksys_write+0x50/0xc0
<4>[   67.255798]  do_syscall_64+0x2b/0x50
<4>[   67.255799]  entry_SYSCALL_64_after_hwframe+0x24/0x8e
<4>[   67.255801] RIP: 0033:0x7f25d2514a6f
<4>[   67.255803] Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 19 c0 f7 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 5c c0 f7 ff 48
<4>[   67.255804] RSP: 002b:00007f25ce3fe2e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
<4>[   67.255805] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f25d2514a6f
<4>[   67.255806] RDX: 000000000000000c RSI: 00007f25c82342b0 RDI: 000000000000001d
<4>[   67.255807] RBP: 00007f25c82342b0 R08: 0000000000000000 R09: 000000007fffffff
<4>[   67.255808] R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000001d
<4>[   67.255809] R13: 000000000000001d R14: 0000000000000000 R15: 00007f25c82beac0
<4>[   67.255810]  </TASK>
<4>[   67.255811] ---[ end trace 0000000000000000 ]---
<4>[   67.255861] ------------[ cut here ]------------
<4>[   67.255861] WARNING: CPU: 3 PID: 1248 at drivers/gpu/drm/drm_mode_config.c:539 drm_mode_config_cleanup+0x28e/0x320 [drm]
<4>[   67.255889] Modules linked in: xt_nat xt_mark nvme_fabrics ccm r8153_ecm cdc_ether usbnet uas r8152 usb_storage mii xt_CHECKSUM xt_MASQUERADE xt_conntrack ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc snd_ctl_led snd_soc_skl_hda_dsp snd_soc_hdac_hdmi snd_soc_intel_hda_dsp_common snd_sof_probes snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep rtw88_8822ce snd_pcm rtw88_8822c rtw88_pci uvcvideo snd_seq_midi
<4>[   67.255915]  rtw88_core snd_seq_midi_event snd_rawmidi intel_tcc_cooling snd_seq videobuf2_vmalloc x86_pkg_temp_thermal videobuf2_memops hid_multitouch intel_powerclamp iTCO_wdt videobuf2_v4l2 mei_hdcp coretemp videobuf2_common intel_pmc_bxt snd_seq_device nls_iso8859_1 mac80211 ee1004 btrfs iTCO_vendor_support intel_rapl_msr kvm_intel videodev crct10dif_pclmul snd_timer processor_thermal_device_pci_legacy crc32_pclmul mei_me processor_thermal_device ghash_clmulni_intel cfg80211 sha512_ssse3 mc processor_thermal_rfim hp_wmi snd intel_lpss_pci processor_thermal_mbox libarc4 platform_profile mei serio_raw processor_thermal_rapl sparse_keymap i2c_i801 soundcore wmi_bmof intel_lpss intel_rapl_common i2c_smbus idma64 intel_soc_dts_iosf i2c_hid_acpi i2c_hid int3403_thermal int3400_thermal int340x_thermal_zone acpi_thermal_rel acpi_pad dptf_pch_fivr sch_fq_codel kvmgt mdev kvm parport_pc ppdev lp parport ramoops reed_solomon efi_pstore ip_tables x_tables autofs4 input_leds
<4>[   67.255943]  raid10 raid456 libcrc32c async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log joydev hid_generic usbhid hid nvme nvme_core i915 drm_buddy i2c_algo_bit ttm drm_display_helper cec rc_core drm_kms_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm aesni_intel crypto_simd cryptd xhci_pci vmd xhci_pci_renesas video wmi pinctrl_tigerlake mac_hid
<4>[   67.255960] CPU: 3 PID: 1248 Comm: rpc-libvirtd Tainted: G        W          6.1.9-2023-02-05-00498-g8ac3f3ea3339 #1 f45067dcdcd5671001354cafa377ba836858a12e
<4>[   67.255962] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.21 03/21/2022
<4>[   67.255962] RIP: 0010:drm_mode_config_cleanup+0x28e/0x320 [drm]
<4>[   67.255985] Code: 00 00 00 00 49 89 e6 4c 89 f7 e8 8d 50 ff ff 48 85 c0 0f 84 96 00 00 00 48 8b 70 60 48 c7 c7 1a 77 5e a0 e8 74 f2 ff ff eb dd <0f> 0b 4d 8b 75 00 4d 39 ee 0f 84 72 ff ff ff 4c 8d 7c 24 10 4d 8d
<4>[   67.255986] RSP: 0018:ffff888106b6bc88 EFLAGS: 00010283
<4>[   67.255987] RAX: ffff888111819808 RBX: ffff8881242b8000 RCX: 0000000000000296
<4>[   67.255988] RDX: 0000000000000000 RSI: ffffea00041a6500 RDI: ffff888100042a00
<4>[   67.255989] RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000003
<4>[   67.255990] R10: fffffffffffffff8 R11: 0000000000000008 R12: ffff888106996828
<4>[   67.255990] R13: ffff8881242b8240 R14: ffff8881242b83a8 R15: ffff8881242b83a8
<4>[   67.255991] FS:  00007f25ce3ff640(0000) GS:ffff889036ac0000(0000) knlGS:0000000000000000
<4>[   67.255992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   67.255993] CR2: 00007fbb11df8be8 CR3: 0000000106daf001 CR4: 0000000000770ee0
<4>[   67.255994] PKRU: 55555554
<4>[   67.255995] Call Trace:
<4>[   67.255996]  <TASK>
<4>[   67.255996]  ? intel_atomic_global_obj_cleanup+0x4a/0xf0 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256047]  intel_modeset_driver_remove_noirq+0xea/0x160 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256091]  i915_driver_remove+0x14a/0x350 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256135]  i915_pci_remove+0x15/0x30 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256182]  pci_device_remove+0x6d/0x110
<4>[   67.256184]  device_release_driver_internal+0x30e/0x520
<4>[   67.256186]  unbind_store+0x17f/0x200
<4>[   67.256188]  ? klist_devices_get+0x10/0x10
<4>[   67.256190]  kernfs_fop_write_iter+0x18b/0x2c0
<4>[   67.256192]  vfs_write+0x324/0x3e0
<4>[   67.256194]  ksys_write+0x50/0xc0
<4>[   67.256196]  do_syscall_64+0x2b/0x50
<4>[   67.256198]  entry_SYSCALL_64_after_hwframe+0x24/0x8e
<4>[   67.256200] RIP: 0033:0x7f25d2514a6f
<4>[   67.256201] Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 19 c0 f7 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 5c c0 f7 ff 48
<4>[   67.256202] RSP: 002b:00007f25ce3fe2e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
<4>[   67.256203] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f25d2514a6f
<4>[   67.256204] RDX: 000000000000000c RSI: 00007f25c82342b0 RDI: 000000000000001d
<4>[   67.256205] RBP: 00007f25c82342b0 R08: 0000000000000000 R09: 000000007fffffff
<4>[   67.256206] R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000001d
<4>[   67.256206] R13: 000000000000001d R14: 0000000000000000 R15: 00007f25c82beac0
<4>[   67.256208]  </TASK>
<4>[   67.256208] ---[ end trace 0000000000000000 ]---
<7>[   67.256209] [leaked fb] framebuffer[362]:
<7>[   67.256210] [leaked fb] 	allocated by = Xorg
<7>[   67.256211] [leaked fb] 	refcount=1
<7>[   67.256212] [leaked fb] 	format=XR24 little-endian (0x34325258)
<7>[   67.256213] [leaked fb] 	modifier=0x100000000000001
<7>[   67.256214] [leaked fb] 	size=1920x1080
<7>[   67.256216] [leaked fb] 	layers:
<7>[   67.256216] [leaked fb] 		size[0]=1920x1080
<7>[   67.256217] [leaked fb] 		pitch[0]=7680
<7>[   67.256218] [leaked fb] 		offset[0]=0
<7>[   67.256219] [leaked fb] 		obj[0]:
<7>[   67.256220] [leaked fb] 			name=0
<7>[   67.256221] [leaked fb] 			refcount=4
<7>[   67.256222] [leaked fb] 			start=00000000
<7>[   67.256223] [leaked fb] 			size=8388608
<7>[   67.256224] [leaked fb] 			imported=no
<4>[   67.256225] ------------[ cut here ]------------
<4>[   67.256226] i915 0000:00:02.0: drm_WARN_ON(atomic_read(&front->bits))
<4>[   67.256244] WARNING: CPU: 3 PID: 1248 at drivers/gpu/drm/i915/display/intel_frontbuffer.c:231 intel_frontbuffer_put+0x133/0x160 [i915]
<4>[   67.256293] Modules linked in: xt_nat xt_mark nvme_fabrics ccm r8153_ecm cdc_ether usbnet uas r8152 usb_storage mii xt_CHECKSUM xt_MASQUERADE xt_conntrack ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc snd_ctl_led snd_soc_skl_hda_dsp snd_soc_hdac_hdmi snd_soc_intel_hda_dsp_common snd_sof_probes snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep rtw88_8822ce snd_pcm rtw88_8822c rtw88_pci uvcvideo snd_seq_midi
<4>[   67.256316]  rtw88_core snd_seq_midi_event snd_rawmidi intel_tcc_cooling snd_seq videobuf2_vmalloc x86_pkg_temp_thermal videobuf2_memops hid_multitouch intel_powerclamp iTCO_wdt videobuf2_v4l2 mei_hdcp coretemp videobuf2_common intel_pmc_bxt snd_seq_device nls_iso8859_1 mac80211 ee1004 btrfs iTCO_vendor_support intel_rapl_msr kvm_intel videodev crct10dif_pclmul snd_timer processor_thermal_device_pci_legacy crc32_pclmul mei_me processor_thermal_device ghash_clmulni_intel cfg80211 sha512_ssse3 mc processor_thermal_rfim hp_wmi snd intel_lpss_pci processor_thermal_mbox libarc4 platform_profile mei serio_raw processor_thermal_rapl sparse_keymap i2c_i801 soundcore wmi_bmof intel_lpss intel_rapl_common i2c_smbus idma64 intel_soc_dts_iosf i2c_hid_acpi i2c_hid int3403_thermal int3400_thermal int340x_thermal_zone acpi_thermal_rel acpi_pad dptf_pch_fivr sch_fq_codel kvmgt mdev kvm parport_pc ppdev lp parport ramoops reed_solomon efi_pstore ip_tables x_tables autofs4 input_leds
<4>[   67.256340]  raid10 raid456 libcrc32c async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log joydev hid_generic usbhid hid nvme nvme_core i915 drm_buddy i2c_algo_bit ttm drm_display_helper cec rc_core drm_kms_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm aesni_intel crypto_simd cryptd xhci_pci vmd xhci_pci_renesas video wmi pinctrl_tigerlake mac_hid
<4>[   67.256355] CPU: 3 PID: 1248 Comm: rpc-libvirtd Tainted: G        W          6.1.9-2023-02-05-00498-g8ac3f3ea3339 #1 f45067dcdcd5671001354cafa377ba836858a12e
<4>[   67.256357] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.21 03/21/2022
<4>[   67.256358] RIP: 0010:intel_frontbuffer_put+0x133/0x160 [i915]
<4>[   67.256404] Code: 49 8b 4e 08 48 8b 49 08 48 8b 51 50 48 85 d2 75 03 48 8b 11 48 c7 c7 8b da 7f a0 48 89 c6 48 c7 c1 03 20 83 a0 e8 fd fe 93 e0 <0f> 0b e9 fc fe ff ff 4c 89 f7 be 03 00 00 00 e8 99 d4 f5 e0 48 85
<4>[   67.256405] RSP: 0018:ffff888106b6bc58 EFLAGS: 00010282
<4>[   67.256407] RAX: 0000000000000039 RBX: ffff8881208f6d80 RCX: 0000000000000027
<4>[   67.256408] RDX: ffff888106b6bb60 RSI: 00000000ffefffff RDI: ffff889036add808
<4>[   67.256409] RBP: ffff8881242b8240 R08: 00000000000fffff R09: ffff88907c3fe000
<4>[   67.256410] R10: 00000000002ffffd R11: 0000000000000004 R12: ffff888111819800
<4>[   67.256411] R13: ffff8881242b8240 R14: ffff88810b4d1dc0 R15: ffff888106b6bc98
<4>[   67.256412] FS:  00007f25ce3ff640(0000) GS:ffff889036ac0000(0000) knlGS:0000000000000000
<4>[   67.256413] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   67.256414] CR2: 00007fbb11df8be8 CR3: 0000000106daf001 CR4: 0000000000770ee0
<4>[   67.256415] PKRU: 55555554
<4>[   67.256415] Call Trace:
<4>[   67.256416]  <TASK>
<4>[   67.256417]  intel_user_framebuffer_destroy+0x62/0x80 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256464]  drm_mode_config_cleanup+0x2fe/0x320 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   67.256483]  ? __drm_printfn_err+0x20/0x20 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   67.256502]  intel_modeset_driver_remove_noirq+0xea/0x160 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256545]  i915_driver_remove+0x14a/0x350 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256586]  i915_pci_remove+0x15/0x30 [i915 a3e3a30d728c60b75e1835186d2c378b80701f73]
<4>[   67.256631]  pci_device_remove+0x6d/0x110
<4>[   67.256633]  device_release_driver_internal+0x30e/0x520
<4>[   67.256636]  unbind_store+0x17f/0x200
<4>[   67.256637]  ? klist_devices_get+0x10/0x10
<4>[   67.256640]  kernfs_fop_write_iter+0x18b/0x2c0
<4>[   67.256642]  vfs_write+0x324/0x3e0
<4>[   67.256644]  ksys_write+0x50/0xc0
<4>[   67.256645]  do_syscall_64+0x2b/0x50
<4>[   67.256647]  entry_SYSCALL_64_after_hwframe+0x24/0x8e
<4>[   67.256649] RIP: 0033:0x7f25d2514a6f
<4>[   67.256650] Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 19 c0 f7 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 5c c0 f7 ff 48
<4>[   67.256651] RSP: 002b:00007f25ce3fe2e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
<4>[   67.256652] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f25d2514a6f
<4>[   67.256653] RDX: 000000000000000c RSI: 00007f25c82342b0 RDI: 000000000000001d
<4>[   67.256653] RBP: 00007f25c82342b0 R08: 0000000000000000 R09: 000000007fffffff
<4>[   67.256654] R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000001d
<4>[   67.256655] R13: 000000000000001d R14: 0000000000000000 R15: 00007f25c82beac0
<4>[   67.256656]  </TASK>
<4>[   67.256656] ---[ end trace 0000000000000000 ]---
<6>[   67.354128] vfio-pci 0000:00:02.0: vgaarb: deactivate vga console
<6>[   67.354132] vfio-pci 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
<4>[   67.354152] vfio-pci: probe of 0000:00:02.0 failed with error -22
<6>[   67.383324] i915 0000:00:02.0: vgaarb: deactivate vga console
<6>[   67.383379] i915 0000:00:02.0: [drm] Using Transparent Hugepages
<6>[   67.389581] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
<6>[   67.396687] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/tgl_dmc_ver2_12.bin (v2.12)
<7>[   67.402226] rfkill: input handler enabled
<4>[   68.278246] Yeah, we hit that intel_tc_port warn
<4>[   68.278267] Yeah, we hit that intel_tc_port warn
<4>[   68.278286] Yeah, we hit that intel_tc_port warn
<4>[   68.278305] Yeah, we hit that intel_tc_port warn
<6>[   68.296955] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
<6>[   68.298458] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
<6>[   68.298712] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input26
<6>[   68.298833] sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
<6>[   68.338048] fbcon: i915drmfb (fb0) is primary device
<6>[   68.871240] Console: switching to colour frame buffer device 240x67
<6>[   68.891674] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
<3>[   71.850057] list_del corruption, ffff888111819898->next is NULL
<4>[   71.850080] ------------[ cut here ]------------
<2>[   71.850080] kernel BUG at lib/list_debug.c:50!
<4>[   71.850091] invalid opcode: 0000 [#1] PREEMPT SMP
<4>[   71.850100] CPU: 7 PID: 1454 Comm: Xorg Tainted: G        W          6.1.9-2023-02-05-00498-g8ac3f3ea3339 #1 f45067dcdcd5671001354cafa377ba836858a12e
<4>[   71.850119] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.21 03/21/2022
<4>[   71.850130] RIP: 0010:__list_del_entry_valid+0x4c/0xa0
<4>[   71.850141] Code: 39 48 83 c2 22 48 39 d0 74 3e 48 8b 10 48 39 f2 75 44 48 8b 51 08 48 39 f2 75 4c b0 01 c3 48 c7 c7 08 1a 60 82 e8 c2 3e a7 ff <0f> 0b 48 c7 c7 19 9d 68 82 e8 b4 3e a7 ff 0f 0b 48 c7 c7 fe 52 6a
<4>[   71.850169] RSP: 0018:ffff888111e0bc28 EFLAGS: 00010286
<4>[   71.850179] RAX: 0000000000000033 RBX: ffff888111e0bc50 RCX: 0000000000000000
<4>[   71.850190] RDX: ffff889036be0b78 RSI: 00000000ffefffff RDI: ffff889036bdd808
<4>[   71.850202] RBP: 0000000000000000 R08: 00000000000fffff R09: ffff88907c3fe000
<4>[   71.850213] R10: 00000000002ffffd R11: 0000000000000004 R12: ffff88812460daf8
<4>[   71.850224] R13: 0000000000000000 R14: ffff88812460da90 R15: ffff888111819898
<4>[   71.850235] FS:  0000000000000000(0000) GS:ffff889036bc0000(0000) knlGS:0000000000000000
<4>[   71.850247] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   71.850256] CR2: 00007f7e58eaaae0 CR3: 000000000740f006 CR4: 0000000000770ee0
<4>[   71.850267] PKRU: 55555554
<4>[   71.850272] Call Trace:
<4>[   71.850279]  <TASK>
<4>[   71.850284]  drm_fb_release+0x5c/0x170 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   71.850311]  ? __slab_free+0x54/0x1d0
<4>[   71.850317]  drm_file_free+0x144/0x270 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   71.850341]  drm_release_noglobal+0x68/0x130 [drm 818fa21e14bffc0118b70ca5a0a5499aef842d4d]
<4>[   71.850363]  __fput+0xe9/0x3a0
<4>[   71.850370]  do_exit+0x68c/0x1030
<4>[   71.850377]  do_group_exit+0x73/0x90
<4>[   71.850384]  get_signal+0x6ce/0x780
<4>[   71.850391]  arch_do_signal_or_restart+0x1b/0x630
<4>[   71.850402]  ? do_send_sig_info+0xa3/0xc0
<4>[   71.850409]  exit_to_user_mode_loop+0x49/0x140
<4>[   71.850417]  exit_to_user_mode_prepare+0x96/0x140
<4>[   71.850425]  syscall_exit_to_user_mode+0x2d/0x120
<4>[   71.850434]  entry_SYSCALL_64_after_hwframe+0x24/0x8e
<4>[   71.850444] RIP: 0033:0x7f4645e96a7c
<4>[   71.850452] Code: Unable to access opcode bytes at 0x7f4645e96a52.
<4>[   71.850462] RSP: 002b:00007fffc474a620 EFLAGS: 00000246 ORIG_RAX: 00000000000000ea
<4>[   71.850473] RAX: 0000000000000000 RBX: 00007f4645b4ca80 RCX: 00007f4645e96a7c
<4>[   71.850484] RDX: 0000000000000006 RSI: 00000000000005ae RDI: 00000000000005ae
<4>[   71.850494] RBP: 00000000000005ae R08: 00007fffc474a6f0 R09: 0000000000000000
<4>[   71.850506] R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000006
<4>[   71.850518] R13: 0000000000000016 R14: 000055f8fb6728d0 R15: 000055f8fb69fce8
<4>[   71.850530]  </TASK>
<4>[   71.850535] Modules linked in: xt_nat xt_mark nvme_fabrics ccm r8153_ecm cdc_ether usbnet uas r8152 usb_storage mii xt_CHECKSUM xt_MASQUERADE xt_conntrack ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc snd_ctl_led snd_soc_skl_hda_dsp snd_soc_hdac_hdmi snd_soc_intel_hda_dsp_common snd_sof_probes snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep rtw88_8822ce snd_pcm rtw88_8822c rtw88_pci uvcvideo snd_seq_midi
<4>[   71.850559]  rtw88_core snd_seq_midi_event snd_rawmidi intel_tcc_cooling snd_seq videobuf2_vmalloc x86_pkg_temp_thermal videobuf2_memops hid_multitouch intel_powerclamp iTCO_wdt videobuf2_v4l2 mei_hdcp coretemp videobuf2_common intel_pmc_bxt snd_seq_device nls_iso8859_1 mac80211 ee1004 btrfs iTCO_vendor_support intel_rapl_msr kvm_intel videodev crct10dif_pclmul snd_timer processor_thermal_device_pci_legacy crc32_pclmul mei_me processor_thermal_device ghash_clmulni_intel cfg80211 sha512_ssse3 mc processor_thermal_rfim hp_wmi snd intel_lpss_pci processor_thermal_mbox libarc4 platform_profile mei serio_raw processor_thermal_rapl sparse_keymap i2c_i801 soundcore wmi_bmof intel_lpss intel_rapl_common i2c_smbus idma64 intel_soc_dts_iosf i2c_hid_acpi i2c_hid int3403_thermal int3400_thermal int340x_thermal_zone acpi_thermal_rel acpi_pad dptf_pch_fivr sch_fq_codel kvmgt mdev kvm parport_pc ppdev lp parport ramoops reed_solomon efi_pstore ip_tables x_tables autofs4 input_leds
<4>[   71.850693]  raid10 raid456 libcrc32c async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log joydev hid_generic usbhid hid nvme nvme_core i915 drm_buddy i2c_algo_bit ttm drm_display_helper cec rc_core drm_kms_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm aesni_intel crypto_simd cryptd xhci_pci vmd xhci_pci_renesas video wmi pinctrl_tigerlake mac_hid
<4>[   71.850869] ---[ end trace 0000000000000000 ]---
<4>[   71.952603] RIP: 0010:__list_del_entry_valid+0x4c/0xa0
<4>[   71.952621] Code: 39 48 83 c2 22 48 39 d0 74 3e 48 8b 10 48 39 f2 75 44 48 8b 51 08 48 39 f2 75 4c b0 01 c3 48 c7 c7 08 1a 60 82 e8 c2 3e a7 ff <0f> 0b 48 c7 c7 19 9d 68 82 e8 b4 3e a7 ff 0f 0b 48 c7 c7 fe 52 6a
<4>[   71.952650] RSP: 0018:ffff888111e0bc28 EFLAGS: 00010286
<4>[   71.952661] RAX: 0000000000000033 RBX: ffff888111e0bc50 RCX: 0000000000000000
<4>[   71.952674] RDX: ffff889036be0b78 RSI: 00000000ffefffff RDI: ffff889036bdd808
<4>[   71.952685] RBP: 0000000000000000 R08: 00000000000fffff R09: ffff88907c3fe000
<4>[   71.952697] R10: 00000000002ffffd R11: 0000000000000004 R12: ffff88812460daf8
<4>[   71.952708] R13: 0000000000000000 R14: ffff88812460da90 R15: ffff888111819898
<4>[   71.952721] FS:  0000000000000000(0000) GS:ffff889036bc0000(0000) knlGS:0000000000000000
<4>[   71.952742] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   71.952757] CR2: 00007f7e58eaaae0 CR3: 0000000129a12002 CR4: 0000000000770ee0
<4>[   71.952776] PKRU: 55555554
<1>[   71.953743] Fixing recursive fault but reboot is needed!
<3>[   71.954677] BUG: scheduling while atomic: Xorg/1454/0x00000000
<4>[   71.955567] Modules linked in: xt_nat xt_mark nvme_fabrics ccm r8153_ecm cdc_ether usbnet uas r8152 usb_storage mii xt_CHECKSUM xt_MASQUERADE xt_conntrack ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc snd_ctl_led snd_soc_skl_hda_dsp snd_soc_hdac_hdmi snd_soc_intel_hda_dsp_common snd_sof_probes snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_soc_dmic snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep rtw88_8822ce snd_pcm rtw88_8822c rtw88_pci uvcvideo snd_seq_midi
<4>[   71.955584]  rtw88_core snd_seq_midi_event snd_rawmidi intel_tcc_cooling snd_seq videobuf2_vmalloc x86_pkg_temp_thermal videobuf2_memops hid_multitouch intel_powerclamp iTCO_wdt videobuf2_v4l2 mei_hdcp coretemp videobuf2_common intel_pmc_bxt snd_seq_device nls_iso8859_1 mac80211 ee1004 btrfs iTCO_vendor_support intel_rapl_msr kvm_intel videodev crct10dif_pclmul snd_timer processor_thermal_device_pci_legacy crc32_pclmul mei_me processor_thermal_device ghash_clmulni_intel cfg80211 sha512_ssse3 mc processor_thermal_rfim hp_wmi snd intel_lpss_pci processor_thermal_mbox libarc4 platform_profile mei serio_raw processor_thermal_rapl sparse_keymap i2c_i801 soundcore wmi_bmof intel_lpss intel_rapl_common i2c_smbus idma64 intel_soc_dts_iosf i2c_hid_acpi i2c_hid int3403_thermal int3400_thermal int340x_thermal_zone acpi_thermal_rel acpi_pad dptf_pch_fivr sch_fq_codel kvmgt mdev kvm parport_pc ppdev lp parport ramoops reed_solomon efi_pstore ip_tables x_tables autofs4 input_leds
<4>[   71.960218]  raid10 raid456 libcrc32c async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1 raid0 multipath linear dm_mirror dm_region_hash dm_log joydev hid_generic usbhid hid nvme nvme_core i915 drm_buddy i2c_algo_bit ttm drm_display_helper cec rc_core drm_kms_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm aesni_intel crypto_simd cryptd xhci_pci vmd xhci_pci_renesas video wmi pinctrl_tigerlake mac_hid
<4>[   71.967994] CPU: 7 PID: 1454 Comm: Xorg Tainted: G      D W          6.1.9-2023-02-05-00498-g8ac3f3ea3339 #1 f45067dcdcd5671001354cafa377ba836858a12e
<4>[   71.969102] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.21 03/21/2022
<4>[   71.970197] Call Trace:
<4>[   71.971400]  <TASK>
<4>[   71.972596]  __schedule_bug+0x6f/0xd0
<4>[   71.973795]  __schedule+0x4f6/0x1400
<4>[   71.974986]  ? vprintk_emit+0x19f/0x2e0
<4>[   71.976154]  ? _printk+0x46/0x52
<4>[   71.977322]  do_task_dead+0x39/0x40
<4>[   71.978502]  make_task_dead+0xe4/0xf0
<4>[   71.979659]  rewind_stack_and_make_dead+0x17/0x18
<4>[   71.980819] RIP: 0033:0x7f4645e96a7c
<4>[   71.981989] Code: Unable to access opcode bytes at 0x7f4645e96a52.
<4>[   71.983173] RSP: 002b:00007fffc474a620 EFLAGS: 00000246 ORIG_RAX: 00000000000000ea
<4>[   71.984337] RAX: 0000000000000000 RBX: 00007f4645b4ca80 RCX: 00007f4645e96a7c
<4>[   71.985509] RDX: 0000000000000006 RSI: 00000000000005ae RDI: 00000000000005ae
<4>[   71.986695] RBP: 00000000000005ae R08: 00007fffc474a6f0 R09: 0000000000000000
<4>[   71.987868] R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000006
<4>[   71.989052] R13: 0000000000000016 R14: 000055f8fb6728d0 R15: 000055f8fb69fce8
<4>[   71.990818]  </TASK>
<7>[   74.600065] rfkill: input handler disabled
<7>[   74.679840] rfkill: input handler enabled
<7>[   75.032315] rfkill: input handler disabled
<7>[   77.106849] rfkill: input handler enabled
<7>[   79.237296] rfkill: input handler disabled
<7>[   82.210600] rfkill: input handler enabled

