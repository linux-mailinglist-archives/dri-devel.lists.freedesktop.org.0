Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BBD2BC27C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 23:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F20F89F4F;
	Sat, 21 Nov 2020 22:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13789F4F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 22:43:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210301] New: *ERROR* IB test failed on gfx (-110) on Ryzen 4750u
Date: Sat, 21 Nov 2020 22:43:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ar_registration@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210301-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=210301

            Bug ID: 210301
           Summary: *ERROR* IB test failed on gfx (-110) on Ryzen 4750u
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.8
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ar_registration@mailbox.org
        Regression: No

Boting in a new Thinkpad T14 AMD (4750u), I get *sometimes* the following
errors:

2020-11-21T16:45:15.53245 kern.err: [    5.934142] amdgpu 0000:07:00.0:
[drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test failed on gfx (-110).
2020-11-21T16:45:15.53247 kern.err: [    5.935598] [drm:process_one_work]
*ERROR* ib ring test failed (-110).

When this happens (typically 9/10 times) the machine eventually hangs.
Sometimes with a page fault, sometimes with a general protection fault, but
*always* in what appears to be the zfs calls. 

When the machine boots without the "*ERROR* IB test failed on gfx ", the
machines *never* produces segmentation faults/general protection faults, even
under very heavy i/o load.

I have reproduced this problem:
- In kernels 5.8.18, 5.9.6, 5.9.7, 5.9.8
- With two different SSD
- With the firmware versions 20201118, 20201022, 20200918
- I have updated te BIOS two times (versions 1.09, 1.25, 1.27)

I boot with the kernel command line options amd_iommu=on iommu=soft in order to
avoid *another* error (AMD-Vi: Unable to read/write to IOMMU perf counter.)

For example:

2020-10-24T22:00:29.88940 kern.warn: [ 1021.160344] general protection fault,
probably for non-canonical address 0x3ff800040000000: 0000 [#1] SMP NOPTI
2020-10-24T22:00:29.89005 kern.warn: [ 1021.160348] CPU: 10 PID: 12746 Comm:
bonnie++ Tainted: P           O      5.8.16_1 #1
2020-10-24T22:00:29.89014 kern.warn: [ 1021.160349] Hardware name: LENOVO
20UDCTO1WW/20UDCTO1WW, BIOS R1BET40W(1.09 ) 08/07/2020
2020-10-24T22:00:29.89005 kern.warn: [ 1021.160348] CPU: 10 PID: 12746 Comm:
bonnie++ Tainted: P           O      5.8.16_1 #1
2020-10-24T22:00:29.89014 kern.warn: [ 1021.160349] Hardware name: LENOVO
20UDCTO1WW/20UDCTO1WW, BIOS R1BET40W(1.09 ) 08/07/2020
2020-10-24T22:00:29.89021 kern.warn: [ 1021.160385] RIP:
0010:dbuf_find+0x86/0x190 [zfs]
2020-10-24T22:00:29.89030 kern.warn: [ 1021.160387] Code: 7b 01 00 49 89 57 28
4a 8b 04 f0 48 85 c0 0f 84 b2 00 00 00 48 8b 0c 24 49 89 d6 eb 0d 48 8b 40 38
48 85 c0 0f 84 9c 00 00 00 <48> 39 18 75 ee 48 39 68 20 75 e8 44 38 68 50 75 e2
48 39 48 40 75
2020-10-24T22:00:29.89033 kern.warn: [ 1021.160387] RSP: 0018:ffffb3ff15a4ba28
EFLAGS: 00010206
2020-10-24T22:00:29.89030 kern.warn: [ 1021.160387] Code: 7b 01 00 49 89 57 28
4a 8b 04 f0 48 85 c0 0f 84 b2 00 00 00 48 8b 0c 24 49 89 d6 eb 0d 48 8b 40 38
48 85 c0 0f 84 9c 00 00 00 <48> 39 18 75 ee 48 39 68 20 75 e8 44 38 68 50 75 e2
48 39 48 40 75
2020-10-24T22:00:29.89033 kern.warn: [ 1021.160387] RSP: 0018:ffffb3ff15a4ba28
EFLAGS: 00010206
2020-10-24T22:00:29.89041 kern.warn: [ 1021.160389] RAX: 03ff800040000000 RBX:
00000000000587ce RCX: 0000000000001fd4
2020-10-24T22:00:29.89044 kern.warn: [ 1021.160389] RDX: ffff98bc4b6dbe00 RSI:
00000000000587ce RDI: ffffffffc11be4d0
2020-10-24T22:00:29.89046 kern.warn: [ 1021.160390] RBP: ffff98bc9cfa3000 R08:
99de27c9bb992351 R09: 9ae16a3b2f90404f
2020-10-24T22:00:29.89049 kern.warn: [ 1021.160391] R10: 0000000000000000 R11:
ffff98bcca928000 R12: 0000000000030fc0
2020-10-24T22:00:29.89061 kern.warn: [ 1021.160391] R13: 0000000000000000 R14:
ffff98bc4b6dbe00 R15: ffffffffc11be4d0
2020-10-24T22:00:29.89065 kern.warn: [ 1021.160392] FS:  00007f739cf48740(0000)
GS:ffff98bccf080000(0000) knlGS:0000000000000000
2020-10-24T22:00:29.89070 kern.warn: [ 1021.160393] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
2020-10-24T22:00:29.89077 kern.warn: [ 1021.160393] CR2: 00007f790e77d280 CR3:
0000000757346000 CR4: 0000000000340ee0
2020-10-24T22:00:29.89081 kern.warn: [ 1021.160394] Call Trace:
2020-10-24T22:00:29.89084 kern.warn: [ 1021.160400]  ? _cond_resched+0x15/0x30
2020-10-24T22:00:29.89088 kern.warn: [ 1021.160410] 
dbuf_hold_impl_arg+0x41/0x610 [zfs]
2020-10-24T22:00:29.89091 kern.warn: [ 1021.160413]  ?
spl_kmem_alloc+0xbf/0x100 [spl]
2020-10-24T22:00:29.89095 kern.warn: [ 1021.160424]  dbuf_hold_impl+0x94/0xc0
[zfs]
2020-10-24T22:00:29.89098 kern.warn: [ 1021.160434]  dbuf_hold_level+0x2b/0x60
[zfs]
2020-10-24T22:00:29.89102 kern.warn: [ 1021.160446] 
dmu_tx_check_ioerr+0x35/0xd0 [zfs]
2020-10-24T22:00:29.89105 kern.warn: [ 1021.160457] 
dmu_tx_count_write+0xe5/0x1a0 [zfs]
2020-10-24T22:00:29.89109 kern.warn: [ 1021.160468] 
dmu_tx_hold_write_by_dnode+0x35/0x50 [zfs]
2020-10-24T22:00:29.89112 kern.warn: [ 1021.160481]  zfs_write+0x410/0xe00
[zfs]
2020-10-24T22:00:29.89116 kern.warn: [ 1021.160485]  ?
enqueue_entity+0xf1/0x580
2020-10-24T22:00:29.89121 kern.warn: [ 1021.160497] 
zpl_write_common_iovec+0xaf/0x100 [zfs]
2020-10-24T22:00:29.89126 kern.warn: [ 1021.160509]  zpl_iter_write+0xed/0x120
[zfs]
2020-10-24T22:00:29.89129 kern.warn: [ 1021.160511]  new_sync_write+0x11b/0x1b0
2020-10-24T22:00:29.89133 kern.warn: [ 1021.160513]  vfs_write+0x1c3/0x1f0
2020-10-24T22:00:29.89136 kern.warn: [ 1021.160515]  ksys_write+0x5f/0xe0
2020-10-24T22:00:29.89140 kern.warn: [ 1021.160516]  do_syscall_64+0x44/0x70
2020-10-24T22:00:29.89145 kern.warn: [ 1021.160518] 
entry_SYSCALL_64_after_hwframe+0x44/0xa9
2020-10-24T22:00:29.89150 kern.warn: [ 1021.160519] RIP: 0033:0x7f739d4f7de3
2020-10-24T22:00:29.89155 kern.warn: [ 1021.160521] Code: 75 05 48 83 c4 58 c3
e8 9b 43 ff ff 66 2e 0f 1f 84 00 00 00 00 00 90 64 8b 04 25 18 00 00 00 85 c0
75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28
48 89 54 24 18
2020-10-24T22:00:29.89160 kern.warn: [ 1021.160521] RSP: 002b:00007ffee6a2caa8
EFLAGS: 00000246 ORIG_RAX: 0000000000000001
2020-10-24T22:00:29.89165 kern.warn: [ 1021.160522] RAX: ffffffffffffffda RBX:
00007ffee6a2caf0 RCX: 00007f739d4f7de3
2020-10-24T22:00:29.89177 kern.warn: [ 1021.160523] RDX: 0000000000002000 RSI:
00005623e29fd000 RDI: 0000000000000003
2020-10-24T22:00:29.89188 kern.warn: [ 1021.160523] RBP: 0000000000001d41 R08:
0000000000000000 R09: 0036343732312e00
2020-10-24T22:00:29.89202 kern.warn: [ 1021.160524] R10: 0000000000000180 R11:
0000000000000246 R12: 000000000001fd40
2020-10-24T22:00:29.89207 kern.warn: [ 1021.160524] R13: 00007ffee6a2caf0 R14:
00007ffee6a2cad0 R15: 00005623e29fd000
2020-10-24T22:00:29.89212 2020-10-24T22:00:29.89212 2020-10-24T22:00:29.89212
kern.warn: [ 1021.160525] Modules linked in: ctr ccm acpi_call(O) 8021q garp
mrp stp llc uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common videodev btusb mc btrtl btbcm btintel joydev snd_soc_dmic
snd_acp3x_pdm_dma snd_acp3x_rn snd_soc_core snd_compress snd_pcm_dmaengine
ac97_bus tps6598x typec roles edac_mce_amd kvm_amd iwlmvm kvm mac80211
irqbypass crct10dif_pclmul ghash_clmulni_intel snd_hda_codec_realtek
aesni_intel libarc4 snd_hda_codec_generic snd_hda_codec_hdmi crypto_simd cryptd
snd_hda_intel glue_helper snd_intel_dspcfg rapl iwlwifi snd_hda_codec psmouse
input_leds pcspkr wmi_bmof snd_hda_core snd_hwdep ipmi_devintf cfg80211 r8169
snd_rn_pci_acp3x sp5100_tco tpm_crb snd_pcm snd_pci_acp3x ccp ipmi_msghandler
realtek k10temp i2c_piix4 thinkpad_acpi i2c_multi_instantiate ledtrig_audio ac
tpm_tis tpm_tis_core evdev mac_hid tpm i2c_scmi rng_core acpi_cpufreq
i2c_designware_platform tiny_power_button i2c_designware_core snd_seq
snd_seq_device snd_timer snd soundcore
kern.warn: [ 1021.160525] Modules linked in: ctr ccm acpi_call(O) 8021q garp
mrp stp llc uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common videodev btusb mc btrtl btbcm btintel joydev snd_soc_dmic
snd_acp3x_pdm_dma snd_acp3x_rn snd_soc_core snd_compress snd_pcm_dmaengine
ac97_bus tps6598x typec roles edac_mce_amd kvm_amd iwlmvm kvm mac80211
irqbypass crct10dif_pclmul ghash_clmulni_intel snd_hda_codec_realtek
aesni_intel libarc4 snd_hda_codec_generic snd_hda_codec_hdmi crypto_simd cryptd
snd_hda_intel glue_helper snd_intel_dspcfg rapl iwlwifi snd_hda_codec psmouse
input_leds pcspkr wmi_bmof snd_hda_core snd_hwdep ipmi_devintf cfg80211 r8169
snd_rn_pci_acp3x sp5100_tco tpm_crb snd_pcm snd_pci_acp3x ccp ipmi_msghandler
realtek k10temp i2c_piix4 thinkpad_acpi i2c_multi_instantiate ledtrig_audio ac
tpm_tis tpm_tis_core evdev mac_hid tpm i2c_scmi rng_core acpi_cpufreq
i2c_designware_platform tiny_power_button i2c_designware_core snd_seq
snd_seq_device snd_timer snd soundcore
2020-10-24T22:00:29.89238 kern.warn: [ 1021.160552]  vhost_vsock
vmw_vsock_virtio_transport_common vsock vhost_net vhost tap vhost_iotlb uhid
hid hci_vhci bluetooth ecdh_generic rfkill ecc crc16 vfio_iommu_type1 vfio
dm_mod uinput userio ppp_generic slhc tun loop nvram btrfs blake2b_generic xor
raid6_pq libcrc32c crc32c_generic cuse fuse zfs(PO) zunicode(PO) zlua(PO)
zavl(PO) icp(PO) amdgpu iommu_v2 gpu_sched i2c_algo_bit ttm rtsx_pci_sdmmc
mmc_core drm_kms_helper syscopyarea sysfillrect zcommon(PO) sysimgblt
fb_sys_fops cec znvpair(PO) rc_core xhci_pci xhci_pci_renesas spl(O) xhci_hcd
ehci_pci crc32_pclmul drm crc32c_intel ehci_hcd serio_raw usbcore agpgart
rtsx_pci wmi button battery video
2020-10-24T22:00:29.89243 kern.warn: [ 1021.160577] ---[ end trace
17b0063aeadb5c32 ]---
2020-10-24T22:00:29.89248 kern.warn: [ 1021.160589] RIP:
0010:dbuf_find+0x86/0x190 [zfs]
2020-10-24T22:00:29.89253 kern.warn: [ 1021.160589] Code: 7b 01 00 49 89 57 28
4a 8b 04 f0 48 85 c0 0f 84 b2 00 00 00 48 8b 0c 24 49 89 d6 eb 0d 48 8b 40 38
48 85 c0 0f 84 9c 00 00 00 <48> 39 18 75 ee 48 39 68 20 75 e8 44 38 68 50 75 e2
48 39 48 40 75
2020-10-24T22:00:29.89267 kern.warn: [ 1021.160590] RSP: 0018:ffffb3ff15a4ba28
EFLAGS: 00010206
2020-10-24T22:00:29.89271 kern.warn: [ 1021.160591] RAX: 03ff800040000000 RBX:
00000000000587ce RCX: 0000000000001fd4
2020-10-24T22:00:29.89276 kern.warn: [ 1021.160591] RDX: ffff98bc4b6dbe00 RSI:
00000000000587ce RDI: ffffffffc11be4d0
2020-10-24T22:00:29.89281 kern.warn: [ 1021.160592] RBP: ffff98bc9cfa3000 R08:
99de27c9bb992351 R09: 9ae16a3b2f90404f
2020-10-24T22:00:29.89287 kern.warn: [ 1021.160592] R10: 0000000000000000 R11:
ffff98bcca928000 R12: 0000000000030fc0
2020-10-24T22:00:29.89292 kern.warn: [ 1021.160593] R13: 0000000000000000 R14:
ffff98bc4b6dbe00 R15: ffffffffc11be4d0
2020-10-24T22:00:29.89297 kern.warn: [ 1021.160593] FS:  00007f739cf48740(0000)
GS:ffff98bccf080000(0000) knlGS:0000000000000000
2020-10-24T22:00:29.89302 kern.warn: [ 1021.160594] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
2020-10-24T22:00:29.89307 kern.warn: [ 1021.160594] CR2: 00007f790e77d280 CR3:
0000000757346000 CR4: 0000000000340ee0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
