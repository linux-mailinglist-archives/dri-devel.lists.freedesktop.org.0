Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76121984F70
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 02:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524D610E920;
	Wed, 25 Sep 2024 00:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=internode.on.net header.i=@internode.on.net header.b="IbKFpcLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omr002.pc5.atmailcloud.com (omr002.pc5.atmailcloud.com
 [103.150.252.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB94410E920;
 Wed, 25 Sep 2024 00:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
 content-type; bh=VO+pqWj1yIOcgZrNglPcMFYl+7rjqsSaJWWxgX9+s1I=; b=IbKFpcLFCqe3
 1GkQoNAmvochWFH3S779x5Dgyaaj2L14KJIe63zzF4xX0hkx7dD9Z0tRMiHR7egxpLUd5iR3sTfiQ
 94eybGtwbUfgSp4rthoFuE6l3Lkmn+YTySxEO2EpBkHtA0tMI5iEJChQU5CmbnwYfeyS+3IfUWXu+
 tNx5qox4nr4jSJB917PFIdKyG+2abs3qKjZb6MNsl0hY+hg1GvVV8op/IeDS5NO8vq93idqJ5WY7o
 96B3Ed+F+MjwB7vAQM+N1vIDaWKPHTTgzsz54vP85A7rThkdwHXRiHq/DDuTSdWIiE1v9rEP5Agc/
 yRpGdpDhQ1Xo9iNfF77Ixg==;
Received: from CMR-KAKADU01.i-02175a00542f9bb7e
 by OMR.i-06efc5390fb1e2455 with esmtps
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1stFnF-000000001LH-3zIl; Wed, 25 Sep 2024 00:22:09 +0000
Received: from [118.210.167.213] (helo=localhost)
 by CMR-KAKADU01.i-02175a00542f9bb7e with esmtpsa
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1stFnF-000000001WC-0xQ7; Wed, 25 Sep 2024 00:22:09 +0000
Received: from amarsh04 by localhost with local (Exim 4.98)
 (envelope-from <arthur.marsh@internode.on.net>)
 id 1stFnB-0000000013i-2r9I; Wed, 25 Sep 2024 09:52:05 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: alexdeucher@gmail.com
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, arthur.marsh@internode.on.net,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 wuhoipok@gmail.com, x86@kernel.org
Subject: NULL pointer dereference after ib test on ring 7 succeeded
Date: Wed, 25 Sep 2024 09:52:04 +0930
Message-ID: <20240925002205.4065-1-user@am64>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CADnq5_OtdUvOUPpq1aUoxtgpt6a4h598019SNhe+9ZWUaANYqg@mail.gmail.com>
References: <CADnq5_OtdUvOUPpq1aUoxtgpt6a4h598019SNhe+9ZWUaANYqg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=A4dqPbWG c=1 sm=1 tr=0 ts=66f357b1
 a=Kh1sbcNhzywcxpuRN39Emg==:117 a=Kh1sbcNhzywcxpuRN39Emg==:17
 a=EaEq8P2WXUwA:10 a=x7bEGLp0ZPQA:10 a=-3lUenqOrSg5RfNWSYcA:9
X-Cm-Envelope: MS4xfETnA6LXsDoIbHo78TzFnuLKdTbuh6Xc81j3uKGCfrG+02BZA76KXSzIgCsUX8DRfw2SxVgzHNbtz7GWtsVJcLgIxgPxKnk8frFYdV5liTMecmR9J7tN
 airCbemFwH3XFB5XOQha/VWWEu2R/lcwZw7ASx5Ua4HSBkxt7lOx2esCacjsRflwPoGIn/hcu2nrjvHlgjSQ7SenLIwKOn8QRtY=
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

After rebuilding current Linus git head with:

dma-mapping: report unlimited DMA addressing in IOMMU DMA path
b348b6d17fd1d5d89b86db602f02bea54a754bd8

applied, the radeon module load gets further before hitting another
NULL pointer dereference:

[   17.777472] [drm] radeon kernel modesetting enabled.
[   17.777536] radeon 0000:00:01.0: vgaarb: deactivate vga console
[   17.778276] Console: switching to colour dummy device 80x25
[   17.778519] [drm] initializing kernel modesetting (ARUBA 0x1002:0x990C 0=
x1002:0x0123 0x00).
[   17.778600] ATOM BIOS: 113
[   17.778658] radeon 0000:00:01.0: VRAM: 768M 0x0000000000000000 - 0x00000=
0002FFFFFFF (768M used)
[   17.778661] radeon 0000:00:01.0: GTT: 1024M 0x0000000030000000 - 0x00000=
0006FFFFFFF
[   17.778665] [drm] Detected VRAM RAM=3D768M, BAR=3D256M
[   17.778665] [drm] RAM width 64bits DDR
[   17.778764] [drm] radeon: 768M of VRAM memory ready
[   17.778766] [drm] radeon: 1024M of GTT memory ready.
[   17.778777] [drm] Loading ARUBA Microcode
[   18.038084] [drm] Internal thermal controller without fan control
[   18.038425] [drm] radeon: dpm initialized
[   18.333508] [drm] Found VCE firmware/feedback version 50.0.1 / 17!
[   18.333548] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   18.353624] [drm] PCIE GART of 1024M enabled (table at 0x00000000001D600=
0).
[   18.353755] radeon 0000:00:01.0: WB enabled
[   18.353758] radeon 0000:00:01.0: fence driver on ring 0 use gpu addr 0x0=
000000030000c00
[   18.354136] radeon 0000:00:01.0: fence driver on ring 5 use gpu addr 0x0=
000000000075a18
[   18.374206] radeon 0000:00:01.0: fence driver on ring 6 use gpu addr 0x0=
000000030000c18
[   18.374208] radeon 0000:00:01.0: fence driver on ring 7 use gpu addr 0x0=
000000030000c1c
[   18.374210] radeon 0000:00:01.0: fence driver on ring 1 use gpu addr 0x0=
000000030000c04
[   18.374212] radeon 0000:00:01.0: fence driver on ring 2 use gpu addr 0x0=
000000030000c08
[   18.374213] radeon 0000:00:01.0: fence driver on ring 3 use gpu addr 0x0=
000000030000c0c
[   18.374214] radeon 0000:00:01.0: fence driver on ring 4 use gpu addr 0x0=
000000030000c10
[   18.374469] radeon 0000:00:01.0: radeon: MSI limited to 32-bit
[   18.374525] radeon 0000:00:01.0: radeon: using MSI.
[   18.374604] [drm] radeon: irq initialized.
[   18.392823] [drm] ring test on 0 succeeded in 3 usecs
[   18.392831] [drm] ring test on 3 succeeded in 4 usecs
[   18.392836] [drm] ring test on 4 succeeded in 3 usecs
[   18.438526] [drm] ring test on 5 succeeded in 2 usecs
[   18.458380] [drm] UVD initialized successfully.
[   18.567616] [drm] ring test on 6 succeeded in 18 usecs
[   18.567626] [drm] ring test on 7 succeeded in 3 usecs
[   18.567627] [drm] VCE initialized successfully.
[   18.567686] snd_hda_intel 0000:00:01.1: bound 0000:00:01.0 (ops radeon_a=
udio_component_bind_ops [radeon])
[   18.567925] [drm] ib test on ring 0 succeeded in 0 usecs
[   18.567968] [drm] ib test on ring 3 succeeded in 0 usecs
[   18.568008] [drm] ib test on ring 4 succeeded in 0 usecs
[   19.094527] [drm] ib test on ring 5 succeeded
[   19.257713] mc: Linux media interface: v0.10
[   19.638235] [drm] ib test on ring 6 succeeded
[   20.017069] usb 1-3: dvb_usb_v2: found a 'Realtek RTL2832U reference des=
ign' in warm state
[   20.048473] usb 1-3: dvb_usb_v2: will pass the complete MPEG2 transport =
stream to the software demuxer
[   20.048493] dvbdev: DVB: registering new adapter (Realtek RTL2832U refer=
ence design)
[   20.048497] usb 1-3: media controller created
[   20.049487] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' re=
gistered.
[   20.150361] [drm] ib test on ring 7 succeeded
[   20.150700] BUG: kernel NULL pointer dereference, address: 0000000000000=
050
[   20.150702] #PF: supervisor read access in kernel mode
[   20.150704] #PF: error_code(0x0000) - not-present page
[   20.150705] PGD 0 P4D 0=20
[   20.150707] Oops: Oops: 0000 [#1] PREEMPT_RT SMP NOPTI
[   20.150710] CPU: 0 UID: 0 PID: 446 Comm: udevd Not tainted 6.11.0+ #6122
[   20.150713] Hardware name: Gigabyte Technology Co., Ltd. To be filled by=
 O.E.M./F2A78M-HD2, BIOS F2 05/28/2014
[   20.150714] RIP: 0010:drm_dp_aux_register+0x59/0x110 [drm_display_helper]
[   20.150732] Code: a1 c0 48 85 f6 48 89 83 b8 00 00 00 74 1c 48 8d bb b4 =
03 00 00 ba 30 00 00 00 e8 52 e5 60 db 48 8d 7b 08 5b 5d e9 b7 ea 37 db <48=
> 8b 70 50 48 85 f6 75 db 48 8b 30 eb d6 48 8d ab 88 04 00 00 48
[   20.150734] RSP: 0018:ffff9eb8013cb960 EFLAGS: 00010246
[   20.150736] RAX: 0000000000000000 RBX: ffff8f1983bfc508 RCX: ffffffffc0b=
d1bc0
[   20.150737] RDX: ffffffffc0a1de40 RSI: 0000000000000000 RDI: ffff8f1983b=
fc9f0
[   20.150738] RBP: ffff8f1983bfc9f0 R08: ffff8f199ca70008 R09: 00000000c0c=
0c0c0
[   20.150739] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8f199da=
9af50
[   20.150740] R13: ffff8f199da9b092 R14: ffff8f199da9af2e R15: 00000000000=
00018
[   20.150741] FS:  00007ff9b9e6a840(0000) GS:ffff8f1caf800000(0000) knlGS:=
0000000000000000
[   20.150743] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   20.150744] CR2: 0000000000000050 CR3: 00000001033e4000 CR4: 00000000000=
406f0
[   20.150745] Call Trace:
[   20.150747]  <TASK>
[   20.150748]  ? __die_body.cold+0x19/0x1e
[   20.150753]  ? page_fault_oops+0xa8/0x230
[   20.150757]  ? drm_dp_aux_register+0x59/0x110 [drm_display_helper]
[   20.150767]  ? search_module_extables+0x4f/0x90
[   20.150771]  ? fixup_exception+0x36/0x2f0
[   20.150773]  ? exc_page_fault+0x88/0x1b0
[   20.150776]  ? asm_exc_page_fault+0x22/0x30
[   20.150779]  ? __pfx_radeon_dp_aux_transfer_atom+0x10/0x10 [radeon]
[   20.150888]  ? drm_dp_aux_register+0x59/0x110 [drm_display_helper]
[   20.150900]  radeon_dp_aux_init+0x91/0xc0 [radeon]
[   20.150984]  radeon_get_atom_connector_info_from_object_table+0x58e/0x88=
0 [radeon]
[   20.151047]  ? radeon_get_atom_connector_info_from_supported_devices_tab=
le+0x5cf/0x600 [radeon]
[   20.151111]  ? kstrdup+0x4c/0x70
[   20.151115]  ? __kmalloc_noprof+0x24d/0x340
[   20.151118]  radeon_modeset_init+0x375/0x470 [radeon]
[   20.151187]  ? radeon_device_init+0x667/0xb40 [radeon]
[   20.151250]  radeon_driver_load_kms+0xc2/0x260 [radeon]
[   20.151312]  radeon_pci_probe+0xff/0x170 [radeon]
[   20.151374]  pci_device_probe+0xbe/0x1a0
[   20.151377]  really_probe+0xde/0x350
[   20.151380]  ? pm_runtime_barrier+0x61/0xb0
[   20.151383]  ? __pfx___driver_attach+0x10/0x10
[   20.151386]  __driver_probe_device+0x78/0x110
[   20.151388]  driver_probe_device+0x2d/0xc0
[   20.151390]  __driver_attach+0xc9/0x1c0
[   20.151393]  bus_for_each_dev+0x6a/0xb0
[   20.151395]  ? migrate_enable+0xbf/0xf0
[   20.151397]  bus_add_driver+0x139/0x220
[   20.151400]  driver_register+0x6e/0xc0
[   20.151402]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   20.151463]  do_one_initcall+0x42/0x210
[   20.151467]  ? __kmalloc_cache_noprof+0x89/0x230
[   20.151469]  do_init_module+0x60/0x210
[   20.151472]  init_module_from_file+0x89/0xc0
[   20.151475]  __x64_sys_finit_module+0x142/0x390
[   20.151477]  do_syscall_64+0x47/0x110
[   20.151480]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   20.151483] RIP: 0033:0x7ff9b9d82279
[   20.151485] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 77 6b 0d 00 f7 d8 64 89 01 48
[   20.151486] RSP: 002b:00007fffc5f84708 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   20.151488] RAX: ffffffffffffffda RBX: 000055d02068d9b0 RCX: 00007ff9b9d=
82279
[   20.151489] RDX: 0000000000000000 RSI: 000055d0206807f0 RDI: 00000000000=
00012
[   20.151490] RBP: 0000000000000000 R08: 0000000000000001 R09: 000055d0206=
6d540
[   20.151491] R10: 0000000000000040 R11: 0000000000000246 R12: 000055d0206=
807f0
[   20.151492] R13: 0000000000020000 R14: 000055d02067e510 R15: 00000000000=
00000
[   20.151494]  </TASK>
[   20.151494] Modules linked in: i2c_mux dvb_usb_rtl28xxu(+) dvb_usb_v2 dv=
b_core mc snd_emu10k1_synth radeon(+) snd_emux_synth snd_seq_midi_emul snd_=
seq_virmidi drm_ttm_helper snd_seq_midi snd_seq_midi_event ttm snd_seq edac=
_mce_amd snd_hda_codec_hdmi sha512_ssse3 sha512_generic sha256_ssse3 sha1_s=
sse3 snd_emu10k1 aesni_intel drm_suballoc_helper snd_hda_intel drm_display_=
helper snd_intel_dspcfg snd_hda_codec snd_util_mem gf128mul snd_ac97_codec =
snd_hda_core drm_kms_helper crypto_simd cryptd ac97_bus snd_rawmidi k10temp=
 snd_seq_device snd_hwdep snd_pcm drm acpi_cpufreq evdev serio_raw pcspkr a=
t24 emu10k1_gp gameport regmap_i2c i2c_algo_bit snd_timer video snd sp5100_=
tco soundcore wmi button ext4 crc32c_generic crc16 mbcache jbd2 uas usb_sto=
rage hid_generic usbhid hid sg sr_mod cdrom sd_mod ata_generic firewire_ohc=
i crc32_pclmul crc32c_intel ahci i2c_piix4 firewire_core crc_itu_t pata_ati=
ixp libahci i2c_smbus ohci_pci xhci_pci libata xhci_hcd ehci_pci ohci_hcd r=
8169 ehci_hcd realtek scsi_mod mdio_devres usbcore
[   20.151550]  scsi_common libphy usb_common
[   20.151553] CR2: 0000000000000050
[   20.151555] ---[ end trace 0000000000000000 ]---

Regards,

Arthur.
