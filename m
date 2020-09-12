Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582C267922
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 11:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618516E118;
	Sat, 12 Sep 2020 09:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA756E118
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 09:27:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209225] [AMDGPU] oops each boot: dc_link_set_backlight_level
Date: Sat, 12 Sep 2020 09:27:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arthurborsboom@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209225-2300-RAHa2va0UB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209225-2300@https.bugzilla.kernel.org/>
References: <bug-209225-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209225

--- Comment #2 from Arthur Borsboom (arthurborsboom@gmail.com) ---
I found out that this oops is triggered by systemd-backlight, which is auto
enabled on boot. There is a way to disable this feature, by adding the
following kernel parameter:

systemd.restore_state=0

This prevents the oops, but creates another oops, see below.
Maybe this oops, is the reason why the backlight setting oopses.

Dmesg without the systemd-backlight call is attached.

[    4.694971] amdgpu 0000:07:00.0: amdgpu: SMU is initialized successfully!
[    4.696369] [drm] kiq ring mec 2 pipe 1 q 0
[    4.697106] ------------[ cut here ]------------
[    4.697329] WARNING: CPU: 10 PID: 398 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.c:716
rn_clk_mgr_construct+0x142/0x3f0 [amdgpu]
[    4.697330] Modules linked in: snd_pci_acp3x btusb btrtl btbcm btintel
bluetooth ecdh_generic iwlmvm ecc snd_hda_codec_realtek joydev amdgpu(+)
mousedev snd_hda_codec_generic mac80211 ledtrig_audio snd_hda_codec_hdmi
libarc4 snd_hda_intel edac_mce_amd gpu_sched snd_intel_dspcfg i2c_algo_bit
kvm_amd snd_hda_codec ttm hid_multitouch snd_hda_core r8169 hid_generic msi_wmi
iwlwifi sparse_keymap kvm drm_kms_helper snd_hwdep realtek snd_pcm cec
irqbypass mdio_devres rc_core of_mdio cfg80211 psmouse rapl snd_timer
input_leds fixed_phy syscopyarea pcspkr sp5100_tco snd sysfillrect libphy
tpm_crb sysimgblt rfkill k10temp i2c_piix4 uvcvideo ac wmi battery tpm_tis
soundcore fb_sys_fops tpm_tis_core videobuf2_vmalloc i2c_hid videobuf2_memops
tpm videobuf2_v4l2 hid pinctrl_amd videobuf2_common videodev soc_button_array
evdev mc acpi_cpufreq mac_hid drm sg dm_mod crypto_user agpgart ip_tables
x_tables ext4 crc32c_generic crc16 mbcache jbd2 serio_raw atkbd libps2
crct10dif_pclmul crc32_pclmul
[    4.697386]  crc32c_intel ghash_clmulni_intel aesni_intel crypto_simd cryptd
glue_helper xhci_pci xhci_hcd ccp rng_core i8042 serio
[    4.697398] CPU: 10 PID: 398 Comm: systemd-udevd Not tainted
5.9.0-rc4-1-git-00038-g581cb3a26baf #1
[    4.697400] Hardware name: Micro-Star International Co., Ltd. Bravo 17
A4DDR/MS-17FK, BIOS E17FKAMS.116 07/10/2020
[    4.697608] RIP: 0010:rn_clk_mgr_construct+0x142/0x3f0 [amdgpu]
[    4.697613] Code: 00 00 00 41 8b 8c c4 80 00 00 00 41 89 c1 89 c7 85 c9 74
10 41 8b 94 c4 84 00 00 00 85 d2 0f 85 aa 01 00 00 48 83 e8 01 73 d9 <0f> 0b 83
7b 20 01 74 0c 81 bd e8 00 00 00 ff 14 37 00 7f 27 48 8b
[    4.697615] RSP: 0018:ffffa92c4286b6c0 EFLAGS: 00010297
[    4.697617] RAX: ffffffffffffffff RBX: ffff973a7e874180 RCX:
0000000000000000
[    4.697619] RDX: ffff973a92ac1e80 RSI: ffffa92c4286b6e8 RDI:
0000000000000000
[    4.697620] RBP: ffff973a98469e00 R08: 0000000000000000 R09:
0000000000000000
[    4.697622] R10: 7fc9117fffffffff R11: ffff973a7e88f400 R12:
ffffa92c4286b6e8
[    4.697623] R13: ffff973a7e874e40 R14: ffff973a8a190000 R15:
ffff973a7e874180
[    4.697625] FS:  00007f705a9e9440(0000) GS:ffff973a9f680000(0000)
knlGS:0000000000000000
[    4.697627] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.697628] CR2: 000055de9eb7a774 CR3: 0000000419700000 CR4:
0000000000350ee0
[    4.697630] Call Trace:
[    4.697842]  dc_clk_mgr_create+0x172/0x1b0 [amdgpu]
[    4.698042]  dc_create+0x24a/0x7a0 [amdgpu]
[    4.698050]  ? kmem_cache_alloc_trace+0x106/0x240
[    4.698255]  amdgpu_dm_init.isra.0+0x17f/0x1e0 [amdgpu]
[    4.698460]  dm_hw_init+0xe/0x20 [amdgpu]
[    4.698666]  amdgpu_device_init.cold+0x171a/0x19d8 [amdgpu]
[    4.698827]  amdgpu_driver_load_kms+0x5c/0x230 [amdgpu]
[    4.698984]  amdgpu_pci_probe+0xf4/0x180 [amdgpu]
[    4.698991]  local_pci_probe+0x42/0x80
[    4.698995]  ? pci_match_device+0xd7/0x100
[    4.698998]  pci_device_probe+0xfa/0x1b0
[    4.699002]  really_probe+0x205/0x460
[    4.699005]  driver_probe_device+0xe1/0x150
[    4.699008]  device_driver_attach+0xa1/0xb0
[    4.699011]  __driver_attach+0x8a/0x150
[    4.699012]  ? device_driver_attach+0xb0/0xb0
[    4.699014]  ? device_driver_attach+0xb0/0xb0
[    4.699017]  bus_for_each_dev+0x89/0xd0
[    4.699021]  bus_add_driver+0x12b/0x1e0
[    4.699024]  driver_register+0x8b/0xe0
[    4.699026]  ? 0xffffffffc0fb6000
[    4.699030]  do_one_initcall+0x59/0x234
[    4.699036]  do_init_module+0x5c/0x260
[    4.699039]  load_module+0x21a7/0x2450
[    4.699046]  __do_sys_init_module+0x12d/0x180
[    4.699053]  do_syscall_64+0x33/0x40
[    4.699057]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    4.699059] RIP: 0033:0x7f705b79ae4e
[    4.699063] Code: 48 8b 0d 25 10 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f2 0f 0c 00 f7 d8 64 89 01 48
[    4.699064] RSP: 002b:00007ffee9ca2528 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[    4.699067] RAX: ffffffffffffffda RBX: 00005624b5c38250 RCX:
00007f705b79ae4e
[    4.699068] RDX: 00005624b5c38640 RSI: 0000000000a5a2a1 RDI:
00005624b65430e0
[    4.699069] RBP: 00005624b65430e0 R08: ffffffffffffffe0 R09:
00007ffee9ca0671
[    4.699070] R10: 00005624b5a34010 R11: 0000000000000246 R12:
00005624b5c38640
[    4.699071] R13: 0000000000000008 R14: 00005624b5c2df00 R15:
00005624b5c38250
[    4.699076] ---[ end trace 3e1ef6f5f1a6a9c8 ]---
[    4.699158] [drm] Display Core initialized with v3.2.95!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
