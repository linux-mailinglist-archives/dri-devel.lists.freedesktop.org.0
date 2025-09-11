Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C6B529E7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AD610E309;
	Thu, 11 Sep 2025 07:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=duck.com header.i=@duck.com header.b="FiAEgs8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Thu, 11 Sep 2025 00:57:45 UTC
Received: from smtp-outbound3.duck.com (smtp-outbound3.duck.com [20.67.221.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B48A10E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 00:57:45 +0000 (UTC)
MIME-Version: 1.0
Subject: linux 6.12, 6.16: Running Flatpaks causes kernel oops in nouveau
 module
Content-Language: en-US
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: -
X-Rspamd-Report: DMARC_POLICY_ALLOW(-0.5) R_DKIM_ALLOW(-0.2) MIME_GOOD(-0.1)
 R_SPF_ALLOW(-0.2)
X-Rspamd-Score: -1
X-Rspamd-Action: no action
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Received: by smtp-inbound1.duck.com; Wed, 10 Sep 2025 20:57:43 -0400
Message-ID: <E79B534D-6630-4AF3-950D-2391CDABCE16.1@smtp-inbound1.duck.com>
Date: Wed, 10 Sep 2025 20:57:43 -0400
From: willed-anvil-elude@duck.com
Feedback-ID: :isSendReply:isDirect:duckcom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duck.com;
 h=Feedback-ID: From: Date: Message-ID: To: Content-Transfer-Encoding:
 Content-Type: Content-Language: Subject: MIME-Version; q=dns/txt;
 s=postal-KpyQVw; t=1757552264;
 bh=Yd2EvA3RHunWdAcXJJQqiQ+anEBWDWxT2KWJ7yzOkyk=;
 b=FiAEgs8l3RacOC1XPCv+YMa+CF/8ZcyXO1sKZn9xWgpHS34sHVUQ9TbA+E3RP4CL2l9wXc4R7
 2jwxC66VNROT4oa7IvVr9IaTnLXN8PsYuLu+zj5xglsVSyqY60RlnFf8uo9OLvEoUG0o5WBEOpW
 6L28mu7ECnbzRsZZLeEZhz8=
X-Mailman-Approved-At: Thu, 11 Sep 2025 07:28:36 +0000
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

Dear Maintainers,

Flatpak apps have suddenly broken on my Debian Stable ("Trixie") installation.
They were working normally until I ran a `flatpak update` last week after
several weeks without updating the Flatpak system, but now the apps fail to
launch. I have confirmed that the base OS runs fine until the first time I
launch a Flatpak app, at which point it causes a kernel oops in the `nouveau`
module.

When I boot with the kernel command line `module_blacklist=nouveau` this bug
does **not** happen.

I tried completely uninstalling and reinstalling all Flatpak-related Debian
packages, and I renamed `~/.local/share/flatpak` and `/var/lib/flatpak` and
tried starting fresh with Flatpak, but it made no difference.

My hardware is a laptop with hybrid Intel / Nvidia graphics, but I don't use
the Nvidia card at all. I even tried uninstalling the `xserver-xorg-video-
nouveau` package, but somehow the `nouveau` module was still getting loaded.

This bug happens with the oldest Debian Trixie released
kernel version (6.12.31-amd64) as well as the latest one (6.12.41+deb13-amd64),
as well as with the latest kernel in Debian Unstable (6.16.5+deb14-amd64).
What changed on my system leading to this bug was the Flatpak framework
updates, however in my bug report to them
(https://github.com/flatpak/flatpak/issues/6307) they say it's a kernel bug.
This is the Debian bug report where the Debian kernel maintainer suggested that
I contact you all: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1113861

Here's the `dmesg` output that corresponds exactly to the moment that a Flatpak
app is launched:

```````````````````````````````````````````
[Tue Sep  2 23:31:49 2025] BUG: kernel NULL pointer dereference, address:
0000000000000000
[Tue Sep  2 23:31:49 2025] #PF: supervisor read access in kernel mode
[Tue Sep  2 23:31:49 2025] #PF: error_code(0x0000) - not-present page
[Tue Sep  2 23:31:49 2025] PGD 0 P4D 0
[Tue Sep  2 23:31:49 2025] Oops: Oops: 0000 [#3] PREEMPT SMP PTI
[Tue Sep  2 23:31:49 2025] CPU: 6 UID: 1000 PID: 4820 Comm: com.github.tchx
Tainted: G      D            6.12.31-amd64 #1  Debian 6.12.31-1
[Tue Sep  2 23:31:49 2025] Tainted: [D]=DIE
[Tue Sep  2 23:31:49 2025] Hardware name: Intel(R) Client Systems
LAPQC71A/LAPQC71A, BIOS QCCFL357.0144.2022.0124.1433 01/24/2022
[Tue Sep  2 23:31:49 2025] RIP: 0010:nvkm_gr_units+0x9/0x30 [nouveau]
[Tue Sep  2 23:31:49 2025] Code: 74 06 ff e0 cc 66 90 cc 31 c0 c3 cc cc cc cc
66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00
00 <48> 8b 07 48 8b 40 58 48 85 c0 74 06 ff e0 cc 66 90 cc 31 c0 c3 cc
[Tue Sep  2 23:31:49 2025] RSP: 0018:ffffa1f38f267b40 EFLAGS: 00010246
[Tue Sep  2 23:31:49 2025] RAX: ffff92a3ba38e000 RBX: ffffa1f38f267c20 RCX:
ffff92a3871f2800
[Tue Sep  2 23:31:49 2025] RDX: ffff92a599362c00 RSI: ffffa1f38f267c20 RDI:
0000000000000000
[Tue Sep  2 23:31:49 2025] RBP: ffff92a4ab71d000 R08: 000000000000000d R09:
00000000000012d4
[Tue Sep  2 23:31:49 2025] R10: 0000000000000010 R11: 0000000000000012 R12:
ffffffffc0bb61f0
[Tue Sep  2 23:31:49 2025] R13: ffffa1f38f267c20 R14: ffff92a3ba386000 R15:
0000000000000010
[Tue Sep  2 23:31:49 2025] FS:  00007fe43b074940(0000)
GS:ffff92ab1db00000(0000) knlGS:0000000000000000
[Tue Sep  2 23:31:49 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Tue Sep  2 23:31:49 2025] CR2: 0000000000000000 CR3: 000000030ae00001 CR4:
00000000003726f0
[Tue Sep  2 23:31:49 2025] Call Trace:
[Tue Sep  2 23:31:49 2025]  <TASK>
[Tue Sep  2 23:31:49 2025]  nouveau_abi16_ioctl_getparam+0x2aa/0x350 [nouveau]
[Tue Sep  2 23:31:49 2025]  ? tomoyo_init_request_info+0x99/0xc0
[Tue Sep  2 23:31:49 2025]  drm_ioctl_kernel+0xad/0x100 [drm]
[Tue Sep  2 23:31:49 2025]  drm_ioctl+0x277/0x4f0 [drm]
[Tue Sep  2 23:31:49 2025]  ? __pfx_nouveau_abi16_ioctl_getparam+0x10/0x10
[nouveau]
[Tue Sep  2 23:31:49 2025]  nouveau_drm_ioctl+0x57/0xb0 [nouveau]
[Tue Sep  2 23:31:49 2025]  __x64_sys_ioctl+0x91/0xd0
[Tue Sep  2 23:31:49 2025]  do_syscall_64+0x82/0x190
[Tue Sep  2 23:31:49 2025]  ? __pfx_nouveau_abi16_ioctl_getparam+0x10/0x10
[nouveau]
[Tue Sep  2 23:31:49 2025]  ? __pm_runtime_suspend+0x69/0xc0
[Tue Sep  2 23:31:49 2025]  ? nouveau_drm_ioctl+0x7a/0xb0 [nouveau]
[Tue Sep  2 23:31:49 2025]  ? syscall_exit_to_user_mode+0x4d/0x210
[Tue Sep  2 23:31:49 2025]  ? do_syscall_64+0x8e/0x190
[Tue Sep  2 23:31:49 2025]  ? syscall_exit_to_user_mode+0x4d/0x210
[Tue Sep  2 23:31:49 2025]  ? do_syscall_64+0x8e/0x190
[Tue Sep  2 23:31:49 2025]  ? exc_page_fault+0x7e/0x180
[Tue Sep  2 23:31:49 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Sep  2 23:31:49 2025] RIP: 0033:0x7fe43d11988d
[Tue Sep  2 23:31:49 2025] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45
10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f
05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[Tue Sep  2 23:31:49 2025] RSP: 002b:00007fff980905a0 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Tue Sep  2 23:31:49 2025] RAX: ffffffffffffffda RBX: 00005630873e6e90 RCX:
00007fe43d11988d
[Tue Sep  2 23:31:49 2025] RDX: 00007fff98090660 RSI: 00000000c0106440 RDI:
0000000000000012
[Tue Sep  2 23:31:49 2025] RBP: 00007fff980905f0 R08: 0000000000002191 R09:
000017aa381e0000
[Tue Sep  2 23:31:49 2025] R10: 00007fe3bff088c0 R11: 0000000000000246 R12:
00007fff98090660
[Tue Sep  2 23:31:49 2025] R13: 00000000c0106440 R14: 0000000000000012 R15:
0000563087434560
[Tue Sep  2 23:31:49 2025]  </TASK>
[Tue Sep  2 23:31:49 2025] Modules linked in: uinput ccm snd_seq_dummy
snd_hrtimer snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device
rfcomm cmac algif_hash algif_skcipher af_alg bnep zram lz4hc_compress
lz4_compress binfmt_misc btusb btrtl uvcvideo btintel btbcm videobuf2_vmalloc
btmtk uvc videobuf2_memops videobuf2_v4l2 bluetooth videodev videobuf2_common
mc sg crc16 nls_ascii nls_cp437 vfat fat snd_sof_pci_intel_cnl
snd_sof_intel_hda_generic soundwire_intel soundwire_generic_allocation
soundwire_cadence snd_sof_intel_hda_common snd_soc_hdac_hda
snd_sof_intel_hda_mlink intel_rapl_msr snd_sof_intel_hda intel_rapl_common
snd_sof_pci intel_uncore_frequency snd_sof_xtensa_dsp
intel_uncore_frequency_common iwlmvm snd_sof snd_sof_utils
snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus mac80211 snd_soc_avs
snd_hda_codec_realtek x86_pkg_temp_thermal snd_soc_hda_codec intel_powerclamp
snd_hda_ext_core coretemp snd_hda_codec_generic snd_soc_core
snd_hda_scodec_component kvm_intel snd_hda_codec_hdmi snd_compress
[Tue Sep  2 23:31:49 2025]  snd_pcm_dmaengine snd_hda_intel libarc4
snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec kvm iwlwifi snd_hda_core
snd_hwdep snd_pcm_oss irqbypass snd_mixer_oss cfg80211 mei_hdcp mei_pxp rapl
snd_pcm asus_wmi sparse_keymap intel_cstate platform_profile intel_uncore
snd_timer mei_me intel_wmi_thunderbolt ee1004 snd rfkill mei wmi_bmof soundcore
intel_pch_thermal intel_pmc_core intel_vsec pmt_telemetry acpi_pad pmt_class ac
acpi_tad joydev evdev msr parport_pc dm_mod ppdev lp parport efi_pstore
configfs nfnetlink efivarfs ip_tables x_tables autofs4 btrfs blake2b_generic
xor sd_mod raid6_pq libcrc32c crc32c_generic uas usb_storage usbhid i915
nouveau drm_gpuvm drm_exec gpu_sched drm_buddy i2c_algo_bit drm_display_helper
cec hid_multitouch rc_core drm_ttm_helper hid_generic crct10dif_pclmul
crc32_pclmul ttm crc32c_intel i2c_hid_acpi ghash_clmulni_intel ahci iTCO_wdt
i2c_hid sha512_ssse3 xhci_pci intel_pmc_bxt drm_kms_helper hid libahci xhci_hcd
sha256_ssse3 iTCO_vendor_support nvme libata watchdog sha1_ssse3
[Tue Sep  2 23:31:49 2025]  r8169 drm nvme_core usbcore aesni_intel realtek
thunderbolt mxm_wmi i2c_i801 intel_lpss_pci gf128mul mdio_devres scsi_mod
crypto_simd libphy cryptd serio_raw i2c_smbus intel_lpss nvme_auth idma64
usb_common scsi_common battery video wmi button
[Tue Sep  2 23:31:49 2025] CR2: 0000000000000000
[Tue Sep  2 23:31:49 2025] ---[ end trace 0000000000000000 ]---
[Tue Sep  2 23:31:49 2025] RIP: 0010:nvkm_gr_units+0x9/0x30 [nouveau]
[Tue Sep  2 23:31:49 2025] Code: 74 06 ff e0 cc 66 90 cc 31 c0 c3 cc cc cc cc
66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00
00 <48> 8b 07 48 8b 40 58 48 85 c0 74 06 ff e0 cc 66 90 cc 31 c0 c3 cc
[Tue Sep  2 23:31:49 2025] RSP: 0018:ffffa1f38e783b70 EFLAGS: 00010246
[Tue Sep  2 23:31:49 2025] RAX: ffff92a3ba38e000 RBX: ffffa1f38e783c50 RCX:
ffff92a3871f2800
[Tue Sep  2 23:31:49 2025] RDX: ffff92a38a102400 RSI: ffffa1f38e783c50 RDI:
0000000000000000
[Tue Sep  2 23:31:49 2025] RBP: ffff92a432853200 R08: 000000000000000d R09:
0000000000000b38
[Tue Sep  2 23:31:49 2025] R10: 0000000000000010 R11: 000000000000001a R12:
ffffffffc0bb61f0
[Tue Sep  2 23:31:49 2025] R13: ffffa1f38e783c50 R14: ffff92a3ba386000 R15:
0000000000000010
[Tue Sep  2 23:31:49 2025] FS:  00007fe43b074940(0000)
GS:ffff92ab1db00000(0000) knlGS:0000000000000000
[Tue Sep  2 23:31:49 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Tue Sep  2 23:31:49 2025] CR2: 0000000000000000 CR3: 000000030ae00001 CR4:
00000000003726f0
[Tue Sep  2 23:31:49 2025] note: com.github.tchx[4820] exited with irqs
disabled
```````````````````````````````````````````


-- Package-specific info:
** Version:
Linux version 6.12.41+deb13-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.12.41-1 (2025-08-12)

** Command line:
BOOT_IMAGE=/@/boot/vmlinuz-6.12.41+deb13-amd64 root=UUID=9b7ad72a-c27f-41d3-8845-cd4b23197f2b ro rootflags=subvol=@ quiet loglevel=0 splash threadirqs

** Tainted: OE (12288)
  * externally-built ("out-of-tree") module was loaded
  * unsigned module was loaded

** Kernel log:
Unable to read kernel log; any relevant messages should be attached

** Model information
sys_vendor: Intel(R) Client Systems
product_name: LAPQC71A
product_version: K63034-303
chassis_vendor: Intel Corporation
chassis_version: 1.0
bios_vendor: Intel Corp.
bios_version: QCCFL357.0144.2022.0124.1433
board_vendor: Intel Corporation
board_name: LAPQC71A
board_version: K54899-303

** Configuration for modprobe:
blacklist microcode
blacklist pcspkr
blacklist b43
blacklist b43legacy
blacklist b44
blacklist bcma
blacklist brcm80211
blacklist brcmsmac
blacklist ssb
blacklist arkfb
blacklist aty128fb
blacklist atyfb
blacklist radeonfb
blacklist cirrusfb
blacklist cyber2000fb
blacklist kyrofb
blacklist matroxfb_base
blacklist mb862xxfb
blacklist neofb
blacklist pm2fb
blacklist pm3fb
blacklist s3fb
blacklist savagefb
blacklist sisfb
blacklist tdfxfb
blacklist tridentfb
blacklist vt8623fb
blacklist microcode
options snd_pcsp index=-2
options cx88_alsa index=-2
options snd_atiixp_modem index=-2
options snd_intel8x0m index=-2
options snd_via82xx_modem index=-2
options ath9k_htc use_dev_fw=1
options bonding max_bonds=0
options dummy numdummies=0
options ifb numifbs=0

** Loaded modules:
snd_seq_dummy
snd_hrtimer
snd_seq_midi
snd_seq_midi_event
snd_rawmidi
snd_seq
ccm
snd_seq_device
snd_sof_pci_intel_cnl
snd_sof_intel_hda_generic
soundwire_intel
soundwire_generic_allocation
soundwire_cadence
snd_sof_intel_hda_common
snd_soc_hdac_hda
snd_sof_intel_hda_mlink
snd_sof_intel_hda
snd_sof_pci
snd_sof_xtensa_dsp
snd_sof
snd_sof_utils
snd_soc_acpi_intel_match
snd_soc_acpi
soundwire_bus
snd_soc_avs
snd_soc_hda_codec
snd_hda_ext_core
snd_soc_core
snd_compress
snd_pcm_dmaengine
rfcomm
cmac
algif_hash
algif_skcipher
af_alg
bnep
btusb
btrtl
btintel
btbcm
zram
btmtk
lz4hc_compress
uvcvideo
lz4_compress
bluetooth
videobuf2_vmalloc
uvc
videobuf2_memops
videobuf2_v4l2
videobuf2_common
sg
crc16
binfmt_misc
nls_ascii
nls_cp437
vfat
fat
intel_rapl_msr
intel_rapl_common
iwlmvm
intel_uncore_frequency
intel_uncore_frequency_common
mac80211
snd_hda_codec_hdmi
snd_hda_codec_realtek
x86_pkg_temp_thermal
snd_hda_codec_generic
intel_powerclamp
coretemp
snd_hda_scodec_component
libarc4
kvm_intel
snd_hda_intel
snd_intel_dspcfg
snd_intel_sdw_acpi
iwlwifi
snd_hda_codec
kvm
snd_hda_core
mei_hdcp
mei_pxp
snd_hwdep
cfg80211
snd_pcm_oss
irqbypass
snd_mixer_oss
rapl
asus_wmi
snd_pcm
qc71_laptop(OE)
platform_profile
intel_cstate
sparse_keymap
ee1004
snd_timer
mei_me
intel_uncore
snd
intel_wmi_thunderbolt
wmi_bmof
mei
rfkill
soundcore
intel_pch_thermal
intel_pmc_core
joydev
intel_vsec
acpi_tad
acpi_pad
ac
pmt_telemetry
pmt_class
evdev
v4l2loopback(OE)
videodev
mc
msr
dm_mod
parport_pc
ppdev
lp
parport
configfs
efi_pstore
nfnetlink
efivarfs
ip_tables
x_tables
autofs4
btrfs
blake2b_generic
xor
raid6_pq
libcrc32c
crc32c_generic
sd_mod
uas
usb_storage
usbhid
i915
drm_gpuvm
drm_exec
gpu_sched
drm_buddy
i2c_algo_bit
drm_display_helper
crct10dif_pclmul
cec
crc32_pclmul
hid_multitouch
crc32c_intel
rc_core
ghash_clmulni_intel
drm_ttm_helper
hid_generic
xhci_pci
xhci_hcd
ahci
iTCO_wdt
sha512_ssse3
i2c_hid_acpi
intel_pmc_bxt
ttm
libahci
sha256_ssse3
i2c_hid
iTCO_vendor_support
libata
drm_kms_helper
r8169
sha1_ssse3
hid
nvme
watchdog
usbcore
aesni_intel
realtek
intel_lpss_pci
scsi_mod
nvme_core
mxm_wmi
i2c_i801
intel_lpss
gf128mul
mdio_devres
drm
thunderbolt
crypto_simd
libphy
cryptd
serio_raw
i2c_smbus
nvme_auth
scsi_common
idma64
usb_common
battery
video
wmi
button

** PCI devices:
00:00.0 Host bridge [0600]: Intel Corporation 8th/9th Gen Core Processor Host Bridge / DRAM Registers [8086:3ec4] (rev 07)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 1
	Capabilities: <access denied>
	Kernel driver in use: skl_uncore

00:01.0 PCI bridge [0604]: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 07) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 122
	IOMMU group: 2
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: 5000-5fff [size=4K] [16-bit]
	Memory behind bridge: ac000000-ad0fffff [size=17M] [32-bit]
	Prefetchable memory behind bridge: 80000000-920fffff [size=289M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:02.0 VGA compatible controller [0300]: Intel Corporation CoffeeLake-H GT2 [UHD Graphics 630] [8086:3e9b] (prog-if 00 [VGA controller])
	DeviceName: Onboard - Video
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 175
	IOMMU group: 0
	Region 0: Memory at ab000000 (64-bit, non-prefetchable) [size=16M]
	Region 2: Memory at 40000000 (64-bit, prefetchable) [size=256M]
	Region 4: I/O ports at 6000 [size=64]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: i915
	Kernel modules: i915

00:12.0 Signal processing controller [1180]: Intel Corporation Cannon Lake PCH Thermal Controller [8086:a379] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 3
	Region 0: Memory at ade1f000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel_pch_thermal
	Kernel modules: intel_pch_thermal

00:14.0 USB controller [0c03]: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller [8086:a36d] (rev 10) (prog-if 30 [XHCI])
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 158
	IOMMU group: 4
	Region 0: Memory at ade00000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:14.2 RAM memory [0500]: Intel Corporation Cannon Lake PCH Shared SRAM [8086:a36f] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 4
	Region 0: Memory at ade16000 (64-bit, non-prefetchable) [disabled] [size=8K]
	Region 2: Memory at ade1e000 (64-bit, non-prefetchable) [disabled] [size=4K]
	Capabilities: <access denied>

00:15.0 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH Serial IO I2C Controller #0 [8086:a368] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 5
	Region 0: Memory at 72000000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:16.0 Communication controller [0780]: Intel Corporation Cannon Lake PCH HECI Controller [8086:a360] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 146
	IOMMU group: 6
	Region 0: Memory at ade1c000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:17.0 SATA controller [0106]: Intel Corporation Cannon Lake Mobile PCH SATA AHCI Controller [8086:a353] (rev 10) (prog-if 01 [AHCI 1.0])
	DeviceName: Onboard - SATA
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 157
	IOMMU group: 7
	Region 0: Memory at ade14000 (32-bit, non-prefetchable) [size=8K]
	Region 1: Memory at ade1b000 (32-bit, non-prefetchable) [size=256]
	Region 2: I/O ports at 6090 [size=8]
	Region 3: I/O ports at 6080 [size=4]
	Region 4: I/O ports at 6060 [size=32]
	Region 5: Memory at ade1a000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: <access denied>
	Kernel driver in use: ahci
	Kernel modules: ahci

00:1b.0 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #17 [8086:a340] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 123
	IOMMU group: 8
	Bus: primary=00, secondary=02, subordinate=3a, sec-latency=0
	I/O behind bridge: 7000-8fff [size=8K] [16-bit]
	Memory behind bridge: 94000000-aa0fffff [size=353M] [32-bit]
	Prefetchable memory behind bridge: 50000000-71ffffff [size=544M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1d.0 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #9 [8086:a330] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 124
	IOMMU group: 9
	Bus: primary=00, secondary=3b, subordinate=3b, sec-latency=0
	I/O behind bridge: 4000-4fff [size=4K] [16-bit]
	Memory behind bridge: ad200000-adbfffff [size=10M] [32-bit]
	Prefetchable memory behind bridge: 92200000-92bfffff [size=10M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1d.5 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #14 [8086:a335] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 125
	IOMMU group: 10
	Bus: primary=00, secondary=3c, subordinate=3c, sec-latency=0
	I/O behind bridge: 3000-3fff [size=4K] [16-bit]
	Memory behind bridge: add00000-addfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1d.6 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #15 [8086:a336] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 126
	IOMMU group: 11
	Bus: primary=00, secondary=3d, subordinate=3d, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: adc00000-adcfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1e.0 Communication controller [0780]: Intel Corporation Cannon Lake PCH Serial IO UART Host Controller [8086:a328] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 20
	IOMMU group: 12
	Region 0: Memory at 72001000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:1f.0 ISA bridge [0601]: Intel Corporation HM370 Chipset LPC/eSPI Controller [8086:a30d] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 13

00:1f.3 Audio device [0403]: Intel Corporation Cannon Lake PCH cAVS [8086:a348] (rev 10) (prog-if 80)
	DeviceName: Onboard - Sound
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 191
	IOMMU group: 13
	Region 0: Memory at ade10000 (64-bit, non-prefetchable) [size=16K]
	Region 4: Memory at ad100000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_cnl

00:1f.4 SMBus [0c05]: Intel Corporation Cannon Lake PCH SMBus Controller [8086:a323] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 13
	Region 0: Memory at ade18000 (64-bit, non-prefetchable) [size=256]
	Region 4: I/O ports at efa0 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI Controller [8086:a324] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 13
	Region 0: Memory at fe010000 (32-bit, non-prefetchable) [size=4K]

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation TU116M [GeForce GTX 1660 Ti Mobile] [10de:2191] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 255
	IOMMU group: 2
	Region 0: Memory at ac000000 (32-bit, non-prefetchable) [disabled] [size=16M]
	Region 1: Memory at 80000000 (64-bit, prefetchable) [disabled] [size=256M]
	Region 3: Memory at 90000000 (64-bit, prefetchable) [disabled] [size=32M]
	Region 5: I/O ports at 5000 [disabled] [size=128]
	Expansion ROM at ad000000 [disabled] [size=512K]
	Capabilities: <access denied>
	Kernel modules: nouveau

01:00.1 Audio device [0403]: NVIDIA Corporation TU116 High Definition Audio Controller [10de:1aeb] (rev a1)
	Subsystem: AIstone Global Limited Device [1d05:1072]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 17
	IOMMU group: 2
	Region 0: Memory at ad080000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

01:00.2 USB controller [0c03]: NVIDIA Corporation TU116 USB 3.1 Host Controller [10de:1aec] (rev a1) (prog-if 30 [XHCI])
	Subsystem: AIstone Global Limited Device [1d05:1072]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 166
	IOMMU group: 2
	Region 0: Memory at 92000000 (64-bit, prefetchable) [size=256K]
	Region 3: Memory at 92040000 (64-bit, prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU116 USB Type-C UCSI Controller [10de:1aed] (rev a1)
	Subsystem: AIstone Global Limited Device [1d05:1072]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin D routed to IRQ 255
	IOMMU group: 2
	Region 0: Memory at ad084000 (32-bit, non-prefetchable) [disabled] [size=4K]
	Capabilities: <access denied>

02:00.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 2C 2018] [8086:15e7] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Physical Slot: 20
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 14
	Bus: primary=02, secondary=03, subordinate=3a, sec-latency=0
	I/O behind bridge: 7000-7fff [size=4K] [16-bit]
	Memory behind bridge: 94000000-944fffff [size=5M] [32-bit]
	Prefetchable memory behind bridge: 50000000-502fffff [size=3M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

03:00.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 2C 2018] [8086:15e7] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 127
	IOMMU group: 15
	Bus: primary=03, secondary=04, subordinate=04, sec-latency=0
	I/O behind bridge: [disabled] [32-bit]
	Memory behind bridge: 94000000-940fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

03:01.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 2C 2018] [8086:15e7] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 128
	IOMMU group: 16
	Bus: primary=03, secondary=05, subordinate=39, sec-latency=0
	I/O behind bridge: 7000-7fff [size=4K] [16-bit]
	Memory behind bridge: 94100000-942fffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: 50000000-501fffff [size=2M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

03:02.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 2C 2018] [8086:15e7] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 129
	IOMMU group: 17
	Bus: primary=03, secondary=3a, subordinate=3a, sec-latency=0
	I/O behind bridge: [disabled] [32-bit]
	Memory behind bridge: 94300000-943fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

04:00.0 System peripheral [0880]: Intel Corporation JHL7540 Thunderbolt 3 NHI [Titan Ridge 2C 2018] [8086:15e8] (rev 06)
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 18
	Region 0: Memory at 94000000 (32-bit, non-prefetchable) [size=256K]
	Region 1: Memory at 94040000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt

3a:00.0 USB controller [0c03]: Intel Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 2C 2018] [8086:15e9] (rev 06) (prog-if 30 [XHCI])
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 167
	IOMMU group: 19
	Region 0: Memory at 94300000 (32-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

3b:00.0 Non-Volatile memory controller [0108]: Phison Electronics Corporation PS5013-E13 PCIe3 NVMe Controller (DRAM-less) [1987:5013] (rev 01) (prog-if 02 [NVM Express])
	Subsystem: Phison Electronics Corporation PS5013-E13 PCIe3 NVMe Controller (DRAM-less) [1987:5013]
	Physical Slot: 12
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 20
	Region 0: Memory at ad200000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: nvme
	Kernel modules: nvme

3c:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
	Subsystem: Intel Corporation Device [8086:2086]
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 17
	IOMMU group: 21
	Region 0: I/O ports at 3000 [size=256]
	Region 2: Memory at add04000 (64-bit, non-prefetchable) [size=4K]
	Region 4: Memory at add00000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: r8169
	Kernel modules: r8169

3d:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX200 [8086:2723] (rev 1a)
	Subsystem: Intel Corporation Wi-Fi 6 AX200NGW [8086:0084]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 18
	IOMMU group: 22
	Region 0: Memory at adc00000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: iwlwifi
	Kernel modules: iwlwifi


** USB devices:
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 048d:ce00 Integrated Technology Express, Inc. ITE Device(8291)
Bus 001 Device 003: ID 046d:c542 Logitech, Inc. M185 compact wireless mouse
Bus 001 Device 004: ID 04f2:b68b Chicony Electronics Co., Ltd HD Webcam
Bus 001 Device 005: ID 8087:0029 Intel Corp. AX200 Bluetooth
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 0bda:0316 Realtek Semiconductor Corp. Card Reader
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub


-- System Information:
Debian Release: 13.0
   APT prefers stable-updates
   APT policy: (500, 'stable-updates'), (500, 'stable-security'), (500, 'stable'), (100, 'trixie-fasttrack'), (100, 'trixie-backports-staging')
Architecture: amd64 (x86_64)
Foreign Architectures: i386

Kernel: Linux 6.12.41+deb13-amd64 (SMP w/12 CPU threads; PREEMPT)
Kernel taint flags: TAINT_OOT_MODULE, TAINT_UNSIGNED_MODULE
Locale: LANG=en_US.utf8, LC_CTYPE=en_US.utf8 (charmap=UTF-8), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: systemd (via /run/systemd/system)
LSM: AppArmor: enabled

Versions of packages linux-image-6.12.41+deb13-amd64 depends on:
ii  initramfs-tools [linux-initramfs-tool]  0.148.3
ii  kmod                                    34.2-2
ii  linux-base                              4.12

Versions of packages linux-image-6.12.41+deb13-amd64 recommends:
ii  apparmor  4.1.0-1

Versions of packages linux-image-6.12.41+deb13-amd64 suggests:
pn  debian-kernel-handbook               <none>
ii  firmware-linux-free                  20241210-2
pn  grub-pc | grub-efi-amd64 | extlinux  <none>
pn  linux-doc-6.12                       <none>

Versions of packages linux-image-6.12.41+deb13-amd64 is related to:
ii  firmware-amd-graphics      20250410-2
ii  firmware-atheros           20250410-2
ii  firmware-bnx2              20250410-2
ii  firmware-bnx2x             20250410-2
ii  firmware-brcm80211         20250410-2
ii  firmware-cavium            20250410-2
pn  firmware-cirrus            <none>
pn  firmware-intel-graphics    <none>
pn  firmware-intel-misc        <none>
ii  firmware-intel-sound       20250410-2
ii  firmware-ipw2x00           20250410-2
ii  firmware-ivtv              20250410-2
ii  firmware-iwlwifi           20250410-2
ii  firmware-libertas          20250410-2
pn  firmware-marvell-prestera  <none>
pn  firmware-mediatek          <none>
ii  firmware-misc-nonfree      20250410-2
ii  firmware-myricom           20250410-2
ii  firmware-netronome         20250410-2
ii  firmware-netxen            20250410-2
pn  firmware-nvidia-graphics   <none>
ii  firmware-qcom-soc          20250410-2
ii  firmware-qlogic            20250410-2
ii  firmware-realtek           20250410-2
ii  firmware-samsung           20250410-2
ii  firmware-siano             20250410-2
ii  firmware-ti-connectivity   20250410-2
pn  xen-hypervisor             <none>

-- no debconf information
