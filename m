Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1223A0CE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BDC891CA;
	Mon,  3 Aug 2020 08:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC76EA5E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 10:31:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CD29AF95;
 Fri, 31 Jul 2020 10:31:33 +0000 (UTC)
Received: from localhost (brahms.olymp [local])
 by brahms.olymp (OpenSMTPD) with ESMTPA id b5a0e791;
 Fri, 31 Jul 2020 10:31:18 +0000 (UTC)
From: Luis Henriques <lhenriques@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: drm: list_add corruption followed by BUG (stack guard page was hit)
Date: Fri, 31 Jul 2020 11:31:18 +0100
Message-ID: <87tuxof021.fsf@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

I've just got the following WARNING followed by a BUG on rc7.  Maybe it's
already a known issue, but here it is anyway.

Cheers,
-- 
Luis

[   38.001304] ------------[ cut here ]------------
[   38.001312] list_add corruption. prev->next should be next (ffff8fe713397b88), but was 0000000000000000. (prev=ffff8fe715fb9140).
[   38.001337] WARNING: CPU: 3 PID: 501 at lib/list_debug.c:26 __list_add_valid+0x4d/0x70
[   38.001340] Modules linked in: cdc_ether(E) usbnet(E) r8152(E) mii(E) hid_generic(E) usbhid(E) snd_hda_codec_hdmi(E) iwlmvm(E) dell_rbtn(E) mac80211(E) libarc4(E) snd_hda_codec_realtek(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_codec_generic(E) coretemp(E) mei_wdt(E) dell_laptop(E) kvm_intel(E) ledtrig_audio(E) intel_rapl_msr(E) dell_smm_hwmon(E) snd_hda_intel(E) kvm(E) uvcvideo(E) snd_intel_dspcfg(E) videobuf2_vmalloc(E) irqbypass(E) iwlwifi(E) videobuf2_memops(E) rapl(E) snd_hda_codec(E) videobuf2_v4l2(E) intel_cstate(E) dell_wmi(E) joydev(E) snd_hwdep(E) pcspkr(E) serio_raw(E) intel_uncore(E) dell_smbios(E) videobuf2_common(E) dcdbas(E) snd_hda_core(E) iTCO_wdt(E) snd_pcm(E) videodev(E) wmi_bmof(E) snd_timer(E) dell_wmi_descriptor(E) intel_wmi_thunderbolt(E) iTCO_vendor_support(E) mei_me(E) snd(E) cfg80211(E) soundcore(E) tpm_crb(E) mc(E) rfkill(E) mei(E) intel_pch_thermal(E) sg(E) processor_thermal_device(E) intel_rapl_common(E) intel_soc_dts_iosf(E) battery(E) tpm
 _tis(E)
[   38.001397]  int3403_thermal(E) tpm_tis_core(E) tpm(E) dell_smo8800(E) intel_hid(E) evdev(E) rng_core(E) int3400_thermal(E) int3402_thermal(E) acpi_thermal_rel(E) int340x_thermal_zone(E) sparse_keymap(E) acpi_pad(E) ac(E) nft_counter(E) nft_ct(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) i2c_dev(E) nf_tables(E) parport_pc(E) ppdev(E) nfnetlink(E) lp(E) parport(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) libcrc32c(E) crc32c_generic(E) dm_crypt(E) cbc(E) encrypted_keys(E) dm_mod(E) sd_mod(E) t10_pi(E) rtsx_pci_sdmmc(E) crct10dif_pclmul(E) crc32_pclmul(E) crc32c_intel(E) ghash_clmulni_intel(E) mmc_core(E) aesni_intel(E) crypto_simd(E) cryptd(E) glue_helper(E) ahci(E) nouveau(E) i915(E) mxm_wmi(E) i2c_i801(E) i2c_smbus(E) libahci(E) ttm(E) i2c_algo_bit(E) rtsx_pci(E) xhci_pci(E) drm_kms_helper(E) intel_lpss_pci(E) libata(E) syscopyarea(E) intel_lpss(E) xhci_hcd(E) idma64(E) sysfillrect(E) virt_dma(
 E)
[   38.001461]  sysimgblt(E) scsi_mod(E) fb_sys_fops(E) mfd_core(E) usbcore(E) usb_common(E) drm(E) fan(E) thermal(E) i2c_hid(E) hid(E) wmi(E) video(E) button(E)
[   38.001482] CPU: 3 PID: 501 Comm: kworker/3:4 Tainted: G            E     5.8.0-rc7 #43
[   38.001485] Hardware name: Dell Inc. Precision 5510/0N8J4R, BIOS 1.14.2 05/25/2020
[   38.001513] Workqueue: events_long drm_dp_mst_link_probe_work [drm_kms_helper]
[   38.001521] RIP: 0010:__list_add_valid+0x4d/0x70
[   38.001527] Code: c3 4c 89 c1 48 c7 c7 98 34 ed af e8 7f 16 c9 ff 0f 0b 31 c0 c3 48 89 d1 4c 89 c6 4c 89 ca 48 c7 c7 e8 34 ed af e8 65 16 c9 ff <0f> 0b 31 c0 c3 48 89 f2 4c 89 c1 48 89 fe 48 c7 c7 38 35 ed af e8
[   38.001530] RSP: 0018:ffffa47680417ca0 EFLAGS: 00010286
[   38.001535] RAX: 0000000000000000 RBX: ffff8fe713397b88 RCX: 0000000000000027
[   38.001538] RDX: 0000000000000027 RSI: 0000000000000096 RDI: ffff8fe71e197b68
[   38.001541] RBP: ffff8fe7133977e8 R08: ffff8fe71e197b60 R09: 0000000000000084
[   38.001544] R10: ffffa47680417b48 R11: ffffa47680417b4d R12: ffff8fe71869f800
[   38.001547] R13: ffff8fe715fb9140 R14: ffff8fe71869f940 R15: ffff8fe713397b68
[   38.001551] FS:  0000000000000000(0000) GS:ffff8fe71e180000(0000) knlGS:0000000000000000
[   38.001555] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   38.001558] CR2: 00007f9e3f7159d0 CR3: 000000040e60a004 CR4: 00000000003606e0
[   38.001561] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   38.001563] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   38.001566] Call Trace:
[   38.001593]  drm_dp_queue_down_tx+0x5c/0x110 [drm_kms_helper]
[   38.001604]  ? i2c_register_adapter+0x1d0/0x390
[   38.001627]  drm_dp_send_enum_path_resources+0x54/0x120 [drm_kms_helper]
[   38.001650]  drm_dp_send_link_address+0x682/0x990 [drm_kms_helper]
[   38.001657]  ? prepare_to_wait_event+0x7e/0x150
[   38.001661]  ? finish_wait+0x3f/0x80
[   38.001684]  drm_dp_check_and_send_link_address+0xad/0xd0 [drm_kms_helper]
[   38.001707]  drm_dp_mst_link_probe_work+0x94/0x180 [drm_kms_helper]
[   38.001714]  process_one_work+0x1ae/0x370
[   38.001720]  worker_thread+0x50/0x3a0
[   38.001725]  ? process_one_work+0x370/0x370
[   38.001729]  kthread+0x11b/0x140
[   38.001734]  ? kthread_associate_blkcg+0x90/0x90
[   38.001741]  ret_from_fork+0x22/0x30
[   38.001747] ---[ end trace ca03f107384f1adc ]---
[   38.001759] BUG: stack guard page was hit at 0000000062c9d455 (stack is 00000000e3f6f298..0000000086ee600f)
[   38.001766] kernel stack overflow (page fault): 0000 [#1] SMP PTI
[   38.001771] CPU: 3 PID: 501 Comm: kworker/3:4 Tainted: G        W   E     5.8.0-rc7 #43
[   38.001774] Hardware name: Dell Inc. Precision 5510/0N8J4R, BIOS 1.14.2 05/25/2020
[   38.001797] Workqueue: events_long drm_dp_mst_link_probe_work [drm_kms_helper]
[   38.001820] RIP: 0010:process_single_tx_qlock+0x364/0x4d0 [drm_kms_helper]
[   38.001826] Code: f8 49 89 54 00 f8 4c 89 c2 48 29 ca 48 01 d0 49 29 d7 48 83 e0 f8 48 83 f8 08 0f 82 16 ff ff ff 48 83 e0 f8 31 d2 49 8b 34 17 <48> 89 34 11 48 83 c2 08 48 39 c2 72 ef e9 fa fe ff ff c6 44 24 4e
[   38.001829] RSP: 0018:ffffa47680417bd0 EFLAGS: 00010207
[   38.001833] RAX: fffffffffffffff0 RBX: 00000000fffffffc RCX: ffffa47680417c28
[   38.001835] RDX: 00000000000003d8 RSI: 0000000000000000 RDI: ffffa47680417c20
[   38.001838] RBP: ffff8fe715fb9000 R08: ffffa47680417c23 R09: 000000000000000a
[   38.001841] R10: 0000000000000002 R11: 0000000000000001 R12: ffff8fe7133977e8
[   38.001843] R13: 0000000000000000 R14: 0000000000000003 R15: ffff8fe715fb9009
[   38.001847] FS:  0000000000000000(0000) GS:ffff8fe71e180000(0000) knlGS:0000000000000000
[   38.001850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   38.001853] CR2: ffffa47680418000 CR3: 000000040e60a004 CR4: 00000000003606e0
[   38.001856] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   38.001858] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   38.001860] Call Trace:
[   38.001871]  ? asm_exc_invalid_op+0x12/0x20
[   38.001885] Modules linked in: cdc_ether(E) usbnet(E) r8152(E) mii(E) hid_generic(E) usbhid(E) snd_hda_codec_hdmi(E) iwlmvm(E) dell_rbtn(E) mac80211(E) libarc4(E) snd_hda_codec_realtek(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_codec_generic(E) coretemp(E) mei_wdt(E) dell_laptop(E) kvm_intel(E) ledtrig_audio(E) intel_rapl_msr(E) dell_smm_hwmon(E) snd_hda_intel(E) kvm(E) uvcvideo(E) snd_intel_dspcfg(E) videobuf2_vmalloc(E) irqbypass(E) iwlwifi(E) videobuf2_memops(E) rapl(E) snd_hda_codec(E) videobuf2_v4l2(E) intel_cstate(E) dell_wmi(E) joydev(E) snd_hwdep(E) pcspkr(E) serio_raw(E) intel_uncore(E) dell_smbios(E) videobuf2_common(E) dcdbas(E) snd_hda_core(E) iTCO_wdt(E) snd_pcm(E) videodev(E) wmi_bmof(E) snd_timer(E) dell_wmi_descriptor(E) intel_wmi_thunderbolt(E) iTCO_vendor_support(E) mei_me(E) snd(E) cfg80211(E) soundcore(E) tpm_crb(E) mc(E) rfkill(E) mei(E) intel_pch_thermal(E) sg(E) processor_thermal_device(E) intel_rapl_common(E) intel_soc_dts_iosf(E) battery(E) tpm
 _tis(E)
[   38.001934]  int3403_thermal(E) tpm_tis_core(E) tpm(E) dell_smo8800(E) intel_hid(E) evdev(E) rng_core(E) int3400_thermal(E) int3402_thermal(E) acpi_thermal_rel(E) int340x_thermal_zone(E) sparse_keymap(E) acpi_pad(E) ac(E) nft_counter(E) nft_ct(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) i2c_dev(E) nf_tables(E) parport_pc(E) ppdev(E) nfnetlink(E) lp(E) parport(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) libcrc32c(E) crc32c_generic(E) dm_crypt(E) cbc(E) encrypted_keys(E) dm_mod(E) sd_mod(E) t10_pi(E) rtsx_pci_sdmmc(E) crct10dif_pclmul(E) crc32_pclmul(E) crc32c_intel(E) ghash_clmulni_intel(E) mmc_core(E) aesni_intel(E) crypto_simd(E) cryptd(E) glue_helper(E) ahci(E) nouveau(E) i915(E) mxm_wmi(E) i2c_i801(E) i2c_smbus(E) libahci(E) ttm(E) i2c_algo_bit(E) rtsx_pci(E) xhci_pci(E) drm_kms_helper(E) intel_lpss_pci(E) libata(E) syscopyarea(E) intel_lpss(E) xhci_hcd(E) idma64(E) sysfillrect(E) virt_dma(
 E)
[   38.001990]  sysimgblt(E) scsi_mod(E) fb_sys_fops(E) mfd_core(E) usbcore(E) usb_common(E) drm(E) fan(E) thermal(E) i2c_hid(E) hid(E) wmi(E) video(E) button(E)
[   38.002008] ---[ end trace ca03f107384f1add ]---
[   38.002031] RIP: 0010:process_single_tx_qlock+0x364/0x4d0 [drm_kms_helper]
[   38.002036] Code: f8 49 89 54 00 f8 4c 89 c2 48 29 ca 48 01 d0 49 29 d7 48 83 e0 f8 48 83 f8 08 0f 82 16 ff ff ff 48 83 e0 f8 31 d2 49 8b 34 17 <48> 89 34 11 48 83 c2 08 48 39 c2 72 ef e9 fa fe ff ff c6 44 24 4e
[   38.002039] RSP: 0018:ffffa47680417bd0 EFLAGS: 00010207
[   38.002042] RAX: fffffffffffffff0 RBX: 00000000fffffffc RCX: ffffa47680417c28
[   38.002045] RDX: 00000000000003d8 RSI: 0000000000000000 RDI: ffffa47680417c20
[   38.002048] RBP: ffff8fe715fb9000 R08: ffffa47680417c23 R09: 000000000000000a
[   38.002051] R10: 0000000000000002 R11: 0000000000000001 R12: ffff8fe7133977e8
[   38.002053] R13: 0000000000000000 R14: 0000000000000003 R15: ffff8fe715fb9009
[   38.002057] FS:  0000000000000000(0000) GS:ffff8fe71e180000(0000) knlGS:0000000000000000
[   38.002060] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   38.002062] CR2: ffffa47680418000 CR3: 000000040e60a004 CR4: 00000000003606e0
[   38.002065] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   38.002068] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
