Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444698A869
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188E610E100;
	Mon, 30 Sep 2024 15:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=internode.on.net header.i=@internode.on.net header.b="G9RBooXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omr000.pc5.atmailcloud.com (omr000.pc5.atmailcloud.com
 [103.150.252.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09C310E4E3;
 Mon, 30 Sep 2024 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
 content-type; bh=uwWW0+uvrPYLslBKeNMmeRNcSzdEe54r9+3f74YNvQM=; b=G9RBooXBmR0p
 SrB2b+/tS5CfnyBOHtsG8QNtSraHJSyI3w2Aw4hbb8lhz7CJZ4x92Wsn/7VnPaojw5AxP8z8U5Kl7
 +ciwz2b1qUJW528L4mplKYVcRN9ngSRAzI87gLXPPiEhuSqCd8H17k843uxCibCahCyjEamoYdt+g
 KWYENj3wuirq5hSleqR3GyOpqXj0VTqLKI4eKqL2nuwl+L0wOEFS1n9v18Bo77G4+ZEH3aQVag+zF
 vUtLph3YKD5wtjm3iSxYvM4RLiBUEyB07rgCecvxamjkbjR1E38piQP/PSe+BkJ4Y0kDyT80iJIQm
 I36Q91KHDwMJyDJRA7MDjA==;
Received: from CMR-KAKADU01.i-0b3a7f061139523f6
 by OMR.i-011229ae50fa0cd71 with esmtps
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1svIH6-000000005Mv-2NBe; Mon, 30 Sep 2024 15:25:24 +0000
Received: from [118.210.167.213] (helo=localhost)
 by CMR-KAKADU01.i-0b3a7f061139523f6 with esmtpsa
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1svIH5-0000000007F-329a; Mon, 30 Sep 2024 15:25:23 +0000
Received: from amarsh04 by localhost with local (Exim 4.98)
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1svIH2-000000001DC-1szk; Tue, 01 Oct 2024 00:55:20 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: tzimmermann@suse.de
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org,
 arthur.marsh@internode.on.net, christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, wuhoipok@gmail.com, x86@kernel.org
Subject: NULL pointer dereference with kernel 6.12.0-rc1 and ARUBA GPU
Date: Tue,  1 Oct 2024 00:55:19 +0930
Message-ID: <20240930152520.4654-1-user@am64>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <d95eca6e-0266-4ebe-b9d9-3e8552c5b09a@suse.de>
References: <d95eca6e-0266-4ebe-b9d9-3e8552c5b09a@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=cJnmsEeN c=1 sm=1 tr=0 ts=66fac2e3
 a=Kh1sbcNhzywcxpuRN39Emg==:117 a=Kh1sbcNhzywcxpuRN39Emg==:17
 a=EaEq8P2WXUwA:10 a=x7bEGLp0ZPQA:10 a=QzGBN39vko-WQA9TOoQA:9
X-Cm-Envelope: MS4xfFtAaV2+MewMWaUkw3tKmUocMfD2uTuVNYpCjYEpPzo6fewvNXRmg8bmBBYEAYuMhVAlR+B0oQIlVKKLBhKHsn5/0i4lNKkbIh+yMiamcAibyLe8FJmA
 +ZY1xCNFgw1nXRrxQjj3xbX/oogOLYZtzjg3A5zA9uDBtVC8cIDIbolTXhtJDp4RPYgF3Wy0+q0eww==
X-atmailcloud-route: unknown
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

[   13.069630] [drm] radeon kernel modesetting enabled.
[   13.069681] radeon 0000:00:01.0: vgaarb: deactivate vga console
[   13.070435] Console: switching to colour dummy device 80x25
[   13.070632] [drm] initializing kernel modesetting (ARUBA 0x1002:0x990C 0=
x1002:0x0123 0x00).
[   13.070718] ATOM BIOS: 113
[   13.070778] radeon 0000:00:01.0: VRAM: 768M 0x0000000000000000 - 0x00000=
0002FFFFFFF (768M used)
[   13.070781] radeon 0000:00:01.0: GTT: 1024M 0x0000000030000000 - 0x00000=
0006FFFFFFF
[   13.070785] [drm] Detected VRAM RAM=3D768M, BAR=3D256M
[   13.070786] [drm] RAM width 64bits DDR
[   13.070884] [drm] radeon: 768M of VRAM memory ready
[   13.070885] [drm] radeon: 1024M of GTT memory ready.
[   13.070896] [drm] Loading ARUBA Microcode
[   13.504398] [drm] Internal thermal controller without fan control
[   13.504566] [drm] radeon: dpm initialized
[   13.839229] [drm] Found VCE firmware/feedback version 50.0.1 / 17!
[   13.839264] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   13.863929] [drm] PCIE GART of 1024M enabled (table at 0x00000000001D600=
0).
[   13.864085] radeon 0000:00:01.0: WB enabled
[   13.864088] radeon 0000:00:01.0: fence driver on ring 0 use gpu addr 0x0=
000000030000c00
[   13.864467] radeon 0000:00:01.0: fence driver on ring 5 use gpu addr 0x0=
000000000075a18
[   13.884497] radeon 0000:00:01.0: fence driver on ring 6 use gpu addr 0x0=
000000030000c18
[   13.884502] radeon 0000:00:01.0: fence driver on ring 7 use gpu addr 0x0=
000000030000c1c
[   13.884503] radeon 0000:00:01.0: fence driver on ring 1 use gpu addr 0x0=
000000030000c04
[   13.884505] radeon 0000:00:01.0: fence driver on ring 2 use gpu addr 0x0=
000000030000c08
[   13.884506] radeon 0000:00:01.0: fence driver on ring 3 use gpu addr 0x0=
000000030000c0c
[   13.884507] radeon 0000:00:01.0: fence driver on ring 4 use gpu addr 0x0=
000000030000c10
[   13.884862] radeon 0000:00:01.0: radeon: MSI limited to 32-bit
[   13.884921] radeon 0000:00:01.0: radeon: using MSI.
[   13.885003] [drm] radeon: irq initialized.
[   13.903273] [drm] ring test on 0 succeeded in 3 usecs
[   13.903281] [drm] ring test on 3 succeeded in 4 usecs
[   13.903286] [drm] ring test on 4 succeeded in 3 usecs
[   13.949128] [drm] ring test on 5 succeeded in 2 usecs
[   13.968988] [drm] UVD initialized successfully.
[   14.078221] [drm] ring test on 6 succeeded in 17 usecs
[   14.078234] [drm] ring test on 7 succeeded in 3 usecs
[   14.078236] [drm] VCE initialized successfully.
[   14.078314] snd_hda_intel 0000:00:01.1: bound 0000:00:01.0 (ops radeon_a=
udio_component_bind_ops [radeon])
[   14.078502] [drm] ib test on ring 0 succeeded in 0 usecs
[   14.078555] [drm] ib test on ring 3 succeeded in 0 usecs
[   14.078606] [drm] ib test on ring 4 succeeded in 0 usecs
[   14.153378] mc: Linux media interface: v0.10
[   14.593759] usb 1-3: dvb_usb_v2: found a 'Realtek RTL2832U reference des=
ign' in warm state
[   14.614227] [drm] ib test on ring 5 succeeded
[   14.625865] usb 1-3: dvb_usb_v2: will pass the complete MPEG2 transport =
stream to the software demuxer
[   14.625885] dvbdev: DVB: registering new adapter (Realtek RTL2832U refer=
ence design)
[   14.625889] usb 1-3: media controller created
[   14.627064] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' re=
gistered.
[   14.801142] i2c i2c-5: Added multiplexed i2c bus 6
[   14.801149] rtl2832 5-0010: Realtek RTL2832 successfully attached
[   14.801176] usb 1-3: DVB: registering adapter 0 frontend 0 (Realtek RTL2=
832 (DVB-T))...
[   14.801189] dvbdev: dvb_create_media_entity: media entity 'Realtek RTL28=
32 (DVB-T)' registered.
[   14.957783] i2c i2c-6: fc0012: Fitipower FC0012 successfully identified
[   15.158461] [drm] ib test on ring 6 succeeded
[   15.178787] videodev: Linux video capture interface: v2.00
[   15.460709] rtl2832_sdr rtl2832_sdr.1.auto: Registered as swradio0
[   15.460715] rtl2832_sdr rtl2832_sdr.1.auto: Realtek RTL2832 SDR attached
[   15.460718] rtl2832_sdr rtl2832_sdr.1.auto: SDR API is still slightly ex=
perimental and functionality changes may follow
[   15.477759] usb 1-3: dvb_usb_v2: 'Realtek RTL2832U reference design' suc=
cessfully initialized and connected
[   15.477878] usbcore: registered new interface driver dvb_usb_rtl28xxu
[   15.670413] [drm] ib test on ring 7 succeeded
[   15.671111] BUG: kernel NULL pointer dereference, address: 0000000000000=
050
[   15.671114] #PF: supervisor read access in kernel mode
[   15.671117] #PF: error_code(0x0000) - not-present page
[   15.671119] PGD 0 P4D 0=20
[   15.671123] Oops: Oops: 0000 [#1] PREEMPT_RT SMP NOPTI
[   15.671127] CPU: 2 UID: 0 PID: 437 Comm: udevd Not tainted 6.12.0-rc1 #6=
131
[   15.671132] Hardware name: Gigabyte Technology Co., Ltd. To be filled by=
 O.E.M./F2A78M-HD2, BIOS F2 05/28/2014
[   15.671134] RIP: 0010:drm_dp_aux_register+0x59/0x110 [drm_display_helper]
[   15.671164] Code: 86 c0 48 85 f6 48 89 83 b8 00 00 00 74 1c 48 8d bb b4 =
03 00 00 ba 30 00 00 00 e8 52 35 bc c7 48 8d 7b 08 5b 5d e9 37 31 93 c7 <48=
> 8b 70 50 48 85 f6 75 db 48 8b 30 eb d6 48 8d ab 88 04 00 00 48
[   15.671167] RSP: 0018:ffffb37f80e33960 EFLAGS: 00010246
[   15.671170] RAX: 0000000000000000 RBX: ffff892d407ee508 RCX: ffffffffc09=
b3bc0
[   15.671172] RDX: ffffffffc0869e40 RSI: 0000000000000000 RDI: ffff892d407=
ee9f0
[   15.671174] RBP: ffff892d407ee9f0 R08: ffff892d42fb8008 R09: 00000000c0c=
0c0c0
[   15.671176] R10: 0000000000000000 R11: 0000000000000001 R12: ffff892d5b6=
4af50
[   15.671178] R13: ffff892d5b64b092 R14: ffff892d5b64af2e R15: 00000000000=
00018
[   15.671181] FS:  00007f066d882840(0000) GS:ffff89306f900000(0000) knlGS:=
0000000000000000
[   15.671183] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   15.671185] CR2: 0000000000000050 CR3: 00000001047a6000 CR4: 00000000000=
406f0
[   15.671188] Call Trace:
[   15.671190]  <TASK>
[   15.671192]  ? __die_body.cold+0x19/0x1e
[   15.671200]  ? page_fault_oops+0xa8/0x230
[   15.671206]  ? drm_dp_aux_register+0x59/0x110 [drm_display_helper]
[   15.671227]  ? search_module_extables+0x4f/0x90
[   15.671233]  ? fixup_exception+0x36/0x2f0
[   15.671239]  ? exc_page_fault+0x88/0x1b0
[   15.671244]  ? asm_exc_page_fault+0x22/0x30
[   15.671251]  ? __pfx_radeon_dp_aux_transfer_atom+0x10/0x10 [radeon]
[   15.671437]  ? drm_dp_aux_register+0x59/0x110 [drm_display_helper]
[   15.671463]  radeon_dp_aux_init+0x91/0xc0 [radeon]
[   15.671634]  radeon_get_atom_connector_info_from_object_table+0x58e/0x88=
0 [radeon]
[   15.671764]  ? radeon_get_atom_connector_info_from_supported_devices_tab=
le+0x5cf/0x600 [radeon]
[   15.671895]  ? kstrdup+0x4c/0x70
[   15.671902]  ? __kmalloc_noprof+0x24d/0x340
[   15.671908]  radeon_modeset_init+0x375/0x470 [radeon]
[   15.672050]  ? radeon_device_init+0x667/0xb40 [radeon]
[   15.672179]  radeon_driver_load_kms+0xc2/0x260 [radeon]
[   15.672308]  radeon_pci_probe+0xff/0x170 [radeon]
[   15.672436]  pci_device_probe+0xbe/0x1a0
[   15.672441]  really_probe+0xde/0x350
[   15.672447]  ? pm_runtime_barrier+0x61/0xb0
[   15.672452]  ? __pfx___driver_attach+0x10/0x10
[   15.672457]  __driver_probe_device+0x78/0x110
[   15.672462]  driver_probe_device+0x2d/0xc0
[   15.672467]  __driver_attach+0xc9/0x1c0
[   15.672472]  bus_for_each_dev+0x6a/0xb0
[   15.672476]  ? migrate_enable+0xbf/0xf0
[   15.672480]  bus_add_driver+0x139/0x220
[   15.672485]  driver_register+0x6e/0xc0
[   15.672491]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   15.672616]  do_one_initcall+0x42/0x210
[   15.672622]  ? __kmalloc_cache_noprof+0x89/0x230
[   15.672627]  do_init_module+0x60/0x210
[   15.672631]  init_module_from_file+0x89/0xc0
[   15.672637]  __x64_sys_finit_module+0x142/0x390
[   15.672643]  do_syscall_64+0x47/0x110
[   15.672647]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   15.672653] RIP: 0033:0x7f066d6b3839
[   15.672657] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 85 0d 00 f7 d8 64 89 01 48
[   15.672659] RSP: 002b:00007ffead344b38 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   15.672663] RAX: ffffffffffffffda RBX: 00005586f29e09b0 RCX: 00007f066d6=
b3839
[   15.672665] RDX: 0000000000000000 RSI: 00005586f29d08d0 RDI: 00000000000=
00011
[   15.672667] RBP: 0000000000000000 R08: 0000000000000000 R09: 00005586f29=
c0540
[   15.672669] R10: 00007f066d78cac0 R11: 0000000000000246 R12: 00005586f29=
d08d0
[   15.672671] R13: 0000000000020000 R14: 00005586f29d82e0 R15: 00000000000=
00000
[   15.672675]  </TASK>
[   15.672676] Modules linked in: rtl2832_sdr videobuf2_vmalloc videobuf2_m=
emops videobuf2_v4l2 videobuf2_common videodev fc0012 rtl2832 i2c_mux dvb_u=
sb_rtl28xxu dvb_usb_v2 dvb_core mc snd_emu10k1_synth snd_emux_synth snd_seq=
_midi_emul snd_seq_virmidi radeon(+) snd_seq_midi snd_seq_midi_event snd_se=
q snd_emu10k1 drm_ttm_helper ttm snd_hda_codec_hdmi drm_suballoc_helper snd=
_hda_intel snd_util_mem drm_display_helper snd_ac97_codec snd_intel_dspcfg =
snd_hda_codec snd_hda_core ac97_bus snd_hwdep snd_rawmidi snd_seq_device sn=
d_pcm drm_kms_helper snd_timer edac_mce_amd k10temp sha512_ssse3 sha512_gen=
eric sha256_ssse3 sha1_ssse3 drm aesni_intel snd gf128mul at24 crypto_simd =
cryptd soundcore acpi_cpufreq regmap_i2c emu10k1_gp gameport pcspkr evdev s=
erio_raw i2c_algo_bit video sp5100_tco wmi button ext4 crc32c_generic crc16=
 mbcache jbd2 hid_generic usbhid hid sg sr_mod cdrom sd_mod ata_generic crc=
32_pclmul firewire_ohci crc32c_intel firewire_core ahci i2c_piix4 crc_itu_t=
 pata_atiixp i2c_smbus r8169 libahci ohci_pci xhci_pci libata
[   15.672761]  realtek ohci_hcd ehci_pci xhci_hcd ehci_hcd mdio_devres scs=
i_mod scsi_common libphy usbcore usb_common
[   15.672773] CR2: 0000000000000050
[   15.672776] ---[ end trace 0000000000000000 ]---
